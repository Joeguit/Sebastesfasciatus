function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_fasciatus_zerovariate
% file generated by prt_mydata

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Actinopterygii';
metaData.order      = 'Perciformes';
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_fasciatus';
metaData.species_en = 'Acadian redfish';

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'bjFe','0iM','0iMc','bpMcd','bpMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxPz','bpCi','jpCik','jiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp

metaData.data_0     = {'ab','tp','am','Lb','Lp','Li','Ww0','Wwp','Wwi','Ri','ab','am','Lh','Lb','Lp','Lpm','Li','Ri'};
metaData.data_1     = {};

metaData.COMPLETE   = 1; % using criteria of LikaKear2011

metaData.author     = {'Joelle Guitard'};
metaData.date_subm  = [2023 6 6];
metaData.email      = {'joelle.guitard@uqar.ca'};
metaData.address    = {};

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@tecnico.ulisboa.pt'};
metaData.date_acc   = [2023 6 6];

%% set zero-variate data
data.ab = 8; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = {'Gasc2003'};
  temp.ab = C2K(6.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Guessed by Corine';
data.am = 18250; units.am = 'd'; label.am = 'life span'; bibkey.am = {'Gasc2003'};
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.6; units.Lh = 'cm'; label.Lh = 'length at hatch'; bibkey.Lh = {'Tani1961'};
data.Lb = 0.84; units.Lb = 'cm'; label.Lb = 'length at birth'; bibkey.Lb = {'Burn2020'};
data.Lp = 16.26; units.Lp = 'cm'; label.Lp = 'length at puberty'; bibkey.Lp = {'Brul2023'};
data.Lpm = 15.91; units.Lpm = 'cm'; label.Lpm = 'length at puberty for males'; bibkey.Lpm = {'Brul2023'};
data.Li = 50; units.Li = 'cm'; label.Li = 'ultimate length'; bibkey.Li = {'Gasc2003'};

data.Ri = 293; units.Ri = '#/d'; label.Ri = 'ultimate reproduction rate'; bibkey.Ri = {'Gasc2003'};
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'per year';
  
% uni-variate data
cd ../

data.LW80 = readmatrix('L-Ww_MPO_LxM_1980.csv');
data.LW80(:,1) = data.LW80(:,1)/ 10; % convert mm to cm
data.LW80 = [data.LW80(:,1),data.LW80(:,2)] ; % convert mm to cm
units.LW80 = {'cm', 'g'};     label.LW80 = {'fork length', 'wet weight'};  bibkey.LW80 = {'Sena2021'};

data.LW15 = readmatrix('L-Ww_MPO_LxM_2015+.csv');
data.LW15(:,1) = data.LW15(:,1)/ 10; % convert mm to cm
data.LW15 = [data.LW15(:,1),data.LW15(:,2)] ; % convert mm to cm
units.LW15 = {'cm', 'g'};     label.LW15 = {'fork length', 'wet weight'};  bibkey.LW15 = {'Sena2021'};

data.tL10 = readmatrix('t-L_10.0_pivotlength10.0.csv');
data.tL10 = [data.tL10(:,1), data.tL10(:,2)/10]; % d, mm to cm
units.tL10 = {'d', 'cm'}; label.tL10 = {'time', 'length'};  bibkey.tL10 = {'Sena2021'};
temp.tL10 = C2K(10); units.temp.tL10 = 'K'; label.temp.tL10 = 'temperature';
Lwstart.tL10 =  data.tL10(1,2); units.Lwstart.tL10 = 'cm'; label.Lwstart.tL10 = 'initial length';

data.tW10 = readmatrix('t_Ww_10.0_pivotweights10.0.csv');
data.tW10 = [data.tW10(:,1), data.tW10(:,2)]; % d, g
units.tW10 = {'d', 'g'}; label.tW10 = {'time', 'wet weight'};  bibkey.tW10 = {'Sena2021'};
temp.tW10 = C2K(10); units.temp.tW10 = 'K'; label.temp.tW10 = 'temperature';

data.WJO10 = readmatrix('Ww_JO_10.0_Weight-SMR_10.0.csv');
data.WJO10 = [data.WJO10(:,1), data.WJO10(:,2)]; % d, mol/d
units.WJO10 = {'g', 'mg/h'}; label.WJO10 = {'wet weight', 'oxygen'};  bibkey.WJO10 = {'Sena2021'};
temp.WJO10 = C2K(10); units.temp.WJO10 = 'K'; label.temp.WJO10 = 'temperature';

data.WJmO10 = readmatrix('Ww_JO_10.0_Weight-MMR_10.0.csv');
data.WJmO10 = [data.WJmO10(:,1), data.WJmO10(:,2)]; % d, mol/d
units.WJmO10 = {'g', 'mg/h'}; label.WJmO10 = {'wet weight', 'oxygen uptake'};  bibkey.WJmO10 = {'Sena2021'};
temp.WJmO10 = C2K(10); units.temp.WJmO10 = 'K'; label.temp.WJmO10 = 'temperature';
%%%Uni-variate for 2
data.tL2 = readmatrix('t-L_2.5_pivotlength2.5.csv');
data.tL2 = [data.tL2(:,1), data.tL2(:,2)/10]; % d, mm to cm
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'length'};  bibkey.tL2 = {'Sena2021'};
temp.tL2 = C2K(2.5); units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
Lwstart.tL2 =  data.tL2(1,2); units.Lwstart.tL2 = 'cm'; label.Lwstart.tL2 = 'initial length';

