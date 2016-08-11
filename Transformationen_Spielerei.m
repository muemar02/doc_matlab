close all;
clear all;
T=[cosd(-45) 0 sind(-45) 5; 0 1 0 2; -sind(-45) 0 cosd(-45) 0; 0 0 0 1];
Tr = [cosd(-30.96) 0 sind(-30.96) 5; 0 1 0 2; -sind(-30.96) 0 cosd(-30.96) 0; 0 0 0 1]
dTTr = [cosd(-30.96+45) 0 sind(-30.96+45) 0; 0 1 0 0; -sind(-30.96+45) 0 cosd(-30.96+45) 0; 0 0 0 1]

Trinv = horzcat(vertcat(inv(Tr(1:3,1:3)),[0 0 0]),Tr(1:4,4));

%testvektor ist definiert im System, welches durch die
%Transformationsmatrix T beschrieben wird.
%Der Vektor wird erst in das 0 KOS transformiert und
%anschliessend in das Tr System
testVektor = [20;4;8;0];

testVektortr = Tr\T*testVektor;
%im letzten Schritt wird der Vektor vom System Tr in das System T
%transformiert. Das Ergebnis sollte der urspruengliche Vektor
%sein
dTTr*testVektortr

%direkte Berechnung der Transformationsmatrix:
dTTrRechnung = inv(Tr\T);

%Berechnung der seltsamen Elemente aus dem Motorradmodell
xdz = dot(T(1:4,1),dTTrRechnung(1:4,3)) % liefert die Orientierung des gedrehten Systems
%also die Drehung des Ursprungs-KOS, das Ergebnis liefert die
%Transformationsmatrix des um dTTr veraenderten KOS