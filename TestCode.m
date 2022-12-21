
fotolist = ["Covid-19_Test.png", "Healthy_Test.png", "Pneumonia_Test.png"];


for i = 1 : length(fotolist)
    I = imread(strcat("./Test_src/", fotolist(i)));

    if length(size(I)) < 3
        I = repmat(I, [1 1 3]);
    end

    I = imresize(I, trainedNetwork_1.Layers(1).InputSize(1:2));

    [YPred,probs] = classify(trainedNetwork_1, I);



    figure('Name', extractBefore(fotolist(i), strlength(fotolist(i)) - 3)), imshow(I);
    label = strrep(string(YPred(1)), '_', '-');
    title(string(label) + ",   " + num2str(100*max(probs),3) + "%");
    grid
end

