Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F87FC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 07:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719710E282;
	Fri, 14 Feb 2025 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMZgpay2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8814B10E282
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739519656; x=1771055656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jxJYfdKfIZ4QcaNqKFmbvH7ra1CTMoXifw2jOep2Un8=;
 b=WMZgpay2yo4u0watbsr8rxvi+ZOUqrJpRxkp6xzYR++sGAxM7CWvxjiV
 wdbphsciAoETG5bOYm1JtelD5vJPe1PTijh2BhKIO3eas6oPsmIhWyllT
 Q/9JVJ0tBXrcYLpbDR1DihELV5ldI6JKfgg+mTkcECD0GeVWo5fZgG15p
 vbtGlnCHpkOXaTn0txsB0bSpUrSMFRBRQXeqB3ErA5YTuygipNstbPWSu
 k4/OdDLt0LFn5rg8S6lBcnnM8+rcUPU+YZ6NAYPb3zCmCaxQk7AeILV9l
 2ikGQqi2mx9hmNZ4o6YilYuh0jKrs90vqJKsQiTUb69yXH2SMuONhN/BQ A==;
X-CSE-ConnectionGUID: G6rRNo6AQw2bIYKIh3wN/g==
X-CSE-MsgGUID: QCn857jhTgegSP6/V4bUEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40182568"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40182568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:54:15 -0800
X-CSE-ConnectionGUID: 69QAqGuBRBysVijskcV4+w==
X-CSE-MsgGUID: ONcx1+c6RViLIP2XFZXjjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113255944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:52:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 23:52:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 23:52:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 23:52:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuDu1Pl0yBIPIv0OWUavEdebR8MHoY0oGc1iM7aeD1KtVDy/Q1i0akdyNcOZOVWgq+PT5AxK9PDY1yYdGcemWEfQcgXj+GlLfssWbF23Vc5bu7tjOA9217W4+Kpat1U1T3E7kOVY77Miq2RILRh65gqxM4+3ktMNkuWzIVwLU2+I9+1l6ESQvDDcxaUN0fZqOAipY6f4LpLTpf+beJUiEWbaExPb6Mk2vI+OyM53A+wOuNBHlikzQE8+oZwxd8mQcLACMjgVl2m5djXW0vtbCtwg3ts2h8y0WueOpSJzWnuC1NbD9Sby7op/Nvar8Wsw/r5s4us2pvMP+UogpUpc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyUp9RPNbJI+jZUV8EY1pARhtbHPjjxjasVjNKAEERA=;
 b=PkVO+gCPYmsfuTkiuWGFLW5VKycCk4AJ0Xw1t5muMydK++6TssRXKP2zx5M0O6coqrPkzGthqGaETfaAOalr5aImWsLW6i65tRsDGRIEHmEB1ZhicyBuMpp0WoAtLdOxkiLE/jrebfgxTde2s5P11xFmVCTTFkWjUXyvxlhQ++VX6ccqpU4e6kW4CKpViMrnNM7nyOOzPYeUKJWHuwqhvD/ADkFZ61ZYS7Nhs5QsVDvnL739t5csow4UbRofI4irRGePPGJP8VckXfW6DTTgEPVaH6a5QJ/5iQi+9so1pCR9WM7fcLRW4jTzQGXR4bhLLxtxklsq4q1AaXdU0MJPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 07:51:59 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:51:59 +0000
Date: Thu, 13 Feb 2025 23:51:54 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 4/8] drm/xe/eustall: Add support to read() and poll()
 EU stall data
