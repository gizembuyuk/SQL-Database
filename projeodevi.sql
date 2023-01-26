create database projeodevi
use projeodevi


create table kategoriler
(
kategori_id int primary key,
kategori_adi nvarchar(50)
)

create table altkategori
(
altkat_id int primary key,
kategori_id int foreign key references kategoriler(kategori_id),
altkat_adi nvarchar(30),
)

create table markalar
(
marka_id int primary key,
marka_adi nvarchar(50)
)
create table renkler
(
renk_id int primary key,
renk_adi nvarchar(40)
)
create table urunozellikler
(
urunozellik_id int primary key,
kumas_tipi nvarchar(max)
)
create table urunler
(
urun_id int primary key,
urun_adi nvarchar(50),
altkat_id int foreign key references altkategori(altkat_id),
marka_id int foreign key references markalar(marka_id),
cinsiyet char(1),
urunozellik_id int foreign key references urunozellikler(urunozellik_id),
renk_id int foreign key references renkler(renk_id),
beden char(4)
)
create table sehirler
(
sehir_id int primary key,
sehir_adi nvarchar(30)
)
create table ilceler
(
ilce_id int primary key,
ilce_adi nvarchar(50),
sehir_id int foreign key references sehirler (sehir_id)
)
create table uyeler
(
uye_id int primary key,
uye_adi nvarchar(30),
uye_soyadi nvarchar(50),
tc_no nvarchar(11),
sehir_id int foreign key references sehirler(sehir_id),
ilce_id int foreign key references ilceler(ilce_id),
tel char(11)
)

create table kargo
(
kargo_id int primary key,
kargofir_adi nvarchar(max)
)

create table siparisdurum
(
siparisdurum_id int primary key ,
durum nvarchar(70)
)

create table siparisler
(
siparis_id int primary key,
urun_id int foreign key references urunler(urun_id),
siparisdurum_id int foreign key references siparisdurum(siparisdurum_id),
siparis_tarihi date,
kargo_id int foreign key references kargo(kargo_id),
kargo_no int,
ongorulme_tarihi date,
teslim_tarihi date,
uye_id int foreign key references uyeler(uye_id)
)

create table fatura
(
siparis_id int foreign key references siparisler(siparis_id),
uye_id int foreign key references uyeler(uye_id)
)
create table sepet
(
sepet_id int primary key,
siparis_id int foreign key references siparisler(siparis_id)

)

create table urunfiyat
(
fiyat_id int primary key,
alýsfiyat_id money,
urun_id int foreign key references urunler(urun_id)
)


/*FONKSÝYONLAR*/
/*1*/create function fn_musterisay()
returns int
as
begin
return(select count(sehir_id) from uyeler)
end

/*2*/create function fn_topsiparis()
returns int 
as
begin
return(select count(siparis_id) from siparisler)
end


insert into  kategoriler values ('1','Giyim')
insert into  kategoriler values ('2','Ayakkabý')
insert into  kategoriler values ('3','Aksesuar')
insert into  kategoriler values ('4','Kozmetik')

insert into  altkategori values ('1','1','Elbise')
insert into  altkategori values ('2','1','Tiþört')
insert into  altkategori values ('3','1','Pantolon')
insert into  altkategori values ('4','1','Mont')

insert into  altkategori values ('5','2','Topuklu Ayakkabý')
insert into  altkategori values ('6','2','Spor Ayakkabý')

insert into  altkategori values ('7','3','Kolye')
insert into  altkategori values ('8','3','Küpe')
insert into  altkategori values ('9','3','Yüzük')

insert into  altkategori values ('10','4','Parfüm')
insert into  altkategori values ('11','4','Cilt Bakým')
insert into  altkategori values ('12','4','Vücut Bakým')

insert into  altkategori values ('13','1','Etek')
insert into  altkategori values ('14','2','Bot')
insert into  altkategori values ('15','2','Çizme')
insert into  altkategori values ('16','3','Gözlük')
insert into  altkategori values ('17','3','Bileklik')
insert into  altkategori values ('18','4','Ruj')
insert into  altkategori values ('19','4','Maskara')
insert into  altkategori values ('20','4','Eyeliner')



