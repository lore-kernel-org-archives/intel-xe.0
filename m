Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4475C02183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 22:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8375110E435;
	Mon, 13 Jan 2025 22:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FazOJ2J/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693A010E435
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 22:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736807025; x=1768343025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mlr40MWoLUwI1RFEd+JZ4H8AQmZogjgLoJpJLVSFXG0=;
 b=FazOJ2J/nv+7Ld/niQPs4jScv2+jZMK8AGn0L8vcOIQCBmgWoIoQyMGC
 yrqtbfdl3KyvZ0wmR/anImyD6eHT26FUX1jKDt/ifC9+mG3Vcx2KQwVfe
 CmhAYdyZJtL5DQAmTwBOcTNFOGzGB3MH+9JYkpq8MuVLbvnTxytEO/PLr
 07jnRHZPUY24ey1qnAebogGgltgLP6PTR4iUZavFrxwzfc1/IuVnnAccb
 fcdy9fVU5DXimpN06ZW+LVFmzcTYktmUu21zpjWGi0AFdad32BKasl5CO
 VURH/BVbWcxuzmDN8VM+pll/suMCM06XLC6d5sTxjp8ZhJPP2Z4GIhW7c w==;
X-CSE-ConnectionGUID: MZ36jTGmRsWUo4UYtpQdJA==
X-CSE-MsgGUID: zYk6aVzLT5iDLo4yIe6knQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36301424"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="36301424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 14:23:44 -0800
X-CSE-ConnectionGUID: 2Y54f4woT4S00XXDBhdWoQ==
X-CSE-MsgGUID: TwPQZP8vSU6Z9ixYSLp7rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109241088"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 14:23:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 14:23:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 14:23:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 14:23:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/Bo60puJmfOlhBHIkYUOEyzhS/R8vz6m85KwV7LM2ryBt2kw4QPC6BotiDYUiswimWny+hAAiTIVdkQL1Nhu4HsRCTA0X0D0WP0qgFKgfsnu+A309/QmL8lu30P7d04pCVqYZSi/V4XA+Jb0sBFYZ8jgw3wrgYoXORvYez03xNPi5A6jPAXYNxnYQmnO6AuPZ9pXE2zflrGxh74QrUdCphnPSL5gFNYR2R2nea75g93tfMOEc2hgXMMQOOAvOsR439Z3nLIzg1JGF75/ugc6SMxJXUeFQZfAyCu0gQg/7GTGBaUDGujUf42pw/TZff9soHfJFjG6qioUHe2A6PF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLgALsK3aQOcT6AiFaBOSLIjomLk2GlbZxlwL1IeqzM=;
 b=ZJgSLwllt2d3MBhlGYufuCEO+tbAn8mrkSrtLcL5LVOAGSNXAjSU2IyunSUODDxEVRHylTe5ECC7gi3jz4H728cFFFgekg5ZrMsvl9pXAaQNCYzECszckUXoVs+f0WOu1/nkAvfz9TbfeUx2QKf/BSSrOCaKoim25y6ri0Bxt/R6nDKLF8gNMXML4spaxD+ZXNfTtqloZCgbajefzi1Ztf6kIdncry2I3TfsWNVSWV1sPwvrcHZiE3epHZNWeE7tEzoqrh4xFoR/20l1FoV2OQPQrCh7xkAObVhbKu+hahx1Y1MFbtDdSoGnBCk17gGNROQsg9CPJD2YMMhA/nyEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 22:23:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 22:23:41 +0000
