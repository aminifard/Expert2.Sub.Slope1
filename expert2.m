clc
clear 
close all
format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=input('Please enter the number of rows of matrix S:\n');
n=input('Please enter the number of columns of matrix S:\n');
d=input('Please enter the number of columns of matrix U:\n');
lamba=input('Please enter the lambda:\n');
filename = 'Book1.xlsx';
sheet = 1;
xlRange = 'A4:C19583';
St = xlsread(filename,sheet,xlRange);
[M,N]=size(St);
s=zeros(m,n);
for i=1:M
    s(St(i,1),St(i,2))=St(i,3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lt=xlsread(filename,'A44562:C69367');
[nl,ml]=size(Lt);
l1=zeros(n,d);
for i=1:nl
    l1(Lt(i,1),Lt(i,2))=Lt(i,3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ut=xlsread(filename,'A19587:C44554');
[nu,mu]=size(Ut);
u1=zeros(n,d);
for i=1:nu
    u1(Ut(i,1),Ut(i,2))=Ut(i,3);
end
[n,d]=size(u1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=zeros(n,d);
for i=1:n
    f(i)=1+lambda*sum(s(:,i));
end
for i=1:d
u=u1(:,i);
l=l1(:,i);
Aeq=[];
beq=[];
b=zeros(m,1);
%f=ones(n,1);
x=linprog(f,[],[],s,b,l,u);
v(:,i)=x;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ss=s*v;
p=0;
for i=1:d
    if sum(ss(:,i)==0)==m
        p=p+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'output.xlsx';
A = v;
xlswrite(filename,A)
