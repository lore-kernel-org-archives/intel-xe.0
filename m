Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5087CD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 13:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFCD10E31C;
	Tue,  9 Jun 2026 13:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4nWTa/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD9510E31C;
 Tue,  9 Jun 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781011301; x=1812547301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=put51Pb50P7yfJRtn9TiIT09YRSKvjzHOmFCh5nc0u8=;
 b=R4nWTa/cWxldTrC3pcbpqXHb/DBweDnSVcaouxojqCaahpD+pMsaxJY6
 okj5zn9+hcKcoGtQKlrU8RYm2/uemIk1gXnyWhYC1wO/PH2JKHgAhkerp
 DRUeHGuqAZq6Fb1ZjJsxXDN11yux3RDj6WsHbE9oudbt/DJdFtEFUO0FA
 rcBk5CvNXsgadiKySfwDtxHlNMFCBS9uF5GswI+/wXL0/ejBl3U+XiNhr
 t1kN+OmhpT5ax6vywPaqpFeUF5CtDNll7qF3qU5QCeEqjUZVklnDLfNHy
 E96BpyRk9Jalcvd2PvH4vt1j9ap1S/rviE3xrbGhsnXNordpfmUAwZ23p w==;
X-CSE-ConnectionGUID: SepL4dubQe+tWrQC2BGz+g==
X-CSE-MsgGUID: kxGk1+VqSTuh1bMQ348j7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92444979"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="92444979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 06:21:36 -0700
X-CSE-ConnectionGUID: K5jcCbhHT0i646re+5Gnpw==
X-CSE-MsgGUID: bcbaxaDbSEiK7wANvBVeag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="242908094"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 06:21:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 06:21:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 06:21:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 06:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXyEHxsOeMxK6jgACcly9AQPFkpMHka8EcdUU0G9o6mhwZg1OWpQZVbUXj/GIwqfBZh2w0mnJWeJw9ZVgOO8NKKq9y3iU2Hfd4LsIFGdRDFiXXjvtLtrZS/HD3tN+nYqsT6CgUh1xKs66aeI6gWpQ2blmatEJ8fabNXJsPrpCHASSm5nvPp3g2cBC+d6/6hE6PjjUKts2YlunpanmGRzJvYM1LWgqG43QVIgInzGitOHNFg52pPY/VoEVuQvAtRaM/i75+yf8FNWtxKGv/thb/o42b2PUMSic4Ch+53HAaJ3WOr1qZ6JH3fhi5g5Ce49n5Pzehrj6hgK2LF6VM4dTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=put51Pb50P7yfJRtn9TiIT09YRSKvjzHOmFCh5nc0u8=;
 b=C/oncdtq3GYhGgUggME53QLAcvZE0imdwWxAQk5McZPOW286ydLT4MtxWyAUkm7KwXxGcah/JyRKhDTkFxgKgqa13z4LdBrk9z2JrXm5m+y53EG40IRpef33h6a2UvABE5dZjqOGr1R/SOnnNarARg0l7d7MPjGxJhw7e04AfVoF3Y3CQvXkWaoWE76qwgx6tzEj0gwnmWxwc4LNH0/4dQ/bblCLmz+MJ1JhixRafGfv7oyJ/GIo15iZ7LaERacFpg5VPpw6C8tehZ10F73t+IWnBmreklWoGRk6mEv9bUBVGiPRmvn2/2xrLF0M10wmavAuQkAf4fheffmA/TCAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by IA0PR11MB7210.namprd11.prod.outlook.com
 (2603:10b6:208:440::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:21:32 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:21:30 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
Thread-Topic: [PATCH] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
Thread-Index: AQHc98pdLm4L5jbHkEie+ECWUUdF57Y2NO6A
Date: Tue, 9 Jun 2026 13:21:30 +0000
Message-ID: <DS4PPF69154114FF0BBC539A7D614A182F0EF1D2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260609044149.274249-1-jouni.hogander@intel.com>
In-Reply-To: <20260609044149.274249-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|IA0PR11MB7210:EE_
x-ms-office365-filtering-correlation-id: 7f07cf1a-8826-4e05-68fd-08dec62a0499
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|6133799003|22082099003|38070700021|3023799007|11063799006|56012099006;
x-microsoft-antispam-message-info: HEWYeEcMFpy4UQeZmDroZNAB6JOXJww4STMDTlKDhu/IvoLsGgoGPcAdKnShgPKiQVADxWsL/2JnPb8yaAyUukKVJGnIuQnxtcrhzbNI496GiL+7apzsOO9ZSMnpUomt5kAFqOL4/PSiYUfREizX0cHAwxziRTFi7rFhddoeNNfKlM0yJ2iNPueC2Ug/hu5ZrsbLjWRGZoQnOFjxOwtb10RTsk1p8rRMm+tBShp979lLwdVJAWFjdIehGGErWqbxB5ykkHLlih/ATjQSXQCVa+J/bUXz7ETcQApLo65PFbMAyLx+ohRPmapbUmrredxgQKcD7qSC1LlC53jAkoxKCUL8Yp7M6JHpGAJFFpVtOzAfi3vmiAuoCv+HDej6PfRRuS8gL89pA9EjyQpy3LLSsQGApA9EXUP+zbJ2wDshSLCqZq/QQQh9sZ9sX86M65VQADj8Guf02i5BPXHfxIVUKkVy4J+z8DPdoe1108NGxVclMX0XdZ7BWdi7VtJZUkspVPm8ug201gXUWk8Aurd5+43d1IpnQmdEFAeH9buG+we1zOXnZNciaK8iIIYw83gYcmMWhOQaSRSoMzmgHbJ2h/++hbWWh2c50Wj+QWWkPgeKCg7PxcjK+3hIrihtSBdYauvLhylRaFR84OxgFhfxLLfGB7jz+vgNBl/fl1Wi1APSGlBHn6Lx6Xkx0Mjp38UaaavHC1iqIJOkp+FaSduR20KYYqT+8MzCgO9wmEj4/OmO++mp91dK1sk0yP1RG5xU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(6133799003)(22082099003)(38070700021)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUNjUHJqSWxhRDdlbzRuY0Rhb1V4Yi9qMmtlcmFZMVFTUU53TVNhbC9MRlhT?=
 =?utf-8?B?SDM4aEVEZk5aV2c1SmI0NHFmYlE1N1lQaHp2VFcxM1RRbXJNekN5cmN1ZDBO?=
 =?utf-8?B?dVVvajVjdjBub21pRFh1dmdvYTRra3dwaXUzV3lXZGI1VjNZVUE3VEI4ZkpN?=
 =?utf-8?B?RUJYUlp5VnhqcElzelZXajV2d2RYY0NWNmQzUE03b2Q0OTdFS3craXJkN0pS?=
 =?utf-8?B?V0pIcXNvY2QzREpHUURRUGJJd0F4OC95SEtIcUlqNUFISTJ0M1JUdXUyMHhG?=
 =?utf-8?B?ZDZ2U3FlWHQ4d0g2azJzSVJ4eGptdVRzQWRDeFM4YVBjQUtUamJEYzBSOXNE?=
 =?utf-8?B?UzJFOXpUTEU0SHJkbCtlV1h0b1FwTVV1eTM5cmI3eDdRalcyTmFla1gxUEU3?=
 =?utf-8?B?Ly9uVy9pRGhvN3hIZ1cxL3hBVjR5MjdVZWw1OEVoTFlodnNneTdkcmNJay9E?=
 =?utf-8?B?L3VoRm15SFNzZXplMG1hZG9Dd0J0MWMvdTdxSUNwcXI1Ukd4SmpYWUJOTkgy?=
 =?utf-8?B?cis1QTVjK0JWYzUxNTA4ejE5QXhQRktHVlNNQlY2YzFKaXpycHUrTDR6THBm?=
 =?utf-8?B?Tk54VWVMT0RERjlRMDRSQVpRMllldDV2V1pieTVSSnVtWTNINGZYNy85SFNM?=
 =?utf-8?B?RDllRXdGWlhHVE5IMWcvbnJRWjJPamVqSEVFODBGM2JMeEx5a3pmTFgwUy8r?=
 =?utf-8?B?WVZWTGE1QnpLb245akFrUmhRZTlYWlIwVFhFZFNMTXY3aWUyN2x6NXgxaURt?=
 =?utf-8?B?UGh6eUtraUR2Q1RhWmpRWXE4QUpFUFB2a2JWMGtFdHowZ2NaSVQ0U1loS3Rm?=
 =?utf-8?B?R0hRZHRQK2s2cHprYklUUXlLTC82ZTBmclJhb0Rsdnhwc0J2OVR5VEFES1BE?=
 =?utf-8?B?cm1USTZ0ODNEZ0dYOVA0RUIvczNFd2FyZG5CL0s1a3pHT0Z4NDNJbXlablBH?=
 =?utf-8?B?dDJIWHV0blBQV1hwOC90NVZZUXMzaFQ1RlRtdjBFMEJkVW4yQWE5amxLUlQ4?=
 =?utf-8?B?S0ZpUnRBbXB3ejg4eEErS2RiNE5DY3BDTi8vblFHY0N1a2JOZzdTS2g1UUhy?=
 =?utf-8?B?bFE0cnJaeFBKME0va2tEN1FISHl1ditZQ3RJYjRWM2pqek5tRXZ5dmFUNWlo?=
 =?utf-8?B?aTRjbFdxMkh4dTlmRTh5RTkrTGJYZU5Qem5CbkVxeFU2MXVtU09WN1BJNU50?=
 =?utf-8?B?bUxzRDhHczVVZC9zZFF6Q1l4azdnbWRnTHRWUTYxQnpEWFlMYzMwSXlTZ1Fl?=
 =?utf-8?B?TFVJcWlHMEc2TXZwUll1NDUvMjU2ZnhGcEtVaGJ2TmNWVWFOMC9vaGcxaGVK?=
 =?utf-8?B?d1dQUkUwVHh3UFZxNFNJNzdjczg0R2FaeEFGaE81THVDdnNCd2Jrb2lYaDND?=
 =?utf-8?B?Ump0UFV3NitsM0haVUVRUWJ2MG1wWk0vM05ZYmR5ZXdNb1JoWE53R1hHdGRP?=
 =?utf-8?B?Sm84QUorcHhWc1NJTEdpM2NRY2c5c0drZ2gydlVwUk84M0x1b3VLK0RTYUJ3?=
 =?utf-8?B?Nm9sZkp3ZG5JTkRBVG4rRWFjYW93QXRCdUF0K1lmK3lNY2ZYMVU4S1JmV1FZ?=
 =?utf-8?B?cWJUc1RaMjJkMG1uMGFJeENPd1VyQnVXK01FMTBNa0NRUnh0WHIwVmxNY1FW?=
 =?utf-8?B?bFQrOWh1dCtsWnd0ZUpmZlZCSDV6Ylp2cW95bUZRYVNFV0U3NHFSa0s0Umpp?=
 =?utf-8?B?ZUF3c1cyQno3dHBaMEp3N0JHcG1Ha2RNTHRJdC93MDV5Vk9Ob2RIZ05Od3hB?=
 =?utf-8?B?Zi9KdWR4UVBrMFgwOWZGT3B6WHVBNU5kNktKYjI2Ni93WnFDa2N3SVRlcHBP?=
 =?utf-8?B?WUZZNmlraXZocWF1NEIrVkE3cmdpRHp4Qm1HdkRhcy9tZGFsZjlubGI3RlJW?=
 =?utf-8?B?eWFBRTZESGpnRHdoS2U5alJFKy9JZS9VdDd3b3RMT0xRdFdVK2M4OXJlMFcz?=
 =?utf-8?B?WkVXQTBLVUhsZGZZeld0eEI5bE9XdnlRQmYvR2ErNXZqNUZ0STc2aEJsbGNn?=
 =?utf-8?B?a1BnV2hCcUpsWFZIV1JaN0dmUTdOc09lKzR4TDgvM3dNejQwSlcvNFZNWmcv?=
 =?utf-8?B?eVk1d2ZmTmV5VUZYbldsVHpoMmQwLzM5YjdRV29ISFZJMVNseTh3d3hMYVJq?=
 =?utf-8?B?MWhqYmFsUm5rVWdFU01qbU5OYjVYQk9EY1BQeUx4WnN4NWc3MEdnZ2hqV05r?=
 =?utf-8?B?Q0YwdVpvVGdKaFNKR0hNdFhEQ2poVElYak5ETG5oNGdDckkyeTh4ZTZUM2Jx?=
 =?utf-8?B?QjU2M3JFS2Z0d1RwdTVuQjZWeklDN3dwM0o3elNENmNVQWhwNzJnZHJXdVRn?=
 =?utf-8?Q?jefry5oJ2yx+YdHsii?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EJErbhqtk8zKTz/APiwdHEKkiqFL5EJT+Ccl0bRZ8mBLcAOPgBQrl8GCviUoxSybOABktQYATO4zLGnDJNwkTXCrkxv4qWnbdhV8gRng0tihqYeqQPVMDkyR4otgSlMxfgdXX9NeSsQLPfBiOAeINyICIlun6D2bvoHI29vhAtt17FcMeHJsKM/iVR7335Od5AkhoacpfKDP0QtnXggo8k2QxwsjZz7HBm7kwEqgLMm7FHrzjGOtxbAsym426C4IBR/kYGvz2QEuAn9VrTyYMD4Bo4CHdx2KbQNOsVCN2h6nEpUNxlEfNQeDIe/aWZO1b9iDDeRu9IHlqKkAu/Lf8g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f07cf1a-8826-4e05-68fd-08dec62a0499
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 13:21:30.1254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DEwwfKP5TJmflg65m1UYvU56jNexIPqEcWL8G+gj64+RfuXFed9CiMaJCn6T65NYCt74/yyhV6HiDR86Tb3tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pIEjDtmdh
bmRlcg0KPiBTZW50OiBUdWVzZGF5LCA5IEp1bmUgMjAyNiA3LjQyDQo+IFRvOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0hdIGRybS9pOTE1L3BzcjogRm9yY2UgZmFzdHNldCBvbiBkZWJ1Z2ZzIHdyaXRlIGZv
ciBlYWNoIGNvbm5lY3RvciBzdXBwb3J0aW5nIFBTUg0KPiANCj4gQ3VycmVudGx5IGludGVsX3Bz
cl9mYXN0X3NldF9mb3JjZSBpcyBmb3JjaW5nIGZhc3RzZXQgb25seSBmb3IgZURQDQo+IGNvbm5l
Y3RvcnMuIFBhbmVsIFJlcGxheSBpcyBzdXBwb3J0ZWQgb24gRFAgYXMgd2VsbCBhbmQgd3JpdGlu
Zw0KPiBpOTE1X2VkcF9wc3JfZGVidWcgaXMgc2V0dGluZyBkZWJ1ZyBwYXJhbWV0ZXJzIGZvciBl
YWNoIERQIHRyYW5zY29kZXINCj4gKHN0cnVjdCBpbnRlbF9kcDpwc3I6ZGVidWcpLiBGb3JjZSBm
YXN0c2V0IGZvciBlYWNoIGNvbm5lY3RvciBzdXBwb3J0aW5nDQo+IFBTUi4NCg0KTml0OiBUaGUg
bGFzdCBzZW50ZW5jZSBtZW50aW9ucyBvbmx5IFBTUiwgYnV0IHRoZSBjb2RlIGNoZWNrcyBib3Ro
IFBTUiBhbmQgUGFuZWwgUmVwbGF5IGNhcGFiaWxpdGllcy4gTWF5YmUgbWVudGlvbiBQYW5lbCBS
ZXBsYXkgdGhlcmUgYXMgd2VsbC4NCg0KT3RoZXJ3aXNlLA0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fo
b2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5p
IEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCBlMTM4OTgyZGM5MWY2Li43ODc5NWJk
M2NlYmE0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMN
Cj4gQEAgLTM0NDYsMTAgKzM0NDYsMTIgQEAgc3RhdGljIGludCBpbnRlbF9wc3JfZmFzdHNldF9m
b3JjZShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSkNCj4gIHJldHJ5Og0KPiAgCWRybV9j
b25uZWN0b3JfbGlzdF9pdGVyX2JlZ2luKGRpc3BsYXktPmRybSwgJmNvbm5faXRlcik7DQo+ICAJ
ZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGNvbm4sICZjb25uX2l0ZXIpIHsNCj4gKwkJc3Ry
dWN0IGludGVsX2Nvbm5lY3RvciAqaW50ZWxfY29ubmVjdG9yID0gdG9faW50ZWxfY29ubmVjdG9y
KGNvbm4pOw0KPiAgCQlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZTsNCj4g
IAkJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOw0KPiANCj4gLQkJaWYgKGNvbm4t
PmNvbm5lY3Rvcl90eXBlICE9IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApDQo+ICsJCWlmICghaW50
ZWxfY29ubmVjdG9yLT5kcC5wc3JfY2Fwcy5zdXBwb3J0ICYmDQo+ICsJCSAgICAhaW50ZWxfY29u
bmVjdG9yLT5kcC5wYW5lbF9yZXBsYXlfY2Fwcy5zdXBwb3J0KQ0KPiAgCQkJY29udGludWU7DQo+
IA0KPiAgCQljb25uX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY29ubmVjdG9yX3N0YXRlKHN0YXRl
LCBjb25uKTsNCj4gLS0NCj4gMi40My4wDQoNCg==
