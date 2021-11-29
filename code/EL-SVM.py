import numpy as np
from typing import List
from sklearn import datasets
from sklearn import svm
from scipy import stats
from sklearn import model_selection
import pandas as pd
from sklearn.preprocessing import LabelEncoder
import time
from sklearn import metrics

# dataPath = r'D:\武纺\生信\7月20\code\data\dataset\Darmanis'
dataPath = r'E:\bioinformatics\DataSet\gene\Baron-human1'
# dataPath = r'E:\bioinformatics\DataSet\gene\Baron-human2'
# dataPath = r'E:\bioinformatics\DataSet\gene\Baron-human3'
# dataPath = r'E:\bioinformatics\DataSet\gene\Baron-human4'
# dataPath = r'E:\bioinformatics\DataSet\gene\Baron-mouse1'
# dataPath = r'E:\bioinformatics\DataSet\gene\Baron-mouse2'

# dataPath = r'E:\bioinformatics\DataSet\gene\PBMC'

# def load_data():
# 	'''
# 	加载数据集并返回数据集的划分模型
# 	:return: x_train, x_test, , y_train, y_test
# 	'''
# 	# data = np.loadtxt(dataPath + r'\Test_13_Darmanis.txt')
# 	# labels = np.loadtxt(dataPath + r'\Test_13_Darmanis_label.txt')
# 	with open(dataPath + r'\PBMC.csv') as f:
# 		data = pd.read_csv(f)
#
# 	data = data.T.values
# 	# print(data.shape)
# 	with open(dataPath + r'\PBMClabel.txt') as f:
# 		labels = np.loadtxt(f, dtype = int)
#
# 	# print(labels)
#
# 	return model_selection.train_test_split(data, labels, train_size = 0.67)

def load_data():
	'''
	加载数据集并返回数据集的划分模型
	:return: x_train, x_test, , y_train, y_test
	'''
	with open(dataPath + r'\GSM2230757_human1.csv') as f:
		data = pd.read_csv(f, index_col=0)

	data = data.T.values
	# print(data.shape)
	with open(dataPath + r'\GSM2230757label.txt') as f:
		labels = np.loadtxt(f, dtype=str)

	le = LabelEncoder()  # 创建LebelEncoder对象
	le.fit(labels)
	"""
	Fit label encoder.
	Parameters
	----------
	y : array-like of shape (n_samples,)
		Target values.
	Returns
	-------
	self : returns an instance of self.
	"""
	labels = le.transform(labels)  # 将标签转换为数字

	# print(labels.shape)

	return model_selection.train_test_split(data, labels, train_size = 0.7)

def random_sub_sample(x, y, k):
	size = int(x.shape[0] * k)
	'''
	:param x: dataSet
	:param y: dataLabels
	:param k: optional, dim of random_sub_sanmple
	:return: a sub sample and sub labels
	'''
	# 合并数据集和标签便于抽取
	dataSet = np.insert(x, 0, values = y, axis = 1)

	# 抽样
	np.random.shuffle(dataSet)
	sub_dataSet = dataSet[:size, :]

	# 抽取出标签
	labels = sub_dataSet[:, 0]
	# 还原数据集
	# print(sub_dataSet.shape)
	sub_dataSet = np.delete(sub_dataSet, 0, axis = 1)

	return sub_dataSet, labels

def relatively_ensemble_SVM(x_train, y_train, x_test, y_test, cnt) -> List:
	'''
	Ensemble KNN
	:param x_train:训练数据集
	:param y_train:训练标签
	:param x_test:测试集
	:param y_test:测试集标签
	:param k:K个最近邻
	:param cnt:集成次数
	:return:最终的预测结果
	'''
	pre_of_x_test, finally_pre = [], []
	print("集成 %d 次，" % cnt, end = '')
	for i in range(cnt):
		# 采样
		sub_x_train, sub_y_train = random_sub_sample(x_train, y_train, 0.3 + i * 0.02)
		# 训练
		# print("开始第 %d 次训练" % (i + 1))
		model = svm.SVC(C=1.0, kernel='linear')
		model.fit(sub_x_train, sub_y_train)
		# print("第 %d 次训练测试集得分：" % (i + 1), model.score(x_test, y_test))
		pre_of_x_test.append(model.predict(x_test))

	# to np.narray
	pre_of_x_test = np.array(pre_of_x_test)
	# 软投票
	# print("多数投票")
	for i in range(len(pre_of_x_test[0])):
		vector = pre_of_x_test[:, i]
		finally_pre.append(stats.mode(vector)[0][0])

	return finally_pre

if __name__ == "__main__":
	start = time.time()
	x_train, x_test, y_train, y_test = load_data()
	for i in range(5, 35, 5):
		pre = relatively_ensemble_SVM(x_train, y_train, x_test, y_test, i)
		end = time.time()
		errArray = np.mat(np.ones((len(y_test), 1)))
		print("正确率为：%.3f %%" % ((errArray[pre == y_test].sum() / len(pre)) * 100))
	# 	print("NMI score: {:.5f}".format(metrics.normalized_mutual_info_score(pre, y_test)))
	# 	print("ARI score: {:.5f}".format(metrics.adjusted_rand_score(pre, y_test)))
	# 	print("AMI score: {:.5f}".format(metrics.adjusted_mutual_info_score(pre, y_test)))
	# 	print("time span:", end - start)
	# pre = relatively_ensemble_SVM(x_train, y_train, x_test, y_test, 10)
	# end = time.time()
	# errArray = np.mat(np.ones((len(y_test), 1)))
	# print("正确率为：%.3f %%" % ((errArray[pre == y_test].sum() / len(pre)) * 100))
	# print("NMI score: {:.4f}".format(metrics.normalized_mutual_info_score(pre, y_test)))
	# print("ARI score: {:.4f}".format(metrics.adjusted_rand_score(pre, y_test)))
	# print("AMI score: {:.4f}".format(metrics.adjusted_mutual_info_score(pre, y_test)))
	# print("time span:", end - start)