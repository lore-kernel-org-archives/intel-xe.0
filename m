Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C049CCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDA010E538;
	Mon, 20 Oct 2025 23:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhr90ZZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A83110E538
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001874; x=1792537874;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UdW/4OJoNU+HEN6pWmv/K+5hXiHL71DXx1KmQX4TsLk=;
 b=bhr90ZZPuZJiAf+1RtEpTCApzFNmcenoAQ7lp//Fw+hrNo6T0z7qZHUF
 7bU3+ayZkoOxdOLhsCfcX02Ycp0letHcyNl+cYrcPFf2rKKb6Ir3UE6gu
 zHVLjkArGvobGWHYzVaTCZK9rWNQHn4SbJxj6WyWOKkZnhmv9CzHKjPOu
 6nt/aYjvz/nrHfMSW2qVQS3Dta6VIeTqvuvWjo0EBFn97wtK4V3+g35Hf
 h1nJEskNSAMECjRSMHIFIndsW/e4IY5Xd+OmNdjK+BIwQ8VHUe9cDefDL
 2DUM2clHSpEzhQ/A+GLeEwKGTtBopdzuTDqDMOFYFRjjbpwsvCzpeZiFs g==;
X-CSE-ConnectionGUID: xy47EAtuQf+eELhTxgqWGQ==
X-CSE-MsgGUID: s+pa1Y/yQa+wnBUjO7a0fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62827225"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62827225"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:14 -0700
X-CSE-ConnectionGUID: Adntv5j8S2ma3hr9vDsZ9Q==
X-CSE-MsgGUID: VwLurwThQgWb8UUNGxnn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182999496"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:11:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kqz84L8eAAGb4a+kQhktBcVlHctrDHwM+T5WARptH+dYphHk9yhVg6nO8uQGdl65q2QTXbfOlNU8lTABDGltVGB1+flJuEsjUVZk8mzZs+tqrU1VuakA8DSdJwTBl68PeKbjgkAdESu+EXfeA3idUj1YmEv0uI9v8x64jj2gK6at9lCVYP0p/Quz2qIrUhQusCJmPvJVFcWuirhVis9ha0Gdr6XbdhL0/8H8ZaOgZ7lLuCfx40n95RI3Hm6C2OL/9ipwUd9SDq9m20uinjPstLl2RsuyqZ964XWKci2rvGD8tqumKVYZhC/ohOl6A6cNULYU4TjQGNcWGlLUJBkNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMKciDDPrXeiNqFWi9GEqCV7DvPyqVxg7H0XN5n4ieE=;
 b=oe/vV7NdT/c71PqnH56Z7MGbcmAW8CuiMm/RC8kbk92Chd+GnNbiAbYwEcfQ+lozGsT0gUIIteI8Af90XMDhFPD9UVw8hGoJ/ce52I1IXE4EPsh7n76pGXZsTeYySGYx748DxKJwfAovfCjeUKSUjWAq2z+Y02JQc+BHSdPqLmHa8In2jQCePT9XgcQ3k01husBn1rN3+nc7+XqYhWcXIx5KYRKnnuFMs4w51uncshto6MZcGaOhYiwHLCe4hxE+/jgLqIRojwbntcQfgqJq/2/GxD9QUYvFDDth8soOaa9SHfP6JkKcNBU1b58AEIabbJG0Y2cpVIvb14kXSxVzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 23:11:10 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 23:11:09 +0000
