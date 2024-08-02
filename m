Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA6CC52D71
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 06:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62510E031;
	Fri,  2 Aug 2024 06:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUng+Ls5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0097B10E031
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 06:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722579720; x=1754115720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bgp8n7R0mQw3xD7tW36WQ7ci5D2gv17OlQY1UMzbfoc=;
 b=GUng+Ls5WQH2iKQ1fLeEHc/qM18ii7MqWmforaSGBlOxMWrcpIyUwG3T
 afZ15iuXqMWYWUV+f6DV0SnL/IuOEVACQbrxXLoF7D+50AONO4lbxnoj7
 n6yPbdouDNphASoCjo+5n8vgmbHNx++7PP43QzU7ug6yISKSqYotDYnsd
 P8HE0TNb4Os1WotUrFE/v3TCn0X9PQ+Up3Ct64za6cR48M9/pODutLYse
 x3m7WS+ZtuZ+NHrWDBj2G7Fkf9Q4YIPN7F3OMWBs+wnoTgW6TQBiXSATh
 nIjB5D5fe0JO1TlWkgzRZ/j/9gNSiyjDYREscf46seo2EmPd59yF2Dh6t Q==;
X-CSE-ConnectionGUID: r8vC2snRQDC4yBmj2lz/dg==
X-CSE-MsgGUID: eiiKoiDURt+Lc99SOXarPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20420242"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="20420242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 23:21:56 -0700
X-CSE-ConnectionGUID: KOHMmOE8TVCGJkjwpyP/4g==
X-CSE-MsgGUID: 620N1XFXSfaZdcZK2upc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="55233573"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 23:21:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 23:21:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 23:21:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 23:21:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 23:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIrCKXdx3I2DRj8gGAh0RfJHy5kJKZal5BXfWmgJpr0Op6q5oXmiZnFVL5XZIckRNKF1y4R5AB103pXEHcrxGUsIbHAKHkKsjnsGj0y6POdgiT89J1FpHn4qg8dKmrsIQ1KfIsbHXWzce3C45BSwFdIbXT7clEwkUL3a3BgltsrCv/CRtPKLgXyYc2GBCEg/7Cof8TAPN038jrJDwA3CepFLN8uAaHfdYR0C+M66eiNfAuM9qSopYq0HzE4xgAaH/p96GauPURcqMtX7adjnC6txqsymeeXjBnFGzXpf43QlzYo0OONHB3pgn7z/rcqbTcJ257F0aepz/X3zM4N9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usWRhHXtn1wWJlJtqarbik1hvBwHpDjYCtrZNVtREGQ=;
 b=oI7oM1kRn5ix+TIg+L2IXyJve//g1hJsXuI/Jn3xTSDuh03Md3q/lVHtIPuiQtK23zY4VROZ8ul4N+FcOJZpAngQ0wrNSXRhejSSnbcJwIMYmhvHnk9umry1a46Yrmn3mJk6MHlCTQPxZhK6Bz7auB81wyWoO1d+LlPbhcwOUI8IzFq+xEAbjyKeo8u9tXZ7rbCZoAuaErFrOJ3zLYn0KFWG9fLSKV3sWH6gjaTrs2/nmZKwHQiR3X90Fbf7E5nPK9gI/ZQ7bEyyyI2FH88wWt8MEuyn47loA9/588/qUOuxmkF82TpFVC2ZT9DMHetkKFHHFtCFmd3Mi9X2G8zOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19; Fri, 2 Aug 2024 06:21:46 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 06:21:46 +0000
