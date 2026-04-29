print(f"Hola, mi nombre es {nombre} y tengo {edad} años.")
# la f al principio para meter las variables y no tener que separar por comas o +

if 100 < var < 300:
# se puede hacer este tipo de condiciones
#if, elif, else 

if (100 < var < 300) and type(var) == int:
#hay operadores and, or
#type(var) == int para comprobar tipos de datos
# var != list    para comprobar que no es un list

guess = int(input("Guess a number between 1 and 10: "))
#input para pedir datos

#while


try: 
	#codigo
except ValueError as e:
	print(f"An error occurred: {e}")


def greet_user(name):
	print(f"Hello, {name}!")
	
#llamar a la funcion
greet_user("Miu")


scores = [40,12,45,85]


import math
import statistics
#esto es que de random entero importamos solo randint
from random import randint
#arriba del todo para importar
math.sqrt(average)


###clases
class Car:
	def __init__(self, make, model, year, odometer_reading=0):
		"""Initialize the car attributes"""
		self.make = make
		self.model = model
		self.year = model
		self.odometer_reading = odometer_reading
	
	def get_descriptive_name(self):
		"""Return a descrptive name of the car"""
		full_name = f"{self.make} {self.model} {self.year} "
		return full_name.title()
		
	def read_odometer(self):
		"""Print the cars mileage"""
		print(f"This car got {self.odometer_reading} miles on it")
		
first_car = Car("Toyota", "corolla", 2019)
first_car = Car("honda", "civic", 2003, 300000)

print(first_car.get_descriptive_name())
print(second_car.get_descriptive_name())
print(first_car.read_odometer())
print(first_car.read_odometer())



###########
listas
##########

students = ["Escolar Luis", "Ludicolo", "Francisco"]

def print_students(student_list):
	for student in student_list:
		print(f"The student {student} is present"
		
print_students(students)


########
diccionarios
########

student_info = {
    "name": "Alice",
    "age": 25,
    "college": "MIT"
}

def print_student_info(student):
    """Print the student's information."""
    print(f"Name: {student['name']}")
    print(f"Age: {student['age']}")
    print(f"College: {student['college']}")


#######
dataframes, pandas
########

import pandas as pd

# Creación de un diccionario con los datos
data = {
    "Name": ["Anna", "Ben", "Clara"],
    "Age": [28, 32, 24],
    "City": ["Madrid", "Barcelona", "Valencia"]
}

# Convertir el diccionario a un DataFrame de pandas
df = pd.DataFrame(data)

print("DataFrame created:")
print(df)


######################


# Acceder a una sola columna
print("Column 'Name':")
print(df["Name"])

# Acceder a múltiples columnas (nota los corchetes dobles [[ ]])
print("\nColumns 'Name' and 'City':")
print(df[["Name", "City"]])

# Filtrar filas usando una condición (edad mayor a 25)
filtered_df = df[df["Age"] > 25]
print("\nFiltered rows (Age > 25):")
print(filtered_df)

#########
csv
#######

# Leer datos desde un archivo CSV (asegúrate de que el archivo existe)
# Ejemplo:
df = pd.read_csv('data.csv')

print("Reading data from a CSV file...")

# Mostrar las primeras 5 filas
df.head() 


#########
seaborn

el dataset iris es un dataset de prueba
#########
import seaborn as sns

# Load the Iris dataset
iris_df = sns.load_dataset('iris')

# Display the first few rows of the dataset (head):
print("First few rows of the dataset (head):")
print(iris_df.head())

# Summary statistics for numeric columns
print("\nSummary statistics (describe):")
print(iris_df.describe())

# Dataset information
print("\nDataset information (info):")
iris_df.info()

##############

############

import pandas as pd

# 1. Dataset de prueba para que el código funcione
employee_data = {
    "Name": ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Heidi"],
    "Department": ["HR", "HR", "IT", "IT", "Sales", "Sales", "IT", "HR"],
    "Salary": [50000, 60000, 75000, 80000, 45000, 55000, 60000, 52000]
}

employee_df = pd.DataFrame(employee_data)

# Calculate average salary by department
department_avg = employee_df.groupby("Department")["Salary"].mean()
print("Average salary by department:")
print(department_avg)

# Filter employees with a salary above their department's average
employee_df["Above_Avg"] = employee_df.apply(
    lambda row: row["Salary"] > department_avg[row["Department"]], axis=1)
filtered_employees = employee_df[employee_df["Above_Avg"]]
print("\nEmployees with above-average salaries:")
print(filtered_employees)

# Save to CSV
filtered_employees.to_csv("high_salary_employees.csv", index=False)
print("\nFiltered employees saved to 'high_salary_employees.csv'.")


##########
Método	Uso ideal
dropna()	Cuando la cantidad de valores faltantes es pequeña y no relevante.
fillna()	Cuando los valores faltantes tienen un patrón predecible.
interpolate()	Para datos continuos con valores consecutivos.
imputer	Para imputaciones avanzadas con aprendizaje automático.

###########























