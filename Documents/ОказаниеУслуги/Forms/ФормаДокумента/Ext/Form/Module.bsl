﻿
&НаКлиенте
Процедура ПереченьНоменклатурыКоличествоПриИзменении(Элемент)	
СтрокаТабличнойЧасти = Элементы.ПереченьНоменклатуры.ТекущиеДанные;
РаботаСДокументами.РассчитатьСумму(СтрокаТабличнойЧасти);

КонецПроцедуры


&НаКлиенте
Процедура ПереченьНоменклатурыЦенаПриИзменении(Элемент)	
СтрокаТабличнойЧасти = Элементы.ПереченьНоменклатуры.ТекущиеДанные;
РаботаСДокументами.РассчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры


&НаКлиенте
Процедура ПереченьНоменклатурыНоменклатураПриИзменении(Элемент)
	СтрокаТабличнойЧасти=Элементы.ПереченьНоменклатуры.ТекущиеДанные;
	СтрокаТабличнойЧасти.Цена=РаботаСоСправочниками.РозничнаяЦена(
	Объект.Дата,СтрокаТабличнойЧасти.Номенклатура);
	РаботаСДокументами.РассчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры
  