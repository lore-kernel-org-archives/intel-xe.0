Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE973C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 17:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0B210E587;
	Mon, 27 Jan 2025 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbbiJGLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B73610E587
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737997683; x=1769533683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OkWup92S06xjwAyUqvRGuACZvKDfZXB7LMnmZacrJFo=;
 b=LbbiJGLFKVmBUkBUWleqdMp34WsxpwCHsofXKpi7NpSv56+omJi5am/N
 JU+744rBhPHODQ6Uuh699Y+KwDsylT/2KGuqs96GTlRVsxPd54/9//jUy
 LRmj6rLriKTTwILpTuq4AzP7YnvEEaBakBDNaPc7nPBEO6KqJmpG0dqO1
 JhTm/47ccNX5YF9GMF9a4NBJGANKRZD84bJdiZFOSNi/3Gcv3q0uvTVlG
 /8qCJYU29LYGbqqtHNKXZjWJmQ3oceZTAMitA+phwIC1FmNJRcf8KlxYz
 4EW5aW89rNOd+15vp30R+cMrjM7egSk8oKmCh4Dndp2pgQTZqGR9WAjlN A==;
X-CSE-ConnectionGUID: yGiFY53IS4OXjVhQCR0SyA==
X-CSE-MsgGUID: snNgdheqQrGlDg9+gy9msg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="60935972"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="60935972"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:07:20 -0800
X-CSE-ConnectionGUID: 50utNyc4TB6jdRPeF2u9dQ==
X-CSE-MsgGUID: 4qW0BwQQSvubmveCUFOYPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113630590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 09:07:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 09:07:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 09:07:19 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 09:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igvIiOIfMOnY7R+vg6jLMwJIpylHVZjRi6ATlJINkohONUMaFLfha12E9l5XH8Q4fGzVQetszHlYatGc6FrLusDFQFI2sICNXfaENUbGKboCsOBEB7WrtDaBzwTu6ZOz9ru8+LVyLY6elwVaq0paD3gZRUi0i/19GEHOsM0abILbjIv+jzXscZIZ4O/DApzGrxLtfJOZcBFi7GDdDumVjaU6iWsZcb7m4bdS3UrSUSzC7pnhXf5LrHgacaCRpP7o6mP94PVetu4KN1KTRcMxVJAyT4uh79I6a5GeJLoALkLKjDZji0p/OdzNUzQUpPfam3ARiBELHe0aETg1JSnB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkWup92S06xjwAyUqvRGuACZvKDfZXB7LMnmZacrJFo=;
 b=i4KZO1kPXOmbqX68VYdv6E/VpxVujUUC8MZRbkZS2HWFTeZAXGS7eQubNIDccnXgT2taAENaRQguQHxs09JbF3Uf34fSp+Dhmuvb4iykUy24h06xcfJAj10CM5isulVYTCa95zzeEbELuiU4g+pUHFJ22owY/Ie3whdAu2h8hZ4sq/Z1JuWD+rCGo1xfa74BVnr8Rf5ysNGE8Xtvi8XlWtMNk8ZsF270BPnujUVP78wP6Lbgwr1hmyF4xNblV9FIoMgvBPeAGSoipp+mlYotWfC6t7zqtAl/fBV8trmKnuoMN39zNIxPz3msbJlLLw0E7E2O69aRLMuw3ouRZ+XBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Mon, 27 Jan 2025 17:07:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 17:07:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Thread-Topic: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Thread-Index: AQHbb3Pae3KYgy2ZIUmJI8VPwyjPK7Mq3OmA
