import matplotlib.pyplot as plt
import numpy as np

def plot_EL_DT():
	acc_of_ELKNN = [0.92096, 0.92612, 0.9244, 0.92784, 0.93127, 0.93299]
	acc_of_ELLDA = [0.84192, 0.86426, 0.87629, 0.87801, 0.89003, 0.89347]
	acc_of_ELSVM = [0.95533, 0.95704, 0.95704, 0.9622, 0.96392, 0.9622]
	acc_of_ELNB = [0.97031,	0.97031, 0.96875, 0.96875, 0.97188, 0.97232]
	acc_of_ELDT = [0.94845,	0.96564, 0.9622, 0.97079, 0.97251, 0.97423]
	acc_of_ELML = [0.91065,	0.9433,	0.96735, 0.96564, 0.96564, 0.96735]

	dataType = ["EL-KNN", "EL-LDA", "EL-SVM", "EL-NB", "EL-DT", "EL-HW"]

	fig, ax = plt.subplots()
	ax.set_xlabel("Counts of Ensemble learning")
	ax.set_ylabel("acc")
	# ax.set_xlim((5, 35))
	ax.plot(np.arange(5, 35, 5), acc_of_ELKNN, label="EL-KNN", marker = '*')
	ax.plot(np.arange(5, 35, 5), acc_of_ELLDA, label="EL-LDA", marker = 'o')
	ax.plot(np.arange(5, 35, 5), acc_of_ELSVM, label="EL-SVM", marker = '+')
	ax.plot(np.arange(5, 35, 5), acc_of_ELNB, label="EL-NB", marker = 's')
	ax.plot(np.arange(5, 35, 5), acc_of_ELDT, label="EL-DT", marker = 'p')
	ax.plot(np.arange(5, 35, 5), acc_of_ELML, label="EL-HW", marker = 'x')
	# ax.set_ylim(0.7, 1.0)
	ax.legend()
	plt.show()

plot_EL_DT()