Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECB6CD98C3
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 21:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D910E169;
	Tue, 10 Oct 2023 21:04:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526A710E169
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696971889; x=1728507889;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=AzclNadMuuhdISUCQikL+WkgIcFPUbLLoj9QoAFFmBg=;
 b=CpWeT/ffoXBQoWS4BKi2WBFvdCOFFtr6v5EPUK330H4Y6l64jJyy5qqt
 5VKXe4XgamfISyzyyLC+Du5jqGO8BhobiJdnnH2vZziHZP/L6X+tmxL97
 Pm4Ssl4e8bvzNo8r4fK7uDgXFsuloF6xuZTYlq7dxLlZhYIzJV0yWxuxN
 6K8lvYUqY7gHa9aXobtr2AvzftXy/g6Woy9F1y68qiWLvq00PJmMvF3t7
 8Yt8l68F3SwPaCEYsJMoSW6bo45qQqcxpwZCmMWJkWXxbrOvdZKLhhwXz
 0Rz8rI0pcf8nstjBa4J9eVcGwu82eCKBJZ+oE0EfYFk0FgK4vLuaAlzpi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387348602"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="387348602"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 14:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1000838273"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="1000838273"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 14:04:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 14:04:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 14:04:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 14:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFyP4Hm+iad/IxB7QJSv4emUuW5cN/RrDVr+GLsCElnyFaSkVs0ACpo4KnS9i8mOGXpkk9zTylqXI5O8ln/XSXlzG3uHWneFcEWw4htE0Sf9Ek3X/bDmhOmkVXvZ8oADWTUrOxtEnmFTtXlD+Zt8MtQPk9GgIMio/hAFp5jSbebQ72hvsC9dwGSbQehlxnDsKBN+b+fLZBqvGdomJN3VPtNka1/kfc1K179mDj9lUThYAi5/Wt+TRwjYynDDy8ONLBLB5WKrn8B78tCpsgCgfLXZoGz8Va/NMIFaYw8QeXzL0ok7/2IRwtQP8Aie1hCDf4JNCs80YMBgqER0FIJGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzclNadMuuhdISUCQikL+WkgIcFPUbLLoj9QoAFFmBg=;
 b=cHsorQFBLszu4Kg2GqbrQnD0VWauq2fBx1KCXuxWFArXij7P7XbHp3O90n/d6EiZG8/1/BuPNWqdooWTYrQbOHooY3IjEDS0eQXpwaeTqiXKeKtHIBBb27DoaVoIUUAtgOLgjaZOD2HRYBYG/PDuQedWPc3luTTK/EVp2wVjaUhixlXWcFuFJD8oRCzNvQhSRU7Qk5rcCQYCsnkPOQDMePc2ixK9Fr0aFKCnbUykONOp22tA1ISOvi0iSClBGcF5tS12GmdIorOgmm1/04eo7VGEz8eA0FBREER8lgV0AN9dKciQbdPGpR8pedmJGHLgPtUI+hbyLxxSXR47uzGwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB7074.namprd11.prod.outlook.com (2603:10b6:510:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 21:04:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 21:04:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH] drm/xe: Add uapi for dumpable bos
Thread-Index: AQHZ+HkkfvLuWXQb9kqB5U5F1MRO+rA9FQMAgAAc1QCABlf6AA==
Date: Tue, 10 Oct 2023 21:04:43 +0000
Message-ID: <e301a32f6e2fb5625b8eaa3a6dda2db19993722b.camel@intel.com>
References: <20231006171800.1816211-1-maarten.lankhorst@linux.intel.com>
 <d530b1b8303e1f1317d9b97e21af35aebcdb1899.camel@intel.com>
 <85b90a64-bd54-6753-5f04-c3e9034ae5cc@lankhorst.se>
