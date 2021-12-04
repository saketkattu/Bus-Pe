from typing import Text
import razorpay
from fastapi import FastAPI
import time
app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/verify/{payment_id}")
def read_item(payment_id: Text):
    client = razorpay.Client(auth=("rzp_test_pAHyhdxk2btam4", "0CoaX7MPFrYHnlwuQhhTu5Bz"))

    payment_id = payment_id

    resp = client.payment.fetch(payment_id)
    print(resp["status"])

    
    return {"status": resp["status"],"createdAt": time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(resp["created_at"]))}

