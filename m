Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DD9C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 17:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC910E295;
	Fri,  7 Feb 2025 17:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY+5NHJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966110E295
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738947879; x=1770483879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uwq1WXw32QqDCOA91w65xaUqvYIMnYbFdZ8DuShLVUg=;
 b=YY+5NHJ6Ez7D/5m0Lv+zJoDwwHp6wo2/FHSC6Tpxue5pa2dFU7moEvHn
 mSv/R8HFOQF/RFUtzYpepS7eR3lIYTWkLtyyFB41lk7+O+MTHvugBoSNO
 LLMPdIlByjbiC+C/iTq9VTKEY5v8YkjKJIbb0/CZw9A04uvlSKiFJMt5G
 fRVDuZh7+QHkDLalvDuX9EcKVULWI+Dx7kJ7ljByDLKQWCxJJYhj+Ot+s
 N+7lnk+ih+9LE1NIi43AFZpA0AqrvKqxEpVlvdpahCwf3SRbur5ny0SO9
 hpxeiBchUnZLrAtgcPOggM3KJplg1kaq4LWUaiG2zNbtReta4L86E+h86 w==;
X-CSE-ConnectionGUID: mgC9F7eqSoGvet7FPzP/Aw==
X-CSE-MsgGUID: C5kJKEyJSMaMYXH50bHJYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39724460"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39724460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 09:04:31 -0800
X-CSE-ConnectionGUID: rlyVa5vjTKiMclvl497IGw==
X-CSE-MsgGUID: t5YR1npiRI6MY3nIlvAa1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111784332"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 09:04:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 09:04:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 09:04:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 09:04:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0o8mvCJWxkVlutZT5rLUkkKmUIO7kGdas8oR9F/sB+E0WwgYLs2IIq29O/YnkvszkvqTF1BLANZuF5tualMujiLhXz1JM0VcXSQ7qlEALfmLS85elpP4sZGsRx0PbsfjFw015oc22RnMp351FusX27FHd8uTy3+TnUTyxKzeBVGPHBB7Rq/xW3i3NyL1G9pmwzlXVZWGwgvqbtFneKBV6+Miyt+MhCW3qm4rrift5Db332ISnz0SifiKdUcZrttmIKkapoDNsGWtvnxt2Wpq4t1wwrF3CXKDUFdhRCUkJVUFr1D5wyHvElGofRYDa50TrsW+Bju/lXQcVt4LxsdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN2zOfiA32YGwIBiofcplg+rUqfKdAGYHa3SS+NAKY4=;
 b=UPpMD0MYNqZR0mNVR+s/9ibAPTDkZRavSoCKbPNXc3CA4Fh1DFzCBqNtOPLH2k6lSavPU41sJV+s9fU34Ok2OrCFDz6/QM/snd1jGbLFokaDt5JMToB18P6WdDGeXlA2cfGop2aXhxYybdGejeYVoVR/52cd/0I4RjPQyyRhGMYk89yTq12HJ9ZdXGHjghNBtzDQsuy8XNoWcdAMwCKAs1mtPr1ybnWm+J9eDrgUF/orYGqgnSXdaWALKFT6ZniCOcD7h2LG2LVHY5BumI8FNKbFrq0KSsBkymBkKTpLlJhvM0gdLqk8Sb5YdD/Uy+Wl9OmFduMTV29k9D/pn1ne3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 17:04:18 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f%4]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 17:04:18 +0000