Message-ID: <4ee725d0-ca21-4720-aa79-697129586a83@intel.com>
Date: Fri, 2 Aug 2024 11:51:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe: remove GuC reload in D3Hot path
To: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <karthik.poosa@intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
 <20240801055941.1187878-3-riana.tauro@intel.com>
 <ZqvzU2rYPy4Citg+@DUT025-TGLU.fm.intel.com>
 <3659cc23-7860-42d0-9c63-5a86edc6da25@intel.com>
 <Zqv31ekKxKHVFZu1@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Zqv31ekKxKHVFZu1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1decb4-370d-4b43-f558-08dcb2bb6292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEJVZzlabm15TzVIUjBITWhiclpxclVucnZuY3ArOXAyMVI3a0I4SjBwZGJa?=
 =?utf-8?B?ZE1BVzBoQlh3YnpjR09nSDM4K004TzQrM3ZqZ1JHTGRQYTZOb2xpZXMxSWto?=
 =?utf-8?B?LzJHZVlHN2QrMEc1UXNMOTFGTjNhZWdEaFpjcTEyREhFRzFmOHVlM1dQSnFq?=
 =?utf-8?B?V2hSQ3VnUXJwRXFpeWtBNkRrUkFPay9RaXhiTWkxMzcxck1TUlRUUmZvY053?=
 =?utf-8?B?dXpLbEVmcW4ybEtCK0ZrRURaVjdPOFhDVE9NUGt5NWR5d3hIWXNDNEZ5TlJZ?=
 =?utf-8?B?ZVZPZERrbW9GSUlLTS9wYzljUHFHd1o4b0l4RWlaWjIyRlRqYmlCdGFsQ3FB?=
 =?utf-8?B?NGN3cXJTN3M1Y2FBS2h3My9LUXNuaE5DQmJZNHZaN1YwY3ZCSWtIbWVLYkxl?=
 =?utf-8?B?ckdaelpVazB5Z05LWTVTbVp3ZytGOGc3Y1g0Y3poVGF2a1JGYmhjRVN6UzE2?=
 =?utf-8?B?aytGci9TbENDeEhkbjJ6RVkzK01IdVRXblJVdXI3ZVZjK3RzNWpqMG9aWGhX?=
 =?utf-8?B?aTlMd2NOU3ZycVRQTmVqbUtlQncxczZEWmRoeUEzd0l5bzh4Ulk0TTR6aGRN?=
 =?utf-8?B?MFJQTlE5UUFnWUVqQzRKeVdpbUxDZ2N1MW5oSi9rajFqMEFvMjZwUGpKOGdW?=
 =?utf-8?B?aUNqTDFIT2JRVDRSeFAwQytPTnBTS0RaQzNLSE53SGJ0dTBBWE1hbE1wdHlC?=
 =?utf-8?B?R2x6dnJNMzJjQXBiSzY1c0M5L0dZTjNXRnN0N1V3QXp0Ulk0QWQ1VG12Q2JK?=
 =?utf-8?B?R1M1eE8rRW1NallTNDg1UnJBUEszalhyUXZZd1ZzN0c4TXZPUkQ5eW5kUERH?=
 =?utf-8?B?eE9hRCtmdVAycGhxbm12RXk2Ly8xdHRVZlVZZ1pGUWU5MGlOblIzdGpkRmJr?=
 =?utf-8?B?RUpGUlNnSktiZkNwcXNHZEFDUEEyNDhlSXpDUlNLUUUvZFhYanNGYnZnQ2Rm?=
 =?utf-8?B?VUhlZjdrUUY5Uy9rbUhrcHE4RURrRXp5S25ER0xHczNlVm9OWm5VWWNlN3Qr?=
 =?utf-8?B?VTV1dm1HaFFaRnF4Vkx4YVV2RCtOTFNjWjVYNkRUQ1dDdkdMRjltc0hPY1R0?=
 =?utf-8?B?RGdJU2x3ZnY1S2Y0NU9rUzB6TklvdWhVVTRuZ0hFUUJFbTRnUEdnL0RWaTRJ?=
 =?utf-8?B?R2ZzcHBnZEZPRmhXbVFtVlVoY0g0eE5OTFVwanJUR3VYbXFBNjNxNTFZd1J3?=
 =?utf-8?B?WGpjQUJtdi9PdlNaMWlhWXBnM0g4NjJyUFVTTjRGZmdZTXdzZUtBVXhiRXg5?=
 =?utf-8?B?UXlENmpRTTdlSWtyUlR5ZTEzQWQvV3FHeUU4dU9Ob3JEOTJXM1lVYUpuSU1a?=
 =?utf-8?B?d1hkUVZUQ096YVh2STBvNjJDNG1uQnY1a2R4U3JtZ3U0SElXMjhNeVpjQVEy?=
 =?utf-8?B?bHZsT2F5eVRGOXRTTlk5ZEJlQXhMZEVaMDNFZ0dWYThRTEFwZjBnMnBpMWFE?=
 =?utf-8?B?c3Uwc1BKREVhVkRBMG1JdmIwQm9mMjAvcE1SSGxsbzdsVGN6MGNSblMxZ0VQ?=
 =?utf-8?B?V3JIeXJFWUF0L1RCcHgwWkJld2RaamYyQU54Qyt0YS9UV2JJd0hZbi93YUR0?=
 =?utf-8?B?aHc2ZGNORCsxSnpnUjRhTkxUREdhRU9FcDFacm8yeWVoeDVZalFKUFJhZWZj?=
 =?utf-8?B?QWRrTC83VnhlMUd1Rk9wZUp1WE1rc2VsQ2dOZnZZdG5qaytwcmZybDBuNGV5?=
 =?utf-8?B?MFM4MDFVVnRYa2xkUWZzekFLRE5Xb2hJM2UwU3FxNjdDZXVWRS9uSmpGS0JG?=
 =?utf-8?Q?jNam8UJd0q7iTZjvaE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdQVy9qb3RlRTNlR0gxWTRiRnZLVmJaai90eFNzZ1B3TFM4TDNLbU5YQnFE?=
 =?utf-8?B?RnZMTmVoRHlaR1owQkRlc3VIOC9QYlVzd2VHSVJsK2crc0g3ZE8xWndrT05E?=
 =?utf-8?B?YzIwcFNlK0JPZFpLanlMUXcvMVg4Vkt4TjlaL2ZXN0dvdW1lTU1QS2s0UDV5?=
 =?utf-8?B?di9PTGh3V0VESWdCYXV6Mzd2aGIvZGJKWUxNZmhLK05WRGdQd2FWK2ZjSUp4?=
 =?utf-8?B?c2g4MnRDWXRDQTJYMnoxOCtiT1pHaDNyTU5zaUxvSkFrclhIUGFwS2JoMmEr?=
 =?utf-8?B?VnBDZVFBVkZrTmhzRnk2Ymt4YmV6VlpKUCs1N1ptYkFFa2hYT1hKNkpucWta?=
 =?utf-8?B?RTVsUmlRVm9WaU02b3d5b2NyNWNpa1Yxc1RnN0xxaTc0dmQrWVpDeEZXaFVl?=
 =?utf-8?B?dTdOOHlVNDZnY0ZVUklMOHJ6aDRNWVl5aFhSaTBHUDJraEJ2eERNaG9IRzFP?=
 =?utf-8?B?dE9GUFZvcDAvM1pCVTA1RmdkRWdEYmJmNmJSbGhBbnprZU5hMkNHbjZKSGhw?=
 =?utf-8?B?RWVCSTY1dnNDSnduVERuem5FOERZUElkZUkzTVBZdlRhOUJldHF0MXhWcExJ?=
 =?utf-8?B?WHZuWncvSXlxcjlzT08yUG04a2tsZStRQU1QV3o4Vk9JaVl0NGVRempKbEox?=
 =?utf-8?B?WW5vWFh2K2ZyREZ5blNTbWJXM3VYeFRueUJFQXY2dmJ0ZThiV3h0OWRKUSta?=
 =?utf-8?B?dDkzN2ErRVpQOHJjMHZXV2ppZE8vbnhOazBPT2djZ1JkbzVMVzFDR1VWT0Nw?=
 =?utf-8?B?SkNOa1UyZFZvalF6MXdFbUdZSzJrTmRrblJwdHBjbTBxc3Mvby91dGpXeVFT?=
 =?utf-8?B?QlFhOHNEcVEzKzNETG02L0tpcnJHc2QwKzFDNnJqNklRcnF5VlE1bjFBMWRD?=
 =?utf-8?B?Q2w2R0YwMWZ0UXBBcGFiYndZb25nOTJrakhKVDQ0R0E4YTloSDNEbk9tdUdJ?=
 =?utf-8?B?MTBXNFM0bE1kb2RPY0xMSWZlK2ZaenBIN3B3L094NGNJN0UybmtIa2kxTU9n?=
 =?utf-8?B?dlNTM0NsWWsrQXlJTVBRQitsVFprS281NVZKYUVBcGVacXJJb3NMdU5lTzlF?=
 =?utf-8?B?UlkzeVJSaHVRZUZqTWE2VCs4L3hwS0t1NVI2QjgwRzhHTWpwejhXSFpWYVJF?=
 =?utf-8?B?bUxlLzVFTHVheVVjSGN4TmdkN1ZKc0FwVXRzWW56a3JUMXp3TU1HbmZOK1VK?=
 =?utf-8?B?WGQ2Rm40eXNxU3U1MDRieEUzTmMzQ3lqdVE1SFl0d2oxd3I4S1d0UzkwSjJz?=
 =?utf-8?B?Y3J2QkNrTnBzKzhmVTJ0VmhFYzZVaW1JYWxhaG05NlpDbkUxeWVtMVNPMG1F?=
 =?utf-8?B?V3VCWnlIbE0xUjNTTVVPM1NBcjdRV0x5ZzNPcWNqWCtKcXM5dmRTc1RhL0ow?=
 =?utf-8?B?eXFGM2hEMHRibWRocnhRazRDNVJQK0ZsOEtQWnJmLzBTL3BzL0dJR3ZpNzRs?=
 =?utf-8?B?Zk5uYjNBQ24rblk4L2JRM0dzMHQ5WloxaXMxSU5CaXlsOXNScXFEdk9BL1pl?=
 =?utf-8?B?NnBUM0Z4VUdMU1pkZndqTG1qNHp6MitHTGJaNkJOL1NTYnQ5c2NkSHd1bWJ0?=
 =?utf-8?B?UkRhYk9HQUw3T1NZZWRhdUpsYVZNdEVGQng2STBrZEdNenFaNTJCaENEUmVE?=
 =?utf-8?B?RE5ndkluQXUwSi8wR2wzYjlFMlBsaW5iVUdEc0F3L0lIR2RoSGd6WlNuVUxD?=
 =?utf-8?B?bWpTVE90Q3hkM0JPY0JqUEZkVFVNQXpFMnRuMGhvekoySlJnOWZNWThCWWFk?=
 =?utf-8?B?QVhJK2o2ZFdQQXp4T05pSmRrOVZtWmxXMWRoRk10VXVkNnBBL2JvcTJ5eHU5?=
 =?utf-8?B?WnJjRmpXMWFJTmtnQlExcEMyNWxLdG5TM1ZHSjNGVkR6a3Aya3RRckFFUUNR?=
 =?utf-8?B?SXVuR21SSlpVeG1YSHkzU0RObFFtNXAxM2Njc1laNXRHK0gwV2ZYMisvdHA2?=
 =?utf-8?B?L1Y0NjdSL08vNjJJY0FiN3JOSUlWZXpKYjBzTUZpNmhMcVlnWUVFd1dVVFY1?=
 =?utf-8?B?KytSSmN6ZUltNEVGS3NWckZOQmVXdVJlSVRobWtuMmJqOVJXUUlZNVhaQy9U?=
 =?utf-8?B?WVBhZGJxZW5scno1aGZTMmdyK0VldDNDNFM3M1V6bGZCMC9jK3Y1U1NkeHJo?=
 =?utf-8?Q?/fQwijXU18dRpiBtIBa5gpZi9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1decb4-370d-4b43-f558-08dcb2bb6292
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 06:21:46.5586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eULGx++RIxG0d9nDLr6W6+P3D6L1VliEsjAJjtgjb8aCYw4yN9IGA7Q/FYpABV2U0cC7ikn54NCtIIiHBgUlRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
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

