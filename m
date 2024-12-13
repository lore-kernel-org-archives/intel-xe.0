Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD477E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 04:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA2310E4E1;
	Fri, 13 Dec 2024 04:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GttDZ/iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9625010E4E1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 04:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734063245; x=1765599245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B6zw8m6zYOyLXWJKZt+Wh599Piae5gXzkRu1Qhyhmu0=;
 b=GttDZ/iwAkDb44xvkfIsSnL6Oj0/dnZBTNdYWXw134ffA4JygvULXPNJ
 RGerQcnYB6RknAMUcnH7H9MwW/8RVXtZJQ1DEfrMXwknXueMzLSc5ExlR
 OW0bSSdNHMBp1TyYO5TpTPpHaAbAXpcTCu3gjFCpw7xu6jlceTw7sA7r2
 goQe8q65UXr0cZsqSOXqfTjhmB+aP+iCtn+OlinVehMFh4ZpBR8siXbM5
 dOwf5nVDZLkvp/FnRyFKUWwA0TviE5wSGtdTwRqbfxmkJsRLpC/yZIKI3
 NiXxsWysaNUavKeuju+aAjTGl0gtIu18XUezQ85g0AxbSMimZaw1MSGnD g==;
X-CSE-ConnectionGUID: nZUkPkqESkuXhHj3OLksyA==
X-CSE-MsgGUID: cKrAIuctSc6PnrxnUsBBpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="56981724"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="56981724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 20:14:04 -0800
X-CSE-ConnectionGUID: BwnN4QI/RWi/62/jUw0IFg==
X-CSE-MsgGUID: E4vHeHamT120jKBVWjJbLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96974974"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 20:14:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 20:14:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 20:14:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 12 Dec 2024 20:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA6CYF2DWtQcdSt+JbSGovExGcEAETLEwWOJDy/QYZynU9AYgXqeNB2CSyZEvXqpda46Wn508jtdj5V62aBNGCqYNXbMPGbxWXUe9Q/JXVFrtaO1nZaeNAC8yVXBq9oxHhSIcyQKNasPaeDL7JU7U8vy52pUk6qsrglHdOvtd2Si+c9QL8qzcsiqpnOFIqk6K1nUQOM65EZGUdCBCWqYXc2vJeXU1fnALdahC1I8Kg853I7ldher+Tlmd1Y/0qN9aizKFlsvNoFd+xxfDpm5VmcjSSFqmmMghZOkwvBhVc+gA7l7y/A62PUARVNNIPfwHTPGOnygk2JusDqxQh64ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6zw8m6zYOyLXWJKZt+Wh599Piae5gXzkRu1Qhyhmu0=;
 b=vcTrv4fHymcVjn8wONZN7ph/nGfMPcxwYmJWwDLkmQ33F/aaDIaglMyZS42ZMz+dyHX2JDC8mBZAOxKxc75hgpYSZQzbK4kwTJXyMAaymAmeT7452RLDbLh9uxb+5WkPQi5OmOn37gXx15ptrzFxVBQuIZXzGSynNFagzJUmyzTVdfEWKM5Y+gq/COxwLXDMCjT3VXLK7CkA0kj0L00qL4pbGSAcy70qkKnnPY/Y1A7a+oFH4pMOEA+T2IdCnn8pLqpd3muRpIyZlmfY40bbJvCSU4Sx1+ZBWCRSwOknghGTCV4nBTkbXlpv+VH5a4YhLBECPhDprQLQqAFtYKNniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 04:13:59 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 04:13:58 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>
