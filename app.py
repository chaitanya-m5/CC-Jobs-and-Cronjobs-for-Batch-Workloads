import os, sys, time, random, socket
from datetime import datetime

print(f"[{datetime.now()}] Batch app started on pod {socket.gethostname()}")

if os.getenv("FAIL") == "true":
    print("ERROR: simulated failure")
    sys.exit(1)

orders = [random.randint(100, 5000) for _ in range(1000)]
print(f"Processing {len(orders)} orders...")
time.sleep(5)
print(f"Total sales   : {sum(orders)}")
print(f"Average order : {sum(orders)/len(orders):.2f}")
print(f"Largest order : {max(orders)}")
print("Report generated successfully")