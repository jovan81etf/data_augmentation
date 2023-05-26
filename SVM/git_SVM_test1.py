# SVM experiment for Fig. 7


PATH_WAV_aug = 'C:/HTK/TOPGS/base/an4/wav/augn_TST_mat' # path to augmentation database
PATH_WAV_test = 'C:/HTK/TOPGS/base/an4/wav/an4_clstk' # path to test database

import numpy as np
import pandas as pd
from python_speech_features import mfcc
from python_speech_features import delta
from python_speech_features import logfbank
from sklearn import svm, preprocessing
from sklearn.model_selection import train_test_split
import random

import scipy.io.wavfile as wav

# cepstral mean normalization
def cms_matrica(ulaz):
    transp = ulaz.T
    for i in range (0, len(transp[0])):
        transp[i] = transp[i] - np.mean(transp[i])
        cms = transp.T
    return(cms)

def mfcc_fajl(file, N):
   
    K = 3 # overlap coefficient
    (rate,sig) = wav.read(file)
    duration = len(sig)/rate + 0.001  
   
    # segmentation on fixed number of windows
    ws = duration * K/(N + K -1)
    Fp = ws / K
    mfcc_s = mfcc(sig, rate, ws, Fp)  # static coefficients
    mfcc_d = delta (mfcc_s, 2)
    mfcc_dd = delta (mfcc_d, 2)
   
    _mfcc = np.column_stack((mfcc_s, mfcc_d, mfcc_dd)) # dynamic coefficients
    _mfcc_cms = cms_matrica(_mfcc)  
    return(_mfcc_cms)

def poravnaj(matrica):
    duzina = 702
    poravnata = np.reshape(matrica, duzina)
    return poravnata

#  **************************  TRAINING PART  ***********************************************

govornik = 102  # speaker for test from {101,102,103,104,105,106,109,110,111,112} DB1 database

mod_train = 'n' # n for normal and s for whisper
mod_test = 'n'

X = [] * 702

y = []

train_num = 10 
train_sample = train_num * 500
test_sample = 100

govornik_seq = [2,6,7,8,9,14,15,16,18,19] # sequence for training speakers
train_seq = random.sample([1,2,3,4,5,6,7,8,9,10],train_num) 
indeks = 0

for k in govornik_seq:
        for i in range (1,7):    # Colors (words from Whi-Spe)
            for j in train_seq:
                fajl_wav = PATH_WAV_aug + '/boja{0}_{1}_{2}'.format(i,k,j) + mod_train + '.wav'
                obelezje = mfcc_fajl(fajl_wav, 18)
                obelezje_poravnato = poravnaj(obelezje)
                X1 = preprocessing.scale(obelezje_poravnato)
                X = np.append(X, X1, axis = 0)
                labela = [i]
                y = np.append(y, labela, axis = 0)
                indeks = indeks +1
               
       
        for i in range (1,15):    #Numbers (words from Whi-Spe)
            for j in train_seq:
                fajl_wav = PATH_WAV_aug + '/broj{0}_{1}_{2}'.format(i,k,j) + mod_train + '.wav'
                obelezje = mfcc_fajl(fajl_wav, 18)
                obelezje_poravnato = poravnaj(obelezje)
                p = i + 6
                X1 = preprocessing.scale(obelezje_poravnato)
                X = np.append(X, X1, axis = 0)
                labela = [p]
                y = np.append(y, labela, axis = 0)
                indeks = indeks + 1
                 
        for i in range (1,31): #Balanced words (words from Whi-Spe)
            for j in train_seq:
                fajl_wav = PATH_WAV_aug + '/rec{0}_{1}_{2}'.format(i,k,j) + mod_train + '.wav'
                obelezje = mfcc_fajl(fajl_wav, 18)
                obelezje_poravnato = poravnaj(obelezje)
                q = i + 20
                X1 = preprocessing.scale(obelezje_poravnato)
                X = np.append(X, X1, axis = 0)
                labela = [q]
                y = np.append(y, labela, axis = 0)
                indeks = indeks + 1
                
X_obuka = np.reshape(X, (train_sample,-1)) # training vectors
y_obuka = y  # labels

X_train, X_test_old, y_train, y_test_old = train_test_split(X_obuka, y_obuka, train_size= train_sample-1)

clf = svm.SVC(kernel = 'rbf')

clf.fit(X_train, y_train)

# SVM model
clf = svm.SVC(kernel = 'rbf')

clf.fit(X_train, y_train)

#  **************************  TEST PART   ***********************************************

X = [] * 702

y = []

indeks = 0
for i in range (1,7):    # Colors (words from Whi-Spe)
     for j in range(1, 3):
        fajl_wav = PATH_WAV_test + '/boja{0}_{1}_{2}'.format(i,govornik,j) + mod_test + '.wav'
        obelezje = mfcc_fajl(fajl_wav, 18)
        obelezje_poravnato = poravnaj(obelezje)
        X1 = preprocessing.scale(obelezje_poravnato)
        X = np.append(X, X1, axis = 0)
        labela = [i]
        y = np.append(y, labela, axis = 0)
        indeks = indeks +1

      
         
for i in range (1,15):    #Numbers (words from Whi-Spe)
     for j in range(1, 3):
        fajl_wav = PATH_WAV_test + '/broj{0}_{1}_{2}'.format(i,govornik,j) + mod_test + '.wav'
        obelezje = mfcc_fajl(fajl_wav, 18)
        obelezje_poravnato = poravnaj(obelezje)
        p = i + 6
        X1 = preprocessing.scale(obelezje_poravnato)
        X = np.append(X, X1, axis = 0)
        labela = [p]
        y = np.append(y, labela, axis = 0)
        indeks = indeks + 1

         
for i in range (1,31): #Balanced words (words from Whi-Spe)
     for j in range(1, 3):
        fajl_wav = PATH_WAV_test + '/rec{0}_{1}_{2}'.format(i,govornik,j) + mod_test + '.wav'
        obelezje = mfcc_fajl(fajl_wav, 18)
        obelezje_poravnato = poravnaj(obelezje)
        q = i + 20
        X1 = preprocessing.scale(obelezje_poravnato)
        X = np.append(X, X1, axis = 0)
        labela = [q]
        y = np.append(y, labela, axis = 0)
        indeks = indeks + 1

        
X_test = np.reshape(X, (test_sample,-1))
y_test = y

X_train_old, X_test, y_train_old, y_test = train_test_split(X_test, y_test, test_size = test_sample-1)

# Calculating accuracy
accuracy = clf.score(X_test, y_test)

print(accuracy)
