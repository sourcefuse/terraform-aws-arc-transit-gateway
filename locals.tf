locals {
  source_attachment_tags = merge(
    var.tags,
    { Name = var.source_attachment_name }
  )

  target_attachment_tags = merge(
    var.tags,
    { Name = var.target_attachment_name }
  )
}
