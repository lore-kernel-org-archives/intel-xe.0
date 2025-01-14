Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10617C02180
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 00:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08F910E81C;
	Tue, 14 Jan 2025 00:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7sRdkKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6310E80E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736813496; x=1768349496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FOO05/6udqYY1g7m3tQSaGg0KTZ7xzmiIbtZ9XHFUx8=;
 b=R7sRdkKF9ZNu8Zws7C5ggSeRBmXn6NrsoCBwd+J/gZ/dkWEw44vaTATT
 SMnPHlJ7maGI8FRL1LjK85/yS3UMbTFWLc+WOwIqdKGmR9IA68eH/JACN
 LwMEHEelsueNpSSjyH75fFUVCXsXvQ5VztJ3UjrN1Kc7m5k/qTMxLV2HK
 K3OS4iA7S1FJ+ovd10ZCrvW4Vwrjqb5NaOiBEmdl8k0u2eHog/ue5sBGm
 diVJBEjE9DddKqLF40beOb1SRqFc3zU1AuL7QU5THXci53EhSP77CXnbZ
 O6h2WOEseyWFW9k5Gj9LLB9tx3M/tq8hqWPt0FuMCYb3L/sS+sXox/68X Q==;
X-CSE-ConnectionGUID: f/eMoYHOT6OJZqhuY/m0Kw==
X-CSE-MsgGUID: gJGb4SmnSiOPhRHwjJIYfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36384163"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="36384163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 16:11:35 -0800
X-CSE-ConnectionGUID: YhfPcMdDQ8ienniNvkizfA==
X-CSE-MsgGUID: y1nFp0OkTn6/g31zmWpNWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104502017"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 16:11:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 16:11:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 16:11:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 16:11:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLki9FApGAo/rDTsbai3YBj7rJ5Pnu0T9OLBQMZwxYJgZwBc2ym+F/i/9OD4alwWOR6qMbVSZZYVnQJ551at+Z/E/yqDEh/Mi1F6tMCODw1TpTe7kFYhh1t0BJnDW4M/d1HeYknwCM2jvzES7l72pAl/OhE3GH2dCxrk6/dvCWjNl7MxNYrn59BjjWZhKU9lrwCqjGlnVPZgXC2l+blvq4Y8WJuOVdphitnB7w+mfExxse/XBszbjrFeSOc3pCWMpcn6h5YFGNGhURORTDMqZj6v50VpHYtWRE+bfZEyPhHXC56jhXwwcuNu9/S/OlzTw50TQBzONxjIWbAObtoOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOO05/6udqYY1g7m3tQSaGg0KTZ7xzmiIbtZ9XHFUx8=;
 b=PtrlIGJPCmrFSkIaoAY99OfmifjSZNb9KCLXvkGMV2SWIJwYa57pjEEwT6CEco826AeEa1D/tQe+QFHdP5mPd023yhnQfKXlqn3kLXPS/AAV1u8EED8HL8y5WCs6MTZ473oXCpLp4jxhURfXDp99eHd9CDOs1gTdaky+17MettYJXWoZ4ThQH74ZJlfyrdErDX2hvV+xLe9Y/jWMv7lQlfH3Ttihkq2xQAS8O7WC5U+r9ncBDFhc3XjAC1W/HKQXgJpgNmoE7gXHOu3KokDhtuIYPrXc7j/Na1VS8M/gtU+Vn18ks53CtMTHBKciXjeOiKEcDQq9Cjn9kmChbEl8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Tue, 14 Jan 2025 00:11:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 00:11:16 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Thread-Topic: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Thread-Index: AQHbTO/96QLHfOlDukSqpNvzt/h/erMVk+6AgAAD0AA=
Date: Tue, 14 Jan 2025 00:11:16 +0000
Message-ID: <8b439e8476790b71efee6d883aa4050220bf56ba.camel@intel.com>
References: <20241212234606.2877233-1-matthew.brost@intel.com>
 <e55de9e1a876069e2552e1d07e2d37b0b9acd0fd.camel@intel.com>
