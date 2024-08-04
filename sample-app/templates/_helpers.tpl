{{- define "sample-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sample-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end -}}

{{- define "sample-app.labels" -}}
helm.sh/chart: {{ include "sample-app.chart" . }}
{{ include "sample-app.selectorLabels" . }}
{{- end -}}

{{- define "sample-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sample-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "sample-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sample-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "sample-app.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}