Message-ID: <48e7b91f-d340-49bd-8b7a-e4d05185e1f1@intel.com>
Date: Mon, 20 Oct 2025 16:11:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] drm/xe/guc: Only add GuC crash dump if available
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-6-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250828174159.1232994-6-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 70438832-d85c-4f10-45bc-08de102df436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk1DOHlsS095bzhIbXhkaHhRRGl1dzd2aGViM1RQVkFDR2FvM3VpY2VpMEVu?=
 =?utf-8?B?aWJTNk1KMi94VUdCbHpYRS83UXVOZGZORkhYTE9yeGx0a09sc01zTHVnVTlq?=
 =?utf-8?B?MktYcUxranRleEhGYW9oYk8zMVIybytyVWZEaEJSaGlSWnlOUTIrRkl5ZkxI?=
 =?utf-8?B?RjRZQ0Rzby9Jd2E1bENqQWdKZjBNRnlubDhLUDZRSXl1cjhqQVlwRVpIei84?=
 =?utf-8?B?b290clR6Qkt1VHd1ZGdsVVdMMTNjN3V3bHc4Q2VNeFVYYmlXaEg3aEIySkRx?=
 =?utf-8?B?Z3BNS1VhSzlOZkxpWUNCZ1VEaU1ram5jRDdRaDVhYUxyQ2hzRFAwYWE3ZDRh?=
 =?utf-8?B?QTNVNkVPcmtRRzNGR3ZabS9mS0ZSa3VJZ3IzZ3J2MERKSitMamQrczV6RVpi?=
 =?utf-8?B?dGg2aTVIVXNacEp4amd1cE1FdEJlRkxtRDBmMklkK3c4R3ovekdVY1FwQ0w2?=
 =?utf-8?B?WWtDZFNmeUhSdExpMkt5RDJiYURLMlY4ZFpMT2svWFBUZ3JnSGZOQk9GdjRx?=
 =?utf-8?B?dlh1WFlQWWtPTnpCQ0xBbUUwcUJFODBxUEJtbWFTOEMvVE5lOENyQnl0Z3Y5?=
 =?utf-8?B?K2Q0c3Q1SUNrV2t3NFZHZ1ZrbXN0eWs5eGpiYmJVMHM0cEQvZFE4QWIxUldN?=
 =?utf-8?B?aStMZVVBWE04NFcwTmU1N0g0aEsxdGMrY25EQTFJTmpJV210MWFmbFZTZnNO?=
 =?utf-8?B?OWw2Smhudko3RE1tQkJtUnpsdzd0TXV4cHFiK3VyUTlUYlJlWGFEV1p2Wk9V?=
 =?utf-8?B?ejk0STlmU0dJbVB6Nm9aUHRHbFpZMkJXaGtZZWU3S0hxbk9nNmtGTUJacDl5?=
 =?utf-8?B?c1RsT1l5UG5nbzl3VUpIRk1sbTdwSlJvdFJWNlVOZlFaSGNhbmZHdDVqVXl4?=
 =?utf-8?B?ZVFRcXpBYmROYnVjODZYVXNCUGpITlQ2dDR4NGVKMC9NRmlScHBkRnppeXdo?=
 =?utf-8?B?ajZuMDBoNVFvcG5nMDRpR1kvMjR4Z3lWWDdKdkRIdmFJZnlUYmpVV2xkU0dE?=
 =?utf-8?B?Q0lmOEhGdERoTDZkVTR1SnBiazN4dEc3ZWpENXcwVnByT3V4YzZwSnc3dlJm?=
 =?utf-8?B?R0tqSjh3di9sdUVBTzlJdnl3WHU0clhldWlEMVNjdFFkaFBVNE43WlYwK2VO?=
 =?utf-8?B?T0h3TC8yYng0L3Izam9JQkxaenpmUWs0bFJBZXVZd3dTVmdwRkdPR3R0L1hC?=
 =?utf-8?B?U0Rrbk9BdDVKNUZpVE9VYytObjN5UkhEcDhLeVVPcS9DUFp0bkZxbmZKTk5L?=
 =?utf-8?B?djNSZFBha2RkbW4xRkZQWFNhb3lIZGh1aHhVSGtwMWplVlUySkV5VmQrU0Vj?=
 =?utf-8?B?bk9wZE1QUmVlRy9OYmJHTjBmZ0NhclNhVVdTRzdUcmt1OVJ6T3l2SlF3b3Yx?=
 =?utf-8?B?czIxQjVVdjhVV241VE5qTkpFV294TkI0b0FrUTc0L3lISDE2S25NblB1MU43?=
 =?utf-8?B?MTlJMExsV3hVbldId0ZSYUp5bEdCSnlpRVhwK09TZzV4TjB1aklZMEtVR25Z?=
 =?utf-8?B?QVJCa0RleDRsVWFTME12MzRJUmpGTnFFRFE4KzRsMXlVdWJWQ3ZSSXNjVUZM?=
 =?utf-8?B?Y3d4eGtqMXNrVTcvd3l2K1BQWmRLTjdNWEljRmFNc3VKUUc1U0xmT2piTldo?=
 =?utf-8?B?MSs2Nk9KdWNOdE5Qbm5ETytvdzk2Yk9zL1RGNGVIUCtQZmJTNDE0ZFFacGg2?=
 =?utf-8?B?S05CT1ozNTVLY3hLSmVRMjRkZnB0VUhSSXlQcStiWVdvWDVWaXRiWXIvVng0?=
 =?utf-8?B?YllwZTUzZm95cjB6cTVVQXduQ0RvWjJLUWJSc2ZLZ1d3TUI1L1kveDBuK2pV?=
 =?utf-8?B?U3pnclU0Rk9wcStoVHFRYjByMFJZRTVXSWxKUzNhRHp0TmpYU1VNZkFYTXVS?=
 =?utf-8?B?UWJqZEVvYllkMVdObDBKbjFGUTM5MUVwc3FxMnFhMVFIY25RU2hQbWkxaE02?=
 =?utf-8?Q?lJuFEjzyuBcvbe/+Mb+c6agsTj+XY1CW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElOaVJtWDlGV1dkbzNZWFZ3TFZZOEpiZjRlZjdxRVdtZmZWb0E3K2RvMzVT?=
 =?utf-8?B?VGoxRTZTVnRoSjdNN3ptU3NNNFU2VmVJQjl0dDZHMElsMDlQaTFHUGlYTmkv?=
 =?utf-8?B?WnZ2OUtsVWJBUzFMckFuNDlRUEk2UVJ6S0VEMm1BMXJVcXR1RVhralFTREZ1?=
 =?utf-8?B?VDdnVnBuZExIdjZXY0NwT0IvTDBVeDdMWGdxRTg2aUR0dURVOW9DelRQYVBo?=
 =?utf-8?B?dzR6R1FoN1F2TU5WTzBLZzJyZDJDVWczNVoyNnNxSW84WjVkYkJ2U2FPUVpM?=
 =?utf-8?B?NnVNZVdYRVlQc093OFJ0b0ZnZGZvRFhqeHlzWXBGTHJLZDdvSytRQVdDWmFo?=
 =?utf-8?B?UkVJeG50RkpHL3VSQjNPbXcrOGFkQlM3bFZURFBwdm1ubE5MYjdpS1pqMXEv?=
 =?utf-8?B?ZWVER0MwdWZmRS9BSE1UYmFNT3dCNXREUkxxYnZKVXVYanVHN0hZaWFyM1oz?=
 =?utf-8?B?azZOL243NDNJaEZHNFVtYmxWb3R3eG9EZjBaV013b3dCUU1jaThFbTdhZ2Qw?=
 =?utf-8?B?dXJoejZ0b3M3VCsvZXlwTU02SERJbk1DRnhOOFlwdTM3QXRjejduMzYvZytD?=
 =?utf-8?B?Rm5BRzQwQUo0Rjk1SmdrZFZkakVzbUF6bGRLSlFMOG9MVjBVNEtwcVEzME1q?=
 =?utf-8?B?c3YyS2syeXpGUHZDRS9TS0tjMFI0Mm9GUE5oYlJZM1RmQXgxb044QzVQYXdL?=
 =?utf-8?B?V2pkQ2szajM4cERvcm42dTl3QThhYVlrWkRJM2FYQVhzeVVNaDFuVzlhSU9Z?=
 =?utf-8?B?WmVxUEtza2xMZGJzY1lNanpwcm8wVkhmVUVjU1BIZW0yRC96WmJROWEwbHI2?=
 =?utf-8?B?MlZ1YU1tS0F0ZTNid1U4WFZHRE4wUEkyaEIxczZuOCtQT3g1T3dEVWNpbm9j?=
 =?utf-8?B?d1VJM29DN1pRcTV5WFY4ZzE3b1FxNHBXRlk4bVQ2Wk42cVRyMmV4ZmRjMXRl?=
 =?utf-8?B?QmROUCtmZnJLMmcraTNVS2YzU0xTWTZHZnJCQUpOVDNxS1N2OUU5aXJBRlhp?=
 =?utf-8?B?MWRWQkdHYU8zcU1hcnMvYm5QekU4SFp0SjVtcnhrMmg4dmtqcTh6aWNieTll?=
 =?utf-8?B?WGdyVVdPK3V1NlRieGx4ZUpzNFpkZUFBWVVvdXJCUlhBbkdsNlFFbXhmNU13?=
 =?utf-8?B?RlJDVmt6SnNaVUNnOXRMc3FLUVBzdldqWjJVcjlKWkF2RGJPengxdDBrZWs2?=
 =?utf-8?B?amdoY1A2dTlkQ0lsQ3F5K1o2aXNYcXdjbWw3cEZ1aTRXWTduOVlmNmx3VHdY?=
 =?utf-8?B?czRwUGdtSEoxSXRuUmlrSHA1NWhuYUpUU0NsOW5BbnpsWFNOdTlEZWNMbW1x?=
 =?utf-8?B?d09OTllZdVg5ZGs3dHBwSDh3MFlRTTJJV1BKMjVzb3N1UXdOWVVYdEJneFZt?=
 =?utf-8?B?ZVlIbVBSSDFXNHRKRGF0b1R6aTZLaGM1UE9hZDcyNkhpT3QwZng2c2JiOC80?=
 =?utf-8?B?a1lYVUFXRjYvekZ4b3NKbjZHUm1DUytaVEhlSnlsdVFLNVVWWVhKODF1Um9G?=
 =?utf-8?B?VnlodTRvT1lWeXoxUXpRUzJzOGpzMzRycDN4dy9BbWZndW9SUjg3dlZhR2t3?=
 =?utf-8?B?b0xiWEhHQ1I2QnlpV3ZJYUNuaGVzL1hCbkRjY1lWWXpXWjQwY1FkWEVjcFVS?=
 =?utf-8?B?RlNobnA2NXJyVHBLVFQ4NjF2Sk5QRVJJUCt1TTltNnB4M2E5SFkwMjhlSjR6?=
 =?utf-8?B?WlBzSi8ya1NMYlV3WGZGZXROVlVDaGpnTGlLQzlUbkVMUFhOanFKWDVKR0po?=
 =?utf-8?B?ZGEwbnNhQTlDQ2U3dlJKajhoSzJHVmk3RE96aU9CVW0wNDlTZkNKRkN2OHJ6?=
 =?utf-8?B?NGM2b2ExMklGVU9uR3paVDJVTmY1OVhZcCs5L0ZURmxrbmk1VFNJdVZBUnJj?=
 =?utf-8?B?UUJ2cDd1QzlSR1NwUGJ5cUg0Uk9GeS9PM1F5ZStMVmpqcTNnZ1psZlJodHhn?=
 =?utf-8?B?UGJpeWZ4dGFIV2FJcEtKTGcwTTYxa29xaEZRaEFaZWkxdWZOVFNFRERpM3Vo?=
 =?utf-8?B?c1FRUXZGNUgrakYwc0NvSzhDdWViTS9LNk43aGdJdzR1UW4wT1BHdTlpZlV6?=
 =?utf-8?B?OVh1TU5FbmM3cnQ4aXpuNERlb0hWbkhROC9USS9pZ21FZEZQZ1owYlZnNDVW?=
 =?utf-8?B?aDYzSXFxWGMvNTNJazI3NXJVcWdESWRUaDVCVE11SmFlakVGQStGenZUM2N4?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70438832-d85c-4f10-45bc-08de102df436
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:11:09.2360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8sEGblTlqIeEtF2+9neH6f0eA1hzyjqP/IwpL/TBulMMJYUTBfAL8B/RKd9W34yen1Epy1jNj7QvShBfQLziBFHL2SlR93bYTs7Hw2Ngrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
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

