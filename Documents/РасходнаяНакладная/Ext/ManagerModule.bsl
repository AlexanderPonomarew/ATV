﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.РасходнаяНакладная.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	РасходнаяНакладная.Дата,
	|	РасходнаяНакладная.Клиент,
	|	РасходнаяНакладная.МаркаИМодель,
	|	РасходнаяНакладная.Номер,
	|	РасходнаяНакладная.Сотрудник,
	|	РасходнаяНакладная.СуммаПоДокументу,
	|	РасходнаяНакладная.СписокНоменклатуры.(
	|		НомерСтроки,
	|		Наименование,
	|		Количество,
	|		Цена,
	|		Сумма
	|	)
	|ИЗ
	|	Документ.РасходнаяНакладная КАК РасходнаяНакладная
	|ГДЕ
	|	РасходнаяНакладная.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьСписокНоменклатурыШапка = Макет.ПолучитьОбласть("СписокНоменклатурыШапка");
	ОбластьСписокНоменклатуры = Макет.ПолучитьОбласть("СписокНоменклатуры"); 
	ОбластьРеквизиты=Макет.ПолучитьОбласть("Реквизиты");
	ОбластьРеквизиты.Параметры.организация= Константы.НазваниеОрганизации.Получить();
	     ОбластьРеквизиты.Параметры.адрес= Константы.Адрес.Получить();
		 ОбластьРеквизиты.Параметры.инн= Константы.ИНН.Получить();
		        ОбластьРеквизиты.Параметры.тел= Константы.НомерТелефона.Получить(); 
				 ОбластьРеквизиты.Параметры.email= Константы.EMail.Получить(); 

		 ТабДок.Вывести(ОбластьРеквизиты);

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьСписокНоменклатурыШапка);
		ВыборкаСписокНоменклатуры = Выборка.СписокНоменклатуры.Выбрать();
		Пока ВыборкаСписокНоменклатуры.Следующий() Цикл
			ОбластьСписокНоменклатуры.Параметры.Заполнить(ВыборкаСписокНоменклатуры);
			ТабДок.Вывести(ОбластьСписокНоменклатуры, ВыборкаСписокНоменклатуры.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
