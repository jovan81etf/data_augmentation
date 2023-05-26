function create_scp_file(govornik3,trening,test,tren_a,tren_b,tren_c,tren_d,test_a,test_b)  % tren_a,tren_b,tren_c,tren_d - range of utterances for training 
%**************************************************************************                   test_a,test_b range of utterances for test                 
%************************    S   C   P      *******************************
%**************************************************************************
%% C:/htk/TOPGS/base/an4/wav/augn_TST_mat - path to folder with wav - change 
% creation an4_trainl
govornik=[2 6 7 8 9 14 15 16 18 19 govornik3];

fid1=fopen('antrainl.scp', 'w');
%  **************** COLORS **************************
for i=1:10
    if(govornik(i)~=govornik3)
        for boja=1:6
    for izgovor=tren_a:tren_b
        for mod=trening:5:trening
         fprintf(fid1,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.mfcc_dd_cms\n',boja,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
      for izgovor=tren_c:tren_d
        for mod=trening:5:trening
         fprintf(fid1,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.mfcc_dd_cms\n',boja,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
        end
    end
end
% 
% 
% % ***************** NUMBERS ***********************
for i=1:10
    if(govornik(i)~=govornik3)
            for broj=1:14
    for izgovor=tren_a:tren_b
         for mod=trening:5:trening
         fprintf(fid1,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.mfcc_dd_cms\n',broj,govornik(i),izgovor,mod);
        end
    end
      for izgovor=tren_c:tren_d
         for mod=trening:5:trening
         fprintf(fid1,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.mfcc_dd_cms\n',broj,govornik(i),izgovor,mod);
        end
    end
            end
    end
    end
%     
% % ***************** BALANCED WORDS **************************
for i=1:10
    if(govornik(i)~=govornik3)
            for rec=1:30
    for izgovor=tren_a:tren_b
         for mod=trening:5:trening
             fprintf(fid1,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.mfcc_dd_cms\n',rec,govornik(i),izgovor,mod);
        end
    end
    for izgovor=tren_c:tren_d
         for mod=trening:5:trening
         fprintf(fid1,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.mfcc_dd_cms\n',rec,govornik(i),izgovor,mod);
        end
    end
end
    end
    end
    fclose(fid1);
    % *****************************created an4_trainl ********************
%     
%     
%     
%     
    % creation an4_testl
fid2=fopen('antestl.scp', 'w');
%  **************** COLORS **************************
for boja=1:6
for govornik_brojac=govornik3:govornik3
    for izgovor=test_a:test_b
        for mod=test:5:test
            fprintf(fid2,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.mfcc_dd_cms\n',boja,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
end
end



% ***************** NUMBERS ***********************
    for broj=1:14
for govornik_brojac=govornik3:govornik3
    for izgovor=test_a:test_b
         for mod=test:5:test
         fprintf(fid2,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.mfcc_dd_cms\n',broj,govornik_brojac,izgovor,mod);
        end
    end
end
    end

    
% ***************** BALANCED WORDS **************************
    for rec=1:30
for govornik_brojac=govornik3:govornik3
    for izgovor=test_a:test_b
         for mod=test:5:test
         fprintf(fid2,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.mfcc_dd_cms\n',rec,govornik_brojac,izgovor,mod);
        end
    end
end
    end
  
    fclose(fid2);
    % *****************************created an4_testl ********************
%     
    % creation an4_train (corespondention wav -> mfc)
fid3=fopen('antrain.scp', 'w');
%  **************** COLORS **************************
for i=1:10
    if(govornik(i)~=govornik3)
        for boja=1:6
    for izgovor=tren_a:tren_b
        for mod=trening:5:trening
         fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.wav\t',boja,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.mfcc_dd_cms\n',boja,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
      for izgovor=tren_c:tren_d
        for mod=trening:5:trening
         fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.wav\t',boja,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.mfcc_dd_cms\n',boja,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
        end 
end
end


% ***************** NUMBERS ***********************
for i=1:10
    if(govornik(i)~=govornik3)
            for broj=1:14
    for izgovor=tren_a:tren_b
         for mod=trening:5:trening
       fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.wav\t',broj,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.mfcc_dd_cms\n',broj,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
     for izgovor=tren_c:tren_d
         for mod=trening:5:trening
       fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.wav\t',broj,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.mfcc_dd_cms\n',broj,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
            end
    end
    end
    
% ***************** BALANCED WORDS **************************
for i=1:10
    if(govornik(i)~=govornik3)
            for rec=1:30
    for izgovor=tren_a:tren_b
         for mod=trening:5:trening
         fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.wav\t',rec,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.mfcc_dd_cms\n',rec,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
     for izgovor=tren_c:tren_d
         for mod=trening:5:trening
         fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.wav\t',rec,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid3,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.mfcc_dd_cms\n',rec,govornik(i),izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
            end
    end
    end
    fclose(fid3);
%     % *****************************created an4_train ********************
     % creation an4_test (corespondention wav -> mfc)
fid4=fopen('antest.scp', 'w');
%  **************** COLORS **************************
for boja=1:6
for govornik_brojac=govornik3:govornik3
    for izgovor=test_a:test_b
        for mod=test:5:test
         fprintf(fid4,'C:/htk/TOPGS/base/an4/wav/an4_clstk/boja%d_%d_%d%s.wav\t',boja,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid4,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/boja%d_%d_%d%s.mfcc_dd_cms\n',boja,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
end
end



% ***************** NUMBERS ***********************
    for broj=1:14
for govornik_brojac=govornik3:govornik3
    for izgovor=test_a:test_b
         for mod=test:5:test
       fprintf(fid4,'C:/htk/TOPGS/base/an4/wav/an4_clstk/broj%d_%d_%d%s.wav\t',broj,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid4,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/broj%d_%d_%d%s.mfcc_dd_cms\n',broj,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
end
    end

    
% ***************** BALANCED WORDS **************************
    for rec=1:30
for govornik_brojac=govornik3:govornik3
    for izgovor=test_a:test_b
         for mod=test:5:test
         fprintf(fid4,'C:/htk/TOPGS/base/an4/wav/an4_clstk/rec%d_%d_%d%s.wav\t',rec,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
          fprintf(fid4,'C:/htk/TOPGS/base/an4/wav/augn_TST_mat/rec%d_%d_%d%s.mfcc_dd_cms\n',rec,govornik_brojac,izgovor,mod); % n i s (115 i 115 ascii)
        end
    end
end
    end

    fclose(fid4);
    % *****************************created an4_test ********************
   
  
   
    