Date: Fri, 7 Feb 2025 09:03:23 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <tejas.upadhyay@intel.com>,
 <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <Z6Y827Qs2KON-H0P@msatwood-mobl>
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
 <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
 <Z6Ttkcj_XWatYkkF@msatwood-mobl>
 <k4s4hzkryw33v6iy77ippwfqpzgvarbey2ac4vaapue4glsonv@3jhaz6lteoaw>
 <SJ1PR11MB6204B568C84D3D28ECCDB92481F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20250207162406.GW5109@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250207162406.GW5109@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f242aba-f388-41b1-5732-08dd4799755b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXJpU2FJSzN1L1dsL2VhYU9PWldNaUIrWnlDVXF6NU05UklSYVU5Ti9CdzdX?=
 =?utf-8?B?QXNzWm5QazVSM25ldC96V1JJWFJ2ODRwTXFBYksrUXZRbU55cXg5dkxuYUdC?=
 =?utf-8?B?RUhZa1JuT0lmRHpqMGFTYUNWVlJtZ3NwbFRSM25mRjd3am8wR25NdXE0LytX?=
 =?utf-8?B?MWlHUEkyRGs2VytMekVwbkFhNGVzRjhqRFlvejRtclhkeUU2akhHd25QWGgz?=
 =?utf-8?B?OFo4RGk1cjBWQU9XZlZJNHl5amtzb2tCMEtPaXp3Q21yY3hyU0l2UklaM1Iz?=
 =?utf-8?B?R29sazhYZm02Qk9oNzlIQjJtWTFKeG00QXRyMlBMaHNXdlhVd0RQNFlGbXV2?=
 =?utf-8?B?SkUzOGZXY09aQjcvNUlhREdTcHZLTkdBcVJvSjNzVUdRdm5xZzdCb05HWnBG?=
 =?utf-8?B?UUIxQ2k0bVBSV0tvVVM3S0djTk1KSXpLMWpFRzhZa21lNHkxMGJ0WXVzRFRx?=
 =?utf-8?B?bkYwVVFFVVBhRTkzMUdqZWtzWFdsNkRGK0JqVFo3ZTlmbFZBQnE4SUdiMGFM?=
 =?utf-8?B?ZFpSNC9LT3pyMm5lN3R4Qi90aVlXSmJVbzVpU09hc1lWU3EwaU1vVFZQQkg1?=
 =?utf-8?B?UXFLQUo5RXNjTENXZk0ra3hqMFFzbW1qbUV4NUhnc2xoVTNGNGFCZ21YUlFa?=
 =?utf-8?B?RnJuSkt2Y2MwbytXZU1KQkovcmEzcmkzQWhYeisreENITXVsSm4xdTFxdmcv?=
 =?utf-8?B?ajBnTHNGMkVhZG9yQVM3KzczTnZET09FVkl1cXp6bkhDL1oyTzJrY3JDY2FG?=
 =?utf-8?B?aG5RL0xHNTZaSkF1WGxWM3BKZURPei80d3ovRGJCTkIyOC8wYW9SQ0FwMDlL?=
 =?utf-8?B?MkdaaW1kWUtvTmZqS0N6aGoxYXRFWWpYanFRQjlONUpDVWE2ajloMXpEUUx0?=
 =?utf-8?B?RUkxNjBNTHM5Vmlhc2EzeWg5U2VVblpXU3dTRmo1alg4T0lZT040QW1zeENZ?=
 =?utf-8?B?MVEycFNYYXNIVmRsUHBsZThKUGxtTDhYZjRZdTVkRktBNXphQTVwc20zUXZI?=
 =?utf-8?B?YW9WOVBpSUxvb2NLbVFTRGRYZUhIenIzZU5xd2V0Z0ZJdnREeWFWWXhMOWFR?=
 =?utf-8?B?K3NSK2ZjaTFiS09KcGVqTlk1NHNGb0VoNlNlci9hbkZuZTF2cEp3YWJsTEsw?=
 =?utf-8?B?cUlmWVl0SnJtRkJLNHNCdG9TQWxaK2lqRnUwMUpEVW1YUHVnaXJPT3RtQlcv?=
 =?utf-8?B?REtvckJ0TVhBZEt3Mm8rT3IzTjBPV1RTdGdrUUF5TElZQitrUHhKbjdMTFBX?=
 =?utf-8?B?K2R4MGxWWnA2b2NUa05DMTVmSThFcDEyazNlZWhpQWt4ZVFkY1lWVkcwOVJU?=
 =?utf-8?B?aUxqWDR4d2x6b3pSbzA3NkM0VWpOM3dZU0lBeko4R29LWE85WDdzSERsVGFZ?=
 =?utf-8?B?WVo3WklEMENxOCt4SkFnbjVhZzlkdlU4dzAvWHU0aXowUjkrV1BPaG9Ca0V5?=
 =?utf-8?B?c0dTTW9XRjVtWE5iRHJJcXdOWEJOYWd4RGFoa1NoMmZBazFsQWR1b2tVckFW?=
 =?utf-8?B?NjlCZGFpYWYzejNUeStwZTQ4aVlmM0hqRExhOGt1dDNyT01mMnhZZkczY0JL?=
 =?utf-8?B?QyttYzZjdnFjc0ZxKzBTZGU3WjRKNW9wakxEVmVJN3dGVFFRNUgzQXp3Qlhj?=
 =?utf-8?B?dk9OZVJvdmxPOWR3azA0azczV3JvYnI3a2N6RlZCckpQQzRPdjFlRWpzNjBH?=
 =?utf-8?B?Szc3bWRwcE9scE00U0xjRlhRSmtrWlJBa3NzbUY4Q2pUOUpIWHJOcmZUdlVH?=
 =?utf-8?B?a2VwSW5nZ1NBS1Vxd3E2b05iN1JzRG1xU05XM3lyYnhDVHNWd0FvUkpobXhJ?=
 =?utf-8?B?c1paOU9LZzgrdy9BVE1DejBMU1d5dWsrb2pZeUJoRDJ2RWI4dFdCQ1dPdG1I?=
 =?utf-8?Q?DQH5ZhAsX1Hnf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K090V045VkFUVFRHZGcxNUoxZGRzNkZYdlYxak0xRTl6QjRRYVN4TVgxWWFv?=
 =?utf-8?B?ZWVpREpxWUhFWXVVZ0V5U3FBQm9yVTJ6cWlvU3kxbTFqNkZWM1gva1dJREo2?=
 =?utf-8?B?dmoxVmN3SktISGZPTVVDbTl5eE9GbXZRYjVQeVZGUjF1NXJUU0VESGVGNlRI?=
 =?utf-8?B?OE43VlRzUG5nMmNIRXhtWlFkcjFvQmdjUExGclRibForcWdTUlJZVzdpdTEr?=
 =?utf-8?B?ajBSNEpXVjJVSG5haGNKS3ZqaUlIS3JyeDFZemczR0tVQy8xMzN2aU1PWUZY?=
 =?utf-8?B?SGFFU2xuYUZYcTgzT2JxQkUxNmt0NHQ5cC9sUk8rSmV1ZXdVN2c4bWJldnFF?=
 =?utf-8?B?aktxa1lDajhQS1JrUWt5ZG1kUTJpY3hFY1JFYVlCRVlZWnhkYzVteUIvRVdC?=
 =?utf-8?B?V25ucXRLSGw3MkxVaGNVS1RpOVFIYVRTVkc4SU54bTd1a1BGUUdrQ2Jwc0Ro?=
 =?utf-8?B?cUIvdzNJRXMvMkpicE03VzBsWnBLeTlxYTg3M0Ira2tqQUhKU1ZNRE4rQnFv?=
 =?utf-8?B?K1ZKOWIzckZUbkNjTGYyeVRWYWpEaUpaVnFpTk1BbGVDcGZCT0d3eU5mcGZv?=
 =?utf-8?B?ZUcrem9tRTFQTDZaemF0RHFFc2p2b2M1ZnZEZ1JNbUp5WDhMVDgwV2wyZjZW?=
 =?utf-8?B?ckR3TVIvQk1nazhaVEhFdWlFOU5FL0NaK1JtZjdJeEpMOEdPYk81cjhxTWJV?=
 =?utf-8?B?OEhPRmdUaTdQR2djckQ5YnFNMk4rbFZRcU4rTldzQTBmNGg5SndDc1dCS1U4?=
 =?utf-8?B?dEFBb0xtYlFtWS92bkN2ZkJuY3YxcmhBck1MQWhqeFdYNmgzMTU2NmVWdFhx?=
 =?utf-8?B?eW5CR1FDeThXWDVuNUF0bHZ2TmF4NzBxMFBtY1ZkVzh1NGhLQmNiS3lKRU9R?=
 =?utf-8?B?SGJSVWNkdDNCOGFSVFZrVEdqdHY1b0x6Y1BQREVVWEtidHU1MEsxc0RDdS82?=
 =?utf-8?B?TUhjWmtxeFZNL1B2cU05RVAzMy9zSkdWRkg1b3UxdUtpTzhJL0xPaWRlVVFx?=
 =?utf-8?B?ZHBmSnErZUNrNGNLV0FDcFI4WVJCaTJiN3JoTVZPUlcyNXNIRTRxb0dFVjR6?=
 =?utf-8?B?RHBIR2xiaEhrUnN3MlpTREVFd1hqeXcyMGt6NHVDS1FhVWNuQmhPSHJaeGJG?=
 =?utf-8?B?OVp5cFI3NFlkVGR4MVpMTDAwTG5UUTJmQVcwWVpzSnN6UDEycHdCTjdxTUFC?=
 =?utf-8?B?Y1lINTRWcnZkK01oamUvUzB4OWhLTi9UMGFBbk8xaTkwd3VhV211MkloSms5?=
 =?utf-8?B?MkxDTmtMdnp5K29CREZqWWNiSUNheEc4VERDU2ZxZ2cwVzloTFpmdjFGNHFj?=
 =?utf-8?B?aVhXRTFKTUV6VG1DbUJYQ2VKaEQrdkJzZGFoOGV5VDhpcFFFUTRjMTFNU1Fr?=
 =?utf-8?B?MnBhMDJWM0M2VmUrdG0xOU1SRXV6ZTc5Qzd2NHpodzhmd3dzTHZTdzNtNnRP?=
 =?utf-8?B?YWxnMXVuRGp5TzJnZGhhVzNFbGMrb2krdndsamNkL1VYSmY1akZ3TGtTb1Yr?=
 =?utf-8?B?TTZ5bTFKYm5xSWEzdlgwUlZhRGJ1RjVwOVZXZGtZUkp5d290TUFXM3Buaytv?=
 =?utf-8?B?dFVKZzk2T0tZVk8rdTZIc1djdVRtVFZBT1dNSzFJYk9KUko1R0ZSKys3Witz?=
 =?utf-8?B?NTlDS1V2MWluSlJsdEh1VEh6c04rMGNWbzdxM1A3YmhmNGFnM3FjNlVVVHVG?=
 =?utf-8?B?RnJzTnlzb05HMXJzVjlLMndmcFJxSnpCR1pNcTFMZE1BR2ZaUlphcHd2RE5L?=
 =?utf-8?B?UUNTaTN5YlpyN3BqNzRkMko5ZjlVNjh3M0gvZG1oV2o2TWFMNWJpZlgzVFZV?=
 =?utf-8?B?WldHYVoxSmRYdkFvRHE1aUVzUjI3ekJIYXNqdHpMaTFKVFdyMEZrbjdzVVZY?=
 =?utf-8?B?WnliM0JKSnpzOVlGZ1F5ZEhPeEJ1SGt2bTlHeElMM01SWnZMZGpUZFN1TXBw?=
 =?utf-8?B?bTV2QlIxY29QMXY0bVF1dmpNT2t6R1lzMkNmd1V4Slh5a3R0VlkydXkxcmdQ?=
 =?utf-8?B?RmdJL1NvcmlEQy9tOFZ0M05jT2szOHhhNm8wdTUyVVhQWVVvQlVnL1NKdEZa?=
 =?utf-8?B?dThta0lubE45OWM4NEtNaDhzeTJnWitjSzlaNDQ0UTFUODZGejlYbmJoTXNR?=
 =?utf-8?B?aEhmTnRwbWNJNk1zOUlYaUdDbzBDU0J4eDdjZVgrdUZnakxoZ1VFTlZma2Nl?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f242aba-f388-41b1-5732-08dd4799755b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:04:18.2181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXYrBrkBTsolhmLtSQKkez+B7LChZ/eXZI6XcyU942m/W8YqJMD+aRi47+24t3tMKuKDnq9fI4K+Im9SQx8YCUNEvRZMn0q3sOrsXfJpTqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

