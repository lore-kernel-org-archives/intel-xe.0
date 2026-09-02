Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F233C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 15:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370E010F26D;
	Wed,  2 Sep 2026 15:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Grluodij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B1810E242
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788362763; x=1819898763;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xQFpkLZQhX5UN+r3+C1GlKdowUK+W7w7hbJN3ECvNLQ=;
 b=GrluodijHEFQ2AViSNVxcekBpG8kfgYNx7WWJiXp3aSmR5fK8Pdye38p
 9v9qKhfcLt6zip6sRZ8pFyDcpzPhkNfjAgyAeB0xrL1+ovOXq59jL5eY9
 hAqxma3tMH0tH0topm0SNJmCXwIQVu3CkqBD+lcNIgVroj5IAfuRldxZQ
 MFQ4lrApAtuiRqXzxD1CIZCFzl22DCnxLrT8cM2OVLVyBpfB8FnEE3Xoh
 9lQ3uKWljttYdIS3FRLKKmDaLfRXuM9CCVlDjM0p1RBZVoV5LC03aUUpx
 BR1/o/yC+eTCgjVCbhZVJuCyDTi/2jqZPWH8GJbNAWwS6R56rgbeN/Ikl w==;
X-CSE-ConnectionGUID: s2BgKnWSRy2dSzm9yLOzfQ==
X-CSE-MsgGUID: eruaBOwdRn+YaxysPAsjKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92645750"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92645750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 08:25:51 -0700
X-CSE-ConnectionGUID: Ax4CDdgzRPCggHN55V/QCg==
X-CSE-MsgGUID: Yo+muB0tQMOxZouV9CAQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266842552"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 08:25:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 08:25:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 08:25:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 08:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I078KqMq77y/KOoKtNFg/niPow7D+7Z/e8saeBRIVU3Zd6LhzaqrwQNj+C0SdMOOEPOXjj9bXwbQwM9Ujn6xK0ZIFdaDB4ilCa1ONcU2AjdUIlOVr8DNCVXdCf8L517e89WbKSBJTOSqHR7VMSaZFyxXg3T4VtnPwqzposOBsc1o/kPvtFeh/1Ym48eMvsCccu2gbhu9SksZwTvhbGSyLI0sVMLblBSJs5SnVFU8fFsozZwYNYtnRa/5EGxrkXQbQyIqdvzzYPC8GYHp82vs3h4Xvw8vrs5Rmc9pVsYspSjeQsWs5OnVcuNO/grCloc5V8jxwNodDFUSdKVqBJ7pDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufS8MAXANRxY0f8StksCAFiwvWiPUZCFZmcu4Iz0q54=;
 b=EVvepOOcOVYdZtEb+FQVfk3KaSqpnlz0atY3HO7pjPxi15uVlWxtRh0LON0I7+xt2XWigC03OrLtxuP+UDwA8ORnYWceIMPM1V6sFS8kzoA+idGCAlvRwlqOLkS5IVTvonl6MDATQM+5B6sJYQkvsouwvPbtD6kDI1/pGr9i8UwZsrjf7Y0Tb7njsPqXTTcq1Irxi5kyiG3oj3OepcAMtFlj8nvJ0GPW12l9yLIiUWz7t4eDn02KFDy6bn34Egja5pW3+BXaDXXPsSbaq1EqxG+ur/ai8NuIwxZGDXqWe/q87q+KMOx1KXASgHnppOXE6/TTxtfKJmse5YclmNTrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:25:48 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:25:46 +0000
