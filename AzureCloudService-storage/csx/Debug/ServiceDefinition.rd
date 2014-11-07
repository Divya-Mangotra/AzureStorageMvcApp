<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudService_storage" generation="1" functional="0" release="0" Id="c6a16a62-d17e-4ddf-bcbd-78cc4bacebf5" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudService_storageGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MvcWebRole1:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/LB:MvcWebRole1:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MvcWebRole1:ImageStorageAccountConn" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MapMvcWebRole1:ImageStorageAccountConn" />
          </maps>
        </aCS>
        <aCS name="MvcWebRole1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MapMvcWebRole1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="MvcWebRole1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MapMvcWebRole1Instances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MvcWebRole1:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMvcWebRole1:ImageStorageAccountConn" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1/ImageStorageAccountConn" />
          </setting>
        </map>
        <map name="MapMvcWebRole1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapMvcWebRole1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1Instances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MvcWebRole1" generation="1" functional="0" release="0" software="C:\Users\divya-mang\Documents\Visual Studio 2012\Projects\AzureCloudService-storage\AzureCloudService-storage\csx\Debug\roles\MvcWebRole1" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="ImageStorageAccountConn" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MvcWebRole1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MvcWebRole1&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1Instances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1UpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="MvcWebRole1UpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="MvcWebRole1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="MvcWebRole1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="8f9b7307-b78f-4904-8730-ad8b58fe2427" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCloudService_storageContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="ce8b73a4-7abd-4b0e-8dc1-6f095eb5ebfd" ref="Microsoft.RedDog.Contract\Interface\MvcWebRole1:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudService_storage/AzureCloudService_storageGroup/MvcWebRole1:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>