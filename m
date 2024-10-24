Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA00ED0BB4A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 02:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A78E10E249;
	Thu, 24 Oct 2024 02:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goV6W8QQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4113110E249
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 02:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729735562; x=1761271562;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3qKU6Kn0gJm9p5pVv36PYc306n/UMrYhaYHhET3LXfA=;
 b=goV6W8QQfEPYf+B6wlAxvQJ4EpzMY3C3g3UDfE8RiVmEHj52t0khblep
 mpj82WCsBVdRczqdaBvyQSvjKtbd+IUcmA0H836y7gi/wZvftoNk0iFB0
 OUTZ4FwOB52n4CiPJi7Qo7uGwOMSyF+8HLhaM9F/xaufJXpH7S6qxhn6r
 0Biwd4p0TVyw4XVkT0LhzGwmyeqgCN60d9+kxd1gCsCAFcVk9TA0CObs6
 gzCLY/c8H/M5qXsUFXcRa1ADY32uinun7jC8gF/gxF1GO6CMj//vb78aV
 ZFGd38GBXKcQb1WpBGSUWn3ywmc0RAjbhu1TfhMnIBcgJe0SgIcv6WdLC g==;
X-CSE-ConnectionGUID: 2PHJ7kMLTT6KAXNUhJshWA==
X-CSE-MsgGUID: nT4cBsm/TqORYC1h+gOb/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33038732"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33038732"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 19:06:02 -0700
X-CSE-ConnectionGUID: MSBcoox2QAKzwtJ+ZVHkng==
X-CSE-MsgGUID: AcFYqOM0SDC8vWdIssflnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="81275884"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 19:06:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 19:06:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 19:06:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 19:06:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVH69tW/4WqvTUHdHhJ45YZu8zUD+eqY3Y1UjmOACCIVYbx33LL4g3ipBkozlWHuL2pg6s7xfxan3n8CLjgTz+nmuGh3nbs675RCFaoyodmTwAe14wpqCNf1NxBe1nZNgYXzp33mCptAbj+vEyclTCjSL4NoU+GceqCesog10KnV4MB7UaohNm2WvZ4dd8kz90Vvn5rHjalJ9mBoiE86H1SrZtU4wZxsxDy6S3sawvNLNrnPfhj9PwLmIYV1cozC3o5uvVu8zcRXCk2SlIdiDckUYmu0RZNzX5UwGkohny51GruWDBv1cHI2ar8i3gdnh2q+mL1lq3hsqkjoAQVGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WzgSCJz/gr5RiD9to+K9H7es1fETNi7/X5dWwjRAjU=;
 b=XMTvav8+9n2p+jk7LwgpbCoD5Hl83XTO3o2lai0FYlRYxY/G2UzbSTERl8WEjhH4RXDL9rsmpbGHKyTSHNF7zMqyzRD5xJTUNEpR9OPsga28xRk2LDbNAICqJ1whQ9wXoZoZS+nwxJlRpkIzU4lzvdi2pkiS0aPP5mhj6HIeHcjIUqRtBRFiyUhuroDZHmuHj4MBSNhS0Qeb0myoyg6uNXNyy2yMBekDg9CefyVG/qmh4DUfWLf11ycrX37uF6x3bH/ADy8t8mOX8AzR2iY4qS5VdUs1U7XNrJTndMBPZzVT7VYcH1xSWQDjY7YhAx7gZwawmjuJ8Tgp0lfXDfMWkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 02:05:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 02:05:58 +0000
