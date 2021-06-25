%DimasHerlambang/123190140
clear
clc

opts = detectImportOptions('Real estate valuation data set.xlsx');%untuk memberi tahu fungsi cara mengimpor data
opts.SelectedVariableNames = [3:5 8];%memilih nama Kolomnya
opts.DataRange = '2:51';%memilih nama sampe baris ke berapa
data = readmatrix('Real estate valuation data set.xlsx',opts);%untuk menampilkan data excel
 
x = data;%data rating kecocokan dari masing-masing alternatif
k = [0,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi) 

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S);

Vtranspose=V.';%transpose matrik
opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = (1);
opts.DataRange = '2:51';
rank = readmatrix('Real estate valuation data set.xlsx',opts);
rank = [rank Vtranspose];
rank = sortrows(rank,-2);
rank = rank(1:5,1);

disp ('Rekomendasi =')
disp (rank)
%DimasHerlambang/123190140