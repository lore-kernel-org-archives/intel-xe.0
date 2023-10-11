Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1152BCD6E6E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F8F10E86B;
	Wed, 11 Oct 2023 14:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DC510E86B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697033686; x=1728569686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iOOzMSND8v/T99tzhMlb7vcdZLtFEYt3R3SU1QkSO84=;
 b=GymJpMsLs79I8yyVP1sToYe2BKigaEy/Jbc/3pG3+zP6HZjpucobLRrh
 lSGeqmNZsnnJr7sdJ3Z5Fh4QlFg891b8CeREZCiNn6eh9xXt6F6eF/1N+
 Ip6L3m6pzK8KQncGhAbwHo3cdjCYH0PLklaLbzbKsJcwpAjQJA6M/iUS/
 +cItoBOWvj2umhgbUZJ06WT9KMh+9EvVmzg7lPEVzfgKsnWJb2/VF1HR1
 6toqDY7mpdAEkn6sf/q8AFMmg2iduwd9cjh979vXnjjuOrGfMe8CP8b5I
 nNjLQ+cAbELssc7eyQWmD0MnHsAfQiAKhIcZFOUXNnOTrvnAaUFjSM3gC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364957929"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="364957929"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927579517"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="927579517"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 07:14:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:14:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 07:14:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 07:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnoNmPT7UUASPFYbgYkUc3ZjBU2QxVV+dI0j74Ng7gJ4VuixQx+fqVz2wsceWVHdcmCoEgAZQgV+ZkWsKCq3ABL07H4BF5c428lZeUHIB3oiQg/X416APec7M145E5WmVVB1V4ncJ5h1d0UXeP7LlaGW1lVAgnQCgsL8XufRChvmn0ILm6s61vI96qR/cNzSvnMup5jFrKGSAmA619GsbFGT9qA0LG7RCHklpjRv5ykmcHsGLX2s88xZZ9Wbxh41wZxYeJkjuv174B6BoGRgzmiThLIx++2hth79b0byWVzuuwOfUYKoQO5Y8YOJYI+9j0l2j/pH27k4qcoBDhQzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOOzMSND8v/T99tzhMlb7vcdZLtFEYt3R3SU1QkSO84=;
 b=Xw4wGkzRnuUqduQGb0vApefKvIDa6Lx4uP4+kirZ5Mt1zEJB7zGKq9pEgGlCFb88Wiv6/CemKrHhdeB9JjuyH4NIoOriG16btd1VFD17yzsp8FOhq3acC80cUmVtuT+b+dGMEfproiaFawKehZGb2WfPqTNuYL1L/7GjO6+J3B325X4rkbPPyGHT4MbQfaIrQpnCBr9WKbHMiXoEUj4i/zX+F8iDrtu3SZAJEJ/Av+kRndnZ+qJkENsEdhOYCrZPTqsJSmnPrrQwpsygi20FubPV4C8ag+QK7lXQWWsnjVFflSSM/izZCJIhzOmJOfJggk53o7ack6q6dAI3u+cxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 14:14:27 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 14:14:27 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [RFC v1 15/17] drm/xe/uapi: Separate bo_create
 placement from flags
