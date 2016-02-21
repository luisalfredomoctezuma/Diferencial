global triciclo vAngularL vLinealL  vAngularR vLinealR phi   P theta tiempo;
for i=1:tiempo
    hold off
    % otros datos
    d1=6; radio=1;
	P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
    vLinealL=(vAngularL*pi/180)*radio;
	vLinealR=(vAngularR*pi/180)*radio;

    v1=(vAngularL*pi/180)*radio;
	v2=(vAngularR*pi/180)*radio;
    
    vLineal=((v2+v1)/2);
    vAngular=((v2-v1)/d1)*180/pi;
 	R=(d1*(v2+v1))/(2*(v2-v1))
    CCI=[(P(1)+R*cosd(theta)) , (P(2)-R*sind(theta)) ];
     if(vLinealL==vLinealR)
         for j=1:3
             triciclo(1,j)=triciclo(1,j)+vLineal*sind(theta);
             triciclo(2,j)=triciclo(2,j)+vLineal*cosd(theta);
         end
     elseif (vLinealL==-vLinealR)
         vAngular=((2/d1)*(vLinealR))*180/pi;
         for jj=1:3
             punto=[triciclo(1,jj)-CCI(1);
                    triciclo(2,jj)-CCI(2);
                    0];
             ICCmas=[CCI(1);
                     CCI(2);
                     0];
             mRot=[cosd(vAngular)   sind(vAngular)   0;
                   -sind(vAngular)  cosd(vAngular)   0;
             	    0          0           1]; 
             nx=mRot*punto+ICCmas;
             tempo(1,jj)=nx(1);
             tempo(2,jj)=nx(2);
             tempo(3,jj)=nx(3);
         end
            triciclo=tempo;
            theta=theta+vAngular;
            if(theta>=360),theta=theta-360;end
            if(theta<-360),theta=theta+360;end         
     else
         for jj=1:3
             punto=[triciclo(1,jj)-CCI(1);
                    triciclo(2,jj)-CCI(2);
                    0];
             ICCmas=[CCI(1);
                     CCI(2);
                     0];
             mRot=[cosd(vAngular)   sind(vAngular)   0;
                   -sind(vAngular)  cosd(vAngular)   0;
             	    0          0           1]; 
             nx=mRot*punto+ICCmas;
             tempo(1,jj)=nx(1);
             tempo(2,jj)=nx(2);
             tempo(3,jj)=nx(3);
         end
            triciclo=tempo;
            theta=theta+vAngular;
            if(theta>=360),theta=theta-360;end
            if(theta<-360),theta=theta+360;end
     end
   % P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo, para actualizar en el mismo tiempo
    for k=1:3
        plot(triciclo(1,k),triciclo(2,k),'ro','LineWidth',5), hold on
    end

    line([triciclo(1,1) triciclo(1,2)],[triciclo(2,1) triciclo(2,2)],'color','black','LineWidth',2); hold on
    line([triciclo(1,1) triciclo(1,3)],[triciclo(2,1) triciclo(2,3)],'color','red','LineWidth',2); hold on
    line([triciclo(1,2) triciclo(1,3)],[triciclo(2,2) triciclo(2,3)],'color','black','LineWidth',2); hold on

	if(CCI(1)>1000000),CCI1P='inf';else CCI1P=CCI(1);end
	if ((v2-v1)==0),CCI1P='inf'; else CCI1P=CCI(1);end
	if ((v2-v1)==0),CCI2P='inf'; else CCI2P=CCI(2);end
    set(handles.text14,'string', P(1))
	set(handles.text15,'string', P(2))
    set(handles.text3,'string', vAngularL)  
	set(handles.text5,'string', vLinealL)  
    set(handles.text7,'string',vAngularR) 
    set(handles.text9,'string',vLinealR) 
    set(handles.text11,'string',theta)
	set(handles.text17,'string',CCI1P)
	set(handles.text18,'string',CCI1P)    
    xlabel('x'); ylabel('y');
    title('Diferencial');axis([-100 100 -100 100]),grid on
    pause(0.2)
end