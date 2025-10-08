Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1D6CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 13:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39C710E814;
	Wed,  8 Oct 2025 13:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTkRCCIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA3410E816
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759930207; x=1791466207;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=I+P64g80mRHTIleQymkMCmxQDSDas0ad3TqSoWwvEiI=;
 b=hTkRCCILZy/z9EdGpEGBdR21RVlhtPWjVyiSx4i7+mRLkMNQfT1lN3gu
 MtdxGY+9CvzMNimxzJ1tU3QXVSMNlRdNl8ibq2BwPrRWpBZEQerKmfYY6
 rXDS4yR4Rt8ckKDhvBVQ1ShOMvFbuAMC78bwDnw5kz5wx7dDDQBbl9zGZ
 k5ml20iTmeJgv8C8bDV2vtaz9VEWMKKFi/RlFvYiFyO034MhL1YIcZulZ
 Of1CdCEmLbgLtmHfJO4s4ypgIOPFYe48Pz4ueH+vPEtZlDQ899pTxY5eq
 f7+NCdisk9p54u/n0UuDHxLZJ29KyQ15d4MBU160BeJ2QEzMXZP0oYpa+ g==;
X-CSE-ConnectionGUID: VFxUp+KpTEuNL8EByqn4PQ==
X-CSE-MsgGUID: PhdsA3QdTpeAe1DcmzIHqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62027846"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="62027846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 06:30:06 -0700
X-CSE-ConnectionGUID: 5nmJEJq6R7yfb66jGWOx5A==
X-CSE-MsgGUID: O+YCH0wJSbeMODVav2oj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180379465"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 06:30:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 06:30:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 06:30:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 06:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOYJXVHcvV6QALcOABQLJbnNxvpDhA5jTZcJXQsmWeBm32JAbC44XbZw+37mpSitDxCLe+PaX4b4XITR0QAlov3qNATWX7Si68te9JcP4fqGZ6ZI5JIgrUpOPISMob0kZcw20plZeUn04Ij+QNVGXU+aaaLwCSd+c3krp8NIyEgExDr6WMbyWrLqpcpDx7iXFUP+zZbV6edT+t5MHJ3kqlNpbujcCgNaX6fPDZrr863cuVmMHOy9JprZ1YfRyDzyZIROjDf7FxsHTqS3cPXs9UQ+sI8kvp4G//HRCQubauNIBxTpergQ0nlOtMCGTT9bQaoRWdtNF3Jev1vgJvcwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STg2iTyZg9qV1js69kmy9elnzXVeVjfp8koQA+s3ZiA=;
 b=i5xcraFz9DKuJGg4b32LLG4wyslgLhl/JeRgJDMiVz8jgpXa/Mfo/htN7+nFjHLNfD79MMOq+0QC5bpTUBtaUdVlm1UgEZBGbQ97bUhaDMUO2Dk8zb2TowsXVzfIMk2KZU7UhxGobLwVMgupUJQur8l1KxxT9Qco/O+aGgDASsrAxyUO73fAFuy+zadfOLprUeILyGNVxSHM3kk9J+AYd0NxARWBkiEZ0/QFUSPTHJrViNCVvmD8eSscn/wg1DhR60/GimF1NYOdCf+rUCfnS2ygN5zY2er7N97XbRNLH3VXlx/eDm7ZP3h3soSDq9Wnwg0NkiUsd7fZWWiW8/Dzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV4PR11MB9514.namprd11.prod.outlook.com (2603:10b6:408:2e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 13:30:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 13:30:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251007204829.1468209-37-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-37-matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 12/23] drm/xe: Check for primary GT before looking up
 Wa_22019338487
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Oct 2025 10:30:00 -0300
Message-ID: <175993020029.201562.3801786108860503724@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV4PR11MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 5317dd23-e85c-43fc-fa91-08de066ec9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2RySlpMZkE0cWVNb1BYS2k4QVRXd2k0alNsSkZxZHFLRGFTRXVxMGxaclFt?=
 =?utf-8?B?Y1ZFRHpka0xuckJGOUw2TXpNRytTUk8xOGV0bjAydFJHRzVFbmgvMEw3WkxJ?=
 =?utf-8?B?N3EvcnNIZGF2bC9yaXM1MFB1Y25FUmc5cmFob1UrTTVTMzRsSTJhNVhvbjNl?=
 =?utf-8?B?enlmWElqZVZRSGprQURYSndmQ05pZDRCUndLMFNYZHBBbkZnc1pxaXFXV3Nl?=
 =?utf-8?B?SnN2eEU4Rm5BN0FLb1graXFxd0g5YWIrektDSFdtb2djMTZuNmdEV1p6YjhU?=
 =?utf-8?B?MUdiK25IN1ZmRHdvcU0rUHJMUE5KMlhUdElaV0szRkdVYllnaEd6K0R0ZEgx?=
 =?utf-8?B?ZEQ3ZjVJVDdGdXRSWmlxWW9YS0E3aUlaQW85aSttYi9EY2N5YUFneGNOU0VH?=
 =?utf-8?B?T1Q4dkxIQmdtUWRtTlhRTmU3OFR6TVdqTXVtaG5tY0YrNks4dDJFb29jZ1Nx?=
 =?utf-8?B?Szg1TXNkR0FTQUQwcW9nT3dYc1lybzR5NENRUmdnYStvMDIzQmdwcTF0dW9B?=
 =?utf-8?B?YWNjcmxvbzR4UDNMTGREQTRhQk9IWlhWajVoWjFPR1MvUDhwbEVIcjFYdXp4?=
 =?utf-8?B?UWhtVkVMbVM0WXJmb0hoWS9OZmN3STc4d281a2xxeWR5V2hRRndSSkZKUWgy?=
 =?utf-8?B?V3FvR1VrK3hrZGQ3RngrWE4yQndlcUtXSEI2ZEQ4c2txQTFHTU15SHFISHBS?=
 =?utf-8?B?S1dVYkxWTTZ5bmlwc3hiNnBUakVJOG5oME5KYVRBUlNaczI0TStneUN4eDlp?=
 =?utf-8?B?UDNoc1dNUUFSRE50RmNjY0Y4eExBZDFtNHpVMEhOeWNVWFp5QjdDWXZHVVhQ?=
 =?utf-8?B?eUljd2RqYTZXaSt1bXdVTzViS1QwY1liNmZXQUFWWldpSFlUdUc3Ni8ydzdX?=
 =?utf-8?B?eFA3b1pkWHNxYXcrbUF4NDU2ZTVHMmdqRHZOT3dIN2M1RVZjWUJHdmRyd3hM?=
 =?utf-8?B?eW51bGROcVFTTm01YVQyMjNBM2NNSnl0YUhYWFZ5UkNYUE83UFdWWHd3Tzd5?=
 =?utf-8?B?Z0d3aGNMYlRBc2JNZ3NJeTlsVkkwS0d1N1JuMGZ2NzFMYk04eVVsbUE0YWJt?=
 =?utf-8?B?MmFCWkV4MWdod0cyd3RqamNqMFRra0VmZEZYQkhKVnRjdXFvb0RBL1pmeGlX?=
 =?utf-8?B?L1NNQndSM0Q4U2VhalRwNW53dHdlOWtCNkg5VmZPM0R0TElLM2g5KzRMN1NK?=
 =?utf-8?B?Mzh3MDhoNWkwNHkrN280elBPUDBHZUJSVnpXQ3ZXMHVNNkVxMnduMTNWTENw?=
 =?utf-8?B?bkUyalFXd2dvRnRXZHpXS29vWUpCWDkva3c4OU5Md0ZnM3hDN2kyWWFsZWhy?=
 =?utf-8?B?ZWx2QVY1eVdSNHlPekdOYk9rUHJOU3hVL1dlZ0ViK01oZzhhVzlWVmY3bXRX?=
 =?utf-8?B?K3p3eWpFNmhGMEt0WlJJSDk5S0F5dlNIZDh2WGFXcTdZendIaGUveVBpVjZt?=
 =?utf-8?B?bUE4WTd3MEVScFE3eUtmLy9DejFKcTlBcFIwS2pSK3d0aFB4ek5LdnVvYWMr?=
 =?utf-8?B?NG11QnczK2tGU0hxYWg3RC9ZSmxiY0ZuWTd3OVZLbUhWbHBuU0I3VWYwb0N3?=
 =?utf-8?B?eUR0ejhmWnRIeEliT2o2YnZtN3pmQ2NQeS9BNFhCdXpGcmRRcStZSS9EQlpK?=
 =?utf-8?B?Rm0rajVzeDJqekxuVVppTWxtTU9LMVltOEdEUGVTYVVONFdxQTNkajczM2Qx?=
 =?utf-8?B?dGJSbmxadnpUaXpILzAxRGVFQzhQT2c4cTlHWDZEL1BTbDJWc1FDTGViQW1v?=
 =?utf-8?B?TUpodjRWK1JxL1kzdUg2cmNFMnMyRHFOaFJQWXQ5OGlCb2hiMHk1Y2ZoWXQw?=
 =?utf-8?B?aDk3L2ZWRkdCSkpjT2FMY2pHQzlMRVVCbEJqT2hJNmVMR1dTZWl5R0p1amkr?=
 =?utf-8?B?NDNHNTBlOWlMalRzR2sxVlhhSGx4NGd5RnRUczZKaDhPdXhXcG9ZT1hOQlNh?=
 =?utf-8?Q?lRCMi6GGiD8agqCiJkgihKbymqkPfsNA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU10NmRNT1YrUUxteHFSSVdrQXRLRDg5QmxMYWFVMHEyTG9DamlCbHAydktp?=
 =?utf-8?B?YmFDcEMrZCs2cUNVZmJYZFFrR0JGeExrWm0vRU5tUzBzQmJXbit4VisvWnFm?=
 =?utf-8?B?RzY2WGIvd3U3UnBpZ2RWS3hTZFc2MkhjT25NajRYMjhxOFVxN2E2VURoYlRG?=
 =?utf-8?B?SmhuQVUwdVViYmF2NHJTQ2xGTllVblJ4NGxUUkNzZTJSQjdwYmkyTXNnNzds?=
 =?utf-8?B?QitDeU1nRHRMaWNXTm5QMlBZK29UeGJiRFo3SG5Bei9rNW5oNzRPczk1cjJo?=
 =?utf-8?B?T1pJUXFYSmpDdXNCTy9SRno3NGFXWHpzOHpJWTdQOUcvRkhCNmJSb2dVOEFl?=
 =?utf-8?B?bnlFZWl0aExpSEhKSVZVdjJNQTB4a2NGTStFQU9SN1gwdUFtNndudjZtVXhE?=
 =?utf-8?B?M1I4NytnM2lYTThOSFRsWExJSDdFQm1pK3pwbWVreXRJZjlpWVAzcFpSb0RG?=
 =?utf-8?B?eTZMQno3N0pjNG5uVWQzdWJrQzJEaXZhVTM4ZmVtdE1qZkxrV3IrRThUSzdT?=
 =?utf-8?B?clRla2VTeklLNG9sRUFQZHIzdnZZaHJEN0RxUUcvcUFuaE0xeGJ0L1hlZE91?=
 =?utf-8?B?dXNIVHIrQVVYY2dGSkpnbFMyVUljL0FqSmZxY3dJWEVzZy9rV1FjemlGbFl2?=
 =?utf-8?B?SXo3RkM0U3JsSFVCQ2FqWk9nWE0yTzF4S2JMU1hZc2diM1NjR1V6dzJtRnhx?=
 =?utf-8?B?T1ROSzk4ZjBxeDFSOCt5b3BxK3pGanZaZGNLc1hnMDZFODdZTjRzbGd2eUE5?=
 =?utf-8?B?ODRjTmY3TTIvVzN1Um9kOFVsMjl0ZVdSZFJ1TE1HNkh4aXFMcDloMFJqWVhK?=
 =?utf-8?B?cUR1RnFjWGsxYnVHeVExVk9QMjBTMzdYQmlCZG8ybTRNQWhzRkJBTjgvUVkw?=
 =?utf-8?B?R01jZk0zUVlkUWpBRWVpM3JnZ1ZWVkVmT1hlVWpZT0NwZDIvL3NpbHFDWUta?=
 =?utf-8?B?RUhDa3JFbE1FUCttS2xiQU9BYncxVWZuYWhZb0J4eE5IS1EyamhMKy95cFNY?=
 =?utf-8?B?b0g1WncwT1BKQlV1UVVvQ3RjSGptWlp6VzROVHBXSFhzalBTNnZLSWt0L3VP?=
 =?utf-8?B?Z2hzYi9EZkhLSWtEWmFGOXhvY1lkQzN2MzBNa3BnaFo2TlZ4WmJ0azVHZGhG?=
 =?utf-8?B?N3QrUGxXVklaWm1LbCsyc2p1R08xM2xHR2tSTTVhWjRlbXZ4Tm5OQ1pTMHEv?=
 =?utf-8?B?aWIyY3AzOGdpU2l0WXY0dkhRU3ZlUTFBUjJOYzQ1MXR2aGU4S2RaaUFpQ2dt?=
 =?utf-8?B?VTh6YnZUUnJhZHpSNlpLNThpdkVPK3k0eFROWGpCR2s1S0hNMUc3UVBvUE1Z?=
 =?utf-8?B?VXRrN3RsQ1J5bStqb2dRSWgrSXhoZG1BZnpib0kvc3FoQjZNTlVlQmVjYVFu?=
 =?utf-8?B?VXhETnhyMUIvdlhFaGlGN1NYSkRYcFUrdmgxUjJVR0t6Nnd6TjlBdTZ6eC9X?=
 =?utf-8?B?TFZ6WkRTSVpTcUZiekJnOTZPVXVjMlNsSTUvWnQvQkpVK2VPemNSZkpOUGRu?=
 =?utf-8?B?cmpuS0Y4S1dpRDVQQVJjTmZwTHpCdDJQM29mN1MxU0EzQlJ2UktySXFxUldH?=
 =?utf-8?B?MHkyZnk5Zks2cXZ1NGwyRkFlVFZ3b2RvOXg5ank2ZXBETDY5aldFZEhnbHJV?=
 =?utf-8?B?c2p3Snd6aWc3RlVlMEozRjhGN1Y5OXhsNmNhSlVUNzNSUUVhR1lmM1pSQ1NQ?=
 =?utf-8?B?T3FaTDBuQ3ErTlRLL0p1K3RmdHFyWndFM0g0ZVhPbkdISWVXVUJRTTV1YTQw?=
 =?utf-8?B?MGsrT0w3WkQ5ci9xODdCa0lGNUNrUHJMUVhzbk5DU2FLYlQ3bXNXZE5Iejgz?=
 =?utf-8?B?VjcxUDB3QTM5SStmam1MQWNZN09hUW9PeFRWdXIvaGpubDRkaEVndGc4dExP?=
 =?utf-8?B?N1VPdWRiSjBNeG05WTBYQ25QYmlzUTRla3RnUHNmU2JNc3c0SVNNVld1VE0y?=
 =?utf-8?B?U1VLNzdneHA0Z0poMm1zOHVMbmJ5OWxMdm0yT1BMZ0ZzeFhRT25EYTNtZi9u?=
 =?utf-8?B?dmVMNThZb3ZuVU1jY3hrV1pITGwxcjRXTCtBTC9Gako3MmxSN2txdTVVbEtw?=
 =?utf-8?B?bTFDMVd4Q0x5N09IQS9OWmhwWkRzVVowYlB4bnkzdGNuZXBVNmhjYkVQSXZk?=
 =?utf-8?B?SzEyNmpiVEduQ3l5dHFSV2dydlZ4ZEdqUmJmRTZzTUxRZWNBL0NZTzBpS2hP?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5317dd23-e85c-43fc-fa91-08de066ec9f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 13:30:03.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi/jyqfVKnZn0ePx+tT5+mP5hT5+bCFG1SLOtI17/T3V2hGFn9u4WqgxWX9cXVXbsnxBUgwPyRiqSsB5uKNfTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9514
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2025-10-07 17:48:42-03:00)
>If the primary GT is disabled via configfs, we need to make sure that we
>don't search for this workaround on a NULL xe_gt pointer.  Since we can
>disable the primary GT only on igpu platforms, the media GT is the one
>we'd want to check anyway for this workaround.
>
>The ternary operators in ggtt_update_access_counter() were getting a bit
>long/complicated, so rewrite them with regular if/else statements.
>While we're at it, throw in a couple extra assertions to make sure that
>we're truly picking the expected GT according to igpu/dgpu type.
>
>v2:
> - Adjust indentation/wrapping; it's easier to read this with longer,
>   unwrapped lines.  (Lucas)
> - Tweak wording of commit message to remove ambiguity.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_ggtt.c | 31 ++++++++++++++++++++++---------
> 1 file changed, 22 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 7fdd0a97a628..9707c41539c8 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -107,10 +107,23 @@ static unsigned int probe_gsm_size(struct pci_dev *p=
dev)
> static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> {
>         struct xe_tile *tile =3D ggtt->tile;
>-        struct xe_gt *affected_gt =3D XE_GT_WA(tile->primary_gt, 22019338=
487) ?
>-                tile->primary_gt : tile->media_gt;
>-        struct xe_mmio *mmio =3D &affected_gt->mmio;
>-        u32 max_gtt_writes =3D XE_GT_WA(ggtt->tile->primary_gt, 220193384=
87) ? 1100 : 63;
>+        struct xe_gt *affected_gt;
>+        u32 max_gtt_writes;
>+
>+        if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 22019338487)) =
{
>+                affected_gt =3D tile->primary_gt;
>+                max_gtt_writes =3D 1100;
>+
>+                /* Only expected to apply to primary GT on dgpu platforms=
 */
>+                xe_tile_assert(tile, IS_DGFX(tile_to_xe(tile)));
>+        } else {
>+                affected_gt =3D tile->media_gt;
>+                max_gtt_writes =3D 63;
>+
>+                /* Only expected to apply to media GT on igpu platforms *=
/
>+                xe_tile_assert(tile, !IS_DGFX(tile_to_xe(tile)));
>+        }
>+
>         /*
>          * Wa_22019338487: GMD_ID is a RO register, a dummy write forces =
gunit
>          * to wait for completion of prior GTT writes before letting this=
 through.
>@@ -119,7 +132,7 @@ static void ggtt_update_access_counter(struct xe_ggtt =
*ggtt)
>         lockdep_assert_held(&ggtt->lock);
>=20
>         if ((++ggtt->access_count % max_gtt_writes) =3D=3D 0) {
>-                xe_mmio_write32(mmio, GMD_ID, 0x0);
>+                xe_mmio_write32(&affected_gt->mmio, GMD_ID, 0x0);
>                 ggtt->access_count =3D 0;
>         }
> }
>@@ -284,10 +297,10 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>                 ggtt->size =3D GUC_GGTT_TOP;
>=20
>         if (GRAPHICS_VERx100(xe) >=3D 1270)
>-                ggtt->pt_ops =3D (ggtt->tile->media_gt &&
>-                               XE_GT_WA(ggtt->tile->media_gt, 22019338487=
)) ||
>-                               XE_GT_WA(ggtt->tile->primary_gt, 220193384=
87) ?
>-                               &xelpg_pt_wa_ops : &xelpg_pt_ops;
>+                ggtt->pt_ops =3D
>+                        (ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->med=
ia_gt, 22019338487)) ||
>+                        (ggtt->tile->primary_gt && XE_GT_WA(ggtt->tile->p=
rimary_gt, 22019338487)) ?
>+                        &xelpg_pt_wa_ops : &xelpg_pt_ops;
>         else
>                 ggtt->pt_ops =3D &xelp_pt_ops;
>=20
>--=20
>2.51.0
>