Subject: RE: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Thread-Topic: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Thread-Index: AQHbTO/7fwYN+4v46kW8D4uHt5Qe/rLjkL0g
Date: Fri, 13 Dec 2024 04:13:58 +0000
Message-ID: <BN9PR11MB5275184D4EFDAC2DF9D024E4E7382@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20241212234606.2877233-1-matthew.brost@intel.com>
In-Reply-To: <20241212234606.2877233-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|PH7PR11MB6724:EE_
x-ms-office365-filtering-correlation-id: 1ba92844-2a6d-4936-1ade-08dd1b2c9112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L3BmcnYxL0paTndpekhJM1hHeHVPV1hHY21zREl3SytuelhnQ2FENHlIOUhV?=
 =?utf-8?B?a2RXdzRzN0tuekY4TWVrK29tbnkreW0zcmNOaUpJZVRoM2RwbzMvdnpPamFj?=
 =?utf-8?B?Sm1NN3N0WXo2TjRsRHMwMm1sR3FhWG1KUk54SzZ5U1Y0UHpuaE5lOWpjSVE3?=
 =?utf-8?B?anRhdU9vZXZLSWRTSU9KTGp6WEN2RWxHa1U1L2NmVVdZcHRobHN6YnUxTFlw?=
 =?utf-8?B?ak9zS28vdXgzejVmYmhscWJpQ0ZiSDdBb1RydTJ1TllSdzF4MHFnVGkxcUJr?=
 =?utf-8?B?OURHNktZVlZ2ZnY1YytYNlJ6T3BBalZaZndBK01EcnNESmw2NDdQUzJaN2du?=
 =?utf-8?B?SHBWTHZuMUpJZGI1eGNTOFZvTmdtcFpzY1dDN1J2WnEyRlFOWnJBY2p6VFdx?=
 =?utf-8?B?bVY3OWQrYVFOSXRmL1A4WVF3VFNOMksxcHRxQ21ZMVJaMW8xOGJpMVQrdmxY?=
 =?utf-8?B?Z0cxQ0xCS2NleFo3TXFDQWZVcm5OeVBZR0l2clhVWW1QRG1DcDJacVE2WVdF?=
 =?utf-8?B?OTUwaUt2c2txdFN4QjA3VjVVTzB6QldyZEZuVWVWOG81L3dLenkrQ3Y4eDhQ?=
 =?utf-8?B?RUYvOUNYWDlJUkg3UlQ0WlRkNk5vYzZ0dythRlpyaGtEeWNMd0xvTkVvNFIv?=
 =?utf-8?B?andVTEdrbnhmVEtZWW9TVzFkY1JxZDg4czJydUVRSlhzbU5BRzg1QkFmWGNB?=
 =?utf-8?B?MVNiNk43QlFjTlVtQVJLZXdzaTdOSm16NFgremRDdExKcXl3MDRYNXA3aURx?=
 =?utf-8?B?Z200cndrVVFMK3BBWlBJVTA1d244c09QYW4rMUdKdkx4dHExS3pobjBOcnFB?=
 =?utf-8?B?V20zSUg3NlJzQ2pBWC9icGp0UjBKUHB0TjIwU2F4YXhBQXpCUFhLaC9TMEI2?=
 =?utf-8?B?Z0RZQ2puU0tta2R5QytZWXZkOUJtSVNVaDhxQ1dlM0xiRm5oTnZiR016WGZC?=
 =?utf-8?B?ejVBMkpqckhqcDc0d3F5dlEzeXZ4T084dVVId1h2RUNGVS85eTNZS21qRDUr?=
 =?utf-8?B?ZGp4a0hjaHNaNVBFb25TdkhOTk8rSk1ocHFCL0cxM1Q3MXY0dGd6N3BFVldp?=
 =?utf-8?B?QXkwVjA0UVIvQ0IzMEtBb2xMZU5PbEJQSjNraUk4ZGdnNmNpdnRObm9ONnoy?=
 =?utf-8?B?SmVqQ1U2eERjSXZGWnU3bUVzR2NqbWs2amdWYjdBVWNEZDg0c05XYVVta0pp?=
 =?utf-8?B?TTB3UHdXTXQ3UWlOYUpobGFXZk1VMU5SVmwvNHlZdzdNSG01YWwwMFlJUTMx?=
 =?utf-8?B?UHlMdjhoREpYSUhJVnNudWphdVNIVkVHSEFuT2MwNUVFN2tFdGszdXFVcklJ?=
 =?utf-8?B?bFRHUzZwTlVLWllVblJhRHlLb2R4ODVDcFU5a1FpR01wQ1oxTGdVblpsKzlQ?=
 =?utf-8?B?L2t6R1BycWRMVnFISEF6T1FJV2NlUTQ4SW1BV1dERlU4ZDdJODlwdHNvelRP?=
 =?utf-8?B?VlBDQXBSWnF5aFQrRzYxOXZwcUcvUG5HZTkvaVpNc1pjN2phaDB2SkRGbFZy?=
 =?utf-8?B?d2FtRlBCbmNnWk9CRVVRVHdCUm04cTJncTNETWF1Yzdjby8yQ1RXUXZjS2pP?=
 =?utf-8?B?ejZWYjJ6b3ZYTjVLNGlLRU1NUHNRREtXcXFKTGJYMjZaeGNDNVlxODM3QTVp?=
 =?utf-8?B?UVhJdlNlVXMwbGVWR1FCK0dCYmdMei9nSFJhZDlhRFU5L05vZTBXajN5TytE?=
 =?utf-8?B?cW16amZDdUl2ZEZ3K3ZmZjRjVGRSRkg1bDV0TWk4RElpbFBiK1hQbXpydWhH?=
 =?utf-8?B?YXdQRFZzMk4wZmZvcnRXejNvNlZGZ3BwN1IwcllrMmpFVi83WDR5cnBxS0Qw?=
 =?utf-8?B?SDBWNzlhSCtmd2lYdnJYZDErSjdNUFFsYVB0eS8ydEdMWW5WL1FMdUVqSVda?=
 =?utf-8?B?ckVwVUJtbk9XUy9RaVJuUWNJOVlHcGZBbGNDL2sxdWF4TEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjZ4K0VGN0NGdWdiTXc2VDg5R1hwN0NERE0wNmVKNmN0YnI4aGU3UE4xMERx?=
 =?utf-8?B?K0NQTmM5WitiUnMrSjdZOSsyMm1ncWFaVnJ5V1Z4aExsUmcwU01ULzhHZWFX?=
 =?utf-8?B?d1RhVU9JNUF6NkVDZklZUXV3MktKNTB4MHNpa2VsMkhlMTZxbnZEekwyNkJ0?=
 =?utf-8?B?SE9pd0JCaHVNM0QwMWVadFlNTkhNd2ZOMkQ4cFJ4Y3BVNjNBMjN2VS93ZURM?=
 =?utf-8?B?a1p1SnRFTW1UUlN5N0RMY0EvcCsxZ25zdmxmL3JGTE5uNEZaNWFsMXdiMmNE?=
 =?utf-8?B?YU14MFJCS0V3MVVBYXViWHhMVzMxT0FlK3JKQ0ZxUnYvMEx1bVY3TUpuU0dz?=
 =?utf-8?B?V2ZLQWZiSGdaRXk2eEFXQktaYlhxRm92YTNocGs3Zi9pcFNPSkZaRnpYSGNV?=
 =?utf-8?B?dUVSa1MvWEVWSUxpbHUxczhLMWZuMmVxRTlEemRJcUNkd1c0anZiR2hjemwx?=
 =?utf-8?B?U0pBbXVQQUZzUklZaTRsL3FpaW9yS2paNjFnTmc1WEpXOTlXdHNmNjNYRlQ4?=
 =?utf-8?B?OHBHZDl0a2hlZlNNUlVtemo0dWtEd2FTUEJyK3dxT1Q5VWFBQTY2UHRzLytV?=
 =?utf-8?B?d0hxcDkwTExrMmRDbndoL2pnSU1DRG41THdmSzVNZUZDUkQydTNCczlxY0JH?=
 =?utf-8?B?NzVQbndDUnIzSlRXU0JhYXFZb0xRV1I5ZTZRU0hla3hPVmtyYU5QUkdvMWFj?=
 =?utf-8?B?b096dnhkN1QrU0hTNkhEMlhGTEdUK1kycXppbEJkOWRia29CbG9zYnBsQVR5?=
 =?utf-8?B?MnJIQnNZUitiSHMzb09EZEhlOE0yWDQzZHNNYnByUWU0QU5XWGVTTXJKK00w?=
 =?utf-8?B?U3dqaDA4Y3BMeXg0MUVPM2dXVXlKU1ZiTnZueGM3bmF5SHRpbHpZS0x4Q0o4?=
 =?utf-8?B?ZWdJUS9yL3FMeVZXNmhNdXN2eTI4RzFub1BMQllPcVptVFpaRUsvRUI0b2di?=
 =?utf-8?B?ODR1R3duNXh5bkVlWjRRdll1aGhQU3RJK1FpWFhjcmp1N0tad0FXN205MDRF?=
 =?utf-8?B?cnpsNWFMRkNqRDRNWW5CS1pkc3R3Q2QrRDZJZGtIQ0d0Sk15elFlSE4xVGZ3?=
 =?utf-8?B?WGJPRUlPNEVPSkxSemVNY3E5V3cyRUYzRERmb283RkVsdUwyaEFpUGNrcEhx?=
 =?utf-8?B?SURzN0xhdWx6QVNXNmNudnFuQnQ0cjJJMjBxRjVUUGp1RUt2Vys5RnF6Sytx?=
 =?utf-8?B?Vm4rbkhENE1iWE1KY21rLzJwR09CQnl4SkQ1NHJaRmNibXZrRktHbWdhYU4w?=
 =?utf-8?B?bVo0MmNESlVWdkc0VnN2ZjVtMTJFdFh4NThLang4by9zRFZkSUJFL1ZSMEo0?=
 =?utf-8?B?aituRkFEUmNjaEtiMHlBNEp3VlpaTmVSWDBPa1VMcTFyaU82S3g3RXdOVFdm?=
 =?utf-8?B?bFJmUGppMmpNcC81ZWJ3ZGE2MDl5QklrRVpLTmFGQmVta21JaU9XVzNCY3hM?=
 =?utf-8?B?dG1Oa0Y1MHI5YmRhN2ljbW5xdUQ1bHZzZHcvRCtTQlpmZ2RMd2UrY292b2NO?=
 =?utf-8?B?YUs0VzgzZjFWZTBUUnlycE9QckF3S1QzSVJSR0hDOFZUL1dtZ0twWExXMlg0?=
 =?utf-8?B?T2poMHdxdzhENEp6V2p1cEhuVGNwWkhDWmhQdU9oeklVWkw3QjBtZHJTY3A3?=
 =?utf-8?B?TWhydVMrK0dtQU5iZGRvZzBRUkZwemlzdEhZQzFKOXhuSnV1U3JsWXBoc3Az?=
 =?utf-8?B?blpaYlV5dmFFaVlRT01MN0QxM3ZXUEhIYjdENjVKNjJMODhuZWtEUStZM2ZO?=
 =?utf-8?B?MXFrNGNyUkNJV2dBSm5yaFI3V21WRnYzaUxvVDdUTWxIRHh2ZnZBZCtFZVpw?=
 =?utf-8?B?RnNwcmFwOWtnMWJjcUFwWkFreTJPTTB5YXJGbzBwbkQ5eUNDOHJBSlE5c1NU?=
 =?utf-8?B?bHJtSTRCWWpFRGJoVHdmOENWTzdVdmJEZjljY25FQnhhTlBxNjNLd2l3TEoz?=
 =?utf-8?B?RXdFdFVUZmIzcjNUK080Vkl6cE1CT1BvWEV1MnE3Ump1NnhRRzY1d0duUTR6?=
 =?utf-8?B?SFNGanU3cTRJVWd5S2YybXBEVXU2Z2llSnNkOEdmNi9aRUkra2NIVmtSUXFq?=
 =?utf-8?B?OW9OWVR1NVBobXd5aWpkazU0MUEzOHp3bmpkaUxTT1B5dHRtSXhpbWZLSXEw?=
 =?utf-8?Q?n1R4rChaqLNF5gy9cii91lh2h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba92844-2a6d-4936-1ade-08dd1b2c9112
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 04:13:58.2504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVEzg5bV2K0vNmmRmAaoCi/p7zUtyZUKiGndcLMyKsG4JBMihlEuvx6zqDVWfa+timVEDIZooyKnbcH47eT42g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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

