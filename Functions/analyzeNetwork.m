function analyzeNetwork(networkFile, resultPath, tag)
    % Analyze a given network file and log results
    
    fprintf('Analyzing network: %s\n', networkFile);
    
    % Load network data
    data = NetworkExtract(networkFile);
    busdata = data.BusData; linedata = data.LineData;
    busdata(:, 5:8) = busdata(:, 5:8) / data.Basemva;
    linedata(:, end-1) = 0.5 * linedata(:, end-1);
    
    % Create network object
    nw = power.Network('BusData', busdata, ...
        'LineData', linedata, ...
        'Basemva', data.Basemva, ...
        'BusNames', data.BusNames, ...
        'Shunt', data.ShuntData, ...
        'Fact', data.FACT, ...
        'Generatordata', data.GenData, ...
        'MaxIter', 500, ...
        'Tolerance', 1e-8, ...
        'LoadFlowAlgorithm', 'NR', ...
        'OutputDir', resultPath, ...
        'Log', sprintf('%s_log.txt', tag));
    
    % Perform Load Flow Analysis
    loadFlow(nw);
    log(nw);
    
    % Plot results
    plotResults(nw, resultPath, tag);
    
    % Perform ANN Analysis
    performANN(nw);
    
    % FACTS device placement
    placeFACTS(nw, networkFile, 'STATCOM', resultPath);
    placeFACTS(nw, networkFile, 'UPFC', resultPath);
end
