#!/bin/bash
java -cp "$BOOMI_LIBRARIES/*" -Daws.accessKeyId="$AWS_ACCESS_KEY" -Daws.secretKey="$AWS_SECRET_ACCESS_KEY" -Dimporter="${importer}" -DimporterParams="${importerParams}" -Dexporter="${exporter}" -DexporterParams="${outputFile}" com.boomi.proserv.security.secretmanager.BoomiSecretManager
