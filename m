Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D93CD1624E
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 12:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA02610E293;
	Mon, 14 Oct 2024 12:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJa4qnCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE04F10E293
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728907961; x=1760443961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0pu8VrYjRogzB75MSQfke7W8sPMxrSHLMzr5YA5PLbw=;
 b=bJa4qnCFoRWfsu+SCnD4fgM1zeph2mRotpYebbrnsEnNtuompBQEzB/S
 OBKlF96FCVpeFAUxqFVSOrtnMvXtbBfQrT4MMph8ReVQ1rzixm7YCmNxv
 iOeq7mKTLqOvS+JV9Df1UCOctsLo6RbhDIXEiwVbzQTsSWimlyfkitC/+
 ZCG9A8a+Hq9f75YMyCy/7HD1Bs9WOMvWxEJpQUqF5spNe66iiFfSS0TYO
 xqSXVvBZ4syvjXHnl1kCwIAS/YB7fgoi3fVzJIksbNypjrTEH4Lky7aqU
 1mLflmbYVFdDmLh3xnFqF84QYuraGu47HCyTdUNAMmlpxav3kG2z2ofpu A==;
X-CSE-ConnectionGUID: jJ84FCSgQbO1BwlrQqBJ1g==
X-CSE-MsgGUID: qQd1ZfJ6RNe7UzwNYOcr8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50780036"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="50780036"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 05:12:41 -0700
X-CSE-ConnectionGUID: NTlFqnbcQz2WLHvKcZFJKg==
X-CSE-MsgGUID: XDv9rQw/TJSk/N5IneFaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82595744"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 05:12:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 05:12:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 05:12:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 05:12:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 05:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZPcq+LKcIJdBWc/zhsiKUgB4vg2S3GoYiW6jLm29O//DrKq9FFhpMBsiohLLBxYnHMI7yRYO7S/RAFKm0Vjf7WDefGxZHfJb9xfSjC+fVvGiOSSuNfmLl+jGvocFwMC8C03lpGjNG6Uh54mLpUPyEd8pSNZyMlmYWWXy1+kzz7L3V/5ay8Rf0TVhVkXxPMZldLlDi0+rz0avVCKPvyAfRj0scYcqlkra9/uGUspvvjOwDzKUUHcMdENV+T4Zrd0Xwz6g8BtbTSmuO/zsgVaxIQshdmLT3FB8ElsKcD+7PP9E8OnPwHX0KOsv/KhbANIpOBrq7zUYStM32kgpoA63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IdKhRbD2g6BufNXL14n8xOqEOoPKF/S4+YMnhQ5uYs=;
 b=UqFmB/KuNVKXqRv86ZXWgFt9+InWlUbkjImKP0C3lv+a7ckyCHk94GtIhTBfsKhemXbLj4xR9/EZETNBRsGmncV9UJvLP1h/RzwcsYbqTgec1YPUR98u2d9loHV38qVwBZ8ZUEV0b2SOf7gFrOIEDO8lYCGt6+4AqX28P7YmR29COkGXshIMOFIO/Xi0QI79APdmH5cQrQi2Zw2Uy57eGQf9duYHQwjUR4u9gPo4tMESvYBaTKZjm2BAbeR7XlF/GnsECF7eg7k0lb7i9LCQ5etNuhO1ZH9pdDVPWSHY+EiQaZQIOJ8SD+FJ3g14HnUwGOj2tXtoqlnSyFmIFqbg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 14 Oct
 2024 12:12:36 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 12:12:36 +0000