Message-ID: <765e4cd0-1a2f-420b-9db4-435c78bfc677@intel.com>
Date: Wed, 2 Sep 2026 20:55:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-3-karthik.poosa@intel.com>
 <ao8uP1ykIgCjkUvF@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ao8uP1ykIgCjkUvF@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a8c1c4-aade-41e0-3e45-08df09067607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: BoVBqE6oBzV/j8GqNyqkuI661yerhOluotPJx70pCFjdP0/W8DDyEY1tjsnkwK0IseOJYNkGlR0APLYSF7aN+RETjQoT1+FeEgtL7JslLrlt9snPiXvcZJGT7nfOx5O6307DS2uv1LtfGNjh6Nm28AAebPPseqTJHdYjXwf0JP/gW3n7zvb4rxgh1K6+e3tIB/JzzQJLhO2zT5XZVoI+JFoq3+ihKrM4toIkks1Xdii9ZxHzItylv3V/ncMLuMVmfDmrXZcNIRp4hmlTx/NeYnpxixWnxFHXSbN8CPoMowmtwZcrH6lsXnzMVwgko84Et8UGuj+FuIvzL8LYJi/DlkHNwmIVtkH2bGUY/wF0DZ5gBj/xli077exQJyawCXv02rZu/uk5+2FzcSEPwJaaZKGpPquuUJClP0JL7nhoXUI1t+yjQ7FePn1Ur9Jrlq83SIO2taHfzP1Jen1fvRCI61vC1gMUprVTu9olfSvRYliDE83ogAMrbV1Z7t0or2g9+IeMKt3fdv2tDhi+cJinjx8QyYLwDZLrcjEk+E65HW4364/Yt7hSeousUzZG/VbKpvL+2Xl9TIxAHWPUYg0UX1i8Fdtxwe9vBipCGI9vx7J8+xTm/nS68NHGPSaQKuA98J20oCYhE+402RnIYpj41Op61Ahk/ld0oU+Ubq5YS3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm1ObStnYXFGcVplS0RPbXRyODRzS21YYVlOSHZsWHBTemNNTUtFdU1idVg2?=
 =?utf-8?B?NlJvYTg4aTFkQnJtbDlWYkFWY3cyZlR6SGM3Z1NKcExQaUVNeThRYkhRTUdI?=
 =?utf-8?B?T0FQUitzS2NhaE9EY3hzSUpucXZKVHlEUzNBbU9Xd2lDV3lLc2Mxa0trNXNw?=
 =?utf-8?B?NStTeFFGS2NQQ241ZFRMcTZ0SlhIN2JKNXFUZUEzRzdDcWwvcTRVOEE5NDVl?=
 =?utf-8?B?UExwa3FUYkI0cGZXUzJiM1FwakJLRkpDQWFja3FtRkgxNFZENDBPM0crSzI4?=
 =?utf-8?B?M0tMQWdFRVBlTmF2ZFU1M0tqYUtxVEZxRnlRWWJHY05ZZHhtTmJjQnNDRTho?=
 =?utf-8?B?NmpKL0J2ZEMwa3VmaFRleTNpWWlFMDAvYUw1RWRaM2JoQWpvaUZmQ3dFZWxt?=
 =?utf-8?B?SlFlTTAyaCtUOUgzUXNJU0g0cmpudzJsanI2bEJLVjJGT09wT2ZlZ2Ezc3lY?=
 =?utf-8?B?Z01NY2ZobXpkaXQxcmt2UURWRmkrOFBjWk1hcDh5WEc3UjY5VCtZWC9JNEtE?=
 =?utf-8?B?UnNXb01kUno0S04rMVlaSytLTUhydXNhRHM4Smczbm1sTkdYZkVveWt2MGgy?=
 =?utf-8?B?bjVNTlRWZmFaVFQ1YjRVQit3R0hLQzc3dzFrU2txemtzays0RU92YlRmc1ha?=
 =?utf-8?B?aTY2eUJXQmRoV09GVW84c0p1aEtqQXQ2YjRybEIwZE9KVCtXT2I3N0I0ak83?=
 =?utf-8?B?eXU0REliVEZpcFo1VHowMys3aTNlOTZVRGxHZmMvcHpkREVPUWJrdnoyYXlr?=
 =?utf-8?B?b2JKQUxOS0FrYkxsTmhSaW1YTTBEL2Q0N1NIOWlwNHZkNWZFVmpHcUM5MmVQ?=
 =?utf-8?B?WlZveWZuOFBjRjBjWmV0M2p2RlpnSXhCOWdPYm4xL0x5dVQzeTU5ZU5aWDdw?=
 =?utf-8?B?TTBDbVJXaE1DbWc0dk9Nak04MERyT3k0Qy9SdE45cllsc3ZPMkJqQ2RTaU1E?=
 =?utf-8?B?VXJnV1B2RytGSGFNdEZEK3RCc0JLNnZnQzhaTVI2WmZGaFcvTTNPWXdaUHgy?=
 =?utf-8?B?SFpyeTBnOWNJNXpPZ1RJcjRXaTVtRFNROEZ4VnpXRkxSYTkxckVmWFREZ21Z?=
 =?utf-8?B?bjJEUkh2K0l5RFgrd2RPS0c2ZE9DQWoyVlA5RU1PZGE1ZDBHOGh3Vnl4dEg3?=
 =?utf-8?B?VmZlQVlqcTlDRnZmQXliR2EvT3Z0dzNkbXViOHR3SWd1VzMrbm1PNzJ2QUtU?=
 =?utf-8?B?RmRWVFVQcTZWb1RwNVdUR2Uzd2xVUFZ6UlBXeXJTZkdRdnZoc3VHWTVuUTJp?=
 =?utf-8?B?YklWNnAwNUdtRjBCaFlVaGxCR3EwS2xWYWp3UlRHSDBLWE1qNGZTTjhvRThp?=
 =?utf-8?B?ZjF3SXJ2d1RpY3JpT21RYTFNZDJQcDNpc0xrRGplL2hyTHg4WkxhWEhONGl5?=
 =?utf-8?B?V25xYUQ0cnNpV2E2aEFoOUhtN2hTMmx3Qkl5a0UvQndETjBsY1BVN24vYmtQ?=
 =?utf-8?B?Q1Q0L3kxMXBPQ3IzbU1lWHhlSGRHQWZnR2pDcWE3aHVycDJycXFWSWV5R1o1?=
 =?utf-8?B?M1dYTlhhYTB1VEw5aGRLUHVPcXZNejlWOFozdlVESzhnYXhDMlAwR0pLOVh4?=
 =?utf-8?B?Y0VyM0lDT2V3SHMyOG9IMWJ3OHBhdnFkZW1acFUwZ3FLRFo4VE1QeTEwRVNZ?=
 =?utf-8?B?R0dtOGFBejJ2WTZEMS9idjdBWDFDSkhsWlZqWkhIRTdkK0FoMm11emFVLzFt?=
 =?utf-8?B?ZXh3QWdDQTRQWW1iRnRWZVluZ0Y3UzdpZnlnWEpCZmFTQzBVRkw0RFMxMDB4?=
 =?utf-8?B?VmF0LzVoUEI5cElENlFOeWJ3VURPM3UvcDUrcUNLYVVGQkg3OWRvYlVCYmYy?=
 =?utf-8?B?V3cxTkV0WWNsdmVwMXJhVWN0YXAvc1ovallTUHlEZ0tMSnFRblJHa1FYazlF?=
 =?utf-8?B?WVgxYlNlNWlqRUlLUkJaQ3E5MXQ0RjJ1S0UrTW1LNG5tamJ5RWVTQ1hOY2cv?=
 =?utf-8?B?U3ZReE1BK1M4MlBsN2tVQXJKSUh3ZHBGYXRmTmdyVVFzLzU5Z2ZJRjBFeCsx?=
 =?utf-8?B?M1hIb3RNSkYweFBHWG1XT0hmSVRRRjE0a2RrMWRiRjlkd0Z1TFhRaTRrN1Ba?=
 =?utf-8?B?QmpCTXVZdjJvQkhHa0RtUUlhWGIwcHQxcUdQR1BzZlVMd1prazZRdkFOaUlY?=
 =?utf-8?B?TUo0MWxockUvQ2N6L1UzaldOcHhQYWxTSDlPQk5GVTROWGQwTUdOVlEyR3BE?=
 =?utf-8?B?SWpEdEZrSzlQbThDNjFieGhvSktvbXJTendjaGRkQllWZUg0U3R4dHRQajdi?=
 =?utf-8?B?NllldHBCc2tPdHlXejRJbytySUpRbHBnVGhJODF4UjROSUpmQmFsWkorSjM1?=
 =?utf-8?B?cUI4eUVmeHU0VUJ4ZVlhOGRLUFZxYmNFd0o4YmRlNU5HaW9RVTdDUT09?=
