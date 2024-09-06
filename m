Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B3CE7AA6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 02:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4402010E8BA;
	Fri,  6 Sep 2024 02:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVm+Rkbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EFE10E8BA
 for <Intel-Xe@lists.freedesktop.org>; Fri,  6 Sep 2024 02:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725588121; x=1757124121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s1wfwgMCVAxguxcgu7rFChiXZxwMxFGe4lDT0B+Cthc=;
 b=eVm+RkbkhzCRqonTJNiUh8ZdZ2qfC4LQHGO3scAK3+OtJYUr2hS2Jn4v
 Pey5//VMzIbAJlHaVttpMrR6mi2wIDMuvEH+wg864PX2kHDQ5HJOt+psO
 81IuFhXvgY7wJtCF/HiHzt4ocWYvrnwd/ReyBYdFxm6nFlDHBebVXR8yx
 MOWYPPCvlfM5TenB/gt/yM4Fp75mShtbsYvH3QS1NAUs+mupqnJ/QpOI1
 QjfwULj4UhdVg14lSJLm6P0d6jgPWuodM6nSObkbPHiVIrX3C23quFS4X
 rcm4nHhTcC+/QsIV/tekaRONaD94rte2LAk5eJAUqUJGCg4rpNQQQ7gQQ Q==;
X-CSE-ConnectionGUID: ylecJThmSkWT+dxgZc+Rxw==
X-CSE-MsgGUID: xRCaNgxgQf+nqzciDw2+sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28221094"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="28221094"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 19:01:38 -0700
X-CSE-ConnectionGUID: NAopcjStQlODYT9mMdZo3Q==
X-CSE-MsgGUID: ucUk97DETL6DCLU65hZiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="65520472"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 19:01:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 19:01:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 19:01:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 19:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBnO9p4/EXRwsgky4zr2ZP0LVRoPjRjQfMZQI4/3Hx5MIwgDI6m0wUHVH/cLqriYCsgqW8XK9gaV2sQhVZkmF0SPwAuyCZW8gbaPkcp1JS10FQl0y/qaznezbv+gBW7NuWykwuGHUpc1iJfq0ManHs4V4UbkxZ6NkWayLIsWxyuGFm+Dp+9M6brGgP6tck/nuyFZqRrq4RcQRdA8Q1+bCGBR5LZANebqjmFKSA5OLhqxVvPTbljva6XRSvIIyfolztovsh2m8o9jY6putqhCjM0lde1vHzoT/ziLBDE26HWjhLAEihszqiYYB2IIlXkRV4yDcIX194jHj5JfBQ0kpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbSkX2jvAXId8iMkJAvrLq3br2+M8/2gERcDYojIXfQ=;
 b=mDQTFGHWAhzztlvVDAJQ7acNI/zBehMdWoiD1/BQbVGd9/Nql47MqEBjSHecZvQsBKf0wZ9wKykey6IZBE8NF/PlmIU0DBSLyesPqIe+Q2Jhm+scdQNqV9xySTQPmvc+H+ywCG4I1DepvFSa5xj88/NQNCBYzzfGMwNUoCPMcaB84eI5bv35gNbehkF9R97xjp8mD96mPdrwSzRJnJOdsA+NFu2+YnoXur/xMj7uU29GDCtNB9oiKx9GWQT62p4DOpd9djw7tjjSKurmi0jqjt+CQpURF3WAluTt0NmjNWALfGznB6hJwMQHmaSiNI6xqXoJ0kjoil1FN2xt/MM6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 02:01:35 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 02:01:35 +0000
