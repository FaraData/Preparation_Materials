import pandas as pd
import numpy as np
from datetime import datetime, timedelta

# Parameters
num_rows = 50000
product_range = 1000
warehouse_range = 27
quantity_range = (1, 500)
start_date = datetime.now() - timedelta(days=730)  # last 2 years

# Generate data
data = {
    'inventoryID': np.arange(1, num_rows + 1),
    'productID': np.random.randint(1, product_range + 1, size=num_rows),
    'warehouseID': np.random.randint(1, warehouse_range + 1, size=num_rows),
    'quantity': np.random.randint(quantity_range[0], quantity_range[1] + 1, size=num_rows),
    'last_updated': [start_date + timedelta(days=int(x)) for x in np.random.randint(0, 730, size=num_rows)]
}

# Create DataFrame
df = pd.DataFrame(data)

# Optional: save to CSV
df.to_csv('inventory_20000.csv', index=False)

print(df.head())