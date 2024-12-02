Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C49EE69E81
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 18:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113A58952F;
	Mon,  2 Dec 2024 18:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dpx6e5fn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2D48952F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733164384; x=1764700384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BUtfzLMDRkpJHXiJv6Xp5KgMnGZiPU+9CI/GUr/3/+A=;
 b=Dpx6e5fnkUbnVut5ESTyonPSTFpb3CYTvj3WapWwph6AXXSVTUoga0Kx
 SOy1aXVTzFcbc1527DFNQ0HBu6ObAQlCk4fcEQB7FQU3vK0GTVPoc53tm
 P3LOpb0nvGy4xtSXKg7dOG9azEB9OI+NB90ttnrVUjsEqbWMm6xStRkxI
 g4prsYcgK6umC4XzfRwmorbAhwgmChVK1V1EuyGd66qKaelWnMs7obW9m
 1H4QrI9ibrVruerj78bHi/UzfGftNHU5MmQx+SDXV3SAf/KvMEx3f/Tb6
 hqBJU4cVGXkAZB/PWydVhBrIgkr1ZebfprH06TUyRlOepr14pxFlwUhKQ A==;
X-CSE-ConnectionGUID: EZKUyACVRAq+2ImNcu1IqQ==
X-CSE-MsgGUID: Hd+lqLtrQnmAJgL7jqGbUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33595074"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="33595074"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:33:04 -0800
X-CSE-ConnectionGUID: XP/GzuswQwO+C7TuapVanQ==
X-CSE-MsgGUID: RsuMFk8VRkqz7bOLugncFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93591265"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 10:33:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 10:33:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 10:33:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 10:33:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJYneq9/n5tstJ28W0reQQOj9jUrFMInQbFlMX2gG1KroAXA06k/VdtheMPtE/bPamNdnO/CALa++k6AEy+j3N9gCWO12lSNUdh/aG9Ybhybfe3NcXYmim+TxlnFCEDlgksSGJB3zmZYoHu8A7GxhVRy1GIxiZEUHHyvH3jGfAPORTeELHwaENV1arYV8qxJ5PZIcYsZ4L+kjWEIk+x3ER7CmoOxcteuPlRPb75jzaifPh1qGJEhc+dOSlK4LJnvS1sk+zGvWyB5e+aZscOi2eJTC/FkONpR+SPmDg56wuUINcsdU/R+JZoPM7KgeWSw5/rscC5qYtsWoFAKLbRkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcR79Fl9ElTccY5LBgXqbbyrwIRklWPxFb2iSuxBrfE=;
 b=UTcuOjCiSeRsG1iRHqGvBIf2S/lxxfY5lSCgtVMj4pnkeNsgMy8vdDES+Xlup6nsIbd9HpQdgoTED322phUYt4707GV9v4bQg15IQXdVVsyFelYkizy40BrqpQNrnvPU6YnynJQcNe3qxhLF6tfQvMIGSqlC4+Zde8Xu11YFgau/F//9E7KuS0iIx3vWhyxj3mQHvwtsjhtIO4F9q6y00+GF54zPF1mQiAsswGUgwmHrJznfUkD5TY2UgebejGgBSf1PGyF1LCjZpG9PTCywbHaJZ2+FxZEnq955zBTMHqm4hShGbBXjMXs0Eye75TnEL1/QL8MQXDOOer+uSFlSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 18:32:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:32:59 +0000
