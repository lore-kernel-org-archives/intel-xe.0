Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402EBE69E81
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 18:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6EC10E180;
	Mon,  2 Dec 2024 18:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5/p8rEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A810E180
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733165967; x=1764701967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sURZXwAB7xWkTgMsCUAmxFjVJ5Ad6tou1ayRMoJTAts=;
 b=a5/p8rEWvQKbPQ/WHR0Wjm6zxoLEuHjY9wcZVjn6tKFhm0MTAHzrjGyj
 f0LpjslqEO8XEMHC5DGGkEF0XnP8SLoV4ak9PRs9hBYmPWK9lro7IY0ZK
 Uj5bLjdX5WAIp4CrPoGLX9WQ3XpdMRV3NOZPfRAdXks2rN77/KtveyaYD
 Tld0yrd8yskdJH0ChB4HUy/HPRsN8X4Hto3HpqTuZdkSdlRynvWhghRlz
 q2wwlTd2lAXziUPbSt2wMKIy75+WyIiKC6wADZIYjd0/LhFBS9QzQSzWk
 y4I5k1iFwkui2+2S8RmKx+SPyf1rWKH9Lw6Uqwb9xQ9Fdkfdtnoznfwzj w==;
X-CSE-ConnectionGUID: yTGOBsjLQJ2kK8kwuksv6Q==
X-CSE-MsgGUID: wOLuR+eVSpqVV6rrvkQhvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50763767"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="50763767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:59:26 -0800
X-CSE-ConnectionGUID: i0GeTbOgTVaF/yvvGeFqug==
X-CSE-MsgGUID: BQ6LyPUPSVSNpyVl6bEqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93661552"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 10:59:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 10:59:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 10:59:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 10:59:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti7hC1dA4Q+W9GlvE6ua9ftmjIvIM/ChtxYgBP4czgqwP9zYXkNDX6nG90JhRAWxtgFL1Hmnhll/Bk9mowGDID19EnzX6WJ/KUIakMTO0GiEmrydR5j/xMzyOQyoiEelnx79HZEMYWHlTnVVkufdS3fUWXAmmsGAHhyFo2Arr4yORagRmbYYJ/rxvPzLbWU1fnesFRs3r8+mExYfcOJ7+FQyVTKz07qOzuJOC/EH8jafXwRg8UooiPklFRExt1/9ed1GIS+Ilpl09Rodmyku1TZBjNccB3tR4Q9Sx+8F/2S/WAYIO6MoOEEQ7w/CxjM17UN5cPLQ5QA3xJMvQM1uaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eM9Vjluqej/OY4dHCoZv7MGJ7IsqP/n5xPQ5CkfKtw=;
 b=Gh1AOZZhMg12ophrhGYlWf6WleYIl3m29MwtJ6O3enWyyeUEzPmwSx+g7zyaKdkkHrA0WEgCPdPSTQSjk/WRDhVsEszsKroaFH44GjzvBblXyzbsy0s8voy4o27RxZiNrynbL1E+TBGKJvhUhMIR2/5vQQ0ypWgPM5EQAEH797QfnKoQbItsvFI4V9XI3k4axVj5/kUVBg3AXxsUvYjtj6VblDPi7ME3+OOE81D3uoMXkADnQKJ0bj1cpHk7jCQRTfxZ6p55t5YbOxg5nIDddG8gbdfzXXRtEEw6QDayxuLTIK3iNEbYf3FM9E6kXLSODWs8l4wriXllFLfCANUnpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 18:59:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:59:22 +0000
