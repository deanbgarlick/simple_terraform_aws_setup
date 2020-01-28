sudo apt-get install python3-setuptools
sudo easy_install3 pip
sudo apt install unzip
pip install kaggle
git clone https://github.com/deanbgarlick/kaggle_all_state_data_set.git
cd kaggle_all_state_data_set
sleep 30; kaggle competitions download -c allstate-claims-severity
mv allstate-claims-severity.zip data
unzip data/allstate-claims-severity.zip -d data
