---
external help file: Rubrik-help.xml
Module Name: Rubrik
online version: https://rubrik.gitbook.io/rubrik-sdk-for-powershell/command-documentation/reference/get-rubrikdatabasemount
schema: 2.0.0
---

# Get-RubrikDatabaseMount

## SYNOPSIS
Connects to Rubrik and retrieves details on mounts for a SQL Server Database

## SYNTAX

```
Get-RubrikDatabaseMount [-Id <String>] [-SourceDatabaseId <String>] [-SourceDatabaseName <String>]
 [-TargetInstanceId <String>] [[-MountedDatabaseName] <String>] [-DetailedObject] [-Server <String>]
 [-api <String>] [<CommonParameters>]
```

## DESCRIPTION
The Get-RubrikMount cmdlet will accept one of several different query parameters
and retireve the database Live Mount information for that criteria.

## EXAMPLES

### EXAMPLE 1
```
Get-RubrikDatabaseMount
```

This will return details on all mounted databases.

### EXAMPLE 2
```
Get-RubrikDatabaseMount -DetailedObject
```

This will return mounted databases with the full detailed objects.

### EXAMPLE 3
```
Get-RubrikDatabaseMount -id '11111111-2222-3333-4444-555555555555'
```

This will return details on mount id "11111111-2222-3333-4444-555555555555".

### EXAMPLE 4
```
Get-RubrikDatabaseMount -source_database_id (Get-RubrikDatabase -HostName FOO -Instance MSSQLSERVER -Database BAR).id
```

This will return details for any mounts found using the id value from a database named BAR on the FOO default instance.

### EXAMPLE 5
```
Get-RubrikDatabaseMount -source_database_name BAR
```

This returns any mounts where the source database is named BAR.

### EXAMPLE 6
```
Get-RubrikDatabaseMount -mounted_database_name BAR_LM
```

This returns any mounts with the name BAR_LM

## PARAMETERS

### -Id
Rubrik's id of the mount

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SourceDatabaseId
Filters live mounts by database source id

```yaml
Type: String
Parameter Sets: (All)
Aliases: Source_Database_Id

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceDatabaseName
Filters live mounts by database source name

```yaml
Type: String
Parameter Sets: (All)
Aliases: Source_Database_Name

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetInstanceId
Filters live mounts by database source name

```yaml
Type: String
Parameter Sets: (All)
Aliases: Target_Instance_Id

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MountedDatabaseName
Filters live mounts by database source name

```yaml
Type: String
Parameter Sets: (All)
Aliases: mounted_database_name

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DetailedObject
DetailedObject will retrieved the detailed DatabaseMount object, the default behavior of the API is to only retrieve a subset of the full DatabaseMount object unless we query directly by ID.
Using this parameter does affect performance as more data will be retrieved and more API-queries will be performed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
Rubrik server IP or FQDN

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $global:RubrikConnection.server
Accept pipeline input: False
Accept wildcard characters: False
```

### -api
API version

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $global:RubrikConnection.api
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Written by Mike Fal for community usage
Twitter: @Mike_Fal
GitHub: MikeFal

## RELATED LINKS

[https://rubrik.gitbook.io/rubrik-sdk-for-powershell/command-documentation/reference/get-rubrikdatabasemount](https://rubrik.gitbook.io/rubrik-sdk-for-powershell/command-documentation/reference/get-rubrikdatabasemount)

