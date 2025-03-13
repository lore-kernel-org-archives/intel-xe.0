Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21786C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 06:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50310E063;
	Thu, 13 Mar 2025 06:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PixTsrEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7490F10E063
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 06:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741846778; x=1773382778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pld6agRxKy+wLJ8NM88J1XAW6fQRkEEV8h+mYQxAVd8=;
 b=PixTsrEBVzgTvSq3FoAPv/StxjUiCoEvwcR/qytfRa+dE0Ps3GU9oDMJ
 tc1isTxnMHjPunt4UVISQKyegeU5y3gNgXDru8astWu1Xc/3EZIzYUFo2
 oSb9ercdSzSlAeEQ4JsZKULbbO8Kon0uVdIEiplPSzA+ubLNJ4ReDM7I7
 4VQCoLcKN5Mr2pOeWB9JuI0aiyDMSmqAeTrRinwHHLmn33ivNH9RBsL+0
 XP/8KPsWCeEcdewl+yfkK0012Q9OH+g5Ys7yjspj6Hf4wceICtJ1f+YBP
 qHY3NjfhkKjK8TrtnoV0BB/Sob6kPmrR6IeQ27KuL8veyTyarAdPvJOXg A==;
X-CSE-ConnectionGUID: HDComq5CTpmBLPLIFqdD0w==
X-CSE-MsgGUID: 17q1TDDxRcqSAfyGRTQVZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46731381"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="46731381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:19:38 -0700
X-CSE-ConnectionGUID: 7RftTamcRsSloaNFXWLQGw==
X-CSE-MsgGUID: NPxcxLzxSdOF/GueRcAzIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="120576395"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 23:19:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 23:19:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 23:19:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 23:19:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hy9l8gjqb4E1AooBYHZxidDboCI4MnSwN5VG9qt411jLYgmKATva5vpTnkfYDTunIu5KAXCkapZr7YVuliCPV2KZJJn0vngbmU15u4u2HkqO4ZeBpkQ148RHK1pZftY6T4UAJVIc1Y7WKhTQULCva1ISjeSfaf3hwOp5Hpv85Jyx8rvxU3yorYCY/fxYjd7ZvdVLcp6mpPFdyo1x98NDXwUUbkGrnINGvXdwlOxf5fM3GWvdZuyyr4uQeddOW99dCLQQ/eUT+hjnfG8KXKLDPFo7I4y15zP9KS8s37W3s7gdOvXzl+4euoVl6tFptUYi5D1UvM3IMxGPOoHZEVefSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObbMB2Ogrsde6C20jjg1MfYpErsOoJsKQX6aWMmPl7o=;
 b=YCpHN2SYGHKGxodd8YQw735DiWjFdcuBZ68vCwarbOySHZGBnb8AZBq9gyQ2/fQzEDF4QEnhyTVpnIioGMRjHdl6xSfdhseFXqqD/GPdW+e0CQLq2Kch4X0ZcTJbV6GRcffMAMiM06ZBNheYdSaQKK+TjnUzJ2oiY/T3y+TXpv+QG9s5nBanBZFdVF8XMGUQVfP6Vxmf6jdYK9sjGEXCKQ/UI+qgRU7kh05ZwCyzr+DVLUf7pMvvUm7PCteozy5cNxkdyRQ5u3m9iilWUX/AaWhIVsQuZMA/8k4GF12tDRyqSJz0lWOy8QQM21NEWyY/JNBonrDpHTOriHGPTIWZgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.28; Thu, 13 Mar 2025 06:18:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 06:18:48 +0000