On Fri, Feb 07, 2025 at 08:24:06AM -0800, Matt Roper wrote:
> On Thu, Feb 06, 2025 at 08:56:32PM -0800, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > > Sent: Friday, February 7, 2025 5:03 AM
> > > To: Atwood, Matthew S <matthew.s.atwood@intel.com>
> > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> > > xe@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
> > > 
> > > On Thu, Feb 06, 2025 at 09:12:49AM -0800, Matt Atwood wrote:
> > > >On Thu, Jan 30, 2025 at 09:30:30AM -0800, Matt Roper wrote:
> > > >> On Tue, Jan 28, 2025 at 04:55:51PM -0800, Matt Atwood wrote:
> > > >> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > >> >
> > > >> > wa_15015404425 applies to xe3 A0 step as well.
> > > >>
> > > >> We really need a better commit message explaining how this workaround
> > > >> is different from our usual ones and why it needs to be handled in a
> > > >> special way that's different from all of our other workarounds,
> > > >> especially since someone who just quickly skims the workaround
> > > >> database without digging into the details is going to incorrectly
> > > >> think this just applies to Xe2 media and isn't relevant to PTL.
> > > >Ack.
> > > >>
> > > >> I was kind of hoping we'd add a more well-defined infrastructure for
> > > >> handling device / SoC workarounds.  Adding quick hacks like this is
> > > >> going to get out of hand quickly if more of these start showing up.
> > > >Any particular ideas here?
> > > 
> > > at the very least, use XE_WA(). You may need to extend the matches it knows
> > > about to implement what you need here.
> > 
> > As far as I remember, init of wa_oob was little late so we could not use XE_WA. I am not sure if init wa_oob moved elsewhere and we are good here!
> > 
> > I was seeing below assert and thus we decided to go with what we have here,
> > 
> > It asserts,
> > [  778.229096] xe 0000:00:02.0: [drm] [drm] Assertion `(gt)->wa_active.oob_initialized` failed!
> >                platform: LUNARLAKE subplatform: 1
> >                graphics: (null) 0.00 step **
> >                media: (null) 0.00 step **
> >                tile: 0 VRAM 0 B
> >                GT: 0 type 0
> > [  778.229121] WARNING: CPU: 1 PID: 1567 at drivers/gpu/drm/xe/xe_mmio.c:133 mmio_flush_pending_writes+0x33d/0x350 [xe]
> 
> You can't use XE_WA unmodified since it's currently GT-centric and
> relies on various stuff in the GT already being initialized, as you see
> above.  However you can either extend it to also support device-level
> workarounds, or at least create a similar XE_DEVICE_WA() framework that
> works in a similar way.  Device workarounds ultimately depend on the
> platform and an SoC stepping derived from the PCI revid, and that
> information is immediately available on probe without needing to bring
> up the GTs.
Ack.
> 
> 
> Matt
> 
> > 
> > Tejas
> > > 
> > > Lucas De Marchi
> > > 
> > > >+Lucas
> > > >>
> > > >>
> > > >> Matt
> > > >>
> > > >> >
> > > >> > v2: query based off SOC stepping
> > > >> >
> > > >> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > >> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > >> > ---
> > > >> >  drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
> > > >> > drivers/gpu/drm/xe/xe_step.h |  2 ++
> > > >> >  2 files changed, 9 insertions(+), 6 deletions(-)
> > > >> >
> > > >> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > >> > b/drivers/gpu/drm/xe/xe_mmio.c index d321a21aacf0..98d068ad33bb
> > > >> > 100644
> > > >> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > >> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > >> > @@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
> > > >> > static void mmio_flush_pending_writes(struct xe_mmio *mmio)  {
> > > >> >  #define DUMMY_REG_OFFSET	0x130030
> > > >> > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> > > >> >  	int i;
> > > >> >
> > > >> > -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
> > > >> > -		return;
> > > >> > -
> > > >> > -	/* 4 dummy writes */
> > > >> > -	for (i = 0; i < 4; i++)
> > > >> > -		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > > >> > +	if (xe->info.platform == XE_LUNARLAKE ||
> > > >> > +	    (xe->info.platform == XE_PANTHERLAKE &&
> > > >> > +	     xe->info.revid == PTL_SOC_STEP_A0))
> > > >> > +		/* 4 dummy writes */
> > > >> > +		for (i = 0; i < 4; i++)
> > > >> > +			writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > > >> >  }
> > > >> >
> > > >> >  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg) diff
> > > >> > --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> > > >> > index 686cb59200c2..879486a818e9 100644
> > > >> > --- a/drivers/gpu/drm/xe/xe_step.h
> > > >> > +++ b/drivers/gpu/drm/xe/xe_step.h
> > > >> > @@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step
> > > >> > step) { return step - STEP_A0; }
> > > >> >
> > > >> >  const char *xe_step_name(enum xe_step step);
> > > >> >
> > > >> > +#define PTL_SOC_STEP_A0  0x0
> > > >> > +
> > > >> >  #endif
> > > >> > --
> > > >> > 2.45.0
> > > >> >
> > > >>
> > > >> --
> > > >> Matt Roper
> > > >> Graphics Software Engineer
> > > >> Linux GPU Platform Enablement
> > > >> Intel Corporation
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
