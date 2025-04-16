Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CCC369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 20:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7258E10E133;
	Wed, 16 Apr 2025 20:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkMNxX3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534710E133
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744834747; x=1776370747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=azgmj5DZ8HE+tmxMVohIDWqKXeu2rC/77wLvzE+pq2E=;
 b=VkMNxX3nfHFWCNAGoc1S//17aweJG+utXsOtLPOkrYSPM15+7ycmZ+Tt
 SMaWqehwCMgZLyix5C9pYvg3QuQOBqAeFvM3Rn8Lb8+8aBSJYD2Mr59Pf
 MHJ16noQpizbB+aH251vDC/y8wTV8Sl4wId3z1IBc0sWz+HNFKiZzsSYy
 vATPHmZb8sa6d6muzg1NmIKoV0HeJvbv9yUBnRtpk4MODpJ1+6d/RJL/L
 DuC6dtXQ31Un95Tq1rXiPo2fuglIRKk9Czdn6FSk8qik4GzDJhfxjfCJT
 ++pS7HTowHXh/8Y88kG/zGyeHHqzgdhmlDDgjY55+GoRMWGIZsjHW1ryc g==;
X-CSE-ConnectionGUID: mdVVNJwyS126/qEanb6gfQ==
X-CSE-MsgGUID: 2EwVgf82TBWRl+46MGZcXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57069409"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="57069409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 13:19:06 -0700
X-CSE-ConnectionGUID: uH0rIJv4T8GNvGhfFg7Ugw==
X-CSE-MsgGUID: TF3mr293QQeeR/GGS/tZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="153775501"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 13:19:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 13:19:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 13:19:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 13:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntnHgjPrXP0CoccPImYobXgjBbn4FHLtoihMhCrS8jga8Qp6Jlr4Ndx055W8XxS6al7wphUxQEbZBNTtbf1tb6DVSIzEnXxsU+T9+JPfzcC2+yY8Xy5aKcrOZCL4IEzQuzCXcruiP8C39bujEgYcm8pInXeNTKSlXpa4+Zq/QjUDK9BJnkN1JYZJ+2CdgcslGhD3Fz1LFVAdlYsPWPC3SvLW5wkOiTL306x2J7xnAv59CPNRACdaOULzxdeb5k9vj7Fhm1JvnpMdUQAGkytJBR5LvkfWk+0b8I6QsQGuyAokk6slqrv5+U7uFsevO5MvTSmMQ7GOkdxmrI4gSGY69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhc9PWaL0BgNZz9HfBS5UxsYPQJjgPnvAoH4YDmkiBQ=;
 b=gY3tq74+6oYMwcKYKfDlFa7Qh0LcB4V/ogarSu90VSvR1Ia+6jLUOzWM7+55p/yYv9LBLE0elQ6owJClonYqfDbKcNMb+6JtSzM5Qm4WY4fgdd1mUwXP1yTO/HNwWT7JwYUc3KzS/Du4pVtwmJDBUYYg1Qumt50teULo5+MkN/NZojJdW/vU/z74CI3knBBdCoS8A7zpZw8ka2zl9ZwPKqnrXpTQMJk1HJeWngOsAK8ZviW7WG5H+VXkZDQbRPY/QcTzBmKSLPZzOVxvoKWDB3FfwMXSxOWzUOLEgNGgsl94jzm8zrI1ztNp46WpWikanuZJNKVk9iBAqnyM8saeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 20:19:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8606.033; Wed, 16 Apr 2025
 20:19:03 +0000
Message-ID: <02bd7701-9e39-425b-9bf4-27826307dbdc@intel.com>
Date: Wed, 16 Apr 2025 13:19:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pxp: do not queue unneeded terminations from
 debugfs
