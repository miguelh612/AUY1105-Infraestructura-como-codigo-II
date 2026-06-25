import {
to = module.vpc.aws_vpc.mi_vpc
id = "vpc-017743f618a64c09d"
}

import {
to = module.vpc.aws_subnet.subnet_publica_1
id = "subnet-0521518aaf6d9ca03"
}

import {
to = module.vpc.aws_subnet.subnet_publica_2
id = "subnet-0f198cb3b598e0d7b"
}

import {
to = module.vpc.aws_subnet.subnet_privada_1
id = "subnet-0bceec1f8a9840ec4"
}

import {
to = module.vpc.aws_subnet.subnet_privada_2
id = "subnet-05daef031a67159a8"
}

import {
to = module.vpc.aws_route_table.public_rt
id = "rtb-07e7d92b207900284"
}

import {
to = module.vpc.aws_route_table.private_rt
id = "rtb-0dad1f7d5da2d6b69"
}

import {
to = module.vpc.aws_route_table_association.public_assoc_1
id = "subnet-0521518aaf6d9ca03/rtb-07e7d92b207900284"
}

import {
to = module.vpc.aws_route_table_association.public_assoc_2
id = "subnet-0f198cb3b598e0d7b/rtb-07e7d92b207900284"
}

import {
to = module.vpc.aws_route_table_association.private_assoc_1
id = "subnet-0bceec1f8a9840ec4/rtb-0dad1f7d5da2d6b69"
}

import {
to = module.vpc.aws_route_table_association.private_assoc_2
id = "subnet-05daef031a67159a8/rtb-0dad1f7d5da2d6b69"
}

import {
to = module.vpc.aws_route.public_route
id = "rtb-07e7d92b207900284_0.0.0.0/0"
}

import {
to = module.vpc.aws_route.private_route
id = "rtb-0dad1f7d5da2d6b69_0.0.0.0/0"
}

import {
to = module.vpc.aws_internet_gateway.igw
id = "igw-07832bfa5d0d2de97"
}

import {
to = module.vpc.aws_eip.nat_eip
id = "eipalloc-0d6ee6d4921cb2326"
}

import {
to = module.vpc.aws_nat_gateway.nat_gw
id = "nat-0202b833e73497f3c"
}

import {
to = module.ec2.aws_instance.mi_ec2
id = "i-0640297c9993237ec"
}

import {
to = module.ec2.aws_security_group.ssh_access
id = "sg-09e9fa106352a34a1"
}

import {
to = module.ec2.aws_key_pair.mi_key
id = "mi_key_name"
}

