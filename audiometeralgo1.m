

for i=1:4
    
    switch i
        case 1
            disp('Frequency  :  1000 Hz');
            freq=1000;
        case 2
            disp('Frequency  :  2000 Hz');
            freq=2000;
        case 3
            disp('Frequency  :  4000 Hz');
            freq=4000;
        case 4
            disp('Frequency  :  512 Hz');
            freq=512;
    end

    Fs=44100;
    
t=0:1/Fs:1;
s=sin(2*pi*freq*t);

count=0;
soundlevel=input('Enter deciBel level for start : ');
thresh=[];
flag=0;

for i=1:100
    
    if count>=3
        for i=1:(length(thresh)-2)
        if thresh(i)==thresh(i+1) && thresh(i+1)==thresh(i+2) 
        disp('Threshold is  ');
        disp(thresh(i));
        flag=1;
        break;
        end
        end
        
        
    end
    
    if flag==1
        break;
    end
   disp('Now the sound will be played..');
   tic; while toc<(rand(1,1)*3) 
   end
   sound(s*(db2mag(soundlevel-100)),Fs);
    
    resp=input('Enter response   ');
    
    if resp==1
       
        soundlevel=soundlevel-10;
        disp('Current deciBel level : '); 
        disp(soundlevel);
    end
    
    if resp==2
        
        for j=1:100
          
            soundlevel=soundlevel+5;
            disp('Current deciBel level : ');
              disp(soundlevel);
              disp('Now the sound will be played..');
                 tic; while toc<(rand(1,1)*3) 
                     end
        
              sound(s*(db2mag(soundlevel-100)),Fs);
            
              resp=input('Enter response :');
       
              if resp==1
                  count=count+1;
                 thresh(count)=soundlevel;
                 soundlevel=soundlevel-10;
                 disp('Current deciBel level : ');
                 disp(soundlevel);
                  break;
              end
              
        end
    end
    
end

end
              
        
       
        
        



