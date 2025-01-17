# Step 1: Use an official Python runtime as a parent image
FROM python:3.9-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements.txt (assuming you have one) to the container
COPY requirements.txt .

# Step 4: Install dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the entire Flask app into the container
COPY . .

# Step 6: Expose the port the app will run on (default Flask port is 5000)
EXPOSE 5000

# Step 7: Define the command to run the application (make sure to use gunicorn for production)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
