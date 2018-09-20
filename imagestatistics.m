function varargout = imagestatistics(varargin)
% IMAGESTATISTICS MATLAB code for imagestatistics.fig
%      IMAGESTATISTICS, by itself, creates a new IMAGESTATISTICS or raises the existing
%      singleton*.
%
%      H = IMAGESTATISTICS returns the handle to a new IMAGESTATISTICS or the handle to
%      the existing singleton*.
%
%      IMAGESTATISTICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGESTATISTICS.M with the given input arguments.
%
%      IMAGESTATISTICS('Property','Value',...) creates a new IMAGESTATISTICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imagestatistics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imagestatistics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagestatistics

% Last Modified by GUIDE v2.5 04-Oct-2015 21:27:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagestatistics_OpeningFcn, ...
                   'gui_OutputFcn',  @imagestatistics_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before imagestatistics is made visible.
function imagestatistics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imagestatistics (see VARARGIN)

% Choose default command line output for imagestatistics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imagestatistics wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imagestatistics_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%
% 
% <latex>
% \begin{tabular}{|c|c|} \hline
% $n$ & $n!$ \\ \hline
% 1 & 1 \\
% 2 & 2 \\
% 3 & 6 \\ \hline
% \end{tabular}
% </latex>
% 
global I;
[file, path] = uigetfile('*','All Files');
b = strcat(path, file);
I=imread(b);
imshow(I);
% --- Executes on button press in Band1.
function Band1_Callback(hObject, eventdata, handles)
% hObject    handle to Band1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
    [counts, img] = imhist(I(:,:,1));
    A = 0;
    for i = 1:256
        A = A + ((i - 1) * counts(i));
    end
    mean = A/256;
    set(handles.text_mean1,'string',mean);
    B = counts;
    for c = 1:256
        for d = 1:256 - c
            if B(d) > B(d+1)
                swap       = B(d);
                B(d)   = B(d+1);
                B(d+1) = swap;
            end
        end
    end
    median = (B(128) + B(129))/2;
    set(handles.text_median1,'string',median);
    m = B(256);
    modes = [];
    flag=1;
    for z = 1:256
        if(counts(z) == m)
            modes(flag) = z - 1;
            flag = flag + 1;
        end
    end
    set(handles.text_mode1,'string',modes);
    varisum = 0;
    for k = 1:256
        varisum = varisum + (counts(k) * ((k - 1 - mean)^ 2));
    end
    variance = varisum/256;
    set(handles.text_variance1,'string',variance);
    skew = 0;
    for k = 1:256
        skew = skew + (((k - 1 - mean)^3)* counts(k));
    end
    skewness = skew/(255*(variance^(3/2)));
    set(handles.text_skewness1,'string',skewness);
    kurto = 0;
    for k = 1:256
        kurto = kurto + (((k - 1 - mean)^4)* counts(k));
    end
    kurtosis = (kurto/(255*(variance^2))) - 3;
    set(handles.text_kurtosis1,'string',kurtosis);
% --- Executes on button press in Band2.
function Band2_Callback(hObject, eventdata, handles)
% hObject    handle to Band2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Band3.
global I;
[counts, img] = imhist(I(:,:,2));
    A = 0;
    for i = 1:256
        A = A + ((i - 1) * counts(i));
    end
    mean = A/256;
    set(handles.text_mean2,'string',mean);
    B = counts;
    for c = 1:256
        for d = 1:256 - c
            if B(d) > B(d+1)
                swap       = B(d);
                B(d)   = B(d+1);
                B(d+1) = swap;
            end
        end
    end
    median = (B(128) + B(129))/2;
    set(handles.text_median2,'string',median);
    m = B(256);
    modes = [];
    flag=1;
    for z = 1:256
        if(counts(z) == m)
            modes(flag) = z - 1;
            flag = flag + 1;
        end
    end
    set(handles.text_mode2,'string',modes);
    varisum = 0;
    for k = 1:256
        varisum = varisum + (counts(k) * ((k - 1 - mean)^ 2));
    end
    variance = varisum/256;
    set(handles.text_variance2,'string',variance);
    skew = 0;
    for k = 1:256
        skew = skew + (((k - 1 - mean)^3)* counts(k));
    end
    skewness = skew/(255*(variance^(3/2)));
    set(handles.text_skewness2,'string',skewness);
    kurto = 0;
    for k = 1:256
        kurto = kurto + (((k - 1 - mean)^4)* counts(k));
    end
    kurtosis = (kurto/(255*(variance^2))) - 3;
    set(handles.text_kurtosis2,'string',kurtosis);
function Band3_Callback(hObject, eventdata, handles)
% hObject    handle to Band3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
[counts, img] = imhist(I(:,:,3));
    A = 0;
    for i = 1:256
        A = A + ((i - 1) * counts(i));
    end
    mean = A/256;
    set(handles.text_mean3,'string',mean);
    B = counts;
    for c = 1:256
        for d = 1:256 - c
            if B(d) > B(d+1)
                swap       = B(d);
                B(d)   = B(d+1);
                B(d+1) = swap;
            end
        end
    end
    median = (B(128) + B(129))/2;
    set(handles.text_median3,'string',median);
    m = B(256);
    modes = [];
    flag=1;
    for z = 1:256
        if(counts(z) == m)
            modes(flag) = z - 1;
            flag = flag + 1;
        end
    end
    set(handles.text_mode3,'string',modes);
    varisum = 0;
    for k = 1:256
        varisum = varisum + (counts(k) * ((k - 1 - mean)^ 2));
    end
    variance = varisum/256;
    set(handles.text_variance3,'string',variance);
    skew = 0;
    for k = 1:256
        skew = skew + (((k - 1 - mean)^3)* counts(k));
    end
    skewness = skew/(255*(variance^(3/2)));
    set(handles.text_skewness3,'string',skewness);
    kurto = 0;
    for k = 1:256
        kurto = kurto + (((k - 1 - mean)^4)* counts(k));
    end
    kurtosis = (kurto/(255*(variance^2))) - 3;
    set(handles.text_kurtosis3,'string',kurtosis);
