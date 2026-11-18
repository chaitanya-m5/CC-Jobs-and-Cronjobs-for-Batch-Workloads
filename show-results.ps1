function Show($title, $cmd) {
  Write-Host ""
  Write-Host "=== $title ===" -ForegroundColor Cyan
  Write-Host "> $cmd" -ForegroundColor Yellow
  Invoke-Expression $cmd
}

Clear-Host
Show "1. JOB COMPLETION STATUS" "kubectl get jobs"
Show "2. CRONJOB SCHEDULE" "kubectl get cronjob"
Show "3. PODS (Completed = success, Error = failed attempts)" "kubectl get pods | Select-String 'NAME|report'"
Show "4. LOGS OF A FINISHED JOB POD" "kubectl logs job/report-job"
Show "5. RETRY BEHAVIOUR (failing job)" "kubectl describe job report-fail-job | Select-String 'Backoff Limit|Pods Statuses|SuccessfulCreate|BackoffLimitExceeded'"
Show "6. LOGS OF FAILED POD" "kubectl logs job/report-fail-job"