Date: Mon, 27 Jan 2025 17:07:14 +0000
Message-ID: <838c976cbff003ce7b85d3dbf127f26d0d3e0979.camel@intel.com>
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250125215505.720-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB5263:EE_
x-ms-office365-filtering-correlation-id: cf4f7753-d724-4a52-98eb-08dd3ef50c15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VlduNmgrbEZDVUlEalhTUkVYOWhnWkJ6Zkk4TE5IcmdFaWFWdVJPM2J3b0M5?=
 =?utf-8?B?bHV5ZDJ1U2VyeEd4MjFSdWt3S1dDKzlrN05ReVNiSHVka2h0WXNSSDBRS0tu?=
 =?utf-8?B?enEzdDNLZUwrVDJ0K2I0U0ZUbDQ0ZE8zT2ZxNVNVb1hoc3c0SkI0MzBMdjJV?=
 =?utf-8?B?c2J5L0szRmxYV280L1JENi95NjFzenJ0Skd2UG92NFNmeDdaSHBsZzQza0Ey?=
 =?utf-8?B?Y0pETU9ZMHBlN05pVldYcmN1SWRMS3czaWxaR2VIa1lMN0J4bFNtZVB0Wk9K?=
 =?utf-8?B?cllMalhCRmU3a2FGanBPU1Z2MDduNklPNU5NcEF6OVlmeDZoOC92RFhNaXNK?=
 =?utf-8?B?THRLaFFXSkJDMC9XOXV1a1B3azlFSUpaWG9qNkVRaUdiZVFzU2hwRGtIdG5k?=
 =?utf-8?B?dEdtclZpdVhQVE1LT1dpUm16NmR0U3hxTEFPR0RNMHdKcGFKdEQwS0syN2dE?=
 =?utf-8?B?d014RHlBWTd4T3oxbGdxWmdQMkZTdzNUcGg3aXJOZ0praE5JUmNCYzNsWThn?=
 =?utf-8?B?K3MxRUYzMWhnZCtsNENiYnlRdnNEWWExUEpvOStqSExRWDJYMGlaUmduQW9p?=
 =?utf-8?B?UzRIZk1mUnhWQkRJdnBMN3pHdEwrYVNvMFBQdDBZbDhrTFJaOXRFV1haMHQ5?=
 =?utf-8?B?Umc2cGdFV1ZwUmtrNklWOFlFb2pjd1N2K3c1TmNkc2xHQWlKOWwyZ0t4bnMv?=
 =?utf-8?B?R2VpZUs3UmVCTXp2cGEvTitDUHUwQUY5VTBxQjI0SHRWWGNGdmR2c3duaWYr?=
 =?utf-8?B?MTVnRmpHa1pYQTMxTmN5aWFnUzFjTmJsdEJ5U3ZjdG1nK0d0bWllaG1lS3V6?=
 =?utf-8?B?QTJkeGYyOXdOYUlqZHJYSnhmaDV6d3g3S0RFdkhFWmRyMktibnUxcFlKMkNs?=
 =?utf-8?B?QWZoTTZBOFNYZmlLUGhyd1d1bzd5bjNKaUR3SVR3UThkZmtTMDNsNHoyNW9m?=
 =?utf-8?B?d1dHMDlYbzFuSzdQZHVsUEJsN0MyT1RSdjdrRzdLNlpBNmZKdFZxUFBPeHN0?=
 =?utf-8?B?dC9tK0tRRC9sdHp6dGVrdTRrSTFKZlVMN3p0Rk1GUWw5YVp5K0RPdFBQeDZa?=
 =?utf-8?B?MkIvNXlCdkplYXdtN3B2Q2wxbzlVMkdPNTlBUUN1NGVCaFZTWCs4NVhyMmty?=
 =?utf-8?B?bE1ZdmRhTVB6MjNQa1dpRHVSMDFTS1p1blkvclJBZCtLNndEV1JYdE4zRTNC?=
 =?utf-8?B?aVRIcnRrZnV2MVhiYzJhN2twL0svSGwvSThZNEdQSU82Y2MvaE14cVF4TmZp?=
 =?utf-8?B?Nnd0REIxckcxb1hnck04TWlwNitxaTgvR3VuWXY4a0VadGxmQVBhR3lsVEt3?=
 =?utf-8?B?N0JhWitSWml5NWR1dG1nRTF5UG5jVFY5R055dElQc2E3Q0J2dmtkUFYvNHdC?=
 =?utf-8?B?VVRPR3dtSUtoaW1hNm5xTVhNUWhvZVlOdGJsK0dMVlVsS21UYUlGd21KN3dJ?=
 =?utf-8?B?clhPYTRJTG1QdFdGZXJCdzNUWFh5dkhWaGRzeHd6L09QQzk4K1dKWXo4TEYr?=
 =?utf-8?B?RVBPUG41a2NRQm5INDBLZ0owYzhETHRBaUpkaEM5dWgyYTliMkxiOWZCTnBp?=
 =?utf-8?B?Y3NEeDBwYWNYNzU5aHJWSEVSQVZhb0RWYWlJWFE5OEcvc1crdVpheVFyemY1?=
 =?utf-8?B?VW9QQzZrRThoYzRJM25FbytXZTRWdEVzRTlyaXJMbHhoZ05jN2hKR0wzQ2Jl?=
 =?utf-8?B?OE1tTjU2ZHhsUU05WkJPb1AyaUd0K3lHaUF3Nk1JMXp5UFBJUEE1cWJ2ejNX?=
 =?utf-8?B?UHFUK0llNXRjMFdreit1SGFPREE1bEZhUWdUVGE4ZzdrRWtJOWVjazQwcFV4?=
 =?utf-8?B?YnY0amthUWl1ZC9XRWN0YWs3TjY1NzNpQmZ0QXh2cDd5OHBaTE5lcXBJZ1Bq?=
 =?utf-8?B?SFk1dmF2aUJHWlgxelVURkxGRnlUY05YdktlQUlpMUJ1S2hoYW5lUkZlR1A4?=
 =?utf-8?Q?WAtr71NCV/u6ct8WWT+BFWZ1nwzHlQrB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEpCdVNGVm9YQkgyVTFPekthTUpoSlc5YXhZWTNQcEZEWUF1MWpnMWV1Uncy?=
 =?utf-8?B?SUpGQmJRZDIvbUNtRTR6V2F4VTNyWEpQWlFvYTZuUXE1NFp0N2drRVkwQmhM?=
 =?utf-8?B?OTJGenF5L09TaWwyNWdXOTByWHBIS0NwZjBoRW5nbkRubkxQY1hRVEpIeFBM?=
 =?utf-8?B?TU53M0Q5ajhsL29qWjVPWEVvT2p0RzBZOTFjV2h1YWR1SW0rZW41S2s3K1VK?=
 =?utf-8?B?M0RSWEg0T3dDK0p6UFc3ZVkzSVFnb1R6aG4zdS9OQmp3dVdySkpMbVRCYkZr?=
 =?utf-8?B?aW11RU16TWxYc1dvamQwbFpKMDdIeHpRT3BYbW1KZlovQW1jQ2JGR3hqcXJo?=
 =?utf-8?B?bXM1cG1nYWdoS2svZUJxM21DMWUwM1ZtK25lMlFod3BEZHhKeEFKVGh4NFNn?=
 =?utf-8?B?QTFiSzZJM0JzS0hBT0JFa3JDcEIvVGNKUFZoSlNLM2tmQml5bHpHRi82QmRh?=
 =?utf-8?B?TmZ0SzhTNEN2NERDcXNZWnVNZHJFalo5Mlg2TlM3ZXYxTllqWHQrTDlGWE1o?=
 =?utf-8?B?emdGQmtjK05OUjk2ck9PMlRpVk82UGNMOVYxRUtTTjgxdmhiYTJPeUhFWjVz?=
 =?utf-8?B?NGtoSFJOUURndzRrZGVBVm5BZ3VzZHRjeWVnUkpqVHg5TVp3NGhxdlFubTNy?=
 =?utf-8?B?MTU0N0V5ODJBeEtWQzFQbGM2SkEwNzl5WS9yeDBkTjZOZTgzMjFucDFhbWIx?=
 =?utf-8?B?WDMzeHA0bXhKZ28rVzhFcVFKMFE3STh6ZlF0Q3hrdFdnT3dlMTczQ2FTZytN?=
 =?utf-8?B?THdJK1lxMWpyZVI4Q29tTk9wUXhYUlJzcEZScVJjNXBFcTd2OHVCa2FveDlZ?=
 =?utf-8?B?b2V0VjM1S3Z0L3pVTlRXZ0VlZkUwTkJuZGxrREd0SkFoMldTdjZVRm9KQVpz?=
 =?utf-8?B?OEg0ZXptVGQwNitnNlJJVGJab0RlcGc2SnoxTVpaa3U0NEZsSVhZSS9OUEps?=
 =?utf-8?B?ZU5Zakt1TlBaa0JMaHhtNlZwSzR0bEgvTWNsL2NWbTlsN2xlUm9rcmp2OG9T?=
 =?utf-8?B?VW9MWFROMWlrVFNHUkdGdTU3c2JPUktkOTVrdFNYTDRUM0hLZXJQYi9JZ29v?=
 =?utf-8?B?NnVET2dPWnlEd1hhTDhqR0VyZVhxZnY4ZFd6bmYxcUJtZTJoa1hiZ2ZiVUVv?=
 =?utf-8?B?eTdyRlFoeVpYYmRRMHhPalprTE9UZU5XYUsrQnozMzEzZ08wdjFubXFuNG9h?=
 =?utf-8?B?bVZQbGNtNmpseVBSVzBXVzVzN1pTZkRZcFA2Y015dExtbjVxS3BldWdERk9J?=
 =?utf-8?B?N1BhVEJPMVppRHB1S2cyaUg5d0FBY0VQNHUwK3RLMjFqV0F2a2lGU2kwSkpE?=
 =?utf-8?B?anlad1hhVE0xekwxSW5saWZnenVRcUU3eVFReGR2bkp5V00wTnlPSzY3NTJZ?=
 =?utf-8?B?S3AwZlFQMWI2RnhJMHk2ZzMxYlFhUHpuNVFEcXpjWW51WmE3c0JaWXNwLzlS?=
 =?utf-8?B?RVVkb0ZkSDZBTDhuTi9WYitacUxJY0pzU3pta0hVN1dISVEyTkM3NWVoQkk4?=
 =?utf-8?B?SytpbWFnODBoVmVJL2sxTTdIc3RXZVZBeXI2L0tIaWNWYngrNFFSb1ljTnVI?=
 =?utf-8?B?UWp0cG1DZXhENFR2UGlwWjd2STIwSlJocHAyUGtid0hwekdRVXMvUzlTZjla?=
 =?utf-8?B?b2JOMVpXZHcyYUcxL3J5OFFGcEY1ZXprSENjQ0ZkanpwODMwWWpXMHQ1SFI0?=
 =?utf-8?B?QkxIMWw3NytVVnR2WXF4dFpNNUppUnFJaExQVXlnSkZ3UGVBQ0RkNUxUejlQ?=
 =?utf-8?B?eSt0Z1Q2R2czTzR4SmYrYlRBTE43MHhPZnhCYjcwenVORVk2SDJ6RFMvbllD?=
 =?utf-8?B?Z3htQkZNYytJS3BrZCt2Z1krVCtLTlBpMUdkeGxtb290M1VYN0xOcEFnUjRI?=
 =?utf-8?B?RU1FTjBJMCtJVzYrTjdHdzNqWDVFRlc0bys5eG5HSlNhWVJkZkpIM1piSXl4?=
 =?utf-8?B?elhkOVpuR2gxdDRRWTAwVDAvbHdtanZ1cllubHl3cklZd1dJRHB1SERKcXlQ?=
 =?utf-8?B?ZDJETm4vaE9mTDh3V256eGdrWEc2NytNazkyMnZVczNTdEtaRE5yWERvcXVq?=
 =?utf-8?B?Nmg5bmZ3Uk9tSThXVDdXUXN6V3VRS0xQOWJoOXNDd2pYS0tTTmVxWm4zQkhS?=
 =?utf-8?B?K0JhbDJWeThHTDBLRm1jSGpBMVQxYUxZbzNkWk1xRVIxSDhINVRxZ2I1RzQ2?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46239E133C52DB4FAFAA483F09147E96@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4f7753-d724-4a52-98eb-08dd3ef50c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 17:07:14.6848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: felNA4Sf7/DIb66YbuwOTBfr57K+BzlMPn5rkac9Wa/MO3ue9gpGcuT/9FN0P3F5dAZQnfe7Rj3IFN+aRithmt0uxZ67elO4m1Y/9qKs4zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
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

