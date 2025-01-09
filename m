Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA67E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 09:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117DC10ED31;
	Thu,  9 Jan 2025 09:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZPB0I1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2454810ED31
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736414032; x=1767950032;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aL2GN19ch2RRJybTjU8NM7WwLmowEN+GiRTAPrAc1BQ=;
 b=dZPB0I1p04Rp42KM9T0UmnnbdF1eTp68HlJt69/NxKcbXbAxw46JHjEg
 ZsfOtcH5D9xs44E2P8t434cptFmRqFujiW9GcH1mzaZiPxlyqHczH6jNH
 QKml2FkgTRtjtFoJqcNQXM43poW1yxchhKoDY9mz2aa0TGVuY5tsk4ehj
 tCtNT+13V6EM2xYWGy3RPNiD0JrPpoBurbmZSmmguSgiBkJx3p+qZuaJu
 sOeqpnKEtkPhmu5o88KWJy1lfKsWtUv/gG7FXOPELhWxTmw9TfscVHQi5
 HrJM6bVH/UIvlVRJaLGjNslN+JGNfWKwfpGHIdtfrKce2n9EnFYpkvRGd w==;
X-CSE-ConnectionGUID: Hnz7vLD5SM+KV0zBZP3UOg==
X-CSE-MsgGUID: x/0rG7sfTVmSuRVgqHieYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36358238"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36358238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 01:13:52 -0800
X-CSE-ConnectionGUID: V8gykffZSJqnz5JnHkoxOQ==
X-CSE-MsgGUID: z8Lx5ipAQBWAacqtXH4UeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134238348"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 01:13:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 01:13:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 01:13:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 01:13:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fO+qIeM3v+VSV+k1w7tG9OSND85xX0KtLfQqVSgTBouboxyzCjUQwpXGe55lmooo3u3LKnEbUPJgmK/gEda58EO36swYYzKot4+PvqF35FXrvDvdfmoEsYHcUaXP/eHVrv4moP9/BqomhrjulOXU2ayHXFN7RibcObX2UwzGCgQKrAasjiRs7ZaLbTSs67e30FOWftK9hDRiVWjPL9iAZqI/l89z2peN8/h6gZ/QcTdSu1jULPp3XdWCwGkN6aPCbfAoZyw9m8gme3t9AwshrtDZl0v82GtFLUSmyu4IAhAixg0LqDpKM1M9Czlr8iVI0XCOe8cV3Dsw/EzJOq8DMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKTxQiixg5iv69VUES52IHULKTMhssViHzbDemcnuk0=;
 b=iwhL/Zt4t+I/gowl9W2IJUCI4Lm0CSOcSy4RBgmO+f61XJXI9zpYd/kAg9SaGl390MLKo4LJ6RuW0jQvq/kBOK6D8n8IYcn/MzFNYofc6Wp2CzOHN2p081hyJwQNgem6iTkcKSM411nViC07KrSDRUyIVv7sjG+RpEPyV4jY0FKA5Fr5HTCuRSd0MRxd2ydTVPsATHowVqF9NHi0nWNHB9jV0Lcpz3msRQR9FRtGTlpYI1bocadyX0pZ83E1bFk2NGFFv9E4PqqHqfIvACq4v/oOjnXAemSsYmParxEP0BeLd8Y5XtXij4Ki2A/sFEvP67VrNSac+WAt+ZAYQPDrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Thu, 9 Jan
 2025 09:13:47 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 09:13:47 +0000
Message-ID: <5accd744-b7b8-49c5-8981-72282fa7dec2@intel.com>
Date: Thu, 9 Jan 2025 14:43:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Add functions and sysfs for boot
 survivability
