Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAC5E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 19:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901AC10E521;
	Mon,  9 Dec 2024 19:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgP42r59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052010E2AE
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733773368; x=1765309368;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=U9scSOAP+FfTx/3ukNnjgnvJlhrHbxI7Et+IIWFr8GU=;
 b=CgP42r59gcL2GOrbI04T0le/hpre0Su/uiA9L0SO5R6AsBX9I5QT3kO9
 QffJxzEJjlJuhu1kdcx5BJ5M6Tm0XR8VnMR55pI4lakYOfBTOJrVj5WxS
 ijqppDZKBjNC/H7r+IwRMPaBT6b+q9vhgpZfm0bLi4Bp4zGUo44PQbGJe
 GY+X7SOQQtxv6eWFyAbF5DlrzaqIOmc9bpQdsi3Eb9KePjts1DfvhXKAj
 2lp16xd6dNEKXmqVLN44YijcsZPKCCFse6IkOZtN1tpCVJHGUiNuO/yTK
 LWHvw1tk6rDOwDsboq9yFPcWpLsIcmh1ZCJ75dcDALAzcfAEWLm1hPc75 A==;
X-CSE-ConnectionGUID: bTC8bPnGTk6zjWv5wryGkQ==
X-CSE-MsgGUID: s6czbxogTXGyhbS7fuv+YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45104042"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="45104042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 11:42:48 -0800
X-CSE-ConnectionGUID: RnVv7TkfSC+yPxz2FSK9CA==
X-CSE-MsgGUID: epaTp5W0QUKh55bQUz4ewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95036331"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 11:42:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 11:42:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 11:42:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 11:42:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuTD5QdSyHM7emrZ7VxNk1M5dLAnyPzKmrznExa3vP7SipchhYKq57DE1FDvx3yhPhk8BQZDD2CYkEqGTafE9HPdT1Dom0iBuMal/SG/DMd2Q1h3FSICBwcxTwOyG7wM32+btNDXqpCoC6Rx4k8fzjp2SR62Q28SRQYf3k26aqMcVKRCtquj7rp1/eFYyypD/CDOKDSfd4OSBUAbBtwz8EBg3/mkwkSXbmpkgQ0zGEsr4WqAmv7MKDsgsSZOgTISL9ZYN841s8H32aPcSCFGjeoC2faU4P8rT7IPq32vH+Mdfn3S5iktI4CJQy7OEAIIWD+eLpkMNukomo/G+KTW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCr/0ZmOAJN0XwbeGj9hU8SIBichILuoKMRXWLyF3vs=;
 b=K3fc54qCdifdMq0t1JWZz9FPFf+VZP0k0jX0i0rxfRye9c2pONaPZQP2kOd7Ln+s/HHk3LKaPxokjcpVPU3pnY/bM760xT29Y9pRl1LZ5+oro6aDcPft9EnPmRoWBfq1x2j74OskN00komXgsQza9n+F2PtmJ6Q+GbvyeP1PLSW2tK53yvk3+iCqPUHoQWpE/QCyC8Kp0y0hx06V/8EbJUcIv+8eQkCiSlTXqSbLhzAmNtXk+VgCCPMdZxx9XYqSaAYUWfM+RfzFGhyITE9RL6ec0XukeVFLnjHLtWfTxjWpaWVxJZ5lVCU/Rw08/EjDx7KuY1jKRDFZylsPkm2n5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 9 Dec
 2024 19:42:42 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 19:42:42 +0000