Message-ID: <38aad4cb-e4e1-45e2-a8a1-e0f24fac51a3@intel.com>
Date: Mon, 14 Oct 2024 17:42:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc/ct: Increase wait timeout for g2h response
To: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.auld@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-3-badal.nilawar@intel.com>
 <8711d85f-6bf3-4e7f-8c71-5a838aae588f@intel.com>
 <Zwhd56R8t69f9hLi@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Zwhd56R8t69f9hLi@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f1aead-e89a-406d-65ce-08dcec497d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUlhcmJxNzFqREQrWXFwMjE5K0FFTXFBNFQ1Zm56VGN4WFpsTU1kdDVTS1FS?=
 =?utf-8?B?VGFycTAwR3luUXZMZ1pwUmdoOVZyektUbG1YRENybjBsQ0xZRVVCb2ErWld1?=
 =?utf-8?B?TVNqMzNqRjdRRWQvbklwU0ZlWTNTZnM4b1cvdEV4RVdySHlNV1VHUkswSEZC?=
 =?utf-8?B?V2RaZm5oUU0xQldvMkVEOW5LYkpBQlQvWUxJcU9xaGljRHlOVHFaNjhYYk8w?=
 =?utf-8?B?b2plVGFUZTAva2JHeDY1M3I3L0VtZER0ZEtBbHZtMy9QUXZyT3BhOTNXbDlN?=
 =?utf-8?B?cHFwTEkvYVpXd3d2bXhuZVUxWWxFa25NTGdNbDdYbzFSaUp3M2lEdHM0NEx4?=
 =?utf-8?B?V2dyY01UcjJMWHErRHh6QisydTNqb0RBU25XeVpkQUprSGczT0gwcGhRWFRt?=
 =?utf-8?B?N29SaFVhU3BIK1NQdTVUbzA5R1RwdEYzRFNaaVMwNzVEdWduS2RyUWVTT2Nx?=
 =?utf-8?B?MFFEKzNuc3VDUHgzcmZSOU9kVUV6WWo5WWFkTk1mZFpWL2JNUytCSVdqTmlr?=
 =?utf-8?B?cXhSOHVpQmt2d1hxZ215SHpQVlFyNnFwWm14TXg0THZ5Tm5XZ1JWQVlOa3ZJ?=
 =?utf-8?B?aDdOSVlwQWszYVluK0E5QWhuUlJNbitRb0xFc2c1UGV5TVlqclRvajdOb0ha?=
 =?utf-8?B?RUhkYUpyRjhLVnUrc3I5MmMyc1NVNE9aUmZ4YzVCblBKZnVnOFZPVWNncFpV?=
 =?utf-8?B?WUIvc0ZDMTl2M3dPSHZINXhuMTFDRE1QQzV0QjdBVEp1d004cmpWSHM2WDFJ?=
 =?utf-8?B?NWUybnNRTm9yRThpcHJqeWdPZXBXcW51UXNQNkd1REU2eEhvYlhCY3hJSlo1?=
 =?utf-8?B?VWloMUgyQW53cEI4Smp4NzZIYXVwVlVxNWlxYWFZbjB6MmlxUDR4RjVIZXd5?=
 =?utf-8?B?NnI5Y3ppUm42eXRhTGFobllPY3BkcDNsRy9IL3k0Mk1qMWtSN3JTcXlmNSta?=
 =?utf-8?B?QkNRNytkK1VGWTVZMFhoWGR4dWZKRjc3VDVjVTlXbStLNFJqU1ZKUTNoM29z?=
 =?utf-8?B?TFZxbWliSHhJcTRLMDFDRUplUlRDeXJLUDJqOUxaaXlKOXo3bFZkbXlhak8z?=
 =?utf-8?B?ZjdubnZzMWQ0MGlFbUNMSml6R1B5VWxDemszM1lKOFZlQjdSYUZMRWZTbWJR?=
 =?utf-8?B?Y2hHRjkycXVjY3JIOWxaUExlS0J5YWpGMWhjVmhNRVUvNHVUaGoxNmVNV2xH?=
 =?utf-8?B?MFpaYXZiWVpHTjIzdjRIQ0UyNkh0cGFNNmZXYUR2MGdMdnBmVjk4ZmtBV09h?=
 =?utf-8?B?N3RMM0NIeU9wWldIWFNVRnVHcmZPZGhSdThhOUlkbkRJZjFNV0c3b1NUZ3RP?=
 =?utf-8?B?L0NLOEU5Y3pjSGM0OWNqL0VhdnExRTEzR3hqaU9PUUg1L3hpNDdQb2lrS1RY?=
 =?utf-8?B?NGJOa1Z1N2JvOUMrc2c5MERFZ1ZVUzNjVDZla2UvaHVadFN3U3IvS2hFdXNG?=
 =?utf-8?B?TUIyYnBxOHVmZit3Wjd5dGdRK0FaNWVxVmJJU2tiU3BqeGxRMENNaWdsWUpQ?=
 =?utf-8?B?Y3ZoY1BnRjRIMHRYSUxYc3J0YzVYdmluU2xDRGhBa2xNeTRjUVhzY2VtYTA3?=
 =?utf-8?B?bWdndDdxdHRKK2lya0tubEo2SzB0enZGeS8xZ2c4SURBcllYMnkwM21TNkJP?=
 =?utf-8?Q?AQVRIzbT73bsgYGiLf/32tdz5V0Kk5rsMpYPoGSksmSc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzQycjVaUlIwYWphMy8vZWEyRXEwajlWU0kyRXRMaFR5OEszTDRZNnQ0ZGdC?=
 =?utf-8?B?WTlWRUNReUVTZTQxUWZXVWphcFBBcTA5UGp3eFlzam8yLzZlNVNFZnlXVnd0?=
 =?utf-8?B?L1REWThWZmxWM3A5aExzNHFaL3YvajNHRHdON1hlNkRCZml3aFdwUHE0UVp3?=
 =?utf-8?B?ak1IU2pWRzBFL1ZTMmRhakhtbzhwRjkvcnNkdWlXUk1BOHdsMTdqU05QWWhk?=
 =?utf-8?B?M0xqc3FFV1FuOEhtck5PTHJ4VTVMZ2ZIczQ3ZGJWaURiaFJCdTE0UjI1S0xx?=
 =?utf-8?B?Q0RPZHdDWFYyVFhQN2h2WS9hTlhyS2NpZTQyQ2tDV3RTUjBhMGFmYlVHczVL?=
 =?utf-8?B?S1lQSk9pNGVhVUczeSt0WU5MaWNuMGxmc2JpazJ5MFh6amFvTFdPS1BqeGhB?=
 =?utf-8?B?V3RoZmZYbzdTc05Bay9vbGRiMnFvOEFkYXAwRkF0SVlwWENlYmNZNWJUaHVB?=
 =?utf-8?B?RUF6SyszMFBPKzJSVEVFdE95dTFJTjNGdVp3dnoxbEE1K080UStINHJZSGll?=
 =?utf-8?B?Wk5WRm8wTXVINmEzN0RORC9Ja3R5ckNwbURLYTQ5WTIxbWhPaVBpUWhNbHdr?=
 =?utf-8?B?a1FZekwwQ2ErZit5RERZSitFVnpYMVBKdnNkYjM4V1dPbGNFOGcxR1hCSVp3?=
 =?utf-8?B?c3FLUGhNZUdhUHR5R095WWVPRGlsdG9meVhpclBnc1pSb3piMmZIMkNWTU8w?=
 =?utf-8?B?UWs5cVo2d00wK0pxd2J1OEhLbm1oWFBMNnV1NUhZVzd5NXZpVEVCNExzc2Rx?=
 =?utf-8?B?SWxEaU9EUXVPKzRIYnFOVk1WVEFibkZlcHV4THIyMVlMUnhmMDFxaFRPcWdo?=
 =?utf-8?B?QWovYkRQWUo2OUIwVm5tQVI3Vk1sQ2ovQzl2TloxL3Q4L2YxN050R3Jmandl?=
 =?utf-8?B?UHVRMEJqM2Fudms2RUJBTlJiK0lhQlZScFVXeFJKak1IcEhpenVNYWxSU0tX?=
 =?utf-8?B?NU05Tm9oL0VHenBiR2NBbHJPdkw0dkFJZFN4N3VqMy81WHVTUG1uOSs4Zm0x?=
 =?utf-8?B?cVRacFVqenY2ZlVsMUVLVE5CdjZzdWNheHRXemJ0czdva05KWkhEbHNoT2JT?=
 =?utf-8?B?dnMrNHFuMDh6UFpBS0k3QTZ0SlJJUFVudVRpWityOXk3b3FrWWl0OWhoTFhx?=
 =?utf-8?B?TzFvSkF6cUJORk1naFdRdjFvV1JtdzFVK3k0QlZjL0tBdWFYN2NzK1h6SnNW?=
 =?utf-8?B?ZUFCWWh0bVp2dGYwaFM1TUl3NGwxenIrRGYzMW9FUklUVm5pL0ppaWQxT3FD?=
 =?utf-8?B?NjVYcG5BNUpFcjBuQ0p0dzVQYWpodU9iMGFMVzBhSXpKS0Y0S0sxZWpjVEph?=
 =?utf-8?B?R01meUZqaUFWOFZvZFpZK01FSEdXVVpJRy8xcTdzUFZjRGRUemttUERqM2lC?=
 =?utf-8?B?bFZUSWlhRGpjYWpyOVJ5VE92YThqR0pJc0syOFVhdG5IdVVWZnJhSUs5NytC?=
 =?utf-8?B?NEYwVHJtYUpRS0hUZ1F2OVpydENpcVF4WkgvZ1FkV0RrdktSTFV4VDRtYnJL?=
 =?utf-8?B?UDh6MkRISGRIcEpyUkpnRko3SFdybFE3WkRWTHBTNDlUSE9hRDJxNTZ5Nmda?=
 =?utf-8?B?WXY2UzhGVGxaVVZhSjVxUDU2a2t1Z1krSVZNczJWem96U1IvL25tMjE2YjRi?=
 =?utf-8?B?ZjRMOWtvQkNvdkNKT2M2N3d5cHJhME94Yi9Uc1NTbUtuRDVOMnNOUU80VHhX?=
 =?utf-8?B?dmh1cTFkd1YwcFFWQUUyU21HNmxyZlZTRmcxbWJrSjdkS25lQnNTeHZHWTI0?=
 =?utf-8?B?K1cySHQ5ZGpkY0U5NDkzSGMwSnFrVWhVaHZxclFvMFJGaEV3ZzltMHZvb3FK?=
 =?utf-8?B?TGVob3Z3ekxvWnZpNEtrZXBmdG9sSksrL0tINldmMm5tbnF3aURrbzg5T1JX?=
 =?utf-8?B?ZVZyV1laWVF3enFocDB5dzlBUkVWOVVZNjN6RXg4OEpLUjNibU1ab2l4Q0Vj?=
 =?utf-8?B?dTl6TVlPak9Jdk92Z0dBaGRWY0JhcGRxTVJ4TXQwQ0lqNlZIbFpTS3JVSjd2?=
 =?utf-8?B?aHY3OEdZWmtEaGlWTzFXNTZUU0lucDB3VnRIUVZrTUVVSjlJWit2VFZJTy9P?=
 =?utf-8?B?SW5STmhZanRYSmEvNS9qaEVZTUVaWndERmQwL3dvbVZMSStSa3VGSC9yWHg1?=
 =?utf-8?B?aWdMZy9tVHE2dE1XWlV0Rk9lMlNKdDBVT1F6cjZwUjhYaTMxbGRaRE5mQlhI?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f1aead-e89a-406d-65ce-08dcec497d50
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 12:12:36.2937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6AfVLn7ha5y1cYmtEL+H3Zf5CIY8NcMan4WLRHEhYeLHKX9u9g6St3er2Y2eKbLKVEk9ai1LhI4E+qoSkETTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
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

