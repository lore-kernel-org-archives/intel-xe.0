Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CC11077603
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 18:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB2010E083;
	Wed, 18 Mar 2026 18:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9uzIyZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AC110E083
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773859939; x=1805395939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BsYf6WwXr8YCTUhu5cKGe4GTBcNIg6tRo2/ai8fVQvg=;
 b=O9uzIyZUWX7jICbZfXRol1ZZZsOHIbI3p6IOFoLhp9oYj2Fz+8lWLQ8T
 7nsRqvg2U/zEKryxfnYth9NxWs28WWiiiZiCZT+L6Om/PUnJHhxE+oMzi
 SgBNZvnUlL0aWc+rUGoFudo5y+h8d0d1HW91I+v2l6UMQol5pelpzo5P0
 aw6IB01UlGSk9UPdv4q4NAi7TjhtyYJHjCDdQfBPpUa+NOO1NYmfj7saB
 YYOR+pb8nXy860V9rfGwhm0iTcoXTQDJ4+JRmwd67fF73a32WR1nGKRJT
 Tj/GJm8mXpx3x2dq7PNwowjh1qtSGbqxU7+CNxLv7/n0YQwm28aKIsrnZ g==;
X-CSE-ConnectionGUID: Yb46gRjuSQat8QbTRWS2yQ==
X-CSE-MsgGUID: v+SKNK/uQnyKnHxdBw0pKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74813867"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74813867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:52:18 -0700
X-CSE-ConnectionGUID: B6QNq5YnTNewfWS8sk5Lcw==
X-CSE-MsgGUID: ZmA4/IGwQz6119+/8xLzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="220139133"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:52:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:52:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 11:52:17 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lrwb9qOXbHFgA6Elqdh5k9nkqSaG+dRG0rKTNeHPbg0S3eHXWK7dvxhq+WF8YVldKpybV2WE1ykT9rxzQUvs8hHnU5Ll7r//VJWxA4oX7jkMb+1FF/VljIxhWtRZNU+cUflpH75fKfJ6vrkcXcq79TF5Rr0fVJEQDCXGiep+Nc4PqQp3L6HnZeprkc2PncYy4U+vvGtTFyC7Tij4d05tYhDp9xb4jz3Qg7jlyTJTCKZXCFwOiYKC7PeR6sUeCzdp0AO8HeKGhMQbhGjwXe3JkIXiGhuBJ3NGDY2qOiEX0Y2HT6F7YrKkwYCCGmpDTD8LpsPtPesTb42SAlj++5nI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsYf6WwXr8YCTUhu5cKGe4GTBcNIg6tRo2/ai8fVQvg=;
 b=Yk3VHk8dm7OJxuFVmRSYtTeoRcB5qmIAP9edn1STQyVv875JyphWRbcztiVZOIddvjBLWHmaLLC5KN0WDIHI4JxML94+93iQQmry+qodAtz6SRAY8eljateSqRLhE1DFfMjUg5H4D2sttLVW1cexGB8BFKtNwIdgulmHS33Iqv2FwnFfGW7krICnHy+42wF26vvpNSvf3chCI5EnFEUOI0VlwT2eCCs2cMS+A7r3ltolBZMpwboc7Z1PBKL5jAbB9Sc1IxIhSya4Ae0muxIWiFBvWVGzsBZZr2cdxzep2mnUg/juYFIoTnwNOm8pppoc4kHIPAkh7pwvNbKg9z0vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 18:52:12 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 18:52:12 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v22 08/12] drm/xe/display: Move remapped plane loop out of
 __xe_pin_fb_vma_dpt
Thread-Topic: [PATCH v22 08/12] drm/xe/display: Move remapped plane loop out
 of __xe_pin_fb_vma_dpt
Thread-Index: AQHctVm+rabovuj53ka3rmy+ct9+lLW0pO8g
Date: Wed, 18 Mar 2026 18:52:11 +0000
Message-ID: <DM4PR11MB63602FD54528206798DC97C2F44EA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
 <20260316152929.1247-9-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260316152929.1247-9-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA0PR11MB7282:EE_