Message-ID: <8e2ecdef-8709-4b9a-a79d-21da5429ee24@intel.com>
Date: Thu, 13 Mar 2025 11:48:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <lucas.demarchi@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <6d82e345-aef5-4629-b7e2-4b9281d919ea@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <6d82e345-aef5-4629-b7e2-4b9281d919ea@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fd1a18-897f-4c2d-ecf5-08dd61f6ea55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eitpQk5HckZ3SkdSRnVIMlR6V1hTdHkrNnNBT2l3Z241U0VaNi9RNS9ibkZ5?=
 =?utf-8?B?bzJ4OUFoZzZxdDlFbWdhcTYrM1ZjYTJLTW5XV3kvbExJVGxYWWkvMiszOGlp?=
 =?utf-8?B?MUM3VDBFR3paTWgwSmtMM3R1emVYOEFacytrUG11eGM5RzFMRGpaOWkvV0RC?=
 =?utf-8?B?SkRSQ21DUmxNMW5jVUtYRzlGaUwxckkvS3Rnbnl1bW8wS3JDQWlQUWVnYXhC?=
 =?utf-8?B?emQxNncwM0EreXRwZC9ncUlBNXlydGJOQW1YZGFjSWh3QWNmQzFzY2kvanhK?=
 =?utf-8?B?TkMzZjljc3JieElPUmg4dndCRFh5b2hLMmJ5OVZ1bWwya2N5NFB3dm5KRjZ6?=
 =?utf-8?B?ejdidmJBRkorVFh0MExhWlNwZzRvMjdaejExMVdSTk5ZQldtQ0Njb1ZNSDVz?=
 =?utf-8?B?RE1NTXdic2sxdWp3dFh5RXBUdDRLN2RrVXpaaEgzQTFjODI3OExWV2Z6eHJB?=
 =?utf-8?B?bHpGL2k0eHJWK3V2RWdnYjZ2QStzR21wM0c5UDJYdUJlTnJkZzN2STV3RGpa?=
 =?utf-8?B?MDdhSlg2b3pGcFExeW5TMHY0ckEyOVJHeWYrQVpyR2ZYYVpEM2lpYjNoR201?=
 =?utf-8?B?aEdoY1VPU2hhaXpQT2svVkRERGZkbUhQbyt5UXBUY1piU1RrcHBsMkYxTjFV?=
 =?utf-8?B?SGxiTDlXNWhmTkV6YWtKUXVjWEhtRDEvWWdSMjd1S2dPWFM4ZHVEaVoxak14?=
 =?utf-8?B?bmk2QjhnL3hiS3dla0xwRGtnMUdDeW5IYjQ0SitXbEtiYzNnTmhUUThZTSt3?=
 =?utf-8?B?bTJWdEtHdVZvZmMyVFdxdDd5cGJVSWJqOTRHdlNjYVBMdkNwY3ZoUFNzdHlF?=
 =?utf-8?B?YUVuZTFMNThUZnlLMVZzNFFXeWw1WkFaZXRwTkZvNUZYWHJMYndQbTNHMjQ0?=
 =?utf-8?B?WThITmNFQXVQeFFhTUExbnFDYkNDdFg2aEZjQWF1aVFsakFZd1ZPbkNDb2Zn?=
 =?utf-8?B?WTR6S093ci84Z2YvdTMySWF0OWV6Z0RyTTA0NVFBbXBZb0ZyTHhWcGtwVGo5?=
 =?utf-8?B?elYxeEx1TGRzbm5zQ3IyVE9uckJqQ2hwanVOVjg4bmFtMS9nYjZWclVZUEV3?=
 =?utf-8?B?RndISEpCTkRqaTdGSklPQlRMSjhoeSs5NGtuaEkzYVZENHRXS2ZBbVZtcmlL?=
 =?utf-8?B?REtDTXFMOU44bVVIZmFyS0NEc2lvaUlGbHZMQUV2clpWSG1UdERLcGVzRldJ?=
 =?utf-8?B?eVcvV1Z5UHhQNno3L2czVmVYL0gyQnlXVWFjSGNqeVhVNHFOeXV5WUUySGo5?=
 =?utf-8?B?ZGxZeVpnTDFSeXR3Q0xyc3hpVG5Naks4K2xIYXVkdEVyWHRPaW9ybkg5U0Yw?=
 =?utf-8?B?OXdJbldpbFdhQzR4VVV0dHIwMWNJakJ6UzQrQUlmaDdaZDBsWUdDK1JKVHM1?=
 =?utf-8?B?WWgyUW5FVlV2aFNhaDVoQ0V5eEF4OFhiK0pCYmVHUG53WVh5RmJFZlM4VW9N?=
 =?utf-8?B?dVBHbUF0RE5kRzdrK2VVTXB0RkxyUFlFcTZZRU9SZ213bzFIWjdrLzJiNXMv?=
 =?utf-8?B?WCtzcjBONHRhUForNnlNeFFmWC9vWVFQK2QyWmY5RzM5QllqU1dLMGV3L1ZT?=
 =?utf-8?B?STNaZEw5MzJLRlZFTkU2YzBUU3hjL0UwQkZCY2h4ckN6dnF2U3huTzB0T05z?=
 =?utf-8?B?THBVMXR1ZlVJWFl4TTgwQzNTMUFIdTZScFVuY28zQlEzWVBjT0sveGRGTTFm?=
 =?utf-8?B?R3RUMG5sRnN4UUNjN1Y1UWlhUFVjeFpjTllrRDJVY1M0VThSeW1oRTNrb1E2?=
 =?utf-8?B?V2Y3blg5KzY2OEJkQytWZWFGaWNXQ0hsOC9SYUMyVDNUOHgxL0lsdng0RFdU?=
 =?utf-8?B?emJHYVkyREI5cldoTXZTM0RhY2dmbUxBNTBDd0orcFl1QjZ3MyszQy9hYjRE?=
 =?utf-8?Q?N9W8PflCqMAF4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckFRSHI1dTNEaEN1NzZJYnNoVEt1U2M3L01pRUNMejdSKy9zb1UzMVgybmor?=
 =?utf-8?B?UnlPbnNEdW93Sm5aL1NQa1M4WVljYjI1Y2RxTFZkUXVsS01hdzV1NC9VdFl3?=
 =?utf-8?B?T3FDbjQ5WVhLbTErWFZzR2hlaGsxM0JWRkk4Z1hrendpTG1mZ0dWVm1QRzZk?=
 =?utf-8?B?QWluY0pwTW5TVFRXalZrTGt5N1NNNXlIUXJuYTBPSlo1d2V4Y3VnTFhlQWxI?=
 =?utf-8?B?YzhyYUdYVTJCbG9vU2VlZ1ozMCtaS3E1K3RxTWtYWUxiZnZuS3FJTllUOS9n?=
 =?utf-8?B?SDM3dy93M3JaZ3VUeFRZOUtsYkFybHI4VEtYandxbDFoY2RuS1cvNzlCa0VT?=
 =?utf-8?B?K2tIN1ljSUc1eHZ5MUpPaHFWUzh6aHdsTFhGU1BsSkhVRmljZWRBWnlUV2Uv?=
 =?utf-8?B?NzhPRE9saThEWlhJS1lhNklYcUM1RzgwTGlESEkxMnB4UStVaE56Ti9PREtP?=
 =?utf-8?B?VFVHakhMTW4wcXo1KytQN1NJSlVJamRkK0FMUWc4YW1RcUxqckYzbTRyd1Va?=
 =?utf-8?B?RUpVdkcyMVpuR25rUjJVeG5hanNLN1h2Zk9zNnJ5WXdtU0ZHcm1taFNuOVEv?=
 =?utf-8?B?c0JFNlJ3T0xrK1ZPSWI3S0Jlb3hZMUgwTkVESXY1VDhPWDhESGwzd3dqbXFx?=
 =?utf-8?B?cHJWVU9HdEhSUy9GSVptdXVTV3NPUUdMdEFkN0Jac2ZpOW14amtJTVFTK2Z2?=
 =?utf-8?B?VStySWdidThlcjMxMmVxTVJmelF0S2w1a0tHcE5TRFVtQVRwZ3Zld3BVaTdH?=
 =?utf-8?B?MEd3ZUlsbzNmSmpZd2RiVGdlUk5IcjBSbDdRY0J1akNDYkhTaVRlYUM1UVJv?=
 =?utf-8?B?REYzSkd0cnZsTjJyd3ArR0oxcDFGZW1BKzdXL1VodzRRcE5kWWlOd1BteGVG?=
 =?utf-8?B?NmVJRGhEaHo4K0tGY0loL3hQL2VJVXFlRWd5NjZIeVJ0bHNMbGMxQ3JTS3N3?=
 =?utf-8?B?dG9vZ2hUMk11SExmTDkvWHJ5M0R2aFNEUGJBSzBaYXdTV1lhc3ZpSm0wWjhW?=
 =?utf-8?B?cnBIL2tvaE1FcEVzSUozMFM4MGVjanNnZGd6Wm5adm9HS2xmWnJMczlUVTRj?=
 =?utf-8?B?TkFNUlB1R1B6UUdtVmhhVGVONlNsNkNiQ042Q3VzeWhuNlhLVXo0N2U5UHI5?=
 =?utf-8?B?Mk5WbGZFeVJoV0lsNTZ5Rk5ydGFVSHlnV2JQM2dyQ1cvMXVUOEpZelFPYzhC?=
 =?utf-8?B?TCtucWFZOUFicE1pS21CMjdBU1hWcUtndjlnUzJqZW1UVGIwZmU3VTR6NERO?=
 =?utf-8?B?c3NiYy9LZlR6MXZRMThnYzZnd0V5eFcrd0JqcTRXSmhidFNrU1B3M3dZNUVx?=
 =?utf-8?B?akQwOFNKaWxiYSs2VGlzbEorYzFKZDVMTXJVeHdlQzRQYnRPSHZrOW1jY1Vv?=
 =?utf-8?B?dm0yTGp3WVByVHk5bG9MbTdCUnlwNUdzbk9NbWtoUElzc0dydkxVbklrVkFY?=
 =?utf-8?B?bS85OEhiQStjZ1RtQUNUSS9rMDhZYzJzWDJCbXNOZUVrbHphRjMyMi8vMHNZ?=
 =?utf-8?B?MER4aEZBVm56Yko3RGt1VnROOHVHOXdnR0owblF2YkpidndYZHk3end6TDJk?=
 =?utf-8?B?amM0Ni9BamlmYzNJYzVVd21VeFRXTnUxWFIzbzhLbnhYTUdWdXYzMjlOQnNS?=
 =?utf-8?B?cGRCNFRXOEV3T29Jdm95RFpRS2c2WWczVjVjRm90blNhM3dCY2ZPTnJtQTBS?=
 =?utf-8?B?czFDWXZ1eU5rb1lWMHE5dU9OODRoUWdhOWZsMEhlZ2JIQm1jZ0JXZHNDRXJ3?=
 =?utf-8?B?S1NoRjdLOFJ1ZE9oZ3p1aW5EVDdVbHpaODhvMVdGbjdMa3ZZMUNnWkkzK0JC?=
 =?utf-8?B?Ty9xVGR5OUpmYmlKVUlHblhCL1pMRjRLaWJoMFc3RlcvL0JBSU94U1NtQWxS?=
 =?utf-8?B?YVFaeDU0L3VWYlRXZURnLzlCVDVWMDZaOXZlVmo4SVUxKzVRbVc0bllEeFd3?=
 =?utf-8?B?blVHejhVTkdvdXczMTJhaDh5UUcrODZpeE1lQkt5RmhkRDhpVVJiNTAydko3?=
 =?utf-8?B?c0QwQlVrb0NZRWV5WDBadms5eCsyRytUMWViOVFrQmY5Y2VzY0N0WkNONmwx?=
 =?utf-8?B?KzE2d2I3SW1oNnpLb2UvTkFNQ0szQ2VkNzJuUlpYV1dNV3lNSHNSaFNlQXFJ?=
 =?utf-8?Q?34UuakM23x7Bk2iTZuHLyO7eX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fd1a18-897f-4c2d-ecf5-08dd61f6ea55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 06:18:48.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpq1e/chLPgbVS/FC27SV7KFLgEtF39lQiUBQI4Uw3r0pOBguqlpWpTknlh5KOr1reK/PSDzQh5tb7Ir02Spiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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