Some questions on this patch.


> +static int
> +xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			  struct guc_lic_save *config)

Is this return value just here because of convention?
> +	/* Check if crash dump section are all zero */
> +	from = entry->offset;
> +	to = entry->offset + entry->buf_size;
> +	chunk_from = from % GUC_LOG_CHUNK_SIZE;
> +	chunk_id = from / GUC_LOG_CHUNK_SIZE;
> +	buf32 = snapshot->copy[chunk_id] + chunk_from;
> +	for (i = 0; i < entry->buf_size / sizeof(u32); i++)
> +		if (buf32[i])
> +			break;

This check looks incorrect.

buf32 is looking at a max GUC_LOG_CHUNK_SIZE chunk but here is checked against
full `entry->buf_size`.

Is it a simplification to check if only the first chunk is zero?



> +
> +	/* Buffer has non-zero data? */
> +	if (i < entry->buf_size / sizeof(u32)) {
> +		struct guc_lfd_data lfd;
> +
> +		size = xe_guc_log_add_lfd_header(&lfd);
> +		lfd.header |= FIELD_PREP(GUC_LFD_DATA_HEADER_MASK_TYPE, GUC_LFD_TYPE_FW_CRASH_DUMP);
> +		/* Calculate data length */
> +		lfd.data_count = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
> +		/* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
> +		lfd_output_binary(p, (char *)&lfd, size);
> +
> +		/* rd/wr ptr is not used for crash dump */
> +		xe_guc_log_print_chunks(p, snapshot, from, to);
> +	}
> +	return size;
Should this size be additionally incremented by length of printed data?