Message-ID: <Z672GhrHuyQaGVBd@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <2c6ba4545b30b3f7ff0055fd9994618fd31d12ab.1739193510.git.harish.chegondi@intel.com>
 <851pw37zrk.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <851pw37zrk.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:303:b4::29) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec8622a-b25f-442a-d1f0-08dd4ccc75d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3pGbWJBcU5rTzZPb3JzZmIwMVRjY0lWVFZZMmRDQi9FSnVsODVFcE9XZUxa?=
 =?utf-8?B?b3I2NnJqZUkxSmxBZm5UbG9kN3dVMnh0K3lGb2lvMS9iTnpxRENhNVd6Rll4?=
 =?utf-8?B?UFJrL3JOOWNJUmM5QXV6a2hud0Q1NVB2cmpYU1ROR2dudkNWRFVuVzRab1hO?=
 =?utf-8?B?bXhpMUVOdXpERjdRUCtNTEtTd0NGa2gwNFJBVTUxNS9MdFRCckU5eWJ5UVZ1?=
 =?utf-8?B?a0x4YVo5T2RiTklkSSs5eTVUanRsREZubUwxb3hkbGdBSHZCNWNzK2RhTm5F?=
 =?utf-8?B?K1FzbGZtSEtBelhtdm84WDltdFREQ2RaRzVvUFN1d1plVkt4QmNwNE5mWFM2?=
 =?utf-8?B?RUVpVXVScUtUcjhTVXVRSlZUUG1hY0tISVZyTnRZeVMvemNJMVRvbmJDRndG?=
 =?utf-8?B?SDhjVTRsQXF0b2hVL00veGhtd1BkZnZGTkpsQWhpSUJIa3lMU1pnWWNwTXlQ?=
 =?utf-8?B?NElhQnJNMnpOcTlsRFN3Y0NSc1pBMTJnSVVLbEFJd3FBcDVOaXQwTXMzcFB5?=
 =?utf-8?B?cm5zd0NXdnk2aXRoQ2ZpR0pjL0pMZlZucmtCVlJuaHhGWVUyQ1JTdW9hVStt?=
 =?utf-8?B?aWY0UXkrVTk5M2NoendFMWM2S0JNWHZPTCs2RHVBRFJ4U0ZjeHluTklMdW1z?=
 =?utf-8?B?RHQ5a0k1QTc1eTdXZ05YWkNKRGlRTXVZSGpneTY3RnVpUWJURXpMNHlDelQ2?=
 =?utf-8?B?eENidUgvbkFqQkp3WG03UDJTQjY4cFpKd3FFTVRVdDFPVnZhL1FxdS9KZ1lm?=
 =?utf-8?B?S3JTQS9DS05sRVFLVkZPUVkxdExvZWVLcjVCUmtBZ2VNeUhHazl6NlRqRjI4?=
 =?utf-8?B?b3MyWmdTVVdDRE1UTjl3cGIzUWFCRkJaaWZvWU1VUjVjdmVJa2IzclREUGtT?=
 =?utf-8?B?anlERk01dGdvZUlKOEtFN2dZNFJlTDRZZ2ZxUHFTNDNnSjFadSt5eTNFM2lT?=
 =?utf-8?B?Y2poT3ZZVUFxVklEeTdaSFpXdjNvQks4UzNlczhZMi85c2g0cnV0WVVnVEVx?=
 =?utf-8?B?azZ6aGUyYjNmTUN5cVVqei92OFZJMXFSRzJ5WUppTVVqcjBTbjhxVy9lSEk2?=
 =?utf-8?B?WTQzWVhTSVZycmFQbmJqOHdUd1ExYU55Zi93OFJ6dXJXaW9mZ2xvVUhzWkR6?=
 =?utf-8?B?V1o0Y0lGamdYUDZiWDdSUUtDQ2NibXVFdFUrTXhHdlU1WERpZHFTaEZXTVV2?=
 =?utf-8?B?cGZtZ0pHT1pVVnFaOWlGalpjb2xBMFdRcXAxcDlLbDNFY240UTN1L296WEFo?=
 =?utf-8?B?TktpV05vMUJBaTNlbnRUQWdmYTVNbktlTlRiUEx6dUYzeDhOUXpBUVdrYk9D?=
 =?utf-8?B?UTdoVldvTkdkVnNPTEtydExScmlmTElmQ21uUHo2L3h6S0JVSStOa3RSMHN3?=
 =?utf-8?B?aEpnYVVJOUZwdTJubStQeHJYZnlTdWJvMnFlVWwzdkU3OTJqMTBFdHJkTjJM?=
 =?utf-8?B?OFlDZDFDRnFPVWZOdzVveUl6YWcrU2wrbXpOK2JNbW1BK1VibVU2U3JWMjZF?=
 =?utf-8?B?OStTWWVON3NiTlhMbC9TQktQcE9taDAwai9jMm5lOFBxWUF2RlFaamlwRk5s?=
 =?utf-8?B?REdMYk9sWWlwSFp5dnJndWZhbldUcFYvMllpK1RPeWpEV1pSMGJGYm1QM3py?=
 =?utf-8?B?K2xLdWRYQ1NJdUdyV3NXRFk2TmVtdzYwa0pWTUlrUytJR0UycWFvU0poRnZn?=
 =?utf-8?B?dndIK21JSTlEWUhKUFFXeFF4QzFIakJLYXpTYWpLWEx1TWJNdTRqSGFKU0RW?=
 =?utf-8?B?cmIydnNkdHlqM3NYaUZNTVNudm11d0NrSkMweTdteTFZMnlTNUQzajJGQnU2?=
 =?utf-8?B?cXVuU2FERU4wTHpnYk9yZmUyeHIrNEtxelNIZm9sVkhtbmNkd1IzSmYwR3pr?=
 =?utf-8?Q?o9GDlqll+tprv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzN1WWxqUUgvWjlZWjF0d2ZOZ1IwMmh4U21OUHdLZzNXUnBqSzVLSlZQOXJR?=
 =?utf-8?B?dG12Z2x2K1NKNmhnVmFkd2ZRTDZENmE2Q3BBTU1IYjF6d2pNL1dieWFSc2tk?=
 =?utf-8?B?ck9YOEVQM1BCc01qYkdyR3cxZ3UySjVuUHd3RTV4TWVwZjd0SlRmUEkyT3No?=
 =?utf-8?B?c1lqY3JiVDdkb3RiOTVvcHBRU25JU0RxdVZVUWpIcVdrV0h0V013OXJaMDhx?=
 =?utf-8?B?aUtEMmk4U1A4d0NXTjFITVp4WGozYjhvdEYvWnduL2R1TVBiTlIyTWhnb0Iz?=
 =?utf-8?B?OVJzUFI2aElwT252bE5jWWZmanVQUnQ5ZlE0L1lDakk4ekpQTDViaDNmSVpl?=
 =?utf-8?B?S3VWQnJ5am1NbFZMSWtROXVTYUpaZUp1bmY1Z1ZsaDFzMmVHOWI3ak5UWjhK?=
 =?utf-8?B?aGQwWk1iMjhTUWV4akZiWkxUUkxZM1Axdnk3LzU3MEQ3ei82MDVLUXkrenZ5?=
 =?utf-8?B?Mlg3RVM0Z0xDL3BxVnVDeWNwc0V6aGRlelpoVWh0MzVZMWZCV29MQjVMUU0v?=
 =?utf-8?B?T3daQ280WExiUHdDVFlGSFQ5eFhublVCclhxSkZOTUVhdHlCM0g1eUx6MVZt?=
 =?utf-8?B?aGJUSkNRTFk4VXFqbzRaOXNRazdKRTFRU3E0Q2ZaRFZZQmt1R1lQWWVRWHRo?=
 =?utf-8?B?NVN4SzFkVjl4cXFSb0lldTh5cnljNG11TmQ0YTYyb0VxQWF2Ukx6d0l1anRa?=
 =?utf-8?B?MkQ1cWFoWkkyYUliUXVjUDh0bGNZZm5CaWdmRVorK0FuTDZ0TE5JSDduOEUz?=
 =?utf-8?B?Ty9IcTFGSk1zNjJwSUVDanZpWU9zM1Q0eXhhLzFKTFFvNGtYeDVUci93dnRM?=
 =?utf-8?B?cE9zUkd4UXBiT0FvYnhMeVZmZnRTUlpkNG1zZDBKOXI0WVQ3UFR2VlQ1em50?=
 =?utf-8?B?ZDF4RkdtWUgvK0s0RlQzUkhlNzdNZ29MdFdxTm1Hc1F4eWNyaWRwQkxjVU1G?=
 =?utf-8?B?L3FZaHVZWGR1N1NsQ0tVMGRsN1VYS2xkVjFzZUN1ZDNHRWtuS1E2K2ROTUcv?=
 =?utf-8?B?Vk15bThUZlllMklZdjJxQjVZdlJvWnkzSjlpY2FvM3BFMlUxZE95dGpKM25r?=
 =?utf-8?B?Y1RicEIrcUJnVE9ML2ZNdmpYOEg4emR4SEk3WHNqZUFubWlFRGFianlGaGlv?=
 =?utf-8?B?cGZpc0JZSUpoQUM2SndwZEFWMW1oam55U2t3d1ZGN2FneGZTdWdncWVXc0Vr?=
 =?utf-8?B?Yi9NQ3BDQUZUcWcyb2FWY1ZySnFacitZU1h6RlUvbWQyczNrMDRId3NUdHNN?=
 =?utf-8?B?M3VKV0dIaDJIbGlta25Vbkl3R1NQZFBxUXp6cHdBMEgxUnk2WWRlVGFzMzdq?=
 =?utf-8?B?OTd4NG5jTi9hK2xhb08xZWZRKzdtQ2NrWUg0UFJiZnJkZmJDMW5ONTZWNmpB?=
 =?utf-8?B?OUhIeXB1b2FnSkFVazloSlBycys4UE92K2daUnNRSnNVTmhjMUNOMnI4TXJi?=
 =?utf-8?B?QnJaa29DcGppQ3ZnUHJ0OXhTL0ZKaFJ4VHVzVExVN1V4Q3M5MnNPOFNoYUxQ?=
 =?utf-8?B?UTdNaGdtMHEreHU0RDNDK2lmODNFaEIxNjNEZXdpSnY4Wmg1QWM4bzBmT0x3?=
 =?utf-8?B?WTAxNlNuM0FvcjhCaTEydVR5OWFTbWFFVlFFb0owWUMvWE1RdXlpN3d4clhE?=
 =?utf-8?B?N0JPWjgzd1MwZjdEelY5VVllM3ZueXlrbFUvbnNGcHl5Sm1GMU10eHFVbTNQ?=
 =?utf-8?B?MkYxR3NnMEprWWlxUU8zOTExSXhCWFlPeEUwU21FTDdZNXFZV0tLQVBBa1FB?=
 =?utf-8?B?WXFOQ3prblcwcytpMEg4MHBYS1AwbzdIdThPMXovNzBhb1BKSnpYbE9ramhq?=
 =?utf-8?B?QjdWR0VCTGYrM25uYXVScGZHZnh5cXFyek44UmVjYko3QTV5QktEUWdCNkpK?=
 =?utf-8?B?ZmhsUkNTT0c1RnRwbi84ZXJZZVkvT3c0dE5zSjJBVlZWOVJYbWFHSldzZmFq?=
 =?utf-8?B?a0Z3ZGxGdEUxZ0lUdkF3WkgvemxUS3IxTDQ1OGVFT2hqa0k0ZHR1YVNXSWJS?=
 =?utf-8?B?QzUxZUpydkRwc1NkWVN3NTN5TVlhNmZ3ZWdvVU94ZEFROGZkeFRWYXEvRGdU?=
 =?utf-8?B?M2s4d0cyQktZa0pPV2FaSU1yanlzNHlRTUxSWEU5WGZvZVhWNzJoYTNxYVNP?=
 =?utf-8?B?cEdCeWw4NDJJYitJU3YyOXhNM0RpS1Q2V3ArRUpncEx3dVJqNWc2UVEyU2xl?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec8622a-b25f-442a-d1f0-08dd4ccc75d7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:51:59.2507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T66upxoaV2YZuf4XNujOFEJLJXktPEMisSGY8NMmmyAnMfsKt9ZWX5JoIJ2yW9g2fEbF2Ux0Xh/9mCy1dpVkzXrjSBOW2L3U4cMZDgGyXNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

