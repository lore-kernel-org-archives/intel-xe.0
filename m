Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9DDCCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE27410E538;
	Mon, 20 Oct 2025 23:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tl4saipQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B4310E538
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001910; x=1792537910;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=Tl4saipQwzGfw35/RSb5sDQejmhlhjHe+CgJzis5YA16P09U/TfH3S6b
 M/0p26/7jRcGrzEcqeBdyH0xtN67Xe4zjE1Ijt4Ea9chJprFY/0cMa8+m
 mJBOT/TWmP8EEPTB4aFoOQqmSF68bR7jw5Ak2Q3mkfU6O+pIfjjcZeJgw
 04DCyxUm1G7BIB6w1O8y0KtfoMjB3AAWx+VMGckiiLJJD5En9or6FHCuv
 uSfoGfJyx3vZxiiP9UP7c5GYFbDxX0La344D3Hao1/Gc/YH38LkF/Y/5y
 FDEBhK4Z0WTUCQLYI552qL8rET6lqFjigds/Jv3PUqwGmh8JZg/uy50FB A==;
X-CSE-ConnectionGUID: DgFNBHxGQKK2DutRRyNhGQ==
X-CSE-MsgGUID: WpY34DAHTiOz0F+EpFU+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66988478"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="66988478"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:50 -0700
X-CSE-ConnectionGUID: IH7yGD3KQsKEzS2RMT1n1g==
X-CSE-MsgGUID: FnR28/SlRFCwvEiKv/pPsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182999601"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:11:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:11:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:11:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGAs4WWRSQ9jUOuhdZcD/cr3cwOUK26qGa9rvr7iWIbxm5RMLPRSmpu+u/oTCNxG+s009bAM+gZs9S81y/94ExLUO3ujtdPqY8FlpKdILPHIUD4zDL7au1Vch21RWkBXAnYcEdkGdRf17wecbGZnS5uQS6FjfjKbadkwPUK0GdNtyffQX6+lz/J2FMhkMZ9zym4fAyivzU6+6d+mcFoxUrEPDoqbqXucxiDI8k/UWLmwSz7RQF86UMXghhj9t7api829CpEbz8rdQ0ulemTf7FKEqpg5f7ZQT5vRC6ICCkBbzKi6ypd6OW5HvYBQ+wRNG6dZe4dJJpCJPEuqnazGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=XyQn1yXYPcZKh2s1DC+8Mbk5fcgO164mki68Nbd8E37FQwZeMFabevaRzIngKaj0a+9IcjEwIF8Jp1sGVJ4RrNndUx0RYme4HzUrVblVsUOIvUZbQCRd+zqyHLnozj28xED5TNv5k1ZzqQl+G9Nw07WRt9pE2xq2jnXTb+S6va8iAuZzgChoL4yJ3QiFcUXaIutX5OUEIc2iGbL5djFm0rhv2x9j/KArn2tKm9nHffrkyxdx7QyS8nuYix5pd/VWZX2Xk3G0vm622Xds324pT8daBwZJwY19ecb++gYkca0rBUQ/CgfjbNcnugWFGjt+52Zm1iLDyOlGwosbI68T6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 23:11:47 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 23:11:47 +0000
Message-ID: <7f1a6fca-1e19-439d-a9c0-2820f252f6d3@intel.com>
Date: Mon, 20 Oct 2025 16:11:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/xe/guc: Add LFD related abi definitions
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250828174159.1232994-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:303:8f::27) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d186f72-3d02-48a1-cfaa-08de102e0aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1dUangyaHBPci8zSHVqaEhuQVowWGw0UVVpaUpPUGdWU21JV0M5dktRcGpR?=
 =?utf-8?B?YWpRTDBQaU5uTDYraGRpVVBlZFdBYXlqamxzYm96NjRKRW1WOEVUQVNrZGdN?=
 =?utf-8?B?bE5JRHFtdzBnRVJZY0hIZE9aenNSWWlKaXNHejM1aUdvMFQvU25PRDU0NTdF?=
 =?utf-8?B?d1p1ZVJ5Qi9yM2c2L1M2RTF1MUZVRGZqTlFESUFaUURMaExOZy9ORVVTT3d3?=
 =?utf-8?B?eGo3bGtTZjQ3c0IyRC9KZDVyWXQzS2RDUUhqVkN2cjlGb2tXcHNSOXhhdGdM?=
 =?utf-8?B?TWZ4SlRXeW94dWM3TW1VRmwxdFBqa3daM0pvOHl5Z3Rtci9uL2pkUmpjK2Jm?=
 =?utf-8?B?MEhTay9nZXdTS29MSFU0ODlYOVFnQ1E3NVNSV1MyYUYrcjB5cGNNNk4va0pG?=
 =?utf-8?B?ODlUeDF1NGt1UXNjNVNvL0dxL3JiYUo2elVKSkI4UTUyZGZRaFJCVHQvMDBQ?=
 =?utf-8?B?ckhRZDhBQlhLdnhXRUc5VmdsWk9FVm9vQ2tYTWp0MG9ILzMvZHVlYzJQTUM5?=
 =?utf-8?B?WjR0cXpKRUc4VitvNmJQT2dkd0MxbWxQeSt3SmVJWjZtanUvdHJhdy95c3Z0?=
 =?utf-8?B?eVdWY0NiQVNxd3JOQ1NlT0wzSGVENVlGL3BtWW02YTQzV0RKWWVkOHFReEZB?=
 =?utf-8?B?WWRKRkRNTDUyc3ZBeVB1STNTMzZoQjNjUjRHU1lkaDAzSjZyR0F0ZlF6Y0tK?=
 =?utf-8?B?eDYrWFpMR05IZmxMTUJmZFU5ME1ma3cvZzhBbjJBTXZNdDF5bWVQTVBvYnZ6?=
 =?utf-8?B?VDZ0KzQyUkREZERhZURPczJnK1Qya1RDU1gxWlMxcjdSRUh3QXphNWl1Y2ZB?=
 =?utf-8?B?R2JDWit3a3N5eUlQdEJIcjB1ZDVNZnhFaDNSRno1LzZNem4zYlR0Nmp4dFZF?=
 =?utf-8?B?YzJMaXhMcGdaczR4c1pVWUo0Q3Z3VG5DVSs3a2dieVgzNVRKQWZaOUl0ZUJJ?=
 =?utf-8?B?TWd1c1ZQdnQwbHM3SmlLaUFsSkwyRGpmeFc4bWh6L2hBVTVpeWNLUk1PTE8r?=
 =?utf-8?B?UVBMOWVoUHVMZ3kxZVBsTlBRakl4aExCdW8ySW03QlcrdkFSSGw2KzRYUWJ1?=
 =?utf-8?B?Q24yVHpEMmQzOWlTUVFwcmM3MktIN1dINVducUZIbWZQYkR4UjlvNWlWT0FE?=
 =?utf-8?B?Qys2cFE2Um13WVBiYnl1T093eElzVmpHZGVXSkUrd0Z1b0M5d2xKRGRHNnN1?=
 =?utf-8?B?NTdKYUQ2cGRLdG1tNjdVRG1RaUhEb3dMckR3MW40QVN5NnNKME1xS1B4TTRW?=
 =?utf-8?B?UEZtTDg2MVpGR1NKclR3QUpWVytxa2hDeEdVUURhS1BHL1k1anNNZ3VBS013?=
 =?utf-8?B?cW42REdPZzAwRnk4NXZGcnBDdlJhSUlLL0x1MlJVVFJIY05hV3B5OStweEQ5?=
 =?utf-8?B?V2RjcGJ2Kzdva3dsMHJDUkIzRzQ3SUpJTTUzeXN6NHdMamZJNU1adFUwVFNK?=
 =?utf-8?B?VGFmcUora0ZoRWthUHdraGREakxXZ3BhMnFGanpRL21HVWI2R2xTVi85bkNQ?=
 =?utf-8?B?RVFJdm1QUWVCdlVBaHFINi92WUcwUnd6aW5UcXpYK2h3Z040MXhJLzliOEVz?=
 =?utf-8?B?WU1NSFZ3aXBiRmxGb3dGRUkxVEFlV0o1Rm1MOWFhaVh0ejBKK01YMzBlc0RF?=
 =?utf-8?B?OXFKa1EvTmNtWG0rRUs3eGNmN3BUbDByVGdrNm9rT2tVVk9MOFlpcTQvVU5P?=
 =?utf-8?B?TzFCZzdTSXFtQnBqTXphcDY1UU55eTN6dXBCY3RPNGZRNUxZTDBQbEQrNVVR?=
 =?utf-8?B?R0RBYjN3ZGJVWW9ONVArTGJMb1AreHBEZ1FlSy9VOHR1RmZaRG1OTmErU005?=
 =?utf-8?B?SEhNMVBmLzVqdXBpcC9yaEpEK1BWYzYrRkZjM2Z0VHVrT0JIYjU5M3ZzK3I5?=
 =?utf-8?B?NUdDa2F4b0dYNFhjTkVUL0xndGw0K0txY2pIMnNoa3BBODBkVDExVTVkK2Jo?=
 =?utf-8?Q?qxBR5dqC8FG8Ko2WA7OoSE00fAZwob1y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anlIUE1ZTlA5T0lDSmJGZkhYNW5WaTBxaGxxVnI5TFB6U0tqVXl0a09qbjI1?=
 =?utf-8?B?WmRneFd1QTBER2d4K0RkTTdlTTBzSURwaTQwSTRYOWFlUlpCclcwNHhoMklH?=
 =?utf-8?B?anRmWWlxSjlFZXRBQzF1Sk1QeHRzSmQzVmVqWnFnbDd0cy9OdkRPbFdoMmY4?=
 =?utf-8?B?YWZXK2lKdjE3WTdzRVhVd0Fyd0pjZlBad3VDMFpYWEZPVk1pekNSdmU3QjNC?=
 =?utf-8?B?MXJVMC93WXlNUlFkemdyUWdkVmVkZERhQk1ZZlB6MjRwVG5VMFE4c05BR1RU?=
 =?utf-8?B?RzlKL3grVWlBMm5hYXIxVld4TXpRL3Z0Q1FJR3pHTzRnNlp5dncxaHFvb0Vr?=
 =?utf-8?B?alZyaHIrenY2aEN1WDUzbDNSRW91akttYUdHZGoraFJwUURCd0FoSUlvVkk5?=
 =?utf-8?B?MXhRQkRKRExqQzB5dFk4OWF6LzdIQ3c5dzBGUHhKYzhNZzl6VkVUMkZVOHlQ?=
 =?utf-8?B?NjNNZGVHb1p5K2RmWENwOXlVdzBJcURLVnIyd0h0UDdKMFQ1UXhaMGlITERh?=
 =?utf-8?B?TXR2czBmVkcyRVZuT2QwR21WUnJzZXkxdzc0UkRBa3dIaFlraEplVFJpbkxL?=
 =?utf-8?B?YUpXd0FtbndZYlpLbkRsRTV6QmdZNitNbEtmSUtvdHhJMDRRZ09XOTZqcVRi?=
 =?utf-8?B?eUJuYkxZU2p4RnF1MUxCaHEwRkQ2S1BXRGVOaWxST3VNQUhVZ0ZHOExkSVhE?=
 =?utf-8?B?Nlo0b2RsME0zR2lENnRFdlc5aW52SDhmQ3gxMXJaQy9ackd6UWlvbDNzRmZL?=
 =?utf-8?B?dm8xVzIvTEhtemQ3bGhLaGtGYm85V0FicGREclRoQ0cyK05WRm9MQmxpUGRy?=
 =?utf-8?B?b1Z3Y2NKd2o4YWpCK3p4WWFscDA3UzM2bnAzT2xsWUNyMzlKbzYwTVBJZXp0?=
 =?utf-8?B?MGgwZjJ4WG1NU0ZsRVhIUGJXSzhHU2RPY0lpTWsvSU1rQy9QVkFZNUFHTXdm?=
 =?utf-8?B?dmFyUHJqdE1HSGFKTi92MEhtMnZwOFVtV3V3YjRuS1dtMnRhd3NEczhJaEg3?=
 =?utf-8?B?aFlRVHFlZFNpVHZabEhRSW4rK2F0QlV1Z3E1RHNRMGZ6ZEp5UlpNUk9lcU1G?=
 =?utf-8?B?VkN1dHlxSmtoMll4MkU4QlJaM1FBYzhaZDUzd0RuQnc3OUVsYTNsS3FsZXNa?=
 =?utf-8?B?Y3Nzd2cvdDhqQnZrZUZMSG42bzhqaHk4cU5Bd0NwQjJ2T0dLOXcvWFlVRmVk?=
 =?utf-8?B?Y0dXdi9tdVBzZHUwb0txRE03eDlkaFJuQjJoZTZYcWcvZVFHOVBqZXhlMzkw?=
 =?utf-8?B?VXBUdDBHSVlndmxYM2xOSnlEeFgrSzk4SGdyL0ZQbDdWbFBJL3NRWHV3M01h?=
 =?utf-8?B?NTNGTkJRSGNzZ3VCWEdRVzNsS3A1OFU4Z0g0S2h5UlhBWkFRaE52cXRyTExU?=
 =?utf-8?B?RDVvT3RuVE9KdjRMTndRVjRMWms1ODZwMVVRZFg4YWg2eVNFOHpnTXRVMEh2?=
 =?utf-8?B?dUpTSEhiYndrMnRacksrR0Z1VHpEMDRtMUg4TW0rTFhSMkNHQkhROFdVeWhT?=
 =?utf-8?B?UE1jOFJ2ZFY0YlYwQ1VvbjZuNEk3RnNqSzFXMDZGWVpkWG5tS2ZiYnM3a25Y?=
 =?utf-8?B?WVRrM0JXaWVFRUxvemtYL2hQU1ZLZXppNHFmQ3U2UXlBYmxZU2JjbzZYcTZW?=
 =?utf-8?B?TnA0RDVLMjM4MHcveUpEUjB4WGJIemQ1OUl2Mk9UOW1QN3ZjNDJQSnJiZXJG?=
 =?utf-8?B?MmxMaS9zYmVkdjBNeW1GNzVVaTRzRWFEeDNqSXZVMmQ2d1N0dE40a1dyTUdq?=
 =?utf-8?B?ZWNrMDBnSkIxVE9nVGI4bGNhcVcwYTJJeno4UER5dTlqdHdBSXpGcEZZeFpQ?=
 =?utf-8?B?bnV4QW43dDlxcHdOUmVoOGFGcG1kSUZEd1FRbER0N3Z1WXR0dTRiSFpEZFhF?=
 =?utf-8?B?ZXlMSDBkelhqZGVRQ1FUVDc0NktYZlBiUzFpUENQTEMvcStFb1YwbTZVek9B?=
 =?utf-8?B?eWJrQ3Y4ZU5nTXdOcC9kc3Fad3AyZ2dJaUs5V2hQNTFSbHBBbjl2L3E4cXZS?=
 =?utf-8?B?bk9NbkNNdGNNMWk0blBDdzdhWVRhbDVBVHNtS205Z3pnbzlMUmhHRitFbk80?=
 =?utf-8?B?dWQydUQ1SmtlcTR1aFlzWnNJaEJpbnVlSEFkZlBlb2VLcnd6K3ZJeFk0S0lO?=
 =?utf-8?B?bzNaV2ZZZ294UlFHaWtNcUMxUGM4UnVWNGVCZm5iSXNXUDMxVjAxSk5xTjhv?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d186f72-3d02-48a1-cfaa-08de102e0aa6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:11:46.9491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sa8hEKC/VTLx6V78+CuzTocM2JJbJXRkez0r5oDFNJRk2lApzvzhPAPXVimcuOQPyakwuLAeRJXkAZwkkW7aiooYyAbUcpFllBcICByi+tQ=
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
