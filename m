Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0114E7718D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 10:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873FE10E494;
	Mon, 23 Dec 2024 10:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7Jw/J7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125F10E48A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734949596; x=1766485596;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ovmZEf+wYocYrQb3CbVI+is6ZbfQ1YoWXOh/ijNkVRc=;
 b=d7Jw/J7bKLC2gZ/vkN3ZE+NozAOul5nNk6p5iuvZJoVkYGxEDPjMEZOK
 JXg3UdU6Q8dVojdf69gk7DTaAn/EArIwm0xKwq0UiHTsbF91m2JiVGTkm
 7m2W3aL0Vm4oFx2mkJud0kgW2fEbsmRqv0cFSUAyC6Dw6p0VK11LdsR3m
 ljhzD/8ZcthDyVli8rsmQcXfxf1DLYH61SR9NxHysm/Ouox0vBc1yKTv0
 dowyurUgvYGuPWzxBc3wvu6b9OuNAL4/kBwnzYXRpMZMB6ecDjuW8V5M6
 v9PySTWyK+2ncC85RCvv5hVTMtLqq2MSw7LHJG1NlPw2WTawGHMFL5I1x w==;
X-CSE-ConnectionGUID: rlphAiaaSh29rMGwBsuPog==
X-CSE-MsgGUID: 3wXbxe1ESeu5AE1Kb/Dptg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46418056"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="46418056"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 02:26:34 -0800
X-CSE-ConnectionGUID: iOy6aExKSBa7bVpax4UJYQ==
X-CSE-MsgGUID: Wk930xeTRjWBD8IfxHVABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="98986787"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 02:26:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 02:26:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 02:26:33 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 02:26:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRldyLAEA6aCP8zcIp5KrQpjAHvA04ZO0PQp2FGCAYPGituxsqM1ieANWPdZqh4tVn4el7blpuoFunGnWpQZoVkVpnMh/wnTpdVHC9fFtCZBF06BUoxv8Fwwmv+j7bnDq/VsCLOYEXheeVdYwNZsGKvha9nUclFwb2fmoDI6qzSiPuUWGvXenCzuzA8JwqmJhSdnY55mle40H+laDzG7IDW58gU/URaFgF0eRe0ggvtCUIqO2PZbdLVr42s1DGoOpsq8eVAiUk/bDIbxZ2qpBTeL0bUxtFz3uXSQo5TtPgret34HVt8A2LNgO8snfvvlpDt7PtOdle2UmuYso4Q1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd+LuTXuOZ+UjaTIdzW12/Q+vbkEciSIJ2FDAY2mIOw=;
 b=SqK00zLroPnxul6ecp+z7joMn30lfKdJcE61oE+BFtpBhsgS+XcVxsaiBy0TTCr0qG0deH5qX2gCkLn4N8SRjc5jv+UBpzzs3eDeYbwucc2QfyDJdBacjoxnFux3kSnJdX4VZxcxTtQAt9LaqELT2RNI70/EFLYkiJy4sPKeVx/HnGVnRSGAsufacEuO/gvqk/gtCQTNB+34zrqDYgSnh7D9g170Bqn2dn8HMtWa7oVf671v3fnPdwHh7easnErAUQiz17e9CbLutKCw9VadNqXpp5MwYWaPwFv+jXaKEZ+ia4dgZVS3xC90yuT1oJzh5AIlvJ7e+IDG+A7bmsxdaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 10:26:26 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 10:26:26 +0000