On Wed, Feb 12, 2025 at 11:02:07AM -0800, Dixit, Ashutosh wrote:
> On Mon, 10 Feb 2025 05:46:45 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > Implement the EU stall sampling APIs to read() and poll() EU stall data.
> > A work function periodically polls the EU stall data buffer write pointer
> > registers to look for any new data and caches the write pointer. The read
> > function compares the cached read and write pointers and copies any new
> > data to the user space.
> >
> > v9:  New patch split from the previous patch.
> >      Used *_delayed_work functions instead of hrtimer
> >      Addressed the review feedback in read and poll functions
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 267 ++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_trace.h    |  33 ++++
> >  2 files changed, 298 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index 12afa9720971..53f17aac7d3b 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -21,6 +21,7 @@
> >  #include "xe_macros.h"
> >  #include "xe_observation.h"
> >  #include "xe_pm.h"
> > +#include "xe_trace.h"
> >
> >  #include "regs/xe_eu_stall_regs.h"
> >  #include "regs/xe_gt_regs.h"
> > @@ -41,7 +42,9 @@ struct per_xecore_buf {
> >  };
> >
> >  struct xe_eu_stall_data_stream {
> > +	bool pollin;
> >	bool enabled;
> > +	wait_queue_head_t poll_wq;
> >	size_t data_record_size;
> >	size_t per_xecore_buf_size;
> >	unsigned int wait_num_reports;
> > @@ -50,6 +53,8 @@ struct xe_eu_stall_data_stream {
> >	struct xe_gt *gt;
> >	struct xe_bo *bo;
> >	struct per_xecore_buf *xecore_buf;
> > +	struct delayed_work buf_poll_work;
> > +	struct workqueue_struct *buf_poll_wq;
> >  };
> >
> >  struct xe_eu_stall_gt {
> > @@ -256,6 +261,190 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >	return 0;
> >  }
> >
> > +/**
> > + * buf_data_size - Calculate the number of bytes in a circular buffer
> > + *		   given the read and write pointers and the size of
> > + *		   the buffer.
> > + *
> > + * @buf_size: Size of the circular buffer
> > + * @read_ptr: Read pointer with an additional overflow bit
> > + * @write_ptr: Write pointer with an additional overflow bit
> > + *
> > + * Since the read and write pointers have an additional overflow bit,
> > + * this function calculates the offsets from the pointers and use the
> > + * offsets to calculate the data size in the buffer.
> > + *
> > + * Returns: number of bytes of data in the buffer
> > + */
> > +static u32 buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
> > +{
> > +	u32 read_offset, write_offset, size = 0;
> > +
> > +	if (read_ptr == write_ptr)
> > +		goto exit;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +
> > +	if (write_offset > read_offset)
> > +		size = write_offset - read_offset;
> > +	else
> > +		size = buf_size - read_offset + write_offset;
> > +exit:
> > +	return size;
> > +}
> 
> Looks good now :)
> 
> > +
> > +/**
> > + * eu_stall_data_buf_poll - Poll for EU stall data in the buffer.
> > + *
> > + * @stream: xe EU stall data stream instance
> > + *
> > + * Returns: true if the EU stall buffer contains minimum stall data as
> > + *	    specified by the event report count, else false.
> > + */
> > +static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> > +{
> > +	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
> > +	u32 buf_size = stream->per_xecore_buf_size;
> > +	struct per_xecore_buf *xecore_buf;
> > +	struct xe_gt *gt = stream->gt;
> > +	bool min_data_present = false;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> 
> u32 and move above to u32 line?
> 
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		xecore_buf = &stream->xecore_buf[xecore];
> > +		mutex_lock(&xecore_buf->ptr_lock);
> 
> One thing I am wondering about is: do we really need these per xecore_buf
> locks? How about moving ptr_lock into xe_eu_stall_data_stream and just
> cover for_each_dss_steering() calls with the ptr lock. Because the polling
> thread runs every 10 ms, this should give plenty of time for the polling
> thread and the reads to go through, even with lcontention. And it will
> eliminate all these locks and the locking/unlocking overhead.

I used a per dss lock so that polling and read on two different
subslices can be done in parallel. I will try moving the ptr_lock into 
xe_eu_stall_data_stream.
> 
> > +		read_ptr = xecore_buf->read;
> > +		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
> > +						       group, instance);
> > +		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
> > +		write_ptr <<= 6;
> > +		write_ptr &= ((buf_size << 1) - 1);
> > +		if (write_ptr != read_ptr && !min_data_present) {
> 
> Don't need to check for 'write_ptr != read_ptr' here, it's already
> happening in buf_data_size.

Yes it is not needed. But eu_stall_data_buf_poll() is invoked approx every 10ms.
I am not an expert on compiler optimizations. If the compiler definitely
optimizes and prevents call to buf_data_size(), I can remove this check.
But if the compiler doesn't optimize, wouldn't this check help avoid
function calls given that this function gets executed every 10ms?
> 
> > +			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
> > +			/*
> > +			 * Check if there are at least minimum number of stall data
> > +			 * rows for poll() to indicate that the data is present.
> > +			 * Each stall data row is 64B (cacheline size).
> > +			 */
> 
> I'd say this comment is not needed and should be removed, the code below is
> clear enough.
Will remove.
> 
> > +			if (num_data_rows(total_data) >= stream->wait_num_reports)
> > +				min_data_present = true;
> > +		}
> > +		xecore_buf->write = write_ptr;
> > +		mutex_unlock(&xecore_buf->ptr_lock);
> > +	}
> > +	return min_data_present;
> > +}
> > +
> > +static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
> > +				     char __user *buf, size_t count,
> > +				     size_t *total_data_size, struct xe_gt *gt,
> > +				     u16 group, u16 instance, unsigned int xecore)
> > +{
> > +	size_t read_data_size, copy_size, buf_size, data_record_size;
> > +	u32 read_ptr_reg, read_ptr, write_ptr;
> > +	u8 *xecore_start_vaddr, *read_vaddr;
> > +	struct per_xecore_buf *xecore_buf;
> > +	u32 read_offset, write_offset;
> > +	int ret = 0;
> > +
> > +	/* Hardware increments the read and write pointers such that they can
> > +	 * overflow into one additional bit. For example, a 256KB size buffer
> > +	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
> > +	 * write pointers. This technique avoids wasting a slot in the buffer.
> > +	 * Read and write offsets are calculated from the pointers in order to
> > +	 * check if the write pointer has wrapped around the array.
> > +	 */
> > +	xecore_buf = &stream->xecore_buf[xecore];
> > +	mutex_lock(&xecore_buf->ptr_lock);
> > +	xecore_start_vaddr = xecore_buf->vaddr;
> > +	read_ptr = xecore_buf->read;
> > +	write_ptr = xecore_buf->write;
> > +	buf_size = stream->per_xecore_buf_size;
> > +	data_record_size = stream->data_record_size;l> > +
> > +	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
> > +	/* Read only the data that the user space buffer can accommodate */
> > +	if ((*total_data_size + read_data_size) > count) {
> > +		read_data_size = count - *total_data_size;
> > +		read_data_size = (read_data_size / data_record_size) * data_record_size;
> > +	}
> 
> As I said, my preferred way of writing this is as follows. Isn't this cleaner?

Most of the times, the if condition would evaluate false and the body of
the if statement would not be executed. Whereas in your code the two
lines of code get executed all the time. 
> 
> 	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
> 	XE_WARN_ON(count >= *total_size);
Wouldn't count (size of the user buffer) be greater than the total_size
most of the time? I am still not convinced with having a WARN_ON here.
> 	read_data_size = min_t(size_t, count - *total_size, read_data_size);
> 	read_data_size = ALIGN_DOWN(read_data_size, data_record_size);
> 
> Since data_record_size has to be a power of 2 for this to work (which it
> is), I would even put a
data_record_size is fixed in the hardware. As of now for both PVC and
xe2, it is 64 which is a power of 2. I am guessing that it will remain a
power of 2 in the future too. Why should we put an assert for the record
size which is determined in the hardware?
> 
> 	xe_assert(xe, is_power_of_2(record_size));
> 
> in xe_eu_stall_data_record_size().
> 
> 
> > +	if (read_data_size == 0)
> > +		goto exit;
> > +
> > +	read_offset = read_ptr & (buf_size - 1);
> > +	write_offset = write_ptr & (buf_size - 1);
> > +	read_vaddr = xecore_start_vaddr + read_offset;
> > +
> > +	if (write_offset > read_offset) {
> > +		if (copy_to_user((buf + *total_data_size), read_vaddr, read_data_size)) {
> 
> internal brackets not needed     ^
> 
> > +			ret = -EFAULT;
> > +			goto exit;
> > +		}
> > +	} else {
> > +		if (read_data_size >= (buf_size - read_offset))
> 
> internal brackets not needed          ^
> 
> > +			copy_size = buf_size - read_offset;
> > +		else
> > +			copy_size = read_data_size;
> 
> if (write_offset < read_offset) how is this 'else' ever possible? So
> shouldn't copy_size just be set unconditionally to 'buf_size -
> read_offset'?
If the user buffer doesn't have enough space to accommodate
(buf_size - read_offset) bytes, the else will get executed.
> 
> > +		if (copy_to_user((buf + *total_data_size), read_vaddr, copy_size)) {
> 
> internal brackets not needed     ^
> 
> > +			ret = -EFAULT;
> > +			goto exit;
> > +		}
> > +		if (copy_to_user((buf + *total_data_size + copy_size),
> 
> internal brackets not needed     ^
> 
> > +				 xecore_start_vaddr, read_data_size - copy_size)) {
> > +			ret = -EFAULT;
> > +			goto exit;
> > +		}
> > +	}
> > +
> > +	*total_data_size += read_data_size;
> > +	read_ptr += read_data_size;
> 
> Because there is an overflow bit we can just add without worrying about
> wraparound?
I want to make sure only one overflow bit is used and doesn't overflow
into the second bit.
> 
> > +
> > +	/* Read pointer can overflow into one additional bit */
> > +	read_ptr &= (buf_size << 1) - 1;
> > +	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
> > +	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
> > +	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
> > +	xecore_buf->read = read_ptr;
> > +	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
> > +				    read_offset, write_offset, *total_data_size);
> > +exit:
> > +	mutex_unlock(&xecore_buf->ptr_lock);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
> > + *				    per xecore buffers to the userspace buffer
> > + * @stream: A stream opened for EU stall count metrics
> > + * @file: An xe EU stall data stream file
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + *
> > + * Returns: Number of bytes copied or a negative error code
> > + * If we've successfully copied any data then reporting that takes
> > + * precedence over any internal error status, so the data isn't lost.
> > + */
> > +static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
> > +					      struct file *file, char __user *buf,
> > +					      size_t count)
> > +{
> > +	struct xe_gt *gt = stream->gt;
> > +	size_t total_size = 0;
> > +	u16 group, instance;
> > +	unsigned int xecore;
> > +	int ret = 0;
> > +
> > +	for_each_dss_steering(xecore, gt, group, instance) {
> > +		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > +						gt, group, instance, xecore);
> > +		if (ret || count == total_size)
> > +			break;
> > +	}
> > +	return total_size ?: (ret ?: -EAGAIN);
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> >   *
> > @@ -272,7 +461,35 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> >  static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> >				       size_t count, loff_t *ppos)
> >  {
> > -	ssize_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	ssize_t ret;
> > +
> > +	if (count == 0)
> > +		return -EINVAL;
> 
> I believe we need to also handle the fact that count might not be a
> multiple of record_size. The easiest way to handle this seems to be right
> here:
> 	ssize_t aligned_count = ALIGN_DOWN(count, stream->data_record_size);
I think the code handles buffer sizes that are not multiples of record
size. Copying few lines of code below. Wouldn't read_data_size be only a
multiple of record size ? and leave any remaining space empty that is
not a multiple of record size ?
/* Read only the data that the user space buffer can accommodate */
if ((*total_data_size + read_data_size) > count) {
	read_data_size = count - *total_data_size;
	read_data_size = (read_data_size / data_record_size) * data_record_size;

> 
> And used aligned_count rather than count in xe_eu_stall_stream_read_locked
> calls. So that we don't have to worry about this in later function calls.
> 
> So above will become:
> 
> 	if (aligned_count == 0)
> 		return -EINVAL;
> 
> Unless there is a minimum user buffer size we want to support, in that case
> this becomes:
> 
> 	if (aligned_count < minimum_user_buffer_size)
> 		return -EINVAL;
> 
> But to me looks like a good value for minimum_user_buffer_size is not
> available.
I guess the minimum user buffer size should be the data record size (64
for PVC and Xe2)? If smaller than the record size, the drive will be
unable to copy any data.
> 
> Anyway, better to handle this degenerate case here itself.
> 
> > +
> > +	if (!stream->enabled) {
> > +		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!(file->f_flags & O_NONBLOCK)) {
> > +		do {
> > +			ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
> > +			if (ret)
> > +				return -EINTR;
> > +
> > +			mutex_lock(&gt->eu_stall->stream_lock);
> > +			ret = xe_eu_stall_stream_read_locked(stream, file, buf, count);
> > +			mutex_unlock(&gt->eu_stall->stream_lock);
> > +		} while (ret == -EAGAIN);
> > +	} else {
> > +		mutex_lock(&gt->eu_stall->stream_lock);
> > +		ret = xe_eu_stall_stream_read_locked(stream, file, buf, count);
> > +		mutex_unlock(&gt->eu_stall->stream_lock);
> > +	}
> > +
> > +	stream->pollin = false;
> 
> Carry over comment from previous rev: this breaks if user buffer is smaller
> than available data. But this is a corner case so let's fix this after the
> initial merge.
I will check your fix in OA to better understand the problem here. If
the user buffer is smaller than data record size, it just returns
without copying any data. 
> 
> Let's put it a list of to be done's in the cover letter to do after we
> merge in the next revision.
Okay.
> 
> >
> >	return ret;
> >  }
> > @@ -281,6 +498,7 @@ static void free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
> >  {
> >	if (stream->bo)
> >		xe_bo_unpin_map_no_vm(stream->bo);
> > +	destroy_workqueue(stream->buf_poll_wq);
> 
> Don't put this here in free_eu_stall_data_buf, put this in the caller of
> this function, like the destroy/close function.
> 
> >  }
> >
> >  static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
> > @@ -351,6 +569,21 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >	return 0;
> >  }
> >
> > +static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> > +{
> > +	struct xe_eu_stall_data_stream *stream =
> > +		container_of(work, typeof(*stream), buf_poll_work.work);
> > +
> > +	if (eu_stall_data_buf_poll(stream)) {
> > +		stream->pollin = true;
> > +		wake_up(&stream->poll_wq);
> > +	}
> > +	if (stream->enabled)
> 
> See comment at xe_eu_stall_disable_locked. If we do
> cancel_delayed_work_sync there, I think this stream->enabled check might
I will explain later why I used flush_delayed_work() instead of 
cancel_delayed_work_sync()
> not be needed here. Also see comments at cancel_work_sync in
> kernel/workqueue.c.
> 
> Could you please check and see if it works out. xe_guc_ct.c (and
> xe_gt_tlb_invalidation.c) seem to be doing that.
> 
> > +		queue_delayed_work(stream->buf_poll_wq,
> > +				   &stream->buf_poll_work,
> > +				   msecs_to_jiffies(POLL_PERIOD_MS));
> > +}
> > +
> >  static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >				   struct eu_stall_open_properties *props)
> >  {
> > @@ -361,6 +594,11 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >	u32 vaddr_offset;
> >	int ret, xecore;
> >
> > +	init_waitqueue_head(&stream->poll_wq);
> > +	INIT_DELAYED_WORK(&stream->buf_poll_work, eu_stall_data_buf_poll_work_fn);
> > +	stream->buf_poll_wq = alloc_ordered_workqueue("xe_eu_stall", 0);
> > +	if (!stream->buf_poll_wq)
> > +		return -ENOMEM;
> 
> Now we also need to destroy_workqueue during error unwinding (see comments
> regarding this in Patch 3).
> 
> >	stream->sampling_rate_mult = props->sampling_rate_mult;
> >	stream->wait_num_reports = props->wait_num_reports;
> >	stream->per_xecore_buf_size = per_xecore_buf_size;
> > @@ -391,6 +629,19 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >	return 0;
> >  }
> >
> > +static __poll_t xe_eu_stall_stream_poll_locked(struct xe_eu_stall_data_stream *stream,
> > +					       struct file *file, poll_table *wait)
> > +{
> > +	__poll_t events = 0;
> > +
> > +	poll_wait(file, &stream->poll_wq, wait);
> > +
> > +	if (stream->pollin)
> > +		events |= EPOLLIN;
> > +
> > +	return events;
> > +}
> > +
> >  /**
> >   * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> >   *
> > @@ -401,7 +652,13 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >   */
> >  static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> >  {
> > -	__poll_t ret = 0;
> > +	struct xe_eu_stall_data_stream *stream = file->private_data;
> > +	struct xe_gt *gt = stream->gt;
> > +	__poll_t ret;
> > +
> > +	mutex_lock(&gt->eu_stall->stream_lock);
> > +	ret = xe_eu_stall_stream_poll_locked(stream, file, wait);
> > +	mutex_unlock(&gt->eu_stall->stream_lock);
> >
> >	return ret;
> >  }
> > @@ -416,6 +673,9 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> >	stream->enabled = true;
> >
> >	ret = xe_eu_stall_stream_enable(stream);
> > +	queue_delayed_work(stream->buf_poll_wq,
> 
> A blank line before this line would be nice.
> 
> > +			   &stream->buf_poll_work,
> > +			   msecs_to_jiffies(POLL_PERIOD_MS));
> >	return ret;
> >  }
> >
> > @@ -429,6 +689,9 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >	stream->enabled = false;
> >
> >	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, 0);
> > +	/* Check for any new EU stall data one last time */
> > +	queue_delayed_work(stream->buf_poll_wq, &stream->buf_poll_work, 0);
> 
> I am not sure if this is needed, especially if we use
> cancel_delayed_work_sync.
There was an ask from the user space to check for new data once after
disabling EU stall sampling to make sure we capture all the data.
> 
> > +	flush_delayed_work(&stream->buf_poll_work);
> 
> I think here we should use cancel_delayed_work_sync() instead. See
> e.g. xe_guc_ct.c (and also maybe xe_gt_tlb_invalidation.c).
I though about it and found that the difference between
flushed_delayed_work() and cancel_delayed_work_sync() is that
cancel_delayed_work_sync() cancels any pending work items and wait for
any work under execution to complete. Whereas flushed_delayed_work()
schedules any work pending and wait for it to complete. Since I want to
execute the work one last time after disable, flushed_delayed_work()
is more appropriate here than cancel_delayed_work_sync().