data.tW2 = readmatrix('t-Ww_2.5_pivotweights2.5.csv');
data.tW2 = [data.tW2(:,1), data.tW2(:,2)]; % d, g
units.tW2 = {'d', 'g'}; label.tW2 = {'time', 'wet weight'};  bibkey.tW2 = {'Sena2021'};
temp.tW2 = C2K(2.5); units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';

data.WJO2 = readmatrix('Ww_JO_2.5_Weight-SMR_2.5.csv');
data.WJO2 = [data.WJO2(:,1), data.WJO2(:,2)]; % d, mol/d
units.WJO2 = {'g', 'mg/h'}; label.WJO2 = {'wet weight', 'oxygen uptake'};  bibkey.WJO2 = {'Sena2021'};
temp.WJO2 = C2K(2.5); units.temp.WJO2 = 'K'; label.temp.WJO2 = 'temperature';

data.WJmO2 = readmatrix('Ww_JO_2.5_Weight-MMR_2.5.csv');
data.WJmO2 = [data.WJmO2(:,1), data.WJmO2(:,2)]; % d, mol/d
units.WJmO2 = {'g', 'mg/h'}; label.WJmO2 = {'wet weight', 'oxygen'};  bibkey.WJmO2 = {'Sena2021'};
temp.WJmO2 = C2K(2.5); units.temp.WJmO2 = 'K'; label.temp.WJmO2 = 'temperature';

%%%Uni-variate for 7
data.tL7 = readmatrix('t-L_7.5_pivotlength7.5.csv');
data.tL7 = [data.tL7(:,1), data.tL7(:,2)/10]; % d, mm to cm
units.tL7 = {'d', 'cm'}; label.tL7 = {'time', 'length'};  bibkey.tL7 = {'Sena2021'};
temp.tL7 = C2K(7.5); units.temp.tL7 = 'K'; label.temp.tL7 = 'temperature';
Lwstart.tL7 =  data.tL7(1,2); units.Lwstart.tL7 = 'cm'; label.Lwstart.tL7 = 'initial length';

data.tW7 = readmatrix('t-Ww_7.5_pivotweights7.5.csv');
data.tW7 = [data.tW7(:,1), data.tW7(:,2)]; % d, g
units.tW7 = {'d', 'g'}; label.tW7 = {'time', 'wet weight'};  bibkey.tW7 = {'Sena2021'};
temp.tW7 = C2K(7.5); units.temp.tW7 = 'K'; label.temp.tW7 = 'temperature';

data.WJO7 = readmatrix('Ww_JO_7.5_Weight-SMR_7.5.csv');
data.WJO7 = [data.WJO7(:,1), data.WJO7(:,2)]; % d, mol/d
units.WJO7 = {'g', 'mg/h'}; label.WJO7 = {'wet weight', 'oxygen uptake'};  bibkey.WJO7 = {'Sena2021'};
temp.WJO7 = C2K(7.5); units.temp.WJO7 = 'K'; label.temp.WJO7 = 'temperature';

data.WJmO7 = readmatrix('Ww_JO_7.5_Weight-MMR_7.5.csv');
data.WJmO7 = [data.WJmO7(:,1), data.WJmO7(:,2)]; % d, mol/d
units.WJmO7 = {'g', 'mg/h'}; label.WJmO7 = {'wet weight', 'oxygen'};  bibkey.WJmO7 = {'Sena2021'};
temp.WJmO7 = C2K(7.5); units.temp.WJmO7 = 'K'; label.temp.WJmO7 = 'temperature';



%%%Uni-variate for 5
data.tL5 = readmatrix('t-L_5.0_pivotlength5.0.csv');
data.tL5 = [data.tL5(:,1), data.tL5(:,2)/10]; % d, mm to cm
units.tL5 = {'d', 'cm'}; label.tL5 = {'time', 'length'};  bibkey.tL5 = {'Sena2021'};
temp.tL5 = C2K(5); units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
Lwstart.tL5 =  data.tL5(1,2); units.Lwstart.tL5 = 'cm'; label.Lwstart.tL5 = 'initial length';

data.tW5 = readmatrix('t_Ww_5.0_pivotweights5.0.csv');
data.tW5 = [data.tW5(:,1), data.tW5(:,2)]; % d, g
units.tW5 = {'d', 'g'}; label.tW5 = {'time', 'wet weight'};  bibkey.tW5 = {'Sena2021'};
temp.tW5 = C2K(5); units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';

data.WJO5 = readmatrix('Ww_JO_5.0_Weight-SMR_5.0.csv');
data.WJO5 = [data.WJO5(:,1), data.WJO5(:,2)]; % d, mol/d
units.WJO5 = {'g', 'mg/h'}; label.WJO5 = {'wet weight', 'oxygen uptake'};  bibkey.WJO5 = {'Sena2021'};
temp.WJO5 = C2K(5); units.temp.WJO5 = 'K'; label.temp.WJO5 = 'temperature';

