﻿
&НаСервереБезКонтекста
Процедура ВыполнитьОбменНаСервере() Экспорт
ВыборкаУзлов = ПланыОбмена.Филиалы.Выбрать();
Пока ВыборкаУзлов.Следующий() Цикл

// Произвести обмен данными со всеми узлами, кроме текущего (ЭтотУзел).
Если ВыборкаУзлов.Ссылка <> ПланыОбмена.Филиалы.ЭтотУзел() Тогда
УзелОбъект = ВыборкаУзлов.ПолучитьОбъект();
// Получить сообщение.
УзелОбъект.ПрочитатьСообщениеСИзменениями();
// Сформировать сообщение.
УзелОбъект.ЗаписатьСообщениеСИзменениями();
КонецЕсли;
КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьОбмен(Команда)
	ВыполнитьОбменНаСервере();
КонецПроцедуры
