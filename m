Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C3EC83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 05:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD2410E004;
	Thu,  3 Jul 2025 05:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKDOoM0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ED810E004
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 05:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751519800; x=1783055800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z7fg65f/j2M0kjGZriyRXJDfRZ/od70yRKiPwHOfa4M=;
 b=BKDOoM0+1oNfhuZH4p/SreTJ+fkEWUeRNMmIWFq6n5IhxbDDXKpdT9NY
 5sGbLuDZlQ3XrN0deJQyQolAHjMB1yQhygLALMucbBPA9FtcAd5hnFHyZ
 zYvQtwsyn9/Qg56neXHWosTtyvzoYL3veWAz+rWsQCn3RbtxSBGCewjnk
 8lZNHjucJf9FXzBlSENHPyJJsgajEmI2xO+OFhdaI8WRb5CIXU/VdkekP
 228Er/78Kv3a1sPF/Q4JKaDcIgJAkVQEGj8fS0DYgS0wVrWEfWLuM36DN
 gl6mm88OYpPqtcYUk+nqXNMQbExyxQwceK3Scwr+AjL6U6rnPAjWzgSeD Q==;
X-CSE-ConnectionGUID: 94en0kQARPCsUtgdWjhwww==
X-CSE-MsgGUID: tUQLm636TCC455XnKJF9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53800115"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53800115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:16:39 -0700
X-CSE-ConnectionGUID: 1JogN75STkSFR+gQEiB8FQ==
X-CSE-MsgGUID: /t7y5/DKSomPfyBttxyfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="155012354"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:16:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:16:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 22:16:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2g6xPGFc+h+GLKEb3oTjN0xMhbRMjQhh3oBVvrVipciWSbLBw4OmySA/KsFB60riXuWoP9x114GrCWtSeHMZr0e61SMN7TLMyO6CvE9YNZXSLR5YAlD2fNnGmMAfs4aMOw2rEMArF7mrlyxGy5vz0l2iSNnlGLICZ+C0zDohif4HSMcFY/Xd336HJyZSXoDItNE/NGggavcw0IT+RlDH9a2zn8iFa5p2k2k7dZdtL/bfVT5rIT6XJf8I/r2ejwMg76WOnzGdRkny2kZBYQVDS3jp6P+2p4TY63BdAQqSiiGuT71E8RjBcQiPrTkYB563XQIPytmtmOBniCHMRkaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+dVVs/PqWtOgyxiSCO+th4DlPhwGGHoeq44vqW98Ec=;
 b=nAIHOpNYD8jW7iQEu6NA9HoDJ9qiaL732eBmATfBExR19D+X2hNbCKcJAenfxx7WmaU777C4GA1ooFefhHXsVlDAYRTyVF9oSQpNtZN8An1FQ9fAFSDPyJ8r4cj9IfUAYNdmxfXjORBvOW/wC7+LyASKE1ey7DSwbVCXVDRBDZeastW3/97bKXH/GPO0HyYL/es2MrX2ew8Q/mxr4Tpx6tkFormChemO7IPKoB5Ma3jOvZzvHVjlAoUxJkeAAItNKpvy9TnGT6bs6Du5eq7vF9CM5m/AUrAKGF61iEP90S+T9fViQg+UEDivQ2yVPTnDLryMqG+5VLW5m74b0QQYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 05:16:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 05:16:35 +0000