insert into  markalar values ('1','Zara')
insert into  markalar values ('2','Mango')
insert into  markalar values ('3','Nike')
insert into  markalar values ('4','Adidas')
insert into  markalar values ('5','Gucci')
insert into  markalar values ('6','NYX')
insert into  markalar values ('7','Sephora')
insert into  markalar values ('8','Kylie Beauty')
insert into  markalar values ('9','Puma')
insert into  markalar values ('10','Hummel')
insert into  markalar values ('11','R.E.M')
insert into  markalar values ('12','Stradivarious')
insert into  markalar values ('13','H&M')
insert into  markalar values ('14','Derimod')
insert into  markalar values ('15','Flo')
insert into  markalar values ('16','Flormar')
insert into  markalar values ('17','Benri')
insert into  markalar values ('18','Gratis')
insert into  markalar values ('19','Watsons')
insert into  markalar values ('20','Koton')


insert into  renkler values ('1','Siyah')
insert into  renkler values ('2','Beyaz')
insert into  renkler values ('3','Mavi')
insert into  renkler values ('4','Yeþil')
insert into  renkler values ('5','Sarý')
insert into  renkler values ('6','Turuncu')
insert into  renkler values ('7','Pembe')
insert into  renkler values ('8','Gri')
insert into  renkler values ('9','Lacivert')
insert into  renkler values ('10','Kýrmýzý')
insert into  renkler values ('11','Kahverengi')
insert into  renkler values ('12','Krem')
insert into  renkler values ('13','Yavru Aðzý')
insert into  renkler values ('14','Turkuaz')
insert into  renkler values ('15','Mor')
insert into  renkler values ('16','Altýn Rengi')
insert into  renkler values ('17','Bordo')
insert into  renkler values ('18','Bebek Mavisi')
insert into  renkler values ('19','Fildiþi')
insert into  renkler values ('20','Leylak')


insert into urunozellikler values ('1','Saten')
insert into urunozellikler values ('2','Kadife')
insert into urunozellikler values ('3','Viskon')
insert into urunozellikler values ('4','Deri')
insert into urunozellikler values ('5','Pamuklu')
insert into urunozellikler values ('6','Süet')
insert into urunozellikler values ('7','Yok')
insert into urunozellikler values ('8','Kot')
insert into urunozellikler values ('9','Kanvas')
insert into urunozellikler values ('10','Krep')
insert into urunozellikler values ('11','Atlas')
insert into urunozellikler values ('12','Þifon')
insert into urunozellikler values ('13','Poplin')
insert into urunozellikler values ('14','Alpaka')
insert into urunozellikler values ('15','Astar')
insert into urunozellikler values ('16','Tül')
insert into urunozellikler values ('17','Basma')
insert into urunozellikler values ('18','Bez')
insert into urunozellikler values ('19','Dokuma')
insert into urunozellikler values ('20','File')






insert into urunler values ('1','Çiçekli','1','1','K','1','7','M')
insert into urunler values ('2','Çizgili','3','2','E','2','1','L')
insert into urunler values ('3','Ýnce','5','5','K','6','10','36')
insert into urunler values ('4','Uzun Bilekli','6','3','E','4','8','42')
insert into urunler values ('5','Halka','8','2','K','2','5','S')
insert into urunler values ('6','Zincir','7','4','E','7','8','M')
insert into urunler values ('7','Vücut Losyonu','12','5','K','7','2','S')
insert into urunler values ('8','Maske','11','2','K','7','4','M')
insert into urunler values ('9','Odunsu','10','4','E','7','1','L')
insert into urunler values ('10','Elmas','9','5','E','7','8','L')
insert into urunler values ('11','Çiçekli','13','20','K','17','13','M')
insert into urunler values ('12','Þiþme','4','13','E','13','12','XL')
insert into urunler values ('13','Lipgloss','18','7','K','7','19','')
insert into urunler values ('14','Kemik','16','12','E','7','11','')
insert into urunler values ('15','Kalem','20','8','K','7','17','')
insert into urunler values ('16','Altýn','17','5','E','7','16','')
insert into urunler values ('17','Suya Dayanýklý','19','18','K','7','15','')
insert into urunler values ('18','Oversize','2','10','E','10','18','S')
insert into urunler values ('19','Ýspanyol Paça','3','14','K','8','14','L')
insert into urunler values ('20','Bilekte','14','15','E','4','20','45')


insert into sehirler values('01','Adana')
insert into sehirler values('02','Adýyaman')
insert into sehirler values('03','Afyon')
insert into sehirler values('04','Aðrý')
insert into sehirler values('05','Amasya')
insert into sehirler values('06','Ankara')
insert into sehirler values('07','Antalya')
insert into sehirler values('08','Artvin')
insert into sehirler values('09','Aydýn')
insert into sehirler values('10','Balýkesir')
insert into sehirler values('11','Bilecik')
insert into sehirler values('12','Bingöl')
insert into sehirler values('13','Bitlis')
insert into sehirler values('14','Bolu')
insert into sehirler values('15','Burdur')
insert into sehirler values('16','Bursa')
insert into sehirler values('17','Çanakkale')
insert into sehirler values('18','Çankýrý')
insert into sehirler values('19','Çorum')
insert into sehirler values('20','Denizli')