Hi Aravind

On 3/10/2025 12:44 PM, Aravind Iddamsetty wrote:
> 
> On 07-03-2025 19:54, Riana Tauro wrote:
> 
> Hi Riana,
> 
> I do think we can achieve the same functionality with module param and
> we needn't reload the driver
> if we are doing unbind, Since the driver will be loaded event after
> unbind we can modify the module param

tried this.  We can modify the module param using sysfs and bind similar 
to configfs.

If we want to configure any other attributes or move existing module 
params to device specific then adding configfs seems better.

@Rodrigo thoughts?

Thanks
Riana
> and once we bind the device back it can check if the BDF belongs to this
> driver instance and configure the mode accordingly.
> 
> Thanks,
> Aravind.
>> Registers a configfs subsystem called 'xe' to userspace. The user can
>> use this to modify exposed attributes.
>>
>> Add survivability mode attribute (config/xe/survivability_mode) to the
>> subsystem to allow the user to specify the card that should enter
>> survivability mode.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile      |  1 +
>>   drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>>   drivers/gpu/drm/xe/xe_module.c   |  5 ++
>>   drivers/gpu/drm/xe/xe_module.h   |  1 +
>>   5 files changed, 114 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 9699b08585f7..3f8c87292cee 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>   xe-y += xe_bb.o \
>>   	xe_bo.o \
>>   	xe_bo_evict.o \
>> +	xe_configfs.o \
>>   	xe_devcoredump.o \
>>   	xe_device.o \
>>   	xe_device_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> new file mode 100644
>> index 000000000000..8c5f248e466d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -0,0 +1,95 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/configfs.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +
>> +#include "xe_configfs.h"
>> +#include "xe_module.h"
>> +
>> +/**
>> + * DOC: Xe Configfs
>> + *
>> + * XE KMD registers a configfs subsystem called 'xe'to userspace that allows users to modify
>> + * the exposed attributes.
>> + *
>> + * Attributes:
>> + *
>> + * config/xe/survivability_mode : Write only attribute that allows user to specify the PCI address
>> + *				  of the card that has to enter survivability mode
>> + */
>> +
>> +void xe_configfs_clear_survivability_mode(void)
>> +{
>> +	kfree(xe_modparam.survivability_mode);
>> +	xe_modparam.survivability_mode = NULL;
>> +}
>> +
>> +static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>> +{
>> +	char *survivability_mode;
>> +	int ret;
>> +	unsigned int domain, bus, slot, function;
>> +
>> +	ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>> +	if (ret != 4)
>> +		return -EINVAL;
>> +
>> +	survivability_mode = kstrdup(page, GFP_KERNEL);
>> +	if (!survivability_mode)
>> +		return -ENOMEM;
>> +
>> +	xe_configfs_clear_survivability_mode();
>> +	xe_modparam.survivability_mode = survivability_mode;
>> +
>> +	return len;
>> +}
>> +
>> +CONFIGFS_ATTR_WO(, survivability_mode);
>> +
>> +static struct configfs_attribute *xe_configfs_attrs[] = {
>> +	&attr_survivability_mode,
>> +	NULL,
>> +};
>> +
>> +static const struct config_item_type xe_config_type = {
>> +	.ct_attrs	= xe_configfs_attrs,
>> +	.ct_owner	= THIS_MODULE,
>> +};
>> +
>> +static struct configfs_subsystem xe_config_subsys = {
>> +	.su_group = {
>> +		.cg_item = {
>> +			.ci_namebuf = "xe",
>> +			.ci_type = &xe_config_type,
>> +		},
>> +	},
>> +};
>> +
>> +int __init xe_configfs_init(void)
>> +{
>> +	int ret;
>> +
>> +	config_group_init(&xe_config_subsys.su_group);
>> +	mutex_init(&xe_config_subsys.su_mutex);
>> +	ret = configfs_register_subsystem(&xe_config_subsys);
>> +	if (ret) {
>> +		pr_err("Error %d while registering subsystem %s\n",
>> +		       ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>> +		mutex_destroy(&xe_config_subsys.su_mutex);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void __exit xe_configfs_exit(void)
>> +{
>> +	xe_configfs_clear_survivability_mode();
>> +	configfs_unregister_subsystem(&xe_config_subsys);
>> +	mutex_destroy(&xe_config_subsys.su_mutex);
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> new file mode 100644
>> index 000000000000..491629a2ca53
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef _XE_CONFIGFS_H_
>> +#define _XE_CONFIGFS_H_
>> +
>> +int xe_configfs_init(void);
>> +void xe_configfs_exit(void);
>> +void xe_configfs_clear_survivability_mode(void);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 475acdba2b55..15b3cf22193c 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_module.h>
>>   
>>   #include "xe_drv.h"
>> +#include "xe_configfs.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>> @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>   	{
>>   		.init = xe_check_nomodeset,
>>   	},
>> +	{
>> +		.init = xe_configfs_init,
>> +		.exit = xe_configfs_exit,
>> +	},
>>   	{
>>   		.init = xe_hw_fence_module_init,
>>   		.exit = xe_hw_fence_module_exit,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 84339e509c80..c238dbee6bc7 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -24,6 +24,7 @@ struct xe_modparam {
>>   #endif
>>   	int wedged_mode;
>>   	u32 svm_notifier_size;
>> +	char *survivability_mode;
>>   };
>>   
>>   extern struct xe_modparam xe_modparam;

