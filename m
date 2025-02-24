Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E92C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 21:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1619910E413;
	Mon, 24 Feb 2025 21:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOtkZPoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11A410E365
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740432190; x=1771968190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qnRFz+6MIDzkATHl2pL0aBuaPhsayrJViyC5kv3cvbM=;
 b=GOtkZPoWsJTqtSmkHES0wbUXzpy1x3pLwJenbUykBdwUTk91T1cmZguv
 H+ZX3PuULHeFKN7YACcR5LPsc2vPhM4ufKuJ6v1MsyAvo9VlTkr2AloZO
 4KP/GqbeKFjgwo6ma32i8TX80hc5uSS4kxyD2C2xGjJdP/hbwpuReTVL1
 HbEnF88sVA4bUINcYxyRnd1DkxldRko9iTnPAeZD9Y0skkP+r8UjeozAI
 YwhZrjDUiQdn3bykv1Eg8Z2dIeLId8CtocKUuv2SF8D44r6jj1VfXxmxB
 vNucVWj5rfeV9s10p1rEuCoTxjQqQFulC2JXcKI9cxqObK/kgCm95dWrJ Q==;
X-CSE-ConnectionGUID: XOw5J0zpQoWK/UMN8kXEVQ==
X-CSE-MsgGUID: RnT7vn5VQIG5Epp5OyW1YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58755347"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58755347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 13:23:06 -0800
X-CSE-ConnectionGUID: tUDLbtjCTIyX77oIcfqO1g==
X-CSE-MsgGUID: IorcQ0USS6Ojddgm/xi7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147057690"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 13:23:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 13:22:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 13:22:56 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 13:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCbe1EKDIJJAS4kpwBGtnvFWG1KNarQ9WCCbugfZsu1LduJwYBI5yyuRb0X4GoPL7LMglamC5pliAUM2dRpCcMpGjK1b+Mx+b3ucELrGWVPhAmFTq1lvVPEFSmXSPZ3i+r4E7xblFvqBsrHD7/R/sWTJ8eg5peWOjuW/hJ+zt3ckz8HYNNIZMPM3ar0mxNANipwpjTLr+EaoiX4ulooWjm01cwL6c7TNTUhAER1fIwh1dK+ik/dWvR/p7FRamVQavKqBPD3h/ru0BUawI8kDQXX+Hyozq35Uh0i24EoDnkcwFzAfqTQR32jv7P5YNz7gxE5e6vGvbGrhaGRczMu4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnRFz+6MIDzkATHl2pL0aBuaPhsayrJViyC5kv3cvbM=;
 b=mBZ3lDyiBH66XBIaTVgiZDhPexsl3x9cQIcehkUI5mxADknX+hmDry5PAUc2rIuFpQ0euJXBdya26C/SiC2jOhVG8KwR5PClLlLi7gkMIr4EnVhmMZDVtDuQ9uJUgi3kyTiXzRS8LwLL5KHyskC7+C/e3B9+65xBl1YesoVvLT6tYACqRvFmeTkOdM72TD1et4k1cv1bwmt2C2wc43lk9ik05IaCPPH4eGjJFBN9Jas7OrdwLiLcJRcqFOClYHThQoUzUnj9yrR1Fs2Qlr0De67A7l2npporYVcCKkSWxkHKfz8/z96yCs/+A+OplZF9P12SqduXHbHLiCgwre/hMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 21:22:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 21:22:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
Thread-Topic: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
Thread-Index: AQHbgy1dE0dRX1bNJk+kr12wLOOnJLNQYv8AgAB8NYCAABxzgIAGAWaw
Date: Mon, 24 Feb 2025 21:22:08 +0000
Message-ID: <DM4PR11MB5456B9995F53BD0737983CE4EAC02@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
 <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
 <wtk56h75pu66dnnqx6az6dxyfhvgqbovp6sdihtenuhxuoneh5@yo2joqcv75sk>
 <ab15704b-20d9-43c1-abe8-607e070c2cdf@intel.com>
