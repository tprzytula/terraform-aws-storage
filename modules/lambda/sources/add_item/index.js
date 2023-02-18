const { randomUUID } = require("crypto");
const { DynamoDBClient, PutItemCommand } = require("@aws-sdk/client-dynamodb");
const client = new DynamoDBClient({ region: "eu-west-2" });

const addItem = async ({ name, quantity, form }) => {
  const id = randomUUID();

  const command = new PutItemCommand({
    TableName: "items",
    Item: {
      id: { S: id },
      name: { S: name },
      quantity: { N: `${quantity}` },
      form: { S: form },
    },
  });

  await client.send(command);
};

exports.handler = async (event, _context, callback) => {
  console.info("Event received", event);

  const { name, quantity, form } = JSON.parse(event.body);

  console.info("Adding name: ", name, "quantity:", quantity, "form:", form);

  try {
    await addItem({ name, quantity, form });

    callback(null, { statusCode: 201, body: "Item has been added" });
  } catch (error) {
    console.log("Encountered error:", error);
    callback(null, { statusCode: 500 });
  }
};
