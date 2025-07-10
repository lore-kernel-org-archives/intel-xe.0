Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12313C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 13:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FDD88F94;
	Thu, 10 Jul 2025 13:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWnEK57A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDAF88F94
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752154722; x=1783690722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r7pGMSGTKTLEbA45APm/4oTf4yQBR4wV2HzQkW9c/dA=;
 b=DWnEK57A4ykppJsdLFkB/imhD/b64AH31s5jrSNnWrveZNvZz7fiiM16
 LlSDmYnvQpjyX8IGAMHIQfmH81o2shpHxLyRUiz9GUxy1+pxzcRWayCMX
 W4y+/3KJBhYVNYBAJPhGN4iyvVZSWStWbxWFDLy65s6hySKmsWHh6wTB3
 Pvffrs0e4GB0P/keehEAKJMvCHB6bA7nZopLqPIQyWN5Y4Kt9mcreLtzV
 s6smlHdm510JFZqlcknS1uxA4fiabxggF8i8/If8hF6S0rA1/VQGZjTw6
 xBWhK74ZGIQ7DAJfJkx1TdKM5lMFlk4G3zv21ijkpfnaTv20igpIFQ39M A==;
X-CSE-ConnectionGUID: iZd0qA7iSYyf1YNmK4kTnw==
X-CSE-MsgGUID: 0fTrQ8tzTs2lBuyKJzLWfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65787082"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65787082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:38:41 -0700
X-CSE-ConnectionGUID: h/8pHyrCT7yC5AsFSLCQmg==
X-CSE-MsgGUID: bi4ods+BTviwmAB8s5A3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160412975"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:38:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 06:38:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 06:38:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 06:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYb/6YBGETVQlWK380FmEbzZr3JgkTnvIMb4qFItYCEqrblFLj2o1gu+mu/OvRe2yUGm7/9qBHrT6Nc/26ik85YiErtn970XIM4xbI3wGn9zffQuNYDpwcXOEMey+vurbM8vMjJuTI/3CJa1U5dxHDAIhx5vLDmudcCIWanZ/O9zYtcz1XsSKAiSLtUb/CE16SDgdHvL/aE1M6O1yF5LD3sl+Oo7iD1/Iyj4q7EddeDhSf3vR8Q8KRKwgjagPA7cfTMcbAEWfwwguNFy5NHpyF37k1yYC7ZJ9vASF0LelH91aRUWwh+5PaOY4LdKT42tfsNcXtjZWZZqYWYtCQ7rsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSAostmtodMV3pLmOBfbRJhNw6C1T3IBVIAR6nrbm8s=;
 b=bDITXB9Zeh9CjZ3Fk95bgl2atphGiSs+vUyYOeH+CV6sZAo4Kwg+l/YiiLcG5bZ9uVBrPHuEB3o46e6MEYh27wP3hzZQ67D6AZkWEGbn/cPBEaDeOVr23PfuO2MuQBsgvb6QGnpV2qG9pFivgNWsV0olM2vc60d8pJBrfXmBdb4pBhHSO5OoXH0tfcgwzJdCgnhmLuDBin1yasTUPNHllV4kAwAgkiRuNmx5vjtCjlfFih9FI+fUgPYFHdxjHJ8/m2Nfu5sF7KuVt6iE2knMEfq5Wnsxoi7bJsE7YP4Ka15Y63S+hs2V4VQZO1Im5f+Ovfniu/o2pe160lseZMTa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Thu, 10 Jul
 2025 13:38:23 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8922.023; Thu, 10 Jul 2025
 13:38:23 +0000