data.WJmO5 = readmatrix('Ww_JO_5.0_Weight-MMR_5.0.csv');
data.WJmO5 = [data.WJmO5(:,1), data.WJmO5(:,2)]; % d, mol/d
units.WJmO5 = {'g', 'mg/h'}; label.WJmO5 = {'wet weight', 'oxygen uptake'};  bibkey.WJmO5 = {'Sena2021'};
temp.WJmO5 = C2K(5); units.temp.WJmO5 = 'K'; label.temp.WJmO5 = 'temperature';

cd Sebastes_fasciatus


%% set weights for all real data
weights = setweights(data, []);
weights.LW80 = 0.1 * weights.LW80;
weights.LW15 = 0.1 * weights.LW15;
weights.tW5 = 20 * weights.tW5;
weights.tL5 = 10 * weights.tL5;


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.Lwstart = Lwstart;
% auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
 set1 = {'WJO10', 'WJO7', 'WJO5','WJO2'}; subtitle1 = {'Standard metabolic rate at 10, 7.5, 5.0 and 2.5 C'};      
 set2 = {'WJmO10', 'WJmO7', 'WJmO5','WJmO2'}; subtitle2 = {'Maximal metabolic rate at 10, 7.5, 5.0 and 2.5 C'};      
 set3 = {'tL10', 'tL7', 'tL5','tL2'}; subtitle3 = {'lengths at 10, 7.5, 5.0 and 2.5 C (ind1)'};      
 set4 = {'tW10', 'tW7', 'tW5','tW2'}; subtitle4 = {'weights at 10, 7.5, 5.0 and 2.5 C (ind1)'};      
 set5 = {'LW80', 'LW15'}; subtitle5 = {'1980, 2015'};      
 metaData.grp.sets = {set1, set2, set3,set4, set5};
 metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4, subtitle5};

 
 
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);



%% Links
metaData.links.id_CoL = '4W7M3'; % Cat of Life
metaData.links.id_EoL = '46568110'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_fasciatus'; % Anim Div. Web
metaData.links.id_Taxo = '187273'; % Taxonomicon
metaData.links.id_WoRMS = '127252';
metaData.links.id_fishbase = 'Sebastes-fasciatus';

%% References
bibkey = 'Brul2023'; type = 'techreport'; bib = [ ...
'author = {Brûlé Caroline, Benhalima Kadra, Roux Marie-Julie, Parent Geneviève, Chavarria Caroline, Senay Caroline}, ' ... 
'title = {Updating knowledge of Redfish (Sebastes mentella and S. fasciatus) reproduction in a changing environment, the Gulf of St. Lawrence and Laurentian Channel, Canada}, ' ... 
'institution = {Oceans and Fisheries Canada}, ' ... 
'year = {2023}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Burn2020'; type = 'article'; bib = [ ...
'author = {Burns, Corinne M.; Lauzon, Félix; Plourde, Stéphane; Sirois, Pascal; Robert, Dominique}, ' ... 
'title = {Interannual variability of diet composition and prey preference of larval redfish (Sebastes spp.) in the Gulf of St. Lawrence}, ' ... 
'journal = {Journal of Plankton Research}, ' ... 
'year = {2020}, ' ... 
'volume = {42}, ' ... 
'pages = {581-594}, ' ... 
'doi = {10.1093/plankt/fbaa040}, ' ... 
'howpublished = {\url{https://www.mendeley.com/catalogue/f0b5bf7e-3ef2-3a93-a591-3df5286f3f5c/?utm_source=desktop&utm_medium=1.19.8&utm_campaign=open_catalog&userDocumentId=%7B732b440f-980a-42b0-8825-3ec7be2254a4%7D}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Gasc2003'; type = 'article'; bib = [ ...
'author = {Dominique Gascon}, ' ... 
'title = {Redfish Multidisciplinary Research Zonal Program (1995-1998): Final Report}, ' ... 
'journal = {Canadian Technical Report of Fisheries and Aquatic Sciences}, ' ... 
'year = {2003}, ' ... 
'volume = {2462}, ' ... 
'pages = {155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Penn1985'; type = 'article'; bib = [ ...
'author = {R.W. Penney; G.T.Evans}, ' ... 
'title = {Growth histories of larval redfish (Sebastes spp.) on an offshore Atlantic fishing Bank determined by otolith increment analysis.}, ' ... 
'journal = {Canadian journal of fisheries and aquatic sciences}, ' ... 
'year = {1985}, ' ... 
'volume = {42}, ' ... 
'pages = {1452-1464}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
bibkey = 'Tani1961'; type = 'techreport'; bib = [ ...
'author = {A. V. Taning}, ' ... 
'title = {Larval and postlarval stages of Sebastes species and Helicolenus dactylopterus.}, ' ... 
'institution = {Conseil International pour l’Exploration de la Mer}, ' ... 
'year = {1961}, ' ... 
'volume = {150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ', bib, '}'';'];
%
