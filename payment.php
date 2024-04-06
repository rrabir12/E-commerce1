<?php include('layouts/header.php') ?>

<?php

if (isset($_POST['order_pay_btn'])) {
    $order_status = $_POST['order_status'];
    $total_order_price = $_POST['total_order_price'];
    $product_name=$_POST['product_name'];
    $product_id=$_POST['product_id'];
}

if(isset($_GET['product_id']) && isset($_GET['product_name'])) {
    // Retrieve product ID and name from URL
    $product_id = $_GET['product_id'];
    $product_name = $_GET['product_name'];
}
?>

<!-- payment -->
<section class="my-5 py-5">
    <div class="container text-center mt-3 pt-5">
        <h2 class="form-weight-bold">Payment</h2>
        <hr>
    </div>
    <div class="mx-auto container text-center">
        <?php if (isset($_POST['order_status']) && $_POST['order_status'] == "not paid") { ?>
            <?php $amount = strval($_POST['total_order_price']); ?>
            <?php $order_id = $_POST['order_id']; ?>
            <p>Total payment: Rs <?php echo $_POST['total_order_price']; ?></p>
            <!-- <p>name: <?php echo $product_name; ?></p> -->
            <button id="payment-button">Pay with Khalti</button>
        <?php } else if (isset($_SESSION['total']) && $_SESSION['total'] != 0) { ?>
            <?php $amount = strval($_SESSION['total']); ?>
            <?php $order_id = $_SESSION['order_id']; ?>
            <p>Total payment : Rs <?php echo $_SESSION['total']; ?></p>
            <!-- <p>name: <?php echo $product_id; ?></p> -->
            <button id="payment-button">Pay with Khalti</button>
        <?php } else { ?>
            <p>You don't have an order</p>
        <?php } ?>
    </div>
</section>

<!-- Include Khalti Checkout script -->
<script src="https://khalti.s3.ap-south-1.amazonaws.com/KPG/dist/2020.12.17.0.0.0/khalti-checkout.iffe.js"></script>

<!-- JavaScript code -->
<script>
    var config = {
        // Replace the publicKey with yours
        "publicKey": "test_public_key_53f7a51ef8ae4de5b85676f01f13f12b",
        "productIdentity": "<?php echo $product_id; ?>",
        "productName": "<?php echo $product_name; ?>",
        "productUrl": "http://localhost:8000/single_product.php?product_id=<?php echo $product_id; ?>",
        "paymentPreference": [
            "KHALTI",
            "EBANKING",
            "MOBILE_BANKING",
            "CONNECT_IPS",
            "SCT",
        ],
        "eventHandler": {
            onSuccess(payload) {
                console.log(payload);
                // Redirect to handle_payment.php with transaction details
                window.location.href = "handle_payment.php?success=true&order_id=<?php echo $order_id; ?>&amount=<?php echo $amount; ?>&token=" + payload.token + "&transaction_id=" + payload.idx;
            },
            onError(error) {
                console.log(error);
            },
            onClose() {
                console.log('widget is closing');
            }
        }
    };

    var checkout = new KhaltiCheckout(config);
    var btn = document.getElementById("payment-button");
    btn.onclick = function() {
        // Minimum transaction amount must be 10, i.e., 1000 in paisa.
        checkout.show({
            amount: <?php echo $amount * 100; ?>
        });
    }
</script>


<!-- footer -->
<?php include('layouts/footer.php') ?>
