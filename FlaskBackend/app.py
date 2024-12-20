from flask import Flask, request, jsonify, send_file
import numpy as np
import pandas as pd
from io import BytesIO

app = Flask(__name__)

# Utility function to parse matrix input
def parse_matrices(data):
    if not isinstance(data, dict):
        raise ValueError("Invalid input: data must be a dictionary")
    
    # Check if 'matrixA' is always present
    if "matrixA" not in data:
        raise KeyError("'matrixA' is required in the payload")
    
    # Parse matrixA
    A = np.array(data["matrixA"])

    # Check if 'matrixB' is present for operations that require two matrices (addition, subtraction, multiplication)
    if "matrixB" in data:
        B = np.array(data["matrixB"])
    else:
        B = None

    return A, B


# def parse_matrices(data):
#     if not isinstance(data, dict):
#         raise ValueError("Invalid input: data must be a dictionary")
#     if "matrixA" not in data or "matrixB" not in data:
#         raise KeyError("Both 'matrixA' and 'matrixB' are required in the payload")
#     return np.array(data["matrixA"]), np.array(data["matrixB"])


# Endpoint: Matrix Addition
@app.route('/matrix/add', methods=['POST'])
def matrix_addition():
    try:
        # Parse JSON body
        data = request.get_json()
        if data is None:
            return jsonify({"error": "Invalid JSON body"}), 400
        
        # Extract and validate matrices
        A, B = parse_matrices(data)
        if A.shape != B.shape:
            return jsonify({"error": "Matrices must have the same shape for addition"}), 400
        
        # Perform addition
        result = np.add(A, B)
        return jsonify({"result": result.tolist()})
    
    except KeyError as e:
        return jsonify({"error": f"Missing key: {str(e)}"}), 400
    except ValueError as e:
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        return jsonify({"error": f"An unexpected error occurred: {str(e)}"}), 500


# Endpoint: Matrix Multiplication
@app.route('/matrix/multiply', methods=['POST'])
def matrix_multiplication():
    try:
        # Parse JSON body
        data = request.get_json()
        if data is None:
            return jsonify({"error": "Invalid JSON body"}), 400
        
        # Extract and validate matrices
        A, B = parse_matrices(data)
        if A.shape[1] != B.shape[0]:
            return jsonify({"error": "Number of columns in matrixA must equal the number of rows in matrixB"}), 400
        
        # Perform matrix multiplication
        result = np.matmul(A, B)
        return jsonify({"result": result.tolist()})
    
    except KeyError as e:
        return jsonify({"error": f"Missing key: {str(e)}"}), 400
    except ValueError as e:
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        return jsonify({"error": f"An unexpected error occurred: {str(e)}"}), 500


# Endpoint: Matrix Inversion
@app.route('/matrix/inverse', methods=['POST'])
def matrix_inversion():
    try:
        data = request.json
        A, _ = parse_matrices(data)
        if A.shape[0] != A.shape[1]:
            return jsonify({"error": "Matrix must be square for inversion"}), 400
        result = np.linalg.inv(A)
        return jsonify({"result": result.tolist()})
    except np.linalg.LinAlgError:
        return jsonify({"error": "Matrix is singular and cannot be inverted"}), 400
    except Exception as e:
        return jsonify({"error": str(e)}), 400

# Endpoint: Eigenvalues and Eigenvectors
@app.route('/matrix/eigen', methods=['POST'])
def matrix_eigen():
    try:
        data = request.json
        A, _ = parse_matrices(data)
        eigenvalues, eigenvectors = np.linalg.eig(A)
        return jsonify({
            "eigenvalues": eigenvalues.tolist(),
            "eigenvectors": eigenvectors.tolist()
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 400

# Endpoint: Export Results
@app.route('/matrix/export', methods=['POST'])
def export_results():
    try:
        data = request.json
        results = data.get("results")
        format_type = data.get("format", "csv").lower()

        if not results:
            return jsonify({"error": "No results to export"}), 400

        # Convert results to DataFrame
        df = pd.DataFrame(results)

        if format_type == "csv":
            output = BytesIO()
            df.to_csv(output, index=False)
            output.seek(0)
            return send_file(output, mimetype="text/csv", as_attachment=True, download_name="matrix_results.csv")
        
        elif format_type == "latex":
            latex_string = df.to_latex(index=False)
            return jsonify({"latex": latex_string})
        
        else:
            return jsonify({"error": "Unsupported format. Use 'csv' or 'latex'"}), 400

    except Exception as e:
        return jsonify({"error": str(e)}), 400

# Root Endpoint
@app.route('/')
def index():
    return jsonify({"message": "Matrix Operations API is running!"})

if __name__ == '__main__':
    app.run(debug=True)