Hi Matthew, Michal

Thank you for the review comments

On 8/2/2024 2:32 AM, Matthew Brost wrote:
> On Thu, Aug 01, 2024 at 10:55:07PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 01.08.2024 22:42, Matthew Brost wrote:
>>> On Thu, Aug 01, 2024 at 11:29:41AM +0530, Riana Tauro wrote:
>>>> Currently GuC is reloaded for both runtime resume and system resume.
>>>> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
>>>> is not necessary.
>>>>
>>>> Remove GuC reload from D3Hot path and only enable/disable CTB
>>>> communication.
>>>>
>>>> v2: rebase
>>>>
>>>> v3: fix commit message
>>>>      add kernel-doc for gt suspend and resume methods
>>>>      fix comment
>>>>      do not split register and enable calls of CT (Michal)
>>>>
>>>> v4: fix commit message
>>>>      fix comment (Karthik)
>>>>      split patches
>>>>      correct kernel-doc (Rodrigo)
>>>>
>>>> v5: do not expose internal function of CT layer (Michal)
>>>>      remove wait for outstanding g2h as it will be always zero,
>>>>      use assert instead (Matthew Brost)
>>>>      use runtime suspend and runtime resume pair for CT layer
>>>>      (Michal / Matthew Brost)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++++----
>>>>   drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
>>>>   drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>>>>   drivers/gpu/drm/xe/xe_guc_ct.c | 31 +++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
>>>>   drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
>>>>   drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>>>>   9 files changed, 131 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 58895ed22f6e..e0b13dc7663b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>>   }
>>>>   
>>>> -int xe_gt_suspend(struct xe_gt *gt)
>>>> +/**
>>>> + * xe_gt_suspend - GT suspend helper
>>>> + * @gt: GT object
>>>> + * @runtime: true if this is from runtime suspend
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>>>>   {
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>   	int err;
>>>>   
>>>>   	xe_gt_dbg(gt, "suspending\n");
>>>> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>   	if (err)
>>>>   		goto err_msg;
>>>>   
>>>> -	err = xe_uc_suspend(&gt->uc);
>>>> +	if (runtime && !xe->d3cold.allowed)
>>>> +		err = xe_uc_runtime_suspend(&gt->uc);
>>>> +	else
>>>> +		err = xe_uc_suspend(&gt->uc);
>>>> +
>>>>   	if (err)
>>>>   		goto err_force_wake;
>>>>   
>>>> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>>>   	return ret;
>>>>   }
>>>>   
>>>> -int xe_gt_resume(struct xe_gt *gt)
>>>> +/**
>>>> + * xe_gt_resume - GT resume helper
>>>> + * @gt: GT object
>>>> + * @runtime: true if called on runtime resume
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>>>>   {
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>   	int err;
>>>>   
>>>>   	xe_gt_dbg(gt, "resuming\n");
>>>> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>   	if (err)
>>>>   		goto err_msg;
>>>>   
>>>> -	err = do_gt_restart(gt);
>>>> +	/* GuC is still alive at D3hot, no need to reload it */
>>>> +	if (runtime && !xe->d3cold.allowed)
>>>> +		xe_uc_runtime_resume(&gt->uc);
>>>> +	else
>>>> +		err = do_gt_restart(gt);
>>>> +
>>>>   	if (err)
>>>>   		goto err_force_wake;
>>>>   
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>> index 8b1a5027dcf2..21f27ca23b67 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>> @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>>>   void xe_gt_record_user_engines(struct xe_gt *gt);
>>>>   
>>>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>>>> -int xe_gt_suspend(struct xe_gt *gt);
>>>> -int xe_gt_resume(struct xe_gt *gt);
>>>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>>>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>>>   void xe_gt_reset_async(struct xe_gt *gt);
>>>>   void xe_gt_sanitize(struct xe_gt *gt);
>>>>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 1ff49318f001..e1923a00a9f6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -881,6 +881,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>>>>   
>>>>   	if (register_ctb)
>>>>   		err = xe_guc_ct_enable(&guc->ct);
>>>> +	else
>>>> +		xe_guc_ct_runtime_resume(&guc->ct);
>>>>   
>>>>   	if (err)
>>>>   		return err;
>>>> @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>>>   	guc->submission_state.enabled = false;
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_guc_runtime_suspend - GuC runtime suspend
>>>> + * @guc: GuC object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise.
>>>> + */
>>>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>>>> +{
>>>> +	return xe_guc_ct_runtime_suspend(&guc->ct);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_runtime_resume - GuC runtime resume
>>>> + * @guc: GuC object
>>>> + *
>>>> + * This function enables GuC CTB communication
>>>> + */
>>>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>>>> +{
>>>> +	/*
>>>> +	 * Power is not lost when in D3Hot state,
>>>> +	 * hence it is not necessary to reload GuC
>>>> +	 * everytime. Only enable interrupts and
>>>> +	 * CTB communication during resume
>>>> +	 */
>>>> +	xe_guc_enable_communication(guc, false);
>>>> +}
>>>> +
>>>>   int xe_guc_reset_prepare(struct xe_guc *guc)
>>>>   {
>>>>   	return xe_guc_submit_reset_prepare(guc);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>>> index 13e75573f7d0..ddc87798e176 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>>> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>>   int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>>>>   int xe_guc_suspend(struct xe_guc *guc);
>>>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>>>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>>>   void xe_guc_notify(struct xe_guc *guc);
>>>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>>>   int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index beeeb120d1fc..9e42c5d29971 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -419,6 +419,37 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>   	return err;
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
>>>> + * @ct: the &xe_guc_ct
>>>> + *
>>>> + * Mark GuC CT as enabled on runtime resume
>>>> + */
>>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>>>> +{
>>>
>>> I'd assert here g2h head and tail are equal in memory to ensure we know
>>> we are doing with the PM as we shouldn't have any g2h on runtime resume
>>> if we have the PM correct. If they are unequal, this isn't fatal just
>>> kick the g2h handler.
>>>
> 
> 
> Based on Michals feedback below, I guess we xe_gt_WARN_ON here too for
> g2h head / tail check + fallback to kick the g2h handler.
> 
Sure will add this
>>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
>>>> + * @ct: the &xe_guc_ct
>>>> + *
>>>> + * Mark GuC CT as disabled on runtime suspend
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>>>> +{
>>>
>>> Nit, I'd write it like this:
>>>
>>> xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
>>> if (ct->g2h_outstanding)
>>> 	return -EBUSY;
>>
>> IMO neither option is good as xe_assert() is not to be used where you
>> plan to use fallback path [1] you may want to use xe_gt_WARN_ON instead
>>
> 
> So like:
> 
> if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
> 	return -EBUSY;
> 
> Yea, that is probably better.
> 
Will make this change

Thanks,
Riana
> Matt
> 
>> Michal
>>
>> [1] https://docs.kernel.org/gpu/xe/xe_debugging.html
>>
>>>
>>> Matt
>>>
>>>> +	if (ct->g2h_outstanding) {
>>>> +		xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
>>>> +		return -EBUSY;
>>>> +	}
>>>> +
>>>> +	xe_guc_ct_disable(ct);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>   static void stop_g2h_handler(struct xe_guc_ct *ct)
>>>>   {
>>>>   	cancel_work_sync(&ct->g2h_worker);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> index 190202fce2d0..0cf9d77feb35 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>>>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>>   
>>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>>>> +
>>>>   struct xe_guc_ct_snapshot *
>>>>   xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>>>>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index 9f3c14fd9f33..c73a728a7450 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>   	xe_display_pm_suspend(xe, false);
>>>>   
>>>>   	for_each_gt(gt, xe, id) {
>>>> -		err = xe_gt_suspend(gt);
>>>> +		err = xe_gt_suspend(gt, false);
>>>>   		if (err) {
>>>>   			xe_display_pm_resume(xe, false);
>>>>   			goto err;
>>>> @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
>>>>   	xe_display_pm_resume(xe, false);
>>>>   
>>>>   	for_each_gt(gt, xe, id)
>>>> -		xe_gt_resume(gt);
>>>> +		xe_gt_resume(gt, false);
>>>>   
>>>>   	err = xe_bo_restore_user(xe);
>>>>   	if (err)
>>>> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>   	}
>>>>   
>>>>   	for_each_gt(gt, xe, id) {
>>>> -		err = xe_gt_suspend(gt);
>>>> +		err = xe_gt_suspend(gt, true);
>>>>   		if (err)
>>>>   			goto out;
>>>>   	}
>>>> @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>   	xe_irq_resume(xe);
>>>>   
>>>>   	for_each_gt(gt, xe, id)
>>>> -		xe_gt_resume(gt);
>>>> +		xe_gt_resume(gt, true);
>>>>   
>>>>   	if (xe->d3cold.allowed) {
>>>>   		xe_display_pm_resume(xe, true);
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index fa98e9f22631..8e535153cc62 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>>>   	return xe_guc_suspend(&uc->guc);
>>>>   }
>>>>   
>>>> +/**
>>>> + * xe_uc_runtime_suspend - uC runtime suspend
>>>> + * @uc: uC object
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>>>> +{
>>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>> +		return 0;
>>>> +
>>>> +	return xe_guc_runtime_suspend(&uc->guc);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_uc_runtime_resume - uC runtime resume
>>>> + * @uc: uC object
>>>> + *
>>>> + * Called while resuming from D3Hot
>>>> + */
>>>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>>>> +{
>>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>> +		return;
>>>> +
>>>> +	xe_guc_runtime_resume(&uc->guc);
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_uc_remove() - Clean up the UC structures before driver removal
>>>>    * @uc: the UC object
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>>> index 506517c11333..1e223d67086a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>>>   int xe_uc_fini_hw(struct xe_uc *uc);
>>>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>>>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>>>   void xe_uc_stop(struct xe_uc *uc);
>>>>   int xe_uc_start(struct xe_uc *uc);
>>>> -- 
>>>> 2.40.0
>>>>
