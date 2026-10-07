Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBEDCA6004
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 05:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3421610E190;
	Wed,  7 Oct 2026 05:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMEkP9Mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD010E171;
 Wed,  7 Oct 2026 05:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791352618; x=1822888618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fuD7r8qZzuIpjyOuMh7a/sKJZaQSJy+GRceubw5z5I8=;
 b=TMEkP9MkCS5gix0ol4tbMHpCnQ1GI4ZCzw/tTLiTpqIxt3328KNShYQS
 kGyfGMtf3P3waaUuOOAzB0tJC3yNpLcdI5XL0c+qRSr2iCQ1BiKhTkhvj
 zjWFOKpkindNc5QTJ/MkwQWkYAkTcsaA790dqevj8hyQxq87ni2gIU8uO
 yxRLp8SyCULFgV0xQfJ7gUuMISA/KIsTI1qdq3HKvaU+7gKh3Dx4e4VVH
 DbaYX9kqqSpBp9nsV1B3nO1qui7rIXTItvaKHaRHXthxKTElxMvDIJ+cr
 SOz+M3aujybgzovfHYoMrCoMRir8QjMrT5I3lsbAbhsCSwXuHgNIHlyjv Q==;
X-CSE-ConnectionGUID: D6zrhVocQR6t4jEjgvaaWA==
X-CSE-MsgGUID: nFh8hXXLSDGiZn7cwVZ9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="108433211"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="108433211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:56:57 -0700
X-CSE-ConnectionGUID: B380snqJRbiCpOP2tCV/2w==
X-CSE-MsgGUID: zPaEdI14RnK6NAUgjtixXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="281097847"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:56:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 22:56:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 22:56:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 22:56:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bk75Do0sWt2eCI0c8/iawA8r4wmFjAXrgO3De+cjHSG5l0UWAA4OMwa8A2bvS0i0NiLgjYh9tpORq+jpiZszBNVt36u3ZrbGBwtG+/LgaeNVVdQU0PiHqjt4jXxxsoFxBOuruPFgmF120IPBH+cYdZQRCZ5bFZ24Z3BELzd+KVuBe2VYL7Rq7moF0rsQuxMKB6VM+fCMUFt8bfohCpksPzLpz67Hv214s303UIP4xb32mea0KoVeNfTbt/dbVluIwZfS08WxwkfQ4xPqnpNzGvuX3xMRHkt5taKIWVMfofBvqIEGR3eeMpPCwWTrjutsLNiDC0ASPYRLLlPjBVp4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuD7r8qZzuIpjyOuMh7a/sKJZaQSJy+GRceubw5z5I8=;
 b=OjWiIZSyNv43bOq8ythmCo2DA7Y8LQfqNBdvnDdlmtn8rXaPZoyrDBn0/PvORh0y96Ez51bNPoIzmi1OiiiDRsQSOWLm2tN8YjLMRipRrIxko8nAfT+jm4qZfqkVlfZ28knWk1rwH/BJAVkmSJGGRURA2RteKFP/cIcVeF3IOtGiuPpEiTnPFNLoT1btpsCIvVByuXh3miZqLVrMAjxjbJrTXkbvLd07R3eBeRfgEqOJl1kJ9VO1+bwGvB2rKcfJ3YcCdIIf9QofdvrlHMqijWbfQ1GItT9Bk7Z+yTNMf/wBx9u9QDgSdCXtfS2O5YQyGY2LVhUVTWcTHLygPEuY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS4PPF69AE895C5.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 05:56:54 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:56:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18