T24gU2F0LCAyMDI1LTAxLTI1IGF0IDIyOjU1ICswMTAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBTaW5jZSB0aGUgR3VDIGlzIHJlc2V0IGR1cmluZyBHVCByZXNldCwgd2UgbmVlZCB0byBy
ZS1zZW5kIHRoZQ0KPiBlbnRpcmUgU1ItSU9WIHByb3Zpc2lvbmluZyBjb25maWd1cmF0aW9uIHRv
IHRoZSBHdUMuIEJ1dCBzaW5jZQ0KPiB0aGlzIHdob2xlIGNvbmZpZ3VyYXRpb24gaXMgcHJvdGVj
dGVkIGJ5IHRoZSBQRiBtYXN0ZXIgbXV0ZXggYW5kDQo+IHdlIGNhbid0IGF2b2lkIG1ha2luZyBh
bGxvY2F0aW9ucyB1bmRlciB0aGlzIG11dGV4IChsaWtlIGR1cmluZw0KPiBMTUVNIHByb3Zpc2lv
bmluZyksIHdlIGNhbid0IGRvIHRoaXMgcmVwcm92aXNpb25pbmcgZnJvbSBndC1yZXNldA0KPiBw
YXRoIGlmIHdlIHdhbnQgdG8gYmUgcmVjbGFpbS1zYWZlLiBNb3ZlIFZGcyByZXByb3Zpc2lvbmlu
ZyB0byBhDQo+IGFzeW5jIHdvcmtlciB0aGF0IHdlIHdpbGwgc3RhcnQgZnJvbSB0aGUgZ3QtcmVz
ZXQgcGF0aC4NCg0KQWRtaXR0ZWRseSBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIFBGIHJl
c3RhcnQgZmxvdyBoZXJlIGZyb20NCnVzZXJzcGFjZS4gSXMgdGhlcmUgc29tZSByYWNlIGNvbmRp
dGlvbiB3ZSBuZWVkIHRvIGNoZWNrIGZvciB3aGV0aGVyDQpHdUMgY29tcGxldGVzIGJhc2UgY29u
ZmlndXJhdGlvbiBiZWZvcmUgdGhlIFBGIGNvbmZpZyBjb21lcyB0aHJvdWdoPyBJcw0KaXQgcG9z
c2libGUgd2UgY2FuIGdldCBpbnRvIGVpdGhlciBzb21lIGRlYWRsb2NrIGJldHdlZW4gdGhlIG5h
dGl2ZQ0KaW5pdCBhbmQgdGhlIFBGIGluaXQgb3Igc3RhcnQgcnVubmluZyBjb250ZW50IG9uIHNv
bWUgZW5naW5lcyBpbiBuYXRpdmUNCm1vZGUgYmVmb3JlIFBGIGNvbXBsZXRlcz8NCg0KVGhhbmtz
LA0KU3R1YXJ0DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hh
bC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlv
dl9wZi5jwqDCoMKgwqDCoMKgIHwgNTMgKysrKysrKysrKysrKysrKysrKystDQo+IC0tDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX3R5cGVzLmggfCAxMCArKysrKw0KPiDC
oDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGYuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZi5jDQo+IGluZGV4IDZmOTA2YzhlODEwOC4u
ZDY2NDc4ZGVhYjk4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jp
b3ZfcGYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGYuYw0KPiBA
QCAtMTUsNyArMTUsMTEgQEANCj4gwqAjaW5jbHVkZSAieGVfZ3Rfc3Jpb3ZfcGZfaGVscGVycy5o
Ig0KPiDCoCNpbmNsdWRlICJ4ZV9ndF9zcmlvdl9wZl9taWdyYXRpb24uaCINCj4gwqAjaW5jbHVk
ZSAieGVfZ3Rfc3Jpb3ZfcGZfc2VydmljZS5oIg0KPiArI2luY2x1ZGUgInhlX2d0X3NyaW92X3By
aW50ay5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9tbWlvLmgiDQo+ICsjaW5jbHVkZSAieGVfcG0uaCIN
Cj4gKw0KPiArc3RhdGljIHZvaWQgcGZfd29ya2VyX3Jlc3RhcnRfZnVuYyhzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKncpOw0KPiDCoA0KPiDCoC8qDQo+IMKgICogVkYncyBtZXRhZGF0YSBpcyBtYWludGFp
bmVkIGluIHRoZSBmbGV4aWJsZSBhcnJheSB3aGVyZToNCj4gQEAgLTQxLDYgKzQ1LDExIEBAIHN0
YXRpYyBpbnQgcGZfYWxsb2NfbWV0YWRhdGEoc3RydWN0IHhlX2d0ICpndCkNCj4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAwOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lkIHBmX2luaXRfd29y
a2VycyhzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqBJTklUX1dPUkso
Jmd0LT5zcmlvdi5wZi53b3JrZXJzLnJlc3RhcnQsDQo+IHBmX3dvcmtlcl9yZXN0YXJ0X2Z1bmMp
Ow0KPiArfQ0KPiArDQo+IMKgLyoqDQo+IMKgICogeGVfZ3Rfc3Jpb3ZfcGZfaW5pdF9lYXJseSAt
IFByZXBhcmUgU1ItSU9WIFBGIGRhdGEgc3RydWN0dXJlcyBvbg0KPiBQRi4NCj4gwqAgKiBAZ3Q6
IHRoZSAmeGVfZ3QgdG8gaW5pdGlhbGl6ZQ0KPiBAQCAtNjUsNiArNzQsOCBAQCBpbnQgeGVfZ3Rf
c3Jpb3ZfcGZfaW5pdF9lYXJseShzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKGVycikNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOw0K
PiDCoA0KPiArwqDCoMKgwqDCoMKgwqBwZl9pbml0X3dvcmtlcnMoZ3QpOw0KPiArDQo+IMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gwqB9DQo+IMKgDQo+IEBAIC0xNTUsMTQgKzE2Niw0MiBA
QCB2b2lkIHhlX2d0X3NyaW92X3BmX3Nhbml0aXplX2h3KHN0cnVjdCB4ZV9ndA0KPiAqZ3QsIHVu
c2lnbmVkIGludCB2ZmlkKQ0KPiDCoMKgwqDCoMKgwqDCoMKgcGZfY2xlYXJfdmZfc2NyYXRjaF9y
ZWdzKGd0LCB2ZmlkKTsNCj4gwqB9DQo+IMKgDQo+IC0vKioNCj4gLSAqIHhlX2d0X3NyaW92X3Bm
X3Jlc3RhcnQgLSBSZXN0YXJ0IFNSLUlPViBzdXBwb3J0IGFmdGVyIGEgR1QgcmVzZXQuDQo+IC0g
KiBAZ3Q6IHRoZSAmeGVfZ3QNCj4gLSAqDQo+IC0gKiBUaGlzIGZ1bmN0aW9uIGNhbiBvbmx5IGJl
IGNhbGxlZCBvbiBQRi4NCj4gLSAqLw0KPiAtdm9pZCB4ZV9ndF9zcmlvdl9wZl9yZXN0YXJ0KHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ICtzdGF0aWMgdm9pZCBwZl9yZXN0YXJ0KHN0cnVjdCB4ZV9ndCAq
Z3QpDQo+IMKgew0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3Rv
X3hlKGd0KTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqB4ZV9wbV9ydW50aW1lX2dldCh4ZSk7DQo+
IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9zcmlvdl9wZl9jb25maWdfcmVzdGFydChndCk7DQo+IMKg
wqDCoMKgwqDCoMKgwqB4ZV9ndF9zcmlvdl9wZl9jb250cm9sX3Jlc3RhcnQoZ3QpOw0KPiArwqDC
oMKgwqDCoMKgwqB4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKg
eGVfZ3Rfc3Jpb3ZfZGJnKGd0LCAicmVzdGFydCBjb21wbGV0ZWRcbiIpOw0KPiArfQ0KPiArDQo+
ICtzdGF0aWMgdm9pZCBwZl93b3JrZXJfcmVzdGFydF9mdW5jKHN0cnVjdCB3b3JrX3N0cnVjdCAq
dykNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGNvbnRhaW5lcl9v
Zih3LCB0eXBlb2YoKmd0KSwNCj4gc3Jpb3YucGYud29ya2Vycy5yZXN0YXJ0KTsNCj4gKw0KPiAr
wqDCoMKgwqDCoMKgwqBwZl9yZXN0YXJ0KGd0KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQg
cGZfcXVldWVfcmVzdGFydChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiArew0KPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gKw0KPiArwqDCoMKgwqDC
oMKgwqB4ZV9ndF9hc3NlcnQoZ3QsIElTX1NSSU9WX1BGKHhlKSk7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgaWYgKCFxdWV1ZV93b3JrKHhlLT5zcmlvdi53cSwgJmd0LT5zcmlvdi5wZi53b3JrZXJz
LnJlc3RhcnQpKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfc3Jpb3Zf
ZGJnKGd0LCAicmVzdGFydCBhbHJlYWR5IGluIHF1ZXVlIVxuIik7DQo+ICt9DQo+ICsNCj4gKy8q
Kg0KPiArICogeGVfZ3Rfc3Jpb3ZfcGZfcmVzdGFydCAtIFJlc3RhcnQgU1ItSU9WIHN1cHBvcnQg
YWZ0ZXIgYSBHVCByZXNldC4NCj4gKyAqIEBndDogdGhlICZ4ZV9ndA0KPiArICoNCj4gKyAqIFRo
aXMgZnVuY3Rpb24gY2FuIG9ubHkgYmUgY2FsbGVkIG9uIFBGLg0KPiArICovDQo+ICt2b2lkIHhl
X2d0X3NyaW92X3BmX3Jlc3RhcnQoc3RydWN0IHhlX2d0ICpndCkNCj4gK3sNCj4gK8KgwqDCoMKg
wqDCoMKgcGZfcXVldWVfcmVzdGFydChndCk7DQo+IMKgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3Rfc3Jpb3ZfcGZfdHlwZXMuaA0KPiBpbmRleCAwNDI2YjFhNzcwNjkuLmE2NGE2ODM1
YWQ2NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX3R5
cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX3R5cGVzLmgN
Cj4gQEAgLTM1LDggKzM1LDE3IEBAIHN0cnVjdCB4ZV9ndF9zcmlvdl9tZXRhZGF0YSB7DQo+IMKg
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3Rfc3Jpb3Zfc3RhdGVfc25hcHNob3Qgc25hcHNob3Q7
DQo+IMKgfTsNCj4gwqANCj4gKy8qKg0KPiArICogc3RydWN0IHhlX2d0X3NyaW92X3BmX3dvcmtl
cnMgLSBHVCBsZXZlbCB3b3JrZXJzIHVzZWQgYnkgdGhlIFBGLg0KPiArICovDQo+ICtzdHJ1Y3Qg
eGVfZ3Rfc3Jpb3ZfcGZfd29ya2VycyB7DQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAcmVzdGFydDog
d29ya2VyIHRoYXQgZXhlY3V0ZXMgYWN0aW9ucyBwb3N0IEdUIHJlc2V0ICovDQo+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCB3b3JrX3N0cnVjdCByZXN0YXJ0Ow0KPiArfTsNCj4gKw0KPiDCoC8qKg0K
PiDCoCAqIHN0cnVjdCB4ZV9ndF9zcmlvdl9wZiAtIEdUIGxldmVsIFBGIHZpcnR1YWxpemF0aW9u
IGRhdGEuDQo+ICsgKiBAd29ya2Vyczogd29ya2VycyBkYXRhLg0KPiDCoCAqIEBzZXJ2aWNlOiBz
ZXJ2aWNlIGRhdGEuDQo+IMKgICogQGNvbnRyb2w6IGNvbnRyb2wgZGF0YS4NCj4gwqAgKiBAcG9s
aWN5OiBwb2xpY3kgZGF0YS4NCj4gQEAgLTQ1LDYgKzU0LDcgQEAgc3RydWN0IHhlX2d0X3NyaW92
X21ldGFkYXRhIHsNCj4gwqAgKiBAdmZzOiBtZXRhZGF0YSBmb3IgYWxsIFZGcy4NCj4gwqAgKi8N
Cj4gwqBzdHJ1Y3QgeGVfZ3Rfc3Jpb3ZfcGYgew0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVf
Z3Rfc3Jpb3ZfcGZfd29ya2VycyB3b3JrZXJzOw0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2d0X3NyaW92X3BmX3NlcnZpY2Ugc2VydmljZTsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4
ZV9ndF9zcmlvdl9wZl9jb250cm9sIGNvbnRyb2w7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZ3Rfc3Jpb3ZfcGZfcG9saWN5IHBvbGljeTsNCg0K
