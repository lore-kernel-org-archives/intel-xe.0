Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D12D767D7
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 14:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA2210E8A7;
	Thu, 31 Oct 2024 14:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPlyrZsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511510E8A7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730384564; x=1761920564;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=41ltuN4Yh/n/F0Xcfmm12XyMDChfwomvJgOIPLCmIXg=;
 b=QPlyrZsgx9whhExIoaDG9n34UvVKdLLzH4Ea9xNEH4wU7/LGjPKfqa0W
 oqRCSeSlwDdvH76xT3bh3MxNVfi4x0GEoHe3qnxnH8CgooeVyM2dfr0yI
 h5IauQyl3IJu82uMSJFWaI1Rx4z71UydrnaY4mOnZjJ5oouJ5nemTprFR
 T32NrZ//RAquwAFsYJHBTwrxb2P+SBuJHENoVrKI76ALBsiR3M8s9zkDb
 ChI3848lFyAk7rp08mb6pE9bY0Vlbo8fl/m11adp29fQQo6GAdI9Ga6K8
 7E7KtEz4YE9uMbOjX6z9XGVD1kQzXUJyeEx2J6u6z1/Ah/Ql1+TUc9KdY g==;
X-CSE-ConnectionGUID: ZJ7OV3UORWuf4Uq1jmOkhg==
X-CSE-MsgGUID: CiH9aHG6S8WTYidUrpXj8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47596332"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="47596332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 07:22:42 -0700
X-CSE-ConnectionGUID: iSB0Le9wT3GJgDTQzbJYkg==
X-CSE-MsgGUID: x+1K8lX7QgWuaIcy3MuP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82757262"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 07:22:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 07:22:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 07:22:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 07:22:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtCQUZA7+o2eHYYT4dw4Ghfi85+Hyw5PZeZBg9zqqU6RIl6wEjzY8dLWm500Q/4xmFZteYJTb5nrWkbw2AKFGyX2TUkQzXqIgRMFJvoOBfCVnk5+Pen9Gv7zaBrGVduqbioOgfOWRQj2VPveVAs9z/Y1ZZz//lOnWlbiC8w4luAzzrT9RaQt6vSGBnRJWqDSYvahpmh2ilGRtvPKP2O2q222I9Y8UfJdxAWhuwx/JeIrXbD4lBAVy2Yt0/rTBPNV2U3v2MMATF0KHdq0J3CTvThJsgV42hdfkZ1wDqoyjeWgKVIG9eriF8NAj1VymDYW/QGoe+QZB44a+M4plhIMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gFUYKg5xAjLHco37e8wBeIpA/Kr0WXkEsReb6BuQqo=;
 b=wJwSEbI9EBxnsslPQDdPzQbrQya+xiQhIhF3n8q4JzyAOMTVkOZ63k+X0tftrMJx5zwVZJDw5AveGYSYYubLd+Dgy+7mE/B/jaGV8frJ49uxFee1rKvaJuZQL6M7e2AX2mWKBOXS28qKVN9Is6Vt6M+tHJEH3wGGwDiswSe9XGXEHt9o5ZJfavUXwmo+JJxQOqVOTIt2nWFHllYUs2ZlNRmikMSUzz4ty9RBf/IbJMi9x4MF7vkRs1hS4ZvG34KBA88dLGE6HseNXQIs/vSqa6cTNCLMu8gNMKt6FC/tXFYdlAfkdozgpIZ8DIduPp9RvaHGS8TEOR91Kg19pi2GrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:22:34 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.020; Thu, 31 Oct 2024
 14:22:34 +0000
