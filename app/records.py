from pymongo import MongoClient
from datetime import datetime

user = 'nimda'
password = 'blahblah'
host = 'mongodb-service'
port = '27017'
conn_string = f'mongodb://{user}:{password}@{host}:{port}'

db = MongoClient(conn_string).blog

def insert_records():
    mylist = [
        {"title": "Queenie", "author": "Candice Carty-Williams", "createdAt": datetime.now()},
        {"title": "Flâneuse", "author": "Lauren Elkin", "createdAt": datetime.now()},
        {"title": "Misery", "author": "Stephen King", "createdAt": datetime.now()},
        {"title": "Ash", "author": "Malinda Lo", "createdAt": datetime.now()},
        {"title": "Annihilation & Borne", "author": "Jeff VanderMeer", "createdAt": datetime.now()},
        {"title": "Wanderers", "author": "Chuck Wendig", "createdAt": datetime.now()},
        {"title": "The Devil Wears Prada", "author": "Lauren Weisberger", "createdAt": datetime.now()}     
    ]
    
    db.posts.insert_many(mylist)
    
if __name__ == "__main__":
    insert_records()