Message-ID: <0db9b238-acd3-49a9-8914-7aa36f943eab@intel.com>
Date: Thu, 10 Jul 2025 16:38:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>
References: <20250624155221.208338-1-ilia.levi@intel.com>
 <aG11aTOnZuNLG+Bs@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <aG11aTOnZuNLG+Bs@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a7ea8d-c1e6-4d35-fe3d-08ddbfb70a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dENUQktJMFZFZWFoeEhibEJ4akdqZUljaksvRzhKNVBRejMvZWhUcmVjMnFU?=
 =?utf-8?B?NXJadnk2WHhiQ1pTV3hVdVM4MnZ3NGtxNndDTXBFSk5lL0hzSzJuTTI5SmpP?=
 =?utf-8?B?dy8wWWRaZld0aVU3R1VKK0xKT3ZtRzhmZENMNjdTYUtNYWdyZGttZWxnSElS?=
 =?utf-8?B?ZC9aTUxqR09LZWZiVklzT093YXltVnUwY1Awb1U5aTVaTHNvNExnSVIrUmhx?=
 =?utf-8?B?VFMxUGxzbktTRzBIQzRuVlp3NzQyVE0wYmZ6Unp6ekdTWDNqV21BTEdnNUl6?=
 =?utf-8?B?bXRzNHhOK0hpZ2djbHVqTjdEaDhRKzBaZGFhangvdTNSSzFtbDZURzB1akZS?=
 =?utf-8?B?RWY4WGo1MFdmZnlucW5WMUFtMG4wVkNTVUpEUnUveVlOVWk5TlFWMGtHdFY4?=
 =?utf-8?B?UEdITk93b0YzclNMZEVZOW9adkowOHpsRW5SYW5XdFNTenlIMHE3S2thcW1E?=
 =?utf-8?B?RDkrZ0F0b2RDSE9pTWI3L3d6eUdkWHpOaGdRZTM4VE45dTBHNDdVSm9ydmVU?=
 =?utf-8?B?anhhWENJWnp3L1U2OGYvSTdSbWQxOW1QTTZQQnhrOC9nL0xpYUIwZVVOa3Nn?=
 =?utf-8?B?cjZCV1VZbkZNWG9Dci95MW1KaitIaG5QQnpyZmFocDRHUFlOZ01GZXNmOWta?=
 =?utf-8?B?TElOQlc4QkVyb1BMRmxKZDh4VDRMMkh1TTJMQXR5OUhKSUVtTzIrTEtyN2E2?=
 =?utf-8?B?UW53QmpkVDdFa0g3WlJoV0ZmNzIrbnRJb1ZCSjJSNTFtWnhaMUZ3cEtoMUcw?=
 =?utf-8?B?MkpkTktzUExSMUZGaHgvKzJ0S1NCaVFucjVsekhRREFCYnM1YU9yWG1SRlVO?=
 =?utf-8?B?QUxJSks0RVlxWUJ3REZVYTBIblQvODJqN01WU0xvUzh3MEVwQmJCTnN2TXh3?=
 =?utf-8?B?blNzRU53Y05FNGNZZGFFbGxKMi9WNTZJV2NJcGFibG53VE01SVZ5TndZQzhq?=
 =?utf-8?B?bWZFdy92aVEwL3R4ZVVtVldDZVkxRnJuSHlJSFNERXdteHhpa1RFWm9uRVVv?=
 =?utf-8?B?UUFXN3F6eFU5NTlTamdaSXkzaGdVTWdnT2lDVFlqNHhCdXpQbkk3emZOTEw0?=
 =?utf-8?B?MU9PbzdkZXBkY3hXL1JNV1h6aTZsMUF6VWxlWW9zeUswSXhUbU5DM2RqUHlT?=
 =?utf-8?B?Nk52VWFBeCs0VzV6ZWlzaWRQTXpZcTU4VWYrSjJmcWdwMU1ISHN5R3dOVFRh?=
 =?utf-8?B?TUZ3YUY3Yy84aXJ4bmJpNEl1YzJpc2gwbUh2SDFyNjNmTmZaSmNUQzNreVh6?=
 =?utf-8?B?cC9sbzloTHA0S3NCQWJCb3NPZmMwWkRQUUY4KzJEdG9kK09iSHZXSWlKa2Vr?=
 =?utf-8?B?aDR3VjdzMmV5ME1weVg5RWFydTU3UmluOU9HVkxxank1aDhXa0txVTVzMlFK?=
 =?utf-8?B?Uy9vZENZTHlhZmhhUWZIdTFhb1BZSFpYYzVVTHhxeTJneWVURFA0aVRPL21Z?=
 =?utf-8?B?Um1JWHZEekx1TEh4dUZDU3huUFRzVVVYZFQycFFHOWVQOFgyVEx6K0ZweEl6?=
 =?utf-8?B?RzhxNVd2TnNLRjREZXprNTVEUGNqdW11ZGRiTFRiUU1KT21HRzRSYVQ0WllI?=
 =?utf-8?B?OVVYeVJUNXdNOTRldXVtRzNhdUQ4NUpIbllkZGtyZWdCYW1IbEl6S2pFK0la?=
 =?utf-8?B?WmtXTlJZQ2pqUy9ENFd2MkVsenREa055ZWllbUV6d2NMS25JOVZLdVpkZ3l1?=
 =?utf-8?B?dzNXanFtMWQ4ODBIc0ZPdW9QRnpPZEVNVGphb21SYldIb2N1akQzdFFTREl5?=
 =?utf-8?B?dm53cDFMSEgwc0Z6NmNVeE1uaXo3Z2d5SFo1dS9MMG8vQm9UU3k3WkVPaWlV?=
 =?utf-8?Q?db6iJLBDTZe8N7JXSoWXxxVApop5/Ae1eQneI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVXNkF5K3NBV3kySVRnUis5ejQvaEFwN2xUWUVuVUdsL1MrekMvUjBGU0lR?=
 =?utf-8?B?amExTWZNVjcyaTRyY3RackI1Q3U3WXYzRStlbmdyRkROdXY3d1luQU01M3BR?=
 =?utf-8?B?MlpDaVZ3dWVuUmdvb3JZM0E3cVY2L3hGdmdzS2FSNzZtL3dyZ1JMaFJvSzVO?=
 =?utf-8?B?V1l5VEFsekZFRW81K2h2bXVKOXVjWjVvejFlb1d2dUl0SU1tcFphYXRqOXdV?=
 =?utf-8?B?aXZESndWYzBZK0lhY1FnVE00KzVONlZTS0Zyd2ZCR2R0WC9RdVJSbjFzeUdL?=
 =?utf-8?B?cjU2YXdGS25yT1BuSVhpaTBNTm1BYUlDOFM5ZXA4NlY0UUJBdDJ1Y1BCcHFa?=
 =?utf-8?B?ZHl3YlEzVXVEeHhvcnUyQkp3bFZIM054cEF3UnhhK1ZGSUpVQUNHeTJBcVl2?=
 =?utf-8?B?dENtdXdiS0FDb2JRSCtiUklsMDVYaFRDeHNKci9HL25adHVnbmRwM1FMV2VC?=
 =?utf-8?B?ZG1JeXpvNzNCS0h2VU1BcGN1OXFXWDR1UWc1ZzFpYXd0L2w5YkZobTFNZllO?=
 =?utf-8?B?M2U0K081M2k4VUtSRmJXRUVvV0hpTVN0OHVJbWFYa3ZPdEV1N0kxdm1UU2Jl?=
 =?utf-8?B?T085SEU3ZVRXMTJKam84d1lnYWtHM1g1ZDJmVGl3WmlCQ0NZa2JYQm9MRjVS?=
 =?utf-8?B?M1RiOG1zTnNTUVJwTGkwd0F4MmU3TzVmeHg5T2tlakdzM3h3MlgzbjdZT1NT?=
 =?utf-8?B?T28vVmF6N29OZFQvY2JtZEtKS0xjTzVZdzBxSkRYTWhHL2Y0dWVPWVBkRDdO?=
 =?utf-8?B?enNHM1lsa2ZiN3EyMEFhSGFwelZ0TWdTMmhtL1ZvMDFWMk5SRkpHdnVRWUxx?=
 =?utf-8?B?dCtPRGEzOGx1bkZjMWN2RkJwVWQ1Y2JTZmFpN2cwV2E3QVBmRUpnY0hjcXFr?=
 =?utf-8?B?YjkwUCtweS9nM0lYcFArZjBXaENyWVpONEc4bytlYmdKYUplajNzbWRCcVF2?=
 =?utf-8?B?cmZTSVRzemVNNkNoS3dOSVVsZ1R5cWpYMUV5VGJ0ekkxUEt2UVJGWHM2Q2xV?=
 =?utf-8?B?aVNCejBocXBXR2I4SGkvQzd5SEo2d2JpODk3WC9YYjlKMC9IMTlRc2xNaU9q?=
 =?utf-8?B?VEZjbElJa0R3QnVFZVl3TnA4bW0rQ0RiSnFINkhsUTd2NjRNcGdmYTUzbjZq?=
 =?utf-8?B?Nk9Va0MvMnVaR2U3ODBJTE5DMTBJcWp0aWlpcSttTVdkTG9tTTFFRUs1ZmUv?=
 =?utf-8?B?LzVUdktLWVBHQW00a0Q0NDVTK3VleFBoczNtaEdFOGZSeUF1WGZVRS90VDZv?=
 =?utf-8?B?bHJOYVhjZ3JoWllZR2JDZEExRkY2eDhpSjJpdC90Z0REeHNvcnR3M1NvSlVz?=
 =?utf-8?B?Tm1YOHorTmwvZ2JjRCtwa004R2tvZEk4elhMNkpsQ0Vsc0MzTVJJd0V4RGFx?=
 =?utf-8?B?cWcvT0FQaFNiaHFqK1ZqeDcybW40M1hDME5kRzJNcDdsN1ZTaEdGU3ArTFkx?=
 =?utf-8?B?ekhZVm1nZGdZM3Z6eG11dDJUYjJmZEttL1NodzJRbDlyaXVZZzFON1VtcUdo?=
 =?utf-8?B?OE5hSmRPT01JL3NldFhwdG1JTUh0VHhRNFhBQU1YeDdBaXp0Y3RHWnJvcGpJ?=
 =?utf-8?B?dUVCeVRraGFZTUd0TGp1WFU0R2FIRmVYdnV4c1E2M1RFUExBMjZ5ZzNlTDEy?=
 =?utf-8?B?MzlvaWVxbEFyS2pyK1oxQ1l1SWRSYjdXcFhBYzlOaGhQaEQyZEV3emJ3WDVr?=
 =?utf-8?B?N3VjMDc0b3M2SUdDMi83d012NjFuV2lveFQrTDB3ZDlZeFVaUWxMejVVRDZV?=
 =?utf-8?B?WnlvWE5ZNHdFN0h3WEh0OUplVkRDdmZ3U0Rsa0pUSVlDRU01eDQ0VVJlV1N3?=
 =?utf-8?B?ZXFwWENhbVlkajdyOHRlY0ExNTJEeEpORFR0Z3RvNHNFd1J3Zy9ydU8xTXQ3?=
 =?utf-8?B?RzFidGtzTVQ4RVY3cWFVSnd4eTArdzRNbktjSG9tai9ZMnBMUzZmSGkweldi?=
 =?utf-8?B?QTZxVTJscVVhemJJeVhOT3NIY1FRSUZreks3Z0plbHFoZERtb3R3dVRUNW5M?=
 =?utf-8?B?WVlqNThZbHNCK1VKWlFJMGZ3YldZOGJkOGcveUZJOVJzcjhsdG1VZ3ArdENP?=
 =?utf-8?B?cmpwbUZuajNlYXJLWlhTaEx1ci9PYWIvRjNsZjhwR1JmVTZTdGZGejJOODRj?=
 =?utf-8?Q?p3tDQ1wJaqUSCR0o3jgqG62/p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a7ea8d-c1e6-4d35-fe3d-08ddbfb70a61
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:38:23.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9B38EjbrZYGx/6NRvfYOqV9b1sqlXo1TZ0sdKxe9KEnsLOQ4qZ3I4DSycC2g0rKWJmKDDq1ThT3K/oDSESS7OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