Thread-Topic: [PATCH] drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18
Thread-Index: AQHdVPjkxHHQvRpciUezVmk5IlnKMrbxlzEQ
Date: Wed, 7 Oct 2026 05:56:53 +0000
Message-ID: <DS4PPFE901A304FDA0B1EDB07E8603ECD24E3942@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
In-Reply-To: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS4PPF69AE895C5:EE_
x-ms-office365-filtering-correlation-id: c2003b27-ba3a-43f2-c416-08df2437c9e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|18002099003|11063799006|22082099003|38070700021|56012099006;
x-microsoft-antispam-message-info: 9cJhuB0T4Be5rtLUYuQhvU9YqpmCqZORgBrFmV7Bssb2J9wQ/6+9lDf8z77EDnKMJPVroqRcVArJuHhOMQ2uMHdzCdi3bFH6D5bnnUdNOL8DBrSpE8bcXi+ErhI2Ih46zWNxPqrY833KUEUOGy77VuubTB6Xf/f8JJ+HcG/UmIvJL9jWoid8Tq+qld3DfmtB2isa2kcu94u49+GeYcTP9cXWk54LzvRfuuU2x8gPfzADLrqTe1ZxBuEfFm/sO036X24f+ES9tL7qQ+2RE80m2gWIhzvfzTY0/SZ/oEzwadiBGWM3X3U0Cc+ymv+ZK5/cb77ajLWrCojYqr5RKet8Ef59YIJNQJ4LiaSty0qHy2TrHuFqShHv0VEHBsAKzx08e9QCJBNrxGwH9feLblLnG6/3KWYT901RtRIcKnNDE0ux4/pTSWEM+83R/dIVUnljc13Z+AJy6utT+BysTt8R6bovrlOkV2HMN/1jodjLH/csJZKjDQmX8pJjD3kBMNj3kfrUQqRNNl3K42riIhn307+fSz+FVamRxK9333S4OleOM3IyzWlu5aFNvYSUG7El5Gx7/bwR4BePHEZwGTOBWiWfXSNJHOn20v+L2FCxkzZnIBGD6hqfQuW8Y1JyWg82XKUKWbKgGNwPd9xHvNdL0vnnbjaqJaKtR/5UQp2RObP89mBfUjsUFcpm1BpdaaXg98xfiN6+1nQd7Z8qKUfWLThQ3h1/6BOslQsB1uYFahE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(11063799006)(22082099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnVzWFRYSUY5N1VJVi9rWUViWnBWa3VzSFY3TmM2eHY1cGZHbGk4NkE2UWFu?=
 =?utf-8?B?R0dHT3pHU09rQmlXcndsMzFiUlliaVpsUmgvUHVXUXFHdEJ5NGNKa3JrY1kw?=
 =?utf-8?B?ZVFQWVZ1Nk5wSmwzTlVyelpkblJqTUZmVS81ZjhIUk5JVkYySTVEc3hjSHBm?=
 =?utf-8?B?am9hbzZkYVJQSXhpUk9pb3hFVTlvZTBvaTZIMFc1TlE1VUJsOXZMSHpsaURn?=
 =?utf-8?B?NTdHUnpISGE0Rk8yVmQzWkRpLzJTR3dxM3htWVB4NUVyYlhxWnVXdG9SaFlq?=
 =?utf-8?B?dW1yMkN6T2FXQ0UxZGpkNzc1ZXluN3AzMlRMZVlLQzdIQkFUamFld2ZzNGRU?=
 =?utf-8?B?cm1mT25IZDBlSnhrMWFqTUpmTUdGazNkN29PV29Cdm5TbEpLOVdpTUZMZjRz?=
 =?utf-8?B?OVVoYlZUMHdvZmNWM1MyZFJzNi84cU1jdzEwUUpzbGIyUVhiZXlmSmYvbUYv?=
 =?utf-8?B?bTJ4VEV2QWxob0szcVBMSUkwRks5RUpRZVBVWm9GMkx4VWk2YVd3Q0dkcmdN?=
 =?utf-8?B?UVBaVGJSVng3VlpyWTEvMUMvUjVUbUNINmxtZysyN01tazlLMnVoYUR4SHZx?=
 =?utf-8?B?VkNJSEh4QXJuclFyRDAyanFkeTljemowOW44c29PL1NTWjRTUGVIbEI5SEhD?=
 =?utf-8?B?ekVYYnQwUWRWSlVEcU1QbU14d1lya1RVQkRXQXYzS2hsUVRpVU5WbkpLTW1G?=
 =?utf-8?B?MjVvOFh5WUpmZTZReE1BZFJlRTZtR295RmY1VkZGbXkySGhVclFYcDZOZk9M?=
 =?utf-8?B?U3cxd2VMYkVPRU1LaWdFdjhRRjNZY3hGbDJXUDh3MmhaMXZjYmxlR044N2ZG?=
 =?utf-8?B?UzdzR2lwT0Q4VGZmSGs4NWdCd2drNmdBUjROZ0V6aVlIUUFjN09qaGE1a2Zm?=
 =?utf-8?B?K1BHVGNFNEJ6WUVjZ3NsMFFPSUYxbTcyQ3J2b1ZWanJmVmRoRFYreDJHZXNy?=
 =?utf-8?B?UDJZM1dOeUZoWHZ1dXd0aEdMUGJWZkZSZlBnSm9uUW5COTE0cGg5TFRsYzU5?=
 =?utf-8?B?OVk3U29GN0l4b1BTeVA5Nkk1cWI0dmJ6WFFsRk1NWXNqT0dzdVJmb3FKcmxr?=
 =?utf-8?B?Nmd3Q2FyTWJyQkZ5YzRqdTdJN25MeGpGTWZiWDNrZlIybnl5YjdTZ1dBaFhl?=
 =?utf-8?B?eFh2Mk5Hb2pXTTFXRjBtTHpQS0FsdVUxK3p6Y0h4SnFka1NVOWZQTmxxSzJR?=
 =?utf-8?B?ek5SZVRzMHpEOHEyakFrckhxY0FiaXRLN040SFZHRk9sd1lINHNHb1ppZVh4?=
 =?utf-8?B?TGNhZlRtZEg4RGk0N2Uyc1VRZ05pZGNpbjM3UDhLRUcvY2pXcy9RNWUvMEZ2?=
 =?utf-8?B?cVBBano0VklVU3F2NDBmS1RZdHJXT0ZSV3l2c1VCMm8xU2tMOGl4eklRZTlu?=
 =?utf-8?B?bXFCbzVjV2QwWHJpZFVqUU9HSFQ0b3F0dG1zSHQzTVFFR0hwQXMxZUNTY0tx?=
 =?utf-8?B?bnJTeEdvU0lCekhaMzJYL1REcWQwL3Bic1JpZWxUR3h6VzQzOTQwZmt6RThh?=
 =?utf-8?B?Y0FLamNBV1ludmZWSDBGT0Fpb1pQSVk3THJTUTZEYi9EbUZvRDFMK0FTaFJv?=
 =?utf-8?B?eTRDL01PM3doaFU3Z0JBMVZLbDAvWUJuMFVIdUZPcU4vb0RVM0NPU1J6ZHdy?=
 =?utf-8?B?b2Z0ZnFJb3VldWF1dHJKVzlvTFBIN21PZFRkZzFad0pIQmhkb1VXNWozeWk1?=
 =?utf-8?B?dkIxY2J2TWI5cEprUUxXR3ZReXpsMWl2ZEMvVHV5c0hQSUxFbzJIN2xkeFNZ?=
 =?utf-8?B?Kzh5bzI5aWxxWUlxbjY4RXRQa2Z5Wm4rZkF3R1MrS2ZLdXJENWNRWDF2TGZq?=
 =?utf-8?B?cUVURnF1TjFDVG05RUFkT2tySnRXWjlRYzZibkhQZzgxYkRIS1g2c1RaVW1t?=
 =?utf-8?B?anhYRjEwZTdlVEpEQVZvUXk4RU0zUTdZR283R0x5bit3N25EdVFqT0xYUHUy?=
 =?utf-8?B?YnlMdjZDRVpqTTJVT3o1NXR2bFVDNmYrditBcTZRSXZMMHc5Z2xndUdQbFI5?=
 =?utf-8?B?a0N3aHkrd2l0d1FJZFlNUTRESWVGVEw1elNPQ1A5ckx6cGg5MnhUM1ljd0s1?=
 =?utf-8?B?RVJFUS9uMVcweUN2QW90Y0Zqc2tFUVU1OGpwYUxGTEJNd2ZIenoxQ0ZBWlFh?=
 =?utf-8?B?WnNWTmIxUjRyQ3IxU1NrT0JqODF0Tm1NM1Rtdk9vQ05YSGs2YUxFQ3Q4V3Fi?=
 =?utf-8?B?THg3Z010V2tsM01KQ09JWDFTZ0wxVm1mVzQ5VGFHOU0zM2NmRG4vZFJJcU1s?=
 =?utf-8?B?clhlcXZpWit6T1daMTBqeXJCeThtMzNGYjYzd29rQlVmQmIvajJrQ3dUeXor?=
 =?utf-8?B?bXd3dEw5RjJvdW1VaHV1RkV6NzNJU25YNmVmdmpoWVdNRi9MSnpCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UDGij/IbP6O7qoTm//gf6k6JIWJZAsUBE3qm2sHAwbzc/sdIqu944ZGVDSzvqTf0o0VrYFo9ggZritpsemEgyKj3lDXToyd4YFGPMO+Ms7hJruVR7oOZ4xY4+e6UVaKvYPPiutqRZSufRbcl0IxKJeF3oNoMqNSoP7NNypQbyrjq8N/Pv+aLbKsMTKEuEs6rLQMUeYBaAPow8zFIQ/5MvMrIpuNMxh8Vm0BCX16FffPsssLLLu5545kr/21D9PubnmkzEB6NXPQYsFdjXhEOz0k8BC/Gq8mRLkJEYBcbCszPmWzzXNdpl8C/tBWqtyfgVN075K/incNnwJG5LLQJGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2003b27-ba3a-43f2-c416-08df2437c9e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 05:56:53.8611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8FHwzmf24nCaWYoVfYIE5kyob6WFah9si7ubqpRMtjNf3F8n+JFfSlX0N6sgOETgNeEs/943Qe+jtPXCmO3Whg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69AE895C5
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

DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2k5MTUveGUzcF9scGQ6IFJlZHVjZSBsb3dlc3QgQ0RD
TEsgUExMIHJhdGlvIHRvIDE4DQo+IA0KPiBUaGUgQ0RDTEsgdGFibGUgaGFzIGJlZW4gdXBkYXRl
ZCBvbiBCc3BlYyB0byByZWR1Y2UgdGhlIGxvd2VzdCBQTEwgcmF0aW8gdG8NCj4gMTggYW5kIGlt
cHJvdmUgdm9sdGFnZSBzZWxlY3Rpb24gaW4gc29tZSBTS1VzLiAgVXBkYXRlIHRoZSBkcml2ZXIg
dG8gbWF0Y2gNCj4gdGhlIG5ldyB0YWJsZS4NCj4gDQo+IEJzcGVjOiA2ODg2MQ0KPiBGaXhlczog
YWYyOGU2MDdmYzc1ICgiZHJtL2k5MTUveGUzcF9scGQ6IEFkZCBDRENMSyB0YWJsZSIpDQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjYuMTkrDQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rh
dm8gU291c2EgPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6
IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jIHwgMjIgKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfY2RjbGsuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2Rj
bGsuYw0KPiBpbmRleCA5MmU2ZmNhODYxZjYuLmRhZDVmYmVhYTFiZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiBAQCAtMTU5MywxNiArMTU5
MywxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2NkY2xrX3ZhbHMNCj4geGUzbHBkX2Nk
Y2xrX3RhYmxlW10gPSB7ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfY2Rj
bGtfdmFscyB4ZTNwX2xwZF9jZGNsa190YWJsZVtdID0gew0KPiAtCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAxNTEyMDAsIC5yYXRpbyA9IDIxLCAud2F2ZWZvcm0gPSAweGE0YTQgfSwNCj4g
LQl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMTc2NDAwLCAucmF0aW8gPSAyMSwgLndhdmVm
b3JtID0gMHhhYTU0IH0sDQo+IC0JeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDIwMTYwMCwg
LnJhdGlvID0gMjEsIC53YXZlZm9ybSA9IDB4YWFhYSB9LA0KPiAtCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAyMjY4MDAsIC5yYXRpbyA9IDIxLCAud2F2ZWZvcm0gPSAweGFkNWEgfSwNCj4g
LQl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMjUyMDAwLCAucmF0aW8gPSAyMSwgLndhdmVm
b3JtID0gMHhiNmI2IH0sDQo+IC0JeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDI3NzIwMCwg
LnJhdGlvID0gMjEsIC53YXZlZm9ybSA9IDB4ZGJiNiB9LA0KPiAtCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAzMDI0MDAsIC5yYXRpbyA9IDIxLCAud2F2ZWZvcm0gPSAweGVlZWUgfSwNCj4g
LQl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMzI3NjAwLCAucmF0aW8gPSAyMSwgLndhdmVm
b3JtID0gMHhmN2RlIH0sDQo+IC0JeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDM1MjgwMCwg
LnJhdGlvID0gMjEsIC53YXZlZm9ybSA9IDB4ZmVmZSB9LA0KPiAtCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAzNzgwMDAsIC5yYXRpbyA9IDIxLCAud2F2ZWZvcm0gPSAweGZmZmUgfSwNCj4g
Kwl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMTUxMjAwLCAucmF0aW8gPSAxOCwgLndhdmVm
b3JtID0gMHhhNTRhIH0sDQo+ICsJeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDE3MjgwMCwg
LnJhdGlvID0gMTgsIC53YXZlZm9ybSA9IDB4YWFhYSB9LA0KPiArCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAxOTQ0MDAsIC5yYXRpbyA9IDE4LCAud2F2ZWZvcm0gPSAweGFkNWEgfSwNCj4g
Kwl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMjE2MDAwLCAucmF0aW8gPSAxOCwgLndhdmVm
b3JtID0gMHhiNmI2IH0sDQo+ICsJeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDIzNzYwMCwg
LnJhdGlvID0gMTgsIC53YXZlZm9ybSA9IDB4ZGJiNiB9LA0KPiArCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAyNTkyMDAsIC5yYXRpbyA9IDE4LCAud2F2ZWZvcm0gPSAweGVlZWUgfSwNCj4g
Kwl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMjgwODAwLCAucmF0aW8gPSAxOCwgLndhdmVm
b3JtID0gMHhmN2RlIH0sDQo+ICsJeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDMwMjQwMCwg
LnJhdGlvID0gMTgsIC53YXZlZm9ybSA9IDB4ZmVmZSB9LA0KPiArCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAzMjQwMDAsIC5yYXRpbyA9IDE4LCAud2F2ZWZvcm0gPSAweGZmZmUgfSwNCj4g
Kwl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gMzQ1NjAwLCAucmF0aW8gPSAxOCwgLndhdmVm
b3JtID0gMHhmZmZmIH0sDQo+ICsJeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDM2NDgwMCwg
LnJhdGlvID0gMTksIC53YXZlZm9ybSA9IDB4ZmZmZiB9LA0KPiArCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSAzODQwMDAsIC5yYXRpbyA9IDIwLCAud2F2ZWZvcm0gPSAweGZmZmYgfSwNCj4g
IAl7IC5yZWZjbGsgPSAzODQwMCwgLmNkY2xrID0gNDAzMjAwLCAucmF0aW8gPSAyMSwgLndhdmVm
b3JtID0gMHhmZmZmIH0sDQo+ICAJeyAucmVmY2xrID0gMzg0MDAsIC5jZGNsayA9IDQyMjQwMCwg
LnJhdGlvID0gMjIsIC53YXZlZm9ybSA9IDB4ZmZmZiB9LA0KPiAgCXsgLnJlZmNsayA9IDM4NDAw
LCAuY2RjbGsgPSA0NDE2MDAsIC5yYXRpbyA9IDIzLCAud2F2ZWZvcm0gPSAweGZmZmYgfSwNCj4g
DQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMjhhMmVkYjg5YTI1YTQxZDJhNDVlMjdkNzRkZmQ5NDY4
NzJkMGZhZg0KPiBjaGFuZ2UtaWQ6IDIwMjYxMDAyLXhlM3AtY2RjbGstcGxsLTE4LTU5YmQ3OWNi
NWI0Yg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBHdXN0YXZvIFNvdXNhIDxndXN0YXZv
LnNvdXNhQGludGVsLmNvbT4NCg0K
