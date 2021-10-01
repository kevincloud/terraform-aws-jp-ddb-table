resource "aws_dynamodb_table" "table" {
    name = var.name
    billing_mode = var.billing_mode
    read_capacity = var.read_capacity
    write_capacity = var.write_capacity
    hash_key = var.hash_key
    range_key = var.range_key
    
    dynamic "attribute" {
        for_each = var.attributes

        content {
            name = attribute.value.name
            type = attribute.value.type
        }
    }

    dynamic "global_secondary_index" {
        for_each = var.global_secondary_indexes

        content {
            name = global_secondary_index.value.name
            hash_key = global_secondary_index.value.hash_key
            projection_type = global_secondary_index.value.projection_type
            write_capacity = lookup(global_secondary_index.value, "write_capacity", null)
            read_capacity = lookup(global_secondary_index.value, "read_capacity", null)
        }
    }
    
    global_secondary_index {
        name = "SessionIndex"
        hash_key = "SessionId"
        write_capacity = 10
        read_capacity = 10
        projection_type = "ALL"
    }

    tags = merge(
        var.tags,
        {
            "Name" = format("%s", var.name)
        },
    )
}