Message-ID: <8f955251-db47-4b21-82a3-979a353eb6ae@intel.com>
Date: Thu, 24 Oct 2024 07:35:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, John Harrison <John.C.Harrison@Intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241023155817.3618388-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bfc2cc-3f3d-4a3c-be85-08dcf3d066da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUk0d21HeVhRVFBmSnl6QXdWT0hLekFTRVRqWVV5KzdQZmVMeVo2T0JUb0du?=
 =?utf-8?B?UGpSaXpjY2FFbTBhZU82b011UVh2VnNhUlNYUUlEZVd5VmF3YjM0d1EyTVRt?=
 =?utf-8?B?WURzTjFEYjFSOTJ1akpJV2cvUE8weTBkbHRTK2plcWhFKzJDMHRZOE5qRW9P?=
 =?utf-8?B?L3R2NzVnalc0WnlNTFlaV3JQM3ZiR3BINVV3aVlIakV4U0d4dDBTZ2lIRHZN?=
 =?utf-8?B?VStzZ2tYVXdNb2FwbklraHVVNDJVeTFXYUFZb1Uzd0x2ajVacWxITHB4dzg1?=
 =?utf-8?B?RExZTk1RMk1mSEtheEpxZm9NdDhWSzhmTzZheDFjT1VRNUZEMEYrSDZlZ2Fu?=
 =?utf-8?B?MFdKWFpzNEV1YWhKK3RoSGFvbVlBYUw0YVlvYjJEZklrQ1l1NkRuRDEvbjkr?=
 =?utf-8?B?V3JBSmM5WXVraDN0YVcySzhWc0czMnovZWZlQVRYWTBPN2wzNHNmWlVCbjhG?=
 =?utf-8?B?cDVwbEJLMmFhbjFYaTNiWDg3UWlhaUI5dFk4M08rRWtWNXBPNG5yQU91SW5V?=
 =?utf-8?B?elVhTGpETGg1Q2Zid1oxbjhnUVcxb0E2WmdXYmk3QWIxdHRnYWc2RHhQSy95?=
 =?utf-8?B?Mm1CR0JtbTlaQ3NIZWF6WlRYa2FlTnU5b1Q3QzNFU3luRTJyZ2FybklSUndp?=
 =?utf-8?B?UVdkaEowdHl3a1hHdTBRQXBxWTJVQmU3blJ1VUJLM1hQWFhyREJROUEvMUcz?=
 =?utf-8?B?VjFrUGhyNGF2ZmtlbC9Hc1Y3M2lIVy9xZUZZSFNIMXNsSkw2VzNaY3NCRlVm?=
 =?utf-8?B?R2VTaEFNUzl6QVo1SmVsKzlTUnprY2NsQnZkTk1pMWh2dTlNOXpZR1ZBMERL?=
 =?utf-8?B?OEtyaHhEUzdHcmpwU01QcmE4cEp6Y0pmVXpiQnJ4cm44RnFvSXJna1ZWZERk?=
 =?utf-8?B?a1IzbHZOSytlTEI1L3EydDhXUjZoenJyYVNNRFZDSmMvUWw1ZlFFT2hnajhp?=
 =?utf-8?B?cmg2L056OEs0K01KVE05ZkRBQllOc0J2aUVxOHd2SXJXcy91aVNqWkJKd2pv?=
 =?utf-8?B?bHVObWMrWjNkanJiQzBpKytOOVdDbDByYVppMlJUbmJ2c0x5UlBrd3AvUURq?=
 =?utf-8?B?WExiQ1VYTjB5SHJSeGRqVnhXN2hSQVVEYUN1N3d4R3lKcmZnMThzUkVXVnpF?=
 =?utf-8?B?NlE0Qnk1cTNnWWNFdVgwU2lHK1gwUndpWnhUU2F3aXRBbWRaYU9qT1c3RWlk?=
 =?utf-8?B?MDJrUk9zb2dqczA5UW15RjJpTlJKUUJYRzg1MlFndXdmR0lEdmRadnNmaGp3?=
 =?utf-8?B?ekxJb2dkN0dERVV5MzhIdnRlODI5dGtMMEI1TmlsbFVtYjZEV0pSR05Td2Js?=
 =?utf-8?B?K29Da2lvZUxiOUNVZ3JBVlV2clRJOFdPZFN0ejJUT3ZYenJhTW04dWNtNi9B?=
 =?utf-8?B?Zjc0eFhQdFo0cGtNZWI5TmU1NHdkUStaTDhsVHlybFdVSENjNVF0RFJacHdI?=
 =?utf-8?B?TjNmSzRqVDhJOUs4ejVNc0FPSi9ES2xtcXZVYi8rK1E3VlFWYzRGT1A5Z1dS?=
 =?utf-8?B?VE84SlZ4UEN4dHh6Y0tGWlZ3aXk0NTljVkVIQTNvWXEyclRSODlmWXk4akhR?=
 =?utf-8?B?eWdkckpqMXRGcStUM1lEc2hINHh3M0hIemlEa1VrdWQ0YTJsb2lTVC9NOTFm?=
 =?utf-8?B?R0xLU1pNVlcvelA0T203amQ5OXFGZURWZmhGc09IeVF0WnY3RHZWeFBxQndN?=
 =?utf-8?Q?ZoXNOUGyG8VbrbUT47zD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9xaDIyVk1PdFJGRkptN2dsL1pVQkwvTjFqMUd3VmljWEZDRVFEMllWU0cx?=
 =?utf-8?B?cDh2Tm9wNitnbk5xSjJFMkxJdHM4SzlxTWJxR0dMMEVvckNxRVZMZzBNUWY0?=
 =?utf-8?B?MEJmWjBZTWRWK3ZXVUhzN3ppOUswQ3F2Vno2VGUrZlMyV0J4MWM2dlZSeTZ4?=
 =?utf-8?B?c1NqUnF4ZTlDTjdrZzY3WXRwQmlmM25CTXVUUUFIT3FudmpORHZ6R1ErdUdj?=
 =?utf-8?B?REt6NzV6WWZaa3Q4a2lNb3ZwK2x1N3FCaFRma2FzWlg5MnJ3ZmM5MC9DcDBM?=
 =?utf-8?B?TDNxb2dGL1hZVitGUXRnQzczNFF0YjBEcEM3Sm1vWUNna2Y1YUhnUTlHNUEz?=
 =?utf-8?B?a3o5TXErR2VMVnVqOUhnMW01cEJKWnZpY251ZS9nOHcyRmdEclkveFp6bGw1?=
 =?utf-8?B?bFBnMUpZeWdKb1RXTzdoOVlNdm5mTTZ6ZnBuYlUwNWJoLzZ1YjAzVVlES0Fp?=
 =?utf-8?B?Q2pLNzBCNW44S0EyaWViOTdZMWw4QUt1Uit5RjRxUEMxZlJDZzdvR3htZDk1?=
 =?utf-8?B?WFBiTm9OUWlFUEhhVndwY01iNmc0Sm9jeVoxZ3h4R0ZUWDEyaE9HZGh2Vm1Z?=
 =?utf-8?B?NTdsaEgySlRDZnFIN0F0SmovVWVHeUxxUlQzMzF1KzNyckdrOEQvRXNSa3c0?=
 =?utf-8?B?c0I1eDh5UmVza1hiNWVxVlRnV2ZEci9hMEdvSmRwRi9lTkc2N1VHTkJmNWNk?=
 =?utf-8?B?SDk1c1ovYUdLS3lCNmRDQThzTDZXOW5hdlEwYSt4WWgrQjAvVDgxZ1VWTUcv?=
 =?utf-8?B?VUFjb3Z0MlIrWUtQTENmQWN0d3RVMG9IeUk4VmoweGJrWnJQSW4xWTg4M096?=
 =?utf-8?B?aTRhUXR3ajBpb0dxbGVDQnJLcWYyRlhEaDFUL3lCejFsd29UVlhWMXkwa0dH?=
 =?utf-8?B?SHlFclpOTHpGM1hBS2ZzOFBPRzJMYnlDQ1dyWmlDaERVS2U0UDNFbXc0ckI1?=
 =?utf-8?B?Z2JEdWpVM3YzV0xHUnRHeUF1UTR1VTlHNFRJSVBBRXEycjZGVzMzWGFqdERP?=
 =?utf-8?B?YWRhWFhlQUVHc3dzRzF5MldDYmhaU01tU0xGOTM4RHZBaFArSm90WjdyZ0lh?=
 =?utf-8?B?cWlISzQ2b040ZXlvUGZURU51Mk9MS09KdFRIKzk3Y1M1SHZ5bUZYWWxwaS9E?=
 =?utf-8?B?S2RPVnhPSXMvY1lyY2pCNXpMd2JXOU91cXRLcmRWeUdxaDZiNVlITHNNOUpL?=
 =?utf-8?B?aW5VemhtME1NTzJYT3NhZXQ4VXBqVU9Bdml4ZnZ4UiswTHF4N1Z0ei9LOFhN?=
 =?utf-8?B?Um0reXRWcitXaWxHamtoU0RDbjJSdHZJRzN6NnJ2TnR3NUpPb2xoUHhHWnZh?=
 =?utf-8?B?NFgwbTNTQ2Y1L1pFRlV2MDFOZ0F0TG45cnZTN2VicU53VkMwR1pmbDJMUldh?=
 =?utf-8?B?cHBvYnA5VmVvRWwyZDBhdnFXMVVVeElXN0h2Z2d4ZFZvSHRWWEdjMUtzNVFy?=
 =?utf-8?B?bWpyaVFUTDU5WmFEck95eHQ2a1dwblZLcExFcEtZbEVLc0hJU0xwTU1qQTRq?=
 =?utf-8?B?ejRBV2xsWHVFUHh0dTNVbDJVMlJmVzFQdFRXQnFUaVpWbDJ6V08rVmswbG1z?=
 =?utf-8?B?ZHVjMEQ0VUpCSkZGRXFKM1dpeXoxOE1Gc3IyLy9qdVRmczVOcjFuTHgvd0ow?=
 =?utf-8?B?UGxxSEhiNlNGeU95QkFXV3A1Nk1neEZxZ0pacmlWU3hvZnQ4eTJReFhWWDM2?=
 =?utf-8?B?SkJ4N3laYmdMTWZhOGZySEh6N0tGRE91dmhhcnpJZTBORWFjL1RzUWY2RW9w?=
 =?utf-8?B?V2RWNHlscWNZSnluSkhRV2t2ZUFCOWl1NWIwRCtMeVpzSHl1T2w0SDFHaTV5?=
 =?utf-8?B?QkJNQWxOT1U3Nkh5ZDZINnZFTTVya0pZMnlKVHAxeFdQRndwWVRWc2IzblBQ?=
 =?utf-8?B?aU1MRUhhYW9nVFlYd0pBQ1JERW1ibEVMR2xmd0JuQko5SkJOYkpXd2p2SVJa?=
 =?utf-8?B?RVpoUFpyZVUrWDVrbHorUno4NHE5MHViQWlvbTlJRzRidDVFb3htcDhOM09j?=
 =?utf-8?B?MWdDU0hHNzFrMXdxS3E2RzhSRVRubEJNWlhtMVhQbk5JZU85WmNNQzVtOVM3?=
 =?utf-8?B?ZStPM0loSzdVTFhieUtoLzRGbTMzOS9YNnBIb2tERjN2Y2E4Y2tmUkg3RlJ4?=
 =?utf-8?B?WjU3Y01Wa1V2clNldkpRTi95WHlmcjFZRVZpRjdwSjZIRnU2M0VnRjlHc2RT?=
 =?utf-8?Q?k0cq7WRLChnU5T8Xy+JbMds=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bfc2cc-3f3d-4a3c-be85-08dcf3d066da
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:05:58.6963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rbl8yQL5zuXQgi63iVajIwLLtVeslvzUAS66m7IMVDBJKS3fvCtUarPYh+09clWzz5CvLIzZnZOeeO/1GZePPzLg+cuCO+0sasSzNorfX8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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



On 23-10-2024 21:28, Nirmoy Das wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points recent scheduling issue with E-cores.
> 
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754

Same comment as "drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout."

BR
Himal

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f5deb81eba01..7f034871345b 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>   		}
>   
>   		if (!timeout) {
> +			/*
> +			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +			 * in case of g2h response timeout")
> +			 *
> +			 * TODO: Drop this change once workqueue scheduling delay issue is
> +			 * fixed on LNL Hybrid CPU.
> +			 */
> +			__flush_workqueue(xe->ordered_wq);
> +			err = do_compare(addr, args->value, args->mask, args->op);
> +			if (err <= 0)
> +				break;
>   			err = -ETIME;
>   			break;
>   		}

