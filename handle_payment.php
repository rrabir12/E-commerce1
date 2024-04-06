<?php
include('server/connect.php');

// Check if the payment is successful
if (isset($_GET['success']) && $_GET['success'] === 'true') {
    $order_id = $_GET['order_id'];
    $amount = $_GET['amount'];
    $transaction_id = $_GET['transaction_id'];; // Assuming you receive transaction ID from Khalti

    // Your Khalti merchant API key
    $khalti_secret_key = 'test_secret_key_0b282699860c4f1fb9ecbca85eebd1dc';

    // Verify payment with Khalti
    $url = "https://khalti.com/api/v2/payment/verify/";
    $args = http_build_query(array(
        'token' => $_GET['token'], // Make sure to receive token from Khalti's onSuccess callback
        'amount' => $amount * 100, // Amount should be in paisa
    ));
    $headers = ['Authorization: Key ' . $khalti_secret_key];

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $args);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    // Execute the request
    $response = curl_exec($ch);
    $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    // Check if payment verification is successful
    if ($status_code === 200) {
        // Payment verified, update order status or do necessary actions
        // For example, update order status to "paid" in your database
        updateOrderStatus($order_id, 'paid');

        // Insert payment info into payments table
        $user_id = $_GET['order_id']; // Assuming you have a user ID, replace it with actual user ID
        
        $payment_date = date('Y-m-d H:i:s'); // Current date and time

        insertPaymentInfo($order_id, $user_id, $transaction_id, $payment_date);

        // Then redirect to a thank you page
        header('location: account.php?payment_message=paid successfully, thanks for shopping with us');
        exit();
    } else {
        // Payment verification failed
        echo "Payment verification failed. Response: $response, Status Code: $status_code";
    }
} else {
    // Payment not successful, handle accordingly
    echo "Payment not successful";
}

function updateOrderStatus($order_id, $order_status) {
    global $conn;

    // Prepare SQL statement
    $stmt = $conn->prepare("UPDATE orders SET order_status = ? WHERE order_id = ?");

    // Check for errors in prepare
    if(!$stmt) {
        // Handle error
        die('Error in preparing SQL statement: ' . $conn->error);
    }

    // Bind parameters and execute
    $stmt->bind_param('si', $order_status, $order_id);
    $stmt->execute();

    // Check for errors in execution
    if($stmt->error) {
        // Handle error
        die('Error in executing SQL statement: ' . $stmt->error);
    }

    // Close statement
    $stmt->close();
}

function insertPaymentInfo($order_id, $user_id, $transaction_id, $payment_date) {
    global $conn;

    // Prepare SQL statement
    $stmt = $conn->prepare('INSERT INTO payments (order_id, user_id, transaction_id, payment_date)
                            VALUES (?, ?, ?, ?)');

    // Check for errors in prepare
    if(!$stmt) {
        // Handle error
        die('Error in preparing SQL statement: ' . $conn->error);
    }

    // Bind parameters and execute
    $stmt->bind_param('iiss', $order_id, $user_id, $transaction_id, $payment_date);
    $stmt->execute();

    // Check for errors in execution
    if($stmt->error) {
        // Handle error
        die('Error in executing SQL statement: ' . $stmt->error);
    }

    // Close statement
    $stmt->close();
}
?>
