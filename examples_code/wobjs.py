import numpy as np

rob1 = np.array([
    [-680.624, 1567.49, 823.009],  # ACADIA
    [2159.76, 1364.29, 84.5992],  # LightVault
    [2237.410, 1816.990, 148.863],  # lacing
    [2605.05, 1470.69, 365.893],  # ZeroWaste1
    [3103.33, 1481.11, 366.83],  # ZeroWaste2
])

rob2 = np.array([
    [-681.039, 1564.71, 817.284],  # ACADIA
    [2158.82, 1365.43, 84.5387],  # LightVault
    [2239.98, 1816.570, 150.477],  # lacing
    [2609.06, 1468.61, 366.785],  # ZeroWaste1
    [3107.65, 1478.91, 367.994],  # ZeroWaste2
])

print(np.linalg.norm(rob1 - rob2, axis=1))