Message-ID: <b6c02a18-70a4-49eb-8d47-a688961b2211@intel.com>
Date: Mon, 23 Dec 2024 15:56:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Print vm parameter in xe_vma trace
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <Thomas.Hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>
References: <20241218164833.2364049-1-oak.zeng@intel.com>
 <20241218164833.2364049-4-oak.zeng@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241218164833.2364049-4-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d93df97-1c7b-4caa-79f9-08dd233c41a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3c1c1hBY1J0aDl1aW4rcG5QWVR6U1VUWC96cXRzUmZTWk9xQzFoN0t3T3Ev?=
 =?utf-8?B?bjBJN1p2dW16bU5Ba0I2ZlRFaENFWllVMVhxcUY1dzhMRytnYlJ6SG5jem5C?=
 =?utf-8?B?UGxPWVFzcUNrNFVBWTVGWXRSUyt0SXNrbUUwZzFOb3EycE1zZjJiRTNKcWcy?=
 =?utf-8?B?R0duQlBhR1FuZ01ESk80blVVOGtueDBhcXJiSkNBbG0rNmpBcXM0SXZIOFFD?=
 =?utf-8?B?MkRpK3NQUUU4SVZLc1BxL2UybWZrd0RCZDM0eTI5OTMxYnBJNWJjL2ZyVGxt?=
 =?utf-8?B?ZStaWmx5bU5PVWozN2dkaUp0YmFQVVVoSUQwQkZMclNqS0V5OWVJTUh4QTVm?=
 =?utf-8?B?eVpZb2puWXp4YUZieHMzeUlsSUJON0NnbHgxM3FPMzNUdHZjQTVnOFhpb0dz?=
 =?utf-8?B?UDd4ZHJEYVZ3TW1uejVtNitvTkkvUkIyRTNveS9yUjJGaS9uTjIzZUdlMmlz?=
 =?utf-8?B?QkJyNC9YaVpJQnJFeUhydjRNR3NuOFJBUEllbkhaY1NsSnRHbnVya3NXNE00?=
 =?utf-8?B?NytRMVBzYXR3NTB6T0hhRnQrekNVRUdlcXdoM0g3b2dHYnNYYTQ5aXVvUCtp?=
 =?utf-8?B?eWEwSDhtNFc0c0pjQzZ6eG91dUliY2FIcENGMit3MHFYa0tVUXg0Q3pKVjNi?=
 =?utf-8?B?TkVXbU1NTmQ0bXhiWmZuTmVjajBqdFVyOWVzU3VtdkYxcXNLRythSDJSSEJn?=
 =?utf-8?B?bS9maFJWcVpiZmdZQWpJdEdBOUpwdXhzaFdPYlNPeVpxNFhja3A5VU5yOENr?=
 =?utf-8?B?a2UzSElML0JUbkliTDlMeDFDL1hNUStmeUdSbnZwT2hpOTExVEgxbGJiQkVL?=
 =?utf-8?B?N2tFVmZ0eENzQThjQjIwV1RzNjhlZ092Ym9lbHNrTXhtQ25temVNbjFlazZF?=
 =?utf-8?B?V2w5eEJJQkZ3eThncXlUUTJBUmF0NElOL05kS3BzYUoyTk1BeGM2ZHludXFa?=
 =?utf-8?B?TzhIaE95YjhqZGd2OWwva3VOMC93MjZPaStWTkhmTzEwUGhkUVBoV1Bpd1hK?=
 =?utf-8?B?Ri8wWXlPN1RDeXYrb2UxNW5RNGlUWncyelVDMUhEWFMxcTd0UlZ5VTRGMzNy?=
 =?utf-8?B?aVZtMVExREwvNXVsY2h1UzdxTkdvNjA0U0RFT2xOZXhVaUgyU0d5L05rT3dy?=
 =?utf-8?B?c0tqK3VrSzZIRGFpb21jRVZzeU1OUncvYVFpaXF2Q0NJL3hYZ1VYdnJxZkdr?=
 =?utf-8?B?dGFhMkF1NUZLcFRTdW5VWDVLNDlKd2JQK2lOUHEybjZRZzNFdEFoZE12Yk4y?=
 =?utf-8?B?N2l0Qm54QmdCbWV3TTdiZ2x4VUtNQ0o5czlERThLTTdZeGgvNmw5NzdjNUZh?=
 =?utf-8?B?U0QwRlF5eVRqOXA3MDBVN2drQlo3NE5WaEFRNnphNnBJUU9rUVZhdHlrVGp6?=
 =?utf-8?B?WFpmOXAzQndRaDFOOWtBbnpzZ1ptSmczKzJ2a1ZmSkNyUE5rNTEzUlVnZmVF?=
 =?utf-8?B?dndTWWN6eTlTS1FPc2ZSelpHVC9jaTNteHdRT2ZXbTVBRVpIcFVORGNwS0NP?=
 =?utf-8?B?UzV1dVV2eGVEL2V6M3BNeVpuYXd0bXdZMEtSTmhvVVM3N2M4YUpJK0FEczE3?=
 =?utf-8?B?T2VidEM3MXgwKzBQOUF1anQ4c0pUVVljYm5XRmpTb2JxeStjOXIvVVZxb0RO?=
 =?utf-8?B?UmE4ZmRHVTMrSHZla05mN1RCaGRKU2kvSjBWZ0pWVzZ1WTdSZ1VQZi84Y1BG?=
 =?utf-8?B?V0VnWHVwbkNDclp5d3E4RWIvV3M1dHFqem1MN0grcnB1TW9yZ1VROFBOSUZr?=
 =?utf-8?B?Mll4aXNvdXp0dGdBRUgxREhWY2xxZ0kvZS9KNHBPNTBqTmw0NGFOSVdVV2tH?=
 =?utf-8?B?WDhwWkN4ZjZuczUySXVNOHlPbjJIeWVrSTNEdHlJaE9mc3UvVHo4b3E3TVBm?=
 =?utf-8?Q?mcqdlw7JZhXOL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklrdW5iK0JzUHFrNURvVEIydm1NOUdsMEJWQmVxdDF1S28vSmk5bDlsdmI2?=
 =?utf-8?B?UHVsdTVWTXdpWnpBWlBmKys3YUdaNVpId2t3aDBuTUpXNkFodXZub3NyaGRD?=
 =?utf-8?B?NTl4djlZdm50dWkzLzcyUm10amN5eFdhQWxKQmZodjcvWnZ0UlBhanprNFdK?=
 =?utf-8?B?NS80ZmNOUHMwVEhuc3NkYTY3c0VGd0plcUJGS3ErWXF3UVBkVWhsUnFSNkk0?=
 =?utf-8?B?VXM4TCszY1c3aEFBUXluc2FoRHFSL0hHNGl0YjYyZmlYeEdYTittRW54V1h2?=
 =?utf-8?B?WHpRaXV3L01PZFJwY0p0aWg5SXlJbHYxMHc5c0NIMVNSa0pwSndxeWFyb0NV?=
 =?utf-8?B?THpWMGZ0dDZuU2ZCU2VYeDltWjhNQ2d0dExRdW4zRzg4dGF1OTlRMHYxbENh?=
 =?utf-8?B?Z1hzTDZOU3FGcVd3Uk03ZU5yWmNzQk9lNkpEUzFybENIRnJNTTlrTG5PRkg2?=
 =?utf-8?B?V1czV3Roek1KYWs0WTV0RnlFOW1QbEtsOXVubUdycy8vWEI5Y1FCb285NzU2?=
 =?utf-8?B?ZDljN3I2U3hERm4xQmlIZExudzhpTVVkdVFEQmJSektTWmdHaWE2L0RSZkNV?=
 =?utf-8?B?U3lZWkd0SElqaWQrYVZYTkZydk1vaXhxV1AweFdBR1BJZTJiYjA2OWZTMHJi?=
 =?utf-8?B?TlB0ODZaUmJLNHV3ZHhRMmRTMTRrWlRYc25KSjZBcmtva0o0VjBnTnZpVElJ?=
 =?utf-8?B?L29rdzkvYzFXLzRTcHQ0NlVocHI5VHd4V1krelBlREE3UWJQdGtnUHBmMDlj?=
 =?utf-8?B?UEZkdFYzUDJ5V2szQ0FYWW1NeGtTWHlEYWtMUmtkNWlSazMxbFZGa3ZwUkh5?=
 =?utf-8?B?Vm9jbVFlWmNNYUVjT1ZNYjFHalZDWmdtQWJqL0lDU1laWWtsZEplTjlyRjQw?=
 =?utf-8?B?aWtCaHZNUWZFL3VRSXJMdi8yMXFCRktnU3NtaDRGMVBiRDRVSzNoeXlQMmRs?=
 =?utf-8?B?bi9kQktOOTg2a2xPRUpObUx5d3pOZ3Z0dGQvZjJreGE5U3F4ZUZHVzdvNHZn?=
 =?utf-8?B?SjA2RFhZZStlbEtLRlgvUS9VMm9CSjg1RlM5c2FnZGJKS1k3bkZ6aTZWTFJj?=
 =?utf-8?B?TDlRclVuWFRlTENtR1N5SHlONEdHUHgrMmdlZkdHeW01dytHTFRUYXEvN3hi?=
 =?utf-8?B?bG9sSmNnRzZZdFpWVUNsVkEyeGJYQXRCZzA3OWxZejdBL0R5NzMrNkRDSHFu?=
 =?utf-8?B?TDhXR2I4MXRISUpzRFoxOENDWlNVMVV2RlI3YkR3SXkya0RHRnBMSU92MFg4?=
 =?utf-8?B?VUo4UE05VVpyK0QrZ2lmYVR1OXdnSEwyR1o4di9xYU14dk9Xa2JpdHcrK0V3?=
 =?utf-8?B?cWNNbDlyZVJCU3BCWDBNVTRWWnJZbnprN0RIRlVidGdaWC9kZU9GS09ZMC9i?=
 =?utf-8?B?bDVyL0pZTXVQcHpndmRzVDhzeDN1QWdTYXUwenV6Qm1ZVEJDcU1GNWJPZ3Fm?=
 =?utf-8?B?aWR3TGVWWldjSmFEckQ1VitvS2RSOWR6ZHVyTmFEU1VMQzFxWUpDRkc3dzU0?=
 =?utf-8?B?dy8xM29BeFBNQkZIcjVpVVdKYkNTcU1mamNhbVdMbFZONXprUzBXSVBxb1JN?=
 =?utf-8?B?K2N2aUNCWTMwYStjWEU4NXFZeHNtbGt1TDlaNnZqMHFsWnU3OHRWTWp5SGkr?=
 =?utf-8?B?TUpZam5QOVM0V29BMGxBSCtEV3lNYityTWhSOGhHTEJMUVBaeURaTTF5aml1?=
 =?utf-8?B?YUdVWXhDYXdhU1FWelNQRDdoSDBka1c2UVNqWEE0Z2k5YzNaOWVIVUFrMmdl?=
 =?utf-8?B?d3g2U2prNEJ3elRxL21LRjA1UkIzRExmL0h1T0YrZzk5Sk96L0VSaHNoUWwy?=
 =?utf-8?B?bk1YSlpTcE91cVNBcXJWMTNlYndMbWxMV3h5Z3Yrd1lUd3FvM3lEOFFWZ2hL?=
 =?utf-8?B?Q1J5VGFyU0pzbG4wZ0pRRFkwdUVxbEpKMUxRUm15UzFhT0xGUStBNjVzY2pt?=
 =?utf-8?B?L3VPTFpPVWZ0S2VDd0JTcWI0MjdVaFp3RkV0MHpDNFM5WThKUlBrNDErNzBj?=
 =?utf-8?B?OVlFNEFKTnIwUmZ0OEMvRzB1R1FvWVo2ZlhyTkdJdGNFaHdHc0RuSGNqU0tH?=
 =?utf-8?B?QUpiK0ZlVlNhbTZNZWU0WWpOdHYzMnF5QlJXRTBYL25ERytXbGtWWHhzZTBC?=
 =?utf-8?B?d2JVeURad0JoVFRBUWJjSEh0aUdxR20zNW4yVm9Tays2MWV6QlFwSlFPaTVL?=
 =?utf-8?Q?vbcz6t8V3wAytRPlfmeZ4KM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d93df97-1c7b-4caa-79f9-08dd233c41a3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 10:26:26.5563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebGhNomPJz4eIEqzrOaHp6ABS94jNFz6XZJVMBVXMwVoOCiuU4uEUf4wv1AUZUGceiKTRBR2ravGSnRsc7CXs/dPVgY1T7uc6rxe+EYQnSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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