To: <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20250416201622.1295369-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250416201622.1295369-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5210d021-94f5-4e5a-c536-08dd7d23ee48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjVmeGxpeExocWtRQWpoNEVCRStYSGFja05vTHZVdlNJOFQ3cHoyV1dLSmNP?=
 =?utf-8?B?Y20rMWhQcmRYWnZGUVdzQU5MWURPYzdMbDh4aTYxamc3dFFQQ3JmWWx4KytK?=
 =?utf-8?B?RGZoQnZFYWpsekg2L0Fub0tXYXJCT2Z6cWlKVnZ5OEJOR24xbnVnck9Eb1dq?=
 =?utf-8?B?aUVYd1ZZc0k5Y2FDMEVvakMwWVhZNWxXa3pibDlvMW5vWGZpa0gyRjVXSXlx?=
 =?utf-8?B?eU9INklMRkNTK3hDOVRxTmp5eTUwWGxYeWo2Ri9SaXB4OTZ1YXM2OFhuUnNt?=
 =?utf-8?B?VkNrd2hHMEFKajhrT09OcFJSU09IQU10YWpMSUxyQVkxeHBmQko0RE1jZStY?=
 =?utf-8?B?MmhrNFJxSGRoSXlBcWZSMno0enBOU2dUL0VhVHZHOFBOTE5YRTJEcFdrMmJr?=
 =?utf-8?B?bTU3Q3hEOUJzeEVHRUdOT1c3dExJaXB0QnBleXlob0RQNE4yZzRGSnhSZFZJ?=
 =?utf-8?B?eVJLTXNsQThCb0V5NnJPdklUek1oK08yKzhzYU5YTlpteDNGSTF1MVU2OGMx?=
 =?utf-8?B?ZWZ5Z0hLSkRtQmdCUzhRb1dhYjdSNzNvK3JobmJWOU5MNmdxY0xReWNqbUxY?=
 =?utf-8?B?TEFOYmVhelQwalhhem1WZFgvMTZ1cEs4eklVV01FWUc5clM4MzRRcitvaEEx?=
 =?utf-8?B?UlNXTm4yazBRYTZXbUt5MWlBSUxRZ1V2M0R1MTdhaGdtY1ppTkxFZWlVOWpt?=
 =?utf-8?B?UjFjZXN3SnJ4ZDhLUk5IQ1RNYWNvVjgyRC9Yc0NoOG0wWHRDckhjQzA2OERE?=
 =?utf-8?B?bXZGVTQxS0JFdytLTERjUnA4M2NYc0pvcWw3TElBSnhkUGhzYmhpZ0xLTmpt?=
 =?utf-8?B?bkVFWXloVzhJaEFUczB4MEd4OGpLS29XbGgxSGthZXB2SE94OXdpTzA2Q2d2?=
 =?utf-8?B?SHBiZG1JdjdhRStKT3JYdXZIWFFLYm9BbTRRa1kxclMwTlp1bTMxVGpVeXFD?=
 =?utf-8?B?enkzVE1yN0ZTUDBxeDlEQ2RHTTVOVEJXWHJjZUJhU0JsZ2ZaMis0MC9ITTIx?=
 =?utf-8?B?SmlaNXBBNElsV3RBZEtQRkxEWEE2YXVmcUtlVkIwWXlPakppZW4xVm4vYnhU?=
 =?utf-8?B?KzI2YzBNeUIzeFV1Z3dvNEhaZ3BrajRkRXRUcWl4K0VuUFVqZ2VlWXRDNTBB?=
 =?utf-8?B?QTlJR2xWd0M5ZG95Mk44OVZQRjlIZnozVkJmcmFTQjBLbUtWcHB4cTd2RlY4?=
 =?utf-8?B?NVNDbFRzSU9WQXFIekUxSVZhMmlib015NTdPcDEyUjRZMkVSamZ4bFJUWUZa?=
 =?utf-8?B?UlZERExzNmNSUEhoSUZtQmMxbTltVlBsamd6YnF5ZUxBc0FKdmpKU3FtbUdX?=
 =?utf-8?B?czlWMEpNczVpQXQ3bzNMbGxZbzJGTlBtRks5WWRVQW54ZkhjWXorN2ZtdU4y?=
 =?utf-8?B?cGY2TlY3YzV4d2srelFWSlJTVWNLYzBLckNIZnZHcWlwMEhXNzFtUERLWjVJ?=
 =?utf-8?B?NHR6QzFKT0gvVlpOVDQ5N0xkM043b1hublV4TVNiRlIvMzNjZXJ6MVJWakJQ?=
 =?utf-8?B?WFFUQks5QTVZQjlmZVVPQTNZdUpQbjYwSGx0V3NSVFl0cmFXRG0zM2FYcTBP?=
 =?utf-8?B?S0E5YVlsUUJWSVJqdDFIejc1R1F3NklNaWVncnhUSUs1U1ZRVkhwcGRjN1pT?=
 =?utf-8?B?WFprOTRUYlhrcEZBeDdZVUZjSU5vUVJtWmJERkFFRTlsd3RsK0xVS2RPQko2?=
 =?utf-8?B?dytsRWVmdmJHVCtDWTZzYXMxYWh3cXlBZkRINzlvTWlQM3dYZUdMUmdHdmkv?=
 =?utf-8?B?NEU4N2VDNEszcnRvM0JrWU5oUXRVQUdRcXR2K1dwYzk5ZWdSaVJFM25GMFJm?=
 =?utf-8?Q?CA2mf3GBxXewBpN214zx5gGENvJ1GxgFiNEUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNPWFpvN2hsdE1rSGl5cWhHaWJNTDhBaU1nOEhaUTNvUWxyRkcxVXZieDlB?=
 =?utf-8?B?R1NMWVhINjlLdlhHOG81bXV0Q1RzcjkycTFaQWQzWFFOODhrMk4xd0VzODVO?=
 =?utf-8?B?Z0JVNGZPeFUxTlF4dDZ4K1J6cUdQdWdFK2hMcWNHVytadDdNU3Y2TmhMbkhj?=
 =?utf-8?B?Zjk5eG5lK0dsdjc1a20zYk45L1F1eml2UER1aHB3VTZCOHFtdjFPbFBuL1ls?=
 =?utf-8?B?aGUzNDF5eXl6RFFBTnJrOGlIcTdYajZNNmMrMEh6ak9DTTVCMUllMU0yWGNw?=
 =?utf-8?B?TSttUzl6QnQvUEh1YnRLcXg2ZmVoOG5hVG4xVjBPd1ZWYlQvOEVNeEtiemht?=
 =?utf-8?B?WUprQS8yK3dEMWhFVFM1UXRYMUFNYW9nT0piL0hZOGJDendjeW1sMm9JSGxU?=
 =?utf-8?B?MlR3dUJyendFWDJERVlucFBIL2RTQnVMNmpGYXVKTlpEb0xXemtGcllEdTJ2?=
 =?utf-8?B?TVFGaDBnTWdpTzRrb1ArV1lUMFBVSGxrT0dFOVpUL25oMmx0dDdDbkxXaEtu?=
 =?utf-8?B?WDNCajRBbWFnS0NZNVVBRFFObTQ3VjkyZjZ4c1laVFRnS28zMk01aks3S3Rm?=
 =?utf-8?B?dVhudEJwR1lYNStTZzhmdjdkdHZTQ1VPVzFwRHNJajJydWVFWUpvU0VEZHdU?=
 =?utf-8?B?WUlpUmtVOTY5M1dNZE1GR0NuMmlENUpVdTdiRG8raUswaThhQStGeGFRZDRH?=
 =?utf-8?B?eUlWaURYRUlyR1EzQmxXemxleU1wenQ1ZGtwRkM1R1hLTDVCT0ZNL1l0alJ3?=
 =?utf-8?B?UGxnRHZ3WnZHRXdGemRNSUFyT3FpeWl2RjUrTHhQYUt6YXk5RU1QbkdwRTBC?=
 =?utf-8?B?NzNuME1TRlAvSGxZa2c1Z3E5cURWM2w3QUJ0NW1GS0k5MU85dWNQQ2M5bldO?=
 =?utf-8?B?cVNCMlhXQ3lUNU42eFBHU3E2bkRxT0sxVU9aRDJpOWNmNGI0UHdjKytaaHNa?=
 =?utf-8?B?WjRpWHExL1JpVVZOOFVZenhCVEM0QmNBRDBaMUMrUEpLTVkwcDVQNlFsN3gy?=
 =?utf-8?B?cjVsV3ZUSTYvRWJEcmdMbGJ0eHJMdkdDQlVURnlacnhYNnlCRHVidnJjejZa?=
 =?utf-8?B?ZU1hdXFqSmVkUDdFb2F4QndhVVRSbEJSQXpQMy8rUnBoeER3RHY0MU9sMno3?=
 =?utf-8?B?ZUE0T2xobkp5ano4S0NPOSs5QjBxVHJHT3FIalZVM2lpRHZ5RE8xTFpMRUYz?=
 =?utf-8?B?RzhFODVNa1NweGJxamx4RU5ZWXJQQnZ4aExJVExEVVh2SjBUZGlENFdiNm5S?=
 =?utf-8?B?L2cwL0VKSjI4VE9Gd0RpdkI1TG5QbjJpQURmSDRBeVpYZXRzbmp5U25ld0t2?=
 =?utf-8?B?R3BleHpIbjV4S05SWkU3YXpYUTBSSnFSWHd5Y2lJelFWdXBraW1mK2ZSOU55?=
 =?utf-8?B?bUdvRkV1TmxFQXNtZHNJbXduSG4xNXJacnlvYThvQlFJcitFa2MyVVZhYmxx?=
 =?utf-8?B?NzNGbWZDaXkxMlA3eHUvMjU3alB4UkpOUWpGcEszeWJ6b3Zwa3hBNU1oRVVH?=
 =?utf-8?B?NkI4Tkd4aFhaMnJ5eTg3Q0JNWU82V1VFUlIyaVBKcVpVRHQ5YWV3Z1BwRTNB?=
 =?utf-8?B?MFhSY2Mxd01qSWc5bGs3elQ5K2Z3MitMc2hST1UwbXoyeE1DbXRsZWxzV3Mv?=
 =?utf-8?B?UFp0Q0xWYXRZd2V3WnlhalE0QVF3UHNNRitBZktrZHVTSTlGN2tZMlV1SEsy?=
 =?utf-8?B?U0dkYmROMGVRV0hLK1p1dTloR1lKTlJsZVlzbXFCZHhrOGpvdml3eEthZUFU?=
 =?utf-8?B?WFhuSlpuTGh1WGxxalF0ODI3UFRjcW9XV2RIRXNVVzdseXgxMzl0Zm1lOTBI?=
 =?utf-8?B?SnBSUENka1JpejExUzVMVHJ3elVyNTJsUHJkSkdLNThwbmxhYVd5bnpaYTRP?=
 =?utf-8?B?VEUyY1ZwSlRwK0FhSDVWMXVQTXk2TW5aMzFJbXFFTWpGdG1KN1BjV3AzZ1RM?=
 =?utf-8?B?QnVvdDgzVlpkcFcxeFN2ejlFMkcrVkJwOHpMdDFaTEpZVmIyM0FVd2JrbzFO?=
 =?utf-8?B?OENLNm1EODkwZVdlTkVQbFp4eERBVWJyWlI5dUE2d0YyWXh3b2J1bExoOEFp?=
 =?utf-8?B?MlVKc3pBTEJLdW0vYWZQRkc2dWc4K3VJS3c2WXpnMDhLYmgrZTBROUhuS1Q3?=
 =?utf-8?B?eE50ajBvT2FLQXRZNmFROXhQeDdmQ1RwNkEweVZ6N08vT1podWJubTN4T280?=
 =?utf-8?Q?K5SkzHBWf8d9MpVgxuZjv9w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5210d021-94f5-4e5a-c536-08dd7d23ee48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 20:19:03.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHHN09zYCnttTY2+RP5rxIpxCN/oA5D9X/j5K9kdbht0XspdxoammAwrV2NCJ8WLG7erdRBFwajvWbJh234wORUGw2eBGIerRvWkqNmBREs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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