In-Reply-To: <e55de9e1a876069e2552e1d07e2d37b0b9acd0fd.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8575:EE_
x-ms-office365-filtering-correlation-id: 9ca44f80-e6e7-4ede-d6b2-08dd342ff708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NGVMSkdDREE3akh3Z2RoUE5nRnp5c2JCZWFJQkorY0dLVmIxcGhYTkswUXpM?=
 =?utf-8?B?RVl4M3FKZ0lXRlhDbDVDd3dIaGRwT0hWK2pjUDJvVEc1ZDFDSmdYNGU1SVUz?=
 =?utf-8?B?VlJVWk9hRnczRHREUFVpdUdMbE9EMW1rOEdudXpwbXl2cG1KZ3U5UU9GYkM3?=
 =?utf-8?B?aDkvMHEvS0d3S292R2U1ZUVQMkpBc0ZuaFNnbjNXcW5aTE9aK1hidlpoaXE1?=
 =?utf-8?B?WVpiemJyKzcyYld1SlNzbmZPdzV0MHhQakQxZ1F5bU1DbE1sOW1BeEFraGFj?=
 =?utf-8?B?NU96ZndSaHdmbEJRdFVxL0ZwRFBjTVVWaDNNdUgvNWF0eGMraGpMUndwZlkr?=
 =?utf-8?B?RG9sS20yOTI0VTRCWEphYi85czNQeTBlTkVHbktJSzBGQUdVVGhDd0hSQWhO?=
 =?utf-8?B?a3Z6bElsL1RtY3gzUmxyNCsrYUtmd3ViNWM1V1pxbW0vaDMrR2ZYYW1aWGhJ?=
 =?utf-8?B?K0RoQVpzN1JlNDU0clJNYmFqMEVVaU9tOFJsOE1Tc21DS0pob0w3blVZVDdN?=
 =?utf-8?B?TmNJYW5nMkhaUWgxUmdoZEFRanplWDRIbndrbngrUXJmdjFnOW5nRTJZcCtP?=
 =?utf-8?B?ditsTTVSc0h3ajY5bnpRTm1lYyswd1h0YVNpdUl3WmlwUnE4eGdLbURPSmc1?=
 =?utf-8?B?bHRzSm55RGd0bmhHVFlobUd0M3o1WW5lYmpDUkxNcitDQ201Q0w4MkZoSDB4?=
 =?utf-8?B?bUs3K2t0aXA3S1ltc1pXR3o0MVJyWXdxelNnNUNLeWc1Ymd3dUZiYk1iTUZ0?=
 =?utf-8?B?YVZaZGIyVEErSmtHVzFsTjJGdjFqWXIwanFtREYyY1ZtYytWZjNWTFhtVHcz?=
 =?utf-8?B?Sm9Yc3FoV0c2RGVOaXNZSVpKSExFMWdqSklkQ2hTSkNUSko5T2dKWDZBU000?=
 =?utf-8?B?eGxsemY3QUtDa0lDdjVsUGxHZFNVbU0zVXVOT1pMTGNNMW5wLzlpN0JSZmZY?=
 =?utf-8?B?RC8vVHNEanplS0tsWUFoc081ekoxVU13UkZ3RVZhV1FHQ1RYVFNvV0lFQnpR?=
 =?utf-8?B?N2ZsLzc4M0hURkc1U0VIMHNhTFk2MGd1WURWSTA5WHJrKy9XNG00dVdkZ3Ry?=
 =?utf-8?B?c1ZqZ2EvNmNta1M3UlljVGpEM29hRElUUHZiUjNQbGhFc25IbnlvNDFvM0ZH?=
 =?utf-8?B?MytsWVVxcUJ2SlhYZi9sWE8rZTVtaCtKK2N5TUNWcTgrRHZ1TFpwekNJaldl?=
 =?utf-8?B?Y0dzU2dDYUdTNWtzN3dUVWVHTytYbmk0a2tTNGJkTDg4ekVxNWU0ODBDVCtr?=
 =?utf-8?B?MHpQYmNZWVRaREdXWXcxS0Z5aTJlRkRvMVJBVjNiUHlxelBXZ1dVek1VSkRy?=
 =?utf-8?B?WDQzbTI0K2dTbXpicXJVMSs5aGcvTHZEckZ2SVRLY2xSTjVVUm4yUUJMTXAy?=
 =?utf-8?B?YmFlY1doYlRoK3ptNStFbkgxV3JFTHlCU0MxT2JYRk8rTXhsUXdpSGxFRXA0?=
 =?utf-8?B?aGdzZUV5WCtISG9NRVFxTnZqa1BPR0lQUDBZSEg2QjNlR0VzN0JJK1E4b0xk?=
 =?utf-8?B?c25tdVlvR2EzQ1NMY0Z4bkhxUmFFWlhrdUo1NUczQlFWK1JzdXQ5R2xMeHFa?=
 =?utf-8?B?eTI5dkR4bk9TTFJvWHRTT1dUREpBU2JWWHNKZWtuZ1RDV2NudC9KbnZ4V0Q1?=
 =?utf-8?B?MEhZYmZ4TkFaVXdmZGM3Z1psUGxnejZBdVNIRGJsODVOL0g3akR6Q3d2b3pK?=
 =?utf-8?B?TWlWY0FCaTFia1BnVFEzMGtEV2Z5c21SclJZMGI0VjNKM05CVmw4WTg0VHRO?=
 =?utf-8?B?bUdDM2t5N293WEJ0YXU0M0ttWm5QZGRyMk14STE2YkpGVUxvSk01NzYvMzJ5?=
 =?utf-8?B?ZFA0UC9mMmJxN3R0ZmhlZ0I1c1c0ZS8zeE5mMTlVRlFKSDZ6WjNXZmg2R2pi?=
 =?utf-8?B?N0NWMVlYYjFNVlFocGZEcEpEb0EyQlhsM3I1bzMzMXR0R2JLQ3dTR2hkZWUw?=
 =?utf-8?Q?tuaGUqFczKBbtJ9t7AkKND2NmoP8jkgS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjEreWJVTmZCTVE1OVFpSzkvdkloYTg5dDNwakdBWlUzU21hTklHeHhLMDh1?=
 =?utf-8?B?SElubXR5SWZwdzdYZkcyeWNVTVYyT0pFRGU1YUVhYWM5aDhyK1RuYmg3VWI0?=
 =?utf-8?B?TlA1QzlFKytBRmFxWWdGRFpGYVl1ZUp3Y2F3a0xsRjR0b0xVUXZXRWk5Nzc1?=
 =?utf-8?B?T0ovLy9ET04vZUs2eW9Bc2dhMmZzZS9oTjZiMjVpbkVMaFNIaGRxeVRzaFdh?=
 =?utf-8?B?ckJscC85MnBUcUlndDNablNXdXNZZkxNTVJaNXRvUi9QaEpyMEVnd0hUZHZn?=
 =?utf-8?B?QW5GdnJ0ejkzNkwxNGl1clZuc0tEbmdUaWhPUXpGTUtqY3lSeVZvbkg3dk5H?=
 =?utf-8?B?d284WFc0NGg3dy9wdWI1QlVleHhrWVhOMDI2SGNwbGR1ZkpNUVEzZnZUODVL?=
 =?utf-8?B?eFpVdUF6UytZVnN0RnAyZUVQa3VaaDVKc2psT05sVEY2TW5SVFNvcVh2Y1Nm?=
 =?utf-8?B?UHF1ZEFPbVVXdlVLSFpIR3dDQUVzVU9Xb0w5TWpManhGV01VdFgrVDVFQXEz?=
 =?utf-8?B?VVdLOXBoSjRJZ3k2alVxNDZSQWdNNXlHdTVPYnAyaHg4ZjFXdDRWUHlTNkYx?=
 =?utf-8?B?bHM2c2x4MFVLbmR1eG9wVXRSQnJUQmxSc21hOVV0eGZ6U1VqV2FKdVRqTzVh?=
 =?utf-8?B?UjlPNVRkaHNoUUQ0b3VYbGc5NS9xTCtsSWgySW5HM1JWTnMxMldteVFhWDhG?=
 =?utf-8?B?QWdGdUdNODNXNjVJYld2VElWYUlVTjRpcTFKS2NHRWh5bG9iOC83VXp2THpx?=
 =?utf-8?B?eFhiTEhuOHRpQWxtdXhHWWNtRHExU1h3YmxUTEJDNmx2NGQrQlNPUjU2dTk3?=
 =?utf-8?B?dEYwWTJDSUgwb3BhaC9XWUxsQ0dCK2tSY2NSdW9wYU1wTlZ1YTVBUVdhTWNR?=
 =?utf-8?B?SFEyaUtlVGlOYVVzOXc2cEhvMWJURFNDMHRLdTRCMXhWR25KM1FZY0gzWnlY?=
 =?utf-8?B?aGtRVkJRQ0RkOFFvb1dVTWlYQk5MZ1RoaDBaWTRZbiswRWg5M3BNUnArNlF0?=
 =?utf-8?B?UTBJOE5sNjBmZGkvRFQ2UzVIVHY5QndDMGZON2I3WVZIdUdINmFKYXFUcHor?=
 =?utf-8?B?TVc3YWxBVXhUMGg0VDhnTGVxNGxSVnUzdk5GVjJ0S0JPSEhGODAyWmYwU0hr?=
 =?utf-8?B?d2J0UkhzRVlSQUMrRG5tSG5jdUVlNEptRDhqUE1pWWtJeFBpOVMyVGZIZDdN?=
 =?utf-8?B?QmJIc1lGbEx3MnFWWjYwUlpJbDZwSHpNUFdneGZ2SHhlSStGTVVKM1QxYzVC?=
 =?utf-8?B?bjVuOWV0bUdLUmZkTVBZZDRIZEYwdVdkWEJLZUxyRjNGSVNKcXh0c3RwRUFU?=
 =?utf-8?B?UUY1dmh6T2lSSkwxV21sTmRPYW44aEY0dGVGbDRjNDU4SHF5RlVvUkxXYmVC?=
 =?utf-8?B?RUZZSVBIaUNZWDR0NzdYZ1kvM2Y5aHpJMEJjWUx4YTNXaE15bldtRlBqUkUv?=
 =?utf-8?B?eWdZTndyNWdvV0FVNVQ0bnUwNjFHREMxMUlZQUc0eDhWZzVQWlpiaTBtbWdC?=
 =?utf-8?B?ZkJjMDg3cGpHakp1L0pYOExERU9XbVZKNnd2cy9qcHUxbzZ0UzVaZkc0dkx3?=
 =?utf-8?B?cDROcUlqNm5EZlhxS3VxYkN6UnpTdGtVSU0yV3RPNlgzelozdEo4OXVvWVV4?=
 =?utf-8?B?Y3JNOWNCcFQzYlZQRXEzWHZTc1Zzanp4NWhOMTA3ZkhOZzVDSE9McFhTWXhF?=
 =?utf-8?B?MDJ6WmtuQkFTNFU1ekZxbXpHZi9qdVBkV0VncjRIZTZnMW1oRXVjeHhSTnNW?=
 =?utf-8?B?UUxSbjMyL1dLOWxZQUFjZkNrUEd4ZisyNWl3TWJpMzB3YkcxVUtHaHViYTM0?=
 =?utf-8?B?alBHNCtveUdadzN6Nyt1RXBwYU5sallWN1BzUHZ4MFR1enJoRXFvTXd1cVdM?=
 =?utf-8?B?WkxTOTRsSlpFSVh6cUxLWGNyejB6Q2ZPTE1vV1pEYU5raXRlNHNIY3ZWTy9U?=
 =?utf-8?B?TUUwWHAxRUNtc3o4ek9wb3ZiMUVJMHpoWmpoOGlYQWRZWUdkYTBrdFliQU8v?=
 =?utf-8?B?REtkc3RmQm4yNWc1QytoWkg0WnFZaGxuSnZNc3FOT2RKSUgwM3REcU5vT1g0?=
 =?utf-8?B?b0VvQWphajNtYW5PZ2ZIWERibk1sSENPSERLSkV2K2c4cUUrcGh3T1Z3R3RE?=
 =?utf-8?B?NjUzUjNlZnR5Sm8vVVVKTTBQYjg5SWlNeWRRLzEvYlM1NDBTRlpxQWVuVzJI?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C30A36089F553C4E8EF9F135541FA5FB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca44f80-e6e7-4ede-d6b2-08dd342ff708
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 00:11:16.8855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myokHeO84SMnVkcA3H0gxoPI64E3zz537kie4q/ppmXsd1p++rLLy7H15vbadAy9Iz4C6CRHiFoGcxuHhSt8m8o2zhnON3AZoiIt7zTyNXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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

