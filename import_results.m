close all

%Import results

predictions = csvread('../results/predictions.csv');
preds = csvread('../results/preds.csv');
y_test = csvread('../results/y_test.csv');
y_train = csvread('../results/y_train.csv');
