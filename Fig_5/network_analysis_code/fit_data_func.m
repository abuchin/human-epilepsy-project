function [fit_params] = fit_data_func(nn, win_max_left, win_max_right, bins, f_sp, fit_func)

fit_params = zeros(length(win_max_left{nn}), 3);

for j=1:length(win_max_left{nn})
    clear x y f
    x = [win_max_left{nn}(j):1:win_max_right{nn}(j)]';
    %x = bins{j}(win_max_left{nn}(j):1:win_max_right{nn}(j))';
    y = [f_sp{nn}(win_max_left{nn}(j):1:win_max_right{nn}(j))];
    
    f = fit(x, y, fit_func);
    fit_params(j, 1) = f.a1;
    fit_params(j, 2) = f.b1;
    fit_params(j, 3) = f.c1;
    
%        figure; set(gcf,'color','w');
%        plot(x,y); hold on;
%        plot(f,x,y);
%        box off;
end
