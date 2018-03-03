import tensorflow as tf
import matplotlib.pyplot as plt
import os
import numpy as np
import csv
import string
import requests
import io
from zipfile import ZipFile
from tensorflow.contrib import learn

sess = tf.Session()

save_file_name = os.path.join('temp', 'temp_spam_data.csv')
if os.path.isfile(save_file_name):
    text_data = []
    with open(save_file_name, 'r') as temp_output_file:
        reader = csv.reader(temp_output_file)
        for row in reader:
            text_data.append(row)
else:
    zip_url = 'http://archive.ics.uci.edu/ml/machine-learning-databases/00228/smsspamcollection.zip'
    r = requests.get(zip_url)
    z = ZipFile(io.BytesIO(r.content))
    file = z.read('SMSSpamCollection')
    text_data = file.decode()
    text_data = text_data.encode('ascii', errors='ignore')
    text_data = text_data.decode().split('\n')
    text_data = [x.split('\t') for x in text_data if len(x) >= 1]

    with open(save_file_name, 'w') as temp_output_file:
        writer = csv.writer(temp_output_file)
        writer.writerows(text_data)
    texts = [x[1] for x in text_data]
    target = [x[0] for x in text_data]
    target = [1 if x=='spam' else 0 for x in target]
    texts = [x.lower() for x in texts]
    texts = [''.join(c for c in x if c not in string.punctuation) for x in texts]
    texts = [''.join(c for c in x if c not in string.digits) for x in texts]
    texts = [' '.join(x.split()) for x in texts]

    text_lengths = [len(x.split()) for x in texts]
    text_lengths = [x for x in text_lengths if x < 50]
    plt.hist(text_lengths, bins=25)
    plt.title('Histogram of # of words in Texts')
    plt.show()
    sentence_size = 25
    min_word_freq = 3
