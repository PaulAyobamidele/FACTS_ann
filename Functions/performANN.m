function performANN(nw)
    % Perform ANN Analysis
    [P, T] = ANN_Data();
    hiddenLayerSize = [10, 10, 10];
    net = fitnet(hiddenLayerSize);
    net.divideParam.trainRatio = 0.7;
    net.divideParam.valRatio = 0.15;
    net.divideParam.testRatio = 0.15;

    [net, ~] = train(net, P, T);
    y = net([nw.Bus.V]);
    [~, ind] = max(y(:));
    fprintf('Optimal FACTS device placement index: %d\n', ind);
end