Thank You
Harish.

> 
> >
> >	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
> >	xe_pm_runtime_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index d5281de04d54..1cc6bfc34ccb 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -427,6 +427,39 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> >	     TP_ARGS(xe, caller)
> >  );
> >
> > +TRACE_EVENT(xe_eu_stall_data_read,
> > +	    TP_PROTO(u8 slice, u8 subslice,
> > +		     u32 read_ptr, u32 write_ptr,
> > +		     u32 read_offset, u32 write_offset,
> > +		     size_t total_size),
> > +	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
> > +		    read_offset, write_offset, total_size),
> > +
> > +	    TP_STRUCT__entry(__field(u8, slice)
> > +			     __field(u8, subslice)
> > +			     __field(u32, read_ptr)
> > +			     __field(u32, write_ptr)
> > +			     __field(u32, read_offset)
> > +			     __field(u32, write_offset)
> > +			     __field(size_t, total_size)
> > +			     ),
> > +
> > +	    TP_fast_assign(__entry->slice = slice;
> > +			   __entry->subslice = subslice;
> > +			   __entry->read_ptr = read_ptr;
> > +			   __entry->write_ptr = write_ptr;
> > +			   __entry->read_offset = read_offset;
> > +			   __entry->write_offset = write_offset;
> > +			   __entry->total_size = total_size;
> > +			   ),
> > +
> > +	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
> > +		      __entry->slice, __entry->subslice,
> > +		      __entry->read_ptr, __entry->write_ptr,
> > +		      __entry->read_offset, __entry->write_offset,
> > +		      __entry->total_size)
> > +);
> > +
> >  #endif
> >
> >  /* This part must be outside protection */
> > --
> > 2.48.1
> >
