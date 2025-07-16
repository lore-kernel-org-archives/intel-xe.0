Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B4C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 11:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C5310E08D;
	Wed, 16 Jul 2025 11:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPRZ+1tk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B29D10E08D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752666888; x=1784202888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QK7GwPokxfkFnLjTuGKJz1losxkv59zuQqSRhwdWCac=;
 b=kPRZ+1tkGgmwfDqCZnASs1f2mF6mRomYYAFiYz1K86gty4Clc+B9+ekL
 MasKQvKpbmWt/Q/kp07i7zTQG06mNj9IRMldbDSF8FHvgSPXNsjFxK8Fn
 7apa7WNmavDOOoTfycPtdSIulJ9izMqgw1VVgqlahaKiARvha6hPJET+h
 wRYjeco7J3hJeG01efbotNg/QvoRm9XdCxnoyY99BLx1l/EA6fVhZhKmT
 hQ1/xRefZKoVh8lj8uV2Px7vRUEStbme8tI5vFr4P6IxrIBsqe5f3V+Os
 BClV1M4N1EBeR9uJ+RquZqTLX2Ax9yy18olhfRDU90Q/M3hXhqKLlZ8u3 g==;
X-CSE-ConnectionGUID: zGFCjToAQfy9cXQ8pxMxlQ==
X-CSE-MsgGUID: WvwZXCYORTyad1Hb205EFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65973330"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="65973330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 04:54:48 -0700
X-CSE-ConnectionGUID: ukXEXcUeRKO2+JL8Aiij9Q==
X-CSE-MsgGUID: 7WNF6ahkRaylSZgO65gU3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="161814371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 04:54:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 04:54:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 04:54:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 04:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE9fia3el5WNpIwoce23g+Jl63psjJZC3wxuNW6xfmQqIk8xYM013j1cMTLW0heCUXkLl0rROJYnR6LbZ/77aK2WLf6h5wCnCBskSXM/9gokyX2NqjcqEfcW0dQtusdqDqtw+IaANCgE3QlXtXEuWfonSTxFsqW9OnJ5OL0HwCh3pPOs3/svGg5oTKmRCjArXMJllRSFFSkuxHsEps+rfpaK/d5YYUZi2wjw/TzY1JYHhLvR6NWhZDYpOglhepD9OMu6GjE3W2tRTjYVdQwMJnjT7XVwUnTVT4RRyUSDhv7iynbmPAOvwzhLQKn7pBlWZfcET+BWK1X5ghvSG0bMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWsd5cNS5YCPS9p+9Y3eqfHbhBNftvBz79B/hIPqkzo=;
 b=AGn27PEpDGTb571CNK6GQIDAcoc6Y+tjxMi+1mgEQt36xxjzDxT95lJVfXEDx3G0gk6f9NlvpXXtpvDSPuGN+3764rKwrkeIbh0fY8PjA5sL9rnDAKHqhArLUnN38Pr+ZNRMgfWZdilIQmcLjkTWC4tRU7sNo5qkbaAChYb/Hy4K5UwBSbvQ6ov174KaUo9pDVFIcui4kpLW6YN9Ge9g4QRc1RNmhDJhzubrL5tg5YQIYNgrxxXvMgDSwAgZRy8YFMIC0BIxHSo2kl/ljC4XwZFNtRrMg6t593VRDj0542V7JtWXhJl7vB6xRuGYIPpc7tHb1mEF6OwQFYCBMb+rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ5PPF3A51834D3.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::821)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 11:53:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 11:53:57 +0000
Date: Wed, 16 Jul 2025 13:53:52 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 2/9] drm/xe/vf: Skip fixups on migration before
 getting GGTT info