Date: Mon, 2 Dec 2024 19:32:55 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH v5 1/5] drm/xe: Make irq enabled flag atomic
Message-ID: <20241202183255.glrvcigzprouhklw@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-2-ilia.levi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241128125345.1115-2-ilia.levi@intel.com>
X-ClientProxiedBy: MI1P293CA0027.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV8PR11MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c9aa2a-dbda-4eaf-b952-08dd12ffbf38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGNrWjlNVGF2c2pZUkRSNlJscU9aUE9qZEZ0SGhlQzgyUjk0bVEzVTROVGpz?=
 =?utf-8?B?cWx6VmRNQ3FPNUdtMGVKOUM3eTZidyswNUNRN0dNYUlXL1J6bE9ZclFIUU5K?=
 =?utf-8?B?eU9JUGhveW5OVkJwSXVHQlMwSlBGVTNnNC9YS2ozaXZuNGhMeW04NHBhQWFE?=
 =?utf-8?B?c3FnZ0RSQ0ZhYVBzaU1xWmcyYXpsZU4ybzhxR2IyaWttZ0k4TzNMTm5ZZmVt?=
 =?utf-8?B?czBHb0VTK1lVTWJDbTl1V2djVHg3Q2h0MVA2MlAvRHJCMnFObXBXejRaK3g3?=
 =?utf-8?B?dEZESmR2VHBCaVRlQmtXdHFibUlGVHJXeTB0V3JKQUwwTWsvMXVpdVErTHFG?=
 =?utf-8?B?bFAyVSt0SmtOSVNZMGxzaUdubnF4akpzOFUrdVhINlZNYW5CY2tmSHhWa2Zr?=
 =?utf-8?B?dDBzWE4zV0M2V1oya0dmT2RLdkhPbE1jUGpxYlM0ZytXZi9VRlVkeXhLYUpz?=
 =?utf-8?B?RG1SWWE0OVNwMnIzNGJtdjNydmtGcnVrT2pRQ2V6SmFtdWFOdDdoSmlERVQv?=
 =?utf-8?B?NGc0dFpSaVRySFY4MTN0VkR6WmRpYXNDaHFYRmxYU21ybEdXb0VJTFZtaUJE?=
 =?utf-8?B?T1AzZFJ5SS91Q2JYYmxkUkFqaVFCdlFwSmExVCtDZFlIVGNNRW1KQ3lRZjd6?=
 =?utf-8?B?UFF5QUxyY2pBZURMNmZpLy9YV2JUcVhSY3E0aTJ0ZDd0aUxUVTN5U0laWFlB?=
 =?utf-8?B?MDRXOHdtSnVSTzN6WWxXTlhsN0RSMUZrUWNQRGtNWmRaQ0xVaE9Oa0NSeUlI?=
 =?utf-8?B?dWplSnBJM2FZZmNmbXdrVEpGNk51N0QvcVNpM01tVE13ZFlCWDUzMzZXa1pm?=
 =?utf-8?B?WVJLTS9FdkNBWVJYdVEwNzU5aENCZXJHdUtBTk9ZT0cvbjA4VUJTdGV0S1lB?=
 =?utf-8?B?RGtJTmQwYU0wbjR4WGcrMW1vaEw0V1lOOXRBMVY3dmFlM2FFbGRjckxzU0d2?=
 =?utf-8?B?L281L3ExTkFoQkV0Mk1wTHdIb0lWc3hNc2k3WVdtZ1FKNFMxdUp6RkxsaGps?=
 =?utf-8?B?OW5RRXluS09DbFhtT0JHZndRRWI4U1NaQXdNMkpCTzRrSWNKZkMrc2ZpazI0?=
 =?utf-8?B?ZDRWajdad0l4NTg4RHY1aEt0VnR2Y0JtTjNRczhBSEIyeEN6UXhVelVOZFJr?=
 =?utf-8?B?V2dSaUl5aWJ3cm14VVBOREwvL2Q0MERzTWxuUnZmMlZwRnU1ZnRtdHlOa1lX?=
 =?utf-8?B?NEpubm9uSkIvUjZWVkV6TmdFS1U4MXlrazlaSGZvYmNSTDRXY1JlaHpvQ0Nu?=
 =?utf-8?B?eVZqWS9FenlXM0tqV3BOQU92ZFN3WlM3cDRla0VPQ3lTbzVEQTZ4WkRLSkpX?=
 =?utf-8?B?QWdSTW1EUTE3NUZYbmgyaG5jMVdrdmM4djEyWFFidDJnM1ZhVDJLNm5yUDNC?=
 =?utf-8?B?K2lqaWRIT3dlNG9CR0QrY2Qwcm01d0JzSkZWTm9RRjJ5YXdsR3R5ZVk4YXVG?=
 =?utf-8?B?a2tLRzFKL1VCNkVoVkxPWHFyb1pFUmNURnZWdVJIUWt4UDh0Qkl5ZFFWbHFD?=
 =?utf-8?B?VFE3NmVwaGFuSGVqSGZDTWNHcmJzdXByZnEraE1BSlJRMEV5WjZURThxejZl?=
 =?utf-8?B?Q3JOSjJNTVBvZDNQYkNxWEQxdEQ4ZWh4R00xWVJVelhRNVptNWEwRkNzK2pS?=
 =?utf-8?B?enc3WjlhcFYwZFVQQW8zdzIyaW1OTW1UK2JKRXpJdldEZTZLSkxObWNxQzNG?=
 =?utf-8?B?djZwVlViSDJTSzBxaitNclVyNUVTRXpUL1NTNk5KNnpOc2pic01NTyt6YUhQ?=
 =?utf-8?B?WXJIamdqczNXbmdnQ3JTaWdBVmdyam1QNEk1c1NpUmpQemlEaW8yK05FTlhj?=
 =?utf-8?B?Y0QxVWdsU1BsMU1zZUIrQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhNSVJuMkZPcTVTMmZlZ0YwbHRKVUVBVHlWUTdYd2FIUHFFMmxiOTYwdHRx?=
 =?utf-8?B?NGxucThQNWF6VnJIeTA2NDdzWWRZaWRPQkwwY2NRV1NFSTQ5OHZJZ3p5dS94?=
 =?utf-8?B?T241MGpvUWZVQ0ZqWVhrbjlJR0NSTGRSd1Qwa0FqNTIwbFlxZ0lOTlBYRzVB?=
 =?utf-8?B?M1djb2gwZVMvVy9acWR0cWYwaTZ6WkFIcWJkUkdnc1Vqd0xxbHB5dlduclZU?=
 =?utf-8?B?UUJUUThFWC8rTG1xUnZMZ21jQ1EwRHZKb1Q5Q1FiMG1henYzZjlhbUVQYmox?=
 =?utf-8?B?V0Iyc0EzQ1FEMXNSbE40QTczTVA4bFgxS25zQWdwcnFLK0hzVXA1UXR5Z0dU?=
 =?utf-8?B?MmtqMmhUY2Q2SWYyaHhyMWx1MDQ5b3pmZU9ORjh2M3lybTdVTGV2UjNDQWFJ?=
 =?utf-8?B?eGpSU3F0OE1mQWx1ZlVMYTQ2azRoWDg3WndwZVZIZFVvVFAyNS9ibDM1RERL?=
 =?utf-8?B?MGVmOVFGT1FXSnVORkV0NVhaTlUrMnZBcGhlL2lQQmQ0Y0NxU0JUUGEyNDM2?=
 =?utf-8?B?RmxWZjJMNU51TG5nZ2Vqd2V2SFIzY1hjdFJGZVJxTkVRU3FZaDRyckltSGlt?=
 =?utf-8?B?ZVBrVWgzN1Nmc1FiZEtXWkFVTERDZFR6RWY4RmNwTnp0T2RUeWt5Z1hEck9M?=
 =?utf-8?B?b0xsVGJrelRMSDkzVkZDa3ZOUDJ0bW96VlROOVV0UUNPU21CK1RMRzUvUnBh?=
 =?utf-8?B?VStpeGVQS1MyZXRJSDcrL25XMXBFMzFrREpLNjhnNi83amllYnI0WUhIbkQx?=
 =?utf-8?B?MUsxall0YmFEMnZlRkoxUy9hUDA2RktkankwYU9jU1JSN1FVVmdKQVRRZFpq?=
 =?utf-8?B?VURSOVhkZ3JpNWFhbGVHYnNYcklibXBKWmRtTWhQbmRIRmZIT0hZVTNOY3NX?=
 =?utf-8?B?QkdpQlk1K0lyNTQ5ZjdSWk41aUNXcGU1QXFlU2NiSW44aDR2NHJxTkVBUjlC?=
 =?utf-8?B?SmcyUU9WejNKN3g0Y2JNdjlhRTQzZ2RkcHordU9OV3ByWUhYQWh3REhvQnR1?=
 =?utf-8?B?RnBGZi9DV0xiZjczcG9FdWdGZkVLRG9waFo0WkRsWkhmaE1URVg2WGlDTzlZ?=
 =?utf-8?B?WnNpSHl0NG1JeDBhdmZxRFRzRkZXeTRhMkVHenJBYk9tVlNwNjF6Uzl6WkRl?=
 =?utf-8?B?UTdxR1UyWnNBVDJXY0NEbHVDMGhOTU1jSUdxUmFKZ1VuaHFRV2UwMlpiOXdT?=
 =?utf-8?B?YldEcnM4cFVDczd0WTZTWjNLekFIdGlQdmd4RGJrVTkxbWJMbEdQTURjNTE1?=
 =?utf-8?B?NkJUMDJ0T3VhTHVtc2poSjdhTkg4YWhWb2VKY0FDV3FXb25iZ1ZnVjFqWnk1?=
 =?utf-8?B?czZhSTRFY3VCc1BKR0ttOWZraWE1OEVQQ2ZPRkdUaFpKWHEvdVhDdkMyUVZ1?=
 =?utf-8?B?cVRTT1RNWk5pZnpBV1Y3UU1sSmQ4RUcwWEVpK2dEQzBZTXpOTDN5a1Z0QW9l?=
 =?utf-8?B?NnZVMDlPTjZLc2RRWlhoTFJ3S1VjeHZVcjNXRUtoaUlMZTVJN0F4YU8rNm1J?=
 =?utf-8?B?bzVjbUswQkgvQlpEa010WEJVTFNVUWY5dnlEYTJQZ3BHVTI0QXE2dG9qTW9U?=
 =?utf-8?B?UEZhTUwwMUxkbG1pTUhZT0s4ekprdmhIaG5QNjJlR0gyL3Z3NndTbEY3ZDIw?=
 =?utf-8?B?dmhCZW1NK2d2YkxHWmJQLzBRSkl2dG1kMWpJOW51TTU1NzhydUR0L1BRR0pT?=
 =?utf-8?B?czdRTjkyYlhXNkdncGN1S2M4TEpKR0hvUHZIdlptbmZreVlsM3VtQzdOY0RK?=
 =?utf-8?B?ZU9TU2VuTG16RnRUeVpLdys0bTVJNXhGZ1ppcUZ0V20wMzgyUjlUM3BOT21H?=
 =?utf-8?B?VzF3NkZuSjNPdkd2ZnFiZlM5TlVXVXBtUFVwNlNtbVhkNDJGRDREYVhmUUY2?=
 =?utf-8?B?bGhqY2k3Ni9VRSs5MU5FdmNUNjlFNmt2M01vK0ZwUHJuSEtlV3plUGZDNHpN?=
 =?utf-8?B?c0hjTnVTTTJjblBFdXBBb1RIdWRVcm5ZUU1ybjYwMVA1U0Irc01sd2JBRHFa?=
 =?utf-8?B?SnRwRC9iQm51dittR3VkT3BkZDllQ2hQa2p1UkV3cnQwZlEvTEs4TW90NWRo?=
 =?utf-8?B?Q3ZaYUxBbVdYcHprUXJDdDV2OExSYkRYTE1hUldDajkvTllXT1JIekc2K1Fp?=
 =?utf-8?B?VU4wekZ6QlI2N1kxUVY2UmtuRGhEV0NxbVArTndtb3U2ZGw4cTlZSElJYnA1?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c9aa2a-dbda-4eaf-b952-08dd12ffbf38
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 18:32:59.3461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HoEcOrVwW4eUHdm3HESNAAuMyLpXlDI1qGAq4ijq8idjf6ngBh0o/wtYoinKw/ScCZsyeGwQDZpUUCkp3zcfpbn3Dtfg1OFrAo0fEIRftU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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

Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:41 +0200]:
> The irq.enabled flag was protected by a spin lock (irq.lock).
> By making it atomic we no longer need to wait for the spin lock in
> irq handlers. This will become especially useful for MSI-X irq
> handlers to prevent lock contention between different interrupts.