Message-ID: <859739cc-499c-448e-a330-7aae6c182e55@intel.com>
Date: Thu, 3 Jul 2025 10:46:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-4-riana.tauro@intel.com> <aGWnRGeEeznxW4Xa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGWnRGeEeznxW4Xa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d30005-3be4-4763-3594-08ddb9f0c808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFJ0M2hSVWhGVXVsMk9QZjkzd2c2K1JoRThVNk5zcXBlR2p6WVFSZ1dVWjkv?=
 =?utf-8?B?K0pQb2c4OHI0Q1V3eXM1blFqYjY0Wk02ZDhxamlDV2VOVWpVampXZEo5ckNv?=
 =?utf-8?B?eUF5YlFYekVQMWFQcU5hVEFLZDhnTUlNbXFlRENsb3ZVY1kyclpZNUYrY1Jx?=
 =?utf-8?B?UGJtTC9FYWhRL2FobHVHVnRtTWVmdUs3MmRkdlQ1S0tUamkxLy9JTTA1MlUw?=
 =?utf-8?B?YUowOWhCNHJadEtsa1N3Sk85Sys3T2JGcVpJZUUyY2ZCQ3lFSkZCMnRkVlJI?=
 =?utf-8?B?WENVTDJiL3pmKzhVZVVJNWRIR05BSW9hbC9nb2U1cmk0TStrbnNtdk91eElq?=
 =?utf-8?B?aXZUZDR0V3pnbFdnQ01KdGdFd2hTQ0NHR1lKcU0ydm5YYkRQZm81cnlJUlZq?=
 =?utf-8?B?aWd1Y2d4Q3RzcWxFVmI5RTNLMzN2WU5NZTQvK0hLdDBUODRPaFFtT3Q0Z0NP?=
 =?utf-8?B?dmJTTERwOVdWeGhkMExXb3Y1RmVsSE45bFI0dlZRWHczWDRxcFN5ZEtxcnB1?=
 =?utf-8?B?ek44OW9NU1dqeWJiSUxzYnRQR1p2S1BBU2dDQlBDQnZ3bmR3VVNMN2w2ZjdG?=
 =?utf-8?B?VzhGeml6SDN0akdHUWtTQXl5RWE4RFMxMVJaZk0rK3FMYmdIV1F5bWYxclNM?=
 =?utf-8?B?aWEzbU1UQ05Qcm9iRWx3eURDUjBBRFFvZkltZzFtS3pZNFBKY2pRSGtUT3Js?=
 =?utf-8?B?L3VTNEhiNFV5TUNBdUlyYXQzME50cjBNNTc3Rng0K1ZsVERCMDZUdUlLN2N6?=
 =?utf-8?B?SnBEZnFCUDExTWhmZVI3OUxzT2VuaWJjZlhSaTUwcTRTRms2WTFMdUJFUDdj?=
 =?utf-8?B?QjQ4NVNVZ3lianBtVHVzMG1sWk5Sbm9CTG1hbE1UUldYSTBsNmUwdGU3MElS?=
 =?utf-8?B?NWhzeVFacHBJSjhRMVdFMjFtdUNiME4rTHpPeVZseEJQbkdYclpzUFIzYnVp?=
 =?utf-8?B?NjZCRm5seERERjdWeGJBcHV5R1dLMFd1QjZNcERIeHdzcW1Mc0YwS1ZjMHJH?=
 =?utf-8?B?bkVPM1p0MUtMejFsWURrbkc3djNHbXRJWHlPOTkrTk1yU2ExRjlRbW94aEVH?=
 =?utf-8?B?TWtXam9JUzlwb1hxeE5WRFlLR2RvRzhUUUtFVUpVaDZ6eFFmNHJuTFVuWCtG?=
 =?utf-8?B?QVE0VVR1TS9ZSFIyOEx5ZHVzWW0xRWh3cjRsQmNmdXJnakgzSXpuR2VleG81?=
 =?utf-8?B?aXdnZmtPTVVET29ScEo5Zk9EYjQwVGtPMWxVeTNJcUQ3TDdpajd5YThXZTdu?=
 =?utf-8?B?REUyTXFhbDZSb1VzeHdaR1lUdk5ONWtxbUZhWVF0K1NMeUJMMnhWV1FhV2sv?=
 =?utf-8?B?bkhvTFFIUGNrV3hGWXpSUU45T1BwVjhHK1Z2ZkxDT0ZndlpoTk10K2dONUtD?=
 =?utf-8?B?Nkgzd2RxbDNJR3JZSlhMWFpvNjlGSFVHdm1jLys4eVBVY0c1cDJCT2pvZEtK?=
 =?utf-8?B?OVp6WDA5UTNZTnlJTlZHdFJhUlUydUJJUlVUdGVVMlRUZ0ZCbFloK1BIdk9k?=
 =?utf-8?B?RDhkMHdqUlZ6TnNqWjJsalU1NCsvdlRtK1d0cENLdnZCMXBMNzd2aVdQK25L?=
 =?utf-8?B?UEovZDBxK3NUS25MMndOOGNHa1I3SjFZK1ZIRnpSZ0ZtZzZGQXNLdUlFRWY2?=
 =?utf-8?B?WWJta2drcEZ0ejFSUFIwa1pTUG5nVGtKcjRZOW1yLzhhYndZYnZkM2NEcWhK?=
 =?utf-8?B?SCsxYVhyQXpkK0RKQlZMV3RoVEhnLzBhVVpSNkRIMkJzWTRLZnRDVk90QWJm?=
 =?utf-8?B?V0lYWlJyd0VKbWUzbm5wcUg3ZDltcDY2WURHTnEzdGFubytzOXpudXdhZytW?=
 =?utf-8?B?a1BBSDZoK0c4N0U2eXhYWHE2OWNZekJYZ2hMNFJtV3h4WnNodnZTNVZMK1Bp?=
 =?utf-8?B?T21OdWp6MWtUZHdhM09uQUkwTnBUeDlIZm83andxNkMvbkhmeG05NkJsL0ds?=
 =?utf-8?Q?13Dg00UqnV4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFjc0kyaElSN0RtUUdNZEZ3dFVBUmVxZkcxeUFCRVNkKzlhQmkyRHRrVkhp?=
 =?utf-8?B?c1N1cXM2RmFmV2Fnb3N0U0xNSTlDbGVQczNjejIyS0wzV2ZiVHQ4QkpuN1Mz?=
 =?utf-8?B?V2ZYRGozaWRhMW96Qm1URFFtTHY4YjUyUW12QmRSUjdOYVdlR1V0R1lEWlBk?=
 =?utf-8?B?bEV6ZW9xd1V1TzR6cDRoWVBwd041aURtY1c0elNDVFE0TGJ2ZjRFZU5iK0lB?=
 =?utf-8?B?NmN2WDdvaWJ4SHhGYUxtS3F0RnZobUdvQWd0LzZ2bDZxWXhTUGlEVUl3dit0?=
 =?utf-8?B?S1N4S2dHa0lrVXBaaE1iZ0l2cWR4K3hXUThxajErbkovZk15UGJwUDRKaWNE?=
 =?utf-8?B?ZXhiME91L0RTcVEvL2N1ZHRPSGZseXM2RUZuV09hYUI4cnhUS0lSaSt2T0V6?=
 =?utf-8?B?V3puS0Nxajd5YWVpekdQTWhhSzU3cm9QdjZKa2NMQ3B4WksrN1lZN3R4V293?=
 =?utf-8?B?QSthUk9UV1V5MkR0djV3NUtPdUUzaDVxYTU1L0pNdzRXUWMwTHZGeElMSFVs?=
 =?utf-8?B?eDR1Zk9wRDZwR3VNRTcvZFJYeE9BWUk2WmpYY0NyZk1XYlljZERPMW5LMTkx?=
 =?utf-8?B?RHV2N1grTWd6RWtwK0VYMEtuOFBKL24xNUlCTWwwbThoU1E1YzQzNE9GWE5T?=
 =?utf-8?B?a1drdXpHLzNTcU9wbWNMZGRzYkR5eURtL3ZZcytta0NrRndRQXY4MnZ5ZTEw?=
 =?utf-8?B?Y3gxQjBidVU0a2NuWmkremI5bHAvbjV1dU5COWxTZnFqMDI0UFFRNW9LTUdR?=
 =?utf-8?B?WHRGeVpwclF2TDliYXFoMUpBL0JYVU5jTm9Jc3NBQ3JlUVlscGRUcXB0UnRw?=
 =?utf-8?B?ZkhYRU1WWUl1eUZpU0RsOUVJNy9OSlFiSUdaZENHMU1nSTV3Ynk3L0pDOGxL?=
 =?utf-8?B?NEZLRUpGRUk5bCs3MERuK2c2UjdScWRqQk50K1R2aDQyeUpaYlg4QXI5VTVk?=
 =?utf-8?B?ZkduSE9tMnQyM011Y240aEIwRTdGbHZubmxwOXlVUVUzeU9JUjBlTU01aCtx?=
 =?utf-8?B?eEZSbHJPUTZKVEZpNkR1RjExS21CQ2o2aE5ucjlxeXpJb3RXdmhzK1BpYzg3?=
 =?utf-8?B?ZVhvckx2bTRVNnV3TGdjZVpab2dsdDdCR2t4MTlOdzlORTQ4aFNtZTlBSlFt?=
 =?utf-8?B?R0VnZVM4NmVTY0ZmbXVMcFpMUk0yQmhSUjQzWDV3TGE0VkV5SHRXWFB5dEs3?=
 =?utf-8?B?WFJmeTByL3FFaWRYUUxKSExTWFFDWHNTSWVRem9Sc2NJalF2SUVoNUdIKytm?=
 =?utf-8?B?YTlQek8yT1ZrL0d4Z2xqejhMS0ZQazVtdnllQUdwY0hXamxsVkYvaU9iS0xp?=
 =?utf-8?B?Z1JJQ3dmcXpQN2JFd3NNQlFCblhLQUVscm5HSm9wTThHRVZMekZPWFdGNUZV?=
 =?utf-8?B?QVp2cW84bU5jWUtYTXp1cUNVOWNuVG05MHhETjJVYlYyeFoyKyt6Y28vbjJ4?=
 =?utf-8?B?eGdGWVNoZCtENGx6TmhlVnk3enhGemtoTzJneVV1c2FWZkRWcVh6MnFWNkY2?=
 =?utf-8?B?aXpvVzNDZmR1NnY4UnlmVnNLYm1ZS1JiTjVaQ2Vzb09uNDJ3K2ZaMys2eVhZ?=
 =?utf-8?B?Zk5DWCtaSHUxbldyRGt4bzFNSlBCQ2VwbnNZQzU4eWtJaGE5a3IyRWUyT0RW?=
 =?utf-8?B?ZDdUbGZLV0M0aUdHUkpDaklFa2Fka2pTRjV1VXBwc1I4MmhBOFFtbUJKOVZT?=
 =?utf-8?B?Z3MvajIyUmtmUnVFZ1dkOVVBa2MwV0pUbW8vZEpweGdVY2xpTG9QK3c4SGxm?=
 =?utf-8?B?K253YTBLZzExcm5vUGREcHg1NG4rNHhBTEJrUmdXd3h3TGdNbnZQc29zMW1h?=
 =?utf-8?B?dno5NElWeU5pNWxYVXFVS09rOW5mS3FoOHZvdnN1Q1Z4a1RRbGF0QkpNUDNu?=
 =?utf-8?B?Ty9sZ0hqamx5U2paVFA0dmhXZE80WktOWEN3ejFrOTVoY3ZMVTN5eTJwb2c4?=
 =?utf-8?B?VDlhQmpnUkdjeUR6WEtLMzgzYzBRTzY2a0JvdWJXZTZObWlDdFlSOU56S3dI?=
 =?utf-8?B?YzVFUnpKL1FPdjNCVjFmOEJvVDJBM3hxQlJuUEU5eDBkWExjbXpHcUlCLzBJ?=
 =?utf-8?B?RGdkajU4bkRvSmE1RTZkZ0hvTE9YYThQM1lzbGtZZHN0SExFK0t6T1BINTB0?=
 =?utf-8?Q?e1pF2O2CxIIJjn88jtpcP1K29?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d30005-3be4-4763-3594-08ddb9f0c808
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 05:16:35.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIYYDktb+DZyXQFBPpGizyHlLPbwjX98WxuGn1MVGDJXc4yYwdJKw5acVza5OSYjgMFoQrOH2E9MbRYZoerteQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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