Message-ID: <20a11a97-26cd-44a4-b31d-8bc7a1d77acc@intel.com>
Date: Mon, 9 Dec 2024 11:42:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] drm/xe/pxp: add PXP PM support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-11-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-11-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:907::18)
 To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: e0833595-828d-41c3-3076-08dd1889a597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3pSa21BS1IzcHJ2WUYyeFVCOEMwSk1hVlErV0ppUnFMTzJ3cExCZ1ZXY3FD?=
 =?utf-8?B?TnJzaXh6eWk0d25qU1BUd2cyVEdMQjhJZzFjU01sUFBPWTBGVEJMZExRVDVk?=
 =?utf-8?B?WlFROTVXZzhOM0gzYXNyQmxxZmJoakYzUzRHSllPemNHZWZPTGdsVWVEV2hH?=
 =?utf-8?B?SUk0UG1oM2JEQ0J3RzBNWlJaYUY3RllXMmF2NUE0N01ZdHd2WkhEUWNFUjBn?=
 =?utf-8?B?Vk9RYUtpU1pkOElSYWlVRTJxZW5hMnExSjZKdnhlMFFTc1dZdlpBYmRhS2Mv?=
 =?utf-8?B?ci8zZFRreWdKMVVuMHNrNldxRkNwTEUvQXdjTWh4WjRCSVBHa08xbTdqK1Vm?=
 =?utf-8?B?TTdPS1U4dU1SZElKZ3hIVktUNlJRVWtGd0pVTGpEbGhYQlZvWFY1eG5wVEZw?=
 =?utf-8?B?YURQbnFWNGs2UlY3SW56dFJRdVY2UCt4UXFHNmwxcHZ1ZEtISkpicjlXUzVM?=
 =?utf-8?B?YThDV29xUnNzTEdKdFJPNUIvSlhoZG9wc09xbjRXcnZMbVhnSGQ0NkRUV0VE?=
 =?utf-8?B?RFRLVmpRa1RzMlhSdkZieEZ2WUVwSkg0czFWcnVMY2IrcFBza0NZZ0R1Q0JT?=
 =?utf-8?B?U29XK2VoNHB6bjJqOWt4cXlMaUJ1T1RKU0ZhUTgvbU5SWkZsOFFpaDByZXNl?=
 =?utf-8?B?VmMzckJWU00xWWFXWDNVVEpkV1V3ZnRoWjh6aDdqZkNYQmJvY1pXTVdqNHFk?=
 =?utf-8?B?MTUzWWVTanFyWXFWVEg4N3M3VG1PdkwyeDBwTXd4RThoM2xlMm9FVWc3TitF?=
 =?utf-8?B?ZnJQYkxibUkrcHduTGtPREF3M3FwVWhaaC81eExCQ0xXR0poVDE4aXJveHJR?=
 =?utf-8?B?R1JvbVA1TUlYRFJaT0dXWDVZTmxud2JpZjBuamNwcUtpNllvM3NkNXVacDFF?=
 =?utf-8?B?S1FNN1NxUG9GSEwvVHlCUGlNb2RjTzVJRWVwdHBJN0YrWHJJUWhYZGJMQnQ1?=
 =?utf-8?B?TWtaRG1KT0Q2cytTSVluQlA4MURGUGJtcHB4Z3BiV29ZT1lxVi9hMnVDTjdy?=
 =?utf-8?B?VHpOVEF5NFRlOU5FOXB0dWpQVVpKWUt2aUZ2ZThZRFNzMkIzRTMzSUY4UjNz?=
 =?utf-8?B?bHFyWXZ2WGFROVJ4OFBISHJieExNcW9USS96eWszNEs2MUpBSVFBcklhbFlQ?=
 =?utf-8?B?cmdWWWhWbkVOQWlCOVh0WmJCT01vV0YweG9Jd2pZUlBkODVFOW9ZZWJoMGdV?=
 =?utf-8?B?Y3M1TnRtdUh5ajh5RHNocW1HeERkY3BCNEtwbWc3Y1VJTFZqVXBHN2xENnZC?=
 =?utf-8?B?ZTEyc0RZUHZodTkvbjk0Ny9aNVZrQ09ZdGpYR1Q4aXhoSnZqTlNwVEJ5OEM1?=
 =?utf-8?B?RkVjL0R4dWVYSEh1OWhWTDJRREJ1UVlPRFAxcGRGNVl6RkVBMUZDeDl6VnRM?=
 =?utf-8?B?VExzM0tVN3lwcldYamFYVU5hZCs2dXp5RnRUVi9sTUdOV0hTSHUrN2dCakEx?=
 =?utf-8?B?MVNmODJrUXNIT0Y3amsvWnVielB5YTZXL1BnOVE5Z1FXNEpTY2RQQlBtOFBi?=
 =?utf-8?B?N0NMTC9BUGprT3lYbjJqZ1BsdHdvVzYyc3NlTjQvNWs1bC85VTZCZFhzbjBl?=
 =?utf-8?B?ckI0ZEpzelFaLzlpTWNWL0tmMFEyN3FjS2lzdE9SK3JhYlRrOXhFazR2OXI3?=
 =?utf-8?B?NDl3czlOTmVxdGNQRCsrMXNwSWw0VVczaGdvMmVULzBKbGlyc2JjSzRmSGh6?=
 =?utf-8?B?eGg2NDg3S1F3T29MYnBVK2t4TjM3eGlvdWhFK1NKSzdRVndPRVZmUjRQMlo5?=
 =?utf-8?B?M0lLK2RpU1B5QmRhaDVVUklDUEZMTHJjRlAzYUdFMEJBRzNYVDYxbDd3NWNk?=
 =?utf-8?B?U3IzVTY1SW5zNHRTdWY1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZycHppM0s2UytrdEk4aFZ3a1c3VEtOYlppT01Ga2RnQm9nOGpCdlF3M0VU?=
 =?utf-8?B?ZWdnYUdxWmN1OGo2UGY0cUlKRlBnQTZYL3pjUFhML1BjSzdJSnJvUFJod2VF?=
 =?utf-8?B?RGVaSEhNWWFjaEloOHlXSUcyQ3VIb0FPSnAxV1Uyb2hIakltdXFJRE5nU2VC?=
 =?utf-8?B?SzRXSEZlbDRZK2o4SWc5N3VsNi91Y0xnTWRRWlgxcTFFTFlGQ05xNEZRTkNk?=
 =?utf-8?B?bm1Sb0Zrd2dQdEEzY3hLZXl6OFhzMHhoMzBYc0s3blcxM2RlbFpNekNFT1Jt?=
 =?utf-8?B?NjlaWEptQ1BHUjdyb1hJam5VL0xUUFdvd1RyVHdkNng0RkZtb1o3SktOM2lH?=
 =?utf-8?B?aGhCVlpHanhwem0rSkoxM1Ivb3FNZ25nRk9KMTd3RDVKdzFtYXV0R0hac1lY?=
 =?utf-8?B?bVRRemlsQUI0bkh2Sk5PNnZkTm4wQWFoWTY3dUl3UnlBcVBJVm5XbnlQeTJX?=
 =?utf-8?B?L091aENiejJTSmFxRW0zdXNCblZESkdxRnJBUXp6amsxNW1HOWR0bEtyOWpN?=
 =?utf-8?B?MlN6T2xXTmo1QnJJMTBkNWRnQVlkaWkvOWErN0lDT1g2VHdpbmRGME1iTUYr?=
 =?utf-8?B?NFFhSUE3YXA4WDFxeDZtREVuYXRnWW4rOGJ4akd1Njc1bWNsNGF4NU9XWFgy?=
 =?utf-8?B?UHpjc3paWHJTWXZRTDA0K21pSnlvamxCaGMwQm1sTTdXV0RKcVNSMXpCSVk4?=
 =?utf-8?B?ZzRZaVhnVUVKYk04MkE3M3pTL1kwb3VjYm1KUUIvNXpsZDRRR3R3ZE9GWkU3?=
 =?utf-8?B?TS90LzZNK29zdlVDNEpjVHVIUWh4NkF5V05uY3IvejVNYTBVN2xtaGFKV3ds?=
 =?utf-8?B?NW1zbytvK3pHSmZydDUwLzVQaUdDOGYzWVJwTTB5aW5SclBOOXBFcFJYZ1dM?=
 =?utf-8?B?N3plYWJWRkhVc2VwL1JyNWNBWFpQV3Rqa0psdzRydzN1UVRLU0d4MFZpNDl6?=
 =?utf-8?B?M3J5dy94My9ZQXhTUzM0RlVlOGRJa2RRUVF0QVFJLzVySjVtb1hDMmNjK2cv?=
 =?utf-8?B?cnpMNzFEa0crOW5mNXM0UXNpQ285VFlDZFJGMDVKU3cyV2gvK0VpMy95VHVR?=
 =?utf-8?B?cjYveEU2bGk3QlR6QW8xOFgvZzZaSUI2RlYvbWhtVFovanE2MU5rTkZESmJN?=
 =?utf-8?B?MGRWTzNKRGVscXBxcTlZSTRRVGI0cmtSczFTQjZ1a2pTVy9YRTdsbm9VSXBl?=
 =?utf-8?B?cmo4UHdYbUQwNDhEUkNiTWdoaHNiNStTRG0vMjJCdkh3M1RLRXlDS2V6MjNo?=
 =?utf-8?B?Tmk3MnVlMDZpWk5RZWhYUzc0Z1FYWG1HbnNqSUFtNnJiTXhUZlk3ZUpyOHZw?=
 =?utf-8?B?eWJkTFc0UlFiRzVWRjcvTjYvM1dYV2cyaTV5SEJkQmttcmJIS1lkTlVWeVNK?=
 =?utf-8?B?SkpkWndzcElyTjFPMGVkNFNJQ0oxZDZWeDhEclM5dmJxZFhlcGF1b0hxZmxE?=
 =?utf-8?B?bVZPQXpERnpkV0dlVTVOOFVJMGRyUyt3aElCMGhzMmlCQ2luMnBTMHVVOVE3?=
 =?utf-8?B?VExpUm5ZMGJTTElKamJIbTdwMUdEOXNKbm5uR2JINzVvUUJXaHBselE0cmx6?=
 =?utf-8?B?ZXliVEo3OU53dEV3ZUpvVzVOUWt2TCtzZHZ0UnlITEx3emhkWE9FYVZqS3lE?=
 =?utf-8?B?TkFTNDlEN0pWeGdxNXBZVExRcVdEWHJxc2U2eGQ5Y2Z2RW4yNDk3bEtRaGp1?=
 =?utf-8?B?aDBWcUdUcGZac21rOFJPWk9kR0g5WWFjU3RRdTl1Qk9pWDBEdUVSWUxZYzho?=
 =?utf-8?B?WnkvUkV0dTI1RGU2YitnQ2YrdTcyMnltNmhCcytEQVJxOXlMMnhKT2hsR0lw?=
 =?utf-8?B?YkFreTRkWVRvSHRBdkwrRmZXa0xyTmk3VHo1VEhqVDM1Si9sT25jcUFwZks2?=
 =?utf-8?B?dzdMNEU0ZUJ1aDkrQ2dPeTJhaDRpWFZKb3FPSktRSDdPR2ZDZ29FM21yVVQ2?=
 =?utf-8?B?MXkwL1hDR2lDS2IrZG5nVmt4QnRubGJJMmsvR0tsU0hLb1dtMTFlK2FqTFpi?=
 =?utf-8?B?T252YWNCMHZ1dDM5SFNyZ3BwTnpqWFJzMFRINWtEZGhxbTJ2aVVoMk9ic2M5?=
 =?utf-8?B?Z3FPM0Z5aTYzREFGSnpqaG5LMzlnYTBoeC9LTjRUbzVYQlhKaEF0dk5CakhE?=
 =?utf-8?B?QTYwU1F5YnVPOHJZNVBFbEUwaFk4T1B4bDk2U3VLdzYrcXk3Y1FGY0hBZ21D?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0833595-828d-41c3-3076-08dd1889a597
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:42:42.6069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnxSpCwszyOkwkxBnxpowvzoDvQfeicHkBxmiwpwK6kzhQTWLFzFr6kAWEEY+N0BOHo4qDR05QOQvXCyqxkMUAR2gCXzoBpQhCVKmNRitbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> The HW suspend flow kills all PXP HWDRM sessions, so if there was any
> PXP activity before the suspend we need to trigger a full termination on
> suspend.
>
> v2: rebase
+changes about runtime suspend

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c        |  40 +++++++---
>   drivers/gpu/drm/xe/xe_pxp.c       | 120 ++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pxp.h       |   3 +
>   drivers/gpu/drm/xe/xe_pxp_types.h |   7 ++
>   4 files changed, 156 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 80699dbeb2e9..2fe011a6c6e9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -21,6 +21,7 @@
>   #include "xe_guc.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
> +#include "xe_pxp.h"
>   #include "xe_trace.h"
>   #include "xe_wa.h"
>   
> @@ -121,6 +122,10 @@ int xe_pm_suspend(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Suspending device\n");
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> +	err = xe_pxp_pm_suspend(xe->pxp, false);
> +	if (err)
> +		goto err;
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
> @@ -129,14 +134,12 @@ int xe_pm_suspend(struct xe_device *xe)
>   	/* FIXME: Super racey... */
>   	err = xe_bo_evict_all(xe);
>   	if (err)
> -		goto err;
> +		goto err_pxp;
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
> -		if (err) {
> -			xe_display_pm_resume(xe);
> -			goto err;
> -		}
> +		if (err)
> +			goto err_display;
>   	}
>   
>   	xe_irq_suspend(xe);
> @@ -145,6 +148,11 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	return 0;
> +
> +err_display:
> +	xe_display_pm_resume(xe);
> +err_pxp:
> +	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>   	return err;
> @@ -194,6 +202,8 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
>   err:
> @@ -388,6 +398,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	xe_rpm_lockmap_acquire(xe);
>   
> +	err = xe_pxp_pm_suspend(xe->pxp, true);
> +	if (err)
> +		goto out;
> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and delets bo entry from user fault list.
> @@ -403,22 +417,28 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> -			goto out;
> +			goto out_resume;
>   	}
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
>   		if (err)
> -			goto out;
> +			goto out_resume;
>   	}
>   
>   	xe_irq_suspend(xe);
>   
>   	if (xe->d3cold.allowed)
>   		xe_display_pm_suspend_late(xe);
> +
> +	xe_rpm_lockmap_release(xe);
> +	xe_pm_write_callback_task(xe, NULL);
> +	return 0;
> +
> +out_resume:
> +	xe_display_pm_runtime_resume(xe);
> +	xe_pxp_pm_resume(xe->pxp);
>   out:
> -	if (err)
> -		xe_display_pm_runtime_resume(xe);
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
> @@ -471,6 +491,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   	}
>   
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   out:
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index f39625ae0259..06f025bce5f8 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -123,6 +123,14 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   
>   static void pxp_invalidate_queues(struct xe_pxp *pxp);
>   
> +static void pxp_invalidate_state(struct xe_pxp *pxp)
> +{
> +	pxp_invalidate_queues(pxp);
> +
> +	if (pxp->status == XE_PXP_ACTIVE)
> +		pxp->key_instance++;
> +}
> +
>   static void pxp_terminate(struct xe_pxp *pxp)
>   {
>   	int ret = 0;
> @@ -132,10 +140,14 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   
>   	lockdep_assert_held(&pxp->mutex);
>   
> -	pxp_invalidate_queues(pxp);
> +	pxp_invalidate_state(pxp);
>   
> -	if (pxp->status == XE_PXP_ACTIVE)
> -		pxp->key_instance++;
> +	/*
> +	 * we'll mark the status as needing termination on resume, so no need to
> +	 * emit a termination now.
> +	 */
> +	if (pxp->status == XE_PXP_SUSPENDED)
> +		return;
>   
>   	/*
>   	 * If we have a termination already in progress, we need to wait for
> @@ -187,17 +199,19 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
>   	/*
> -	 * We expect PXP to be in one of 2 states when we get here:
> +	 * We expect PXP to be in one of 3 states when we get here:
>   	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
>   	 * requested and it is now completing, so we're ready to start.
>   	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
>   	 * the first one was still being processed; we don't update the state
>   	 * in this case so the pxp_start code will automatically issue that
>   	 * second termination.
> +	 * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer everything to
> +	 * when we come back on resume.
>   	 */
>   	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
>   		pxp->status = XE_PXP_READY_TO_START;
> -	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
> +	else if (pxp->status != XE_PXP_NEEDS_TERMINATION && pxp->status != XE_PXP_SUSPENDED)
>   		drm_err(&pxp->xe->drm,
>   			"PXP termination complete while status was %u\n",
>   			pxp->status);
> @@ -355,6 +369,7 @@ int xe_pxp_init(struct xe_device *xe)
>   	pxp->gt = gt;
>   
>   	pxp->key_instance = 1;
> +	pxp->last_suspend_key_instance = 1;
>   
>   	/*
>   	 * we'll use the completion to check if there is a termination pending,
> @@ -524,6 +539,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   		pxp_terminate(pxp);
>   		mutex_unlock(&pxp->mutex);
>   		goto wait_for_termination;
> +	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
>   		ret = -EIO;
> @@ -674,3 +690,97 @@ int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
>   	return 0;
>   }
>   
> +/**
> + * xe_pxp_pm_suspend - prepare PXP for HW suspend
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @runtime: indicates whether this is a runtime suspend or not
> + *
> + * Checks whether a BO was encrypted with the current key or an obsolete one.
> + *
> + * Returns: 0 if successful, a negative errno value otherwise.
> + */
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool runtime)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return 0;
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/* if a termination is already in progress, no need to do additional cleanup */
> +	if (!completion_done(&pxp->termination))
> +		goto mark_suspended;
> +
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +	case XE_PXP_READY_TO_START:
> +	case XE_PXP_SUSPENDED:
> +		/* nothing to cleanup */
> +		break;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		/* If PXP was never used we can skip the cleanup */
> +		if (pxp->key_instance == pxp->last_suspend_key_instance)
> +			break;
> +		fallthrough;
> +	case XE_PXP_ACTIVE:
> +		if (runtime)
> +			pxp_invalidate_state(pxp);
> +		else
> +			pxp_terminate(pxp);
> +		break;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
> +			pxp->status);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +mark_suspended:
> +	/*
> +	 * We set this even if we were in error state, hoping the suspend clears
> +	 * the error. Worse case we fail again and go in error state again.
> +	 */
> +	pxp->status = XE_PXP_SUSPENDED;
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	/*
> +	 * if there is a termination in progress, wait for it.
> +	 * We need to wait outside the lock because the completion is done from
> +	 * within the lock
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	pxp->last_suspend_key_instance = pxp->key_instance;
> +
> +out:
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_pm_resume - re-init PXP after HW suspend
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + */
> +void xe_pxp_pm_resume(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	err = kcr_pxp_enable(pxp);
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
> +
> +	if (err)
> +		pxp->status = XE_PXP_ERROR;
> +	else
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +
> +	mutex_unlock(&pxp->mutex);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 2d22a6e6ab27..0477bb46d49f 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -20,6 +20,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool runtime);
> +void xe_pxp_pm_resume(struct xe_pxp *pxp);
> +
>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 9c2d2b9a850d..fa40b039e26f 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -25,6 +25,7 @@ enum xe_pxp_status {
>   	XE_PXP_TERMINATION_IN_PROGRESS,
>   	XE_PXP_READY_TO_START,
>   	XE_PXP_ACTIVE,
> +	XE_PXP_SUSPENDED,
>   };
>   
>   /**
> @@ -119,6 +120,12 @@ struct xe_pxp {
>   	 * that case in the code.
>   	 */
>   	u32 key_instance;
> +	/**
> +	 * @last_suspend_key_instance: value of key_instance at the last
> +	 * suspend. Used to check if any PXP session has been created between
> +	 * suspend cycles.
> +	 */
> +	u32 last_suspend_key_instance;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

