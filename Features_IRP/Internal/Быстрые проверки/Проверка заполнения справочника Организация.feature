﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: Проверка заполнения справочника Организация

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения справочника Организация
		И я закрываю все окна клиентского приложения
	* Открытие элемента справочника Организация
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
	* Заполнения формы
		И в поле с именем 'Description_en' я ввожу текст 'Тестовый контрагент'
		И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
		И я нажимаю на кнопку с именем 'FormWrite'
	* Проверка заполнения
		Тогда элемент формы с именем "Type" стал равен 'Организация'
		Тогда элемент формы с именем "Description_en" стал равен "Тестовый контрагент"

		И я нажимаю на кнопку с именем 'FormWriteAndClose'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'        |
			| 'Тестовый контрагент' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Type" стал равен 'Организация'
		Тогда элемент формы с именем "Description_en" стал равен "Тестовый контрагент"

Сценарий: Проверка расположения полей справочника Организация
	* Открытие элемента справочника Организация
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		@Screenshot
		Тогда открылось окно 'Организация (создание)'

		И я закрываю все окна клиентского приложения