In-Reply-To: <ab15704b-20d9-43c1-abe8-607e070c2cdf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB5104:EE_
x-ms-office365-filtering-correlation-id: 914b9f3f-e116-4465-2413-08dd55194b82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aVQvTFhoL3p4ejBzSmdEU21iRkpLb1BhYzg2MkZ2R2YwVDdjMEF1Z25SMHZ3?=
 =?utf-8?B?dEVPWEhMS0lXL1ZDb3NnL3p0K2dIdlBRdDZLRXBYaHhaRUhoemd6UWxSVDBj?=
 =?utf-8?B?ZkJyV09sU1kvWGRnNEovQjdyR3BWajZTcmlXV3d6Q3M4bXYzK0dvSlRwc1pV?=
 =?utf-8?B?QlNaRFEyZHltM0prM3Jjc0ErM3pnb0pVYTQwOTNmZVpmUWhaMmV5dmlQbkRu?=
 =?utf-8?B?VEw0U1hrUXExVEhhZFhITVNwWUg2RXlPTjZRaUlqbnFwMGxlL0tvYSs1VEtK?=
 =?utf-8?B?SWFLdmpTVXQ5c21oTzN2L08wNzA1dkpLUWpGSng3V1hVb1ZXSlkwN3R2andB?=
 =?utf-8?B?b0ExdUxsTlc4WHk3aEJtQStOcWJOTzdoZEtBTUtWMzBNcXJWTjVUOHFhMnJx?=
 =?utf-8?B?TmRMQ29oOGV4eXRqNW9sVUViZHBrNzd4RHRFakVVOHdoUnBqQ3BWVlBqOG12?=
 =?utf-8?B?dVVHcWc0L1l3SHZ0L3ZQRitIeEZNNEdybGJvRG1kK0Vtc1l2UXM5WU9EODc5?=
 =?utf-8?B?WStuaEwwSStXZnRYSWJINTdnRStZM2J3YmttcTM4QlBHWmU3TlZWMys3S1RL?=
 =?utf-8?B?NVNIa2RuUElCcmNhOHYyT2hJWUJmMkRQK3R4M1BLTGhoS2FyaE1iL0F4Vnp3?=
 =?utf-8?B?NC9YOW1wRTlEaUJSMytiTDIxdWF3WXdNdkxpSzhBL0RzUXVZSjZPL0NmWUht?=
 =?utf-8?B?SW9Eck00a0w4ZnFCMWRPZEpNQjdjOFN2clkra3hPaXBLZmV1WGdCWGFuZE1J?=
 =?utf-8?B?d3lrQkNsNTBkOGcwTmRmZkFmSHV3bko1ZzRhOE9jZUVtNFFJeU4zSHpwb01B?=
 =?utf-8?B?eEpieVlkOGt4RUFwbmR2ajZXWS8xZmlGc0lIbkN0SXlrUnVkNDJZTk55SW9v?=
 =?utf-8?B?RG9iNWlweldoSUNWa1RiUTZvUit0SVJGbUc5b0NKOGJSMThvRVdFRUY2ZjVz?=
 =?utf-8?B?b3ZZaXA2Q1dNQ1ZPeUpSTm1DTkJ1K09MeFVDWHcwZ3JGVUEwelpGN284VlYy?=
 =?utf-8?B?V21ZcFM4REcvOWZyUU0xOEZrV0EyY1hKM0c1RkwzVXN2VFdVRTJGMmVyck9U?=
 =?utf-8?B?cjkzcmRDTW4rdEI2NWE3SS9pRnZUNWozQm9MOGpsYjkra1pway9ZaUNQcThw?=
 =?utf-8?B?ZlovNi9GM3BoNVh1N3ptMGZGUG55MWN5cHN4VFBLU2Y5SmhRamc2c1VYVnRy?=
 =?utf-8?B?TkRrMGlnK3ZHVUlJdHpHaU1xTzRjSmVEcUZ0ZGE3emVKMzZNL3dUTncwRktq?=
 =?utf-8?B?eEpQRmN6ZVZsVTBHVlZLbVJDWjR6K3ZxendNYXljVkIzWDIwcjFOU21uWTRN?=
 =?utf-8?B?TTlkMWtMODlUU05adTd4UldqZU53dUpZZUVod2VET0duK1o3UmxQMDZpNmJk?=
 =?utf-8?B?UlI4ZHRFMHFnd29oOVZ2OHB0MEthRmtTOVhmZndvV1JKRUJLakp4YjJvQkkw?=
 =?utf-8?B?QkxyMEx3ekF3eU1iTy9QNXF2UnhFVzZpOFBodVNqVFVCM2h1M2E0OWFNTjNh?=
 =?utf-8?B?M1R1MzhNVXloR0RXVWpIT2RJaUVEb2RNSjhlbzFEaXlqNTVHYisyVW9sZmRs?=
 =?utf-8?B?RWhmaS9PenRSVG43RC9nRmxaQ2ZjTlFWdmV0em9ydzVudHRwcnluZHBXOUsr?=
 =?utf-8?B?VnRRbzIwUzdxTzlzUk5aVjlGQS82YVJDWGo4VURpQlJCZ1FWT1hOcHlvUzl3?=
 =?utf-8?B?dG9WSXUrOUdFa095SUNPZStUMks3b1BWeU5Rcitpb045bGttTGwrY2VEOVlQ?=
 =?utf-8?B?VzAyajFDRC9FcjNTYUZneW1CUmsyZVNRdzhXNGxnUjVpTnVaZStsV1g3UWVR?=
 =?utf-8?B?L3hQV21UTEpCQXFOUzBnL1Rwd2Y4TGVKV3Y5Nzh2ak5RNjI4TDdLdVpRV2xK?=
 =?utf-8?B?WnFnUEJDZ3ZOMVNLVUxvblpoOUZwK3lIRGtXZUxIdFNHcjRjUTlnckt1N3V1?=
 =?utf-8?Q?tU3ujLFEObo53T0Qo0Ulp0JkrmK/ynPJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE9Lb05xTkxSTWpybHFmcGkvTFllaDhCdEtkNlgxVzkyZ0VERTVvVHNkS1Jy?=
 =?utf-8?B?NG5TcW9GRkY0R25mTXNmcVQzaFJNa2xzSTlLRCs3TEhTWWdTc2tueDlyZzJQ?=
 =?utf-8?B?OGlCVkVxcnU4QjZ4eWhRa090VVlhbWxqdk0zaUR0OXZsRUQ1R2tINTk1Q1o1?=
 =?utf-8?B?VWRNUEdFSm5BTytKOUNQS2lzT0JhOEZtbzBQaUNjWWpadHFSdVdCVkQ5cFhI?=
 =?utf-8?B?ajdsRk5WWUE1WHdJZWtITmtQbUE4SEdKckdYZmxmVm9FNTBnL1hBZ2l4NjYz?=
 =?utf-8?B?NVZVUmJ3WG05L09ZVWROdHRaajdJQVhNRmVOWVJuOXpjb2lDTERvdWlwa2Ns?=
 =?utf-8?B?ckphR2xYT1RCa3liV1dTZ3FnK1BjdVg2OFIzTUc2SVZvMEtEUnBGK3A5RnBz?=
 =?utf-8?B?czI2VFVnSkFHd3FEa1pjd0JITEp1WUwrb2ZCRmJ6a3hWOWNwb2paajIzWStp?=
 =?utf-8?B?Vk5sSVpoWVJHVlVNNmRJdGppU0NiTGdFSDQ2SU5yZHc3U0s0ZVNNODBDQlpG?=
 =?utf-8?B?NVNwNEs2QmtNbmFOOHl6MllCT09tTlAzTWdRVW9laFQ4bWhWbTFpUTJGbnJU?=
 =?utf-8?B?NUhoY29Mai9kcXkweWI1Q2c3b3ZzSW53NVJhWTBqUmp3SXJwN2JJbXVSbHo1?=
 =?utf-8?B?RkVhOENnU0R1S2hxbWswY2YzcWh1WGYzSXllNnNFQ01KMVFtN2RwN2tOdDVJ?=
 =?utf-8?B?TWxmKzFCUzMyb2J4bkphY2FXdHpKSitPWTRBdWVZUFZjRDlycGZxM3dreUt6?=
 =?utf-8?B?dUpHVlJrS3QwMVFmY0hWZlo4TENCNUlIN21naG5XMlQzem50YzhRMjJNRUUy?=
 =?utf-8?B?bjVyL2s3MmZEOEVmWE14VUN5UWJ0Qlgrd1ZHYjNJTUd1TzFvVDdhRm5JOFdJ?=
 =?utf-8?B?OWpvVk1xbTJXVmRqU0xpbEExbndHZHpGMEwwWHpsMHkyem92TytHU3puVDdR?=
 =?utf-8?B?TUFwNVZMNFdWQ1V5Rk1sTFNmc2JmeVhSN3p1NS8zSTlCSm5hRWlVVmlBdjlk?=
 =?utf-8?B?U0NvczVmaWw2Mk0zTkFBWHR1WjRLcW5CTzdiTDBoWFpkbTNseDhCRklxNW5J?=
 =?utf-8?B?cnM4aUwyZENZcjdCSXhvdFZLM2ZKL3Vib0FQMklzWkFaOGhFbjZCd3RyMWhF?=
 =?utf-8?B?bTFhaWVmSTRJd2FKcTVialhhWDU5eGZFbjRudXBCQXpuTXplbFpZQUM4dUpY?=
 =?utf-8?B?ZSsrUTZ5c1dzQWE0Y25DZUpNWFplTEs2L3UzY05hTWhzdFI3LzYzNmhvYjIz?=
 =?utf-8?B?VHJMbmQ3dzR1OUJ2VU5FRFpKUFN0dXBVYXJyeUtJSUJvRHBsYm4vYUVCOThQ?=
 =?utf-8?B?RWlUd2d5ZTVmMnlDT3hkV1JQUGhsK3liTVp0V0kwYTF0UGpBMEZOMjJJWFNw?=
 =?utf-8?B?b2QyM2QwdU4yWFArNVEzbVR3c3AvSUFzWGswTGlJZHk4OVJ0c1hFanVjZ0VJ?=
 =?utf-8?B?N1lUaUJpTEZHc3d3R1h1Y3p6V3dNZ2ZlMEZhVGxYYm1tUnBsN0xvQy9YcW1O?=
 =?utf-8?B?c2VTZzBhelFFa000elp4SUVlVUFMb05DdHdCNUNRS1o4V01jUnk2QlM2aDJ2?=
 =?utf-8?B?UEgySUh2Z2VGdXNad2cxRSt2MzhobTF4M0RhRjlvZG9vS2dZRmNsNTlLSjRx?=
 =?utf-8?B?d2pFVmMwcHpMZUs2elFKWHlXRjVzUXk3UUh3dm9Vby9WVnR2SWJZWU8rMVA5?=
 =?utf-8?B?TVNZbDRJVWRvd1RjVGNyOGJPL3VtRnZJcGcxSWU1RzdLTlRXODZoTFdzckJO?=
 =?utf-8?B?bDdrNjg4Zmxsak4wc2NqYzRqYWQxbkJIRWE3RG9NNFpOWE45V0lSd3d6RWhX?=
 =?utf-8?B?YzJBdTVqRjk0MGNNUFR0MWJNVGVNaU5UcW9MYnBXK005S0R5OUJobVB1N1Vi?=
 =?utf-8?B?djZpNENrNjRxdy9lVFR1bE1ZYTNDMnhjd3pCSzh1NzhhTnRlbmhoVWhWRXd5?=
 =?utf-8?B?bzVCcG9pK2xTSXh0aGlTRGFzRi80OG53MWxEVlE4dkR4em5rTE8zRDhPQk9s?=
 =?utf-8?B?YUg4cEs4UlN5VDN3ZmZaNmJ2S1l2VCtnZEFyNGJFbzJiSlJpUERHeFQxWVZC?=
 =?utf-8?B?QmtNeDI4Rm50UXIxQWk4b1lma2c3Mlp2QmpPNjZGVHI1Nlh0a0Vrd3hhN2Jh?=
 =?utf-8?B?djE5MUxmTlNjdTd2bmNxb3picm05SExtS0RWMWw5RkFVckFFUmFnMzNoOTR1?=
 =?utf-8?Q?bkIdqpAjuv1RQQs44NdotegyzvyM3P9A9yE2ETaknN2m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914b9f3f-e116-4465-2413-08dd55194b82
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 21:22:08.5470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kU+oFEQleBlotOldkcPi/rSVSgs0TTc/S8ps81Iw0g3LudWx6Pi51yxTrR+HdjzGCVtOIX2WKdUpMG3a4i43Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
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