To: <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>,
 <ashwin.kumar.kulkarni@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-2-riana.tauro@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250108103959.1219312-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0255.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::18) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH7PR11MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 91dc68cb-4134-48f9-a699-08dd308dec4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjROSTRTZndtblp6WWNxbFE1S0xPT3dVbFJtdkl0d20yaTc5TEM1Vkgwang4?=
 =?utf-8?B?b0hHdzVRSnRrSEY5Y1N1clFlck9lUWttK3ZCVGdhNURkekJuc3VWMml3T2tr?=
 =?utf-8?B?S01Md0VJT0dGb0hUZEtOUmZYc0RES0FFSEZKQVB6NWhiaGZHdlIyeGRhdEVl?=
 =?utf-8?B?emlyRkt0QS9pUkQrTXFUL0NGUHdOWUQrOUFVc25LL1R4a2xLdlVzUmhOUTdX?=
 =?utf-8?B?eXBsckNSL2h4S1c4cnlsR2wzTjJ5TVh6Ui9vMDd6MDN2R0RCM1VOTzV0RUZQ?=
 =?utf-8?B?dzlKNE1JNE9ySFRicURTcFNaaFBCdnV4WCtYdVFDS2xzZmQ1MjFseFFtdkxy?=
 =?utf-8?B?SG1HQ0JjZHZpcE9IVVpKUmhobzJUeXppOUdSaUtHbVk4M3dLVUc0by94Sm1z?=
 =?utf-8?B?SENHL2FPR1U2ck5oQm1UOHowUzM3OFJPanZ4V0NLVkRiTzdYRlEwTDVwQmlx?=
 =?utf-8?B?cWVpQ1JSTFN5L1ByY0ZHOXZIdGQwUFRSVUUzSEtPREF6Zy9yUnJ0dDQrOFFv?=
 =?utf-8?B?UmYzT3l0QU5HT1FGK0cvSi9EWVFqOFlTRlQ4SWwzZVowSXBrWWwrWHpFcE5T?=
 =?utf-8?B?NkFwUElPbEkycEpvalNlVlM5YnV0OHVCY054a0ZydlFoN0NpTlo5bHlRNXdo?=
 =?utf-8?B?TDZSQk1qVmh4bHEydWl0RVpGYkxtbjN0VDJ2b0NicnpkdXZVUTVYVU01Rytz?=
 =?utf-8?B?SHp5ekxVMFRScEtiR3lYWmUwWjkwTmNPZXBIKzNBeFl1eVpmK2RyUW4rZGZ1?=
 =?utf-8?B?Z3NYRjVnKytQQnlyS0pwTmJkNEV5OWUyaXJrdlhKdGsvV0xLaDBsVVpaZExY?=
 =?utf-8?B?cnY4bWtlRDR5OWhud05IYjNnZWlWUHRtOWpKS3M0U0xPRERoTzdCaFRzQ2l0?=
 =?utf-8?B?NHFPRFZpRUpWUHlVM1V0bVB3Zi9vUm16YUFsNU9uUWxsU29mRzZUQ2dmVlBv?=
 =?utf-8?B?dUFodHF1VFNmV1F2R2FXcHBTb1BMdHZqYWo4RzRRTFZ6VFFxbUVhblU5L0c4?=
 =?utf-8?B?bjdoME5LNVUrdnFabHRTa3JyMFJLc1F3WG1iUnhUN3d1L25LQTB5MHVsbllG?=
 =?utf-8?B?RHBGYmdxeVU0VGdMYW9MS3NWZXZRcHFnRmFGalloOW9WZVNFUXZPRjIyVmtN?=
 =?utf-8?B?aGZxck5zNEhuaDlDaHNEWVgyVXVHZXNWWTB5Z0dabHBIT244N1c4SDM1eUJB?=
 =?utf-8?B?YmhSMDZhTFRmSXZMQ0FJdVlPWm1xK3U4dVJvZ0QveGdlL2diL1QxUUI0OFdm?=
 =?utf-8?B?OTZiZGozR2dWeTFQOGxiK2syZk8zQjZhL0Uza1I4aXVXVXQzM1ZtV1gyOWdD?=
 =?utf-8?B?L0M1bEx5MkFZRE5WbTgvbnU2SXlWZHVxVU1NU1gweVArZ3BURFV4VDE5aFY4?=
 =?utf-8?B?QXlNcFV5dTVCdDNGc2tqTUZZMzBSZ3dEYzhLV0ZBaWQ2WWNleXpZSFNlVzFj?=
 =?utf-8?B?WXdRaTJXd3BXaXBERE5Mb2M5cEU2SEtnS0VrektnL3NnT0ExaUZoYytYYkpK?=
 =?utf-8?B?WmNzMzdXak1BN1NwaXdPUk4zT0NWNGREUUZPYmtjdkRHRzdHR3kyNXdoaUhT?=
 =?utf-8?B?VmlLL3VqOS9yTmw2S0FURHNGUzJQdzhnYmdPS0dvdUt1eDYvMU5UcS81ek1X?=
 =?utf-8?B?U1QxMnR0aXBwemhnSUcrcURvZm1DNjlHblpzMkxWMkJ0UlhzWUtlK01lVnNa?=
 =?utf-8?B?S3hKYWpOL1RvYlBKRnZnakVNLzZ1MHl3QWd4RkpxYUNCM0cxcWVHQ0hGN3JK?=
 =?utf-8?B?dG5Ubi80ampPRlJlQTNWUTIrdHl4djJ1ejBLcjJ6SE0rWnpqNVN4WS9aMXVv?=
 =?utf-8?B?M3JuK1dvN2hSenNZc3VLamxGdmlNM09pTE1VQk9CdnkyVkhMaGVTTDExdEFC?=
 =?utf-8?Q?bXSEGAbzLx1oC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25CVmRMcHp6Q0hIZlA0MjE4V1Q4RXMxYi9qRmxHMldQK3FHeWNqWnpQUm1w?=
 =?utf-8?B?QjgwckY5NDRqOFhoMTN1WUNyeU9GNk5VOXRQdWxyVTJVSHBLSkMvUm5OczA4?=
 =?utf-8?B?SFFtREdkMXkwTXpuOHJqRE5Ia3E5YW1uc2crT1lINCtRWHFPNC9VTFNMZFd1?=
 =?utf-8?B?clJtSUtoaDBaWDlHbWhBZnJOWjVPVVpYRyszZHRhekRSRHIySUhDa3hnSGNq?=
 =?utf-8?B?dnlIU0VsdzVoUExyQWFwMVorTDZLV2dEaXZ0VTBhY0xyREYvckEvVEVjVWtz?=
 =?utf-8?B?cVZhS0gwRmRHd0JsNFJBa0szSlR3QXBlOVRhWDYwZVBVbVJ1WlR1RHhpeEJv?=
 =?utf-8?B?Z293K0Q5ZkwrUElTcXJCLzFKWmxUOUVIWFFxRHE1dEZLYWZBTzYxeFhxK2FT?=
 =?utf-8?B?K0pWMjRmRVNBZ2t5VHZJMXRiM1pNN1ozY3pvT2lSYlZOZTI0bEIzbjJucDVO?=
 =?utf-8?B?d3JTamRWVnZGK1dHVHltbmpUeGJqN3c2QldmZUVNTHl2MDZQK1VmWUJOOHQz?=
 =?utf-8?B?dHdSM0JwWWRXRTJtS2ZRL3hJd1M2QmpjQ05QZUxaK1orRWNIVHloZXQzREJQ?=
 =?utf-8?B?VWZYNXN3K0hMM1dSQWpjZzVPWWpFMDJoU3BPT2VjSWhzQm1HYkkwbmloQkVY?=
 =?utf-8?B?ZzRkL0FtdVpGQlNnWFpaaXRVQW5oM1dzaEN5WlBMT1FXSEVUZ3hwUkpGZVl3?=
 =?utf-8?B?OVk3QVp1bFFVN0NpQnhCNUdRaytlMjg5TzVqeTVSNS9yUHJZNnNtV01Jb3NL?=
 =?utf-8?B?MHhoSXpsQWZNMzgxQWtmT3BTWit4SWN2OFd1cVZ0Rmx0UFE2MExJSmZsOVJS?=
 =?utf-8?B?UUs5WXVqV0RmVXY0MGJNRmNkYzNHYlF1cE1XUko2RE1sVjhNK3ZnTlBNaXRY?=
 =?utf-8?B?djB0YXZIRmVMOVIwaW5DZ05jWUY3S1VhTS9FZUVIV29Xc09iTWM0WjE4d25I?=
 =?utf-8?B?d3g2NE5pN2lXRWlMcktRVTlLdzdTdDU0aUV0bExBM2FmVlBJbSs2SmpmMURm?=
 =?utf-8?B?S2xPbGFlbUxnS3hYM0xMQ25zb1dpVlBLenRBWTZpRDU1VjR6Ym44UGZuZjht?=
 =?utf-8?B?ZDMyblA5Rk9JWTVtZXlwOHI0MUNkZloxR01EWVJyblJ1OENXdy91UDkyNHZ0?=
 =?utf-8?B?bHB6YXlvcEtsczd1YUg1ODY1Y3JwMi93TUJvQ1RTczBLQStzeHhMMGJ2WFQz?=
 =?utf-8?B?TG1iWFlMZ0FmdkRIby9RQytLeFhXd2U2NC9pQkl5aWdRZ2RYVXVZaGpiM1FM?=
 =?utf-8?B?cUhOd1hOL0JXdXdYUi8wZC9RWm9SOGpROEZrOUtUSEdoN2Frdnk3UzF0emQv?=
 =?utf-8?B?dW9GdEZhcjB2WXIyazVUTUp6eFU4TkVUdnFzTGtTaVJjeGl4K09LOUlsYVZl?=
 =?utf-8?B?L3lSWnAzL2NqaVROUGpMYzgySEVPdUFiRnlNaTJXMTVsRVRmcDAyOXkvMEVY?=
 =?utf-8?B?TEdwaHY4QnV4d0JPYVBhcUlMZkFKNGxodlFDMSsyZ1BiMzRsWkRLUlRWQ0x2?=
 =?utf-8?B?VDluNUQ0dng2cEdzYkdGUkNzMWgzY2o4TEM1MWhrZnpDWnVsWTYzTlRieGds?=
 =?utf-8?B?ZGVKV3JiLytRSWR6cFVxeElacDNzeTRSWVk3Lys1aTUreWxuQ3lyaVptejlw?=
 =?utf-8?B?SW95MWRNWHBlZ01DanBjeWZhaEFGWEJFNGN3a2U4L1hmMmNtem5Pd1lGclJ6?=
 =?utf-8?B?RnM1RlgvRUQ2UGtoTERIY1hFLzJzY3FyRk1uT1NIU0RxUlFyRTBtamsybmhr?=
 =?utf-8?B?dk9UQ1U2MEVJQ0p1QzdwUXJpc2N0enRnY2hzYnJVTlUwdXVqL2xtZzFJUzFD?=
 =?utf-8?B?aTlkRjB1U1BNNkpPT1J1NFd5UzVOR0lxYXRHN1NkdlpsNWdZR0ZjQW5iclV3?=
 =?utf-8?B?bmtZcUxsRk9ReS9rbGt1TWo2S2U5YjBSQ3VHckNxS0JtQVhKeU9BU3BHZ1F5?=
 =?utf-8?B?dVl4KzZZK2hxSGhiRFphc2NMb2hjUVhiL2VubllPT24wYmdWNVBnQ2VyNzln?=
 =?utf-8?B?YndMcTdISExDVW9vS0FoUUo4ak1RMFBNUXVDN1Izbzd2ZzlMOWsxQjh0eDM4?=
 =?utf-8?B?a1JONXEzTElLKytJMEtFbGZ3QnF5ME13UmRwVVI1bFlWZ0ViNktVVkFSQUZD?=
 =?utf-8?Q?iTsO3DDKJE4vcuNi6SVDpiAPL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dc68cb-4134-48f9-a699-08dd308dec4a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:13:47.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gs1F0LJ6N2ZYA1EeAA13GYp67Pb1xd/JbMLCeym8PG9HosFtV9OI8oE49ODkMuoa4WwaQeAxw3+24jWAVKIZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
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