X-Exchange-RoutingPolicyChecked: qEm+98Nwz4uwBBGHRxnlrbVyur02sXlfSdnZfY4qubyGu8yhaeYzQfCIEec4aY8bWXnUPNOZYNSVsVWeGpdzmWUQi2Xs7LicyrA1Hzn6WsUp/XVC0EMImP04SnksXMBP6+qrggzxPX9d0jsH0V2qMlvPCEfdRRyfbAWgdfoCZgsuOM/2rYFszspGzw38R/jdY9x9iKQPI249Kj4JY3lkiusRM8pcpenZdT1NHuTu2ybVMKeNyTUfPAzS4mNskQvR8/bdqxRvt7/sE0uFuhGToIKgRjVWttwXpTKTV9c5GqDAlVQ6KQFoh46KJ+YD778aPdLRmeN5t6lz7/PplRAn5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a8c1c4-aade-41e0-3e45-08df09067607
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:25:46.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oERJqxAHK4vilNpp6o1y+/6qomv+CWXU0GZq6J1IR8giw2crD1Zii8XPNS5qozf42ehiJWCgD2ZFTDRjBgPa5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
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


On 26-08-2026 23:49, Raag Jadav wrote:
> On Tue, Aug 25, 2026 at 12:11:32AM +0530, Karthik Poosa wrote:
>> Read the number of VRAM temperature sensor channels from the second byte
>> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
>> exposing hwmon attributes for unavailable VRAM temperature sensors, while
>> retaining the maximum supported channel count on non-CRI platforms.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 35 ++++++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
>>   2 files changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 2c4eba4b8f8f..6e7cb250e628 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>>   	REG_READ64,
>>   };
>>   
>> -#define MAX_VRAM_CHANNELS      (16)
>> +/* Maximum number of VRAM channels supported by Xe */
>> +#define MAX_VRAM_CHANNELS      (80)
> Why?

