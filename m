Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718ADC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 15:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F28B10E0F3;
	Wed, 24 Jan 2024 15:16:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965C710EA5A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706109381; x=1737645381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hCatQlZIXdEbPsRkO3kRWA3ZvQ9sbJa2V03MUxGQaAo=;
 b=DQapblOKit6v/rvr6VXI+BhMs8a+H3a+4k9CcZVa3ydqDRPs3g86zsf+
 idF76PG0eThT9qctz9VUklYI61OgCWRi3tpX5e1Xn4Im5zPE+33FpcEPD
 qt2bOVRDM95+2+Qe8ChLWquO0TbMWjUyQ0DKVkM55Ek5/kc9J1MdYe1qW
 zqERel/boeXn1aScO2g5dD4h+PyOckVkPRpU3W0OIn7+5h2/CnA2cd0/H
 CZLsW8Z/7Gbx6xgrIi+LX+ioTxIi1/Keoz7kG6KT/gQzUqjN+EsGcEZA/
 WF3lW9zkGAKeOqvct9fmsYuvioso2ZM8wE86cuoJ8KtP+7C4NHchdjAI0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8543472"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8543472"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 07:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856731321"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="856731321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 07:16:20 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:16:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 07:16:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 07:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0NqexiJnOV3Ll+/rN8sOQxJ963LG56NT345bWSXU4DQ057ICrttXTbKQczGyiGOufNyQ7X3noCxa5hcMa67GeUtBd1mXl3S7fIMNka8HREheaGTgyZjY9IvfkEAgIW+Zt+4L3s1XOGbqdvMj7+Y79/g27z6nIZkZcGRcaChtXecWCUIXLqmUoPfTW5fCPrNmI2coIcaH2lbTBpZ63PRKjB+l9Wy6vGsXUdI8b9Xx2nb/8Wb03mYnPVmVPDimkSKBi2v+pXOtHZoQcnJRNmKd1/k0v2vMRHZTOQfTwhW1mAE1CwqFlBRLtO7eKI13WlGQgygsibGpZIiskwP4Fi5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCatQlZIXdEbPsRkO3kRWA3ZvQ9sbJa2V03MUxGQaAo=;
 b=E/oNQFZgBn4N9fKrwZC9OtAUpcDHT6WIuIj2MPSXLS/rMUv8szhxTms0MJf5UwsTfhja3pZsHBs9xBlH201LWnsJWYGgE9ccmQRXuNTxZxMzcro+hB2d9W6D+vqctgwVpSXxQrY1lVnMBQ9QZoxXxS7vWbvpkQjPLJrFHpwhrJ6M0w4Oi1ECItfw+Ha6NIane3YbzIC+RX6uwOxQk65lMFfGSf5aHL4Z8BLdrNxnaRCGAaS3/uFcFcMsUr+9NVreRvSnrUO5jXbk+22onxWUPDaCc+6RkuEceIX19aAXjmbATlwazG6ArzhrNwCKidcDLsxi7AQMJQ7t82lwuoO7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 15:16:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 15:16:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Topic: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Index: AQHaTVU0tUhabWgp9kKY5rfrtsqlPbDmKcwAgAABYQCAAuqvgA==
Date: Wed, 24 Jan 2024 15:16:11 +0000
Message-ID: <83ca9d83fe5b8e6d9040c8989e17f5c0e18a5442.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-3-jose.souza@intel.com>
 <ac8c0487457d8f6b7085f7fe9aec23472aff8587.camel@intel.com>
 <5749b3be988a6e8e6b2c5330d817e32abba44b4c.camel@intel.com>