Hi Rodrigo

On 7/3/2025 3:10 AM, Rodrigo Vivi wrote:
> On Wed, Jul 02, 2025 at 07:41:13PM +0530, Riana Tauro wrote:
>> Certain runtime firmware errors can cause the device to be wedged
>> requiring a firmware flash to restore normal operation.
>> Runtime Survivability Mode indicates that a firmware flash is necessary to
>> recover the device.
>>
>> The below sysfs is an indication that device is in survivability mode
>>
>> /sys/bus/pci/devices/<device>/surivability_mode
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c                |  2 +-
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 26 ++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_survivability_mode.h    |  4 ++-
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  8 ++++++
>>   4 files changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 4a38486dccc8..5defa54ccd26 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -716,7 +716,7 @@ int xe_device_probe_early(struct xe_device *xe)
>>   		 * possible, but still return the previous error for error
>>   		 * propagation
>>   		 */
>> -		err = xe_survivability_mode_enable(xe);
>> +		err = xe_survivability_mode_enable(xe, XE_SURVIVABILITY_TYPE_BOOT);
>>   		if (err)
>>   			return err;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 1f710b3fc599..e1adcb33c9b0 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -129,7 +129,10 @@ static ssize_t survivability_mode_show(struct device *dev,
>>   	struct xe_survivability_info *info = survivability->info;
>>   	int index = 0, count = 0;
>>   
>> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>> +	count += sysfs_emit_at(buff, count, "Survivability mode: %s\n",
>> +			       survivability->type ? "Runtime" : "Boot");
>> +
>> +	for (index = 0; survivability->boot_status && index < MAX_SCRATCH_MMIO; index++) {
>>   		if (info[index].reg)
>>   			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>>   					       info[index].reg, info[index].value);
>> @@ -169,6 +172,10 @@ static int enable_survivability_mode(struct pci_dev *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Only create sysfs for runtime survivability mode */
>> +	if (xe_survivability_mode_is_runtime(xe))
>> +		return 0;
> 
> I'm double confused here:
> only create when runtime, but then you return if runtime?
> why to only create on runtime mode? or why to skip here?

Maybe need to reword the comment. Runtime survivability doesn't need
to initialize heci or vsec again.  That is applicable only for boot
survivability. That's why the skip.

We need only sysfs for runtime survivability.

Even Runtime survivability can be on pcode failure while resuming from 
d3cold or on critical firmware errors.  The firmware errors don't need
fw register logs but pcode failures do.  Separating boot and runtime 
will cause duplication so created a single function with enum

> 
> 
>> +
>>   	/* Make sure xe_heci_gsc_init() knows about survivability mode */
>>   	survivability->mode = true;
>>   
>> @@ -189,6 +196,17 @@ static int enable_survivability_mode(struct pci_dev *pdev)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_survivability_mode_is_runtime - check if survivability mode is runtime
>> + * @xe: xe device instance
>> + *
>> + * Returns true if in runtime survivability mode, false otherwise
>> + */
>> +bool xe_survivability_mode_is_runtime(struct xe_device *xe)
>> +{
>> +	return xe->survivability.type == XE_SURVIVABILITY_TYPE_RUNTIME;
>> +}
>> +
>>   /**
>>    * xe_survivability_mode_is_enabled - check if survivability mode is enabled
>>    * @xe: xe device instance
>> @@ -251,16 +269,18 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
>>    * Return: 0 if survivability mode is enabled or not requested; negative error
>>    * code otherwise.
>>    */
>> -int xe_survivability_mode_enable(struct xe_device *xe)
>> +int xe_survivability_mode_enable(struct xe_device *xe, const enum xe_survivability_type type)
>>   {
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	struct xe_survivability_info *info;
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   
>> -	if (!xe_survivability_mode_is_requested(xe))
>> +	if (!xe_survivability_mode_is_requested(xe) &&
>> +	    type != XE_SURVIVABILITY_TYPE_RUNTIME)
> 
> with this, the function name and its reasoning above is incorrect.
> "xe_survivability_mode_enable - Initialize and enable the survivability mode"
> 
> no, this function is not doing that anymore. Rather it is getting log
> from fw about the boot survivability, or at least initializing the
> struct for that. It probably deserves a refactor with some better
> naming on the purpose.
> 

This was named init in the initial series, later renamed to enable in 
later fixes.

Having two functions init and enable seems unnecessary since we are 
doing this only in error scenarios. It'll be something like below if 
have two functions

int ret = xe_survivability_init(xe); //all sysfs init and logs
if (!ret)
	err= xe_survivability_enable(xe, BOOT)
	if (err)
		return;

Should i refactor internally instead?

Thanks
Riana

>>   		return 0;
>>   
>>   	survivability->size = MAX_SCRATCH_MMIO;
>> +	survivability->type = type;
>>   
>>   	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>>   			    GFP_KERNEL);
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> index 02231c2bf008..559d1e99b03a 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> @@ -9,9 +9,11 @@
>>   #include <linux/types.h>
>>   
>>   struct xe_device;
>> +enum xe_survivability_type;
>>   
>> -int xe_survivability_mode_enable(struct xe_device *xe);
>> +int xe_survivability_mode_enable(struct xe_device *xe, const enum xe_survivability_type);
>>   bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>> +bool xe_survivability_mode_is_runtime(struct xe_device *xe);
>>   bool xe_survivability_mode_is_requested(struct xe_device *xe);
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index 19d433e253df..01f07d9c4124 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -9,6 +9,11 @@
>>   #include <linux/limits.h>
>>   #include <linux/types.h>
>>   
>> +enum xe_survivability_type {
>> +	XE_SURVIVABILITY_TYPE_BOOT,
>> +	XE_SURVIVABILITY_TYPE_RUNTIME,
>> +};
>> +
>>   struct xe_survivability_info {
>>   	char name[NAME_MAX];
>>   	u32 reg;
>> @@ -30,6 +35,9 @@ struct xe_survivability {
>>   
>>   	/** @mode: boolean to indicate survivability mode */
>>   	bool mode;
>> +
>> +	/** @type: survivability mode type (boot or runtime) */
>> +	enum xe_survivability_type type;
>>   };
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>> -- 
>> 2.47.1
>>


