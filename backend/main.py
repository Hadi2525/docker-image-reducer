from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

app = FastAPI()

# Mount the React build directory as static files
app.mount("/", StaticFiles(directory="static", html=True), name="static")

@app.get("/api/hello")
async def read_root():
    return {"message": "Hello from FastAPI!"}