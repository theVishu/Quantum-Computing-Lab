#Student Projects /M24PR.ipynb
from qiskit import QuantumCircuit


qc = QuantumCircuit(2)
qc.x(0)
qc.draw("mpl")
print(qc.draw())