Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB719CE8343
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 13:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88A710E0CD;
	Mon, 30 Sep 2024 13:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGGu7/Ng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E48B10E0CD
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727703995; x=1759239995;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FAytq1m2s6fSDLr1eXRlte/oVm7ZK72RiZLXNUQYPfY=;
 b=oGGu7/NgvSOa04mB3/p/ZH1mHPMK1ymZjPUB2byiXcV2j08w3aC+xgjg
 bl1MYitP5t9F/fujVDn3CH+5FaTv5lbY0tBzZ8ye2Zt+OtPWV2Hgjd+50
 W9hpv+a/V/LCPjBdmLG+HV0CWWIssPw5owwFV2ZABPUIkKVpEr3edphhh
 OyPcgBX7GT7ayn4BdWRSYVD5OzxitZrzn6vF8tCmFx+YYbz6LVN4h8hgZ
 S6opW8q0dw6WzuJ0WpjSz4YKkNBlIU5R3Rq1iWZAGQCTaQUN5jX0Xp74v
 vC3KjUqnv9AZhlWy7IIBcjDKjCwWQrvKb6ZoadKbf9gjH2OCIGEy77Jdx w==;
X-CSE-ConnectionGUID: Gr6y1WszRPGPN6euRXpG4g==
X-CSE-MsgGUID: k7DYhqBQRgmZuwq0Ly10Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26674968"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26674968"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:46:35 -0700
X-CSE-ConnectionGUID: joTeCNvvTHidl7srbm0WQA==
X-CSE-MsgGUID: rQJY5fNtQv+sIOd1ySgmwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78271812"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 06:46:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:46:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:46:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 06:46:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 06:46:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9Z9HPBC6eOmznpZz4wwG7lJCTsAqxhFFHJ5vNUwcsJj4Y0ddLxvujpUUhi3JjL68mFVaWSM4qHyNLW0XYly7boWmvxeX1YZopJ7v+nb5qhjR1H4cAJap5V8MMuvSH3D8gRFuOKy4CPWQ47/p+PbAPZWHwObB4ZJuEkIUlkWw07UmiyTczhLBYO3XYasAbnKhZbzbioVCjQtlV/VSPLW54RRPUBCmkNrJpcHS/DBj4Kr3+NWwONiiXCgtAL6jF5MXmOyDVRnMMziP3pvNmVgQmi2nFlNOu5RLpTQrW0pZCCsYEJ7lxFwDAYYo4vOxfoM5wRspmph8TkYgc3GtBZC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAytq1m2s6fSDLr1eXRlte/oVm7ZK72RiZLXNUQYPfY=;
 b=dum4t65vUoTeKwKP0fD8JGg8WLum8f//UnSgs4w5wK0nY4+lXzi4GSu/uP9REz6VzEUpmrSJoKs5Nz2lYKVian+t1OFIQQEsAQwvOy16rzx1Af2h++mLDZBP9ibbR6V9KVvtFX61sxUj38tsOQWfWI9USmvJhOJ1ifHH8BeAJzynlekSBaKPEdGsQin3gA1U3Al5dOpb4f0T2zJjxqs/96zLPPkFCOpXGnjOHXLn14sKIRxzqxNrUmtOed8raes1F8D/CjU9l3DiGs5RQmSV8TwgLjPIWpgRDX0vAAwhLkfOi4e6fllF2CvfUx1zcPVhOXR1gS9vEUmFTSrZAKyuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 13:46:31 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 13:46:31 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH] Revert "drm/i915/psr: Implement WA to help reach PC10"