x-ms-office365-filtering-correlation-id: 85a1ae8d-eaa7-4e36-6e69-08de851f7704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: Zyr+jF0Q+VPiUvDWCZvKQ3x14xH3ED/K758WDsvdceFlR1Kw8OpOdcSzvQ8qPrkoMWjCLtvZMjpOVtswNcVhmwZgecxcoyF8/Gf6FQ5IunxxVMR0yQxgdexM32o2FkBkGRLVm9jtNGyC1jLrNZ6KQh3fjCr6JyvAs9o0bhVjKbt91moMS9Xos1Me7lvYhPjC2DtjsvL2zPs62GUqbBOAFhu7vtO0ngLYTKE8LMFfa8SpuVoObQfiFC6H/4z6BXoMFlksZ+oUq1v4SvLjVuv5NVHZ2jjOVP5keGBh402LTgmhDDIuq6kQJpEVJPlXTWCWZek69FckD9K0L4owzyB2JM9FziMvpdrGmHLeXXsiRvL5/uhYuDtL+oh+yfhQrt1ygg0VYWcR74sRKq8pRfgbXFv7z3y0UwmqjpwksfZsiADdraZrcQUTa4Vywua8K1Wfbsks/lqzOfBmDfBrhmQ7c8MAyQ67FTnJ08HIKSZwWTWfp14w8xs6NfNOIT9XSqZU5KQgR9p4VSepeNJJWf968h+zkjn1G40KNrOxsizdu4I1qgbaZXFvB7UdKMn6QTHdpVjz5/obmXCp75sr2BiGORV1xCr8KM3esB3A78OjyP3ijbtvDTRHQkDHE5OjZqE92b/q1WskM6vYByviRG+LfClXElsPYIiuCt31GzoibbvGYPryqMUm2Pa783zU5eDOl5bbUEQzFzfrgvaEQDu/fBmcN98Xn2MU3P6hFXroJ/QEL6EE7CF2/QfDb7EQu3aIBmpyk1P1zsSs/ztcNNy324Rgibah7Kn44Ecz5+ggGho=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRPZUpnT2E2N1pNeXZ0cnFOdjgxWXRiZTBXc1ZudVJwS1Y1YmpwSW1zNGpz?=
 =?utf-8?B?aEl2MFhyTU8yeG9VMS9oV05DaGtSM1A5QVo4UE9KZzV1bEs3T29oSkthdk5Y?=
 =?utf-8?B?WXlTdk1nVS9zNE9PSHczQnpxRGE0MVVlUjVvZ1EwcFpHV3hIcXFhaFplZ3pJ?=
 =?utf-8?B?YXI1WVJVMERlU2oyM1Q4dmFkL3VYQjdaNVNtMVdTSnI5ZkhXQTQ1a3NMQ29C?=
 =?utf-8?B?ck1XcGJFMGNRd1VXRTE5Q3MyR2pqVEVZQWx1Rko5QVNUUE1jRXQ4V1p6YmNC?=
 =?utf-8?B?em1qcXdZL2NXcjIvTUZjMEpRYlNGbk1TMjhDdU83NFBjL2w5MjQyUlMrWGxj?=
 =?utf-8?B?SVBFaTU2cmZjdFBNbkRwbTRDRlJtZGU0YTl5MG1zcC8vSVNQaEh6Yy9wNU41?=
 =?utf-8?B?WXZuL0o3dFlGMzExdGcrSXdqaHRFTFphNlNBRnhmZHdiSHF0UFEzbms3Tkk0?=
 =?utf-8?B?NXVob21UYzJhTjU2bE51L1N1WXkzOXBLbndEaVB5bnE1d1N3RE0yb3R3UkJS?=
 =?utf-8?B?bUxpVXFGeTZ6VzI5Y01oZXd4TWxrR3U5WXBRNng1TjdMeC9vU1k5Q2lKRi8x?=
 =?utf-8?B?cnVoblVoMHJISnV5d2ltME9CNVZqVXBZRmx1S1l1UXpxaFluQmpYOFlQdy9o?=
 =?utf-8?B?Sy80OFhBZWphNHlCL2dhTElvMm1saFZ5dndRTURUOW9ITVhYRDY4enZpdkMr?=
 =?utf-8?B?M0lSYitJb0h2b29vVVZ5VUxJaVovbTA2cThZaFloTHdOTlV5WFpkWGFYeS9U?=
 =?utf-8?B?aUtleGN1K2Q2VU5NOUk1RzdvMTJKS0YvN2hXRE1XcnlPUDI2d3ljWkJObHFB?=
 =?utf-8?B?dzdWT2U4NjlCMExmczJSN1Fsbkg4RC9tRnFRa3R3aTdocVVmTEFTWDdvTjFh?=
 =?utf-8?B?T3JLQUE1eHNaSVdjQ1N4OEdiZlZIL3E1aUN2RytjUlVDRnJ0ZzQzN3MvN01F?=
 =?utf-8?B?b1pNdXdhWnQ4dUZUZkRhQlpjaUwxK0FrNVhEUHNYQmYyQ0gvcjV0WmUzNTRT?=
 =?utf-8?B?cXRpQjZCOUZMSDhjeXQ5Y1B0bjVxMUxzQXlkOVJITUZGVXFPd3JRclpyV0R4?=
 =?utf-8?B?bk9ZQlJpcHBRZS81WDI0UWI1US91OE8vanFKV1ZMNE5aUEJ2alNTQ2pEVDBl?=
 =?utf-8?B?bUx3UlhCMUFiY0JIdk1TNEd0UVV5YlhSeUU1WHJNa3RKK1VQYTRrV21xK1NE?=
 =?utf-8?B?bmp1Mm9aL0Vud1lvMEhYQ29oRHVwQ01PTmZTWklSQzNNWWZ4QS9TMVFSN2I3?=
 =?utf-8?B?cWRmc0xiRUEwRmJaVm8ybnc3eEFyQ201QjcySTZ6VU12UWdQTXh0aTAyRmNu?=
 =?utf-8?B?cU5CTEMvanVNRm9uSTFwdW9NdEI3QjA2cnovUXVlSW4rUy9WT2R2MTlJWll4?=
 =?utf-8?B?S1hjNGV5SFZTWkZTUEFjY0JQSWJ4WHNQQ08zZ0lzWHhMQThHVm5QRFdwZzlR?=
 =?utf-8?B?WXF6MUs0ZTRYcUtkb3Bzc1M3bGxEbURTR1lQMGNTNXE5ZkVKaTliNmhjVDRO?=
 =?utf-8?B?Q3VQL25JRUN4WmJuQ3VLUVBVOS9xaXZIczUxM3JJN1l6endHSXBJRjdtTGJ4?=
 =?utf-8?B?K202MTlUdzYrV2tFSEt3dE5zdk8weDBGUFkrQ1pKWUNzWVRxMDcxSmo1TS8z?=
 =?utf-8?B?dS9rbS9JWUUyaVFLbjBEL1BNU0Q0VjNvU3RVWFJYdTlzVW9QSTlzdlFyb0tF?=
 =?utf-8?B?bURQZFpSdTcrK1BtWUk5NkdPZ2RMVHJsY3VjSlRPRExBa3UrejhLRFZEUXFK?=
 =?utf-8?B?RjVWcnY5aGZMTmpERGgzSVZOeFVOOWtrS0kwYXQyRWsxR2FhYmdENTJ2YlFl?=
 =?utf-8?B?Q28rUktnWFB2YUs0dHJ3a2hpV1BNdDY0bkE2MVBBRm45SUljeHVRa0xCTHlB?=
 =?utf-8?B?Y2F3UW5FOVZ6WE9uczdCbzM0NWptakVOWUtlanU2eWpSS1E3Nlp5Z0J5YW4w?=
 =?utf-8?B?dk02U2F4MTQ0bGt2RGxNZzI3L05sejNYWERRY0h4QUpPY3RSMHhSZVNSM3I1?=
 =?utf-8?B?R3BZYzIrOXp5WFRSSTZOM1BtT1J6c2tHcDVlMVd3L29IclRDbHZDTXF1RTJp?=
 =?utf-8?B?WFZpNEdPQWZxb29TU005ekQxUDhVUmprMWNxUXVHeEE0YUZCOUVoRWVCM3lV?=
 =?utf-8?B?VSt0d2JGOTg5MGJOS09IbFZtQWtQNkJhSHNzT20vcE44Z0pXZGtITHA4aDBC?=
 =?utf-8?B?S0ZnN2pKVUZqZlRZelB1MDUxdlltWGFzTS93VHJwZzlUOFZVSTZQYjVsWGFi?=
 =?utf-8?B?MUEwTEF0cmc1a2ttTzRKY3Blb0MzRU9haG9BN1ErbnNHR0htNUlEYUI4citZ?=
 =?utf-8?B?UzNGNDFnWWdhdTc4WGtVZmVnNFN3L3pDTW1NZ3laWnRvZTRoWFJqUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QehA96cErzWl82qWYvY7HsKY3lCKfQFxuvXIsOY912t5Q1l7mJRQEUzfdJoUVrRk+wSEA7z/zWp4D0k8GbEXOUjgbPOKldr3hPtDoMVjNfyAYkIOaQR80rDmKh4950KVE2TL0FZyZvovrsNd2YNf2cAuMspIp13voGPsTq+xm2LdM3JBpwhO7FFG+X01/hAwHaozPj2bETsu5rPo+EtUZtivxuAPJ3ETZeoSQTTZqefADWJCWsfJwTH1YHNF0F6DBsxOXJjfMuw31hqMcVRchHAG/+7YP629emfT0vjFpSLCmZt+8jBWr9byxI9RYid5XQWWJXzgjNSJ/o4zRC6sTw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a1ae8d-eaa7-4e36-6e69-08de851f7704
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 18:52:11.9464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYv1EWAf18/ChbP0V1qx4XUssYOuQiqmkuiDjcred46wZmlmTKOX8/9G8aVmDihIaHaCehhjRcqYXga4R0HWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTYsIDIw
MjYgODo1OSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBr
ZXJuZWwtZGV2QGlnYWxpYS5jb207IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PjsgVHZydGtvDQo+IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+OyBKdWhhLVBl
a2thIEhlaWtraWxhDQo+IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPjsgUnVobCwgTWlj
aGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+Ow0KPiBWaXZpLCBSb2RyaWdvIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPjsgVGhvbWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ry
b21AbGludXguaW50ZWwuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyMiAwOC8xMl0gZHJtL3hl
L2Rpc3BsYXk6IE1vdmUgcmVtYXBwZWQgcGxhbmUgbG9vcCBvdXQgb2YNCj4gX194ZV9waW5fZmJf
dm1hX2RwdA0KPiANCj4gSW4gcHJlcGFyYXRpb24gZm9yIGFkZGluZyBzdXBwb3J0IGZvciB0aGUg
YXV4Y2NzIHBsYW5lIGxldHMgbW92ZSB0aGUgcGxhbmUgaXRlcmF0aW9uDQo+IGxvb3AgdG8gaXRz
IG93biBmdW5jdGlvbi4NCg0KQ2hhbmdlIExvb2tzIEdvb2QgdG8gbWUuDQpSZXZpZXdlZC1ieTog
VW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gQ2M6IEp1aGEtUGVr
a2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IENjOiBNaWNoYWVs
IEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkveGVfZmJfcGluLmMgfCAzNCArKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gaW5kZXggZGY3ZDMw
NWM2ZmNkLi4zMzFmM2MxZGE0NDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9k
aXNwbGF5L3hlX2ZiX3Bpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hl
X2ZiX3Bpbi5jDQo+IEBAIC01MCw5ICs1MCw5IEBAIHdyaXRlX2RwdF9yb3RhdGVkKHN0cnVjdCB4
ZV9ibyAqYm8sIHN0cnVjdCBpb3N5c19tYXAgKm1hcCwNCj4gdTMyICpkcHRfb2ZzLCB1MzIgYm9f
ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQNCj4gLXdyaXRlX2RwdF9yZW1hcHBlZChzdHJ1Y3QgeGVf
Ym8gKmJvLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAsIHUzMiAqZHB0X29mcywNCj4gLQkJICAgdTMy
IGJvX29mcywgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgc3JjX3N0cmlkZSwNCj4gLQkJICAg
dTMyIGRzdF9zdHJpZGUpDQo+ICt3cml0ZV9kcHRfcmVtYXBwZWRfdGlsZWQoc3RydWN0IHhlX2Jv
ICpibywgc3RydWN0IGlvc3lzX21hcCAqbWFwLCB1MzINCj4gKmRwdF9vZnMsDQo+ICsJCQkgdTMy
IGJvX29mcywgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgc3JjX3N0cmlkZSwNCj4gKwkJCSB1
MzIgZHN0X3N0cmlkZSkNCj4gIHsNCj4gIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHhlX2JvX2Rl
dmljZShibyk7DQo+ICAJc3RydWN0IHhlX2dndHQgKmdndHQgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3Rf
dGlsZSh4ZSktPm1lbS5nZ3R0Ow0KPiBAQCAtNzgsNiArNzgsMjIgQEAgd3JpdGVfZHB0X3JlbWFw
cGVkKHN0cnVjdCB4ZV9ibyAqYm8sIHN0cnVjdCBpb3N5c19tYXANCj4gKm1hcCwgdTMyICpkcHRf
b2ZzLA0KPiAgCSpkcHRfb2ZzID0gQUxJR04oKmRwdF9vZnMsIDQwOTYpOw0KPiAgfQ0KPiANCj4g
K3N0YXRpYyB2b2lkDQo+ICt3cml0ZV9kcHRfcmVtYXBwZWQoc3RydWN0IHhlX2JvICpibywNCj4g
KwkJICAgY29uc3Qgc3RydWN0IGludGVsX3JlbWFwcGVkX2luZm8gKnJlbWFwX2luZm8sDQo+ICsJ
CSAgIHN0cnVjdCBpb3N5c19tYXAgKm1hcCkNCj4gK3sNCj4gKwl1MzIgaSwgZHB0X29mcyA9IDA7
DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZW1hcF9pbmZvLT5wbGFuZSk7
IGkrKykNCj4gKwkJd3JpdGVfZHB0X3JlbWFwcGVkX3RpbGVkKGJvLCBtYXAsICZkcHRfb2ZzLA0K
PiArCQkJCSAgIHJlbWFwX2luZm8tPnBsYW5lW2ldLm9mZnNldCwNCj4gKwkJCQkgICByZW1hcF9p
bmZvLT5wbGFuZVtpXS53aWR0aCwNCj4gKwkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtpXS5oZWln
aHQsDQo+ICsJCQkJICAgcmVtYXBfaW5mby0+cGxhbmVbaV0uc3JjX3N0cmlkZSwNCj4gKwkJCQkg
ICByZW1hcF9pbmZvLT5wbGFuZVtpXS5kc3Rfc3RyaWRlKTsgfQ0KPiArDQo+ICBzdGF0aWMgaW50
IF9feGVfcGluX2ZiX3ZtYV9kcHQoY29uc3Qgc3RydWN0IGludGVsX2ZyYW1lYnVmZmVyICpmYiwN
Cj4gIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgaTkxNV9ndHRfdmlldyAqdmlldywNCj4gIAkJCSAg
ICAgICBzdHJ1Y3QgaTkxNV92bWEgKnZtYSwNCj4gQEAgLTEzOCwxNyArMTU0LDcgQEAgc3RhdGlj
IGludCBfX3hlX3Bpbl9mYl92bWFfZHB0KGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9mcmFtZWJ1ZmZl
ciAqZmIsDQo+ICAJCQlpb3N5c19tYXBfd3IoJmRwdC0+dm1hcCwgeCAqIDgsIHU2NCwgcHRlIHwg
YWRkcik7DQo+ICAJCX0NCj4gIAl9IGVsc2UgaWYgKHZpZXctPnR5cGUgPT0gSTkxNV9HVFRfVklF
V19SRU1BUFBFRCkgew0KPiAtCQljb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfaW5mbyAqcmVt
YXBfaW5mbyA9ICZ2aWV3LQ0KPiA+cmVtYXBwZWQ7DQo+IC0JCXUzMiBpLCBkcHRfb2ZzID0gMDsN
Cj4gLQ0KPiAtCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZW1hcF9pbmZvLT5wbGFuZSk7
IGkrKykNCj4gLQkJCXdyaXRlX2RwdF9yZW1hcHBlZChibywgJmRwdC0+dm1hcCwgJmRwdF9vZnMs
DQo+IC0JCQkJCSAgIHJlbWFwX2luZm8tPnBsYW5lW2ldLm9mZnNldCwNCj4gLQkJCQkJICAgcmVt
YXBfaW5mby0+cGxhbmVbaV0ud2lkdGgsDQo+IC0JCQkJCSAgIHJlbWFwX2luZm8tPnBsYW5lW2ld
LmhlaWdodCwNCj4gLQkJCQkJICAgcmVtYXBfaW5mby0+cGxhbmVbaV0uc3JjX3N0cmlkZSwNCj4g
LQkJCQkJICAgcmVtYXBfaW5mby0+cGxhbmVbaV0uZHN0X3N0cmlkZSk7DQo+IC0NCj4gKwkJd3Jp
dGVfZHB0X3JlbWFwcGVkKGJvLCAmdmlldy0+cmVtYXBwZWQsICZkcHQtPnZtYXApOw0KPiAgCX0g
ZWxzZSB7DQo+ICAJCWNvbnN0IHN0cnVjdCBpbnRlbF9yb3RhdGlvbl9pbmZvICpyb3RfaW5mbyA9
ICZ2aWV3LT5yb3RhdGVkOw0KPiAgCQl1MzIgaSwgZHB0X29mcyA9IDA7DQo+IC0tDQo+IDIuNTIu
MA0KDQo=
