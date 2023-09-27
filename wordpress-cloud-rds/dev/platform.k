import catalog.models.schema.v1 as ac

# platform.k declares customized configurations 
{{ .AppName }}: ac.AppConfiguration {
    database: {
        privateRouting = False

        # SubnetID defines the virtual subnet ID associated with the VPC that the rds
        # instance will be created in. The rds instance won't be created in user's own VPC
        # but in default VPC of cloud vendor, if this field is not provided.
        # subnetID = [your-subnet-id]
        
        # category = "serverless_basic"
    }
}
