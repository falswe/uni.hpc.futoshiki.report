#!/usr/bin/env python3
"""Generate performance graphs for the Futoshiki solver report."""

import matplotlib.pyplot as plt
import numpy as np
import os

# Create images directory
os.makedirs('images', exist_ok=True)

# Generate placeholder graphs
fig, ax = plt.subplots(figsize=(6, 4))
x = np.array([1, 2, 4, 8, 16, 32, 64])
y = x * 0.9  # Example speedup

ax.plot(x, x, 'k--', label='Ideal')
ax.plot(x, y, 'ro-', label='Actual')
ax.set_xlabel('Number of Processes')
ax.set_ylabel('Speedup')
ax.set_title('Speedup Chart')
ax.legend()
ax.grid(True, alpha=0.3)

plt.savefig('images/speedup_chart.png', dpi=300, bbox_inches='tight')
plt.savefig('images/speedup_chart.pdf', bbox_inches='tight')

print("Placeholder graphs generated in images/")
print("Replace with actual performance data!")