Date: Mon, 2 Dec 2024 19:59:18 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH v5 2/5] drm/xe/irq: Separate MSI and MSI-X flows
Message-ID: <20241202185918.bdz2oz4y3u3voklg@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-3-ilia.levi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128125345.1115-3-ilia.levi@intel.com>
X-ClientProxiedBy: MI1P293CA0009.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::6)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 218392d3-8a0e-47cf-b5c6-08dd13036ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmFsNzlUMVRkMUowankrUHJGU3dkaGcreWJBVWxPTWRHNGFSWTFUL2lGK3RI?=
 =?utf-8?B?SDVBMGZURkdUQTNrdVlCYmdWVGFXSi9TUUt5VWt4cDBkdVFLOUpqd0kxd3g5?=
 =?utf-8?B?MTd5TGQ1SFk2eWNxZDJ1eEtLMFRjdUFzZkErRTdVbHhGeXBDVTNKRUMvemw5?=
 =?utf-8?B?bDJNdXRpZG9Nb3Z5aEpoNXVRMjZPMDVnMVM4N1VaWlNPOTVlRWFwbW5KcVNh?=
 =?utf-8?B?ZjdsbitUMnoySWEyem5wUzZPQTFyL3ZFU1JHeSsrYjJZTW01L2NZMUkyU01P?=
 =?utf-8?B?UlNEaDJvcGFwYzNsQzFDWTVWSng1U205MFJwZHMyNVpqdUZtNmlXM3VhOGFm?=
 =?utf-8?B?VFBJN29ob0tFaXNnT3FaN1lXZnUwS1ZSTG1QSnBpa1NOeThRRHQ0R3A4eGNH?=
 =?utf-8?B?a1g2N2F4enRTMHRGYUtORHNxVVI2T3YyS2RNZWQ1UjhqRmpJaWZyaGJsOFpR?=
 =?utf-8?B?Z08rSGV4eksrUkNNSFc3d0VpaGZaVjJ6VmNlMG50cHhlbksvT3E2dXdHb09y?=
 =?utf-8?B?YjlWdkpxbmpwUndOSlJQNDNZMjhYOVNyaS9ESTd2Tk5MaDViVVozUUFhR1ZT?=
 =?utf-8?B?aUhWcUh4RncyTEN1MDRmSG8yTWxML1RZSXZKVE1GQ3dPdzdsRVFWM2tVUEpH?=
 =?utf-8?B?aFlQYncwdTZxQzltK1kxWjlMZXIvcDBOQm50RlE4M01jU3RoRFlyKzNtN29Y?=
 =?utf-8?B?MEdKNEp0dXF4SHJCQ1FvQ1IrOC9ES0o1YkdrYkQzalFnUUlaeVJBYi9WUEY1?=
 =?utf-8?B?VG1KNlFWYW1rWkg0WjRMVjRXbUhrLzNJUW1XZFA5UE1yQ2hra0J4bU5QSFow?=
 =?utf-8?B?WHNXd0l4VVNXaGlvTzBWaXZaakVTcGJ6Y0o0V3Q0cDRuY0JwYTBXVFduNkJu?=
 =?utf-8?B?MitEMVNyS3dlVlVXbUFScUN1M2FBazZYdzl2ZW55UnVvOVVnWlZXVWlqdmNj?=
 =?utf-8?B?cGdPcGcxNU1qdFhzWXdlYllqaE9rOThwd3d3OXkzcDhXdGE3N2toa09iV2pt?=
 =?utf-8?B?ODZrMjhxbjJVTXFTK09tOWkvdTZyR0V5UVlvcEkrQnFZdnMzMkNRNGlOaDFa?=
 =?utf-8?B?WUxRTFN1M01Rdk1ReWRzZGVqdzFBdUlDZ1ZvMUlCMnhZS25Ha2FsUURWOFlW?=
 =?utf-8?B?T1ExOWRFMTBadEhCYUZQeGNFWGJvNUtCNmVteW5aTlpPMmlRaGxXajhUQUxl?=
 =?utf-8?B?Nko0SUF4QTh0WGtUaXVXMnZhYnFTYlhhTnFwWjNaVUFwcWFDM1dlaUFURWsw?=
 =?utf-8?B?UUloYksxY1ZVTlk3SmhYZmJBOUJkUGR5RTFKWE5KeWpPa0hVdGhGSkI4WmZi?=
 =?utf-8?B?UlM2eHpTaXQvZ1VIenc3OXM3Z0ZnWUhwT0gyVGhWWnB2dkZQTExHZ203SkdJ?=
 =?utf-8?B?K2h5RXZQMnpXTW5WNUpJcC9iek9GWmF2blBYcDZmb3hjU0lLVENZRGFnd0JM?=
 =?utf-8?B?cHdtVmFTa0l2WjNsbGZUN21Uc0RHUU5PMk1XWWE4NVNSa2Y0d0hRN2w5MFgw?=
 =?utf-8?B?cEIvamQwazRRRjkySGIybkNLRlRBN1ZYU3FaMzBZRkZUQnJPa0lGOUU4NEty?=
 =?utf-8?B?WkZ3VGV2YnBndloyZFpxWVNtaDJGM1FWK3ZEdnhpQ2ozTGM5UlFhZXEvaytm?=
 =?utf-8?B?WHIxVVVVWHdTZVVCaHFQeWpiMHF3L3ZaZGxYQXU1T0tFTHkycFVBb05kaGNQ?=
 =?utf-8?B?aFYvN0QxZWowWVlpQ0pwM3R5YUdrVnBMNk5KbnN2b2MyLzdsZHRnTmNlaXhP?=
 =?utf-8?B?QThSVmdWcjE1MStORzlBUnkzUDdobVBqRlR5VFp2ajNjMGVhMXRqSTJtOUc5?=
 =?utf-8?B?ckRQTHZHUC8yNzVESWM0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czZ6eTFmNUtPbFJYTGxPcG1FYWtNdkdkbjJKeTE4TzBVaGZVeUVWakxGUVBT?=
 =?utf-8?B?OUNMZW1PSTRSTUpzTE8vVHovbU94cXZSUW1PbTdrSE9XQ0ZxUzJzQWdBNndE?=
 =?utf-8?B?TWxWZ0xHWFFONnpxU3g5NVk4RVhJV3FrZXZaU0x2NndnRVBmTk1xMFR3U0RL?=
 =?utf-8?B?c1JkbW1mTUhUTDBiUkZiSDhHM0Y4ZzVCNFFwZzV0SVN0UEtaQUNDUVdtWTdV?=
 =?utf-8?B?L3M4K2NIWXJXZnBEZVBQWWpodjVKd0huZjZNUzgrUzI4cFo2OUJoUU42WVhH?=
 =?utf-8?B?RTM5YjhPSlhQN290NXM4Tml6cHhaYldvUFMxS2tPdXdTREMwUTRmWTV0YmRN?=
 =?utf-8?B?aTdZanhlK0dpL0NtZkdFODUxT090Q2I5RE12MG51RkZJckxLTlJWR3lwNHNX?=
 =?utf-8?B?UW9jSnhOalpJZnNUenRWSGpheitSNEVRMzl5NU56dmFZcXRUeFZOdUZXbUVF?=
 =?utf-8?B?eDdyUk9mZEZ0TmxOTGpyUUE4TFRXWTlZdXJXODFlZkZrMUFDbFRNdzZOdGt1?=
 =?utf-8?B?ZUNGemxoWlVDZDZRN3luWmJKeDdlcTNaSERxck1zdS9GVEE3a0tsb3NPY3hE?=
 =?utf-8?B?MDBzNEZzanVqT2MxYk5jVFczMThzMFYvWVVVY1N2R25YM1hkWDM2VUs1bDJI?=
 =?utf-8?B?YjQ1U00zeHhNZGxsRnl3TUw0ZWJqRTFCTHVqYUNVNTNJdjB6cmNPWkVaL2Va?=
 =?utf-8?B?VmQ5emVrR1ZTcitQSFM1NTlNSU1PaTBjZElKaUwrR3E3Q0lDN2s1Qk5hb0Y2?=
 =?utf-8?B?aW9tMjZad2ppV3lmdDVFSHI3cW50ZDhpWkRqYUxjQzFaNWRPTm1sbEhLS1Vn?=
 =?utf-8?B?bHlJOFpTeEtSckFvRTFxQlArUHhNdm9ia3N4RHVURFJORHJXUnNGbnEvSTI3?=
 =?utf-8?B?RVVNaXpvRUVMMVd4bThleDZHS0ljL1c1WWc3NXc1UnhUSVZTMklnZUFxU1hx?=
 =?utf-8?B?THY3bTRXT0psbzVZdGtkWS9BY3VZM1JvQ0dzUVNEcUhUeiszNEhSS2JGd0xv?=
 =?utf-8?B?aUNVcDZKMld5dVhHK3NlN25uQ1piMG9UOW9XODJXZGlGWXVVSzZKNEh2b051?=
 =?utf-8?B?WmY1RU1ONTRaNkVjWVl3ZXIwVk43TmYrblQrNDcveW1hekx1Y1kzRlF1MUpW?=
 =?utf-8?B?L1lBdExOVm5BMzJseS9PWlRRSGtFZFBaVGMyanBUQjBiUjBES3h0UjA1WHVy?=
 =?utf-8?B?TGVCZFEvV3BBUHBDb2xMMkd1UnV1L1FCZlErSUk0emRhZ0xqSGtnWXYrLzBJ?=
 =?utf-8?B?Z2d6RjZtT2wxN1IxMDN0UnpDNVJ4VWN1YkV0enZQS2psd3FRMDF6Y3poeEh3?=
 =?utf-8?B?ZGt5U1IxRDZIRzdIcTAyT0UwNDRud2dLVENtRWQvUTd5RlFrQ2JseG1ncWpT?=
 =?utf-8?B?ZFkzSmJtckxJdllTZWJVYjdqbXpyb3FpQVZqdCt4UzAwb2lGempYSjY2ZWNn?=
 =?utf-8?B?czRuQXp3K1Z2VHVrUHRvdlVMZWg1Kyt0d2ovUEpjQ1hoL0ZibUFVQkJnQWEy?=
 =?utf-8?B?aFY1N1ZMZFdTOGlKSm9xOXFFeWg0UWlCdzFKRzV5bkRSU01kcVpnc0JYMThK?=
 =?utf-8?B?MGdTbjBIM3YxbTk1Snp0N1NBT2VnaCtNb3YxKzMrTURGUUhNbldBMTVXR2Rv?=
 =?utf-8?B?eUxLS0ZaVDd1ZHdldEhaU0l4VDQ5NTdsY2REYm9xWnF4eDc5RmhPaGRQQSt1?=
 =?utf-8?B?SWtDbGQvTXBDU1NURW9MUzlyQ2xXbk5LYkp6Y2lyLzV1RGd0U3hENWNsYXpV?=
 =?utf-8?B?Ymp1dnUwRGw5Y2g2dDE5UXFHZ3lYbm9mM2pWMEMrMHpYbERoOEd5S0JaMkNa?=
 =?utf-8?B?K3ZVTE5GcDg3aTI3S0JTWXlRZE1SWXV1Ry8ralZRZm96cmRGSXZyR2ErUDVF?=
 =?utf-8?B?ZUlOZEJlc1ByNkk0TmlOMHVJeW9idUdTenozUjY3TlpXdGIyWm9RWVk1SmFB?=
 =?utf-8?B?L2hzMWF3VUk5MWFxSmtzVWQxcGxLeTZ4bkQwY21zQTk1TG8wbmh0M01qeFlW?=
 =?utf-8?B?Z05rVDY3Qm1rM1NhMkgzSktZZFBVb0E0UjFzdDVXYzlKcWtyUjlQaGU1ak5q?=
 =?utf-8?B?WTBnaEZpTVZxMzg1ZkpOaWlLTng1YkN4TkdmS3Q1eGVvTytROWUzQWxSc0cr?=
 =?utf-8?B?bUJxWFE1cXdOU2hRaVR1MmltVnBIeG12czhJeUJVcjZnMUE0c2dqZ2dBTDh2?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 218392d3-8a0e-47cf-b5c6-08dd13036ea9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 18:59:22.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mtUp7jYybb8A1ZoigDGoqLcxPKailsVrSbUKFGdYf77LvPwPUuttPGrODi/PHzTjCLkSbHKzgHHk0bzh7XXYvxraXYvJpnBL4DqebfwIE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:42 +0200]:
