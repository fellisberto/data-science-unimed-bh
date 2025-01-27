import boto3

# Inicializar o cliente DynamoDB
dynamodb = boto3.client('dynamodb', region_name='us-west-2')

# Dados do item para adicionar
item_music = {
    "Artist": {"S": "Iron Maiden"},
    "SongTitle": {"S": "Chains of Misery"},
    "AlbumTitle": {"S": "Fear of the Dark"},
    "SongYear": {"S": "1992"}
}

# Função para adicionar um item
def put_music_item():
    try:
        response = dynamodb.put_item(TableName='Music', Item=item_music)
        print("Item adicionado com sucesso:", response)
    except Exception as e:
        print("Erro ao adicionar item:", e)

# Chamar a função
put_music_item()
