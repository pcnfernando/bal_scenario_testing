import ballerina/log;
import ballerina/grpc;

public function main(string... args) {
    orderManagementClient orderMgtEp = checkpanic new ("http://localhost:9090");




    log:print("Order creation");
    orderInfo order1 = {
        orderId: "01A",
        customer: "Chiran",
        description: "ItemA: 40, ItemB:50",
        paymentStatus: "Pending"
    };
    string|grpc:Error result1 = orderMgtEp->createOrder(order1);
    logSuccessOrFailure(result1);

    orderInfo order2 = {
        orderId: "02A",
        customer: "Gima",
        description: "ItemA: 50, ItemB:60",
        paymentStatus: "Pending"
    };
    string|grpc:Error result2 = orderMgtEp->createOrder(order2);
    logSuccessOrFailure(result2);

    orderInfo|grpc:Error result3 = orderMgtEp->retrieveOrder(order1.orderId);
    logSuccessOrFailure(result3);

    if (result3 is orderInfo) {
        result3.paymentStatus = "Successful";
        string|grpc:Error result4 = orderMgtEp->updateOrder(result3);
        logSuccessOrFailure(result3);
    }

    orderInfo|grpc:Error result4 = orderMgtEp->retrieveOrder(order1.orderId);
    logSuccessOrFailure(result4);

}

function logSuccessOrFailure(any|grpc:Error resp) {
    if (resp is grpc:Error) {
        log:printError("Error from server");
    } else {
        log:print("Successful content recieved");
        log:print(resp.toString());
    }
}
