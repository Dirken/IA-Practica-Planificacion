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
	return result+".pddl";
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
		outputFile << "(:domain visual-content)" << endl;
		outputFile << "(:objects" << endl;
		/* generate secret number between 1 and 100 */
  		int random_number = rand() % 100 +1;
  		vector<string> v(random_number);
		//Objects

		for (int j = 0; j < random_number; ++j){
			stringstream sstm;
			sstm << "content" << j;
			string result = sstm.str();
			outputFile << result << " ";
			v[j] = result;
		}
		random_number = rand() % random_number +1; //así tenemos algo del rango con los contenidos
		vector<string> v2(random_number);
		if (version == 0) outputFile <<"- contenido)" << endl;
		//si tenemos que es de las extensiones 1 o superior, tenemos también que tener en cuenta
		//que hay otro parámetro que es el de días.

		else {
			outputFile <<"- contenido" << endl;

			for (int j = 0; j < random_number; ++j){
				stringstream sstm;
				sstm << "dia" << j;
				string result = sstm.str();
				outputFile << result << " ";
				v2[j] = result;
			}
			outputFile <<"- dia)" << endl;
		}


		//Tot el init:
		int random_option;
		int random_pick;
		outputFile << "(:init" << endl;
		//related with days:
		if (version > 1){
			for (int j = 0; j < v2.size(); ++j){
				stringstream sstm;
				sstm << v2[j]+ ")" << j;
				string result = sstm.str();
				outputFile << "(= (numdia"+ result +")" << endl;
				
			}
		}

		for (int j = 0; j < v.size(); ++j){
			outputFile << "(= (diaAsig "+ v[j]+") 0 )" << endl;
		}
		//predictes content:
		for (int j = 0; j < v.size(); ++j){
			random_option = rand() % 4 + 1;
			if (random_option == 1){ //predecesor
				random_pick = rand()%v.size();
				while (j == random_pick){
					random_pick = rand()%v.size();
				}
				outputFile << "(predecesor "+v[random_pick]+' '+v[j]+")" << endl;
			}
			else if (random_option == 2){ //Visto
				outputFile << "(visto "+v[j]+")" << endl;
			}
			else if (random_option == 3){//quiereVer
				outputFile <<"(quiereVer "+v[j]+")"<< endl;

			}
			else if (random_option == 4 and version > 1){//paralelo
				random_pick = rand()%v.size();
				while (j == random_pick){
					random_pick = rand()%v.size();
				}
				outputFile << "(paralelo "+v[j]+ ' ' +v[random_pick]+")" << endl;
			}
		}
		outputFile << ")" << endl;

		//goal: 
		outputFile << "(:goal (forall (?content - contenido) (or (not (quiereVer ?content))" << endl;
		outputFile << "(and (quiereVer ?content)(yaPlanificado ?content)))))" << endl;
	}
		/*for (int j = 0; j < v.size(); ++j){
			if(v[j].tipo == "quiereVer") {
				outputFile << "(yaPlanificado "+v[j]+ ")" << endl;
			}
		}
		outputFile << ")))"<<endl;
		outputFile.close();
	}*/
}