insert into ilceler values('1','Aladað','1')
insert into ilceler values('2','Ceyhan','1')
insert into ilceler values('3','Çukurova','1')

insert into ilceler values('4','Besni','2')
insert into ilceler values('5','Çelikhan','2')

insert into ilceler values('6','Çay','3')
insert into ilceler values('7','Çobanlar','3')

insert into ilceler values('8','Merkez','4')
insert into ilceler values('9','Patnos','4')

insert into ilceler values('10','Göynücek','5')
insert into ilceler values('11','Gümüþhacýköy','5')

insert into ilceler values('12','Akkurt','6')
insert into ilceler values('13','Altýndað','6')

insert into ilceler values('14','Akseki','7')
insert into ilceler values('15','Aksu','7')

insert into ilceler values('16','Hopa','8')
insert into ilceler values('17','Merkez','8')

insert into ilceler values('18','Didim','9')
insert into ilceler values('19','Efeler','9')

insert into ilceler values('20','Ayvalýk','10')
insert into ilceler values('21','Göçen','10')

insert into ilceler values('22','Gölpazarý','11')

insert into ilceler values('23','Adaklý','12')

insert into ilceler values('24','Mergen','13')

insert into ilceler values('25','Aðlasun','14')

insert into ilceler values('26','Nilüfer','15')

insert into ilceler values('27','Biga','16')

insert into ilceler values('28','Çerkeþ','17')

insert into ilceler values('29','Laçin','18')

insert into ilceler values('30','Acýpayam','19')

insert into ilceler values('31','Ergani','20')




insert into uyeler values('1','Sena','Türkmen','11111111111','1','2','05555555555')
insert into uyeler values('2','Merve','Yeðencik','21111111111','3','6','05555555522')
insert into uyeler values('3','Gizem','Büyük','31111111111','10','21','05555555533')
insert into uyeler values('4','Sibel','Akar','41111111111','5','10','05555555544')
insert into uyeler values('5','Ali','Türk','51111111111','9','18','05555555577')
insert into uyeler values('6','Efe','Çakýr','61111111111','10','20','05555555511')
insert into uyeler values('7','Can','Tekin','71111111111','4','8','05555555559')
insert into uyeler values('8','Ahmet','Altur','81111111111','20','31','05555555578')
insert into uyeler values('9','Namýk','Altur','91111111111','18','29','05555555557')
insert into uyeler values('10','Selen','Çiçek','10111111111','14','25','05555555591')
insert into uyeler values('11','Gamze','Altýn','65111111111','9','19','05555555695')
insert into uyeler values('12','Gözde','Yeðen','36111111111','16','27','05555555694')
insert into uyeler values('13','Cansu','Þentürk','64111111111','12','23','05553545578')
insert into uyeler values('14','Ayþe','Can','81125111111','13','24','05566555578')
insert into uyeler values('15','Canan','Al','81113561111','3','7','05555556958')
insert into uyeler values('16','Talha','Çetin','69311111111','18','29','05555555146')
insert into uyeler values('17','Çiçek','Kýrmýzý','81125611111','19','30','05555555500')
insert into uyeler values('18','Kübra','Baltaþ','81111111456','6','12','05555555502')
insert into uyeler values('19','Mehmet','Þentürk','34111111111','20','31','05555550078')
insert into uyeler values('20','Gülþen','Nar','99911111111','9','19','05555551241')



insert into kargo values ('1','Aras')
insert into kargo values ('2','MNG')
insert into kargo values ('3','Yurtiçi')
insert into kargo values ('4','PTT')
insert into kargo values ('5','UPS')
insert into kargo values ('6','Vatan')
insert into kargo values ('7','Ýyi')
insert into kargo values ('8','Git')
insert into kargo values ('9','Hýzlý')
insert into kargo values ('10','Ay')
insert into kargo values ('11','Türk')
insert into kargo values ('12','Prime')
insert into kargo values ('13','Express')
insert into kargo values ('14','Sürat')
insert into kargo values ('15','Getir')
insert into kargo values ('16','Filo')
insert into kargo values ('17','TNT')
insert into kargo values ('18','DHL')
insert into kargo values ('19','Kuehne')
insert into kargo values ('20','Negal')