On 08/07/2025 22:45, Matthew Brost wrote:
> On Tue, Jun 24, 2025 at 06:52:21PM +0300, Ilia Levi wrote:
>> Allow the driver to expose hardware register spaces to userspace
>> through GEM objects with fake mmap offsets. This can be useful
>> for userspace-firmware communication, debugging, etc.
>>
>> v2: Minor doc fix (CI)
>> v3: Enforce MAP_SHARED (Tejas)
>>     Add fault handler with dummy page (Tejas, Matt Auld)
>>     Store physical address instead of xe_mmio in the GEM object (MattB)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  14 ++
>>  drivers/gpu/drm/xe/xe_mmio.c         | 210 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>  3 files changed, 228 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6aca4b1a2824..22a567c5f0de 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>  
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/drm_pagemap.h>
>>  #include <drm/ttm/ttm_device.h>
>>  
>> @@ -162,6 +163,19 @@ struct xe_mmio {
>>  	u32 adj_offset;
>>  };
>>  
>> +/**
>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>> + *
>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>> + */
>> +struct xe_mmio_gem {
>> +	/** @base: GEM object base */
>> +	struct drm_gem_object base;
>> +
>> +	/** @phys_addr: The physical address of the exposed MMIO region */
>> +	phys_addr_t phys_addr;
>> +};
> You can make this structure private to xe_mmio.c. For example,
> xe_migrate.c does this with struct xe_migrate. Maarten also has a series
> [1] doing this for xe_ggtt. I have series doing this extensively for
> struct xe_dep_scheduler [2] and xe_gt_tlb_inval_job [3].
>
> We should apply this practice to several existing structures in the
> driver as well, but going forward, let's practice making new structs
> private where possible to maintain proper layering.
>
> [1] https://patchwork.freedesktop.org/series/139778/
> [2] https://patchwork.freedesktop.org/patch/662188/?series=150402&rev=2
> [3] https://patchwork.freedesktop.org/patch/662190/?series=150402&rev=2