In-Reply-To: <5749b3be988a6e8e6b2c5330d817e32abba44b4c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BN9PR11MB5420:EE_
x-ms-office365-filtering-correlation-id: bd4060a3-7f58-450e-4907-08dc1cef6668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S1e5FE97l5A7e+gZ/QJArl4aZVfGZMp3a2bqEsgiA48z+vXIQ/0IGogaOJFhOMeD8Pv8YkjwSOMwwZ17LlJaEMKWDm06Ajyd6mkiyrIZrIxhHPkyJpSN9EGj2emKqCPobIW1/Bm78z69txPlhnLRdVP/5GfnVVq5QEkeLDgNYAjalzK3Sk/ZN92YYFvT0QcPyLDEvwyrBy6j5QqEK9ZQ6Z54xsZUxbZICL64yr8G8hpu4vjDP4xNEVCE7YhBeVAj0yxNYkdlHmhmnVNRpM2cHH1xwLcR61Dcdyi3Id0+j5V8zBVmMbT5+/50nIUv3HQiSuWmOm0G9CMqMo+pAeAILNqfJFaQyL72W//rdjpsXjA8i+d/4jr/0x4EWRTtZgcqBRS8ToOytbV+hLYxl91ZXH9YdatIYXutcwDo1jaMGhIewzQrih8ydCT3GmWx/JWacne5ty9I20peHJ44XuevfWL7lIuTYfuw9nTmB1cj1nu3XDs0ocdT/CxRmz6lQkndOBUeNaNZfQSIlz9ieJ2yY0UOf1yU6oxudkG0BYso8DMuRabkFDToavScHSB+hxU9AsYsBebYX+Dm1peU39bV/I2gdhiL9/Gm4iXAv7x/ckpwgP0O4KxgoYkYLqHbgBnO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6506007)(2616005)(107886003)(36756003)(64756008)(54906003)(66556008)(6636002)(66446008)(76116006)(316002)(66476007)(110136005)(66946007)(91956017)(83380400001)(82960400001)(5660300002)(4326008)(8936002)(8676002)(71200400001)(26005)(6486002)(122000001)(6512007)(478600001)(38100700002)(41300700001)(2906002)(86362001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXZrM0g4M2c3bklGTHYveHQ3RW02TGpvQlZYdUFvLzNsaEZTZ1hSQjh6Zngw?=
 =?utf-8?B?NTU4eUNRa0QvU2RseUoyd01lYU5DV3N4ZDlQZU16Q2FOcTA3WEtqei9mbnBr?=
 =?utf-8?B?d2N5RWlxL09ERTl2TDN3M2RIcjBqY0RkWS9waFM2VE55cWw0TkVOdDAwYXM3?=
 =?utf-8?B?MkZmR2xMWVdJcmJUVGJIenpFam43Mm9nQll5a0pzcDJEQlV5amliSmxQek1F?=
 =?utf-8?B?RmlRSmo2WktKdGg4NDJtSVpjYzFmbzVYWUJqYXBlRFJ6TmNMT1pENU1CUmVO?=
 =?utf-8?B?U25oZEF5TnZZVjZaZ0NUdEIwK2ppbEVBRDNtNDYyOU5kNW5JUHRQb1pjdkd2?=
 =?utf-8?B?YWRJcWVwQmNZbjA3dTdxQk9vWDJLV3l4dy80RURGeXk5emlrN1Rad0ZsMU9y?=
 =?utf-8?B?MHVjR3R0aGhnUndKcTVtSGl6SnpPOWFDZ2N2N08yeHFrZnJ1dGdGWE5laGhM?=
 =?utf-8?B?R3BLVHM4TnVzdkx4ZDJoRWZna1hsTm1lZ2x1b0R4WkZkZFVQOG1YVEJQNyto?=
 =?utf-8?B?bVpBbVUrWUxoajR6UlJFOVQzWmZoRlZtS2RxOEtyMUpGR3NhUXlGY05HSG5u?=
 =?utf-8?B?eFdNZnZoclhLVmxML1ZIUFgyc01KVHA0cytCMzVhTmY4cGtOOURuVFpaMUZ1?=
 =?utf-8?B?S25SWGh2SktNNUQxeDhtbFdOMWQvalVtRENsYzhuMDVpNURUc0svZkRLa0pQ?=
 =?utf-8?B?bnJkRzhoNG8yQXpDMnc5QU5ZbGRtSkxDM0tFR05VOTJwL2czOU4rV0FReStK?=
 =?utf-8?B?c29sQ1FHMS9yMmliZkxzNVZQd3N6RnJhMFl2MlYyZVhyVmhoTXc5T2xONGFu?=
 =?utf-8?B?M0ZkRkdIaDU3VzVsMm0weUNmRHBGUm90ZjlodS90YWZONmk5eG5aMEo0WDlJ?=
 =?utf-8?B?MUh6TkhpZDZyQ205OHh3bXpiVVNxKzc0L0Q5OUR1eGJ0aWtaK2U1VWdYTTQ0?=
 =?utf-8?B?a3NUdktTM1p1RHRqaC8yY3dEdlJQNFhTMmFEdG05aVE0YWN4UlJwNzV6VlNX?=
 =?utf-8?B?eWhXUXRvWFc0Um5kWkVtdmhGbDRsNWhRazhPN0p0YVY1SzhWeFBIVXAxNDBj?=
 =?utf-8?B?UFVmZG9lZWJpRE9oY21rZklDcFc1Vk5GMytZWE5jTGtmUlFSS2gwdnJtVDd4?=
 =?utf-8?B?Sll1bGp0OE9iWmNDR2ZPampqVUhLZ1RMZHNIaTNpMjh0WlpsTkNpakQ5b2tD?=
 =?utf-8?B?TzBzYkdyM1FyTVNzM2FsaEhGOVhyanUyUUh6VndqYm9UWjhkRm9qR2RsZ3Z1?=
 =?utf-8?B?Njh6WGczMXg1b0pvN25UcXlCMENTYTE4YnR4a0o1Q0VnaVhuWE5rUldSOHFz?=
 =?utf-8?B?Qkc0alJybCs4d0FSNVppaXlTemgxWUEyaGxMZldmMUh4YXgxOW5maWRoTTJk?=
 =?utf-8?B?RUlCSU11dUFOU3ArdEVNdjB0UVhhdHNGK3VXRU5JTjUrL2JrcnlkSS9vZE1N?=
 =?utf-8?B?dWVqY214a0JKWkdwSGVrViswNnVqL0paUWVOajJCbTNsY28vU2Npc0xzZHJP?=
 =?utf-8?B?VVZPOGJnaTZTMS85RnQrdHVlMEdMUVptcjN1YlRJcG5xOGw1LzlGRFRHR0Vh?=
 =?utf-8?B?M1ljanppUzJ0U3lDZkQ2K3BReDBRbDd5SG1xcEJMWEhqUWJ5RVhQSW5qZDJR?=
 =?utf-8?B?eWZaV2xWYzd1c0NTTFdtcW9sc1hGSFhLbnZva29BOGtQM0xtUUlyR2M3M2Ir?=
 =?utf-8?B?clF6ZzdmQ2ptS2NuSEtOMllOc1NtK0M5TUhDaTYzQkowUjhtajVQYUpzcURQ?=
 =?utf-8?B?YS9VTmNMYVVKY0tHZkFRYU14aUpZMHJHdThQeXZLVGxhUjBHTkN1dWxVSElr?=
 =?utf-8?B?UjVJRmVLVHJiOGdnVXBqcTVmKzlRTWg0QXJWM2pzOHh2cC9sRFJlRUQ1NkdX?=
 =?utf-8?B?TXR5TG9VQ0ZQU3FkS1VJVWE1ZS9lbVJOcGNsZVdxR2hJY0M4TUV1WDJjSWJ2?=
 =?utf-8?B?a2NWb3I3R2toRkRJa1VIbVE0MTVMM2ptRXYyZlhjSXpGR09zaXAzc2ZzS2dJ?=
 =?utf-8?B?bXF0cDVCckNhc0c3NkwzRWV1YWV4NENrZ0VGSWhuRnBKWFMwZnhVVjhqd051?=
 =?utf-8?B?UGxwZkxqVWd6OTA1QW4xWUhmb1pjWkpXK0xkbGJWWnpPa04yNU9NNUlIQkt0?=
 =?utf-8?B?dmdIYVlOWnhtdHVPeElPL1FVRkJSeUhxU09yVFdPS1lxSkNkNzZDRlJ2c3Y1?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <306DCAEC2DE17E4B846514C82BCCF44A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4060a3-7f58-450e-4907-08dc1cef6668
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 15:16:12.0030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTvaZH97wr2WNsLHM0arGYqRxOvJ+YGVPFfRFaJ0zkpu+EyyliA6z3P0m7Y/XWLqfxgGGHDXhdxY5pyStrL0qHKiYe40WFTTJHogiIqQ0ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE4OjQzICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE4OjM4ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+ID4gT24gTW9uLCAyMDI0LTAxLTIyIGF0IDA5OjA0IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+ID4gU29tZSBpbnN0cnVjdGlvbnMgcmVxdWlyZXMgY2Fub25pY2Fs
IGFkZHJlc3MgbGlrZQ0KPiA+ID4gTUlfQkFUQ0hfQlVGRkVSX1NUQVJUKFVNRHMgbXVzdCBjYWxs
IHhlX2V4ZWMgd2l0aCBhIGNhbm9uaWNhbA0KPiA+ID4gYWRkcmVzcw0KPiA+ID4gZm9yIFhlMisp
Lg0KPiA+ID4gDQo+ID4gPiBTbyBoZXJlIGFkZGluZyBmdW5jdGlvbnMgdG8gY29udmVydCByZWd1
bGFyIGFkZHJlc3MgdG8gY2Fub25pY2FsDQo+ID4gPiBhZGRyZXNzIGFuZCBiYWNrLCB0aGUgZmly
c3QgdXNlciBvZiB0aGlzIGZ1bmN0aW9ucyB3aWxsIGJlIGFkZGVkDQo+ID4gPiBpbiB0aGUgbmV4
dCBwYXRjaGVzLg0KPiA+ID4gDQo+ID4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPg0KPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNl
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jIHwgMTUgKysrKysrKysrKysrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2UuaCB8wqAgMyArKysNCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiBp
bmRleCBhYjQxN2Y0ZjdkMmE3Li5iNGNkY2YxYjIwODFhIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmMNCj4gPiA+IEBAIC03MjcsMyArNzI3LDE4IEBAIHZvaWQgeGVfZGV2aWNl
X21lbV9hY2Nlc3NfcHV0KHN0cnVjdA0KPiA+ID4geGVfZGV2aWNlDQo+ID4gPiAqeGUpDQo+ID4g
PiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4ZSwgcmVmID49IDApOw0KPiA+
ID4gwqB9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGlubGluZSBpbnQgaGlnaGVzdF9hZGRyZXNz
X2JpdF9nZXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiArew0KPiA+ID4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgPiA0OCA/IDU3IDogNDc7DQo+ID4g
DQo+ID4gV2h5IG5vdCBqdXN0IHhlLT5pbmZvLmRtYV9tYXNrX3NpemUgLSAxPw0KPiANCj4gV2Ug
aGF2ZSBwbGF0Zm9ybXMgdGhhdCBzZXQgZG1hX21hc2tfc2l6ZSB0byAzOSwgNDYgYW5kIDUyIGJ1
dCB0aGUNCj4gY2Fub25pY2FsIGFkZHJlc3MgYm91bmRhcmllcyBpcyA0OGJpdCBhbmQgNThiaXQg
Yml0cy4NCg0KaG0uLiBJIGZlZWwgbGlrZSBpdCB3b3VsZCBiZSBtb3JlIGNsZWFyIHRvIGhhdmUg
YSBjYW5vbmljYWwgc2l6ZSB0aGVuDQphbmQgdGhlbiBkbyAoY2Fub25pY2FsX3NpemUgLSAxKS4N
Cg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0K
PiA+IA0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICt1NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6
ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQNCj4gPiA+IGFkZHJlc3MpDQo+ID4gPiAr
ew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHNpZ25fZXh0ZW5kNjQoYWRkcmVzcywNCj4g
PiA+IGhpZ2hlc3RfYWRkcmVzc19iaXRfZ2V0KHhlKSk7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+
ID4gK3U2NCB4ZV9kZXZpY2VfdW5jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgdTY0DQo+ID4gPiBhZGRyZXNzKQ0KPiA+ID4gK3sNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiBhZGRyZXNzICYgR0VOTUFTS19VTEwoaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoeGUpLA0K
PiA+ID4gMCk7DQo+ID4gPiArfQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuaA0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4g
PiA+IGluZGV4IGFmOGFjMmU5ZTI3MDkuLmNlMjBmNmZlNjIxOWEgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ID4gQEAgLTE3NSw0ICsxNzUsNyBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wNCj4gPiA+IHhlX2RldmljZV9oYXNfbWVtaXJxKHN0cnVjdA0KPiA+ID4geGVfZGV2
aWNlICp4ZSkNCj4gPiA+IMKgDQo+ID4gPiDCoHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLCB1NjQgc2l6ZSk7DQo+ID4gPiDCoA0KPiA+ID4gK3U2NCB4ZV9kZXZp
Y2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NA0KPiA+ID4gYWRk
cmVzcyk7DQo+ID4gPiArdTY0IHhlX2RldmljZV91bmNhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLCB1NjQNCj4gPiA+IGFkZHJlc3MpOw0KPiA+ID4gKw0KPiA+ID4gwqAjZW5k
aWYNCj4gPiANCj4gDQoNCg==
