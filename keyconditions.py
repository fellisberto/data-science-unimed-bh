import boto3

# Inicializar o cliente DynamoDB
dynamodb = boto3.client('dynamodb', region_name='us-west-2')

# Condições de chave para a consulta
key_conditions = {
    ":artist": {"S": "Iron Maiden"},
    ":title": {"S": "Weekend Warrior"}
}

# Função para consultar itens
def query_music_items():
    try:
        response = dynamodb.query(
            TableName='Music',
            KeyConditionExpression='Artist = :artist AND SongTitle = :title',
            ExpressionAttributeValues=key_conditions
        )
        print("Itens encontrados:", response['Items'])
    except Exception as e:
        print("Erro ao consultar itens:", e)

# Chamar a função
query_music_items()