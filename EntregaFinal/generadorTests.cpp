#include <iostream>
#include <fstream>
#include <stdlib.h>     /* srand, rand */
#include <string>
#include <iostream>
#include <vector>
#include <sstream>

using namespace std;

struct test{
	string nombre;
	string tipo;
};

struct dia{
	string numero;
};

void printTests(){
	cout << "Please indicate the number of tests that you would like to create:";
}
void printOptions(){
	cout << "El test que generamos sobre qué extensión queremos que sea?" << endl;
	cout << "0 - Básico" << endl;
	cout << "1 - Extensión 1" << endl;
	cout << "2 - Extensión 2" << endl;
	cout << "3 - Extensión 3" << endl;
	cout << "4 - Extensión 4" << endl;
}

string createNameDocument(int i){
	stringstream sstm;
	sstm << "problem" << i;
	string result =sstm.str();
	return result+".t.pddl";
}

int main(){

	/* initialize random seed: */
  	srand (time(NULL));
  	printTests();
	int number_tests, version;
	cin >> number_tests;
	printOptions();
	cin >> version;

	for (int i = 0; i < number_tests; ++i){
		createNameDocument(i);
		ofstream outputFile(createNameDocument(i).c_str());	
		outputFile << "(define (problem visual-content-problem)" << endl;
		outputFile << "\t(:domain visual-content)" << endl;
		outputFile << "\t(:objects" << endl;
		/* generate secret number between 1 and 100 */
  		int random_number = rand() % 100 +1;
  		vector<string> v(random_number);
		//Objects

		outputFile << "\t\t";	
		for (int j = 0; j < random_number; ++j){
			stringstream sstm;
			sstm << "content" << j;
			string result = sstm.str();
			outputFile << result << " ";
			v[j] = result;
		}
		//random_number = rand() % random_number +random_number; //así tenemos algo del rango con los contenidos
		vector<string> v2(random_number);
		outputFile <<"- contenido" << endl;


		outputFile << "\t\t";	
		for (int j = 0; j < random_number; ++j){
			stringstream sstm;
			sstm << "dia" << j;
			string result = sstm.str();
			outputFile << result << " ";
			v2[j] = result;
		}
		outputFile <<"- dia\n\t)" << endl;

		//Tot el init:
		int random_option;
		int random_pick;
		outputFile << "\t(:init" << endl;
		//related with days:
		if (version > 1){
			for (int j = 0; j < v2.size(); ++j){
				stringstream sstm;
				sstm << v2[j]+ " ) " << j;
				string result = sstm.str();
				outputFile << "\t\t(= (numdia "+result +")";
				if (version == 3) outputFile << " (= (numAsig "+v2[j]+ ") 0)";
				if (version == 4) outputFile << " (= (minutosOcupados "+v2[j]+ ") 0)";
				outputFile << endl;
				
			}
		}

		if (version > 1){
			for (int j = 0; j < v.size(); ++j){
				outputFile << "\t\t(= (diaAsig "+v[j]+") 0)";
				// La duración de los contenidos será de 20 a 100 minutos
				if (version == 4) outputFile << " (= (minutos "+v[j]+ ") " << (rand()%(100-20)+20) << ")";
				outputFile << endl;
			}
		}

		//predictes content:
		for (int j = 0; j < v.size(); ++j){
			random_option = rand() % 4 + 1;
			if (random_option == 1){ //predecesor
				random_pick = rand()%v.size();
				while (j == random_pick){
					random_pick = rand()%v.size();
				}
				outputFile << "\t\t(predecesor "+v[random_pick]+' '+v[j]+")" << endl;
			}
			else if (random_option == 2){ //Visto
				outputFile << "\t\t(visto "+v[j]+")" << endl;
			}
			else if (random_option == 3){//quiereVer
				outputFile <<"\t\t(quiereVer "+v[j]+")"<< endl;

			}
			else if (random_option == 4 and version > 1){//paralelo
				random_pick = rand()%v.size();
				while (j == random_pick){
					random_pick = rand()%v.size();
				}
				outputFile << "\t\t(paralelo "+v[j]+ ' ' +v[random_pick]+")" << endl;
			}
		}
		outputFile << "\t)" << endl;

		//goal: 
		outputFile <<"\t(:goal\n\t\t(forall (?content - contenido)";
		outputFile <<"\n\t\t\t(or\n\t\t\t\t(not (quiereVer ?content))\n\t\t\t\t(and";
		outputFile <<"\n\t\t\t\t\t(quiereVer ?content)\n\t\t\t\t\t(yaPlanificado ?content)";
		outputFile <<"\n\t\t\t\t)";
		outputFile <<"\n\t\t\t)";
		outputFile <<"\n\t\t)";
		outputFile <<"\n\t)";
		outputFile <<"\n)" << endl;
	}
	cout << "Generado(s) " << number_tests << " archivo(s)." << endl;
}