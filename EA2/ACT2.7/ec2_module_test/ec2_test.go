package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEC2Infrastructure(t *testing.T) {
	t.Parallel()

	vpcDir := "../vpc_module"
	terraformOptions := &terraform.Options{
		TerraformDir: vpcDir,
		NoColor: true,
		Vars: map[string]interface{}{
			"vpc_name":              "mi_vpc",
			"vpc_cidr":              "10.0.0.0/16",
			"subnet_publica_1_cidr": "10.0.1.0/24",
			"subnet_publica_2_cidr": "10.0.2.0/24",
			"subnet_privada_1_cidr": "10.0.3.0/24",
			"subnet_privada_2_cidr": "10.0.4.0/24",
			"az_1":                  "us-east-1a",
			"az_2":                  "us-east-1b",
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},

	// Obtén el directorio donde se encuentra el código de Terraform
	//	exampleDir := "../ec2_module"
	ec2Dir := "../ec2_module"

	// Inicializa el módulo de Terraform
	terraformOptions := &terraform.Options{
		// Dirigirse a la carpeta que contiene los archivos de terraform
		TerraformDir: ec2Dir,

		// No generar el archivo de estado
		NoColor: true,

		// Configura variables de entrada si es necesario (puedes añadir más según sea necesario)
		Vars: map[string]interface{}{
			"key_name" : "vockey",
			"public_key" : "pkey",
			"security_group_name" : "ec2-sg",
			"ami" : "ami-098e39bafa7e7303d",

		},

		// Configurar variables de entorno si es necesario (por ejemplo, AWS Access Key)
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},

		// Configurar variables de backend si es necesario
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	keypairID := terraform.Output(t, terraformOptions, mi_key_id)
	assert.NotEmpty(t, keypairID)

	sgID := terraform.Output(t, terraformOptions, ssh_access_id)
	assert.NotEmpty(t, sgID)

	ec2ID := terraform.Output(t, terraformOptions, mi_ec2_id)
	assert.NotEmpty(t, ec2ID)

}