Thread-Index: AQHZ/Etj5LG6VvyYNUqrmMM7GP/QCLBEoeIA
Date: Wed, 11 Oct 2023 14:14:26 +0000
Message-ID: <7c0e833c4e4e517320e33fc41e55049e6b3b35a8.camel@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-16-francois.dugast@intel.com>
In-Reply-To: <20231011135926.7-16-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8530:EE_
x-ms-office365-filtering-correlation-id: d1ff9674-5747-4b32-9cd0-08dbca64609f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBvkpM0AdOxjp8uakKoVMf+W9rRZkUX7j15BLv5jR4PNYOZfVnq96mK1S2nDbmm6Ir+cKHrEpnuBbrNUuJHES+Aa3dVz4MUa9Cc2131syIgDs/Ve7ZZS24/BUm2lD12Eln7sas6gbgf00tZ6MBCAsc/c7YZyCYrKlcVTxi5OKbrDCdoHTo/K6J9KXfOsdDspgydQcn69So0PhoMtp811FbXhG6V0vL+qDu7ckPw7m+mq6FrRixnWsexDdsp0GcoEGChDUY8amDHBSU2Fe75VvQgaRkDfv0ZAWuOyCVDCrQDVBPT+hOwENRn3jdufhrFw9BEVFhWGCzfG1NBqR4e/hMHkuz35YgwTQ+VQcKzlELCoFvog0bb1OHrqzt7DFCTenlgBhSH5hMX57KR1HMcxq9irhtAZnSaGqrBGHUJ0oN8Jqpwm3ZpYUP3ixfDTcwsrlHCy4zIeu8rOm3gqyqBEfOO/flvn3iL0djaWhXsIT0OKI+w1Vj4Lm4bfP+fyoZUxe1L3L/FTZuGh06ctGpmrwMyq4N8DBz5isx4mwVwSyXBO8SDpp+dYUo/gD47TbtwOkXyd4asDn6QF9Ga/qf4hZQi55xSTRnmJ+UNYGn4bcKC1JW0RcptV+U71jNOJiAs9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6486002)(478600001)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(316002)(6636002)(91956017)(110136005)(66946007)(86362001)(38070700005)(122000001)(82960400001)(2906002)(8676002)(8936002)(36756003)(4001150100001)(38100700002)(4326008)(5660300002)(41300700001)(26005)(6512007)(2616005)(83380400001)(107886003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3VUOTNUV1RYenpwTlpoNXQ4UXBoeDJ5cS9lbHlqOHYrN3pTdGFUUWhwOU9O?=
 =?utf-8?B?S0RQZi9Scy81bHlXWlFqbXp6dHNqMWRIQzM1TzlWZE5sVW81bWxGZjUwMVRw?=
 =?utf-8?B?WlVYNUJJQ3pjcUhiUU1RS01CL0dwd2c0Vm54N2IvMlljTzdxc3RNVVNaU3BG?=
 =?utf-8?B?V21FWXYyVFRFV3paZXU2dzN6ZGNUTTJPaTRLaXR5NUc5ZVZ2TzBEdFRYQ1Nw?=
 =?utf-8?B?ODN2a01kSkt4MG50alo3U1pOQ29CMkd2YWo0ZVVWb2hSbm9ZOGJqK1hqK2d4?=
 =?utf-8?B?ZDNFaHlQeWlDVkZwWDdOcnhNR2tNQzNUNXp5bmpsOTdzQkJEVWswWVB5Y1Bw?=
 =?utf-8?B?VStNSEszMFpzZEJhTjZIREtRMnk4enpOM1dxb3pzWVdHdW9GYVhRMmZMYlBs?=
 =?utf-8?B?UWxRL1Z3Zy9qTnFyeEZ0VldlNnBVdGlFakJ0c1YyMU9qVk44aTRUR0ovOGpJ?=
 =?utf-8?B?dnBFVzZuTlBHckxPZjQvakt5SjRPd3lZUGxGZHczVVgwWGFDRXV0azBvUGc3?=
 =?utf-8?B?ZUlUeXhtNzQyVmRWMk1BNEtpSjZZelNVQTcwL2p5dVdkSWQvT2dzd0RVcU9X?=
 =?utf-8?B?OFJqZUhCNDlDQk13R1BzbWNDQ1REV3Q1ODBsZmpFK2JlRzZmWnpUek9FaFla?=
 =?utf-8?B?aUNSTmNod2VmalBDLytweW1JOGV4MEU4K1U2UVNHc2Y5SEVnOVBQaWRRTmcv?=
 =?utf-8?B?NVBVMTJUdmQ5TzRacUc3QWFTN3FVZUpMZmlLUFBWWDdrUjQreG11SXczMjFT?=
 =?utf-8?B?VDJPOXN2Q3RHTC8yYzRGc29MZk4vcnJtdkJaWUJkR2U1ZzlHeDFzMHN5TlFT?=
 =?utf-8?B?QnpQK0Vpdm1RRWl1eWFKN3hBT0NGbDBSdGw0akEyZmZwdFF6YzAydUNwVk1H?=
 =?utf-8?B?RGFRZ3hlZ1o1TldyWis3RnRoV1BLWTNmM3VIY05xbG5VNzA1TzhFYUw4UHpm?=
 =?utf-8?B?TnNNdzQzaGcwdUZLSzFONUIrdk5GeC8wdytmby8wMjVIWkFpK0k4Wm5VRElj?=
 =?utf-8?B?cGF0dGpKRlkrL0UzelpWa0x1K2JCRElVTWVPa2FUR0pHdkJ3bzNOUzdPS0Ew?=
 =?utf-8?B?R2tKSGc0STBkTi9zdDJvNi9VNTUvZXZsOHhjb3B4OE5zU2ViSlJURzd2MEh1?=
 =?utf-8?B?OFVvMDRtaVhmWHRDK1pGeEZ5UWgzbmg4L1pDeWtMUzE1bHJsbFpvNmJmN2ZG?=
 =?utf-8?B?THNNdmNtL25GYzhQUnJkTDRhaGRqdTB3dy93RlV0MXl2MHRMUXlxZ3Bib2gz?=
 =?utf-8?B?QXhDeHZYSG1BbDRFSWVwN1B0Y3VCMmNWd3NJVFlha3YzOWNPcjdFOS9iVHR4?=
 =?utf-8?B?a0ZiRnY2bExFakpWZEpHdmxmeXhFVTNXTVVpVHQyZlFnRlpRKzZmVi9zc0Zh?=
 =?utf-8?B?SEpYWnhpcUxUNUEvdmVQK2tBT1dncjROTS9Gc0dvQWhQd1NlVzdzYzBkYVJB?=
 =?utf-8?B?d0N2R1M5UHVYTW13bUlHM0RDbTJSb1M0Z2JsT0k2NHhsajBEUVp4TUJ4VDI2?=
 =?utf-8?B?R3lsL3pmc3ZQZ0NPaTJmQkpiMkl4a3BCckZOcHdVWkVXOVZkZGdUc2oxajZx?=
 =?utf-8?B?WXJ3NXRzOWNNRWFHZzVxRFQvVTFHRnRHSmRlUDRCT1pkLzVzS052QTdyOG9z?=
 =?utf-8?B?Ykg1WEh4aEJhbkxlbXBXWU8wZC8xWWlTWDZpZ3FBY3NlMktnUVdkYW05QjlD?=
 =?utf-8?B?K05pSnpVL1REd056NTZHWElHRDAwalJENUhXdEdUK1M5YitOakVTRUN3SUpL?=
 =?utf-8?B?L3RhT0tFL3RXdGFaVTlEZTM5MnpOM3NHQWNuTzYydVoxYUNLSEF5MkRhUGlQ?=
 =?utf-8?B?eUYrU3BuYnpIVG9PYitPRHMwVkxhY0FFWEFEcFlWZFF5S2NIOG5WeTM5NWox?=
 =?utf-8?B?T05wMDBEVVBEOXBRQ0V4aUR0Wk9UWW5UdlY0T3RwRGJNQ3J3MFhTd1lYa2py?=
 =?utf-8?B?UG0xZUx6THppQjJPWDVPcEdhbFhIU0kzQW9XSlRPbUp5YmRDNmVrWnY3QU1F?=
 =?utf-8?B?ZEVQZlBPdEx3alY4TTBsUjJPN0NvSGRqeE5EQnJkWFpsVGhDd1Ftd2s2Zmt3?=
 =?utf-8?B?S3hEV0hlSmtuenlBMmRVMmxsL2VwM0I4eDlrS3BQVXkzSmxFTkdkc2F4ekJ1?=
 =?utf-8?B?Sm40Tk51SWVtUnFsSCt2WEhHWHBBcVpwMWxkK015aUFXWFRQakpXZEhqa0Zw?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD2933EDA20AF1489797B0DFC3552056@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ff9674-5747-4b32-9cd0-08dbca64609f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 14:14:26.8712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdL0CwU4E09/TrfblJWAB4sBatGMJSfqpgqDLKOOQzARkBqZIiXvl+P0BAWgICMSOYUchY81WP5I5cU5nnXUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 15/17] drm/xe/uapi: Separate bo_create
 placement from flags
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEwLTExIGF0IDEzOjU5ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IEFs
dGhvdWdoIHRoZSBmbGFncyBhcmUgYWJvdXQgdGhlIGNyZWF0aW9uLCB0aGUgbWVtb3J5IHBsYWNl
bWVudA0KPiBvZiB0aGUgQk8gZGVzZXJ2ZXMgYSBwcm9wZXIgZGVkaWNhdGVkIGZpZWxkIGluIHRo
ZSB1YXBpLg0KPiANCj4gQmVzaWRlcyBnZXR0aW5nIG1vcmUgY2xlYXIsIGl0IGFsc28gYWxsb3dz
IHRvIHJlbW92ZSB0aGUNCj4gJ21hZ2ljJyBzaGlmdHMgZnJvbSB0aGUgZmxhZ3MgdGhhdCB3YXMg
YSBjb25jZXJuIGR1cmluZyB0aGUNCj4gdWFwaSByZXZpZXdzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9iby5jIHwgMTUgKysrKysrKy0tLS0tLS0tDQo+ICBpbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oICB8IDEyICsrKysrKy0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IGlu
ZGV4IDRmMGNkNjVjODUyMi4uYzJjYzg1OWIwOTIxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBA
QCAtMTc2OCwxOSArMTc2OCwxOCBAQCBpbnQgeGVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgCXUzMiBoYW5kbGU7DQo+ICAJaW50IGVycjsN
Cj4gIA0KPiAtCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmV4dGVuc2lvbnMpIHx8IFhFX0lP
Q1RMX0RCRyh4ZSwgYXJncy0+cGFkKSB8fA0KPiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3Mt
PmV4dGVuc2lvbnMpIHx8DQo+ICAJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+cmVzZXJ2ZWRb
MF0gfHwgYXJncy0+cmVzZXJ2ZWRbMV0pKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiAr
CS8qIGF0IGxlYXN0IG9uZSB2YWxpZCBtZW1vcnkgcGxhY2VtZW50IG11c3QgYmUgc3BlY2lmaWVk
ICovDQo+ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgIShhcmdzLT5wbGFjZW1lbnQgJiB4ZS0+aW5m
by5tZW1fcmVnaW9uX21hc2spKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gIAlpZiAo
WEVfSU9DVExfREJHKHhlLCBhcmdzLT5mbGFncyAmDQo+ICAJCQkgfihEUk1fWEVfR0VNX0NSRUFU
RV9GTEFHX0RFRkVSX0JBQ0tJTkcgfA0KPiAgCQkJICAgRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19T
Q0FOT1VUIHwNCj4gLQkJCSAgIERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9W
UkFNIHwNCj4gLQkJCSAgIHhlLT5pbmZvLm1lbV9yZWdpb25fbWFzaykpKQ0KPiAtCQlyZXR1cm4g
LUVJTlZBTDsNCj4gLQ0KPiAtCS8qIGF0IGxlYXN0IG9uZSBtZW1vcnkgdHlwZSBtdXN0IGJlIHNw
ZWNpZmllZCAqLw0KPiAtCWlmIChYRV9JT0NUTF9EQkcoeGUsICEoYXJncy0+ZmxhZ3MgJiB4ZS0+
aW5mby5tZW1fcmVnaW9uX21hc2spKSkNCj4gKwkJCSAgIERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdf
TkVFRFNfVklTSUJMRV9WUkFNKSkpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+ICAJaWYg
KFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+aGFuZGxlKSkNCj4gQEAgLTE4MDEsNyArMTgwMCw3IEBA
IGludCB4ZV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsDQo+ICAJaWYgKGFyZ3MtPmZsYWdzICYgRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19TQ0FOT1VU
KQ0KPiAgCQlib19mbGFncyB8PSBYRV9CT19TQ0FOT1VUX0JJVDsNCj4gIA0KPiAtCWJvX2ZsYWdz
IHw9IGFyZ3MtPmZsYWdzIDw8IChmZnMoWEVfQk9fQ1JFQVRFX1NZU1RFTV9CSVQpIC0gMSk7DQo+
ICsJYm9fZmxhZ3MgfD0gYXJncy0+cGxhY2VtZW50IDw8IChmZnMoWEVfQk9fQ1JFQVRFX1NZU1RF
TV9CSVQpIC0gMSk7DQo+ICANCj4gIAlpZiAoYXJncy0+ZmxhZ3MgJiBEUk1fWEVfR0VNX0NSRUFU
RV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSkgew0KPiAgCQlpZiAoWEVfSU9DVExfREJHKHhlLCAh
KGJvX2ZsYWdzICYgWEVfQk9fQ1JFQVRFX1ZSQU1fTUFTSykpKQ0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5k
ZXggZGYwNTYxZmM2YzM3Li45N2U1ZjhmNGFjYTMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAt
NjA3LDkgKzYwNywxMiBAQCBzdHJ1Y3QgZHJtX3hlX2dlbV9jcmVhdGUgew0KPiAgCSAqLw0KPiAg
CV9fdTY0IHNpemU7DQo+ICANCj4gLSNkZWZpbmUgRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ERUZF
Ul9CQUNLSU5HCQkoMHgxIDw8IDI0KQ0KPiAtI2RlZmluZSBEUk1fWEVfR0VNX0NSRUFURV9GTEFH
X1NDQU5PVVQJCQkoMHgxIDw8IDI1KQ0KPiAtI2RlZmluZSBEUk1fWEVfR0VNX0NSRUFURV9GTEFH
X05FRURTX1ZJU0lCTEVfVlJBTQkoMHgxIDw8IDI2KQ0KPiArCS8qKiBAcGxhY2VtZW50OiBBIG1h
c2sgb2YgbWVtb3J5IGluc3RhbmNlcyBvZiB3aGVyZSBCTyBjYW4gYmUgcGxhY2VkLiAqLw0KPiAr
CV9fdTMyIHBsYWNlbWVudDsNCj4gKw0KPiArI2RlZmluZSBEUk1fWEVfR0VNX0NSRUFURV9GTEFH
X0RFRkVSX0JBQ0tJTkcJCSgxIDw8IDApDQo+ICsjZGVmaW5lIERSTV9YRV9HRU1fQ1JFQVRFX0ZM
QUdfU0NBTk9VVAkJCSgxIDw8IDEpDQo+ICsjZGVmaW5lIERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdf
TkVFRFNfVklTSUJMRV9WUkFNCSgxIDw8IDIpDQoNCiNkZWZpbmUgRFJNX1hFX0dFTV9DUkVBVEVf
UExBQ0VNRU5UX0ZMQUdfREVGRVJfQkFDS0lORy4uLg0KDQphbHNvIHRoaXMgMyBmbGFncyBzaG91
bGQgYmUgZGVmaW5lIGFib3ZlIHRoZSBfX3UzMiBwbGFjZW1lbnQ7IGxpa2UgYWxsIG90aGVyIGZs
YWdzIGluIHhlX2RybS5oDQoNCg0KDQo+ICAJLyoqDQo+ICAJICogQGZsYWdzOiBGbGFncywgY3Vy
cmVudGx5IGEgbWFzayBvZiBtZW1vcnkgaW5zdGFuY2VzIG9mIHdoZXJlIEJPIGNhbg0KPiAgCSAq
IGJlIHBsYWNlZA0KPiBAQCAtNjMzLDkgKzYzNiw2IEBAIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0
ZSB7DQo+ICAJICovDQo+ICAJX191MzIgaGFuZGxlOw0KPiAgDQo+IC0JLyoqIEBwYWQ6IE1CWiAq
Lw0KPiAtCV9fdTMyIHBhZDsNCj4gLQ0KPiAgCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+
ICAJX191NjQgcmVzZXJ2ZWRbMl07DQo+ICB9Ow0KDQo=
