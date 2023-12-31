﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: Проверка формы элемента справочника Организации

Как Тестировщик я хочу
проверить доступность вкладок Налоги и Валюты
чтобы убедиться что пользователь не ошибется при вводе данных

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: <описание сценария>
	* Открытие элемента справочника Организации
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
	* Установка галочки "Наша компания" и проверка присутствия на форме вкладок Валют и Налогов
		И я устанавливаю флаг с именем 'OurCompany'
		И элемент формы "Валюты" присутствует на форме
		И элемент формы "Вид налога" присутствует на форме
	* Снятие галочки "Наша компания" и проверка отсутствия на форме вкладок Валют и Налогов
		И я снимаю флаг с именем 'OurCompany'
		И элемент формы "Валюты" существует и невидим на форме
		И элемент формы "Вид налога" существует и невидим на форме