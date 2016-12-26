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
	return result;
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
  		vector<test> v(random_number);
		//Objects

		for (int j = 0; j < random_number; ++j){
			stringstream sstm;
			sstm << "content" << j;
			string result =sstm.str();
			outputFile << result << " ";
			v[j].nombre = result;
		}
		outputFile <<"- visual-content)" << endl;
		
		//Tot el init:
		int random_option;
		int random_pick;
		outputFile << "(:init" << endl;
		for (int j = 0; j < v.size(); ++j){
			random_option = rand() % 4 + 1;
			if (random_option == 1){ //predecesor
				random_pick = rand()%v.size();
				while (j == random_pick){
					random_pick = rand()%v.size();
				}
				outputFile << "(predecesor "+v[random_pick].nombre+' '+v[j].nombre+")" << endl;
				v[j].tipo = "predecesor";
			}
			else if (random_option == 2){ //Visto
				outputFile << "(visto "+v[j].nombre+")" << endl;
				v[j].tipo = "visto";
			}
			else if (random_option == 3){//quiereVer
				outputFile <<"(quiereVer "+v[j].nombre+")"<< endl;
				v[j].tipo = "quiereVer";
			}
			else{//paralelo
			}
		}
		outputFile << ")" << endl;

		//goal: 
		for (int j = 0; j < v.size(); ++j){
			if(v[j].tipo == "quiereVer") {
				outputFile << "(yaPlanificado "+v[j].nombre+ ")" << endl;
			}
		}
		outputFile << ")))"<<endl;
		outputFile.close();
	}
}