I am not convinced that you can simply replace this spin_lock with an atomic.
Note that this spin lock is also used for whole blocks in the irq handler
(for example gt_irq_handler), and not only to access this flag.

Thanks,
Piotr


> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h      |  2 +-
>  drivers/gpu/drm/xe/xe_irq.c               | 29 ++++++-----------------
>  3 files changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> index a7dbc6554d69..0c0f4533c34f 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> @@ -64,7 +64,7 @@ bool intel_irqs_enabled(struct xe_device *xe)
>  	 * But at this point the xe irq is better protected against races,
>  	 * although the full solution would be protecting the i915 side.
>  	 */
> -	return xe->irq.enabled;
> +	return atomic_read(&xe->irq.enabled);
>  }
>  
>  void intel_synchronize_irq(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6a04f975ec16..7ee114c17552 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -347,7 +347,7 @@ struct xe_device {
>  		spinlock_t lock;
>  
>  		/** @irq.enabled: interrupts enabled on this device */
> -		bool enabled;
> +		atomic_t enabled;
>  	} irq;
>  
>  	/** @ttm: ttm device */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7bf7201529ac..1c509e66694d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -348,12 +348,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  	unsigned long intr_dw[2];
>  	u32 identity[32];
>  
> -	spin_lock(&xe->irq.lock);
> -	if (!xe->irq.enabled) {
> -		spin_unlock(&xe->irq.lock);
> +	if (!atomic_read(&xe->irq.enabled))
>  		return IRQ_NONE;
> -	}
> -	spin_unlock(&xe->irq.lock);
>  
>  	master_ctl = xelp_intr_disable(xe);
>  	if (!master_ctl) {
> @@ -417,12 +413,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  
>  	/* TODO: This really shouldn't be copied+pasted */
>  
> -	spin_lock(&xe->irq.lock);
> -	if (!xe->irq.enabled) {
> -		spin_unlock(&xe->irq.lock);
> +	if (!atomic_read(&xe->irq.enabled))
>  		return IRQ_NONE;
> -	}
> -	spin_unlock(&xe->irq.lock);
>  
>  	master_tile_ctl = dg1_intr_disable(xe);
>  	if (!master_tile_ctl) {
> @@ -644,12 +636,8 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
>  	struct xe_tile *tile;
>  	unsigned int id;
>  
> -	spin_lock(&xe->irq.lock);
> -	if (!xe->irq.enabled) {
> -		spin_unlock(&xe->irq.lock);
> +	if (!atomic_read(&xe->irq.enabled))
>  		return IRQ_NONE;
> -	}
> -	spin_unlock(&xe->irq.lock);
>  
>  	for_each_tile(tile, xe, id)
>  		xe_memirq_handler(&tile->memirq);
> @@ -674,10 +662,9 @@ static void irq_uninstall(void *arg)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int irq;
>  
> -	if (!xe->irq.enabled)
> +	if (!atomic_xchg(&xe->irq.enabled, 0))
>  		return;
>  
> -	xe->irq.enabled = false;
>  	xe_irq_reset(xe);
>  
>  	irq = pci_irq_vector(pdev, 0);
> @@ -724,7 +711,7 @@ int xe_irq_install(struct xe_device *xe)
>  		return err;
>  	}
>  
> -	xe->irq.enabled = true;
> +	atomic_set(&xe->irq.enabled, 1);
>  
>  	xe_irq_postinstall(xe);
>  
> @@ -744,9 +731,7 @@ void xe_irq_suspend(struct xe_device *xe)
>  {
>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>  
> -	spin_lock_irq(&xe->irq.lock);
> -	xe->irq.enabled = false; /* no new irqs */
> -	spin_unlock_irq(&xe->irq.lock);
> +	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
>  
>  	synchronize_irq(irq); /* flush irqs */
>  	xe_irq_reset(xe); /* turn irqs off */
> @@ -762,7 +747,7 @@ void xe_irq_resume(struct xe_device *xe)
>  	 * 1. no irq will arrive before the postinstall
>  	 * 2. display is not yet resumed
>  	 */
> -	xe->irq.enabled = true;
> +	atomic_set(&xe->irq.enabled, 1);
>  	xe_irq_reset(xe);
>  	xe_irq_postinstall(xe); /* turn irqs on */
>  
> -- 
> 2.43.2
> 

-- 
