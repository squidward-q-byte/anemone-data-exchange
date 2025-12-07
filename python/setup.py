from setuptools import setup, find_packages

setup(
    name='anemone_data_exchange',
    version='0.1.0',
    author='',
    author_email='',
    description='A package to link data and models',
    long_description='',
    long_description_content_type='text/markdown',
    url='https://github.com/squidward-q-byte/anemone-data-exchange',

    packages=find_packages(), 

    install_requires=[
      "dataclasses-avroschema[pydantic]==0.66.2"
    ],

    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    
    python_requires='>=3.11',
)