Hi Matt, John,

Thanks for review comments.

On 11-10-2024 04:36, Matthew Brost wrote:
> On Wed, Oct 09, 2024 at 12:43:36PM -0700, John Harrison wrote:
>> On 10/9/2024 03:56, Badal Nilawar wrote:
>>> Occasionally, the G2H worker starts running after a delay of more than
>>> a second even after being queued and activated by the Linux workqueue
>>> subsystem.
>>> To prevent G2H timeout errors, the wait timeout is being increased.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index b93b2821e4e8..dcc95c01b6f0 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -1019,7 +1019,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>    		return ret;
>>>    	}
>>> -	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>> +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
>> Is this change intended to be temporary until the fundamental scheduling
>> issue with the workqueue is fixed? If so, there should be a TODO comment to
>> that effect so that we remember to shrink the timeout back down again later.
>> Three seconds seems like a long time to wait.
>>
> 
> I fine with this W/A until we root cause the work queue scheduling issue
> but agree this needs a comment explaining why this large timeout is
> needed (work queue scheduling issue), how to trigger the larger timeout
> (tests which can trigger this), and saying once we root cause issue
> reduce the timeout.

Sure, I will add the comment here and in patch 3 to explain why this is 
needed and change need to be reverted once this is fixed.

Regards,
Badal

> 
> Matt
> 
>> John.
>>
>>>    	/*
>>>    	 * It is possible that the g2h request may be cancelled while waiting for a response due
>>