Message-ID: <ihaclmyahp3lirvizz4v3gyxmmebppilzs4vqwsnsxpykinbkf@4lxh3jdvoq3d>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-3-tomasz.lis@intel.com>
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ5PPF3A51834D3:EE_
X-MS-Office365-Filtering-Correlation-Id: 65111ab1-4b7d-4833-461a-08ddc45f7185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUJiVTVEQjlKc09CYlJYTGR1dXN1WnF4NU9mZXhzbU1DR0xCM2JaK0h2aW9v?=
 =?utf-8?B?bjgzWGk2STV5c0N3Y3ZMTUVHM3p2TDltdEFBMU1uUDdxMDlRNzlsMHFMN09I?=
 =?utf-8?B?OGsyRE8xK0lUbVZpNDBmQlhsaDZiMUpUUkFKeUxBYnhaakxLUVVHTXUwdHB4?=
 =?utf-8?B?ZVdxUXkwK1FkYUZYam5ERzVSZEVFWlQvZ3N5L3FTNHozNjYxMFkrckIrMzRT?=
 =?utf-8?B?cWt5Ry9UTnFGSUU4MzNMUE5pdUw2SWU1SlNKbWp5c2ZoY3F5ZS92Z3VoZFpY?=
 =?utf-8?B?cXFVZUtEcGxJbHJpeXZPV3M5U0pLNnYxaVhpeG83MUhJTGFTWkwwQ2dSQmpy?=
 =?utf-8?B?c2VVcGxrdEFGeHdDcDl2L3VGMGdJSU5RYmc0VDhPMnZRWDVhME0zc1hnMkJw?=
 =?utf-8?B?WjV1Rm1CbFV1Sk9LZGpIVEdQRkpISUNaNjUzTEVobkFMV1g4WkZnYXQzUGhM?=
 =?utf-8?B?OWoxL3pQUmg2bGdENGNPeXFqMFlQdjhIbkhaUGU5bFhFN0xya1M2Yk9QaHlC?=
 =?utf-8?B?Y0tkV1hpOTdoYjhqNXRUbFFiRGYySjdvVVo3K2M2c3JTaHRKNHpmb0NIekYz?=
 =?utf-8?B?YkFJVE93WXRSNHBGT2hMWk9kN0xmODVyMVJXSnBWSDBRYnVjNWxmV01haEkx?=
 =?utf-8?B?aWl0U05mOGJrVzVXSzRBN05JQXNUTmFXcStyclMvSTJ1aHZLbEhTVURmZ1dn?=
 =?utf-8?B?VjJKck4wOWZyYzBVSWdqeFhtSW9ZdXRWeFRtMmhxWG9TM3JLRGNuRDhTYlhG?=
 =?utf-8?B?R2xBTFNvYUFSckFKak02cEk5bzRIc2szWGxnanQwUjlmNGYxaE5yZ2Q2K2Ev?=
 =?utf-8?B?ZWZLL250cVArbTFMR281UEZuQnF5RjdBQi9OSko5cTYyWkdVVXdvT2JjdlJ4?=
 =?utf-8?B?UDg3cGxRTkpyNzcxQnNpaXRnSGFmRUZwQURGQkRhUHBOOUhsY2ZDQTQvdnlZ?=
 =?utf-8?B?d2hNVmFBYk1EVFFCUSsra1pONzZDWnRNSXpDYUlBNE5oSVo4aTNsK05zL1dW?=
 =?utf-8?B?dFo4Q1NYNjR0NklVbFhyVEk1U0xvRTBqUUdkQlN2blBQMFJPMlZISmxNeWZm?=
 =?utf-8?B?ZytIZ0xVYi81bHB5Q3lJTmdudkg5bEtBaE05Q3k2SFJLQjBVcUtJcFI3eHpn?=
 =?utf-8?B?aHpENVcwRVovRnJ3ckg2RUNBOWR4czFzc3hnVS9aMVlxdGlmT3VNZTZnajZi?=
 =?utf-8?B?dkdTcGVBOFFYL2wvY2hET0RudWRsV281RDg5T0FvcVRCMFdMc1FCTmliVUdO?=
 =?utf-8?B?eVNBZUdUYnR0QjdWdjNMWFFGRDQ0VGdRYlJHQWtxU0IyR3o5RnJxZ2xQY1Vp?=
 =?utf-8?B?QVV2cDI1Vm5wTTBZZEJNWlE3bmxtTnhsVENkaDRlak9sMGdneCtiSDRRREd1?=
 =?utf-8?B?S0J6UTNpOExqSVhIalV0bUdwYlhlOEtMdmZqSEViRlUzWmZaTnBsODN3a3F3?=
 =?utf-8?B?WnZRZVhLbGlQRzNUZDA0a1ZScXpWMHI5RDd3Rm5IcXhQeklpbWJrV2VUT21p?=
 =?utf-8?B?M0pRK1d5S0swWFRBdGVRQ1pvN3FVVUF5VGdjNkxqK1hSY3FZdFplM204NHBE?=
 =?utf-8?B?MjVIY1FWME9DK1d0T0F0a05uem81U0ZWeWJmYm9rUjNQUHpmWG85eStJSzdK?=
 =?utf-8?B?SEo1cXlLRjZLcTBlbHVYQ2ViSE0yczBCdERyT2FaUWF6azhtOFBZU2JDR1da?=
 =?utf-8?B?RjRCWng4dmw2SmpPTEQrVnNWYkg5b3EzeS9XQlJYMkQvSTFabnJ0b2I3SFk4?=
 =?utf-8?B?T0loV3JOUHNUay8reHkvbWV1clMvYlNwUm1rWHE0MExmUEVHTFE4NmlINE80?=
 =?utf-8?B?NmlXSGVXK3NoUEkvaHVYaFczcXFmTEU2L2dqUlYrUGlWVDJ4K2Y1TS9aN0lM?=
 =?utf-8?B?MFpnTTZwTmdkOUtzY3U2aG04T0RGTWRMQmdnM3FpbjlUQ0xwRHdONWU5Ly8w?=
 =?utf-8?Q?I40ov9Llv6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVVTMC9CK3FqbVp1RGZTSlYzVzdUcDNHdWlnSWpETnFSRkZRc0NmWkxPanNq?=
 =?utf-8?B?cVg1LzF0SkNFNG5GaEFXdVhtR1Z0ZVNPMEUrV1A4TWQ3NTR2UFQ5eHNzcmlU?=
 =?utf-8?B?TWxBV2hFb0hGczJvOWNkSFhUQktQNjdWK0NWc3RqS295UWN2VDBMUnRBd2Ns?=
 =?utf-8?B?M1lCbVFGbnY3VEVtK0VDRUtYTVpONXdaTFNPRGpuajZESG03VUd5UWNhM1pn?=
 =?utf-8?B?Um1JWDhtc0NCNjRtMTBzYXJhT2t2cVNYSXZIR3lCd1NDc2dVR3JYc29TZlN0?=
 =?utf-8?B?SkVCVkJ4UW9SSzNlZ3ZVR0ptWElRck1HQk9kRmRYNE93UUtjV0JtVnNqOUE4?=
 =?utf-8?B?b3NHaVJlVnBTZmV0WHdadDJBKzg0WjNEaEJXV3doWFp6RHpxRm9jSDVyUVhC?=
 =?utf-8?B?UHlEMTFXK21wbFlEVTBvNDZ2YjhXRXQxcHpPSDRad054aWJhRnZVVGtsYWc2?=
 =?utf-8?B?TWlRUWpqVTlHcjZRV28waWtOcDRhcHZ0dmpsbmVnRlUxTzREZllCcUNTaXBa?=
 =?utf-8?B?MEc3WEpFSFRHaytMME80NUtFWVNGWHkvaFB2NmY4enRWSDYzMVJGenlBRndu?=
 =?utf-8?B?eWF1c2taWW9UM2NVNDY3SnQvOHNqa2N5Z1NXOUhmcjhoZmxSQnZwUFpxMDV3?=
 =?utf-8?B?bE1jYVVNSmR1NjNyb3c5MDFadTBZSzk0WmUrTWhtVHVqWXB3S1BYVVlZdnoy?=
 =?utf-8?B?ZFIvSTJQT3hhL1Q4Y3VHRVNtZFBpVmpESUFYT2IvMWU3dVVGc1l0U29JbFlk?=
 =?utf-8?B?a3RvK0JGRFlHY2tTc0UxQ0VpS2V3NS9hU01ZbE5PSWhyWmEyWStpaU9BYml0?=
 =?utf-8?B?cjN4bVJBMFFMaG1UREJZTnBXdTNEOC9zanBKRFJxUUEyZTNQRlpRY0pNdGlr?=
 =?utf-8?B?UnVLcG5LbXpVR2FUUmF5eGpQWkVkM0c4d1NSdk9IR3E2NkI4czhLanhQSVBn?=
 =?utf-8?B?OHBSOXFpaHR3SERBRjdPdkhZU2I3bEd4YjZ1cHlPOFFaQjQzbW8xVlY1clVm?=
 =?utf-8?B?dnVnZjdnbGJoL1FtRW5vb1orOUZVU0JEOVkxRGF4WXdMcktjS0tab1Zzd0da?=
 =?utf-8?B?UFhzd2NjZExvSTNaNXFhUWU4blg1MlY5OXI1VFN0KytiYmlsclJYenduMHZ5?=
 =?utf-8?B?bmZMc1Rmb2FIRHJmbjJXVHArcUJZMHY4eFMxN1BJOEx4WjlXcmN6WjA3M2VU?=
 =?utf-8?B?OFQwVzAyeWdDSWIvRjNwd2YwWXYyMkoyNzBVeXVvMkt1WGNTNHNpV0pBV1ND?=
 =?utf-8?B?dU5YYWtqR3M3ZnFOeDJxMDNicDgrdElxOGs5clRHUkljRW9ONFdnWjRPcWhj?=
 =?utf-8?B?ZGwzWmlvSEtWcDcxa2U2U1JDQmJ2NnRmQ2Z6R21tZk5wa2d5aCtTYVNISisw?=
 =?utf-8?B?NXBLbTBzaTRmL3BUVlE4TEtQWGFZYjkzMC8xNXFXSWpLYVZ3MjdETmRabXg3?=
 =?utf-8?B?eVFGdFlEcmEwVWRCejRreVRJNFpTQU9oSi9nU0laOUZGbzA5NlgrOUpybWdT?=
 =?utf-8?B?TnB6aFQvclNZbXVuZVdsNE1JSlJQdmpZRWJEdUNlNlN1Z1JzbEY4eUxGaENj?=
 =?utf-8?B?QmlVMnVaL21LQlpZTkJlZHNYazJTaFpIVXZSR2FyNmpiU0dQRFlMQVcySE4v?=
 =?utf-8?B?NW9JV1Z2QmhReDd2TFFDMHBJMzBsZ09iUm9KK01JbXJoVnU5RVNEVWlqanNi?=
 =?utf-8?B?cjR3Z0tWTXA0SG5GbnRIdm1JQVhlWFdKaGtqd3c5VjIzalFNck9kWnhDSzZo?=
 =?utf-8?B?WnRwU0JzN05kNGhOVzk0UXpnNlBFbE1mSityTmdZT3VqdEhaeTFCakgyR2tx?=
 =?utf-8?B?OVBZcnJIRjFzSHFSRHByYUNBVnJNWWNNRk1tQjJ0bVhUZkRsQ1hKL3RKM20v?=
 =?utf-8?B?MEVzelZTd0YzWnVYaUpzNldBc29wdDBObHdGcVo5S2ovdTdWY2c0b0EzOUFC?=
 =?utf-8?B?Rm5Tb3ZFRFB5MVlTbkNtVkJyNXlQV0tvR003bnl2MTVia2dDcGFDWDBiS2pE?=
 =?utf-8?B?TGRNeGh2a3JvakVtZWJrK0t1azQ2VkR0cEFpYjRjYldidm1Lb1FFa2hEM0Jv?=
 =?utf-8?B?L0xWRGo4YkVydTlIK3ZGTnY4TCtjK1lISHM5ZllUOVk4TUNRTStVNWlROTZ4?=
 =?utf-8?B?MVdVS01HVWFIM010dWRzR2d3eXpQRm1zQlBZYUFyZU9kQmpzK2t5QzdIRk03?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65111ab1-4b7d-4833-461a-08ddc45f7185
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 11:53:57.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVO4krQ/UirvI3adlGhzDz6zDPLvDCxZrZ9bnDD9AETumn68+P4fM+OIdid3dn9EiA4XxJzDoW7zRznEpqulBx7EsYd4a3JmjK589+1OSvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3A51834D3
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

