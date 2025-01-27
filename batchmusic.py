import boto3

# Inicializar o cliente DynamoDB
dynamodb = boto3.client('dynamodb', region_name='us-west-2')

# Dados para adicionar
batch_music = {
    "Music": [
        {
            "PutRequest": {
                "Item": {
                    "Artist": {"S": "Iron Maiden"},
                    "SongTitle": {"S": "Wasting Love"},
                    "AlbumTitle": {"S": "Fear of the Dark Live"},
                    "SongYear": {"S": "1992"}
                }
            }
        },
        {
            "PutRequest": {
                "Item": {
                    "Artist": {"S": "Iron Maiden"},
                    "SongTitle": {"S": "Weekend Warrior"},
                    "AlbumTitle": {"S": "Fear of the Dark"},
                    "SongYear": {"S": "1992"}
                }
            }
        },
        {
            "PutRequest": {
                "Item": {
                    "Artist": {"S": "Iron Maiden"},
                    "SongTitle": {"S": "Fear of the Dark"},
                    "AlbumTitle": {"S": "Fear of the Dark Tour"},
                    "SongYear": {"S": "1992"}
                }
            }
        }
    ]
}

# Função para adicionar itens em lote
def batch_write_music_items():
    try:
        response = dynamodb.batch_write_item(RequestItems=batch_music)
        print("Itens adicionados com sucesso:", response)
    except Exception as e:
        print("Erro ao adicionar itens:", e)

# Chamar a função
batch_write_music_items()