Makes sense to me, thank you for pointing this out and providing examples.
This means that one more function would be needed for extracting the mmap offset, say:

u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem);

But that's a reasonable price for code encapsulation.
- Ilia

>> +
>>  /**
>>   * struct xe_tile - hardware tile structure
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7357458bc0d2..3298ab0f1fb4 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/minmax.h>
>>  #include <linux/pci.h>
>>  
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_print.h>
>>  
>> @@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>  {
>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>  }
>> +
>> +/**
>> + * DOC: Exposing MMIO regions to userspace
>> + *
>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>> + *
>> + * This can be done as follows:
>> + * 1. Define an xe_mmio instance that represents this portion.
>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>> + * 4. Provide the fake offset to userspace.
>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>> + *    must match the size of the xe_mmio instance.
>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>> + *
>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>> + *
>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>> + * Make sure not to expose any sensitive registers.
>> + */
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
> Should xe_mmio_gem implementation be its own files? I think that would
> be better.


Agreed. It started small, but got big enough to merit its own .h and .c.
- Ilia


>
>> +
>> +static const struct vm_operations_struct vm_ops = {
>> +	.open = drm_gem_vm_open,
>> +	.close = drm_gem_vm_close,
>> +	.fault = xe_mmio_gem_vm_fault,
>> +};
>> +
>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>> +	.free = xe_mmio_gem_free,
>> +	.mmap = xe_mmio_gem_mmap,
>> +	.vm_ops = &vm_ops,
>> +};
>> +
>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>> +{
>> +	return container_of(obj, struct xe_mmio_gem, base);
>> +}
>> +
>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>> +{
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +
>> +	/*
>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>> +	 * In the future we may want to store the physical address in struct xe_mmio.
>> +	 */
>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>> + * @mmio: xe_mmio instance
>> + * @file: DRM file descriptor
>> + *
>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>> + * the provided xe_mmio instance.
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +struct xe_mmio_gem *
>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>> +{
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +	size_t size = mmio->regs_size;
>> +	struct xe_mmio_gem *obj;
>> +	struct drm_gem_object *base;
>> +	phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);
> Can we just pass in struct xe_device *xe, size_t size, and phys_addr_t
> phys_addr rather than xe_mmio? That would seem better than defining a
> xe_mmio on the stack and passing this in.


Hmm, calculating the physical address is not trivial, that's why I've added xe_mmio_phys_addr
helper in this patch that accepts an xe_mmio. With your proposed API, some other method of
figuring out the conversion from PCI offset to physical address will be required. A helper function
or maybe storing pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) in xe->mmio.

