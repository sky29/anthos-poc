data "external" "get-current-date" {
    program = ["python", "../../scripts/get-current-date.py"]
}