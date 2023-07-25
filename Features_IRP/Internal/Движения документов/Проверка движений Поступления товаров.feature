﻿#language: ru

@tree
@ДвиженияДокументов

Функционал: проверка движения документа Поступление товаров

Как Тестировщик я хочу
проверить движения документа Поступления товаров
чтобы убедиться что документ делает движения по нужным регистрам

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 подготовительный сценарий (движения документа Поступления товаров)
	Когда экспорт основных данных
	Когда загрузка документа Поступления доваров и услуг
	
	//документ после загрузки нужно провести
	//Вариант 1
//	Дано Я открываю навигационную ссылку "e1cib/data/Document.PurchaseInvoice?ref=8f0800155d1b07ba11ee2a9ffa44d7c3"
//	Тогда в таблице "List" я выделяю все строки
//	И в таблице "List" я нажимаю на кнопку с именем "ListContextMenuPost"
//	Тогда не появилось окно предупреждения системы
	//Вариант 2
	И я выполняю код встроенного языка на сервере
//	"""bsl
//		Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
//	"""
	//или так
		|'Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	
Сценарий: _0502 проверка движений документа Поступления товаров по регистру R1001 Закупки
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	Тогда открылось окно 'Движения документа'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку с именем 'GenerateReport'
	Тогда табличный документ "ResultTable" равен:
		| 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
		| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
		| ''                                                         | '25.07.2023 11:02:09' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Услуга'                  | '4e9910de-b927-407d-9943-be76eb3f9fa2' | 'Да'                |
		| ''                                                         | '25.07.2023 11:02:09' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Услуга'                  | '4e9910de-b927-407d-9943-be76eb3f9fa2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Услуга'                  | '4e9910de-b927-407d-9943-be76eb3f9fa2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Услуга'                  | '4e9910de-b927-407d-9943-be76eb3f9fa2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Услуга'                  | '4e9910de-b927-407d-9943-be76eb3f9fa2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Товар без характеристик' | '66fe0c31-ac8f-4c6f-9b56-acfe9aaeb4e2' | 'Да'                |
		| ''                                                         | '25.07.2023 11:02:09' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Товар без характеристик' | '66fe0c31-ac8f-4c6f-9b56-acfe9aaeb4e2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Товар без характеристик' | '66fe0c31-ac8f-4c6f-9b56-acfe9aaeb4e2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Товар без характеристик' | '66fe0c31-ac8f-4c6f-9b56-acfe9aaeb4e2' | 'Нет'               |
		| ''                                                         | '25.07.2023 11:02:09' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | 'Товар без характеристик' | '66fe0c31-ac8f-4c6f-9b56-acfe9aaeb4e2' | 'Нет'               |
	И я закрываю все окна клиентского приложения	
		
Сценарий: _0503 проверка движений документа Поступления товаров по регистру R1021 Взаиморасчеты с поставщиками
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	Тогда открылось окно 'Движения документа'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1021 Взаиморасчеты с поставщиками'
	И я нажимаю на кнопку с именем 'GenerateReport'
	Тогда табличный документ "ResultTable" содержит строки по шаблону:
		| 'Поступление товаров и услуг 1 001 от 25.07.2023 11:02:09' | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Движения документа по регистрам'                          | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Регистр  "R1021 Взаиморасчеты с поставщиками"'            | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| ''                                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'             | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | 'Attributes'        | ''                             |
		| ''                                                         | ''            | ''                    | 'Сумма'     | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Контрагент'  | 'Партнер'     | 'Соглашение'                 | 'Документ основание' | 'Отложенный расчет' | 'Закрытие авансов поставщиков' |
		| ''                                                         | 'Приход'      | '*'                   | ''          | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Да'                | ''                             |
		| ''                                                         | 'Приход'      | '25.07.2023 11:02:09' | '343,6'     | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '25.07.2023 11:02:09' | '400'       | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '25.07.2023 11:02:09' | '400'       | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '25.07.2023 11:02:09' | '400'       | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	И я закрываю все окна клиентского приложения
	
	