SGkgYWxsLA0KSSB1bmRlcnN0YW5kIHdlIG1heSBuZWVkIHJlZmluZSB0aGUgbG9nIHByaW50Lg0K
Q291bGQgd2UgZG8gaXQgd2l0aCBhbm90aGVyIHBhdGNoIGFuZCBmb2N1cyBvbiB0aGUgY2hhbmdl
IGluIGN1cnJlbnQgcGF0Y2hzZXQgb25seT8NClRoYW5rcy4NCg0KU2h1aWNoZW5nDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycmlzb24sIEpvaG4gQyA8am9obi5j
LmhhcnJpc29uQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIwLCAyMDI1
IDU6MzYgUE0NCj4gVG86IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNv
bT47IFdhamRlY3prbywgTWljaGFsDQo+IDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4g
Q2M6IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT47IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gZHJtL3hl
L2RldmNvcmVkdW1wOiBSZW1vdmUgSVNfRVJSX09SX05VTEwNCj4gY2hlY2sgZm9yIGt6YWxsb2MN
Cj4gDQo+IE9uIDIvMjAvMjAyNSAxNTo1NCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiA+IE9u
IFRodSwgRmViIDIwLCAyMDI1IGF0IDA1OjI5OjU2UE0gKzAxMDAsIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+ID4+IE9uIDIwLjAyLjIwMjUgMDE6MTcsIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+
ID4+PiBremFsbG9jIHJldHVybnMgYSB2YWxpZCBwb2ludGVyIG9yIE5VTEwgaWYgdGhlIGFsbG9j
YXRpb24gZmFpbHMuDQo+ID4+PiBJdCBuZXZlciByZXR1cm5zIGFuIGVycm9yIHBvaW50ZXIuIEl0
IGlzIGJldHRlciB0byBjaGVjayBmb3IgTlVMTA0KPiA+Pj4gZGlyZWN0bHkuDQo+ID4+Pg0KPiA+
Pj4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+
DQo+ID4+PiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4g
Pj4+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYyB8IDQgKyst
LQ0KPiA+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29y
ZWR1bXAuYw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+
Pj4gaW5kZXggNjBkMTVlNDU1MDE3Li44MWI5ZDliYjNmNTcgMTAwNjQ0DQo+ID4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gPj4+IEBAIC00MjYsOCArNDI2LDggQEAgdm9p
ZCB4ZV9wcmludF9ibG9iX2FzY2lpODUoc3RydWN0IGRybV9wcmludGVyDQo+ID4+PiAqcCwgY29u
c3QgY2hhciAqcHJlZml4LCBjaGFyIHN1ZmZpDQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgIGRybV9w
cmludGYocCwgIk9mZnNldCBub3Qgd29yZCBhbGlnbmVkOiAlenUiLCBvZmZzZXQpOw0KPiA+Pj4N
Cj4gPj4+IMKgwqDCoMKgIGxpbmVfYnVmZiA9IGt6YWxsb2MoRE1FU0dfTUFYX0xJTkVfTEVOLCBH
RlBfS0VSTkVMKTsNCj4gPj4+IC3CoMKgwqAgaWYgKElTX0VSUl9PUl9OVUxMKGxpbmVfYnVmZikp
IHsNCj4gPj4+IC3CoMKgwqDCoMKgwqDCoCBkcm1fcHJpbnRmKHAsICJGYWlsZWQgdG8gYWxsb2Nh
dGUgbGluZSBidWZmZXI6ICVwZSIsDQo+ID4+PiBsaW5lX2J1ZmYpOw0KPiA+Pj4gK8KgwqDCoCBp
ZiAoIWxpbmVfYnVmZikgew0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgIGRybV9wcmludGYocCwgIkZh
aWxlZCB0byBhbGxvY2F0ZSBsaW5lIGJ1ZmZlclxuIik7DQo+ID4+DQo+ID4+IGJ0dywgc2luY2Ug
dGhpcyBsaW5lIHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlIG91dHB1dCwgd2hlcmUgb25lIGNvdWxk
DQo+ID4+IGV4cGVjdCBhc2NpaTg1IGRhdGEsIHNob3VsZG4ndCB3ZSBwcmludCB0aGF0IGRpYWdu
b3N0aWMgbWVzc2FnZSB3aXRoDQo+ID4+IHNvbWUgc3BlY2lhbCBwcmVmaXggdG8gbWFrZSBpdCBj
bGVhciB0aGVyZSBpcyBub3RoaW5nIHRvIHBhcnNlPyBsaWtlDQo+ID4+DQo+ID4+IMKgwqDCoMKg
IiMgRmFpbGVkIHRvIGFsbG9jYXRlIGludGVybmFsIGRhdGFcbiINCj4gPj4NCj4gPj4gYWxzbyBz
aW5jZSBjYWxsZXIgbWF5IGhhdmUgYWxyZWFkeSBwcm92aWRlZCBhIHByZWZpeCwgc2hvdWxkbid0
IHdlDQo+ID4+IGFsc28gaW5jbHVkZSBpdCBpbiB0aGlzIGRpYWdub3N0aWMgbWVzc2FnZT8NCj4g
Pj4NCj4gPj4gwqDCoMKgwqAiJXMlcyMgRmFpbGVkIHRvIGFsbG9jYXRlIGludGVybmFsIGRhdGFc
biIsDQo+ID4+IMKgwqDCoMKgcHJlZml4ID86ICIiLA0KPiA+PiDCoMKgwqDCoHByZWZpeCA/ICI6
ICIgOiAiIg0KPiA+DQo+ID4gb3Igc3RvcCBwcmludGluZyBhbmQgcmV0dXJuIGFuIGVycm9yLiB3
ZSBhcmUgbWlzc2luZyB0aGUgYC5lcnJvcjogLi4uYA0KPiA+IGFscmVhZHkgdGhhdCBpcyB1c2Vk
IGluIG90aGVyIHBsYWNlcy4NCj4gPg0KPiA+ICQgZ2l0IGdyZXAgJ1wuZXJyb3I6ICcgLS0gZHJp
dmVycy9ncHUvZHJtL3hlDQo+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmM6wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRybV9wcmludGYocCwgIlswXS5lcnJvcjoNCj4gPiAlbGlcbiIsIFBU
Ul9FUlIoc25hcCkpOw0KPiA+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jOsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3ByaW50ZihwLA0KPiA+ICJbJWxseF0u
ZXJyb3I6ICVsaVxuIiwgc25hcC0+c25hcFtpXS5vZnMsDQo+IFRoaXMgaXMgdGhlIHBsYWNlIHRo
YXQgc2hvdWxkIGJlIHByaW50aW5nIGFuIGVycm9yLiBUaGUgd2hvbGUgcG9pbnQgb2YgdGhpcyBo
ZWxwZXINCj4gaXMgdGhhdCBpdCB3cmFwcyB1cCBhbGwgdGhlIGJsb2Igb3V0cHV0LiBIb3dldmVy
LCBkbyB3ZSBuZWVkIHRvIGRpc3Rpbmd1aXNoDQo+IGJldHdlZW4gYSBub24tY2FwdHVyZS1wcm9j
ZXNzIGVycm9yIChlLmcuIGJhZCBWTSBvYmplY3QpIHZlcnN1cyBhbiBlcnJvciBpbg0KPiB0aGUg
Y2FwdHVyZSBpdHNlbGYgKGUuZy4gb3V0IG9mIG1lbW9yeSBjb252ZXJ0aW5nIHRoZSBiaW5hcnkg
ZGF0YSB0byBhIHRleHQNCj4gc3RyaW5nKT8NCj4gDQo+IE5vdCBzdXJlIHdoYXQgZXJyb3Igcm91
dGVzIHRoZXJlIGFyZSBpbiB0aGUgVk0gY2FwdHVyZT8gQXJlIHRoZXkgdGhpbmdzIHRoYXQNCj4g
YXJlIGltcG9ydGFudCB0byBpbmNsdWRlIGluIHRoZSBkZXZjb3JlZHVtcCBiZWNhdXNlIHRoZXkg
aGF2ZSBzaWduaWZpY2FudA0KPiBtZWFuaW5nIGFib3V0IHdoYXQgY2F1c2VkIHRoZSBoYW5nPyBP
ciBhcmUgdGhlIG9ubHkgcG9zc2libGUgZXJyb3JzIHJlbGF0ZWQNCj4gdG8gdGhlIGNhcHR1cmUg
cHJvY2VzcyBpdHNlbGYgLSBmYWlsaW5nIHRvIGFsbG9jYXRlIG1lbW9yeSB0byBzdG9yZSB0aGUg
Y2FwdHVyZSBvcg0KPiBzdWNoPw0KPiANCj4gSWYgdGhlIG9ubHkgZXJyb3JzIGFyZSBjYXB0dXJl
IHJlbGF0ZWQgdGhlbiB5ZXMsIGp1c3QgY2hhbmdlIHRoaXMgbGluZSB0byBwcmludA0KPiAiWyVw
cmVmaXhdLmVycm9yOiAlZXJybm9cbiIuIEJ1dCBpZiB0aGVyZSBpcyB1c2UgdG8gZGlzdGluZ3Vp
c2ggYmV0d2VlbiBiYWQgVk0NCj4gb2JqZWN0cyBhbmQgZmFpbGVkIGNhcHR1cmVzLCB0aGVuIG1h
eWJlIHRoaXMgb25lIHNob3VsZCBiZQ0KPiAiWyVwcmVmaXhdLmNhcHR1cmVfZXJyb3I6ICVlcnJu
b1xuIiBvciBzb21ldGhpbmc/DQo+IA0KPiBKb2huLg0KPiANCj4gDQo+ID4NCj4gPiBMdWNhcyBE
ZSBNYXJjaGkNCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+Pg0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm47DQo+ID4+PiDCoMKgwqDCoCB9DQo+ID4+Pg0KPiA+Pg0KDQo=