In-Reply-To: <85b90a64-bd54-6753-5f04-c3e9034ae5cc@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB7074:EE_
x-ms-office365-filtering-correlation-id: 2d6372a2-fd4a-467d-abdf-08dbc9d486a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aM+V/rfDCqGHjl4+rnitTJmzNazR3trOx1B2z2VCA8bh3X7dw6JUQcJHgcNNtJRyp1JpgZ4yomldesWUpyLP6DZT26fbYtl1aSHnbPvd66MlEuBBJHMzWUSDfgu7py/qD/7qsdV4iNNZtkp6UOCLJP5vmrxCVDGJLCMItXwTmk2GzEfGSy4UO1UyyIg5U+KwcfzZ4wKHXFiH6JQgPAiLR3Je33iuthqf4Kg3hsLGDQl2Pa7q7CjTX8zDtlW4g4SvFnNHYCY/FyrayMVEPNGT5ZRltP8RhORScrlT0/u6zAqYvyGh7wZ+nP0kEVNeLo93tKzlXIJUxXjJDNs8yzd93FSaezSZyv0FBcrb4b/ZsVYNWNnAhy1mYxNYxcaQNrkegUmy9YZk0IemR56C/n04vTdeVwaYDEvs/aVqOiHcOO9fqelsk6jyhSAgXjnbL0Ar+HAmuWZpKQWS8fhpauiEN3Q+BL5+NrtL0XxRkpx4r6MH0J/4AzikfIKH/Q94P+6TlCzVGyqWwPxkGPjLZgyRgVS2OC87PXWnHZS7Azp2B8O0YKiJ9x/8HT8kg/2DqU9apYRTCSL//3vVWAbg8SNzQ+ujI6qtM5t57x658ORmlpMysWKbFhvbdYLQE47z5CDw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(53546011)(478600001)(2616005)(71200400001)(6506007)(6486002)(8936002)(82960400001)(26005)(83380400001)(2906002)(66446008)(5660300002)(91956017)(66476007)(64756008)(66946007)(76116006)(66556008)(110136005)(316002)(8676002)(6636002)(41300700001)(122000001)(36756003)(38100700002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUZheEVvRXBJVDRPNVppT09DRi9UanR0ZHNpOUN1bjF6TUxGYzdEdXd1aEsr?=
 =?utf-8?B?OGlxb054cGZPMElZdDZ2VHh6aUhZWkJ6SWdJS1dEM2ljNllmZmRsL1NHV0xs?=
 =?utf-8?B?dWgrOEhMOC9SMXMxeWV0REpUeTJYNU1PNk40MjdzVFdZNHdwNStBMnl2V1U1?=
 =?utf-8?B?enZIYVBIWGlvTWVuMmJ3bTNKOTY3Z1ByNjJUS1JiclhRMGxON2JJZmdOekpT?=
 =?utf-8?B?cGwvNzV0UlkzOVRUMmk4UzlTNGlsNzBicW90R1I5Vm8xZ1ljSVY2azBoSUdm?=
 =?utf-8?B?L1YzY2hPNG9Ma0JJYnhrKzVwS2wxaXUrZ01rbC9hZUZZMW5xL3hhOFZkWERi?=
 =?utf-8?B?d1JSUGU0ajNpSGhrcklrQjRjem5OOWIzN3FZVmlIdW1qNGp6VS83RWpobTFF?=
 =?utf-8?B?Y3czK1ZXWnpTLzBsNUNUZVN1YXI2TE0xY1ZKMTBPaTd5WWdUZUwxcjFyS0to?=
 =?utf-8?B?ZEU1amdpbVhRTnNjQ3pUTGxXcGFLRmc0YklpRGUyTWZoVWc2OGx5Y1NpSzRB?=
 =?utf-8?B?Lzl2WGZFenFQd2FxblV5c1laUHZ4ODBOV1NjaXExSUROMXN2WjBlM0duSlNn?=
 =?utf-8?B?MzA5bHI1V2ZVdXRNdS9ZdmdFQmRjdmc1ZWY5NFgyNVE3UnFFTy9iWVB1L2ZY?=
 =?utf-8?B?YXhKcjE3QUFHb3Z5Q1JDUHRjdFQxWjJiL2I0ZldURjhLTjRDZ05VZmdYbHl6?=
 =?utf-8?B?d0hpOHRqamtRNWJBb1FMQXgrTTJ6dWp5dElXMk1BUUVlSjNFYzBQc3Q2SlFV?=
 =?utf-8?B?MmU5d1lTWjhwNmZhb0xTSEJLT2taZHdhK2U3Mm9sSS9XTnRtVnh3S1BIVTFW?=
 =?utf-8?B?TEFubytTZjRsRThmczg5cmxFZFJyc3dlbE9haDJwS3FFajUrWVhWdHVqVkww?=
 =?utf-8?B?TDdGS1FKK29SSDE4ZzNiOW1ERnF0Y2g5dlB1VnA4WU5xWW9odWxYSHBUdFRo?=
 =?utf-8?B?dEhqbS9tWEVYWjYvNHp3VDRTV09XU2JtWlg3cUo3TWJOUmd0SWd1M2VQaXBn?=
 =?utf-8?B?TEVhRzE2c3REa0wraFZ5Zlp6STVhVTZVWDBHT1NrZ0dyTkZ0cHFnNHFoL0pp?=
 =?utf-8?B?aW1XdGgyNStLOTFxdUN0bDdlYjRYaEtaNWdaTER1cnExZ1Q4SWU0NDlOOUJC?=
 =?utf-8?B?dXZMUjlFSkJkb2YxNHNzZ1RoeG1reStNTVRsQzRoeUVPeGZ3WUxoTUxjR25p?=
 =?utf-8?B?cUVpYzdYYUROelN0eUNCZThTWmd6aHpKQmdJdk1DaHJLYTUvNzFDZjJZUFRE?=
 =?utf-8?B?S1pNVGVxRThPbWdGTS8rWVVmWHdEZEtKd0RJRFM3QW9tNkVVNGRpUm53MjFy?=
 =?utf-8?B?VzVjdWVENnFqaGl6K05VTnRvL3dIOS9zNk9MbzBqZDZBMTVUS0NjaDNBYS9r?=
 =?utf-8?B?aFBaNkQ4WWtGU1FqWk5zYkpURS91RUdUbWh5d2NHNXZWdDBSVkV3cGNTdlEv?=
 =?utf-8?B?dXJueXFoWkFhTHlPTkRBN0pTS1ltbGlvNmRiV1M5L2FJMlZJdjlMOGFhSUZR?=
 =?utf-8?B?UVlLYlhCUXROczM4ek1IbmQ4UlpINmFXRW9TVzVENlZ5SmhLODd5aXlwVy8y?=
 =?utf-8?B?TE1BRGF3cFB5V3NFc0d1cTBTZkwwOU0xcXRQY3g2dTVXLzVGQVFxS3l6dEVC?=
 =?utf-8?B?NzRJN2UwaDlyQ2VqbjdJMWtaRHpjdTZLZnF1YnVycGFiNWI5bnNOQVpMQ3pm?=
 =?utf-8?B?c29MK2FOR25nL0FaSEJQbUlZaXVINlNOZ04vZHpybFpUNVBkdDFXaVNLTkJT?=
 =?utf-8?B?MXFrQWdNVUM1c2RDMmxCTkkrNVdJYkV3UTRsU1hlZ3M5d3AzUUZYNWxWcmk0?=
 =?utf-8?B?ZDdWUlo2S0VtMmk3MWxsTCtucm0rTFYvVFAzVm54eDV5QTduMkN6Z0tXRDR4?=
 =?utf-8?B?MkF3Mm92aDhKVUw5WDdMMXRhbW1FUFdBZHZMU1UyRkV2NlFYRTRCVWxRbWxJ?=
 =?utf-8?B?RE9SQW1XY0MxWU1aYlRjcXJEM3lMRFpzTlNMbDBrakZHbWkyM210T055RURE?=
 =?utf-8?B?OWhIbVJUaVJ2OGZteGJ6Z1hOZFdxNWtORDh2NThVNFZpVVRJTDdTdXlmZ2JP?=
 =?utf-8?B?MWFLWEtQZktTVWFrdHp6b2gvRTJpbDNQbXFNbUc1bXdaYm9CdTc4WjVQOVBz?=
 =?utf-8?B?MXR4b1ZUVERjcFpZTkRBY2xZTjRIS2M4cEcvVTdBcnBhZWVURGgzZytGdHVW?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F39A1DBF3B91549B93A9DF7F317433D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6372a2-fd4a-467d-abdf-08dbc9d486a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 21:04:43.1906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 09EnkcHfZ3FRqCEC1q/Kj69WbKeTfx4p6BBxLvIb/vUFTqFgV3ZJsmI2f+x4TKL8Vww7tm1WuzUkjN2o+7mWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7074
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: Add uapi for dumpable bos
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