Message-ID: <c1512553-eed1-4673-aa82-3430efafc50d@intel.com>
Date: Thu, 31 Oct 2024 10:22:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "nirmoy.das@linux.intel.com" <nirmoy.das@linux.intel.com>
CC: "everestkc@everestkc.com.np" <everestkc@everestkc.com.np>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
 <a6db328f-54ef-4941-99cf-b7da52287345@linux.intel.com>
 <IA1PR11MB82006A9865919A669C83594E8F4E2@IA1PR11MB8200.namprd11.prod.outlook.com>
 <6894f0472669600c06d43457bf2be60e26892ebb.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <6894f0472669600c06d43457bf2be60e26892ebb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd7b486-95ed-41d8-78ac-08dcf9b77691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTE0bElRQS9UankzNzJaQ0ZubTZPeFBQdGxSZzRTemNPWFpFcEhtR0Y5ekN0?=
 =?utf-8?B?WlprenRkUGc2MXZ3S3R6dWk3TlNEZUVXSFlidllZZ2tkSlYwTTAyUnB3SThS?=
 =?utf-8?B?RUV4Z0h6cWs1UG4vMDd4UHcwSDAvV1preXNBRUZzMGdiemJiME1nNDBMdzBC?=
 =?utf-8?B?Y2NkdTlYV1dmOTJ5ZUJKcXhKdHBxMER1aHVENVk5bUdWQjhwNm9LOTFZUGNY?=
 =?utf-8?B?MGI0MlV1aGVxNFFydUNHSnljOE1BSFlCaDZrUnVmdXRiSVZITGdJQjdwb25B?=
 =?utf-8?B?bXJTOGIzdXgrdllwZFdSWUR3cjJEMmVoampTak5HWXQ1ak9BdVlpaE9sSVdB?=
 =?utf-8?B?dGR6R2EzMFdoZW1MaWx1dFQ5Q0l0QmhqbU5iNHVzdzg2c3BqR21Xa2lSY1hm?=
 =?utf-8?B?TjJpR3pycE12WURaVm5sakpuTXE1dnhrY3dVLzdJSld0NmtxeFV4MUVBT041?=
 =?utf-8?B?YUZoL3kwY1g0czVvQTdNUEtFNDdlcGdoQldnVDNqVzhFTm1XVzJVWWlqNGNw?=
 =?utf-8?B?ZTZmRlVoVWVyS1A1MUE0OG04bXZNZk81c3gvLzI3UFd3c1QrVUoxZ3hJQnI4?=
 =?utf-8?B?ZjNnMHN2aXVEN2lkVm5PbmpQRENXMXpuM1F6eVdDMUkrbTRUMVFtcG5IWnBo?=
 =?utf-8?B?b29sd3djVWc3am5EWUd2VFB4bTlBYmpCNTBjSkVxMmg4eE0wQWJLbWVaWWV2?=
 =?utf-8?B?UzZINmY5MGpBV3djVGZ6dkJDTkE1UG04RVYvU1k2WTJJejVjdEMrYmJWSXdU?=
 =?utf-8?B?dmJITDBtbllnSUVmaDlYam9lZUpyVVU2Y3FmSXByOTRIMThLbUJBM2R5ZG04?=
 =?utf-8?B?eXFuR1VQaGhOMTB5Wi9jMzJvTHJ0bXI1L0JWT0VISURUcVE2Q0Z6c1pjMjd6?=
 =?utf-8?B?d2lTYndTUFpSWXk4ajVLNVRIeHcrSlp2RVRwdjZubHAzN09DQ0RZeTdyMUJJ?=
 =?utf-8?B?amkvcWxBU3JmQTZmNVZvOWxhNmN5MGJhdzVrZCtoN2R1V3NUcjMzOVZKeUxD?=
 =?utf-8?B?aTRPVFJnUURJWmNpY1Z2YzYyL1pnM1BOcnpzUHRDM2dZdkRSa0xlcENMd3px?=
 =?utf-8?B?bjAzRmV2K1RTTFJ2ZmlYMGZsZDlMdVh4eVlycUltb2xlTFFkUHQwc2l6YVd0?=
 =?utf-8?B?MTBrWWdYaHFaMzZzQUo1UFZxdWJCRnJxMmxDVWhVR0pwK2lPVEVKQUVSQVFL?=
 =?utf-8?B?citreFgzd3U5ZnVGS0txNTFETGdCODdBOUIxSW8vaXJSUUZsVlhtRVpoQkpN?=
 =?utf-8?B?SDhWVEF1TnZ2ckl1MFVOMmlWSmJ4NHI3OU0zM1NVRG00ZUt5VFRtRVV4Vk9y?=
 =?utf-8?B?NDdycW1Sb3poSW8ySG1OYXY0WW9jYllWbTh4dVBsWGZtd3hLY3BHR003NVlC?=
 =?utf-8?B?czB4MzEzK0oxa0QwaGtTV0FpbW9DLytRbmZ0S1FKMEZVSFBPMmtIYldMeVlJ?=
 =?utf-8?B?OElGQ21WS0Fia3grUUo3TlRjZXRBdnZSZVh2L0pmMTJWM3NBS3NEeE5oUnpq?=
 =?utf-8?B?SUxuSCsrWXJaeXRjYm5Ib3Z4WFlhdHVOUnptRXZUSk4yTVRnL0RTYmZZSlh5?=
 =?utf-8?B?TGwwVklXTUc1b2tManQ0cUtqRTNWTjJ5M2twYXEvbDdpdW9IMXFBZ2gvcHpt?=
 =?utf-8?B?V1R1eHY4SnZiNU1HeUs3S1E1Q0ZtSHQ5N3oybm94QzhsQ2FJdzcyeldMM2VL?=
 =?utf-8?Q?t0aIK+5WsJo2yThx9isT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmtSSmFUQng3em1hQlA0OWF2TEtZQ2hna0prdnh0WGp5YXh6SHVwWmVoNFh2?=
 =?utf-8?B?UGxScTAzOUF2YkVmVXpPU0VVWUdNS3FveW1aSUduMWYvRWY5TzM0OTZRRGRX?=
 =?utf-8?B?azhSaFY3NW5CSDdHWFdWR21PUTV4Vm9TN0pxMkpQYlJlTTlpNFlPR3FoQjVx?=
 =?utf-8?B?c1ZCbko5MGdTcCtkYXB2Z2dPWDZtQndZWTBSM292YStSM21mMXVJVWlpakds?=
 =?utf-8?B?V2FHbTVFeStmWm5BaEY4Z1VyTlRTOEZRWnl4Mm45ay9tN2pzWkFxa1dZM0RE?=
 =?utf-8?B?ZEdBSW50WEhQRlExT3picXJxZXk1ZGFDNlh0UXNlVVlwbkNnWi9sNFA3elEv?=
 =?utf-8?B?dURjem0vQmt3ZkdEd1cySzZyb2x0cUFranpFbUEwY3hlNVZGWFg3Uk44SVRn?=
 =?utf-8?B?VUx4VnhuNU1lWUhXMmVWa3lraGVHZm5TNC80NUF1NE54TEtETDcyOXFuMklv?=
 =?utf-8?B?eHJJVmNEVElScTVDd1JlMyt6MnR4UjMxU3d2bGFveFhlb1JiUk5UZElGdnZH?=
 =?utf-8?B?Y3dUa1UvZHA1U2UyUXd6S3hyaVFoM3E2WFF5TUxwTWt2ekF6eldCdytWT3dx?=
 =?utf-8?B?T0M1Qm5SVlhDOG8rMmVPT0hKeTVhSzJWakRDZDRDRUZaeEJXSC9PdkxadVA1?=
 =?utf-8?B?cmhNWkJMWGpxSUZPS0t0anY3MHFubzhpaDFCRDVCNmgzQVF1d0lkQVNBczgz?=
 =?utf-8?B?M1Ztc2FvdjVDa3lYQzFRMUllcWhTNEUzWXZJc2Z0MmRNdTRJUGhoZmcvUWN2?=
 =?utf-8?B?NnlBd0l5bDI1TEFFeHA3eEEra1J0ejBZVjEwTGpMaVp1L3pDRU51cGxKUTNR?=
 =?utf-8?B?bkU0T1U0ZUpBM1B1NWJBNlB6RGRaczhNcGhtbDltbkhLNHYzTWZGMldhWkhE?=
 =?utf-8?B?UVlQUiswSVY2SHplbStuYzQxRVpWSytTSTJhRmZYTDREcTBEUEpMSURGTGZP?=
 =?utf-8?B?aWI1UmZCeFNNa0xqd0hSbm0yY2xnSDZvSW83TnZRTm9xSTFLK1RGaWZQbk9B?=
 =?utf-8?B?ODhaUmxVVWZ6WjhuNE94YVE3SXRPZ2lzdDVSVWI1WFFFV1d6M0pkeGpWdm5r?=
 =?utf-8?B?MDYzb1RuTWtLTFdIV2JLTDBWZGgwRjdJOGh4MlNEODZXeTU3TTRTU05xci9M?=
 =?utf-8?B?NjFBYmQ1ajlGSlNpT2t2OWRXLzIvWVJWRlFBYS9TQVN0SDdYOXJwVVVzTk55?=
 =?utf-8?B?UjFBU0lSdGYvYTJLeS83L1Rrd0RlbmF4bzI5R3c0b2lFaXkzNEw0R09MeG1v?=
 =?utf-8?B?djNnMHptVEQ3WFp4MjhUVGlZcyt6OXRGc2VnOHdNbFk5SmNnSVVuTFVsNWRY?=
 =?utf-8?B?KzEwNlppc2FqMzFUTkNzNzBBZGJUSlhOTFUyMGFSeEszQ245S1Zvdi9DeCtw?=
 =?utf-8?B?RVZNK3J4N1Q1QWd1Njlvb0JPSVN6dkMwN0xhZHBISWxoS3B3aTRuUkcvOGRt?=
 =?utf-8?B?Snk5ZTRlWjRvM2NvRVBlQ2FMUXVmWDgzSjFqRTBHbzVIS2tSaTVyR2hXTXVr?=
 =?utf-8?B?eDl4WkMzNzBvNWZDQTE4VDY5M1JIVE51ajZjL1BwNDV1MDlzalpBTnV2ald1?=
 =?utf-8?B?VURRd0o3a2VyREJJTmloWEJTMWFaZ09EQndIMU9JUzVVbkYwVk90OCt1N1Zr?=
 =?utf-8?B?VG8wL1l2M2g0U2JWS2huTGdpWFF4UUtOZ2NZclRaSUNQTU9OWUFtRHZwV2Nr?=
 =?utf-8?B?R1JhcHZXcHRKeHhJQ3oxUVRGcUFGUS9JejBjenRaUGIxdHhkemdtSkpseGRQ?=
 =?utf-8?B?aWFrZklpWGd2cDJTbVlGbGYwenljSHE5emFtbVBKY01pa1A2WEczU0w2TmRq?=
 =?utf-8?B?TFQ3djVqd3hzMFhzbTBpWXA5TzJLT2dOSWZ1ZWtHQzl4YnpVNWZ2cFV2cmpS?=
 =?utf-8?B?am9SL1RXN0F6R2UxMkkwSGJLWE5XNGs4bUVNZTFzZW03bjhhNVRPOVgvZWcw?=
 =?utf-8?B?V2dLK1Z0TzJlTUFkbjQ1VmNqMnpYQVB5SFZVUTFzK0dZandLVDQrclV3SEFi?=
 =?utf-8?B?bzhsZ3lsY3YwU0RQU3hNaWZMZDV5NVRxMXdoSkJSUGJINzRicUVkeVlqV0RW?=
 =?utf-8?B?elUzWnFDYVVWVm9GSkljb0VyRjdNRmd3QnZBK1NSZ2JoaTY0Y1ZNRU14aTFS?=
 =?utf-8?Q?vgZg8fzcjUWNJ+rN1NBEq923+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd7b486-95ed-41d8-78ac-08dcf9b77691
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:22:34.5058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r155CyX7WqVgzp1E9Df7QNO3VguvLxoXJc4ZQ66Yc1GUiz4bSVAPEZTtNAncQy6qlvwWmEzTExMCq+6cOllOhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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

CI test rerun on the 139890 and result is good. Sounds like we don't 
need to worry about that patch.
Now we can go through normal review process.

Regards,
Zhanjun Dong

On 2024-10-24 7:50 p.m., Teres Alexis, Alan Previn wrote:
> On Thu, 2024-10-24 at 14:13 +0000, Dong, Zhanjun wrote:
>> Yes, I will send next revision in a series, which include that patch.
>>
>> Regards,
>> Zhanjun
> 
> alan: I just noticed the other patch DID get sent to Xe?
> (https://patchwork.freedesktop.org/series/139890/) but CI results was
> only there for rev4 - nothing on rev4-resend. Wondering if Nirmoy
> wanted you to go ahead and create a two-patch series with the Everest's
> patch followed and your patch that adds the lower-vs-higher-dword
> enforcement.

