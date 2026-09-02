Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBCCC624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 13:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563110F1FE;
	Wed,  2 Sep 2026 13:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTAod3HJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D256010E4B7;
 Wed,  2 Sep 2026 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788357179; x=1819893179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k8ItmYF00bzmEHTpQmBC2xoXFKBIHKA8IJLrKMvWPI0=;
 b=iTAod3HJjURdvjQyIZNAMZtZjFBhhUsDTdjoy8TVpo7TeXfveQxdbncz
 DTumVqMjWOBWmsX+MNzCF4cwYiVtVKs+WTF+mO9kayzrA80Sdu7NUvEqc
 8TJXuvLXSwT71th7Z/lpNK2nvioFISwj7lRlvCpDufTBZHUuzjYZg836S
 VkbBmgNG74YII/dNkmTdAymwg08aR7BPrxoA6nksd18SFN/t8aWs7uSng
 6Q8kyfVCZq8vd7VL//cAqdinCTsxgtUEkB/gmH51KlAj9OljqzoWhPofU
 j2H0jjGG81FudQiaXsBIizLBpQR4vfO0KK8qJTtqqrs2yEM31gVrYNHFX w==;
X-CSE-ConnectionGUID: Qq3tN7XFQb+EArDYPhOyyg==
X-CSE-MsgGUID: qRi3Js+qTcagDWCGpLsMNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88939504"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88939504"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 06:52:58 -0700
X-CSE-ConnectionGUID: ATJ3Kw+BTbadpW1hJLns2A==
X-CSE-MsgGUID: 60PMUnoLQLO+gX3TQgFIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263250822"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 06:52:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 06:52:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 06:52:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 06:52:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMM88wROOSVoYz6trzP98s6iPbM96G4nA1FEJPHz87ol+iy8sXSNBhz1jPmx4wVQuy5oXUUCYhxoITJ2LZlmEcSyMF+9RVGld+eKyZAdmPDuA80lkIHJ3muBqujQZjGIG+kGKstaebcflxZ0jOzoi6lNWay6qQlttXm0ql+hJjMyXUNW67OjHLezCa+ELAmlMuN9/uNae5+04V2UHDsiZ6Oq2s3I1Zs9sibjIRmnLQ8R6gjDqTv0R6tCMjcUL2CZcUM1HdGK4KynkiI++1sqzyOOwNdrV/G/te/9552+id71bLwpRDj1vwD7k4gt8Ip45s1bx/81ezXbAq7UGi04Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8ItmYF00bzmEHTpQmBC2xoXFKBIHKA8IJLrKMvWPI0=;
 b=rZJU9faHCElriK5IqSk3VR7nzK3Acrzxgs+u5S4KU+yQFTybMkGepnRBGJExli9ZcZnjAw9E/svcGk8l+kyxjKdXkY1FO5TxIsWt17YRCtB4WyqPr2AjA3d1AdlSZcLnP7qE1zP2RkQcBMIn0k2jkO40sPVQWwt2lF3HIwFsnHkxPhq/euq+9RlFwulTZk+p7anbAE2hLCOL8Mou1/iyaMYYD5ru0N10GS6LPZUS2Ha1J9SAf23XgPahf3cgaTG9T4NyHHudjlBWX/gBMjsFiYB7Jwa3E1/CplMLC+y4U809RrgzmbuxBJb+9mUomRl4xv25ekOf16u9kTskwIXYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by IA1PR11MB6321.namprd11.prod.outlook.com
 (2603:10b6:208:38b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:52:53 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 13:52:52 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or timing
 changes
Thread-Topic: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or timing
 changes
Thread-Index: AQHdOsmB7hQiHlpsJkWTGyTYaT3l2ra7N0AAgAAWz3A=
Date: Wed, 2 Sep 2026 13:52:52 +0000
Message-ID: <DS4PPF69154114FC8D0D68E1C42CA304BC5EFB72@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-2-mika.kahola@intel.com> <apgWLiseQuBOrk70@intel.com>
In-Reply-To: <apgWLiseQuBOrk70@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: 1cb1ea95-7e3a-4be8-bb2d-08df08f97bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|23010399003|366016|56012099006|10067099003|5023799004|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: x+jpu+hjW/5eX7uwhx3IPtGb27LimNrwZA5WL6sZWfgpBBdNGmcfal9GeepCZ5c44OlDrEa0k12gjfWFgo9rs4P+QP2mtBbwKpMZYayKuXkHE/i399XIuiT1k5tBvXgW0lhbTu47UKsFIplX0N+Ror3auxbE/FVPXB/yKeAbOU+l0n2oQF7JaQI5wnU8wteUCeVgFV4Ivv/XU9sURXL+dt8v17WUeDg+6ir4CW5DLMyZB2pt7n8o/rZVWstl/aYyl85YIZSVB8L5M1+jfmu5LP56wJ0lMKOr1QbuhwFZuaBaMjcvtJANGKxRKojFh9xhVo+Rox1zR/dk+o6iCBJsqi307hoEp3awYjMZZ2x6tF0xnsTsft1fxY157i0giN0p2rDuWvlOi/9O3bM+eOCXi5tw3RBNHY3axlyn04ZADODt0awQOEflNzgHaQFBq2NPC5B4cvhCgcub6lFr7cfNVdLGTK0tG6n+c6ntYURBC0jg2K0INtsh+x8yP9nKCy7soh7D8YJI8/6i0t0pl+mB4rY2VkrTWkjLNmzAIkL37BnM2vUlyfRNHZbrEPLfiWttkUcVLwqD8/eFmKz9Py8F8FTj3iYQtTdxmpZAzuCeiX2KI3/D3SK56j8o1QU0bvX/9kDxZvnMoMEXs1zg/4TT4vTLujceatDRDmDOEydsilTyVeeWeRhJ3qF1Yl4xAIyCLwYhccuR5alhA8z2M/lt91YXigcfN1XpIGj+L6kmMr0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uml4S29SWktsU3BFcFJOVGtKU2cxMWg5TzZ1YjM5TWhzRklXSGtXaDFPcEhQ?=
 =?utf-8?B?amtLVzFCeFUyeERLR1c0c3p4LzJQWnRydTBUS1cvZVlCSUxFUytVbGFwYkhW?=
 =?utf-8?B?Y0FlNlpwbENaZ0l6Ty9nTWtaMzIvcGF4VkRzVnBieDYvY3ZvVEpISFF2cDBs?=
 =?utf-8?B?VTExZERKZWlYUjRLd0NnNG1aR0d3ZHJsK0hwZEdiV0xLM29jeHczdSt4Um9U?=
 =?utf-8?B?dEY5NjJHT1NVbEgyaFRicmwxMVc3NmR0ak1sY3FFR3F2SDd2cTNKWW5uYWFQ?=
 =?utf-8?B?VWtwbkc3M3VCUU5QS2EzOVFpWjd6UlFLYWVqcmVtclNseU5NVCtadjlYbm9G?=
 =?utf-8?B?YVpnWVRZMkphbmMxVStjV2VWaDdWeVVTeVM3bGhqNWpob2hjMG1EU2JSb1Jn?=
 =?utf-8?B?V21BSk1rVnBQaVZDZjdSSDVyN1Nlc0s1KzRCWC9XTmtQS0FKN3UwZEh6bDc1?=
 =?utf-8?B?UzZnOGpibDMxTDZSRXhzengzOVpaUGhwMDNDNHZoc2RaalpPVUdGSGovenA5?=
 =?utf-8?B?V0g1VzBxc2pzaTBxWG9YaDFyRTRPZlJtMVNNaEYvL0hld1dJN3RLUEw2RTNZ?=
 =?utf-8?B?MENHNWR5ZVZaQnBEOVh6S1A3WnZkREh2alcvc1BoYkJsUmc3WGtNRElGZE5Q?=
 =?utf-8?B?RFhkYzF1Zktxajl3UDF2elIvN2w5bjBQTFVjU0ZJTUUvd3gzcGtudzVrY0Jp?=
 =?utf-8?B?TFJWNUg3SWp5TUNRNzVaeUIwWmt5QUtuQlN1dXZSdXE4MjJTWncwRXFEck1m?=
 =?utf-8?B?UlhzUXJYNzI3eFR1SzJKaGJlVHFPWHlMUjRSS1RBTEJINXA3by9xNS83NExI?=
 =?utf-8?B?aDBNTE9IaHRDUGZXNXBIN29wZURzZlNjaHYrQkJoRXRUUnp2WHhnZmwzQ2VT?=
 =?utf-8?B?Z2hKZFBQMDB6ZUNISDI1L3YrRFRqNjJ3NW5UVVdlMWRKenJmOW1uK1k4Wm5j?=
 =?utf-8?B?SW94WWVDZzJqTnBUU044ZkJqVHM1aEJPNjRaTkRXVlYvNkNnTm5ST0FoT3Rk?=
 =?utf-8?B?Njlhc2diRGxpWWUyenBkaFF4Rkd6MWRXZVdSZ0ZmOVRjNFA5R0NUTERsRFhY?=
 =?utf-8?B?eXdISVFWdlhUeFpHTWhWVjFGSDJHZlgvdm1qM1BmUGxlU2dIUXIyRk50cFFs?=
 =?utf-8?B?VUluWnFTZXZFY25KWi9ocHlBWEtoa3ZkV2Jsc1J4aW1jOE42WmxscFBMTi9W?=
 =?utf-8?B?bnJjSXJSeU5KeGNPRkF3NnhWZmc3UjEzQXVJL2JzazNEQmk1VjBGRGlHai9u?=
 =?utf-8?B?MlVTZUxiSW0veEhMY1RaNmJMWEM5dVBUaDRWamh3R1VoSEdXcHlJM2lsZjdj?=
 =?utf-8?B?UmFsRWNkM0JiT2hoL3RCaytkWFl3UE52VGE2VGhHTzRWRkdPcm80QzVtM2Rw?=
 =?utf-8?B?ampaWWJ4WVd1Y0szSHBRSXFZZHdHSCtjN215UmJDcHp5ek05VVdWZjJNYyts?=
 =?utf-8?B?VURBcXZjNE9mMWxaUUtRV2lKbVdGK3pMSENkdXJTdWVDQ2hncHNQNC94N3Q4?=
 =?utf-8?B?d1ZKT1RKNlI4WTQ0NktvM0IzS21tbjJ6VDM4RVpkUGpScnFYbHVZM1VaaDNZ?=
 =?utf-8?B?WkJRTFFpamRnem9NTjd6RnJxckJkSFFPSHRRK3dTOSs2elRnVFlJMzVhK3Fk?=
 =?utf-8?B?N01ReStvMytsZmxDVHZIVFJad1gyOGZBZEhiTXE5Y1UrMVlCMnN3VVovRkt3?=
 =?utf-8?B?S0ZQNDZSSFQxWjcvQktWQytnbEtNVnN0R2JKaDlXZlRQSHUrVldTSGUwSjAx?=
 =?utf-8?B?em5FaEhLSkRxSUo0K2lucktlRUFDYnY5QW9jUnFHWmViTkVBN2JXa3dNVmJr?=
 =?utf-8?B?c3RpcHZ2eFI5OUlWMEJzdkx2UFVIVVdQclQ2TnhoL05MY3RtZlJURE5hK2hl?=
 =?utf-8?B?RUM1cVBrRWY0OTEwMW02amNYSTkvbjYwamIvMklhL1dZQlZRYVAwYlJTcWVm?=
 =?utf-8?B?cFJNZ1hRdkNEZXMwcVpBWjFBTUQ0dlNCVURoeFpTYUsreWRiRE92a2pneG5u?=
 =?utf-8?B?c3dBR0p6MlpzYkwxWnRjcTdDYVplSHN2SWN3MlhyYnpzanpWUzZXdnMyNjBV?=
 =?utf-8?B?ZkYzRmR3T1FSQUJxSk9HQ256aE5ZcTdyN0xDSUdFZE1QaGFybEovdXpvN3pH?=
 =?utf-8?B?Um5uT2F4NVh1MGhlTXRJZHVzaEFFaE5xOVVvSGxFaUNZWmlleGw2ZVpKbGYz?=
 =?utf-8?B?Y0QyWER3NGFtbTRsNEZQRjBxNmxSenNnMWEyYlp2ZHpmcEpKMW5HdjBhUlQ2?=
 =?utf-8?B?eWZtZEdtak1wLzdIS2FYbml6M1p1VnBibFBlejRyM3VoRHFRTEFtbUV4WGdR?=
 =?utf-8?B?M25PNW1ObFYwMlh6S3RLT0NKVWJEeDRBY2w4a1hzUENCSmR2L1I0TTVha3oz?=
 =?utf-8?Q?ju5djGb0fK1NDIxezgrrf2vn20SgjlsYFwF3p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4ClAf7rXdnVpXW67ebO1Tc/SxCDcop+CUv/M0pPgUiC8k6kv+fEnwlZ/tWUmWY/oppKQFusrRP6EGJv5BNTD5UApnz8PzI0NAq31+JQOsU1Y78jBYlHSsFfvCJtLBmD55M4TN8furqyiMt3b4VOvDizxMXroXZbsPGSMU9BkMS9jfsSp9qDPZli2Qdim4v0PWQKUBZm//zn6Nzfp0RLWFZ7881PEuXLWp3zOlkazfmD7vNPl3UtBRgJeRS+WN/YgduSlGY5duuMM7WAwGWRNUuM9SLQKWkKLU6K4apaO+Fm0kySfbEktxAAelgxgQojexmTDeO7ckiM1bOq9yxh7vg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb1ea95-7e3a-4be8-bb2d-08df08f97bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 13:52:52.6435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2auNkbW3tKz4GXp0RQQAbeQJJ+7D4xHTEnKH7w9mCo1wA4gGU9BSoNVoVJbA+ky4GvuozufsE3nQX5fn1Qj3fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDIgU2VwdGVt
YmVyIDIwMjYgMTUuMjcNCj4gVG86IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBkcm0vaTkxNS9k
aXNwbGF5OiBSZWplY3QgZmxpcHEgZm9yIHBpcGUgb3IgdGltaW5nIGNoYW5nZXMNCj4gDQo+IE9u
IFdlZCwgU2VwIDAyLCAyMDI2IGF0IDEwOjU0OjQ2QU0gKzAwMDAsIE1pa2EgS2Fob2xhIHdyb3Rl
Og0KPiA+IE91ciBmbGlwcSBlbGlnaWJpbGl0eSBjaGVjayBsZXQgcGlwZSwgTS9OIGFuZCBMUlIg
Y2hhbmdlcyB0aHJvdWdoLg0KPiA+IFJlamVjdCB0aG9zZSB0b28sIGFsb25nc2lkZSB0aGUgZXhp
c3RpbmcgYXN5bmMgZmxpcC9WUlIvUFNSL2NvbG9yLw0KPiA+IG1vZGVzZXQvZmFzdHNldCBleGNs
dXNpb25zLg0KPiA+DQo+ID4gdjI6DQo+ID4gLSBEcm9wIHRoZSBzaW5nbGUtcGxhbmUgcmVzdHJp
Y3Rpb24sIHBsYW5lIGNvdW50IGRvZXNuJ3QgbWF0dGVyIChWaWxsZSkNCj4gPiAtIERyb3AgdGhl
IHVwZGF0ZV93bV9wcmUvcG9zdCBjaGVjaywgZGVhZCBjb2RlIGZvciBmbGlwcS1jYXBhYmxlIGh3
IChWaWxsZSkNCj4gPiAtIERyb3AgdGhlIGFjdGl2ZS9lbmFibGVkIHBsYW5lcyBjaGVjayAoVmls
bGUpDQo+ID4NCj4gPiBBc3Npc3RlZC1ieTogQ29waWxvdDpjbGF1ZGUtc29ubmV0LTUNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDQz
ICsrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiBpbmRleCA1NTNjNjBkNDUyZGQuLmY0Yjc2YTk1NDdl
MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jDQo+ID4gQEAgLTczNjksNiArNzM2OSw0MSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9hdG9t
aWNfcHJlcGFyZV9wbGFuZV9jbGVhcl9jb2xvcnMoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAq
cw0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgaW50ZWxfZmxpcHFfY29t
bWl0X2lzX2VsaWdpYmxlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+ICsJ
CQkJCSAgIHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoc3RhdGUpOw0KPiA+ICsJY29u
c3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlID0NCj4gPiArCQlpbnRl
bF9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsNCj4gPiArDQo+ID4gKwlp
ZiAoIWludGVsX2ZsaXBxX3N1cHBvcnRlZChkaXNwbGF5KSkNCj4gPiArCQlyZXR1cm4gZmFsc2U7
DQo+ID4gKw0KPiA+ICsJaWYgKGludGVsX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0
ZSkgfHwNCj4gPiArCSAgICBpbnRlbF9jcnRjX25lZWRzX2Zhc3RzZXQobmV3X2NydGNfc3RhdGUp
IHx8DQo+ID4gKwkgICAgaW50ZWxfY3J0Y19uZWVkc19jb2xvcl91cGRhdGUobmV3X2NydGNfc3Rh
dGUpKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwlpZiAoIW5ld19jcnRjX3N0
YXRlLT51cGRhdGVfcGxhbmVzKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gDQo+IFdoeT8NCg0K
SSB0aG91Z2ggb2YgY2FzZSB3aXRoIGpvaW5lciB3aGVyZSB3ZSB3b3VsZCBoYXZlIG9uZSB1cGRh
dGVfcGxhbmVzIHRydWUgYW5kIHRoZSBvdGhlciBvbmUgdXBkYXRlX3BsYW5lcyBmYWxzZSBidXQg
SSBzZWFyY2hlZCBhIGJpdCBkZWVwZXIgYW5kIGl0IHNlZW1zIEkgd2FzIHdyb25nLiBObyBuZWVk
IHRvIGNoZWNrIHRoZSBwbGFuZXMgZWl0aGVyLg0KPiANCj4gPiArDQo+ID4gKwlpZiAobmV3X2Ny
dGNfc3RhdGUtPmRvX2FzeW5jX2ZsaXAgfHwNCj4gPiArCSAgICBuZXdfY3J0Y19zdGF0ZS0+dnJy
LmVuYWJsZSB8fA0KPiA+ICsJICAgIG5ld19jcnRjX3N0YXRlLT5oYXNfcHNyKQ0KPiA+ICsJCXJl
dHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogRmxpcHEgaXMgb25seSBzdWl0
YWJsZSBmb3Igc2ltcGxlIHF1ZXVlZCBwbGFuZSB1cGRhdGVzIHRoYXQgZG8NCj4gPiArCSAqIG5v
dCByZXF1aXJlIGFkZGl0aW9uYWwgcGlwZSBvciB0aW1pbmcgcHJvZ3JhbW1pbmcuDQo+ID4gKwkg
Ki8NCj4gPiArCWlmIChuZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX3BpcGUgfHwNCj4gPiArCSAgICBu
ZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX21fbiB8fA0KPiA+ICsJICAgIG5ld19jcnRjX3N0YXRlLT51
cGRhdGVfbHJyKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gDQo+IFRoYXQgaXMgYWxsIGNvdmVy
ZWQgYnkgaW50ZWxfY3J0Y19uZWVkc19mYXN0c2V0KCkuDQoNClllcywgU2FzaGlrbyBub3RpY2Vk
IHRoaXMgb25lIHRvbyBhbmQgSSBkcm9wcGVkIHRoZXNlIGNoZWNrcy4NCg0KVGhlcmUgaXMgbm8g
bmVlZCBmb3IgdGhlIHBhdGNoIGhlcmUsIHNvIEkgd2lsbCBkcm9wIHRoaXMuDQoNClRoYW5rcyBm
b3IgdGhlIHJldmlldyENCg0KLU1pa2EtDQoNCj4gDQo+ID4gKw0KPiA+ICsJcmV0dXJuIHRydWU7
DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIGludGVsX2F0b21pY19kc2JfcHJlcGFy
ZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPiAgCQkJCSAgICAgc3RydWN0
IGludGVsX2NydGMgKmNydGMpDQo+ID4gIHsNCj4gPiBAQCAtNzM4NCwxMyArNzQxOSw3IEBAIHN0
YXRpYyB2b2lkIGludGVsX2F0b21pY19kc2JfcHJlcGFyZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSwNCj4gPg0KPiA+ICAJLyogRklYTUUgZGVhbCB3aXRoIGV2ZXJ5dGhpbmcgKi8N
Cj4gPiAgCW5ld19jcnRjX3N0YXRlLT51c2VfZmxpcHEgPQ0KPiA+IC0JCWludGVsX2ZsaXBxX3N1
cHBvcnRlZChkaXNwbGF5KSAmJg0KPiA+IC0JCSFuZXdfY3J0Y19zdGF0ZS0+ZG9fYXN5bmNfZmxp
cCAmJg0KPiA+IC0JCSFuZXdfY3J0Y19zdGF0ZS0+dnJyLmVuYWJsZSAmJg0KPiA+IC0JCSFuZXdf
Y3J0Y19zdGF0ZS0+aGFzX3BzciAmJg0KPiA+IC0JCSFpbnRlbF9jcnRjX25lZWRzX21vZGVzZXQo
bmV3X2NydGNfc3RhdGUpICYmDQo+ID4gLQkJIWludGVsX2NydGNfbmVlZHNfZmFzdHNldChuZXdf
Y3J0Y19zdGF0ZSkgJiYNCj4gPiAtCQkhaW50ZWxfY3J0Y19uZWVkc19jb2xvcl91cGRhdGUobmV3
X2NydGNfc3RhdGUpOw0KPiA+ICsJCWludGVsX2ZsaXBxX2NvbW1pdF9pc19lbGlnaWJsZShzdGF0
ZSwgY3J0Yyk7DQo+ID4NCj4gPiAgCW5ld19jcnRjX3N0YXRlLT51c2VfZHNiID0NCj4gPiAgCQkh
bmV3X2NydGNfc3RhdGUtPnVzZV9mbGlwcSAmJg0KPiA+IC0tDQo+ID4gMi40My4wDQo+IA0KPiAt
LQ0KPiBWaWxsZSBTeXJqw6Rsw6QNCj4gSW50ZWwNCg==