On 4/16/2025 1:16 PM, Daniele Ceraolo Spurio wrote:
> The PXP terminate debugfs currently unconditionally simulates a
> termination, no matter what the HW status is. This is unneeded if PXP is
> not in use and can cause errors if the HW init hasn't completed yet.
> To solve these issues, we can simply limit the terminations to the cases
> where PXP is fully initialized and in use.
>
> v2: s/pxp_status/ready/ to avoid confusion with pxp->status (John)
>
> Fixes: 385a8015b214 ("drm/xe/pxp: Add PXP debugfs support")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4749
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

I've accidentally posted this to the i915 ML first and John gave his r-b 
in reply to that email 
(https://patchwork.freedesktop.org/patch/648930/?series=147840&rev=1) . 
Just clarifying in case anyone is looking for where the r-b came from.

Daniele

> ---
>   drivers/gpu/drm/xe/xe_pxp_debugfs.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> index ccfbacf08efc..525a2f6bb076 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> @@ -66,9 +66,18 @@ static int pxp_terminate(struct seq_file *m, void *data)
>   {
>   	struct xe_pxp *pxp = node_to_pxp(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
> +	int ready = xe_pxp_get_readiness_status(pxp);
>   
> -	if (!xe_pxp_is_enabled(pxp))
> -		return -ENODEV;
> +	if (ready < 0)
> +		return ready; /* disabled or error occurred */
> +	else if (!ready)
> +		return -EBUSY; /* init still in progress */
> +
> +	/* no need for a termination if PXP is not active */
> +	if (pxp->status != XE_PXP_ACTIVE) {
> +		drm_printf(&p, "PXP not active\n");
> +		return 0;
> +	}
>   
>   	/* simulate a termination interrupt */
>   	spin_lock_irq(&pxp->xe->irq.lock);

