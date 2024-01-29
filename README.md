# 2023_Analysis_02-moxit-mock-dixit

## Podaci o autoru i analiziranom projektu

Autor: Andrijana Bosiljčić, 1031/2023

Projekat: Moxit-Mock Dixit je implementacija društvene igre Dixit u C++. Narator se smenjuje među igračima po rundama u krug. Narator bira kartu i vezuje asocijaciju u vidu reči ili rečenice za odabranu kartu. Bez otkrivanja naratorove karte, ali sa otkrivanjem njegove asocijacije, igrači svaki za sebe biraju kartu koja ga najviše asocira na datu asocijaciju. Potom sledi kolektivno glasanje gde igrači koji nisu narator pogađaju naratorovu kartu. Poeni se dodeljuju u skladu sa time da li je karta pravilno pogođena - i ako nije - čija karta je pogrešno pogođena. Igračima je cilj da što pre stignu do skupljenih 30 bodova. Prvi koji stigne do kraja je pobednik.

Izvorni kod projekta se može naći na sledećoj adresi: [Moxit-Mock Dixit]([https://openai.com](https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2022-2023/02-moxit-mock-dixit)). Analizirana je main grana, heš kod commit-a: 1f81939c6a409360e7b37945525937d9795382dc


## Spisak korišćenih alata i uputstvo za njihovo pokretanje

- Clang-Tidy
- Cppcheck
- Perf
- Massif
- Cachegrind

Za svaki od navedenih alata se u odgovarajućem folderu mogu naći skripte za njihovo pokretanje i reprodukciju rezultata.

## Zaključak

Analizom ovog projekta može se zaključiti je da je on zaista kvalitetan. Uočeno je par propusta koji se tiču keš memorije na frontend delu aplikacije i curenja memorije na backend delu aplikacije. Takođe je uočeno da se neke vrednosti i funkcije nikada ne upotrebljavaju. 