T24gTW9uLCAyMDI1LTAxLTEzIGF0IDIzOjU3ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFRodSwgMjAyNC0xMi0xMiBhdCAxNTo0NiAtMDgwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBSSU5HX0NNRF9DQ1RMIHJlYWQgaW5kZXggc2hvdWxkIGJlIFVDIG9uIGlHUFUgcGFy
dHMgZHVlIHRvIEwzDQo+ID4gY2FjaGluZw0KPiA+IHN0cnVjdHVyZS4gSGF2aW5nIHRoaXMgYXMg
V0IgYmxvY2tzIFVMTFMgZnJvbSBiZWluZyBlbmFibGVkLiBDaGFuZ2UNCj4gPiB0bw0KPiA+IFVD
IHRvIHVuYmxvY2sgVUxMUyBvbiBpR1BVLg0KPiA+IA0KPiA+IENjOiBCYWxhc3VicmFtYW5pIFZp
dmVrYW5hbmRhbg0KPiA+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
ID4gQ2M6IE1pY2hhbCBNcm96ZWsgPG1pY2hhbC5tcm96ZWtAaW50ZWwuY29tPg0KPiA+IENjOiBQ
YXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4NCj4gPiBDYzogSm9zw6kgUm9i
ZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gPiBGaXhlczogMzI4ZTA4OWJmYjM3ICgiZHJtL3hlOiBMZXZlcmFnZSBD
b21wdXRlQ1MgcmVhZCBMMyBjYWNoaW5nIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJy
b3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9od19lbmdpbmUuYyB8IDcgKysrKysrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9od19lbmdpbmUuYw0KPiA+IGluZGV4IGIxOTM2Njc0NDE0OC4uY2MyNThiMmE3N2M5IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IEBAIC00MTcsOSArNDE3
LDE0IEBAIGh3X2VuZ2luZV9zZXR1cF9kZWZhdWx0X3N0YXRlKHN0cnVjdA0KPiA+IHhlX2h3X2Vu
Z2luZSAqaHdlKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBlbnRyeSBpcyByZWNvbW1lbmRlZCBi
eSB0aGUgc3BlYyBpbiBjZXJ0YWluDQo+ID4gY2lyY3Vtc3RhbmNlcw0KPiA+IG9uDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoCAqIHNwZWNpZmljIHBsYXRmb3Jtcy4NCj4gPiDCoMKgwqDCoMKgwqDCoMKg
ICogQnNwZWM6IDcyMTYxDQo+ID4gK8KgwqDCoMKgwqDCoMKgICoNCj4gPiArwqDCoMKgwqDCoMKg
wqAgKiBYWFg6IEFjY29yZGluZyB0byBpbnRlcm5hbCBjb21tdW5pY2F0aW9ucyBic3BlYyBpcyB3
cm9uZw0KPiA+IGFuZA0KPiANCj4gQ2FuIHlvdSByZW1vdmUgdGhpcyByZWZlcmVuY2UgdG8gImlu
dGVybmFsIGNvbW11bmljYXRpb25zIj8gSXQgbG9va3MNCj4gbGlrZSBmcm9tIHRoZSBsYXRlc3Qg
aW4gYnNwZWMgdGhpcyBpcyBwcmV0dHkgY2xlYXIuDQo+IA0KPiBJIGRvIHNlZSBvbmUgdGVzdCBy
ZWdyZXNzaW5nIG9uIExOTCwgY2FuIHlvdSBkb3VibGUgY2hlY2sgdGhhdCB0aGlzDQo+IGlzbid0
IHJlbGF0ZWQgdG8gdGhlIGNhY2hpbmcgY2hhbmdlIGJlZm9yZSB3ZSBtZXJnZSB0aGlzPw0KPiAN
Cj4gT3RoZXJ3aXNlIGxndG0NCg0KUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQu
c3VtbWVyc0BpbnRlbC5jb20+DQoNCkJlZm9yZSBtZXJnaW5nLCBjYW4geW91IGdldCBhIENJIHJl
LXJ1biBvZiB0aGlzIHNpbmNlIGl0J3Mgbm93IGJlZW4gYQ0KbW9udGggb3Igc28gYW5kIHdlIGhh
dmUgdGhhdCBMTkwgZmFpbHVyZT8gSXQgZG9lc24ndCBzZWVtIHJlbGF0ZWQgaGVyZSwNCmJ1dCBJ
IGRvbid0IHNlZSBhbnl0aGluZyBpbiBjaS1idWdsb2cgcmlnaHQgbm93IHRoYXQgbG9va3Mgc3Bl
Y2lmaWNhbGx5DQpsaWtlIHRoYXQgc2lnbmF0dXJlLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiAN
Cj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgICogUklOR19DTURf
Q0NUTCByZWFkIGluZGV4IHNob3VsZCBiZSBVQyBvbiBpR1BVIHBhcnRzIGR1ZQ0KPiA+IHRvDQo+
ID4gTDMgY2FjaGluZw0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIHN0cnVjdHVyZS4gSGF2aW5nIHRo
aXMgYXMgV0IgYmxvY2tzIFVMTFMgZnJvbSBiZWluZw0KPiA+IGVuYWJsZWQuIEFkZA0KPiA+ICvC
oMKgwqDCoMKgwqDCoCAqIGJzcGVjIGxpbmsgb3IgZGVsZXRlIHRoaXMgY29tbWVudCBvbmNlIGJz
cGVjIGlzIHVwZGF0ZWQuDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBjb25zdCB1OCBtb2NzX3dyaXRlX2lkeCA9IGd0LT5tb2NzLnVjX2luZGV4Ow0KPiA+IC3C
oMKgwqDCoMKgwqDCoGNvbnN0IHU4IG1vY3NfcmVhZF9pZHggPSBod2UtPmNsYXNzID09DQo+ID4g
WEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUgJiYNCj4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCB1OCBt
b2NzX3JlYWRfaWR4ID0gaHdlLT5jbGFzcyA9PQ0KPiA+IFhFX0VOR0lORV9DTEFTU19DT01QVVRF
ICYmIElTX0RHRlgoeGUpICYmDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoR1JBUEhJQ1NfVkVSKHhlKSA+PSAyMCB8
fCB4ZS0NCj4gPiA+IGluZm8ucGxhdGZvcm0gPT0gWEVfUFZDKSA/DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBndC0+
bW9jcy53Yl9pbmRleCA6IGd0LQ0KPiA+ID4gbW9jcy51Y19pbmRleDsNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgdTMyIHJpbmdfY21kX2NjdGxfdmFsID0NCj4gPiBSRUdfRklFTERfUFJFUChDTURfQ0NU
TF9XUklURV9PVkVSUklERV9NQVNLLCBtb2NzX3dyaXRlX2lkeCkgfA0KPiANCg0K