++

On 1/8/2025 4:09 PM, Riana Tauro wrote:
> Boot Survivability is a software based workflow for recovering a system
> in a failed boot state. Here system recoverability is concerned with
> recovering the firmware responsible for boot.
> 
> This is implemented by loading the driver with bare minimum (no drm card)
> to allow the firmware to be flashed through mei-gsc and collect telemetry.
> The driver's probe flow is modified such that it enters survivability mode
> when pcode initialization is incomplete and boot status denotes a failure.
> In this mode, drm card is not exposed and presence of survivability_mode
> entry in PCI sysfs  is used to indicate survivability mode and
> provide additional information required for debug
> 
> This patch adds initialization functions and exposes admin
> readable sysfs entries
> 
> The new sysfs will have the below layout
> 
> 	/sys/bus/.../bdf
>               	     ├── survivability_mode
> 
> v2: reorder headers
>      fix doc
>      remove survivability info and use mode to display information
>      use separate function for logging survivability information
>      for critical error (Rodrigo)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>   drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 231 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>   6 files changed, 302 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..fb1cb98ce891 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>   	xe_sa.o \
>   	xe_sched_job.o \
>   	xe_step.o \
> +	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..0f5a052150c9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>   #include "xe_pt_types.h"
>   #include "xe_sriov_types.h"
>   #include "xe_step_types.h"
> +#include "xe_survivability_mode_types.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   #define TEST_VM_OPS_ERROR
> @@ -341,6 +342,9 @@ struct xe_device {
>   		u8 skip_pcode:1;
>   	} info;
>   
> +	/** @survivability: survivability information for device */
> +	struct xe_survivability survivability;
> +
>   	/** @irq: device interrupt state */
>   	struct {
>   		/** @irq.lock: lock for processing irq's on this device */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index f153ce96f69a..4e373b8199ca 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,20 @@
>   /* Domain IDs (param2) */
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> +/* PCODE_SCRATCH0 */
> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> +#define   HISTORY_TRACKING		REG_BIT(11)
> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> +#define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> +#define      CRITICAL_FAILURE		4
> +#define      NON_CRITICAL_FAILURE	7
> +
> +/* Auxillary info bits */
> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> new file mode 100644
> index 000000000000..077422ae009d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_survivability_mode.h"
> +#include "xe_survivability_mode_types.h"
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +
> +#define MAX_SCRATCH_MMIO 8
> +
> +/**
> + * DOC: Xe Boot Survivability
> + *
> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> + *
> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> + * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
> + * survivability mode and provides additional information required for debug
> + *
> + * KMD exposes below admin-only readable sysfs in survivability mode
> + *
> + * device/survivability_mode: The presence of this file indicates that the card is in survivability
> + *			      mode. Also, provides additional information on why the driver entered
> + *			      survivability mode.
> + *
> + *			      Capability Information - Provides boot status
> + *			      Postcode Information   - Provides information about the failure
> + *			      Overflow Information   - Provides history of previous failures
> + *			      Auxillary Information  - Certain failures may have information in
> + *						       addition to postcode information
> + */
> +
> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> +				   int id, char *name)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	strscpy(info[id].name, name, sizeof(info[id].name));
> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> +}
> +
> +static int populate_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	u32 capability_info;
> +	int id = 0;
> +
> +	set_survivability_info(xe, info, id, "Capability Info");
> +	capability_info = info[id].value;
> +
> +	if (capability_info & HISTORY_TRACKING) {
> +		id++;
> +		set_survivability_info(xe, info, id, "Postcode Info");
> +
> +		if (capability_info & OVERFLOW_SUPPORT) {
> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
> +			/* ID should be within MAX_SCRATCH_MMIO */
> +			if (id >= MAX_SCRATCH_MMIO)
> +				return -EINVAL;
> +			set_survivability_info(xe, info, id, "Overflow Info");
> +		}
> +	}
> +
> +	if (capability_info & AUXINFO_SUPPORT) {
> +		u32 aux_info;
> +		int index = 0;
> +		char name[NAME_MAX];
> +
> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> +		if (id >= MAX_SCRATCH_MMIO)
> +			return -EINVAL;
> +
> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> +		set_survivability_info(xe, info, id, name);
> +		aux_info = info[id].value;
> +
> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
> +		       (id < MAX_SCRATCH_MMIO)) {
> +			index++;
> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> +			set_survivability_info(xe, info, id, name);
> +			aux_info = info[id].value;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void log_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int id;
> +
> +	drm_info(&xe->drm, "Survivability Boot Status : Critical Failure (%d)\n",
> +		 survivability->boot_status);
> +	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> +		if (info[id].reg)
> +			drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
> +				 info[id].reg, info[id].value);
> +	}
> +}
> +
> +static ssize_t survivability_mode_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	int index = 0, count = 0;
> +
> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> +		if (info[index].reg)
> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> +					       info[index].reg, info[index].value);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +
> +static void enable_survivability_mode(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct device *dev = xe->drm.dev;
> +	int ret = 0;
> +
> +	/* set survivability mode */
> +	survivability->mode = true;
> +	drm_info(&xe->drm, "In Survivability Mode\n");
> +
> +	/* create survivability mode sysfs */
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
> +		return;
> +	}
> +}
> +
> +/**
> + * xe_survivability_mode_required- checks if survivability mode is required
> + * @xe: xe device instance
> + *
> + * This function reads the boot status of Pcode capability register
> + *
> + * Return: true if boot status indicates failure, false otherwise
> + */
> +bool xe_survivability_mode_required(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 data;
> +
> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> +
> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> +		survivability->boot_status == CRITICAL_FAILURE);
> +}
> +
> +/**
> + * xe_survivability_mode_remove - remove survivability mode
> + * @xe: xe device instance
> + *
> + * clean up sysfs entries of survivability mode
> + */
> +void xe_survivability_mode_remove(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
> +	kfree(survivability->info);
> +	pci_set_drvdata(pdev, NULL);
> +}
> +
> +/**
> + * xe_survivability_mode_init - Initialize the survivability mode
> + * @xe: xe device instance
> + *
> + * Initializes the sysfs and required actions to enter survivability mode
> + */
> +void xe_survivability_mode_init(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info;
> +	int ret = 0;
> +
> +	survivability->size = MAX_SCRATCH_MMIO;
> +
> +	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	survivability->info = info;
> +
> +	ret = populate_survivability_info(xe);
> +	if (ret)
> +		goto err;
> +
> +	/* Only log debug information and exit if it is a critical failure */
> +	if (survivability->boot_status == CRITICAL_FAILURE) {
> +		log_survivability_info(xe);
> +		kfree(survivability->info);
> +		return;
> +	}
> +
> +	enable_survivability_mode(xe);
> +err:
> +	if (ret)
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> new file mode 100644
> index 000000000000..410e3ee5f5d1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_H_
> +#define _XE_SURVIVABILITY_MODE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +void xe_survivability_mode_init(struct xe_device *xe);
> +void xe_survivability_mode_remove(struct xe_device *xe);
> +bool xe_survivability_mode_required(struct xe_device *xe);
> +
> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> new file mode 100644
> index 000000000000..19d433e253df
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> +
> +#include <linux/limits.h>
> +#include <linux/types.h>
> +
> +struct xe_survivability_info {
> +	char name[NAME_MAX];
> +	u32 reg;
> +	u32 value;
> +};
> +
> +/**
> + * struct xe_survivability: Contains survivability mode information
> + */
> +struct xe_survivability {
> +	/** @info: struct that holds survivability info from scratch registers */
> +	struct xe_survivability_info *info;
> +
> +	/** @size: number of scratch registers */
> +	u32 size;
> +
> +	/** @boot_status: indicates critical/non critical boot failure */
> +	u8 boot_status;
> +
> +	/** @mode: boolean to indicate survivability mode */
> +	bool mode;
> +};
> +
> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */

