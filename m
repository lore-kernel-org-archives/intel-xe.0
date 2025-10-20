Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5B1CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8257710E53B;
	Mon, 20 Oct 2025 23:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG0BAvT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4649510E53B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761003408; x=1792539408;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rlheDF1UmnLJ2xVTp8liTLdHhz3VOc0Uhk+CQo4hAUw=;
 b=ZG0BAvT3+HvOhFRMuV8GFxJ537fCfGEbR2oiAUhlVAckjiKjLwMV2wAQ
 c3flhUtNoU9V9mxBl+xST6xr54LHNz5D2iEqtgWPjWF+EX72tWLU3ZPGg
 6XrqEPpoOvsOjL0kQ0aizVR4I8a5jr4entYehWR3zJjqzddepqvpqBbMQ
 qhcic3i/5wN7qQuz9CG6Q86mYgLXrO8WYT+5YkF/YGvf2zgjEkyh9mnX1
 vs/sUg1QmJ5HdhJe6Z0+QimzUcmKAAHMm2eD3iUO7Ym/xnrRxfgwwAGwm
 atIt/7LsgMqFBsEppAEpXDwxP7WI3wAx9UcSuEzR7vUK8K9wTT/elGLPy A==;
X-CSE-ConnectionGUID: MExsANv5R0Ol2ZbyXDwMVA==
X-CSE-MsgGUID: y+qEnPj9QeOgqu7BBXmXMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65742458"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="65742458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:36:48 -0700
X-CSE-ConnectionGUID: zzXisIMxR1SsFYKmYOUVTw==
X-CSE-MsgGUID: SHA/tMtTSfO299uXKdw5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="188733043"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:36:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:36:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:36:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFiB6SflzwO5pZp+M0jwD9L8Y0D1+kAz0oMA9P9/XCDEyfDPHsyv0gCLjJwmyLoJVwUc1SieeD5fRF1H3HGO3P+128o8RHeXipvAYWl4Iap96NKNOJpdYlXzhHxYzEfRoN/+6Qd3CfQLKkP/RQUUsRPl424QbxLeC3YFbQ5RhHVme1bJnOg6eDzTXU5f6QzeHripXIBqa2m+wB5nr3fm+SdDuy/mImE5LfKviRteLDmWeleRCj2B2Gr24PDW9yT2/zKw799NYcdrrn7ZLpz4FilSEnWJU2iulxR77UNgeQUHi4dPIVxoxeUXVgjTPoxI6sFhbdFR3pPa4d7UIqXWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDPm3zCjZFNG/rFbPj+mLLtYW5Fwq3m7kbjXOPjvAHw=;
 b=tLnrsIRiS/6qPocVGErK+/dp7MWd65fnPmRSkix+gAv7IHALqmllb3/zfaekPd+bVcdFkSto/6IBbQ545tdPT3xmt9Ofy5cZ1/vmIMKGwlqApfDj9Hgt8jJEdQ1lsWC1nT0JvGtmsO9+8jN6HBcJhia1T/fR0Bvm7u/jsabWOm6DOPgpbWkmj/uiFmbJp/SzMXzsLU9Z4IQT5rMqx/xQmpwO+sHWGakKu1RxXXNpfWfBpgOOmokQBAQ0+/P8lqkMRBBe/ykMgtWv58jQj8HKtb9+RkI5w8YI8D7/lebGuaej3Ri//fWT4SjeeYGfhaCs+K6eBwIWox25CMEu8O3ToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:36:45 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 23:36:45 +0000
Message-ID: <e8600255-18b2-4a5f-b5c8-b55539815345@intel.com>
Date: Mon, 20 Oct 2025 16:36:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-5-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250828174159.1232994-5-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:303:6b::16) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: e536652a-92a8-4a22-a82a-08de103187c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVduaCtKQXYyK2c5MjJqbHROUGV5M1Y1bE9rTVlXemdiTmlidTlRSC8yVWQw?=
 =?utf-8?B?c3QwS01mYUZvNGhKdFFiL2U5cTcvTHBFS05nK1VwNjBWRnl1azRyRG1nMWZl?=
 =?utf-8?B?Y2l1Sy95NWxSVWJnYm1WeEtzOTBhNEp6OXFLTWNBelo4cUVUOUhncHBRVllt?=
 =?utf-8?B?UThpVWZFbzRpQ09Dbktxbkt3VkxsYWJqMW9UUTY4YmRxbnBDN09xZzZDUkRC?=
 =?utf-8?B?QW1EK01GbE5tK2t1ajNoRGZtdXNYd25DWTNRRytHVDc2MlFUTmhRRG52aC96?=
 =?utf-8?B?N1ltNFlhN3E3MzFZTlhyZDVJL1RuWVVmWDB3UjlNRGFlZzN3bXJmUFluVHZ5?=
 =?utf-8?B?KzdsdkdEajBONWwwQlQ0Y1dhaWZ3RGltN05jMUVxclFwbm5LVUhGLzZEQjZG?=
 =?utf-8?B?NWVMOFJscmgrbE1CL201RW1XV2YwL3l1ZUx3bG9KVEplNHpSMFhSZmZiakx5?=
 =?utf-8?B?NWZYQ2NaUVY5RVNWTXpJcDVRblZyZXpDenF5Z3JHUGNYRk51NzlZaGl0cXVs?=
 =?utf-8?B?UUZPUTlsLzZTa1FBL1BEb3d5ekJpQjNZamxsNzVMb012U0t6NlRXT1VoMC8y?=
 =?utf-8?B?Z0Nma3NSbFpRb1Yrd2JmMjRJMlZLRFdENU5TQkxtWDhqaHZwdy9WUlpWMnNN?=
 =?utf-8?B?V1ViTVNkbnloR0hRaURlcVdVSmwxODN6S1FhbWZpaDhtUjh5SkthcE8zd09y?=
 =?utf-8?B?UGFOQTE4Vms4c2VtSm5FZ1RGNjNYNnNkcG9xZ09KVjh5dkhURmZvRXZXUkJJ?=
 =?utf-8?B?ZkUzZ1JOcERPV09JcG5RQ3NUUGN5Qk1vakNwVjNwRVFLRVNxdGJjelpzZ3Z5?=
 =?utf-8?B?NjdiVmFjSFhiRnYzRkVVYTFxUXNrdE9CUHAwWWU2a2M2dHBsZmRwbUFWdVZv?=
 =?utf-8?B?cENWOWxxdWlDeHFacTlNcjREempXS1VtZnAzMHE4ZUhINVV4OWg1SGpkdDZ0?=
 =?utf-8?B?LzhiZGdPNGFaRGd0YnBxclhXcVMzOFQ2Zlp0VnBNSEExZzd2UVJwYm0xbHps?=
 =?utf-8?B?aEt1REZqK1FQb1BBWUtPWm9saVNzZHQ2VEFWaHR4U2JCT21FQUdrRExOUXQ0?=
 =?utf-8?B?djVlVVNjNVpsWi9QV2V1eWM2VVZTWFVOOS9Rc210c1QreWpsUFc4UHE1cDJE?=
 =?utf-8?B?a0o1bUpuWU81ZURPWkhDQjdSb1BhU3BTcGFhcGd2eWhrL3JvZjc4TnI1MkpQ?=
 =?utf-8?B?TVEvc1BqYW5xZENMR1p0aitmek9yVC9ZNDNnNDIzdmw1aEJpTStidmdGMllo?=
 =?utf-8?B?ZERJT0RhMHY2cTRFNUxLMVNwcy9oek1uU2RxQlpxam9FM1pyZWQybG44YlRJ?=
 =?utf-8?B?aEVrVjYzcVBFeUp5UU8xa1RzQ2FETkhBbVBUZnlFYlZhTnErSDRGZlBBd1gw?=
 =?utf-8?B?VThVYVJ0NDZQRUJiWkcrUVBLSjA2ZGl0UWxwSzAzOUkwU3Bua3VvTWRSTE1D?=
 =?utf-8?B?WGN1SkV2WnRLbHh1a3NVNWs1SzVrM0R4ekd1Z0xtR252b1dxQzhKVElRdUZH?=
 =?utf-8?B?OFdOd1I5T2hzRHlvVGdEU2I2Um1LQTBjT3UwdHVMejNqaVlSYTVvUFIwZ0JM?=
 =?utf-8?B?bHRoenIrbnE4VHRzcVc2YlpmSWtwS013eVBlWnNmbS9ScTFqRG1KVUFadDhv?=
 =?utf-8?B?aGg1WERaRGM4c09uTUVBSzhOdWkweXVuRFNrTW5NaG9iVTVFWGg1ajh4QzR0?=
 =?utf-8?B?cE1JYS9Pb2h5M3JRTnRVaVFTYzcvdmw3RFUvREdESzNWVTgzcHdBSGhXZlU5?=
 =?utf-8?B?ODdtLzVjVDd6NnZnTElnYjV3TG9qVTRPYTR5QzltakxnWWp0NzFWMm1tazJ4?=
 =?utf-8?B?OFZBZ2U4ck0zMDNzOGs4ZEZxTHlubGw0OXdCN2dtYVFzZnJQMndjRFRnZk5n?=
 =?utf-8?B?anJXWllvUnc3bVlvdXpyOTdlL2lrQ3QrK1lmOWFVdVZZUmZ0b1oyNzMvdzRl?=
 =?utf-8?Q?dCZaQjubl18xLK0pdxRbD59liJhmKjPU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG9YTjc4YUlZa2ltZzg0ckR2Qkp0VC9XVUwrMG9LcUhVVXBDY0pXeE5TM3p1?=
 =?utf-8?B?OXdacjBDTkxQdVp4T3VKSFFEWHZKbGFPa0JrcUJUTGgxTWRDd3NWN1FoY1VK?=
 =?utf-8?B?TzBFRTc5SHA4bjRzL0NDZ1Vhckk2STR4RW5CbURQUkFHSm0vTElqVGpLVEc1?=
 =?utf-8?B?bDFCaEhqMFY2TmxrOEVBdEk4a0hZTEtRSjJWL2xsK0gyb0NCMm5oSEdIc3Bw?=
 =?utf-8?B?SkV4K1NvcEd6Nm9PWmZ4dEpIWDFBcXhFbWxteWt6bDZDbjVJTEp4U0dFRnhu?=
 =?utf-8?B?Yk05T3VLQ29aVXJ3YW1XU1dvZjZGbEdIYXZFVW9Udzh4bDFPZnh1WkJRYnRk?=
 =?utf-8?B?WEEwemYyWXpLNVpyUUNuaWg2UkNWc0RuRjFjLzBLb056ZFN4ZUJmNStMWEVo?=
 =?utf-8?B?QmpVVGJERlNOM3UxOW0vaE9HWGI2Nk4xNFU4bitSdENrZlNPVU9oY3FoSW9K?=
 =?utf-8?B?MmNqRHVrTzVHdW8vREZ1cml2c2xTVnhYZy8xU1FMaWo2U3pPOGxYWXliTHBN?=
 =?utf-8?B?d210ZEhhZ2w0SmExV2RMcFBVSUk3VzhtNFpPWGtVRXRPZjdPeDJTRXRkK3Iw?=
 =?utf-8?B?YThGb2dNY3QvMjBKakRPcm5RbklTMGdnL3VOSWkra2w2N2lrU1RoZ2tvbUlz?=
 =?utf-8?B?WWNwR25QZ25JMUhUSEFpeVdlZWxnR1JnNVd2TmkxZWs0MGEvMlBROVY4anVs?=
 =?utf-8?B?QW4reno2Vk5KYWtUL0FhWGdTNi9PRkRSd3dWaHRQNVYra3JqcGJCclZENUVM?=
 =?utf-8?B?TFM4WWxMdGFObDRmTCtOaHcrUUxsR2Ywdm9Edlk3STMyeWxVMDlPYktCZ1JJ?=
 =?utf-8?B?U2o2QXVtQW9vN2ZSKzFyK1N2bDd2UktHd0ZPY21IUmx0Y0xJUm43akZydmp6?=
 =?utf-8?B?L3ArMStuV2V2ZGNCTFVTV1JZRmJ0OEp3eklDbm16Rml2YzZ5RHZoaXRsVURn?=
 =?utf-8?B?dG11dFBGU2pMby92RzBFZEN1Zkd2Z2lHWmpwQ2JZeDZqcWNHOGFzaVBYd3V6?=
 =?utf-8?B?ZStHTFBNNndkaVZHell3akJSRFpCdGZYS0loajJiN0dHZ2g1Q1B3UGw2QnpF?=
 =?utf-8?B?aG56dDNHMUYwVEJoNWh0dGhIRm5QcE5TdDl4UWo5TzFyRlY0d0hDK2VkMjJW?=
 =?utf-8?B?RDZ5amFPVHFRRnR6MW1tNnpLaTVCSzNwdk9SSGdrbm11dTlLTGlvS1F5ZTVQ?=
 =?utf-8?B?SkpMUk1NNlZlaXdOUVRub2NVaC9WSTNBeHZRMm1kdlV5K1VMNm5IdmNIUWJN?=
 =?utf-8?B?WGZSRVdrcHJ6TFFGT1VFTnBYaCsreVJWL2R2blFNa3ZWNjk0c3Z5MHNyY1hW?=
 =?utf-8?B?RCtrYnlOTDJWWXdWTXlSVjZQbTBHMEVTVXgzMEdsNzRTd3lNVDZqdGJheHR0?=
 =?utf-8?B?aWQrU1dETk9WaWtBZkxpZld4NVJ6cjVxdm1VUHRscE0wMjF6aENIL1ZiUUhv?=
 =?utf-8?B?YWIwU1AvSW9RcVVHVDFlcWFLMGpFNzIzUlVEdk9JV0loQUtHc3NTeGFKcmpo?=
 =?utf-8?B?U3NvcXlsc0g2ZklLNjc3eFllR0dzaXB2c0tQMTU4TXNYc0JnOHNNaHBQMlVV?=
 =?utf-8?B?WG5iV0g4QitOa3dHTjlxZkZaZFBJOENId3duUnRkT1Nwcy9KdGdWbVJ5aGxC?=
 =?utf-8?B?Y0h5bkpGTmNmZk5BR1EralpQWk1lc1NMaGt5Q3BrNmR0RERCSlFkWXIrdGpC?=
 =?utf-8?B?MGh4RGVwMm83ZmZJaGFxZzAyUHZsOFMvSWROYTVwV0lWZFV5cjFKalMrQ2ln?=
 =?utf-8?B?MWU3RjMwb1htWVIxMDNYc05SbHJPZXVmR3c1TjJ4MGRvWHdKWE9kdUtpT0Fn?=
 =?utf-8?B?WFEzVm93dktHem8reFBwUDc0NUFPQm5NeVB1a1JwS3JxeEFBNitDVGJUODlT?=
 =?utf-8?B?bVlnbmhOYTlTTGI2cWxZNFRKMXF3MEh2UlZ5N3VKd0QxUEdkSDlGdTIwdGZ0?=
 =?utf-8?B?WXpaZVlpYzBKd2ZFSG5leTlpWWJjVUsrZnQ3aW9LbjEvdWJBemhIeG1Kc0ox?=
 =?utf-8?B?ZVowYWVyZlBEYllUVzlIQUZkRWlaNjNCNjQrdENxejV5S3RYeGs5aTVUQjRv?=
 =?utf-8?B?QnhRNlhBYnhLdVdxZVErYU9vaHZJZFYwS3JrcjNVYVpGN2tBU014dmt0TDZ3?=
 =?utf-8?B?ZGlWdndIYnY5K0xEWEhpVHRvTWR0ZHlXTEpXa2dveEJuTGFvQVVlQnhocXkv?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e536652a-92a8-4a22-a82a-08de103187c6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:36:45.2863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuLTopcdXAekOhC9E6EcRjlb8AKqDmq8D4wp5cXlvkP6qIHkAIjuijvVOudVUZCmevfdK6HhLpWT0mF2tPxgWgBWOf42lMHlsTPk8ExQq5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
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


> +static void
> +xe_guc_log_print_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			u32 from, u32 to)
> +{
> +	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
> +	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
> +	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
> +	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
> +	int pos = from;
> +
> +	do {
> +		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : chunk_to) - chunk_from;
This check looks incorrect. Should be >= in comparison for last case to use the
chunk_to.

>  	/* Output LFD stream */
>  	xe_guc_log_load_lic(snapshot->copy[0], &config);
> -	xe_guc_log_output_lfd_init(p, snapshot, &config);
> +	size = xe_guc_log_output_lfd_init(p, snapshot, &config);
> +	if (size < 0)
> +		return;
This should check for only equal to zero since the size is accumulated?