Thread-Topic: [PATCH] Revert "drm/i915/psr: Implement WA to help reach PC10"
Thread-Index: AQHbEwhZ3ut/2J5T702v8+ZjywmGw7JwWAzA
Date: Mon, 30 Sep 2024 13:46:31 +0000
Message-ID: <SN7PR11MB6750BE61DC5287CEC1783C56E3762@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240930071329.1630583-1-jouni.hogander@intel.com>
In-Reply-To: <20240930071329.1630583-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CO1PR11MB5171:EE_
x-ms-office365-filtering-correlation-id: 584a1bd9-afc3-4567-cacc-08dce1564a95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UTZ3M0l3TGlCUnNKVE9BRUw2TThiRHl0TTh6RzNEK1VHYkFLLy80ekN3dzlp?=
 =?utf-8?B?YTBaenJtUUZ2SlpLYWlXb3QwaWt0TzlGcFlzVVpvM1liVlVTYzZBdVQ5SW15?=
 =?utf-8?B?NDBpelNMbkxuSHN4eVMvd0NpNFJrdTlxMVYzbzBMdW1oNjh1ZDNKaW9aN0xW?=
 =?utf-8?B?aU1tcllBVHVMNnJ2QU5hd1pRZ0Y2SWdocHZpTVhCUm1sRGNjN3BESlBKUnYy?=
 =?utf-8?B?aDhjZ293NHJpa1kvU0owdUlsRTdrY2IwSzdiOWhnTzFPVHA3d2VRT0dXM0lL?=
 =?utf-8?B?Z2V6VEtwME9JTnVwdHE1V0llNE5rWnhlbDI4NFBOMTFHQm5pbE1DT2ZhWmxX?=
 =?utf-8?B?WmhuSVZJODluZ3FNdjFQTk1obWxoVUtCWmp3QUR1Nmg1RWxnYWIwVHZwVzRE?=
 =?utf-8?B?ZVhUdlkzQmRrYjNiTXlOWFZzKzZvTEZoNmNlYzZYM2JCZVN2L2xXenVMWHJJ?=
 =?utf-8?B?TW0rTmIvYU5MS1RXeTJpV0VpYkllV0hhSWE0TENTVm5lNGRGZG40aDF4b1I2?=
 =?utf-8?B?d0oxNUsydlRQSDkxSlRVQVVFOTR5M2pJT0paUWxlZzFjZ3lOOEU1YVBKNFpS?=
 =?utf-8?B?dU4vRElSRE9uL1RmN0ttZGlGRGNXVUlWQVRnSVFVQVMxMEtLZ0wrbDY2SDNt?=
 =?utf-8?B?VnhDa1JNbW1yaTlQcUxZckFHdjhVcUJjZnZZNjNGSVBTNjBQSnZVRGFjc01F?=
 =?utf-8?B?M3RHUGJrc3lRNWtpYjJBa2ppOElKekRoMUsya3c2aTJXTGErcmJkZ3hITFJH?=
 =?utf-8?B?NkU3ZnpKN202WFplT0lMdmx0VEprZURVaTNabmxxZ1FHMlJLeGpFTzl5WEtJ?=
 =?utf-8?B?N29KaENXSCtxZ1BxRW5KSFFqVUNWU1pzMVVHVXhLTnVmc1dEaEJaVVlObmdp?=
 =?utf-8?B?OHdCNEM4Z29iZ0p1bUxBZFVxblc5MUFhS2tYMVBtYUdwRnFtL0hNOElESHNz?=
 =?utf-8?B?ZEZIbjNMUlZORWhqOE5YR0N0VFllcHFEQUxFYkpIZEVEczVWczgwNHRoeGls?=
 =?utf-8?B?Wlh2R1JKSDdwemZlRmtuMmpWNUhQd0o1UCs4d283UHE2NllHSTd4T0FqTyt1?=
 =?utf-8?B?M3Z5YWxsZDA2aGk2Ky9Xd3hlS0R2Z0tKTGt0a1ZHZkVWbm5vaXNCcllnOThw?=
 =?utf-8?B?MEdMT0JlSmdMRWdJaWNBeDdZNS85NXJYaE5kTzQ4Y2xqR29TSitXcmFDQjBY?=
 =?utf-8?B?QmZCK2JrNGZkbCtkT1hidGxLd3hYQ0dFSFNaYmZpWnpyNHdtRVEvTFN3NmN0?=
 =?utf-8?B?SEcwWE1pVGJsWS9vZXJJRTVEaG5rYnBYbWFiYkFpcUNRZTBiN0NOQVo5RUp6?=
 =?utf-8?B?RmpEc1Q0L0pnS1E2dmJ5VVhRNXhUVE15SWZuZW5sOWtFbmE4aVV6RlNKRVg0?=
 =?utf-8?B?bkZXRVYzVW9meUVJNTJhbmQranNMSVpBZ1poTXBuS1NYM2l1aGl3VlBFMjgy?=
 =?utf-8?B?SXI5aXpEcTk4QjVTbWFxQXE1UnZIYjR3MS9PSkFJS0M0eDduenF3NldIYnIv?=
 =?utf-8?B?NGtjSVhGUWVmL29USDFPVXBoaEtWZ0xJbVBwc21PenhvcUtlOGxpWDA3T3RX?=
 =?utf-8?B?RGpKeC9BdStzbE10MlA4dHpPTFhvSFo1V2hGOFhiUlhKd2I0bkNpU3RKemZO?=
 =?utf-8?B?T1lzSHNSSVN4eHBSMEdkOG5NUFp5QnRKZzg5ZG52U2tiMUlJU1dxdUsydlJV?=
 =?utf-8?B?MVE5WTZmekRWZWdCaXRiU04yUHE5dzZEck80aERLVFJHQXJQN0hybkwzT3R4?=
 =?utf-8?B?MzF1aFVXaGlPOXBZdzJrYlpzRC9KdW96S1ExTjArcmVIZThFVm9XTmk4VW1o?=
 =?utf-8?B?YU5tTTdxSnpuaG1QOUJnbGRMdXQxL05YZ2JYN3U0R0RSaHFnclNBbWFNVElS?=
 =?utf-8?B?T3RiekswNDRjVlNIR2ZhbHZlVUVqQ28vcDNLOEYwUWFZMGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUtvc2hZSjVYZVhxMFdyZkd0cG5EOVk0OFVIY1FyWEJsRHgrMkpKZUR6Wm1G?=
 =?utf-8?B?VWVqdllhajJQWitDZFlsSWNVdXRIczBWMXNiUjBEb0owdU01ajFBM1BLUGFH?=
 =?utf-8?B?bzJlNVQ4MzZkb1crSkE3UTJjbTZqemg0cXczY3FRU0I2c3Q2VHdqekFmcUlC?=
 =?utf-8?B?MUZ4OTN2SzY3aDlObmU4dzFuMXo4TVMxTjgwMXM0MXN6dUlJL0VWY0lkNnMw?=
 =?utf-8?B?VVZBNHNVSy8vUllrWnUyckxwM2h6NURXR0xBcGx1Yno5WWxtVG9rYy9TRUMw?=
 =?utf-8?B?N0FYb0xXOHN5VkRjS2h5MzNBb3dUOEZ6YS9VZGFaMTBMRTVRWUtnNkltOTlK?=
 =?utf-8?B?UzVTSGV2WElQMkR3QVRnMmRnUUJYRjZ2NHdsL0cwLzNPeTdHVTZ1a201NENt?=
 =?utf-8?B?VkNrbkRCY05rVFE4eGREVnYvdjU5aHg1Q1duTEdZaEo0bllubVE1TS94bFZF?=
 =?utf-8?B?bVU1S1ZYTk9QT2JsRVJoVUtwbXVWUU1XUExzY2hPbkNYU2dpQklrZmFKNk4v?=
 =?utf-8?B?dTMrdFk4Vy9nN1BrSmNKYmxRNnBGUk9kZkRTMFFPcUtSc3VXWnJ3b2RSNTBz?=
 =?utf-8?B?MjBEZkcrR0FEWnlsbWNJc2x5Z2lxOWJpb1c4UFhkaUJFZTZXSzl2YU9NRjVp?=
 =?utf-8?B?UzBTdGxlWUZDOWZRN1pEODVXdkdNVUR1NGRIOU5Jb3ZLbHZxdGYyNjRNUUFI?=
 =?utf-8?B?S1ZBQXdKS3dneUZwdVE1TEszNUtabGJxdXU0dHVKcnB1VnAzS3U1a3Btclpx?=
 =?utf-8?B?dDAzelVhQmdSYkJpU3YyTGk2T1dobUxhVUM4QmthcnZBSzU4QmR4cTMxT0xU?=
 =?utf-8?B?R0VjM1NCZE0xajhTczRTYVBMYnQxZTl4WnhBZHlTNlMrNXBRYUNpeUE5cEZr?=
 =?utf-8?B?a3FTWHdSTW5oWWZMM01neXJrK3ZzQ0ZJZVhtZU42dlR4dHI2ODhuSTNkVlV3?=
 =?utf-8?B?WTJoTndOWjg0NTA3b3RVOU90N0pyM3Y1L2htZUNIdGtRbWtkWTVYY0xib1lL?=
 =?utf-8?B?VUtRRDl5N2M3enhlQXVZcFhYeU5NeVFFdGVZZExYT1lrQUFkWEJCU1ZlNXQ4?=
 =?utf-8?B?TlBKOVMwT01hd1VKQkJJdENyazZXb0lHaEFpV2JDcHBDaDhtc1dFeXJ2YjZC?=
 =?utf-8?B?T3dEUUo0QUFOSTZ3dzNJLzFBS1NKMnJkYWMxdUlIcUkwczJTSGIrU09ENG1O?=
 =?utf-8?B?UDQzb0NMVmxNZ21SMnRLYjhCcVJiZG1BbkJhampsZHd0QytSeGJpMGhTOENw?=
 =?utf-8?B?ZnZCVFlxN2ZHWCtoUmdjYU1JQy9mU3dBcVBjN3B6V0EvR2VvYm96MFJOQkYw?=
 =?utf-8?B?U3ZXU2Y1bkZWSmNudDdJSlFSRzA5OXpKcGprdzZUaFVVakVqMmRDek5uQWFC?=
 =?utf-8?B?MWdWT0FtckxyelN1ZllXK29KbGZwTWJHUVhLVzA1ZGpOOUZBUmI5SnRkeFdQ?=
 =?utf-8?B?eWZHaGkxSWM3cHNyTmhvWC9nUmszWVowYXhoVjBBQWExVlpqRThsWkIwTG9Z?=
 =?utf-8?B?eDBxZXltTUFaVWRLaUNQL3NvZEhvQmZWSTluc29MckljZzIvSVJSQWVmVmN6?=
 =?utf-8?B?dnNwUDlIYlA0OVVjbGFJOFM5ZzB3K1IrK2xpZ1UrVGJlQTd2S1Z5YnprKzV0?=
 =?utf-8?B?VzA0QzdMYm9lLy8vTyt3SVJHOE9tazlpL3hWbHVERXZxSUxPUlA0OG5CS2N2?=
 =?utf-8?B?MHM5a2JWazRPQVF2OUUxbEFoK1FBeVpRNWpRNTdoN1R2Wk5QY2k5aFc4amYx?=
 =?utf-8?B?dVk0UVdMbjAvUVpoaEkrRTh1bHp1ZitIV1U3bkNwcWtXdWE2cjE5OTVnd0JP?=
 =?utf-8?B?TlNQNmRaaUwrSm5CQTNyWVhaZks5V2NXRXRQWGdZd2t3YlE0TnlqY0V6ckhq?=
 =?utf-8?B?c0lvNE1lTjZwQTFsMG1zSWdmamdSVGdvTVo5bU9TcXhyUGZXY081L3pTd1cw?=
 =?utf-8?B?WFF6L3FITHpFbURjT0RvZEszQWNzckxyeHozYm9wWVJVWEIwemp4ZmhqRDV6?=
 =?utf-8?B?VTBVWkZRRFRPUWFxdDhRSmVOWFVQZmJDY1FTaEVIbHFLeHJiOEprYnhtMzVS?=
 =?utf-8?B?bkdzZ0V3SlZLNjhNVFJ6TWNUNng1WllhdkM3STliYmk5OTZVMHByb1M3L3Jl?=
 =?utf-8?Q?sh72Dd+CjLSzuwfi7P805ZAw0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584a1bd9-afc3-4567-cacc-08dce1564a95
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:46:31.4413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jPUVpmnLoWKCZTjIH/cPwrUX8GXt/TNSOAmftfH6hYotG4ctYWoTQSQQ8i+zOJLVygAA96D8QPwrYsf9wNK12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkNCj4g
SMO2Z2FuZGVyDQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDI0IDEyOjQzIFBNDQo+
IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEhvZ2FuZGVyLCBKb3Vu
aSA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAi
ZHJtL2k5MTUvcHNyOiBJbXBsZW1lbnQgV0EgdG8gaGVscCByZWFjaCBQQzEwIg0KPiANCj4gVGhp
cyByZXZlcnRzIGNvbW1pdCBjMjU3OWEyMTc3OTliYTU3N2ZhMzlhMmExMjY0M2EyNzczMzRlNjkx
Lg0KPiANCj4gUmV2ZXJ0aW5nIHRoaXMgY29tbWl0IGFzIGl0IGlzIHN1c3BlY3RlZCBiZWluZyBj
dWxwcml0IG9uIHJlZ3Jlc3Npb24uDQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBh
bCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5p
IEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgMyAtDQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jICAgICAgfCAxMTkgKy0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMjEgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfdHlwZXMuaA0KPiBpbmRleCA3ZmY5N2U1YjgzZGQ1Li5mNjBkNjZmNGI5ODBhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
dHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfdHlwZXMuaA0KPiBAQCAtMTU3Niw5ICsxNTc2LDYgQEAgc3RydWN0IGludGVsX3BzciB7DQo+
ICAjZGVmaW5lIEk5MTVfUFNSX0RFQlVHX1BBTkVMX1JFUExBWV9ESVNBQkxFCTB4NDANCj4gDQo+
ICAJdTMyIGRlYnVnOw0KPiAtCWJvb2wgaXNfZHBrZ2NfY29uZmlndXJlZDsNCj4gLQlib29sIGlz
X2RjNV9lbnRyeV9wb3NzaWJsZTsNCj4gLQlib29sIGlzX3dhX2RlbGF5ZWRfdmJsYW5rX2xpbWl0
Ow0KPiAgCWJvb2wgc2lua19zdXBwb3J0Ow0KPiAgCWJvb2wgc291cmNlX3N1cHBvcnQ7DQo+ICAJ
Ym9vbCBlbmFibGVkOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wc3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmMNCj4gaW5kZXggMzlhYTQ2ZGUxNWU0My4uZTMzNTdmM2I1YzcwNSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0yNiw3ICsyNiw2IEBADQo+
ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9kYW1hZ2VfaGVscGVyLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kZWJ1Z2ZzLmg+DQo+IC0j
aW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4gDQo+ICAjaW5jbHVkZSAiaTkxNV9kcnYuaCIN
Cj4gICNpbmNsdWRlICJpOTE1X3JlZy5oIg0KPiBAQCAtODk3LDg5ICs4OTYsNiBAQCBzdGF0aWMg
dTggcHNyX2NvbXB1dGVfaWRsZV9mcmFtZXMoc3RydWN0IGludGVsX2RwDQo+ICppbnRlbF9kcCkN
Cj4gIAlyZXR1cm4gaWRsZV9mcmFtZXM7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGJvb2wNCj4gLWlu
dGVsX3Bzcl9jaGVja193YV9kZWxheWVkX3ZibGFuayhjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZQ0KPiAqYWRqdXN0ZWRfbW9kZSkgLXsNCj4gLQlyZXR1cm4gKGFkanVzdGVkX21vZGUtPmNy
dGNfdmJsYW5rX3N0YXJ0IC0gYWRqdXN0ZWRfbW9kZS0NCj4gPmNydGNfdmRpc3BsYXkpID49IDY7
DQo+IC19DQo+IC0NCj4gLS8qDQo+IC0gKiBQS0dfQ19MQVRFTkNZIGlzIGNvbmZpZ3VyZWQgb25s
eSB3aGVuIERJU1BMQVlfVkVSID49IDIwIGFuZA0KPiAtICogVlJSIGlzIG5vdCBlbmFibGVkDQo+
IC0gKi8NCj4gLXN0YXRpYyBib29sIGludGVsX3Bzcl9pc19kcGtnY19jb25maWd1cmVkKHN0cnVj
dCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0KPiAtCQkJCQkgIHN0cnVjdCBpbnRlbF9hdG9taWNf
c3RhdGUgKnN0YXRlKQ0KPiAtew0KPiAtCXN0cnVjdCBpbnRlbF9jcnRjICppbnRlbF9jcnRjOw0K
PiAtCXN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOw0KPiAtCWludCBpOw0KPiAt
DQo+IC0JaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMjApDQo+IC0JCXJldHVybiBmYWxzZTsN
Cj4gLQ0KPiAtCWZvcl9lYWNoX25ld19pbnRlbF9jcnRjX2luX3N0YXRlKHN0YXRlLCBpbnRlbF9j
cnRjLCBjcnRjX3N0YXRlLCBpKSB7DQo+IC0JCWlmICghaW50ZWxfY3J0Yy0+YWN0aXZlKQ0KPiAt
CQkJY29udGludWU7DQo+IC0NCj4gLQkJaWYgKGNydGNfc3RhdGUtPnZyci5lbmFibGUpDQo+IC0J
CQlyZXR1cm4gZmFsc2U7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIHRydWU7DQo+IC19DQo+IC0N
Cj4gLXN0YXRpYyBib29sIHdhXzIyMDE5NDQ0Nzk3X3BzcjFfY2hlY2soY29uc3Qgc3RydWN0IGlu
dGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUsDQo+IC0JCQkJICAgICAgc3RydWN0IGludGVs
X3BzciAqcHNyKQ0KPiAtew0KPiAtCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9f
aW50ZWxfZGlzcGxheShjcnRjX3N0YXRlKTsNCj4gLQ0KPiAtCXJldHVybiBESVNQTEFZX1ZFUihk
aXNwbGF5KSA9PSAyMCAmJiBwc3ItPmlzX2Rwa2djX2NvbmZpZ3VyZWQgJiYNCj4gLQkJKHBzci0+
aXNfd2FfZGVsYXllZF92YmxhbmtfbGltaXQgfHwgIXBzci0NCj4gPmlzX2RjNV9lbnRyeV9wb3Nz
aWJsZSkgJiYNCj4gLQkJIWNydGNfc3RhdGUtPmhhc19zZWxfdXBkYXRlICYmICFjcnRjX3N0YXRl
LQ0KPiA+aGFzX3BhbmVsX3JlcGxheTsNCj4gLX0NCj4gLQ0KPiAtLyoNCj4gLSAqIERDNSBlbnRy
eSBpcyBvbmx5IHBvc3NpYmxlIGlmIHZibGFuayBpbnRlcnJ1cHQgaXMgZGlzYWJsZWQNCj4gLSAq
IGFuZCBlaXRoZXIgcHNyMSwgcHNyMiwgZWRwIDEuNSBwciBhbHBtIGlzIGVuYWJsZWQgb24gYWxs
DQo+IC0gKiBlbmFibGVkIGVuY29kZXJzLg0KPiAtICovDQo+IC1zdGF0aWMgYm9vbA0KPiAtaW50
ZWxfcHNyX2lzX2RjNV9lbnRyeV9wb3NzaWJsZShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSwNCj4gLQkJCQlzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gLXsNCj4gLQlz
dHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0YzsNCj4gLQlzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZSAqY3J0Y19zdGF0ZTsNCj4gLQlpbnQgaTsNCj4gLQ0KPiAtCWlmICgoZGlzcGxheS0+cG93ZXIu
ZG9tYWlucy50YXJnZXRfZGNfc3RhdGUgJg0KPiAtCSAgICAgRENfU1RBVEVfRU5fVVBUT19EQzVf
REM2X01BU0spID09IDApDQo+IC0JCXJldHVybiBmYWxzZTsNCj4gLQ0KPiAtCWZvcl9lYWNoX25l
d19pbnRlbF9jcnRjX2luX3N0YXRlKHN0YXRlLCBpbnRlbF9jcnRjLCBjcnRjX3N0YXRlLCBpKSB7
DQo+IC0JCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZpbnRlbF9jcnRjLT5iYXNlOw0KPiAtCQlz
dHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2Ymxhbms7DQo+IC0JCXN0cnVjdCBpbnRlbF9lbmNvZGVy
ICplbmNvZGVyOw0KPiAtDQo+IC0JCWlmICghaW50ZWxfY3J0Yy0+YWN0aXZlKQ0KPiAtCQkJY29u
dGludWU7DQo+IC0NCj4gLQkJdmJsYW5rID0gZHJtX2NydGNfdmJsYW5rX2NydGMoY3J0Yyk7DQo+
IC0NCj4gLQkJaWYgKHZibGFuay0+ZW5hYmxlZCkNCj4gLQkJCXJldHVybiBmYWxzZTsNCj4gLQ0K
PiAtCQlpZiAoIWNydGNfc3RhdGUtPmhhc19wc3IpDQo+IC0JCQlyZXR1cm4gZmFsc2U7DQo+IC0N
Cj4gLQkJZm9yX2VhY2hfZW5jb2Rlcl9vbl9jcnRjKGRpc3BsYXktPmRybSwgY3J0YywgZW5jb2Rl
cikNCj4gLQkJCWlmIChlbmNvZGVyLT50eXBlICE9IElOVEVMX09VVFBVVF9FRFAgfHwNCj4gLQkJ
CSAgICAhQ0FOX1BTUihlbmNfdG9faW50ZWxfZHAoZW5jb2RlcikpKQ0KPiAtCQkJCXJldHVybiBm
YWxzZTsNCj4gLQl9DQo+IC0NCj4gLQlyZXR1cm4gdHJ1ZTsNCj4gLX0NCj4gLQ0KPiAgc3RhdGlj
IHZvaWQgaHN3X2FjdGl2YXRlX3BzcjEoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkgIHsNCj4g
IAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxf
ZHApOyBAQCAtDQo+IDEwOTIsMTUgKzEwMDgsNyBAQCBzdGF0aWMgdm9pZCBoc3dfYWN0aXZhdGVf
cHNyMihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAgCXUzMiB2YWwgPSBFRFBfUFNSMl9F
TkFCTEU7DQo+ICAJdTMyIHBzcl92YWwgPSAwOw0KPiANCj4gLQkvKg0KPiAtCSAqIFdhXzIyMDE5
NDQ0Nzk3DQo+IC0JICogVE9ETzogRGlzYWJsZSBpZGxlIGZyYW1lcyB3aGVuIHZibGFuayBnZXRz
IGVuYWJsZWQgd2hpbGUNCj4gLQkgKiBQU1IyIGlzIGVuYWJsZWQNCj4gLQkgKi8NCj4gLQlpZiAo
RElTUExBWV9WRVIoZGV2X3ByaXYpICE9IDIwIHx8DQo+IC0JICAgICFpbnRlbF9kcC0+cHNyLmlz
X2Rwa2djX2NvbmZpZ3VyZWQgfHwNCj4gLQkgICAgaW50ZWxfZHAtPnBzci5pc19kYzVfZW50cnlf
cG9zc2libGUpDQo+IC0JCXZhbCB8PQ0KPiBFRFBfUFNSMl9JRExFX0ZSQU1FUyhwc3JfY29tcHV0
ZV9pZGxlX2ZyYW1lcyhpbnRlbF9kcCkpOw0KPiArCXZhbCB8PSBFRFBfUFNSMl9JRExFX0ZSQU1F
Uyhwc3JfY29tcHV0ZV9pZGxlX2ZyYW1lcyhpbnRlbF9kcCkpOw0KPiANCj4gIAlpZiAoRElTUExB
WV9WRVIoZGlzcGxheSkgPCAxNCAmJiAhSVNfQUxERVJMQUtFX1AoZGV2X3ByaXYpKQ0KPiAgCQl2
YWwgfD0gRURQX1NVX1RSQUNLX0VOQUJMRTsNCj4gQEAgLTI4MTUsMjAgKzI3MjMsMTAgQEAgdm9p
ZCBpbnRlbF9wc3JfcHJlX3BsYW5lX3VwZGF0ZShzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRl
ICpzdGF0ZSwNCj4gIAljb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3Rh
dGUgPQ0KPiAgCQlpbnRlbF9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsN
Cj4gIAlzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlcjsNCj4gLQlib29sIGRwa2djX2NvbmZp
Z3VyZWQgPSBmYWxzZSwgZGM1X2VudHJ5X3Bvc3NpYmxlID0gZmFsc2U7DQo+IC0JYm9vbCB3YV9k
ZWxheWVkX3ZibGFua19saW1pdCA9IGZhbHNlOw0KPiANCj4gIAlpZiAoIUhBU19QU1IoZGlzcGxh
eSkpDQo+ICAJCXJldHVybjsNCj4gDQo+IC0JaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID09IDIw
KSB7DQo+IC0JCWRwa2djX2NvbmZpZ3VyZWQgPSBpbnRlbF9wc3JfaXNfZHBrZ2NfY29uZmlndXJl
ZChkaXNwbGF5LA0KPiBzdGF0ZSk7DQo+IC0JCWRjNV9lbnRyeV9wb3NzaWJsZSA9DQo+IC0JCQlp
bnRlbF9wc3JfaXNfZGM1X2VudHJ5X3Bvc3NpYmxlKGRpc3BsYXksIHN0YXRlKTsNCj4gLQkJd2Ff
ZGVsYXllZF92YmxhbmtfbGltaXQgPQ0KPiAtDQo+IAlpbnRlbF9wc3JfY2hlY2tfd2FfZGVsYXll
ZF92YmxhbmsoJm5ld19jcnRjX3N0YXRlLQ0KPiA+aHcuYWRqdXN0ZWRfbW9kZSk7DQo+IC0JfQ0K
PiAtDQo+ICAJZm9yX2VhY2hfaW50ZWxfZW5jb2Rlcl9tYXNrX3dpdGhfcHNyKHN0YXRlLT5iYXNl
LmRldiwgZW5jb2RlciwNCj4gIAkJCQkJICAgICBvbGRfY3J0Y19zdGF0ZS0NCj4gPnVhcGkuZW5j
b2Rlcl9tYXNrKSB7DQo+ICAJCXN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBlbmNfdG9faW50
ZWxfZHAoZW5jb2Rlcik7IEBAIC0NCj4gMjgzNywxMiArMjczNSw2IEBAIHZvaWQgaW50ZWxfcHNy
X3ByZV9wbGFuZV91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+
IA0KPiAgCQltdXRleF9sb2NrKCZwc3ItPmxvY2spOw0KPiANCj4gLQkJaWYgKERJU1BMQVlfVkVS
KGk5MTUpID09IDIwKSB7DQo+IC0JCQlwc3ItPmlzX2Rwa2djX2NvbmZpZ3VyZWQgPSBkcGtnY19j
b25maWd1cmVkOw0KPiAtCQkJcHNyLT5pc19kYzVfZW50cnlfcG9zc2libGUgPSBkYzVfZW50cnlf
cG9zc2libGU7DQo+IC0JCQlwc3ItPmlzX3dhX2RlbGF5ZWRfdmJsYW5rX2xpbWl0ID0NCj4gd2Ff
ZGVsYXllZF92YmxhbmtfbGltaXQ7DQo+IC0JCX0NCj4gLQ0KPiAgCQkvKg0KPiAgCQkgKiBSZWFz
b25zIHRvIGRpc2FibGU6DQo+ICAJCSAqIC0gUFNSIGRpc2FibGVkIGluIG5ldyBzdGF0ZQ0KPiBA
QCAtMjg1MCw3ICsyNzQyLDYgQEAgdm9pZCBpbnRlbF9wc3JfcHJlX3BsYW5lX3VwZGF0ZShzdHJ1
Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAkJICogLSBDaGFuZ2luZyBiZXR3
ZWVuIFBTUiB2ZXJzaW9ucw0KPiAgCQkgKiAtIFJlZ2lvbiBFYXJseSBUcmFuc3BvcnQgY2hhbmdp
bmcNCj4gIAkJICogLSBEaXNwbGF5IFdBICMxMTM2OiBza2wsIGJ4dA0KPiAtCQkgKiAtIERpc3Bs
YXkgV0FfMjIwMTk0NDQ3OTcNCj4gIAkJICovDQo+ICAJCW5lZWRzX3RvX2Rpc2FibGUgfD0NCj4g
aW50ZWxfY3J0Y19uZWVkc19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKTsNCj4gIAkJbmVlZHNfdG9f
ZGlzYWJsZSB8PSAhbmV3X2NydGNfc3RhdGUtPmhhc19wc3I7IEBAIC0yODYwLDgNCj4gKzI3NTEs
NiBAQCB2b2lkIGludGVsX3Bzcl9wcmVfcGxhbmVfdXBkYXRlKHN0cnVjdCBpbnRlbF9hdG9taWNf
c3RhdGUNCj4gKnN0YXRlLA0KPiAgCQkJcHNyLT5zdV9yZWdpb25fZXRfZW5hYmxlZDsNCj4gIAkJ
bmVlZHNfdG9fZGlzYWJsZSB8PSBESVNQTEFZX1ZFUihpOTE1KSA8IDExICYmDQo+ICAJCQluZXdf
Y3J0Y19zdGF0ZS0+d21fbGV2ZWxfZGlzYWJsZWQ7DQo+IC0JCS8qIFRPRE86IERpc2FibGUgUFNS
MSB3aGVuIHZibGFuayBnZXRzIGVuYWJsZWQgd2hpbGUgUFNSMQ0KPiBpcyBlbmFibGVkICovDQo+
IC0JCW5lZWRzX3RvX2Rpc2FibGUgfD0NCj4gd2FfMjIwMTk0NDQ3OTdfcHNyMV9jaGVjayhuZXdf
Y3J0Y19zdGF0ZSwgcHNyKTsNCj4gDQo+ICAJCWlmIChwc3ItPmVuYWJsZWQgJiYgbmVlZHNfdG9f
ZGlzYWJsZSkNCj4gIAkJCWludGVsX3Bzcl9kaXNhYmxlX2xvY2tlZChpbnRlbF9kcCk7DQo+IEBA
IC0yOTAyLDEyICsyNzkxLDYgQEAgdm9pZCBpbnRlbF9wc3JfcG9zdF9wbGFuZV91cGRhdGUoc3Ry
dWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCWtlZXBfZGlzYWJsZWQgfD0g
RElTUExBWV9WRVIoZGlzcGxheSkgPCAxMSAmJg0KPiAgCQkJY3J0Y19zdGF0ZS0+d21fbGV2ZWxf
ZGlzYWJsZWQ7DQo+IA0KPiAtCQkvKg0KPiAtCQkgKiBXYV8yMjAxOTQ0NDc5Nw0KPiAtCQkgKiBU
T0RPOiBEaXNhYmxlIFBTUjEgd2hlbiB2YmxhbmsgZ2V0cyBlbmFibGVkIHdoaWxlIFBTUjENCj4g
aXMgZW5hYmxlZA0KPiAtCQkgKi8NCj4gLQkJa2VlcF9kaXNhYmxlZCB8PSB3YV8yMjAxOTQ0NDc5
N19wc3IxX2NoZWNrKGNydGNfc3RhdGUsDQo+IHBzcik7DQo+IC0NCj4gIAkJaWYgKCFwc3ItPmVu
YWJsZWQgJiYgIWtlZXBfZGlzYWJsZWQpDQo+ICAJCQlpbnRlbF9wc3JfZW5hYmxlX2xvY2tlZChp
bnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQo+ICAJCWVsc2UgaWYgKHBzci0+ZW5hYmxlZCAmJiAhY3J0
Y19zdGF0ZS0+d21fbGV2ZWxfZGlzYWJsZWQpDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
