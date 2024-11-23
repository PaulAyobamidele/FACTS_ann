function plotResults(nw, resultPath, tag)
    % Plot and save voltage and convergence graphs
    hfig = figure;
    plot(nw, 'voltage');
    saveas(hfig, fullfile(resultPath, sprintf('%s_voltage.png', tag)));

    hfig = figure;
    plot(nw, 'convergence');
    saveas(hfig, fullfile(resultPath, sprintf('%s_convergence.png', tag)));
end