insert into siparisdurum values('1','Hazýrlanýyor')
insert into siparisdurum values('2','Kargoda')
insert into siparisdurum values('3','Teslim Edildi')

insert into siparisler values('1','1','2','12.01.2021','1','1245','12.03.2021','','1')
insert into siparisler values('2','2','3','11.05.2021','3','2005','','11.08.2021','2')
insert into siparisler values('3','3','1','12.08.2021','5','8254','12.10.2021','','3')
insert into siparisler values('4','4','2','12.08.2021','8','9854','12.20.2021','','4')
insert into siparisler values('5','5','3','10.08.2021','10','6584','','10.14.2021','5')
insert into siparisler values('6','6','2','12.03.2021','17','2644','12.10.2021','','6')
insert into siparisler values('7','7','1','12.02.2021','15','1594','12.11.2021','','7')
insert into siparisler values('8','8','3','09.21.2021','6','1765','','09.30.2021','7')
insert into siparisler values('9','9','2','11.29.2021','12','6864','12.08.2021','','6')
insert into siparisler values('10','10','1','12.07.2021','4','4584','12.09.2021','','5')
insert into siparisler values('11','2','3','11.29.2021','9','6891','','12.08.2021','4')
insert into siparisler values('12','5','2','11.30.2021','7','9764','12.08.2021','','3')
insert into siparisler values('13','6','1','12.05.2021','20','2842','12.09.2021','','2')
insert into siparisler values('14','1','1','12.06.2021','3','9844','12.11.2021','','1')
insert into siparisler values('15','10','2','12.01.2021','12','2644','12.09.2021','','7')
insert into siparisler values('16','20','2','12.01.2021','6','8745','12.09.2021','','18')
insert into siparisler values('17','15','3','11.01.2021','9','2459','','11.08.2021','15')
insert into siparisler values('18','17','1','12.09.2021','15','3254','12.09.2021','','16')
insert into siparisler values('19','12','3','10.27.2021','11','2154','','11.02.2021','13')
insert into siparisler values('20','13','1','12.09.2021','19','9654','01.02.2022','','17')


insert into fatura values('1','1')
insert into fatura values('2','2')
insert into fatura values('3','3')
insert into fatura values('4','4')
insert into fatura values('5','5')
insert into fatura values('6','6')
insert into fatura values('7','7')
insert into fatura values('8','7')
insert into fatura values('9','6')
insert into fatura values('10','5')
insert into fatura values('11','4')
insert into fatura values('12','3')
insert into fatura values('13','2')
insert into fatura values('14','1')
insert into fatura values('15','7')
insert into fatura values('16','18')
insert into fatura values('17','15')
insert into fatura values('18','16')
insert into fatura values('19','13')
insert into fatura values('20','17')


insert into sepet values ('1','15')
insert into sepet values ('2','14')
insert into sepet values ('3','13')
insert into sepet values ('4','12')
insert into sepet values ('5','11')
insert into sepet values ('6','10')
insert into sepet values ('7','9')
insert into sepet values ('8','8')
insert into sepet values ('9','7')
insert into sepet values ('10','6')
insert into sepet values ('11','5')
insert into sepet values ('12','4')
insert into sepet values ('13','3')
insert into sepet values ('14','2')
insert into sepet values ('15','1')
insert into sepet values ('16','16')
insert into sepet values ('17','17')
insert into sepet values ('18','18')
insert into sepet values ('19','19')
insert into sepet values ('20','20')

insert into urunfiyat values ('1',206,'1')
insert into urunfiyat values ('2',302,'2')
insert into urunfiyat values ('3',534,'3')
insert into urunfiyat values ('4',854,'4')
insert into urunfiyat values ('5',785,'5')
insert into urunfiyat values ('6',965,'6')
insert into urunfiyat values ('7',700,'7')
insert into urunfiyat values ('8',655,'8')
insert into urunfiyat values ('9',605,'9')
insert into urunfiyat values ('10',255,'10')
insert into urunfiyat values ('11',294,'11')
insert into urunfiyat values ('12',8610,'12')
insert into urunfiyat values ('13',561,'13')
insert into urunfiyat values ('14',648,'14')
insert into urunfiyat values ('15',1253,'15')
insert into urunfiyat values ('16',2626,'16')
insert into urunfiyat values ('17',4562,'17')
insert into urunfiyat values ('18',3780,'18')
insert into urunfiyat values ('19',452,'19')
insert into urunfiyat values ('20',665,'20')