Anyway, I do see your point - while I was thinking of xe_mmio_gem as wrapping an xe_mmio
instance, it does not have to be this way and can be decoupled.

- Ilia


>> +	int err;
>> +
>> +	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	base = &obj->base;
>> +	base->funcs = &xe_mmio_gem_funcs;
>> +	obj->phys_addr = phys_addr;
>> +
>> +	drm_gem_private_object_init(&xe->drm, base, size);
>> +
>> +	err = drm_gem_create_mmap_offset(base);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	err = drm_vma_node_allow(&base->vma_node, file);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	return obj;
>> +
>> +free_gem:
>> +	xe_mmio_gem_free(base);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>> +{
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +
>> +	drm_gem_object_release(base);
>> +	kfree(obj);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>> + * @gem: the GEM object to destroy
>> + *
>> + * This function releases resources associated with the GEM object created by
>> + * xe_mmio_gem_create().
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>> +{
>> +	xe_mmio_gem_free(&gem->base);
>> +}
>> +
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>> +{
>> +	if (vma->vm_end - vma->vm_start != base->size)
>> +		return -EINVAL;
>> +
>> +	if ((vma->vm_flags & VM_SHARED) == 0)
>> +		return -EINVAL;
>> +
>> +	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>> +	vma->vm_pgoff = 0;
>> +	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>> +		     VM_DONTCOPY | VM_NORESERVE);
>> +
>> +	/* Defer actual mapping to the fault handler. */
>> +	return 0;
>> +}
>> +
>> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>> +{
>> +	__free_page((struct page *)res);
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>> +{
>> +	struct drm_gem_object *base = vma->vm_private_data;
>> +	struct drm_device *dev = base->dev;
>> +	vm_fault_t ret = VM_FAULT_NOPAGE;
>> +	struct page *page;
>> +	unsigned long pfn;
>> +	unsigned long i;
>> +
>> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +	if (!page)
>> +		return VM_FAULT_OOM;
>> +
>> +	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
>> +		return VM_FAULT_OOM;
>> +
>> +	pfn = page_to_pfn(page);
>> +
>> +	/* Map the entire VMA to the same dummy page */
>> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +		unsigned long addr = vma->vm_start + i;
>> +
>> +		ret = vmf_insert_pfn(vma, addr, pfn);
>> +		if (ret & VM_FAULT_ERROR)
>> +			break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>> +{
>> +	struct vm_area_struct *vma = vmf->vma;
>> +	struct drm_gem_object *base = vma->vm_private_data;
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +	struct drm_device *dev = base->dev;
>> +	vm_fault_t ret = VM_FAULT_NOPAGE;
>> +	unsigned long i;
>> +	int idx;
>> +
>> +	if (!drm_dev_enter(dev, &idx)) {
>> +		/*
>> +		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
>> +		 * This gives the userspace the option to recover instead of crashing.
>> +		 * It is assumed the userspace will receive the notification via some
>> +		 * other channel (e.g. drm uevent).
>> +		 */
>> +		return xe_mmio_gem_vm_fault_dummy_page(vma);
>> +	}
>> +
>> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +		unsigned long addr = vma->vm_start + i;
>> +		unsigned long phys_addr = obj->phys_addr + i;
>> +
>> +		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>> +		if (ret & VM_FAULT_ERROR)
>> +			break;
>> +	}
>> +
>> +	drm_dev_exit(idx);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..2990bbcef24d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -8,6 +8,7 @@
>>  
>>  #include "xe_gt_types.h"
>>  
>> +struct drm_file;
> With a private struct xe_mmio_gem, you'd need:
>
> struct xe_mmio_gem;
>
> Matt


I'll move it to a separate file as you suggested, so no need for it here.
- Ilia

>
>>  struct xe_device;
>>  struct xe_reg;
>>  
>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>  	return &xe->tiles[0].mmio;
>>  }
>>  
>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>> +
>>  #endif
>> -- 
>> 2.43.0
>>