Date: Mon, 13 Jan 2025 14:23:39 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa: Add missing VISACTL mux registers
Message-ID: <Z4WSaynlrcdItaPK@orsosgc001>
References: <20250111021539.2920346-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250111021539.2920346-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e7bd7a-a873-4d21-64a8-08dd3420ef46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0xUZEtPV3hDTXJpeTBWYkxpU3VrMGE5TG9NZkFuTDJzQURDUkcvWFdrdHNS?=
 =?utf-8?B?TURocjRDOVFKYkdHSTE0NFJhOGoreUx4NStSZ3VRVzJMT3l2TU0vbmNIYXlz?=
 =?utf-8?B?dERNVUVuY1FMV2luT2luVS9LMDlEVXdZWnlOa0srTWV5M2dQSUtyVUVma1dv?=
 =?utf-8?B?V3Q4SjJFY2FQY2pvVVhrV0x0UFFvZG1hQitpRUdFOWx6aEdEZGwwNWQ0STB1?=
 =?utf-8?B?a1J0Y1pMMkI1TmtDblhGRzhHMWthLytzR1o3TEtvNjFQUm9QVlE5RThaajgw?=
 =?utf-8?B?QzBGUXRSWnhack5ZY1M1Q1JrNjVKSnRVaEIxbFBwOGZMdFhTakJjM1RyYWVV?=
 =?utf-8?B?N0MzTVdJc3VBNGZxKzMrNnlZUFFLaG9WbDQwYVh1WDcwTU9ZSTQ4ZWFPclFI?=
 =?utf-8?B?ZE1IbGVkaTZnMUxCVkYyMUFpcElQUWY2MVEzS25VaUpXRHhiQUp0R1RCS29w?=
 =?utf-8?B?MkZvdEVGQmNLMEk3UlZYQVh5Yko0UFJ4Uy93eDRyNlBRWUFIbzUwSit2NExa?=
 =?utf-8?B?WFN5akhRZmpjMjU4MTBzQ1lYNW1jV1JQVlpPc0I0Rm9LVWtIUDE1enhPZWEv?=
 =?utf-8?B?YmJGdlljQWgwVWF2cGN1Vm1iblRyLzEzS09oWmFIMDdxcUZKb1BRWjJxbGRt?=
 =?utf-8?B?aXpPMldtSnl2UjEyTkRyUXJZeFVCd0liNWVreGJmejZCTy9rd3lFQ1FUdEVi?=
 =?utf-8?B?dmJucDJ6bi96dTdla1J3elF1eS8xam5STWxCYlFLKytpbTNMc0RCTDVweWl1?=
 =?utf-8?B?b0JZMFF0K2o1TnprVDAvVExWaGE1elJCMWRDL0pBemFLMkxudHlyUm1jQ05T?=
 =?utf-8?B?NUhiRlVScU9uWGFsejIvbWJod2R2MGxGUjB4QWpMdFBlZkdqdzZSQnJFRzNy?=
 =?utf-8?B?bStYcjk3NUlaazQxWlBWcjdnQXZYQU40TFg1WTJ4N3gvVklvQjUzUG05emdn?=
 =?utf-8?B?T21xVmYya205aHkwbS9ZaUxiOUNkRjFtZktsVWE0WTAwR2g1UVl1bHduVU9Z?=
 =?utf-8?B?UGhzUzhsOFF2Nm1UUk8wZ0l5eW9Db3BNMEQ2SHFIZ1poamROd0Z0ZnlHWGI0?=
 =?utf-8?B?elpkZi9TZjB3MlBKNFovLzl1bGwwbjRKTlVXc1U3R0xMSmwzKzdWcDl0RlMr?=
 =?utf-8?B?b3V3TVFzWW1kTmQzTHIwSm0yRFA1T1E5VzE4YmRBUzFPUjBLVkxpdkF4WEpQ?=
 =?utf-8?B?bnBIUnYrUjVoSzhJSmh2eXljNEY1OHZmMUhqaHBFMlduZ010ckhvclcxbHl6?=
 =?utf-8?B?ZTU3YVFQYzhRRVJ2dVk0eXQwOVJBZUhPaWc4VGJRVzRQN21Jam5BTzgwdDkv?=
 =?utf-8?B?aVB2QnJ5UUJoSHhrbjBYUEllbC8xTkVtL2xuZVQ1Ym1WYlhOei9rRm9rWDU1?=
 =?utf-8?B?ODVENVducFE3cjVuT3VpR1ZXaVFBcEZMbXcyMVZxWk5MM1lHeXQ1NU5iZjNq?=
 =?utf-8?B?NmlBdVN4WFhheVorZTN5NWF0cFFWVi9DQkxXdHJsR2s2UEVvSUE2c000eElW?=
 =?utf-8?B?ZFJlOG9qL0F5L1pWcURiei91QmF6Z2EzNWlqUnJLWnNFVmcvYXRETkNtTG9o?=
 =?utf-8?B?MmdKaHlNWWMxYmlhb2Z2SW9INCtYTnhWV214RmtnUytDZEJLTHVLRkZjN2VD?=
 =?utf-8?B?STQzTXM5Tm5HMEgzajRONUxwd01vOEc5cUJmRS8weDdKdUdOMk80YStmMGh0?=
 =?utf-8?B?VFdoTkt6dXNSdFdaUVVjTFpNY3BtZnRmQXFPK0U0N2hrZXFoQXpLYkVXbVVY?=
 =?utf-8?B?VUdScWZiZ2FDczcydzFiOUhYalM0bmZlM0ZoWVJhVFRzcFFPN094TVo4anNw?=
 =?utf-8?B?RWk4M3pNNk9KRlFaQkttZlFQQU5EYVdTSUNYVnZtamNRdjIySHlEUi9rbHJ5?=
 =?utf-8?Q?JW6g+nvXVWv4z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEZ2QllMamtuWnRhbmFxTlhCaXM2NExZSnUyUFdrSXpIOG1nd2xDQkY4QWhM?=
 =?utf-8?B?RVVSVTQ3U0psQ0ZYSUZ2VkRSeGNMcUZuNDR0bjZvVDRqeldDZDRXaFhUSkJz?=
 =?utf-8?B?Z1NnajJWQlVmeUNha1doMGo4TjJFSFI2YUNyalFBZXBrNTJ5WUNqRUVxamt2?=
 =?utf-8?B?M0trc2dPOENUOWNtK3dTRW5na2NXQllETVc2MXVReG85YVIxeU1BTTF2bVVP?=
 =?utf-8?B?TmtXVFhDcFN5UG1PZU9uSUxkQmxIamxqUStkU3ZXWk9BemM0NEY5ZVNQQzVz?=
 =?utf-8?B?cHlDRkxKZXQvenYwb0owV21TTVhXQkMyeEFoUkN0RU1hWGMwU3NuSElocVdH?=
 =?utf-8?B?aXJxZjduNWp6Q21CVEhGUVBLREpCMmtHWmpXcUNDL2lxTHJ6REg1bk5RL1NC?=
 =?utf-8?B?aU0xV3pmSEV3bGozb08xK2VmbTAzNlNYdndVdkIva1NMSElUdzZ6WEhIK3dD?=
 =?utf-8?B?UjFjRVBidFV0TU9BWkFZdWcwU0hTSHVvYmVDNHZ0UDJPY3JEWEN5UTNQM1p5?=
 =?utf-8?B?VERCNWIrRUJDWVhtT2pycnI1dFRhS2ZOUzlEMUdacWxjMkN5WmFnekdiTWJU?=
 =?utf-8?B?aDc3YXdXWjNoM1l0UlhzelpIZ2xyNXA1VGJqNFFaMzc4UER5bGc2QTdoSG9q?=
 =?utf-8?B?dWQ3ZHN5RFppQkFpMUE3MnhNRFdmdnBJeC9PdnJaRUZBSUM4clc2NCtNUVZD?=
 =?utf-8?B?ckpCZjlnUS9rUlZnblB5ZnNLYXc1d3ZKZ1lRU09jbGoxT2RYc3B6MDFKR3oy?=
 =?utf-8?B?U1VpTUZjYUUwc1JqMW9Cd3VGdHF1eVNZWEw5WHUybGJpNGtkSkZCMWVBTkhR?=
 =?utf-8?B?QXppZXNhZEZwUHd0MEU3ZGJLbmpkV3lvalkvNUdxVy9DbFc3QjhEdzdDRnpL?=
 =?utf-8?B?KytEc0tZQW1vdHZRVDBIVjNGKzBrWDBRRkdrdkZPZ0p4YVdieTdlMkFTS0g5?=
 =?utf-8?B?Slh1YUdyNk4zazk3cUptRHdOMHVHSXkzZ1FHVUw2RGpxRlUvbWs5NVZMVEl5?=
 =?utf-8?B?ak5hUVAvLzFEK1UxOU5zbUtTZGF0MWJQVXRIamZoejgvR0p5TEhQcFNiZnVu?=
 =?utf-8?B?b01PVlNZMlJsZ3hVTlMvRmpBcnhPSjZackNQdFQ1Q3pSejRETVBxdHZSQ0NG?=
 =?utf-8?B?SWk1cmZyejVteWtwTFBKUUxuQ0JCcGcyUmY4K25XeGpOZG1IQThnNkc1VkNL?=
 =?utf-8?B?MldKVmlPSjJ4dGdrYlVUdlpFblpSbEZ4bVA5UGdvR3BqWE02TTc3bDhDOXZB?=
 =?utf-8?B?dC85RWJkTGNHSHpUYXBxSEpGeEU5Q2ZXOVhpZUIzME5nR1VnRFZBODRCQ2pM?=
 =?utf-8?B?T1NVMWdpSTVIUUFzMExCM2VCTUFzSUV6Q1NEcVBXVzhqd2FueGdyOWErZUFp?=
 =?utf-8?B?Vk4rbjQyWm8wVHN5L0dxZkUwQ1pkT3pUWTVtc2ZWUG5QaUl3QUZpU0R1bTV3?=
 =?utf-8?B?TEdnUDdaaWtHQXQ4dysvSU45eWpPQy9rWTZHZVM3QVRTNUN0eE1LSmFJTEVR?=
 =?utf-8?B?OWRZNlNnY25LcDNuM2ZMVUJ0RlpCTkxObGxheUIyL2tjVExhcmxCR3pONEY0?=
 =?utf-8?B?QlFlVGwvQ1hHVUw1d1cxbnVoTmRMQ0xQQlFwMk9NUWduMUsrZzRBMkhkRGxQ?=
 =?utf-8?B?MzNCYU02SVpjeHkxUlNIeU0zNmxubnMzd2FlT2syNytuSkpGT3FuMW13dTJG?=
 =?utf-8?B?RVlnWEwySTVPdzB3OTN1YUlVQzQySHA4MjA3TUdHaEo4M1Y5RFE2MzZNUzZh?=
 =?utf-8?B?VGpYdDB4TXFmRmVkRlhFT04vVG1CREY1L0cwTC90cDdjS3REVUhTUm1XRUQr?=
 =?utf-8?B?ejNISmd1VVBKQWJOejE4VXhPN0VBdVlPbHpaUEVqNC83VzVkZ2pCWmVHZThi?=
 =?utf-8?B?dDVaNUY3MXM4SDc2aytYSms2Ukp6MlFhRGRSMzNUaGI1MlJialUxeEIybUw3?=
 =?utf-8?B?LzZxemxOVnFHb0VpT3RLQ3hXNDhKYVhvbisvUHJzb0huWG1HY3FjdU8rd3hK?=
 =?utf-8?B?WWR5THpuSC93UGhnMEQ5UkpSMmZLK25Fa3NmY3h0dk14WHJMVUlQeVJNb3hJ?=
 =?utf-8?B?TThsUGtDKzlHcGNxdmZjY21vQUZSdHlVSi9pZW9sNXhsZzhKdk45WmRQakt1?=
 =?utf-8?B?TzdEK2dLdVQzQ2MrQWhaWlgrQ3E1V21abU1JL3F5bS9mZzBZR2NxOUZ2WUJB?=
 =?utf-8?Q?+oO2zCAc9/GfA3cL9sYZceQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e7bd7a-a873-4d21-64a8-08dd3420ef46
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 22:23:41.5893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6C2wMCRtKv0A/NVSsyGlKdsB7E1ouPPZD084HWw6fvAek4G7Dr+uZYl488cFHEDPXUBLdtQhjvtTJNVvzNr9SN8S+kRdhItBSMj05cjnsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
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

On Fri, Jan 10, 2025 at 06:15:39PM -0800, Ashutosh Dixit wrote:
>Add missing VISACTL mux registers required for some OA config's.
>
>Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
>Cc: stable@vger.kernel.org
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 4e00a77289c50..eeb96b5f49e2a 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2163,6 +2163,7 @@ static const struct xe_mmio_range xe2_oa_mux_regs[] = {
> 	{ .start = 0x5194, .end = 0x5194 },	/* SYS_MEM_LAT_MEASURE_MERTF_GRP_3D */
> 	{ .start = 0x8704, .end = 0x8704 },	/* LMEM_LAT_MEASURE_MCFG_GRP */
> 	{ .start = 0xB1BC, .end = 0xB1BC },	/* L3_BANK_LAT_MEASURE_LBCF_GFX */
>+	{ .start = 0xD0E0, .end = 0xD0F4 },	/* VISACTL */
> 	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
> 	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
> 	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
>-- 
>2.47.1
>
