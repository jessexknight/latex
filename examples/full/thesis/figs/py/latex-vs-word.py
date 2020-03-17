import numpy as np
import matplotlib.pyplot as plt
plt.rc('text',usetex=True)
plt.rc('font',family='serif',serif=['computer modern roman'],size=18)
t = np.linspace(0,2,256)
latex = t**(1/3)
word = t**3
plt.plot(t,latex)
plt.plot(t,word)
eps = 0.02
plt.ylim(0-eps,2+eps)
plt.xlim(0-eps,2+eps)
plt.yticks([])
plt.xticks([])
# plt.axis('equal')
plt.xlabel('Document Complexity \& Size')
plt.ylabel('Effort \& Time')
plt.legend(['\LaTeX','MS Word'])
plt.savefig('../latex-vs-word.eps')
# plt.show()
