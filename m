Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F194FFF8862
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 08:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA97810E222;
	Mon, 27 Apr 2026 08:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpIzfgHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ACA10E222
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777277706; x=1808813706;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gzZSbRgaH9ADUibeRAsJ8LvyUNtxKHA9wAsLtJdfI1E=;
 b=DpIzfgHIWd4vtzUm8J58jzqZJN+MAj8CUVNEVJWvk5TJkOKm8Un8kRVU
 yzAe6LSVHq7caHsh48SanHUzEsloWUh/Jxf+29Mah9jXtovE0y5YTE0u0
 zQFt2zumP6Fd0bYW3Pxf+p2f9D833yIxPZuRbflafPwp8YeXTLo49F0LV
 Djt7pcxMRghTrJHRYhxbWVlnXD8FoF5VzZSW1fYQ5UNtFdrWpyayxVKIo
 RWOJ4kySXxMcPrYKgGe5rb5WN9p7I31lzWB0NN2tfmKabY743fXOF8c09
 CsnXBTq3KYGXTjxO1iAVNJzLwQn5WhK9OjoPDAjmG4jynPXQM+0OxzuXf Q==;
X-CSE-ConnectionGUID: k4JHOzzXQ66U6B/UP2BJyQ==
X-CSE-MsgGUID: 8Wu8c6DQQoKNoYOYYwCwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="81768128"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="81768128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:15:05 -0700
X-CSE-ConnectionGUID: gFKjSnD7QsCrUKN348n+jQ==
X-CSE-MsgGUID: c43v2R01SV+5RNj1nGrIAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="238610696"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:15:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:15:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 01:15:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hITQ0HtcBvD/QNC2H0ZT5EIe5VgANlJFMrzVCYGdsjN3/zrAf+ob6unNHq6YKhJhewo05q9tHuXvr17geJwXPHq099VsefrAYcxCk8K8VniqJDHINCHm1LQN3gtzzP958mmQLzideX9dHJvVQPr4B0GxVkmeHL2qWL7+aYSaGBAvJTwZMlMeb/3RSSC0fHXp9mqja1iFv/FultvKQIpY1znp7qfqUePcOXrkoeY072Njk14LrE5yBGTqlI0Nknn7CMu8MUAfeSPzwkdlvgu9encUH6sASn6tCqyyOegmL5XlHtjJIhW998CpHPJwVm9TSZ1JMgHX725126TmXxhv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMFRsKkCMh8peN9hx11G1WG2O0dyszN4v1lsk8I9CxY=;
 b=l1mkG6Ao1MHqIzVSQlRXsES95KoMuYJN41m7MWlbtYhY170mFRcesn8uQAKBZ3IeaUC7Gs86yB6jewGK8+VWFEsn4lySWuhmyHmU2vR08qc9/jFIdwL6Ha1NwbZ/w3PrivTisqUiUkef5mpBBWr3zOsGBPU9uuh3GLO8OcS/R5OhDo+cxGf7/B9P3XngeHA9F1CThoFfZANUd57EeORvWsgVfcz4fNCRJIbMs2HzoK70Bd1e1/eEn6mX01O5hy9rMQ5tjguf2tShVSIxNWEtF/vCoBXUHqebnRsM0k+yEANlyEuOSeBUIshYUkB5lLYYp2qx9LXRD4PWS7M5RaE/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH9PR11MB9901.namprd11.prod.outlook.com (2603:10b6:610:342::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 08:15:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 08:15:01 +0000
Message-ID: <3f2ab093-790f-4c28-887b-3c96ed6687d0@intel.com>
Date: Mon, 27 Apr 2026 13:44:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/hw_error: Setup hardware error routing
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260402174229.1062874-1-raag.jadav@intel.com>
 <20260402174229.1062874-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260402174229.1062874-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH9PR11MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0983c9-8e13-47b6-f691-08dea4351424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Qiofjeekbz+q449wabjDOOH+x4x9ijzZhLv+Xj/p+w1TnFksmmymOWqXPIVd+FWYKEfdAT28eQVobplO4w7HqDIoVhAtWqJVfDTs1WCfaC3byhxf2wqtceCo2t1ZpOHCCqFyGJ5Dx3xEo+O52eq5eJ5I1GBb7wFlAO5cGyl7RlyFumsktNIMNrkG64tXWzTea2UWb7YJFLXK6k7itsRa1vp8APwN5PYHm+Xu27RAcSvSEkeNepL31hpW3VeE1HE6ULTICerlheDYXa74DPvX9pXB1AQryS9psIHLrNTpcTeQS870wwg9CKPXfOL+FFybHvEhpS3Mor0/fXFc55VtawdV0k9eWFEWWQ+rVAz7pNFmq9gF2uHbfsyMpDoTRl1XUxuZ4HgP3uXLmNwOLTWvIVGsnP5p8Pece0B0g3ECBaG9J4WqDJdnuEnoadYYNqd5YM876+76hJABnt9ojxjROq5du3xZELKsdc1XWt2a7WqgquMAFuTrd0dlPnx8ErwmlQmNVHj6qOZvHJb6hQexuooPDgMNYXnzUM8TKXgLQizKHIJtW+pxlikXmHcIGHNgNPQuvLqp/lHOwuf/mibSd24LIx/oP3DnlQVpGXxazh6e7TTHn9br0k6IIluzKmJ6XYLJiqPIWZ12B8PMgTfReAevDkk9PhBbQS17NyVQ051jFRuATgE+sNynhrYrr41Atpp9BP6HHBMtMQesHsKiK4IDEV2BgHtP7ETy1FZx77Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWRWZC9kUW1SeU0yNkt5OEhLQWUrcElWNzhzSHM4WFNabnpDeDNyQnVSbTVt?=
 =?utf-8?B?QXI0SHIrUFNKNURkcW13V0R0NlNKVnZlbEdDZERHcnltc0NGZi8zS3VCZGlx?=
 =?utf-8?B?cHZmclNYQzVRTEc4S0EraVFOT2dnVjlXcnhwVlY4dTVuV0Q4eHY1NVovcXps?=
 =?utf-8?B?aDdjYnJQeTNIWk9QbUpNREhuWE9zOW1UYmlMU0Z1R0hIeVEvcHFrRktmcW1Y?=
 =?utf-8?B?L1RxaEtiS1RxOCtyR1U4K1NiR28zT3VYWWxwRG0zaWRIQkN1UGdNV3JCZkow?=
 =?utf-8?B?b2I0aFJEdGRWdW1ETWhBQ2NxU3llbTZXZEhuY2llNlpKMEY4UFJmWG44L2hV?=
 =?utf-8?B?WlB1NWRWNnQvQllUNzFnTVJVWjVpTGxXTEtpcEhPQzhHV3VzODM3b05jS3hK?=
 =?utf-8?B?Sm1JU1A1VFRxTWUrVzA4c3ZxNkdGU1BWd1NSa0FnVGF6SEtiVkxDa2s2ei9t?=
 =?utf-8?B?UE5ZbThWS203aEpKNitTd0Mxa09penlDd3U3b0xOMU1wTWdpSDFFY1ZQRURM?=
 =?utf-8?B?SExaS2RyamtiNWRrcGduWDJLV2UrS294dFJyUFVHVGExZmhpTWRIU1JEV0xG?=
 =?utf-8?B?d0wyTzRTbDZsVmpUcXBpZlNMS0xJdnY5elBlejFnTlo1aFUzVnRTQ29FVWtJ?=
 =?utf-8?B?Vlc0QnRIaEdOZDlKdjBPMzNGUzdaRjBPTTBWNllobkJHUit6VDVock5PWmZn?=
 =?utf-8?B?MkJMT0VYR2ttVVcybTRiQlcweGFveFFBYzJmUzduU1VnWk9FcWxLYkJLb0pM?=
 =?utf-8?B?aU5rTDRpVmRwRDRPaGdLcGs4Z1oweWpnS1dHWTlvZWlXOXNpd0JBdzcwSlFr?=
 =?utf-8?B?czBJMExsUEpLOEJpSjRkN2dSY0lWNWkrQmdHcTUrelczNVVFYUd1SzI5ckFK?=
 =?utf-8?B?dEZoaFVQcmxxR0NjV3VEcTdYNTJ6amlOSzNyUWJkVnNVeEVBTUtYdkpWdjFv?=
 =?utf-8?B?M2RlbWduallWbU51bGhjT1ZkQzRDTWo5UklWN0s5M0g5Wm9KWjkvbXN4M3JN?=
 =?utf-8?B?SldsZmJONk1Ka3lrcFdGdE51d09kKzhLVlB0MmtqM3d0WFJiaU0vTmg4VUxI?=
 =?utf-8?B?UldpeUpmTjF3TXJyeEFnaFRDUllUSjhPUUp1WXY0ZFhVbUNCYm9mN25WTk5R?=
 =?utf-8?B?NnZtbGlMbEVnOThDMm5hNGI5emFGTGIrbmovY0RvVEFJL3dYcGNpUGs0WmE3?=
 =?utf-8?B?c1d4V1Q0T2c1UzFDUkRlc0JVUFZwUkc2SThRMlJiU1UyckFUUzNlTHh1ZW1h?=
 =?utf-8?B?czlZTTkveEdpc3ZiVUNEM2RvbWhnMjJJelZnZVJWNU9FK3FRUGRGbmtQQUJ3?=
 =?utf-8?B?aW9ObE9hUC8zTk1ud1RJUVY5b2FrUmZCQzg5b3BmTGM2SGJvRkNxM05qUmhD?=
 =?utf-8?B?Ulc3ZjNhaGRnVE1QRDZua0cwRHdzY1g1QkxRQkRtR1ZOS1FreGVSSDI0MGdq?=
 =?utf-8?B?bGZJMm51bm9zU1VFait5UUpPdGFRekNWOERsaGUveDVXcE5BazB5OUVHcHFD?=
 =?utf-8?B?S3kwZTE2K2dMbkFZVmZIR1VuOTVyTG5ueG5WOTl2M0RYNEwrRTBvcGU5MXlE?=
 =?utf-8?B?MXhnYkR5d1NKd2IrQmFDdHBnY25SeHlNUFZ4aHBrNUp5YVQ2OWlLZzFmTm9S?=
 =?utf-8?B?ZjlOT2JQVVJmMjRhMUZwaS84ek1tMTVqdjF5RlZ2OG1BRVhOdVZ2NU1pbUVQ?=
 =?utf-8?B?d3hvUitjM2pCa2dNMmYzTmlnRS9wbmh6alI4RFFQOU1IbkhBSU81cVl3UUNl?=
 =?utf-8?B?RTUrRmVjV04zRmVXeFQwb0V6amZvQS9hOUJQNlM5NEdDSnRPUlBqUzNOMmJv?=
 =?utf-8?B?UGJFKzhwcU0zOVJmcW9wY2VSNFYxYVAwcG8xWnlNVzdKN1Y1ejhUdFlLdUxh?=
 =?utf-8?B?Z1FQNWRDckhDNTNwRlRNUDhPRlZJbTFQZHpDaDZMZU4xaWNRRkxyZVFRQjhr?=
 =?utf-8?B?b2hpL01iT2Eyakl5dlhsVWxsT1JCS3pWOHNEVDlvZEtyUEdTWnNTZEtmSkdM?=
 =?utf-8?B?dmlheUhaVWVvVzI3Um1rZUorV3RHSDRWdktvTlFJRWUwWDNXUGlqdFhyMzBX?=
 =?utf-8?B?Y0QwWFEzdFUzWEp6VXVpTWgwNlRFMTI1R1ZwcDR1aEFQd2RtclVVNDVaNHRY?=
 =?utf-8?B?blRXOStkUkFXVmk4ZGZ1b0x0Y1BEU0dEZ1RKN3J2dm9IK0s4SHFvY0NqcjVm?=
 =?utf-8?B?enR4Q3N1anZ4NTFHcDZZZ3R1NlN3OSs4MHA4cm0rMHlCZ3ZCSitPQm9NSlZl?=
 =?utf-8?B?cDNtRmtzR0VTWitVbkx5NCtNNkRCd0YzOGVnU3Vva1Q4NWFPdi9QQUdhbk9x?=
 =?utf-8?B?VDRvZVJlY0kvSk81NlgvY2YxS0VXWHRaSnFYUkFXd1NCVG5GVk1Ydz09?=
X-Exchange-RoutingPolicyChecked: fsDIfqBhpznw6Gc0KMiFjoEZ2xeSeqUnM4YomrIdoG++2I2SW9qkMfAEuc2YR0GLTCK2LuVwNH0wGM3jEBcJnG/7PhwBYm3p23Q8Mnm0UtaXOACxvVyho+yVT0IKUDZiaQEdiYQKGhtotyttfOt9x7HKLS8KlifwKDz+7zruZtC3X1VmKg+569wptbA1d04xgrmDpC7uY3TPNOLk6E55KcSnaT/3hcFk6ROKKPPGEXF7vo/Noo+b74w8OZQlXYtedITvKcb7eu2q8Ah/eHgSIBUm28WTB7F0y5llmEslF1AZ+hGTNkQRTj3D2hnzvWzrLxMpjcJZ/4zBQ00T9jASBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0983c9-8e13-47b6-f691-08dea4351424
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:15:01.5033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YPZt9N94E3n8FH4r0BNnQMhcPLAZ3yuuqL1incackbsE/ldoOS8SXBEoki9kADLMI52a13WlolvyusX8PP/dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9901
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


On 4/2/2026 11:12 PM, Raag Jadav wrote:
> Hardware errors are reported through System Controller on the platforms
> that support it. This requires that they are routed as PCIe errors
> instead of direct IRQ to SGUnit, but this routing prevents the user from
> investigating those errors in case it is needed for debug cases.
>
> Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
> which bypasses the System Controller and allows the user to investigate
> errors without System Controller involvement.
>
>                   default   with NO_RESET   w/o NO_RESET
>                   -------   -------------   ------------
>          fatal      PCIe         IRQ            PCIe
>      non-fatal      IRQ          IRQ            PCIe
>    correctable      IRQ          IRQ            PCIe
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Explain the usecase (Matt Roper)
> ---
>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
>   drivers/gpu/drm/xe/xe_hw_error.c           | 21 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
>   3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> index 046e1756c698..247906ae2227 100644
> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> @@ -44,6 +44,11 @@
>   #define   XE_SOC_ERROR					16
>   #define   XE_GT_ERROR					0

Follow file pattern, move it above dev_nonfatal.

>   
> +#define DEV_ERR_ROUTING_CTRL				XE_REG(0x100170)
> +#define   FATAL_ERR_ROUTING				BIT(2)
> +#define   NONFATAL_ERR_ROUTING				BIT(1)
> +#define   CORR_ERR_ROUTING				BIT(0)
> +
>   #define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
>   #define ERR_STAT_GT_FATAL_VECTOR_1			0x100264
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 2a31b430570e..28ad5c15685e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -526,6 +526,26 @@ static int hw_error_info_init(struct xe_device *xe)
>   	return xe_drm_ras_init(xe);
>   }
>   
> +/**
> + * xe_hw_error_irq_route - irq routing of hw errors
> + * @xe: xe device instance
> + *
> + * Set irq routing of hw errors.
> + */
> +void xe_hw_error_irq_route(struct xe_device *xe)
> +{
> +	u32 mask = CORR_ERR_ROUTING | NONFATAL_ERR_ROUTING | FATAL_ERR_ROUTING;
> +	bool irq = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
> +}
> +
>   /*
>    * Process hardware errors during boot
>    */
> @@ -563,5 +583,6 @@ void xe_hw_error_init(struct xe_device *xe)
>   	if (ret)
>   		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
>   
> +	xe_hw_error_irq_route(xe);
>   	process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index d86e28c5180c..8f155b66b5f1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -11,5 +11,6 @@ struct xe_tile;
>   struct xe_device;
>   
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> +void xe_hw_error_irq_route(struct xe_device *xe);

Patch 4 also can be squashed with this patch.

Thanks
Riana

>   void xe_hw_error_init(struct xe_device *xe);
>   #endif