KyBMaW9uZWwNCg0KSGkgTGlvbmVsDQoNCkNhbiB5b3UgcGxlYXNlIHRha2Ugb3ZlciB0aGlzIHRo
cmVhZCB3aGlsZSBJJ20gb24gdmFjYXRpb24/DQoNCk9uIEZyaSwgMjAyMy0xMC0wNiBhdCAyMjox
MiArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6DQo+IEhleSwNCj4gDQo+IE9uIDIwMjMt
MTAtMDYgMjA6MjksIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMy0xMC0wNiBh
dCAxOToxOCArMDIwMCwgbWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tIHdyb3RlOg0K
PiA+ID4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+ID4gPiAN
Cj4gPiA+IEFkZCBYRV9HRU1fQ1JFQVRFX0ZMQUdfRFVNUEFCTEUgZm9yIHVzZSB3aXRoIFZNX0JJ
TkQuDQo+ID4gPiBGb3IgQk8ncyB3aXRoIHZyYW0gcmVnaW9ucywgWEVfR0VNX0NSRUFURV9GTEFH
X05FRURTX1ZJU0lCTEVfVlJBTQ0KPiA+ID4gYWxzbyBuZWVkcyB0byBiZSBzcGVjaWZpZWQuDQo+
ID4gPiANCj4gPiA+IEFmdGVyIHRoaXMsIHdlIGNhbiB1c2UgdGhlIGZsYWcgWEVfVk1fQklORF9G
TEFHX0RVTVBBQkxFIHRvIG5vdGlmeQ0KPiA+ID4gZGV2Y29yZWR1bXAgdGhhdCB0aGlzIG1hcHBp
bmcgc2hvdWxkIGJlIGR1bXBlZC4NCj4gPiA+IA0KPiA+ID4gVGhpcyBpcyBub3QgaG9va2VkIHVw
LCBidXQgdGhlIHVhcGkgc2hvdWxkIGJlIHJlYWR5IGJlZm9yZSBtZXJnaW5nLg0KPiA+ID4gSWYg
bmVlZGVkLCB3ZSBjYW4gcmVsYXggdGhlIHJlc3RyaWN0aW9ucyBsYXRlci4NCj4gPiA+IA0KPiA+
ID4gSXQncyBhbHNvIG5vdCB5ZXQgY2VydGFpbiB3aGV0aGVyIHRoZSBCTyBjb250ZW50cyB3aWxs
IGJlIHByZXNlcnZlZCwNCj4gPiA+IG9yIGEgcmVmZXJlbmNlIHRvIHRoZSBCTy4gVGhlIGxhdHRl
ciBhbGxvd3MgdXMgdG8gc2tpcCBhIHdob2xlIGxvdCBvZg0KPiA+ID4gdHJpY2t5IGxvY2tpbmcu
IFRoaXMgcmVxdWlyZXMgdXNlcnNwYWNlIHRvIGRlc3Ryb3kgYWxsIGJvJ3MgdGhhdCB3ZXJlDQo+
ID4gPiBtYXJrZWQgZHVtcGFibGUgdGhvdWdoLCBidXQgSSBmZWVsIHRoaXMgaXMgYSBjbGVhbmVy
IHNvbHV0aW9uIGZyb20NCj4gPiA+IGEga2VybmVsIHBlcnNwZWN0aXZlLg0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9i
by5jIHwgIDkgKysrKysrKysrDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oIHwg
IDEgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDE3ICsrKysrKysrKysr
KysrLS0tDQo+ID4gPiAgIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggIHwgMjUgKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gPiBpbmRl
eCA2MTc4OWMwZTg4ZmIuLjBkZTBiZDVlYjgyNSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9iby5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
Yw0KPiA+ID4gQEAgLTE3NzYsNiArMTc3Niw3IEBAIGludCB4ZV9nZW1fY3JlYXRlX2lvY3RsKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4gPiAgIAkJCSB+KFhFX0dFTV9D
UkVBVEVfRkxBR19ERUZFUl9CQUNLSU5HIHwNCj4gPiA+ICAgCQkJICAgWEVfR0VNX0NSRUFURV9G
TEFHX1NDQU5PVVQgfA0KPiA+ID4gICAJCQkgICBYRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklT
SUJMRV9WUkFNIHwNCj4gPiA+ICsJCQkgICBYRV9HRU1fQ1JFQVRFX0ZMQUdfRFVNUEFCTEUgfA0K
PiA+ID4gICAJCQkgICB4ZS0+aW5mby5tZW1fcmVnaW9uX21hc2spKSkNCj4gPiA+ICAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPiA+ICAgDQo+ID4gPiBAQCAtMTgxMCw2ICsxODExLDE0IEBAIGludCB4
ZV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+
ID4gPiAgIAkJYm9fZmxhZ3MgfD0gWEVfQk9fTkVFRFNfQ1BVX0FDQ0VTUzsNCj4gPiA+ICAgCX0N
Cj4gPiA+ICAgDQo+ID4gPiArCWlmIChhcmdzLT5mbGFncyAmIFhFX0dFTV9DUkVBVEVfRkxBR19E
VU1QQUJMRSkgew0KPiA+ID4gKwkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgKGJvX2ZsYWdzICYgWEVf
Qk9fQ1JFQVRFX1ZSQU1fTUFTSyAmJg0KPiA+ID4gKwkJCQkgIShib19mbGFncyAmIFhFX0dFTV9D
UkVBVEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pKSkpDQo+ID4gPiArCQkJcmV0dXJuIC1FSU5W
QUw7DQo+ID4gPiArDQo+ID4gPiArCQlib19mbGFncyB8PSBYRV9CT19ORUVEU19DUFVfQUNDRVNT
IHwgWEVfQk9fRFVNUEFCTEU7DQo+ID4gDQo+ID4gSXQgaXMgbm90IHZpYWJsZSB0byBqdXN0IGln
bm9yZSBWTUFzIHRoYXQgY2FuJ3QgYmUgbWFwcGVkIGluIENQVSBkdXJpbmcgZHVtcD8NCj4gPiBC
ZWNhdXNlIGl0IHdpbGwgbm90IGJlIHZpYWJsZSB0byBkdW1wIHJlYWwgYXBwbGljYXRpb25zIGlu
IHNtYWxsIFBDSWUgYmFyIHN5c3RlbXMsIGl0IHdvdWxkIHJ1biBvdXQgb2YgQ1BVIG1hcHBhYmxl
IG1lbW9yeS4NCj4gPiANCj4gPiBBbmQgaWYgVU1EIHJlYWxseSB3YW50cyBhIGR1bXAgb2YgYSBz
bWFsbCB0ZXN0IHRoYXQgZml0cyBpbnRvIHRoZSBDUFUgbWFwcGFibGUgbWVtb3J5IGl0IGNhbiBz
ZXQgWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSBhbmQgZ2V0IHRoZQ0KPiA+
IHdob2xlIGR1bXAuDQo+ID4gDQo+ID4gU28gd2Ugd291bGQgYmUgYWJsZSB0byBkcm9wIHRoZSBu
ZWVkIG9mIFhFX0dFTV9DUkVBVEVfRkxBR19EVU1QQUJMRS4NCj4gSXQgd291bGQgYmUgZG9hYmxl
LCB3ZSBjb3VsZCBldmljdCB0aGUgQk8ncyB0byBzeXNtZW0gaWYgd2Ugb25seSB0YWtlIGEgDQo+
IHJlZmVyZW5jZSBhbmQgZHVtcCBlYWNoIGJvLg0KPiANCj4gVGFraW5nIGEgcmVmZXJlbmNlIGR1
cmluZyBjcmFzaCB3b3VsZCByZXF1aXJlIHRoZSB1c2Vyc3BhY2UgYXBwIHRvIA0KPiByZWNyZWF0
ZSBhbGwgZHVtcGFibGUgYm8ncyBhZnRlciBhIGhhbmcsIG9yIGl0IHdpbGwgcmlzayBvdmVyd3Jp
dGluZw0KPiB0aGUgc3RhdGUgYXQgdGhlIHRpbWUgb2YgdGhlIGR1bXAuDQoNCkJ1dCB3aGF0L3do
byB3b3VsZCBvdmVyd3JpdGUgdGhlIGJvcyBkdXJpbmcgZHVtcD8NCg0KSSBkb24ndCB0aGluayBp
dCBpcyBwb3NzaWJsZSB0byByZWNyZWF0ZSBhbGwgQk9zIHRoYXQgYXJlIG5lY2Vzc2FyeSBpbiBk
dW1wLg0KRm9yIGV4YW1wbGUgdmVydGV4IGluZm9ybWF0aW9uIGlzIHByb3ZpZGVkIG15IGFwcGxp
Y2F0aW9ucywgd291bGQgbm90IGJlIHZpYWJsZSB0byBVTUQga2VlcCBjb3BpZXMgb2YgdGhhdC4N
Cg0KPiANCj4gfk1hYXJ0ZW4NCg0K
