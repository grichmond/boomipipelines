# Introduction 
Boomi CICD for Azure Pipelines (boomiAzureDevOps)

# Getting Started

Boomi AtomSphere objects:

![img.png](resources/atomsphere-folder.png)

1. Elements to package and deploy
   1. API Services
   2. Main Processes:
      1. WSS: Dummy Fixed Reply (https://platform.boomi.com/AtomSphere.html#build;accountId=boomi_anthonyrabiaza-3IG5LK;components=d1950db7-4b49-40da-bd18-5a42f5b5ed5a)
      2. WSS: Dummy Request Reply (https://platform.boomi.com/AtomSphere.html#build;accountId=boomi_anthonyrabiaza-3IG5LK;components=48097b93-1f5a-4aab-8a5a-5c8b3bd5005d)
2. Elements for Unit Testing (will be deployed only on Dev)
   1. Unit Test Processes:
      1. Unit Test: Dummy
      2. Unit Test: Dummy 2
3. Component to configure
   1. Connection
      1. HTTP Connection in WSS: Dummy Request Reply

![img.png](resources/atomsphere-process-with-connection.png)

![img.png](resources/atomsphere-connection.png)

# Azure KeyVault Configuration

## Int-TestAtomCloud

```json
{
  "cicd_api_baseUrl": "https://test.connect.boomi.com",
  "cicd_api_user": "boomi_anthonyrabiaza-3IG5LK.2UMLTS",
  "cicd_api_password": "345bb795-7058-434c-9c3f-0000000000",
  "Connection.0947470a-1646-4f52-8dc0-c34bf87371c7.url": "https://run.mocky.io/v3/7aa2336d-3703-480c-a845-457d1a49fa59",
  "Connection.0947470a-1646-4f52-8dc0-c34bf87371c7.user": "specialuser",
  "Connection.0947470a-1646-4f52-8dc0-c34bf87371c7.password": "mySPEC!ALpassword@1"
}
```

## PreProd-VMWare

```json
{
  "cicd_api_baseUrl": "https://boomi.antsoftware.org",
  "cicd_api_user": "boomi_anthonyrabiaza-3IG5LK",
  "cicd_api_password": "4cc398bd-eb6a-4b29-8dc6-b4eb0f453e56",
  "cicd_api_dummy_apikey": "9e76cae4-f673-4553-9b48-0000000000",
  "Connection.0947470a-1646-4f52-8dc0-c34bf87371c7.url": "https://reqres.in/api/users",
  "Connection.0947470a-1646-4f52-8dc0-c34bf87371c7.password": "blabla123"
}
```