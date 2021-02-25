import Foundation

class Wypozyczenia{
  var imie: String
  var nazwisko: String
  var dataPoczatkowa: Date
  var dataKoncowa: Date
  var czasWypozyczenia: Double
  var kosztWypozyczenia: Double
  var kosztPakietu: Double

  init(imie: String, nazwisko: String, dataPoczatkowa: Date, dataKoncowa: Date, kosztPakietu: Double)
  {
    self.imie = imie;
    self.nazwisko = nazwisko
    self.dataPoczatkowa = dataPoczatkowa
    self.dataKoncowa = dataKoncowa
    self.czasWypozyczenia = dataKoncowa.timeIntervalSince(dataPoczatkowa)/86400
    self.kosztPakietu = kosztPakietu
    self.kosztWypozyczenia = kosztPakietu * czasWypozyczenia
  }
}

func utworzDate(year: Int, month: Int, day: Int) -> Date
{
var dateComponents = DateComponents()
dateComponents.year = year
dateComponents.month = month
dateComponents.day = day
let userCalendar = Calendar(identifier: .gregorian)
let _dataWypozyczenia: Date! = userCalendar.date(from: dateComponents)
return _dataWypozyczenia
}

func utworzWypozyczenie() -> Wypozyczenia
{

print("Wprowadź imie")
let _imie: String! = readLine()

print("Wprowadź nazwisko")
let _nazwisko: String! = readLine()

print("Wprowadź rok wypożyczenia")
var _year: String! = readLine()
var _yearI: Int! = Int(_year)

print("Wprowadź miesiąc wypożyczenia")
var _month: String! = readLine()
var _monthI: Int! = Int(_month)

print("Wprowadź dzień wypożyczenia")
var _day: String! = readLine()
var _dayI: Int! = Int(_day)

let _dataWypozyczenia = utworzDate(year: _yearI, month: _monthI, day: _dayI)

print("Wprowadź rok oddania")
_year = readLine()
_yearI = Int(_year)

print("Wprowadź miesiąc oddania")
_month = readLine()
_monthI = Int(_month)

print("Wprowadź dzień oddania")
_day = readLine()
_dayI = Int(_day)

let _dataOddania = utworzDate(year: _yearI, month: _monthI, day: _dayI)

print("Wprowadź cenę za dzień")
let _cena: String! = readLine();
let _cenaDouble: Double! = Double(_cena)

return Wypozyczenia(imie: _imie, nazwisko: _nazwisko, dataPoczatkowa: _dataWypozyczenia, dataKoncowa: _dataOddania, kosztPakietu: _cenaDouble);
}

func printWypozyczenie(wypozyczenie: Wypozyczenia)
{
print("Imie: \(wypozyczenie.imie)")
print("Nazwisko: \(wypozyczenie.nazwisko)")
print("Data Wypozyczenia: \(wypozyczenie.dataPoczatkowa)")
print("Data Zwrotu: \(wypozyczenie.dataKoncowa)")
print("Czas Wypozyczenia: \(wypozyczenie.czasWypozyczenia)")
print("Koszt Dzienny: \(wypozyczenie.kosztPakietu)")
print("Koszt Całości: \(wypozyczenie.kosztWypozyczenia)")
}

func printMenu()
{
print("Menu:")
print("1. Dodaj nowe wypozyczenie")
print("2. Wyświetl wypozyczenia")
print("3. Usuń wypozyczenia")
print("0. Wyjście")
}

func printWszystkieWypozyczenia()
{
  var index = 0
  for wypo in wypozyczeniaArray
  {
    print("Index: \(index)")
    printWypozyczenie(wypozyczenie: wypozyczeniaArray[index])
    index += 1
  }
}

var wypozyczeniaArray = [Wypozyczenia]()

repeat{
  printMenu()
  var menuControll = readLine()
  switch menuControll
  {
    case "1":
    wypozyczeniaArray.append(utworzWypozyczenie())
    printWypozyczenie(wypozyczenie: wypozyczeniaArray[wypozyczeniaArray.count - 1])
    case "2":
    printWszystkieWypozyczenia()
    case "3":
    print("Wielkość tablicy \(wypozyczeniaArray.count)")
    print("Który indeks chcesz usunąć?")
    var index: String! = readLine();
    var indexInt: Int! = Int(index)
    printWypozyczenie(wypozyczenie: wypozyczeniaArray[indexInt])
    print("Napewno? 1 - Tak")
    var bool = readLine();
    if(bool == "1")
    {
      wypozyczeniaArray.remove(at: indexInt)
    }
    case "0":
    exit(1)
    default:
    print("Nie ma takiej opcji w menu")
    
  }
}while 1 == 1
