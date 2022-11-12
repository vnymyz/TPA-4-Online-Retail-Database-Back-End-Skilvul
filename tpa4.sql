create database tpa4;
use tpa4;

-- membuat tabel --
create table pembeli (
id_pembeli int primary key not null auto_increment,
nama_pembeli varchar(50),
email varchar(50),
alamat varchar(100),
notelp_pembeli varchar(15)
);

create table supplier (
id_supplier int primary key not null auto_increment,
nama_supplier varchar(50),
notelp_supplier varchar(15),
alamat_supplier varchar(100)
);

create table kategori (
id_kategori int primary key not null auto_increment,
nama_kategori varchar(50)
);

create table produk (
id_produk int primary key not null auto_increment,
nama_produk varchar(50),
stok_produk int,
harga_produk int,
id_supplier int,
id_kategori int,
foreign key (id_supplier) references supplier(id_supplier),
foreign key (id_kategori) references kategori(id_kategori)
);

create table transaksi (
id_transaksi int primary key not null auto_increment,
id_produk int,
id_pembeli int,
foreign key (id_produk) references produk(id_produk),
foreign key (id_pembeli) references pembeli(id_pembeli),
tgl_transaksi datetime,
keterangan_transaksi varchar(100),
total_harga int
);
-- selesai membuat tabel --

-- menambahkan data lagi dalam tabel transaksi --
alter table transaksi add jumlahbarang int;

-- mengisi data dalam tabel yang sudah dibuat --
insert into pembeli (nama_pembeli,email,alamat,notelp_pembeli) values
("ilham kanaeru", "ilhamkanaeruuwu@gmail.com", "jalan air kobokan no 12", "081387395867"),
("Miko Aramu", "mikoaramu@gmail.com", "jalan taman revolusi no 20", "081247869288"),
("Vanya Mayazura", "mayazurav@gmail.com", "jalan mawar no 17", "081280506903"),
("I ketut gede siwasesana pande", "codelyoko14@gmail.com", "jalan boromon no 12", "081290631977"),
("Dionisius Jordi", "dionisiusjordi05@gmail.com", "jalan ciremai gang tegal peteuy no 15", "081257775602"),
("ilham kanaeru0", "ilhamkanaeruuwu0@gmail.com", "jalan air kobokan no 10", "081387395870"),
("ilham kanaeru1", "ilhamkanaeruuwu1@gmail.com", "jalan air kobokan no 11", "081387395871"),
("ilham kanaeru2", "ilhamkanaeruuwu2@gmail.com", "jalan air kobokan no 12", "081387395872"),
("ilham kanaeru3", "ilhamkanaeruuwu3@gmail.com", "jalan air kobokan no 13", "081387395873"),
("ilham kanaeru4", "ilhamkanaeruuwu4@gmail.com", "jalan air kobokan no 14", "081387395874");

insert into supplier (nama_supplier,notelp_supplier,alamat_supplier) values
("Toko Phoenix","02145845165","jalan mawar no 17"),
("Toko Haven","0214529316","jalan merbabu no 5"),
("PT Jaya Smile","622276888253","jalan boromon no 20"),
("Toko Attic","622155790683","jalan jambu no 13"),
("Toko Wrap","02156963434","jalan ikan no 8"),
("Toko Omen","62231320288","jalan hamster no 13"),
("PT Red Wing","087759448537","jalan karet no 14"),
("Toko Haven","62315031014","jalan naga no 20"),
("Toko Neem","62341358342","jalan kue no 1"),
("PT Pelita Cerah","0217234568","jalan salmon no 11");  

insert into kategori (nama_kategori) values
("makanan"),
("minuman"),
("mainan"),
("produk kecantikan"),
("Rumah Tangga"),
("elektronik"),
("Bunga"),
("Buku"),
("Peralatan Sekolah"),
("Baju dan Celana");

insert into produk (nama_produk,harga_produk,stok_produk,id_supplier,id_kategori) values
("Sprite",5000,50,1,2),
("Ayam Goreng",12000,100,2,1),
("Lego Star Wars",500000,80,3,3),
("Wardah Lightening Day and Night Cream",200000,112,4,4),
("Double Bed Hitori",2000000,10,5,5),
("Mesin Cuci",2500000,30,6,6),
("TV Samsung FHD",1200000,8,6,6),
("Bunga Hias Mawar",100000,60,7,7),
("Light Novel Tokyo Ghoul",75000,200,8,8),
("Tas Sekolah Among us",120000,400,9,9),
("Oversized Outer Cardigan",119000,700,10,10),
("Jaket Denim all size",230000,200,10,10);

insert into transaksi (id_produk,id_pembeli,tgl_transaksi,keterangan_transaksi,total_harga,jumlahbarang) values
(1,1,"2022-11-1 13:00:00","Lunas",50000,10),
(9,3,"2022-10-20 09:00:00","Lunas",75000,1),
(12,5,"2022-9-15 13:00:00","Lunas",230000,1),
(2,2,"2022-9-18 14:00:00","Lunas",120000,10),
(8,4,"2022-8-21 17:00:00","Lunas",200000,2),
(7,4,"2022-2-10 09:00:00","Lunas",1200000,1),
(11,7,"2022-5-12 12:00:00","Lunas",119000,1),
(4,3,"2022-11-2 08:00:00","Lunas",200000,1),
(5,10,"2022-7-2 05:34:21","Lunas",2000000,1),
(6,3,"2022-11-05 10:50:21","Lunas",2500000,1);

-- jika ingin mengulang auto increment --
ALTER TABLE pembeli AUTO_INCREMENT = 1;

-- menghapus database --
drop database tpa4;

-- menghapus tabel --
drop table transaksi;
drop table produk;
drop table pembeli;
drop table kategori;

-- menghapus data pada tabel --
delete from pembeli where id=5;
delete from supplier where nama_supplier='Toko Phoenix';

-- mengambil data dan melihat data --
use tpa4;
select * from pembeli;
select * from transaksi;
select * from produk;
select nama_produk from produk;
select * from transaksi where id_pembeli=4;
select id_transaksi,id_produk,id_pembeli,nama_produk,jumlahbarang from transaksi left join produk on transaksi.id_produk = produk.id_produk;
desc pembeli;

-- update data --
update pembeli set phone="081280206678" where id_pembeli=3;
update produk set nama_produk="Light Novel Sword Art Online" where id_produk=8;

-- kasus --
-- 1 pelanggan membeli 3 barang berbeda --
insert into transaksi (id_produk,id_pembeli,tgl_transaksi,keterangan_transaksi,total_harga,jumlahbarang) values
(9,3,"2022-10-20 09:00:00","Lunas",75000,1),
(4,3,"2022-11-2 08:00:00","Lunas",200000,1),
(6,3,"2022-11-05 10:50:21","Lunas",2500000,1);

-- melihat beberapa produk yang paling sering dibeli --
select nama_produk,(count(jumlahbarang)) as "Laris" from transaksi
left join produk on transaksi.id_produk=produk.id_produk group by id_produk
order by count(id_produk) desc limit 5;

-- melihat kategori produk yang paling banyak produk nya --
select id_kategori,count(id_kategori) as "jumlah produk" from produk group by id_kategori
order by count(id_kategori) desc;

-- rata-rata transaksi yang dilakukan pembeli dalam 1 bulan terakhir --
select count(id_transaksi) as "Jumlah transaksi dalam 1 bulan",avg(total_harga) as "rata-rata transaksi"
from transaksi where tgl_transaksi between "2022-10-10 00:00:00" and "2022-11-10 00:00:00";






