> A new flow is added for devices that support MSI-X:
> - MSI-X vector 0 is used for GuC-to-host interrupt
> - MSI-X vector 1 (aka default MSI-X) is used for HW engines
> 
> The default MSI-X will be passed to the HW engines in a subsequent
> patch.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>  drivers/gpu/drm/xe/xe_device.h       |   3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +
>  drivers/gpu/drm/xe/xe_irq.c          | 257 +++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_irq.h          |   3 +
>  5 files changed, 237 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 930bb2750e2e..f1246fa8b5cc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -325,7 +325,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	xe->info.revid = pdev->revision;
>  	xe->info.force_execlist = xe_modparam.force_execlist;
>  
> -	spin_lock_init(&xe->irq.lock);
> +	err = xe_irq_init(xe);
> +	if (err)
> +		goto err;
>  
>  	init_waitqueue_head(&xe->ufence_wq);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index f1fbfe916867..fc3c2af3fb7f 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>  
>  static inline bool xe_device_has_msix(struct xe_device *xe)
>  {
I still think you should use the name xe_device_use_msix.

We use xe_device_has_* in case, when the capability based on Platform
version (for example xe_device_has_memirq) based on intel_device_info
(for example xe_device_has_sriov or xe_device_has_flat_css).

IMO in case you are basing it on a variable that you set yourself in init you should use
a different name (for example with “uses” instead of “has”)

My motivation is that for me xe_device_has-* is used when it is the capability of a given device
and we base on the information that intel_device_info or infromation about the platform version
provides us with.

> -	/* TODO: change this when MSI-X support is fully integrated */
> -	return false;
> +	return xe->irq.msix.nvec > 0;
>  }
>  
>  static inline bool xe_device_has_memirq(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7ee114c17552..ed638067aa26 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -348,6 +348,12 @@ struct xe_device {
>  
>  		/** @irq.enabled: interrupts enabled on this device */
>  		atomic_t enabled;
> +
> +		/** @irq.msix: irq info for platforms that support MSI-X */
> +		struct {
> +			/** @irq.msix.nvec: number of MSI-X interrupts */
> +			u16 nvec;
> +		} msix;
>  	} irq;
>  
>  	/** @ttm: ttm device */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 1c509e66694d..b8a0b9bbf24c 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "display/xe_display.h"
> +#include "regs/xe_guc_regs.h"

I don't see why you are adding this header


Thanks,
Piotr
>  #include "regs/xe_irq_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
> @@ -29,6 +30,11 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> +static int xe_irq_msix_init(struct xe_device *xe);
> +static void xe_irq_msix_free(struct xe_device *xe);
> +static int xe_irq_msix_request_irqs(struct xe_device *xe);
> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe);
> +
>  static void assert_iir_is_zero(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(mmio, reg);
> @@ -572,6 +578,11 @@ static void xe_irq_reset(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		return vf_irq_reset(xe);
>  
> +	if (xe_device_uses_memirq(xe)) {
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_reset(&tile->memirq);
> +	}
> +
>  	for_each_tile(tile, xe, id) {
>  		if (GRAPHICS_VERx100(xe) >= 1210)
>  			dg1_irq_reset(tile);
> @@ -614,6 +625,14 @@ static void xe_irq_postinstall(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		return vf_irq_postinstall(xe);
>  
> +	if (xe_device_uses_memirq(xe)) {
> +		struct xe_tile *tile;
> +		unsigned int id;
> +
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_postinstall(&tile->memirq);
> +	}
> +
>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>  
>  	/*
> @@ -656,60 +675,83 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  		return xelp_irq_handler;
>  }
>  
> -static void irq_uninstall(void *arg)
> +static int xe_irq_msi_request_irqs(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	irq_handler_t irq_handler;
> +	int irq, err;
> +
> +	irq_handler = xe_irq_handler(xe);
> +	if (!irq_handler) {
> +		drm_err(&xe->drm, "No supported interrupt handler");
> +		return -EINVAL;
> +	}
> +
> +	irq = pci_irq_vector(pdev, 0);
> +	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> +	if (err < 0) {
> +		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_irq_msi_free(struct xe_device *xe)
>  {
> -	struct xe_device *xe = arg;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int irq;
>  
> +	irq = pci_irq_vector(pdev, 0);
> +	free_irq(irq, xe);
> +}
> +
> +static void irq_uninstall(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
>  	if (!atomic_xchg(&xe->irq.enabled, 0))
>  		return;
>  
>  	xe_irq_reset(xe);
>  
> -	irq = pci_irq_vector(pdev, 0);
> -	free_irq(irq, xe);
> +	if (xe_device_has_msix(xe))
> +		xe_irq_msix_free(xe);
> +	else
> +		xe_irq_msi_free(xe);
> +}
> +
> +int xe_irq_init(struct xe_device *xe)
> +{
> +	spin_lock_init(&xe->irq.lock);
> +
> +	return xe_irq_msix_init(xe);
>  }
>  
>  int xe_irq_install(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	unsigned int irq_flags = PCI_IRQ_MSIX;
> -	irq_handler_t irq_handler;
> -	int err, irq, nvec;
> -
> -	irq_handler = xe_irq_handler(xe);
> -	if (!irq_handler) {
> -		drm_err(&xe->drm, "No supported interrupt handler");
> -		return -EINVAL;
> -	}
> +	unsigned int irq_flags = PCI_IRQ_MSI;
> +	int nvec = 1;
> +	int err;
>  
>  	xe_irq_reset(xe);
>  
> -	nvec = pci_msix_vec_count(pdev);
> -	if (nvec <= 0) {
> -		if (nvec == -EINVAL) {
> -			/* MSIX capability is not supported in the device, using MSI */
> -			irq_flags = PCI_IRQ_MSI;
> -			nvec = 1;
> -		} else {
> -			drm_err(&xe->drm, "MSIX: Failed getting count\n");
> -			return nvec;
> -		}
> +	if (xe_device_has_msix(xe)) {
> +		nvec = xe->irq.msix.nvec;
> +		irq_flags = PCI_IRQ_MSIX;
>  	}
>  
>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>  	if (err < 0) {
> -		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> +		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
>  		return err;
>  	}
>  
> -	irq = pci_irq_vector(pdev, 0);
> -	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> -	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
> +	err = xe_device_has_msix(xe) ? xe_irq_msix_request_irqs(xe) :
> +					xe_irq_msi_request_irqs(xe);
> +	if (err)
>  		return err;
> -	}
>  
>  	atomic_set(&xe->irq.enabled, 1);
>  
> @@ -722,18 +764,28 @@ int xe_irq_install(struct xe_device *xe)
>  	return 0;
>  
>  free_irq_handler:
> -	free_irq(irq, xe);
> +	if (xe_device_has_msix(xe))
> +		xe_irq_msix_free(xe);
> +	else
> +		xe_irq_msi_free(xe);
>  
>  	return err;
>  }
>  
> -void xe_irq_suspend(struct xe_device *xe)
> +static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
>  {
> -	int irq = to_pci_dev(xe->drm.dev)->irq;
> +	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
> +}
>  
> +void xe_irq_suspend(struct xe_device *xe)
> +{
>  	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
>  
> -	synchronize_irq(irq); /* flush irqs */
> +	/* flush irqs */
> +	if (xe_device_has_msix(xe))
> +		xe_irq_msix_synchronize_irq(xe);
> +	else
> +		xe_irq_msi_synchronize_irq(xe);
>  	xe_irq_reset(xe); /* turn irqs off */
>  }
>  
> @@ -754,3 +806,142 @@ void xe_irq_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_irq_enable_hwe(gt);
>  }
> +
> +/* MSI-X related definitions and functions below. */
> +
> +enum xe_irq_msix_static {
> +	GUC2HOST_MSIX = 0,
> +	DEFAULT_MSIX = XE_IRQ_DEFAULT_MSIX,
> +	/* Must be last */
> +	NUM_OF_STATIC_MSIX,
> +};
> +
> +static int xe_irq_msix_init(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int nvec = pci_msix_vec_count(pdev);
> +
> +	if (nvec == -EINVAL)
> +		return 0;  /* MSI */
> +
> +	if (nvec < 0) {
> +		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
> +		return nvec;
> +	}
> +
> +	xe->irq.msix.nvec = nvec;
> +	return 0;
> +}
> +
> +static irqreturn_t guc2host_irq_handler(int irq, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (!atomic_read(&xe->irq.enabled))
> +		return IRQ_NONE;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
> +				   GUC_INTR_GUC2HOST);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
> +{
> +	unsigned int tile_id, gt_id;
> +	struct xe_device *xe = arg;
> +	struct xe_memirq *memirq;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +
> +	if (!atomic_read(&xe->irq.enabled))
> +		return IRQ_NONE;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		memirq = &tile->memirq;
> +		if (!memirq->bo)
> +			continue;
> +
> +		for_each_gt(gt, xe, gt_id) {
> +			if (gt->tile != tile)
> +				continue;
> +
> +			for_each_hw_engine(hwe, gt, id)
> +				xe_memirq_hwe_handler(memirq, hwe);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
> +				   const char *name, u16 msix)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int ret, irq;
> +
> +	irq = pci_irq_vector(pdev, msix);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int irq;
> +
> +	irq = pci_irq_vector(pdev, msix);
> +	if (irq < 0) {
> +		drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
> +		return;
> +	}
> +
> +	free_irq(irq, xe);
> +}
> +
> +static int xe_irq_msix_request_irqs(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
> +				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
> +		return err;
> +	}
> +
> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
> +				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
> +		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_irq_msix_free(struct xe_device *xe)
> +{
> +	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> +	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
> +}
> +
> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
> +	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index 067514e13675..24ff16111b96 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -6,10 +6,13 @@
>  #ifndef _XE_IRQ_H_
>  #define _XE_IRQ_H_
>  
> +#define XE_IRQ_DEFAULT_MSIX 1
> +
>  struct xe_device;
>  struct xe_tile;
>  struct xe_gt;
>  
> +int xe_irq_init(struct xe_device *xe);
>  int xe_irq_install(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
> -- 
> 2.43.2
> 

-- 
