Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A7ECA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 17:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4283B10E98D;
	Wed, 10 Sep 2025 17:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+i6Ibal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F392A10E98D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757525615; x=1789061615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Vn8kGuoSdBpCGMsBqjelu3zUYd8acWrkrQuHgUt5aPs=;
 b=Y+i6IbalxAKa84icv7njU6Vo3DnuImaKEFpJP6ddxSsKbcj8NEKBYgkY
 tCFIR7GCHOE0pSM31hO+lizasOupI48b0QLTzmGhZJ+LZ3QP5fhJ/nA1l
 hE4vINB0GXMwiK4CUfhb8wIeejha1SPV+ln5vv9QNsbXWadne+t5PTZr/
 v+XoksHr9Fx0pYu2jS+2XBCFuQow3L724Wl2WwQ5WnMupzOWdxCROgcvh
 PHS/n+ARcxR2bT0MHnS+z20bg6RNEshvY13OfLfhHVJmll/KvxywZl0Gr
 T7XAN+pc6XynyCnQaALvTLnDLhhOop/eKY/E4bej7bIPy9T6SJhHSZGng g==;
X-CSE-ConnectionGUID: YpVbu+ryTo+35tI5tR+Zow==
X-CSE-MsgGUID: W3bEhsLRTTqyzVRrkJG3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71225548"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="71225548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:33:34 -0700
X-CSE-ConnectionGUID: E0H3dYZcTSuKKFOpYGXcbA==
X-CSE-MsgGUID: 4Jt7JAu6SKq0xcyxaYieuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="204220453"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:33:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 10:33:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 10:33:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 10:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDvJyIWd032lo28G7hO8mcIs209LAEWP7x4gIZCje5q0p1xUCq9BDIXEMl8WuFktLNvMZeWNIglZl797pT6jg+LiMoF0+fL/OebOOMWwZBwQCanqo+DFteRSKBawriopN0DcWO8vucDKJBIYeA0Yp8bxbL2soxMEq8S3Apt5GcP2haET8G6K2SnQTwUmK5zqEKRgVWVZv8LKkL7TPOonunSX0q83bqdj6mj1e1uQgf4brdG42xs/S2H/KSqIB1jmyxL+qkJpyNanwjfwsOWQvjKItp4UocFF+BMFb4RQCrugWp+gwrfS6lEJdYaDHIBF6ddclix1/T/RkdgzNJ6iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn8kGuoSdBpCGMsBqjelu3zUYd8acWrkrQuHgUt5aPs=;
 b=i4N7/VuabXwhjR8HkfwBcwwlVC7C8hOKKRZlu5cOawSOMwbe200v9ObZq2R+oIJWcQF7HlxIIRJ4eF6cXehzsB2NXM/1LkheezQVgtAPGPFcj+QpMvaGptIacjBiyEI/qSrdAnAzWevxFlA+byokfYoTg74jCsQTP+7s2RKS7VYbEfC5REsLcVuISby+sXWnl8hOR3T7SiB9tGTecwk/jBIMESMT1pYkZpEMoiZj2PSwNCfpGedKqHVv0J1DztFk6nu5Xv43DifDv2suYCmMEwA9x5NUNw5BtYeQNXpOPejo5ITmu0Q/H/OhrfbzLVVHAIDLhO4/D/JNCYEPKzuHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPF3DE9570BE.namprd11.prod.outlook.com (2603:10b6:518:1::d18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 17:33:23 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 17:33:23 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Thread-Topic: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Thread-Index: AQHcIZsyVRELalHG0UmNU0YiA5xEj7SLNucAgAAWygCAAWEaAA==
Date: Wed, 10 Sep 2025 17:33:22 +0000
Message-ID: <2dbd79b1b46ee1731c7b7efd5ff1eb69143896d7.camel@intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
 <20250909150437.986365-3-francois.dugast@intel.com>
 <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
 <aMCOLgSmnPr1Jfkg@lstrano-desk.jf.intel.com>
In-Reply-To: <aMCOLgSmnPr1Jfkg@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPF3DE9570BE:EE_
x-ms-office365-filtering-correlation-id: 1fc45e44-1147-476a-f2e6-08ddf0902433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RWtMV3RNTkVsd1plZHJaUS9KeWlJdHBSRFV1ODEwWk9ldU5RanBtUXQwNXBN?=
 =?utf-8?B?VWlJd2ZFMzVJcmYxVi9pVjRkQTR1NVpOc09hdUFUNVQ5T1dlRDh0QldTeUJv?=
 =?utf-8?B?NkpxWDVlMmcyQ2FJTGoxUDBteUJ3MGpnajhzVU1tMHIwVjVXSWNVT1RVeDdT?=
 =?utf-8?B?N0NsUmZYOVd2cHlObmFGS3pyYXV3TWFlSzB5OUJCekNmNWNMRW05KzdxVkpD?=
 =?utf-8?B?SnY5MGc0d0x4NkhkNWhubFBzK0VVV2RJN2Y1Ym1tSWJVMEp2V0s1UnJRRXNR?=
 =?utf-8?B?cGtFcUpZaHdkeGhCdW03ZTlWWnJqZTNOOGgzZ3BCRXQ5V1NDaHdld1gwWkE2?=
 =?utf-8?B?cUx4SFdEYnRBT0RpVTNCTlhzYTBTSVFtV2pkamxPRGMvdDd5WTFwckV6Yk95?=
 =?utf-8?B?ZEYzTmRxeGVELzNRdmdZS0cwUkFUbXhHOVV6WFh6QWp1d0Fva0Rxdktud1Bl?=
 =?utf-8?B?NXdVK1Jnb0hpaE5CTkNDZ1k3dGw4QmlLaDJIN1FUbnhJeHpiaGJqVmdpNVlK?=
 =?utf-8?B?SVRjcldrbS8ydU04ckJJdDlYKzdYblIvUENBU1pyWGQ0ZDI0RmU0ZDdMYWRr?=
 =?utf-8?B?QVpWZXN5TlBZaEtPbXl2cDNmLzh5cEFsUStqL2xtUHY4SDJlNmx6OXBJZUZF?=
 =?utf-8?B?bytFYURKZlcvRW1JNWIwU25nQ3pOS1ovR1k1eSt1Z0dxb3JpbHY3eGpjWTVI?=
 =?utf-8?B?ekc4VjIxNVA4Y082anhYbFVUR0dFOHFoeE5zcVg1QmtUTFBIRzdJbVVIbmEy?=
 =?utf-8?B?RXZCMWNmcHZQVFJabnRxNGNlT0JWYzJhZXZwREFManpKbUJtTWpDNFZRdkM4?=
 =?utf-8?B?cGNCWmRPaDMzek5ZUDZsaU5GaXBKRlNzekZiaTdTNUdBTnRqUy9VWFpIN1dU?=
 =?utf-8?B?eWFncFQ5U05JSSt4ZmE3NExWd0Y5NVJsTkcrM1BOSUF3OHRGUlplMGo4Q2FC?=
 =?utf-8?B?bkJBb1NMYWYxcThBbE1wbU1oakJJOWdiN2pJQjFjWWw3M3VQaXRQK0dvL0Ri?=
 =?utf-8?B?NmloT3pFTWY5Nmk0Sk5OYXNleDRFMENsYVZ1TVUvUnhldkZWMHJobC9pWE12?=
 =?utf-8?B?bmFDdWxLTnlwZGlYTVQybXNmWnN0bmk4YTUwM0NsM24vNzFiOUQ0UDVQZTFu?=
 =?utf-8?B?NEVvYmd5SSt2T2d2MVZzMjdNdGlvelRoQkhZbFN6MmR1cnBXbWlvSUc4UVJD?=
 =?utf-8?B?T3pmRTVSYk5ibFRQYUJkT05NNDA1cGFvZ2NyL1hJOC9RaHRxbElMVlBMY2RE?=
 =?utf-8?B?WlhyY1pGWkdQZWIvSUYvYlpKY2Jic1lkU2xCUnhaZmo2VmdzaStxaklpVys1?=
 =?utf-8?B?R1lwbk5udlpwenVaOEExL2JUb2tvbkRBdGdNNTJBbEJHTy95TE15RnhPYlVa?=
 =?utf-8?B?NHBsd2RIT0VuR3g5RGZCTXFrb1N2VlRpaXFMTzJLQ0Q0V2FmRXdXUFpsQXJM?=
 =?utf-8?B?SkdZTFFrTk1CU2JybEZyR08xMUxTaGJwM09iSUFlbS9OM2tETFlid0RuWG9M?=
 =?utf-8?B?SXRxZmQ1UzVDeTlrT0pNL1VvT3lzYzNlc2RFSGEwclYrZUVkTWVTWTVzeitl?=
 =?utf-8?B?UmxWZ09NWjh5NnpEb0Z6TGIyY25Ha0JzQXd5Y2dzakJ1S0Vrb0hubFlCdTZr?=
 =?utf-8?B?aDVub0p4TTc1eDBTeG9jdkZBMlhRalB6OFdoZG0xVnNHMng3SXNaVVp2RXk5?=
 =?utf-8?B?T3poU0ZYRmRHdDdIWjFCencvM2U2anpQY3ZnTUxNMmFCS3Q3cXhDeDV1RC8y?=
 =?utf-8?B?YWxhUmx1cjg3bUxJOUZBaWNpNHdmNW5YYm1wVFR4WHpPOGsrM285Z2tETkZw?=
 =?utf-8?B?UURibFdOM2NwNXM4eFBoaCtpMHBRMW5OM2lwR3NJVUhaa21xWFFEYXk1UWVk?=
 =?utf-8?B?NjVYQkRJYnU1Ujh6WkxTa3N2cjN3WTZhY3U2QTVXMDY4Rmd1UHZJMFZuWWJP?=
 =?utf-8?B?ZEVlMi9QWmw5OGhvQmd3TXY5WFpicER2Wm41N3VhYjlZVjF5RnowOVVtZDBL?=
 =?utf-8?Q?+NHRxQX5cTaz+Lbd7qN7ltCtnsWD4o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtMVHFIYUpDcTJSRVdRZThoYm44Sm5RNHlUcFYwcUo1TXFtclcvaWhPUkJR?=
 =?utf-8?B?Y3FIODNqMEI0ZVA3QUN6VWplZU1MK2l0YUJ4Yzh3OTdpdURENlVoUnc5T0xx?=
 =?utf-8?B?aVc5andha05XMTFpZzRkM2c2VDFYNjY4c0IyV3RKZkJITTgvdnl0YzNNYTgr?=
 =?utf-8?B?V2NWZ2dDdGp6cHpwNzkybXBiWkRMNXRWSWRuOE1xQ1lqZndDR3o5WnpKK1pQ?=
 =?utf-8?B?bmRJTE1SSmhHUFVmT3NtUE0vVURXbmE1VUwzTk1pZUpVTVdoV0NlMEVsUkNX?=
 =?utf-8?B?WFV2RjYxK3p0WU1pUzhsV0t1NjJ0Qm5lK0w1cG5kaU9WYTFoMmdIajhMVXEz?=
 =?utf-8?B?VW85TTJpUXpRd2RGSDRlZGlKU2lFSi9jVE81L1pqZzNZZjVRK2R1bm5ScUZi?=
 =?utf-8?B?WmlvSHNrckRnRnJTMG5jMTcxbitXYU5GT2M0aUJJemJKNHluMTN4QWZLYUFn?=
 =?utf-8?B?Q3lhdXZwdUdoKzVHV0h4SldkK21FM08wZEZOSXYrSlRYM0hEVTl3ZTNMVTdw?=
 =?utf-8?B?WkxtQkQ2NFI3Q3NRR3FETk9QeXFYQ1Azd0U4U1NzNS9ZeElOWXV3UVpmUHhF?=
 =?utf-8?B?RkthaGRmVnEySkpSSXBBQ3M1OFBMa1VVay9rUUd0bTB2aWc4R3d0ZnU5Mytv?=
 =?utf-8?B?UEVHNVkzTk40Q0NIalNhZ1RyTTFRQUY4STVEVTJlaXZLek9LNW4vMGc5SURl?=
 =?utf-8?B?ZTRsczlCOThzL0xDcTZlYUxmb2YrV1hYK1BYaG9GYmlidTdFNjMzL1ltQ1JC?=
 =?utf-8?B?OTJ5alFCVEMyZGttUHhMQVJzZEZQTUsyZ05FS0lnbnpzb1Q5a1VTYW8xYlZH?=
 =?utf-8?B?T3BiTkg4Q2RROUNPSzcwcVp3Tk9QN2hWVHJTSmEwWDRkenRSR3FmRmFBVzJ2?=
 =?utf-8?B?WW55L00rdk53Yk5ndjZQdWtMT1NKS2RHVkwvejl4bk1EeXQxdElqdkFSNVBr?=
 =?utf-8?B?Z0JQM2JzZHB0Yk9hajJXTGl4MFVyQ3FyZ0xEUWZ3ZDNrWHJFTnRuMEF4WGNI?=
 =?utf-8?B?UzJIa3RtK3NtbUprcWxSeXprbnhRRkkrT292RC90QVcyMXRDeVZQdWdPU0tM?=
 =?utf-8?B?aDQvRXlzTTN3SGR3SXJLMVAwQ2xrd0VSaVZVeEY5dmc1NDFtUUdwSTM2eVNY?=
 =?utf-8?B?c3ZmKzRWU1JnMml6N1FYVS80L1BaZGNOaytOSnhpSUdUUlJPRGVidzh1MjNQ?=
 =?utf-8?B?K2IzeEhUcTRFbkE2Q2pFd1JZcUljdTl1WHNaWHpIN2h1Ry8yNDRLT2pYam90?=
 =?utf-8?B?MkdlbjJMS21lRG03eGhuNWdCRTBNaGNBNmQ1dUVKZ2UrVTFXN1BwVEN6WkRU?=
 =?utf-8?B?cDNKa2ozSDlubC9pNk54bC9rSk1EeUZkbEZINnM2enJ4OGJPSTZ5c2JNUmg5?=
 =?utf-8?B?SzIxRHh4Z1hpYjk3WUxrVUNVdHZMZjg2d2ZKY2svZ1hNUXg0bG1uaWhRZzBt?=
 =?utf-8?B?UzE3eUFmbExJNG43S0wvL2RINWVjRnJjNzV4akhocHZZR1RuTmZmZ3AwLzJa?=
 =?utf-8?B?OTBTUFRhb3liNlBWRjdndCt5ajZxSXJrUHhRUno2dUdyOWRsZkp6SGhxZ3BS?=
 =?utf-8?B?eWErYlcvOXBCVENLWCs5K2taWGxOQ0ZVekRGRjZUa3RaSXBsYVdLTHpWeEYr?=
 =?utf-8?B?K3Zhc21TZkxhVUZIcEd5bjlIbkVHS3Q0VmxMV1UvV2Q0c0JNeXRMWVgyRnFr?=
 =?utf-8?B?TG0yM0dwL1Y0dU1yWmExcnF4aXRPbys4Q2hwMk04SC9aUGp2aWM5R3R1czcx?=
 =?utf-8?B?VGNnVEx1Tkx6REo3bktOVzhZWXU2enlNWEllMUNGdjc5QUFGWnYwS0Y2VVdY?=
 =?utf-8?B?Y3E5eitWNDk5SXJVb1VYT05SenVoVkZXbVhHb2hCR0NZYXdob01pSGYxSWV0?=
 =?utf-8?B?NitXS21QTkJTdlBlL0p3QzZuTTZlWmd4Q0RyTjV2QnVuQ1lQMjY2RGdaUmRz?=
 =?utf-8?B?T21NeUkrTVJvdnpOOWNiOWNzeXFxMy9MdlBCa3d5cWkxK200dW9DTDJzcFg4?=
 =?utf-8?B?NTBVMGgyUWxWbW9yRmF2bGkyT0R4RmkxZXNxZFd2L0ZYN1NkN25MVWhsbzR4?=
 =?utf-8?B?SkJmYjNPd3Uzcmh2V1VWL3lHWHNiK0xIbm1MMHAyS1Rkb3hHT3Q4akRUbmNk?=
 =?utf-8?B?bDVqR1JMWXdDbFRabDFsOFdidnRpZk1id3lDYkdMQUNSSjBYTXN6b1ZmRVpN?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DCD633BAFA07C48B7059E36552B09EA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc45e44-1147-476a-f2e6-08ddf0902433
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 17:33:22.9792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oRpXZZrdcJKI2Q7I7PfPA0eb1q0fj668HeI8IGkZxOB8pYDmc1TggCPukKFCFehATpGMu3TlbNDaogvPi4Lq1kUVPa0Q6+OmJNsf51grPwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
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

T24gVHVlLCAyMDI1LTA5LTA5IGF0IDEzOjI5IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFR1ZSwgU2VwIDA5LCAyMDI1IGF0IDAxOjA4OjAzUE0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyNS0wOS0wOSBhdCAxNzowMyArMDIwMCwgRnJhbmNvaXMg
RHVnYXN0IHdyb3RlOgo+ID4gPiBBZGQgYSBuZXcgdHJhY2Vwb2ludHMgd2hlbiBoYW5kbGluZyBW
TUEgYW5kIFNWTSBwYWdlIGZhdWx0cy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5j
b2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jwqDCoMKgwqDCoMKgIHwgMjIgKysr
Ky0tLS0tLS0tCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdF90eXBl
cy5oIHwgMjUgKysrKysrKysrKysrKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHJh
Y2UuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDAKPiA+ID4gKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCj4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaAo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9wYWdlZmF1bHQuYwo+ID4gPiBpbmRleCBkMDJkMjJmYjM2NTkuLjUwODM2ZGY3OTk1MCAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gPiBAQCAt
MjAsMjQgKzIwLDExIEBACj4gPiA+IMKgI2luY2x1ZGUgInhlX2d1Y19jdC5oIgo+ID4gPiDCoCNp
bmNsdWRlICJ4ZV9taWdyYXRlLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX3N2bS5oIgo+ID4gPiAr
I2luY2x1ZGUgInhlX3RyYWNlLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX3RyYWNlX2JvLmgiCj4g
PiA+IMKgI2luY2x1ZGUgInhlX3ZtLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX3ZyYW1fdHlwZXMu
aCIKPiA+ID4gwqAKPiA+ID4gLXN0cnVjdCBwYWdlZmF1bHQgewo+ID4gPiAtwqDCoMKgwqDCoMKg
wqB1NjQgcGFnZV9hZGRyOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1MzIgYXNpZDsKPiA+ID4gLcKg
wqDCoMKgwqDCoMKgdTE2IHBkYXRhOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1OCB2ZmlkOwo+ID4g
PiAtwqDCoMKgwqDCoMKgwqB1OCBhY2Nlc3NfdHlwZTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgdTgg
ZmF1bHRfdHlwZTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgdTggZmF1bHRfbGV2ZWw7Cj4gPiA+IC3C
oMKgwqDCoMKgwqDCoHU4IGVuZ2luZV9jbGFzczsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgdTggZW5n
aW5lX2luc3RhbmNlOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1OCBmYXVsdF91bnN1Y2Nlc3NmdWw7
Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGJvb2wgdHJ2YV9mYXVsdDsKPiA+ID4gLX07Cj4gPiAKPiA+
IEknZCByYXRoZXIgd2FpdCB0byBhZGQgdGhpcyBvbiB0b3Agb2YgdGhlIHBhZ2UgZmF1bHQgc2Vy
aWVzIE1hdHQKPiA+IGhhcyBvbgo+ID4gdGhlIGxpc3QuCj4gPiAKPiAKPiBJIGFncmVlIHRoYXQg
d2Ugc2hvdWxkbid0IGJlIG1vdmluZyB0aGlzIHN0cnVjdHVyZSB0byBjb21tb24gZmlsZQo+IHdo
aWNoCj4gd2Ugd2lsbCBqdXN0IGNsb2JiZXIgc29vbi4gSSdtIG5vdCBzdXJlIHdoZW4gSSdsbCBo
YXZlIHRpbWUgdG8gcmViYXNlCj4gdGhhdCBjb2RlIHRob3VnaCwgZ2V0dGluZyBkcmFnZ2VkIGlu
dG8gYSBjb3VwbGUgb2Ygb3RoZXIgaG90IHRvcGljcywKPiBpdAo+IG1heSBiZSBhIGZldyB3ZWVr
cy4KPiAKPiBJZiBhbnlvbmUgd2FudHMgdG8gdGFrZSB0aGUgc2VyaWVzIG92ZXIsIGZlZWwgZnJl
ZS4KCkxldCBtZSBzZWUgd2hhdCBJIGNhbiBkbyB0aGVyZS4gSSdsbCB0cnkgdG8gZHJpdmUgdGhh
dCBsaWtlIHRoZSBUTEIKaW52YWwgc2VyaWVzIHJlY2VudGx5LgoKSSdtIGFsc28gYSBsaXR0bGUg
d29ycmllZCBhYm91dCBkcm9wcGluZyB0aGUgYWNjZXNzIGNvdW50ZXIgc3VwcG9ydCB3ZQpoYXZl
IGluIHRoZXJlLCBldmVuIHdpdGhvdXQgYSB1YXBpIGN1cnJlbnRseS4KClRoYW5rcywKU3R1YXJ0
Cgo+IAo+IE1hdHQKPiAKPiA+ID4gLQo+ID4gPiDCoGVudW0gYWNjZXNzX3R5cGUgewo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgQUNDRVNTX1RZUEVfUkVBRCA9IDAsCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBBQ0NFU1NfVFlQRV9XUklURSA9IDEsCj4gPiA+IEBAIC0yMDksMTEgKzE5NiwxNCBAQCBzdGF0
aWMgaW50IGhhbmRsZV9wYWdlZmF1bHQoc3RydWN0IHhlX2d0Cj4gPiA+ICpndCwKPiA+ID4gc3Ry
dWN0IHBhZ2VmYXVsdCAqcGYpCj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBhdG9taWMg
PSBhY2Nlc3NfaXNfYXRvbWljKHBmLT5hY2Nlc3NfdHlwZSk7Cj4gPiA+IMKgCj4gPiA+IC3CoMKg
wqDCoMKgwqDCoGlmICh4ZV92bWFfaXNfY3B1X2FkZHJfbWlycm9yKHZtYSkpCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmICh4ZV92bWFfaXNfY3B1X2FkZHJfbWlycm9yKHZtYSkpIHsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX2hhbmRsZV9zdm1fcGFnZWZhdWx0
KHhlLCBwZik7Cj4gPiAKPiA+IENhbiB5b3UgYWRkIHRoaXMgZGlyZWN0bHkgaW50byB0aGUgeGVf
c3ZtX2hhbmRsZV9wYWdlZmF1bHQgcm91dGluZQo+ID4gaW5zdGVhZCBvZiBpbiB0aGUgb3V0ZXIg
bGF5ZXIgaGVyZT8KPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVy
ciA9IHhlX3N2bV9oYW5kbGVfcGFnZWZhdWx0KHZtLCB2bWEsIGd0LAo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPnBhZ2VfYWRkciwKPiA+ID4gYXRvbWljKTsKPiA+
ID4gLcKgwqDCoMKgwqDCoMKgZWxzZQo+ID4gPiArwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdHJhY2VfeGVfaGFuZGxlX3ZtYV9wYWdl
ZmF1bHQoeGUsIHBmKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIg
PSBoYW5kbGVfdm1hX3BhZ2VmYXVsdChndCwgdm1hLCBhdG9taWMpOwo+ID4gPiArwqDCoMKgwqDC
oMKgwqB9Cj4gPiA+IMKgCj4gPiA+IMKgdW5sb2NrX3ZtOgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKCFlcnIpCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFn
ZWZhdWx0X3R5cGVzLmgKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0
X3R5cGVzLmgKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi40MzFiMTQ2OWQ3OWIKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmgKPiA+ID4gQEAgLTAsMCArMSwyNSBA
QAo+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLwo+ID4gPiArLyoKPiA+
ID4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uCj4gPiA+ICsgKi8KPiA+
ID4gKwo+ID4gPiArI2lmbmRlZiBfWEVfR1RfUEFHRUZBVUxUX1RZUEVTX0hfCj4gPiA+ICsjZGVm
aW5lIF9YRV9HVF9QQUdFRkFVTFRfVFlQRVNfSF8KPiA+ID4gKwo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L3R5cGVzLmg+Cj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBwYWdlZmF1bHQgewo+ID4gPiArwqDC
oMKgwqDCoMKgwqB1NjQgcGFnZV9hZGRyOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1MzIgYXNpZDsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgdTE2IHBkYXRhOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1OCB2
ZmlkOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1OCBhY2Nlc3NfdHlwZTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgdTggZmF1bHRfdHlwZTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTggZmF1bHRfbGV2ZWw7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHU4IGVuZ2luZV9jbGFzczsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgdTggZW5naW5lX2luc3RhbmNlOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1OCBmYXVsdF91bnN1
Y2Nlc3NmdWw7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJvb2wgdHJ2YV9mYXVsdDsKPiA+ID4gK307
Cj4gPiA+ICsKPiA+ID4gKyNlbmRpZsKgLyogX1hFX0dUX1BBR0VGQVVMVF9UWVBFU18gKi8KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oCj4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgKPiA+ID4gaW5kZXggYjlmNTk2NTE3NzFlLi44NTg3
OTgyZTdlZWUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5o
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oCj4gPiA+IEBAIC0xNCw4
ICsxNCwxMCBAQAo+ID4gPiDCoAo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9leGVjX3F1ZXVlX3R5cGVz
LmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX2dwdV9zY2hlZHVsZXJfdHlwZXMuaCIKPiA+ID4gKyNp
bmNsdWRlICJ4ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfZ3Rf
dHlwZXMuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfZ3VjX2V4ZWNfcXVldWVfdHlwZXMuaCIKPiA+
ID4gKyNpbmNsdWRlICJ4ZV9od19lbmdpbmUuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfbWlncmF0
ZV90eXBlcy5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9zY2hlZF9qb2IuaCIKPiA+ID4gwqAjaW5j
bHVkZSAieGVfdGxiX2ludmFsX3R5cGVzLmgiCj4gPiA+IEBAIC00NzMsNiArNDc1LDQ0IEBAIERF
RklORV9FVkVOVCh4ZV9taWdyYXRlLCB4ZV9taWdyYXRlX3ZyYW0sCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBUUF9BUkdTKHhlLCBsZW4sIHZyYW1fYWRkciwgZGlyKQo+ID4gPiDCoCk7
Cj4gPiA+IMKgCj4gPiA+ICtERUNMQVJFX0VWRU5UX0NMQVNTKHhlX3BhZ2VmYXVsdCwKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwgc3RydWN0Cj4gPiA+IHBhZ2VmYXVsdAo+ID4gPiAqcGYpLAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX0FSR1MoeGUsIHBmKSwKPiA+ID4g
Kwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX1NUUlVDVF9f
ZW50cnkoCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF9fc3RyaW5nKGRldiwgX19kZXZfbmFtZV94ZSh4ZSkpCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTY0
LCBwYWdlX2FkZHIpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTgsIGZhdWx0X3R5cGUpCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTgsIGFj
Y2Vzc190eXBlKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBmYXVsdF9sZXZlbCkKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19maWVsZCh1OCwgZW5n
aW5lX2NsYXNzKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBlbmdpbmVfaW5zdGFuY2UpCj4gPiAKPiA+IEFsc28g
dGhpcyBpbmZvcm1hdGlvbiBpcyBtb3JlIHBhZ2VmYXVsdCBzcGVjaWZpYyBhbmQgbm90IHJlYWxs
eSB0bwo+ID4gU1ZNCj4gPiBzcGVjaWZpY2FsbHkuIEluc3RlYWQgb2YgbW92aW5nIHRvIHhlX3N2
bS5jLCB5b3UgY291bGQganVzdCBwdXQKPiA+IHRoaXMKPiA+IG91dHNpZGUgb2YgdGhlIHN2bSBp
ZiBjb25kaXRpb24gYWJvdmUgdG8gY292ZXIgYWxsIGNhc2VzLgo+ID4gCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICksCj4gPiA+ICsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9mYXN0X2Fzc2ln
bigKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgX19hc3NpZ25fc3RyKGRldik7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPnBhZ2VfYWRkciA9IHBmLT5wYWdl
X2FkZHI7Cj4gPiAKPiA+IEFuZCB5ZWFoIHNvbWV0aGluZyBhYm91dCB0aGUgVk0gd2UgZm91bmQg
d291bGQgYWxzbyBiZSBpbnRlcmVzdGluZwo+ID4gaGVyZS4KPiA+IAo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCApLAo+ID4gPiArCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfcHJpbnRrKCJkZXY9
JXMgYWRkcj0lbGx4IGZhdWx0X3R5cGU9JWQKPiA+ID4gYWNjZXNzX3R5cGU9JWQgZmF1bHRfbGV2
ZWw9JWQgZW5naW5lX2NsYXNzPSVkICVzCj4gPiA+IGVuZ2luZV9pbnN0YW5jZT0lZCIsCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBfX2dldF9zdHIoZGV2KSwgX19lbnRyeS0+cGFnZV9hZGRyLAo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+ZmF1
bHRfdHlwZSwgX19lbnRyeS0KPiA+ID4gPiBhY2Nlc3NfdHlwZSwKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPmZh
dWx0X2xldmVsLCBfX2VudHJ5LQo+ID4gPiA+IGVuZ2luZV9jbGFzcywKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2h3X2Vu
Z2luZV9jbGFzc190b19zdHIoCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+ZW5naW5l
X2NsYXNzKSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF9fZW50cnktPmVuZ2luZV9pbnN0YW5jZSkKPiA+ID4gKyk7Cj4gPiA+
ICsKPiA+ID4gK0RFRklORV9FVkVOVCh4ZV9wYWdlZmF1bHQsIHhlX2hhbmRsZV92bWFfcGFnZWZh
dWx0LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwgc3RydWN0IHBhZ2VmYXVsdAo+ID4gPiAqcGYpLAo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBUUF9BUkdTKHhlLCBwZikKPiA+ID4gKyk7Cj4gPiA+ICsKPiA+ID4gK0RFRklO
RV9FVkVOVCh4ZV9wYWdlZmF1bHQsIHhlX2hhbmRsZV9zdm1fcGFnZWZhdWx0LAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0
IHBhZ2VmYXVsdAo+ID4gPiAqcGYpLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9B
UkdTKHhlLCBwZikKPiA+IAo+ID4gWWVhaCBJIGp1c3QgZG9uJ3Qgc2VlIHdoeSB3ZSBuZWVkIGJv
dGggb2YgdGhlc2UgZnJvbSB5b3VyIHBhdGNoLAo+ID4gb3RoZXIKPiA+IHRoYW4ganVzdCB0byB0
ZWxsIHdoZXRoZXIgdGhlIGNwdSBtaXJyb3Igc3VwcG9ydCBpcyBzZXQuCj4gPiAKPiA+IFRoYW5r
cywKPiA+IFN0dWFydAo+ID4gCj4gPiA+ICspOwo+ID4gPiArCj4gPiA+IMKgI2VuZGlmCj4gPiA+
IMKgCj4gPiA+IMKgLyogVGhpcyBwYXJ0IG11c3QgYmUgb3V0c2lkZSBwcm90ZWN0aW9uICovCj4g
PiAKCg==
