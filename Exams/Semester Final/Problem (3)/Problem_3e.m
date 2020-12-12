N=50;
nstep=500000;
t_e = 1e4;
printstep=2000;
nprint=floor((nstep-t_e)/printstep);
nrun=100;


t=zeros(nprint,1);
avm=zeros(nprint,1);
avmsq=zeros(nprint,1);
%where we store averages



J=0.3;
b=0;
pbc=true;



for run=1:nrun
   spins=zeros(N,N);
   m=0;
   for i=1:N
        for j=1:N
            if(rand()<.5)
                spins(i,j)=1;
                m=m+1;
            else
                spins(i,j)=-1;
                m=m-1;
            end
        end
   end
   e=get_init_energy(spins,J,b,N,pbc);
   %initialize the system:  spins and energies computed
   
   for step=1:nstep
      s1=floor(N*rand())+1;
      s2=floor(N*rand())+1;
      enew=e+energy_difference(s1,s2,spins,J,b,N,pbc);
       %try to flip a spin
      if(metropolis(e,enew))
          %use metropolis to accept or reject
         spins(s1,s2)=-spins(s1,s2);
         if(spins(s1,s2)>0)
            m=m+2; 
         else
             m=m-2;
         end
         e=enew;
         %update energy and magnetization if accepted
      end
      
      
      if (step-t_e > 0)
          m_eq = m;
          if(mod((step-t_e),printstep)==0)
              k=floor((step-t_e)/printstep);
              t(k)=step-t_e;
              avm(k)=avm(k)+abs(m)/N/N;
              avmsq(k) = avmsq(k) + abs(m)*abs(m)/N/N;
          end
      end
   end
end
      
stdvm = (avmsq - avm.^2)./sqrt(nrun);      



%metropolis criterion
function x=metropolis(e,enew)
   if(e>enew)
       x=true;
   else
       if(rand()<exp(-(enew-e)))
           x=true;
       else
           x=false;
       end
   end
end





%compute the energy of the system
function efinal=get_init_energy(spins,J,b,N,pbc)
    e=0;
    for i=1:(N-1)
       for j=1:(N-1)
          e=e-spins(i,j)*spins(i+1,j);
          e=e-spins(i,j)*spins(i,j+1);
          %bulk contribution, not needing to worry about pbc's
       end
    end
    

    for i=1:(N-1)
       e=e-spins(i,N)*spins(i+1,N);
       if(pbc)
            e=e-spins(i,N)*spins(i,1);
       end
    end
    % right side
    

    for j=1:(N-1)
        e=e-spins(N,j)*spins(N,j+1);
        if(pbc)
            e=e-spins(N,j)*spins(1,j);
        end
    end
    %bottom
    

    if(pbc)
        e=e-spins(N,N)*spins(N,1);
        e=e-spins(N,N)*spins(1,N);
    end
    %bottom right corner

    emag=0;
    for i=1:N
        for j=1:N
            emag=emag-spins(i,j);
        end
    end
    

    
    e=J*e+b*emag;
    efinal=e;
end


function de=energy_difference(s1,s2,spins,J,b,N,pbc)
    de=0;

    
    evaluate=true; 
    t1=s1+1;
    t2=s2;
    if(t1==N+1)
           if(pbc)
               t1=1;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2);
    end
           
    evaluate=true; 
    t1=s1-1;
    t2=s2;
    if(t1==0)
           if(pbc)
               t1=N;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2);       
    end      
    
           
    evaluate=true; 
    t1=s1;
    t2=s2+1;
    if(t2==N+1)
           if(pbc)
               t2=1;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2);   
    end     
           
           
    evaluate=true; 
    t1=s1;
    t2=s2-1;
    if(t2==0)
           if(pbc)
               t2=N;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2); 
    end
    
    de=de*J;
    if(spins(s1,s2)>0)
        de=de+2*b;
    else
        de=de-2*b;
    end
    
    
end
