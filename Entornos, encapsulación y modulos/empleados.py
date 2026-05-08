
class Employee:
    def __init__(self, name, salary):
        self._name = name
        self.__salary = salary

    @property
    def salary(self):
        return self.__salary

    @salary.setter
    def salary(self, amount):
        if amount < 0:
            print("❌ Error: El salario no puede ser negativo.")
        else:
            print(f"✅ Salario actualizado a {amount}")
            self.__salary = amount

    @staticmethod
    def calculate_tax(amount):
        return amount * 0.15