UklOR19DTURfQ0NUTCByZWFkIGluZGV4IHNob3VsZCBiZSBVQyBvbiBpR1BVIHBhcnRzIGR1ZSB0
byBMMyBjYWNoaW5nIHN0cnVjdHVyZS4gSGF2aW5nIHRoaXMgYXMgV0IgYmxvY2tzIFVMTFMgZnJv
bSBiZWluZyBlbmFibGVkLiBDaGFuZ2UgdG8gVUMgdG8gdW5ibG9jayBVTExTIG9uIGlHUFUuDQoN
CkNjOiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5k
YW5AaW50ZWwuY29tPg0KQ2M6IE1pY2hhbCBNcm96ZWsgPG1pY2hhbC5tcm96ZWtAaW50ZWwuY29t
Pg0KQ2M6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KQ2M6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcNCkZpeGVzOiAzMjhlMDg5YmZiMzcgKCJkcm0veGU6IExldmVyYWdlIENvbXB1
dGVDUyByZWFkIEwzIGNhY2hpbmciKQ0KU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0
dGhldy5icm9zdEBpbnRlbC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5n
aW5lLmMgfCA3ICsrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCmluZGV4IGIxOTM2Njc0NDE0
OC4uY2MyNThiMmE3N2M5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vu
Z2luZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCkBAIC00MTcs
OSArNDE3LDE0IEBAIGh3X2VuZ2luZV9zZXR1cF9kZWZhdWx0X3N0YXRlKHN0cnVjdCB4ZV9od19l
bmdpbmUgKmh3ZSkNCiAJICogZW50cnkgaXMgcmVjb21tZW5kZWQgYnkgdGhlIHNwZWMgaW4gY2Vy
dGFpbiBjaXJjdW1zdGFuY2VzIG9uDQogCSAqIHNwZWNpZmljIHBsYXRmb3Jtcy4NCiAJICogQnNw
ZWM6IDcyMTYxDQorCSAqDQorCSAqIFhYWDogQWNjb3JkaW5nIHRvIGludGVybmFsIGNvbW11bmlj
YXRpb25zIGJzcGVjIGlzIHdyb25nIGFuZA0KKwkgKiBSSU5HX0NNRF9DQ1RMIHJlYWQgaW5kZXgg
c2hvdWxkIGJlIFVDIG9uIGlHUFUgcGFydHMgZHVlIHRvIEwzIGNhY2hpbmcNCisJICogc3RydWN0
dXJlLiBIYXZpbmcgdGhpcyBhcyBXQiBibG9ja3MgVUxMUyBmcm9tIGJlaW5nIGVuYWJsZWQuIEFk
ZA0KKwkgKiBic3BlYyBsaW5rIG9yIGRlbGV0ZSB0aGlzIGNvbW1lbnQgb25jZSBic3BlYyBpcyB1
cGRhdGVkLg0KIAkgKi8NCiAJY29uc3QgdTggbW9jc193cml0ZV9pZHggPSBndC0+bW9jcy51Y19p
bmRleDsNCi0JY29uc3QgdTggbW9jc19yZWFkX2lkeCA9IGh3ZS0+Y2xhc3MgPT0gWEVfRU5HSU5F
X0NMQVNTX0NPTVBVVEUgJiYNCisJY29uc3QgdTggbW9jc19yZWFkX2lkeCA9IGh3ZS0+Y2xhc3Mg
PT0gWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUgJiYgDQorSVNfREdGWCh4ZSkgJiYNCiAJCQkJIChH
UkFQSElDU19WRVIoeGUpID49IDIwIHx8IHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX1BWQykgPw0K
IAkJCQkgZ3QtPm1vY3Mud2JfaW5kZXggOiBndC0+bW9jcy51Y19pbmRleDsNCiAJdTMyIHJpbmdf
Y21kX2NjdGxfdmFsID0gUkVHX0ZJRUxEX1BSRVAoQ01EX0NDVExfV1JJVEVfT1ZFUlJJREVfTUFT
SywgbW9jc193cml0ZV9pZHgpIHwNCi0tDQoyLjM0LjENCg0KQWNrZWQtYnk6IE1pY2hhbCBNcm96
ZWsgPG1pY2hhbC5tcm96ZWtAaW50ZWwuY29tPg0K