Message-ID: <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
Date: Thu, 5 Sep 2024 19:01:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc5cce3-dad2-4ad0-5819-08dcce17d66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjJxNy9TeHpudFFMNzFZYytRaFhFMWR2bkVpNHNuZDZuTTYzMTZubEoxbFNN?=
 =?utf-8?B?THBlVzFSME9QQjZTNVorcTNtTU9oWTRZNmhOTytwLzFnYlZpVnVwY2plUmVl?=
 =?utf-8?B?T1FzT2VXN3JKSDFPaW1uRUNXVkpLNXdrYnM0QWFrRk9LWi9lTS9yK0I4OUVE?=
 =?utf-8?B?djd6Ukx6VzkvY3FUUUp6SjRhRHNIMnZHKy91ajdleHdGZTdZS1Vpai8xSG1k?=
 =?utf-8?B?SS9EOTBkdWZ0UERUY05mOC9PV3hEM0Y4bnM0SnkyVHlSSVRvY2JVbWo3SS9H?=
 =?utf-8?B?d3NJd0x0OVNzSWZNdkwyOGFUbTBZTFpmczdVeS9NNSt6b3E1cmVDMWNWbHpx?=
 =?utf-8?B?U2JnSTZ6VEw2d2RCbXdPcjcwWkUrdHB5UWVWM05KT3pnMUdtS3czVEtnelJz?=
 =?utf-8?B?cU1NNnBHWmErRkpLUU9RWnA2Mk5tZHhpTElqZWdXNmpnRS9QeUlwQjZXb3Zs?=
 =?utf-8?B?dVJsUitDSEsxRkRvYWY4aFI0TDNoOFlVc0xOdDhHb203SDErU3V0TE5xVHJu?=
 =?utf-8?B?ZEo1TEpKekEvalh2dGZOSURPUW9zV3hIWTd4S3ZLdUpqMkJIbFV6VWpEY2tW?=
 =?utf-8?B?dXhDei9GeEcvOFoyNVJ4aEt1TjJsKzRxZE9mZlExNnZyVWFneHN0MGI0UlI4?=
 =?utf-8?B?OTlDQ1R4NE1Wd0l2WUtzdkZBbHBGL0hpQ05xK3lhNDdYajVPK1NtRVdram93?=
 =?utf-8?B?d05mYWlDeDM3SjlEQUg4ekl3SkJKWFRHV21PdlJmaTVXRThPd1hLSlB3WmFK?=
 =?utf-8?B?YzZtR0tuYndudGpCNXdRYUJOb3RMVlRkZ2VUWkpqVngyRGRZYUdUNmVJUUNE?=
 =?utf-8?B?MDlvYUMwN1k3NkxQYnA2cGRjbENFS1JTV2dhQzlhVURNenRkVHRQUGdGcU5a?=
 =?utf-8?B?SmtXMFl0alcrWlIyTGJuYXZBK1FBZU1FaE5NeERCZzNNYXhBM2Y1d2FPbUsr?=
 =?utf-8?B?ak0wUzJGZ0FUSjkwL2pGUFNPMjhmNXJvZFpJTzdrTUkvd0lrSXlQRkFMWGU2?=
 =?utf-8?B?bGNFbE1uSTBCSWFUS2VidGFnUllhY3kxMlplVXh3a2xlbzFiYk5KOUU2TUtC?=
 =?utf-8?B?ZG90S3JpMUM5USs2N0s1UXVWdTRFVXJJL2dvclh6TEgyNHRwUXNXMWlscXlU?=
 =?utf-8?B?R3orQVVVZ1phaFIvQTlDcnBTR3JMTFQyb1Nzem5sQzV5OUlRWmVWZTNFSmoy?=
 =?utf-8?B?OWRCbmJvSVNaZTFiTjM0UDhmbi9yR2RLdWFrNjMxd1Z4Vldpem5vVDF5enYz?=
 =?utf-8?B?TGJSMnBVVXhiU0FWdnJITHd2SktCcVRYdVlBUEc5OTRNY0xJZmQzRWVodlNU?=
 =?utf-8?B?T3VIK2F1WVdOZ0MzaVhvL1piclhQaEx2MWJCK25IU1JmNjRKZmU2Z0QvdWls?=
 =?utf-8?B?TkVUQ3hkVXZoZVhOYmFJUTlpakJHZDVvMGJ4eDdyMjhrSjJ5YkIyMlNmd3RC?=
 =?utf-8?B?WGp4dzZ2dWRzN1JSVFF1VEV1eENZNFFxcjBmcU9vQktiWTZGR1hOMndYSTU3?=
 =?utf-8?B?K1JNUkVnOVFzL0ZIOW9BRnlBSHVJSm9TUS94dldXWDFoa1BjQWJISVZTZGJr?=
 =?utf-8?B?Q2xUUldpVXZ3SXF1QWUwNlI5T085VTc3UUNwa1NQTm84VUNzMDJheXBTcCty?=
 =?utf-8?B?cDJqbkVsUW9na0FIUzN5QlR1U1dLam94dmFXdDJ1RDQvOGgyMTFyejVsZWR2?=
 =?utf-8?B?cEpvQWU5ZXNUT1FFSWR2Q1JIRUc1QWV1cFU5VzFqYXp0NkRxclg4cERDdlUx?=
 =?utf-8?B?WDhmNWZ6RkxlRHZ6ek5zNGVNRk1oWDhBVXFtbjhCTjhtb0VGWmdhWnNvN3pX?=
 =?utf-8?B?YlppVWxrcXZDbTVvWnhMZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEo5YVl4NzhaUHNGKzJ0NjhGQjhQdVRDQ1h1ajhJSDg5a3ZqUHpucmkwT29t?=
 =?utf-8?B?NDBML3d4ckdzVEFLRDcyenhlM1BjUExpT1hxRkZscDlhUjBxcnJYTm5rYVd6?=
 =?utf-8?B?N05BOHJqUW9kaVZJc1ZHY1llRkZRMElJSkYyV0dOdFVvZ1YvN1RGVy8xYy9n?=
 =?utf-8?B?My9BRFZ4LzRkS0w0Zy9kTGhNRHNBWHRNY1ZvcURyTk9FTzY1NnVHVVBxRjhp?=
 =?utf-8?B?UjF5M3cwaTdhTUpDQ0tiUFVNTGFlOHNjajY5RGlMbWVibnVTRzlSZ3JLSGZ4?=
 =?utf-8?B?R3hkaitzd2dNUm9sdm5HZmhJbE1xYWhtNWluM042ZzVLYnU4aTRvc3BvM2NV?=
 =?utf-8?B?WmI0SklURU5WUW9uOURQNjk2K0wxZmE1QmE0V3FjMTlMc0hIRDQ1Y1dKYXE0?=
 =?utf-8?B?NlFLSkYxWldkK3BjRml1bjQ1RjlZNGtub3NjcTlCZHl3UkwwQm1kYndBUFdF?=
 =?utf-8?B?emlQTzFRcWExM1ZRNVRURnpyelAxMFVJMEdFSmFOVHBDYkV1U3pZcTJFc3Nw?=
 =?utf-8?B?RklYVkNmSnR2MzBYR1pKSmtYQ3RHaWJXYlVpNGlTQ2Znak9xWnhzR0dPM2t2?=
 =?utf-8?B?SUNLQms5Ym53cXBnU2l0SUJQRUYzalNFQUd2Y0o3Q1pwR3R0SlRRRjN3TVcw?=
 =?utf-8?B?K25LNVpDUzVKMnRLRnVJaDRnWDA1aVFmVjdsaVJSKyttS3YwRFpNLzdJejlF?=
 =?utf-8?B?ZHdnMlh2ZEVjOENhWStsZS9HaVhZZEtDRC9DWkZmY215NDJ0ZE9LdGV0bFg3?=
 =?utf-8?B?dllmTmFNU0VSaVllY1hHRlo2aDUrekdUOVp2dElIMmF1NzhaOURtU0hmbEt0?=
 =?utf-8?B?RVZ5ZlRjNkhZOXZJK3pPL3RJdmtLcU5xaHFSekRZYTgwanRtSldmY0tHSkJB?=
 =?utf-8?B?M0JybmVKU1d0WTkrMXBrRElKMkdtbHpKUTJoYUZvK08wclA5ZGVPOFB4czJa?=
 =?utf-8?B?V3hzMFowVlBBRWdhbys2eEhOVjFNMm51VEpZSGIrdmcyRjJiT0VYM2sxUkpG?=
 =?utf-8?B?V1o1Yk9JalRpWWtFZTM4UzVETEVxRzZZNENkUHRQVmtSei9MeVJNWlEveFI1?=
 =?utf-8?B?bkRmSnkybzFxcWVIVjBTejZQQURVMjlaRTRsa05vR01EYmlqZWtGN0Z6d3NB?=
 =?utf-8?B?QmhxVGVUYlNQeTVMNTZQVzRjN0VjNzlNZ2haUk1EenJJVjhIMFBVbER3elNq?=
 =?utf-8?B?QyttU0NkV1pIbVdhNVVMcm9LOXBqQkJnOCtlZGxBMm9kT2U5Z2JVWmRWbzB4?=
 =?utf-8?B?RVZDSFFOdFB1eXdXNGlBK2pyMmdCUno4Z3RSK3lkRGovU1Z2S2xiWjQzKzlh?=
 =?utf-8?B?Z0hSS3BJdVg3NkMvd0ZEYnZ3V0pxTXZjU2t1azNHQnViU21jZHE1Y1RCZ01o?=
 =?utf-8?B?MnpWNVdnZGFQYnlJcG5ZQ1RtSzY2cXBVNkdBUUY3SE1ZbDFONHdOMjBzRWRQ?=
 =?utf-8?B?QzcvSisxcDNhSnA1M2ZtYmZXK3pSL0N3TUplb2dBbldBYnNoa0tmZ0JqVkR1?=
 =?utf-8?B?RjBiczIxMDE3dzRxSVRxU20vWXZteUtvZ2J1ZHJyQ05DQkxITkdwa3ozREZw?=
 =?utf-8?B?eUVaSnB2U2pyK0l3cEdTNTB3QlFMNGpUZ25PaWhzQ1JVRlVlVTZzeHlZcDlV?=
 =?utf-8?B?NEhobU1USExCelFkM054c2oyNG1DRkZpZUV3OXp5VVdGdnhNMXhxei9FMWQz?=
 =?utf-8?B?QzFxbW5QdG0zS2xYQzhtdStBdk5mbngxOVVEQVVjYTk0WWcrRUREOTN4dldt?=
 =?utf-8?B?SGk2Mm5OcEpZWU5HRkpza053UnFLQmg5VVMzSVlWWk9tcGhpSTRsbSszRVRn?=
 =?utf-8?B?UGd1VnB0Q0xMM3dQQVFDMnBpQStCdXU2Znc4WWQ5SmRIKysxVDluN04yN1BG?=
 =?utf-8?B?OVB3Zlp2ZUhUMVFqUUhKQmh0dGxZUDR6RWtmcm5VQjlLM1BsQ3R5eFZyeFBU?=
 =?utf-8?B?NUdZSUliS0EwTUlEaUNxMGZoeks1VlFOSk5YMm9ISW9KTEdwdVNESy92WHJD?=
 =?utf-8?B?cFJPRmI1ckxQRjJORXlFR0VWNjdCR0EwcnAzZ1pKa21HaXVNN3hPeGFucG5j?=
 =?utf-8?B?dFZkNFpLaWFkaWhtMkVGeDR4MlJ3WDAvT0tCWnFWYkZ1S0R0azY4ZEl0b2xa?=
 =?utf-8?B?dHM3WlRUMFNNdUxzWGJISGlIMHRKakJUTHlSVWZmSkxXU0tleXVrc3lMMjAr?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc5cce3-dad2-4ad0-5819-08dcce17d66e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 02:01:35.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKJlGhZdFVTCtOrWBQyp4iin5tpVTm2IASY58n+PCK5JDS5FYo/OnBOFr0i5n4gfwWwtMuqN02GZePUxdu3nDZNyy2BY1/m6sYvxl+t3+AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
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

On 9/5/2024 18:54, Lucas De Marchi wrote:
> On Thu, Sep 05, 2024 at 01:50:58PM GMT, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a need to include the GuC log and other large binary objects
>> in core dumps and via dmesg. So add a helper for dumping to a printer
>> function via conversion to ASCII85 encoding.
>
> why are we not dumping the binary data directly to devcoredump?
As per earlier comments, there is a WiFi driver or some such that does 
exactly that. But all they are dumping is a binary blob.

We want the devcoredump file to still be human readable. That won't be 
the case if you stuff binary data in the middle of it. Most obvious 
problem - the zeros in the data will terminate your text file at that 
point. Potentially bigger problem for end users - random fake ANSI codes 
will destroy your terminal window if you try to cat the file to read it.

John.


>
> Lucas De Marchi

