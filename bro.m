function [x] = bro(weight)
%Calculate

if weight < 45
    disp('do you even lift?') 
    return
elseif mod(weight,5) ~= 0
    disp('not possible') 
    return
end

f = ones(6,1);
intcon = 1:6;
Aeq =  2*[45;35;25;10;5;2.5]';
beq = weight-45;
lb = zeros(6,1);
lb(1) = floor((weight-45)/90); %require 45lb for respekt
ub = [Inf,Inf,Inf,Inf,Inf,Inf];
options = optimoptions('intlinprog','Display','off');
x = intlinprog(f,intcon,[],[],Aeq,beq,lb,ub,[],options);

disp('On each side place...')
disp([num2str(x(1)), 'x 45lb']);
disp([num2str(x(2)), 'x 35lb']);
disp([num2str(x(3)),'x 25lb']);
disp([num2str(x(4)),'x 10lb']);
disp([num2str(x(5)),'x 5lb']);
disp([num2str(x(6)),'x 2.5lb']);

end

 
% %iterative code. much faster unless weights > 1e9 lbs

% ws = zeros(6,1);
% wt = [45,35,25,10,5,2.5];
% m=weight/2 - 22.5;
% 
% i = 1;
% if m>=0
%     while m> 0
%         if m >= wt(i)
%             ws(i) = ws(i) + 1;
%             m = m - wt(i);
%         end
%         
%         if m < wt(i)
%             i = i + 1;
%         end
%         
%     end
% end
% x = ws;

            




