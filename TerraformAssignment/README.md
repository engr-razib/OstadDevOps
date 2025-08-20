# Terraform Assignment: EC2 and S3 Resource Lifecycle

## 📌 Objective
Use Terraform to provision and then clean up AWS resources (EC2 + S3).

---

## 📂 Project Structure

```
terraform-assignment/
│── provider.tf
│── ec2.tf
│── s3.tf
│── variables.tf
│── outputs.tf
│── README.md
```

---

## ⚙️ Steps to Run

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Apply (Provision Resources)**
   ```bash
   terraform apply -auto-approve
   ```

   ✅ This will create:
   - One **t2.micro EC2 instance** in `us-east-1`
   - One **unique S3 bucket**

3. **Check Outputs**
   ```bash
   terraform output
   ```

   - Shows EC2 Public IP
   - Shows S3 Bucket Name

4. **Destroy Resources**
   ```bash
   terraform destroy -auto-approve
   ```

   ✅ This will delete all resources.

---

## 🖼 Deliverables (for Assignment Submission)

- Terraform code files (`.tf`)
- Screenshot of `terraform apply` in terminal
- Screenshot of EC2 instance in AWS Console
- Screenshot of S3 bucket in AWS Console
- Screenshot of `terraform destroy` in terminal

---

## 🎁 Bonus (Tags)
- EC2 Instance → `Name = TerraformAssignment-EC2`
- S3 Bucket → `Name = TerraformAssignment-S3`

---

✍️ Author: *Md. Razib Hossain*
