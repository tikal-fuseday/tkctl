import setuptools
with open("README.md", "r") as fh:
    long_description = fh.read()
setuptools.setup(
     name='tkctl',  
     version='0.9',
     scripts=['tkctl'] ,
     author="Tikal Knowledge - Yoram Michaeli",
     author_email="yorammi@tikalk.com",
     description="help our Consultants to manages configuration profiles",
     long_description=long_description,
   long_description_content_type="text/markdown",
     url="https://github.com/tikal-fuseday/tkctl",
     packages=setuptools.find_packages(),
     classifiers=[
         "Programming Language :: Python :: 3",
         "License :: OSI Approved :: Apache Software License",
         "Operating System :: OS Independent",
     ],
 )