We are using this in enum xe_hwmon_channel.

VRAM channels supported count has increased from BMG to CRI.

>
>>   enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>> @@ -48,6 +49,7 @@ enum xe_hwmon_channel {
>>   	CHANNEL_MCTRL,
>>   	CHANNEL_PCIE,
>>   	CHANNEL_VRAM_N,
>> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>>   	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>>   	CHANNEL_MAX,
>>   };
>> @@ -144,10 +146,12 @@ struct xe_hwmon_thermal_info {
>>   	};
>>   	/** @count: no of temperature sensors available for the platform */
> So now this can be "total number of temperature sensors"?

actually this is the count got from READ_THERMAL_CONFIG commands, it is 
excluding the VRAM individual temperature sensors count

I shall rephrase this to

/** @count: temperature sensors count from READ_THERMAL_CONFIG */

>
>>   	u8 count;
>> +	/** @vram_count: number of VRAM temperature sensors available for the platform */
>> +	u8 vram_count;
>>   	/** @value: signed value from each sensor */
>>   	s8 value[U8_MAX];
>> -	/** @vram_label: vram label names */
>> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
>> +	char (*vram_label)[MAX_LABEL_SIZE];
>>   };
>>   
>>   /**
>> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
>> @@ -810,6 +814,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>>   	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>>   
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> Same as last patch. Don't solve problems that don't exist.
Platform from CRI would have this, so this would be needed.
>
>> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
>> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_count) {
> Isn't the first condition sufficient? What am I missing?
First one is enough
>
>> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
> Can this be invalid? i.e. 0xff? And should we clamp it in that case?

as per mailbox spec no there is no invalid value for this.

this expected to give the count. 0 itself will be invalid

>
>> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
>> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
> So perhaps CRI_MAX_VRAM_CHANNELS?
I'd like use existing MAX_VRAM_CHANNELS renamed as XE_MAX_VRAM_CHANNELS
>
>> +		}
>> +	} else {
>> +		hwmon->temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */
> BMG_MAX_VRAM_CHANNELS?
yes, I'll add it BMG_MAX_VRAM_CHANNELS
>
>> +	}
>> +
>>   	return ret;
>>   }
>>   
>> @@ -988,6 +1003,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>>   	u32 reg_val;
>>   	u8 temp;
>>   
>> +	if (vram_id >= hwmon->temp.vram_count)
>> +		return false;
>> +
>>   	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>>   	if (!xe_reg_is_valid(vram_reg))
>>   		return false;
>> @@ -1516,7 +1534,7 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "mctrl";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>   		return 0;
>>   	case hwmon_power:
>> @@ -1645,6 +1663,13 @@ int xe_hwmon_register(struct xe_device *xe)
>>   
>>   	xe_hwmon_get_preregistration_info(hwmon);
>>   
>> +	hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> What if vram_count is 0?
>
> Raag
we shouldn't alloc this labels, I'll add this check.
>
>> +					      MAX_LABEL_SIZE, GFP_KERNEL);
>> +	if (!hwmon->temp.vram_label) {
>> +		xe->hwmon = NULL;
>> +		return -ENOMEM;
>> +	}
>> +
>>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>   
>>   	/*  hwmon_dev points to device hwmon<i> */
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 94575c476e3d..e1079eff72c6 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -57,6 +57,7 @@
>>   #define   PCODE_THERMAL_INFO			0x25
>>   #define     READ_THERMAL_LIMITS			0x0
>>   #define     READ_THERMAL_CONFIG			0x1
>> +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
>>   #define     READ_THERMAL_DATA			0x2
>>   #define       PCIE_SENSOR_GROUP_ID		0x2
>>   #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
>> -- 
>> 2.25.1
>>
