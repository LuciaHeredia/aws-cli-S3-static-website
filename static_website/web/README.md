## To check that your static website works locally before uploading it to AWS S3:
- Open a terminal or command prompt.
- Navigate to the **web/** folder:
    ```
    $ cd <path/to/project-folder>/web
    ```
- Start the server (make sure to have **python3** installed):
    ```
    $ python3 -m http.server 8000 --directory templates
    ```
- Open your browser and go to: ``` http://localhost:8000 ```