/*SORGULAR:*/

/*1/ Üyeler tablosunda ad ve soyad bilgisini tek sütunda birleþtirerek A.Soyad þeklinde isimlendirerek ve ad sütununa göre artan listeleyiniz.*/
select concat(uye_adi,' ', uye_soyadi)as[A.Soyad]from uyeler order by uye_adi asc

/*2/sipariþ tablosunda  1. ve 10. günler arasýnda verilen sipariþlerin sipariþ_id artan þekilde sýralayan sorguyu yazýnýz.*/
select siparis_id,urun_id,siparis_tarihi from siparisler where day(siparis_tarihi) between 1 and 10 order by siparis_id asc

/*3/Fiyatý en yüksek olan ürünün  bilgilerini bulmak  için gerekli sorguyu yazýnýz.*/
select top(1)urun_id, alýsfiyat_id from urunfiyat order by alýsfiyat_id desc

/*4/Ürünlerin fiyatlarýný %20 arttýrarak listelemek için gerekli sorguyu yazýnýz.*/
select urun_id, (alýsfiyat_id*1.2) as[Zamlý Fiyat] from urunfiyat 

/*5/Ortalama ürün fiyatý 2000 yüksek olan ürünleri bulmak için gerekli sorguyu yazýnýz.*/
select * from urunler where urun_id in(select urun_id from urunfiyat group by urun_id  having avg(alýsfiyat_id)>2000)

/*6/üyeler tablosunda adýnda A harfi ve soyadýnda E harfi olanlarý listeleyen sorgu.*/
select * from uyeler where uye_adi like '%A%' and  uye_soyadi like '%E%'

/*7/kategori adý,altkategori adý,urunadý ve alýþfiyatýný listeleyen sorgu.*/
SELECT dbo.kategoriler.kategori_adi, dbo.altkategori.altkat_adi, dbo.urunler.urun_adi, dbo.urunfiyat.alýsfiyat_id
FROM     dbo.altkategori INNER JOIN
                  dbo.kategoriler ON dbo.altkategori.kategori_id = dbo.kategoriler.kategori_id INNER JOIN
                  dbo.urunler ON dbo.altkategori.altkat_id = dbo.urunler.altkat_id INNER JOIN
                  dbo.urunfiyat ON dbo.urunler.urun_id = dbo.urunfiyat.urun_id

/*8/ sipariþ_id, kargo adý,urun adý ,urun özellikler ve urun ozellik adýný listeleyen sorgu*/
SELECT dbo.siparisler.siparis_id, dbo.kargo.kargofir_adi, dbo.urunler.urun_adi, dbo.urunozellikler.kumas_tipi, dbo.altkategori.altkat_adi
FROM     dbo.siparisler INNER JOIN
                  dbo.kargo ON dbo.siparisler.kargo_id = dbo.kargo.kargo_id INNER JOIN
                  dbo.urunler ON dbo.siparisler.urun_id = dbo.urunler.urun_id INNER JOIN
                  dbo.urunozellikler ON dbo.urunler.urunozellik_id = dbo.urunozellikler.urunozellik_id INNER JOIN
                  dbo.altkategori ON dbo.urunler.altkat_id = dbo.altkategori.altkat_id

/9/*urunlerin renk adi , urun adý,altkategori adý,marka adý listeleyen sorgu*/
SELECT dbo.renkler.renk_adi, dbo.urunler.urun_adi, dbo.altkategori.altkat_adi, dbo.markalar.marka_adi
FROM     dbo.urunler INNER JOIN
                  dbo.renkler ON dbo.urunler.renk_id = dbo.renkler.renk_id INNER JOIN
                  dbo.markalar ON dbo.urunler.marka_id = dbo.markalar.marka_id INNER JOIN
                  dbo.altkategori ON dbo.urunler.altkat_id = dbo.altkategori.altkat_id

/*10/Fiyatlarý %15 azalltan sorgu.*/
select urun_id, (alýsfiyat_id/1.15) as[Ýndirimli Fiyat] from urunfiyat 


/*FONKSÝYONLAR*/
/*toplam sipariþ sayýsýný getiren fonksiyon ve sorgu*/
select  dbo.fn_topsiparis() as [Toplam Sipariþ Sayýsý]
/*Toplam üyelerin sayýsý belirleyen sorgu(fonksiyon ile)*/
select dbo.fn_musterisay() as uyesayýsý