On 18-12-2024 22:18, Oak Zeng wrote:
> Print the vm that the vma belongs to in the vma trace.
> This is useful to correlate VMA operations to the VM.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index a46f7cfd92c6f..ce4d0d7e81017 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -92,6 +92,7 @@ DECLARE_EVENT_CLASS(xe_vma,
>   		    TP_STRUCT__entry(
>   			     __string(dev, __dev_name_vma(vma))
>   			     __field(struct xe_vma *, vma)
> +			     __field(struct xe_vm *, vm)
>   			     __field(u32, asid)
>   			     __field(u64, start)
>   			     __field(u64, end)
> @@ -101,14 +102,16 @@ DECLARE_EVENT_CLASS(xe_vma,
>   		    TP_fast_assign(
>   			   __assign_str(dev);
>   			   __entry->vma = vma;
> +			   __entry->vm = xe_vma_vm(vma);
>   			   __entry->asid = xe_vma_vm(vma)->usm.asid;
>   			   __entry->start = xe_vma_start(vma);
>   			   __entry->end = xe_vma_end(vma) - 1;
>   			   __entry->ptr = xe_vma_userptr(vma);
>   			   ),
>   
> -		    TP_printk("dev=%s, vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
> -			      __get_str(dev), __entry->vma, __entry->asid, __entry->start,
> +		    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx",
> +			      __get_str(dev), __entry->vma, __entry->vm,
> +			      __entry->asid, __entry->start,

Looks good.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   			      __entry->end, __entry->ptr)
>   )
>   

