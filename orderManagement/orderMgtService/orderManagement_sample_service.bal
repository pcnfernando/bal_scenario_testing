import ballerina/log;
import ballerina/grpc;

map<orderInfo> orderMap = {};

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {
    descriptor: ROOT_DESCRIPTOR,
    descMap: getDescriptorMap()
}
service "orderManagement" on ep {

    remote function createOrder(orderInfo value) returns string|error {
        string orderId = value.orderId;
        string customer = value.customer;
        string description = value.description;
        string paymentStatus = value.paymentStatus;

        if (!orderMap.hasKey(orderId)) {
            string orderStr = "Order created for " + customer + ". Details:" + description + " Payment Status:" + 
            paymentStatus;
            orderMap[orderId] = value;
            log:print(orderStr);
            return orderStr;
        } else {
            string errorStr = "Order with id:" + orderId + " already exists!";
            log:printError(errorStr);
            return error(errorStr);
        }
    }

    remote function retrieveOrder(string value) returns orderInfo|error? {
        if (orderMap.hasKey(value)) {
            return orderMap[value];
        } else {
            string errorStr = "Order not found for if:" + value;
            log:printError(errorStr);
            return error(errorStr);
        }
    }

    remote function updateOrder(orderInfo value) returns string|error {
        string orderId = value.orderId;
        if (orderMap.hasKey(orderId)) {
            orderMap[orderId] = value;
            return "Order with id:" + orderId + " updated successfully";
        } else {
            string errorStr = "Order with id:" + orderId + " not found";
            log:printError(errorStr);
            return error(errorStr);
        }
    }

    remote function deleteOrder(string value) returns string|error {
        if (orderMap.hasKey(value)) {
            _ = orderMap.remove(value);
            return "Order with id:" + value + " deleted successfully";
        } else {
            string errorStr = "Order with id:" + value + " not found";
            log:printError(errorStr);
            return error(errorStr);
        }
    }
}