On Fri, Jul 04, 2025 at 11:02:21PM +0200, Tomasz Lis wrote:
> The RESFIX state should be achievable only after a successful
> handshake. If VF KMD has no GGTT configuration yet and we still got
> into RESFIX state, then either we're dealing with unclean initial
> state due to unusual actions before probe, or the migration
> happened while xe init (started by probe) was running.
> 
> In 1st case (migration before probe), we should just skip migration -
> init procedure will ensure exit from RESFIX state as it starts GuC
> handshake with a reset.
> 
> In 2nd case (migration during xe init), the migration procedure should
> execute normally if GGTT configuration was already acquired from GuC,
> and can be skipped if it was not acquired.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 93cd26dca070..591ce84223c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -762,6 +762,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  
> +	if (!gt->sriov.vf.self_config.ggtt_size) {
> +		/*
> +		 * If driver initialization is running in parallel to this handler,
> +		 * and it did not reached acquiring GGTT config yet, then ignore
> +		 * the migration - init procedure will create the GGTT at new place.
> +		 */
> +		return;
> +	}

If driver initialization is running in parallel to this handler - we're
missing serialization for gt->sriov.vf.self_config.ggtt_size

-Michał

> +
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
>  	 * We need to be certain that if all flags were set, at least one
> -- 
> 2.25.1
> 
