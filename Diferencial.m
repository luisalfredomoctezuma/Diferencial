function varargout = Diferencial(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Diferencial_OpeningFcn, ...
                   'gui_OutputFcn',  @Diferencial_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1}),gui_State.gui_Callback = str2func(varargin{1});end
if nargout,[varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});else gui_mainfcn(gui_State, varargin{:});end
function Diferencial_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%% principal
global triciclo vAngularL vLinealL phiL vAngularR vLinealR phiR theta tiempo;
vAngularL=0;  vLinealL=0; phiL=0; tiempo=1;
vAngularR=0;  vLinealR=0; phiR=0; theta=0; 
triciclo=[-3 0 3;
           1 6 1;
           0 0 0];
DifeLoco;
set(gcf,'toolbar','figure')
% Update handles structure
guidata(hObject, handles);
function varargout = Diferencial_OutputFcn(hObject, eventdata, handles) ,varargout{1} = handles.output;
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
%% control
global triciclo vAngularL vLinealL phiL vAngularR vLinealR phiR theta tiempo;
f=gcf;
val=double(get(f,'CurrentCharacter'));
if (val==28) %disp('leftArrow');
    vAngularR=vAngularR-(45/3);
    if (vAngularR>=-180)
        DifeLoco;
    else
        vAngularR=vAngularR+(45/3);
    end
elseif(val==29) %disp('rightArrow');
	tiempo=100;
	vAngularR=vAngularR+(45/3);
    if vAngularR<=180
        DifeLoco;
    else
        vAngularR=vAngularR-(45/3);
    end
elseif(val==30) %disp('upArrow');
    tiempo=100;
	vAngularL=vAngularL+(45/3);
    if vAngularL<=180
        DifeLoco;
    else
        vAngularL=vAngularL-(45/3);
    end
elseif(val==31) %disp('downArrow');
    vAngularL=vAngularL-(45/3);
    if (vAngularL>=-180)  
        DifeLoco;
    else
        vAngularL=vAngularL+(45/3);
    end
elseif(val==8) % reinicio
    vAngularL=0;  vLinealL=0; phiL=0; 
    vAngularR=0;  vLinealR=0; phiR=0;
    tiempo=1; theta=0; 
    triciclo=[-3 0 3;
               1 6 1;
               0 0 1];
    DifeLoco;
end
function checkbox1_Callback(hObject, eventdata, handles)
%% dibujar la ruta
