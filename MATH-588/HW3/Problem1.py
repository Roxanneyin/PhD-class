import numpy as np
import math
import matplotlib.pyplot as plt

N = 100
p = 0.991
alpha = [i/N for i in range(N)]
Ent = [(math.log(np.exp(a*(-50))*p + np.exp(a*1000)*(1-p))/a) for a in alpha]

plt.plot(alpha,Ent)
plt.show()