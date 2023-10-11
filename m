Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D36CCD6E77
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADBE10E8F3;
	Wed, 11 Oct 2023 14:42:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175F110E8F3
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697035323; x=1728571323;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/uT/ERwFecmVUG0H4t3Bq8C37V8PdQbZcR/MoszLvd8=;
 b=mc/u5GRP2vxp0/auwkOOudkfDMdgDg1fYa53kd5v87Xyh/sklCjlgxNj
 +rmHwT4m2b+xUYqiMVnxppizZMLZhyAVZ7JuCk3lZFHmqsaUh23rhLmUT
 xldxDWSl5aTIY8Jc93ScP9FCioQIjXbFdiVfh7bLq7CMZPEdKiDpsg75I
 OrHMAK2+J/z4bCAFo5h/+KyfSZm2BommsBTlHXGOlpj0cWue/60e6Rl49
 5wg1i6UgnHyikQbWY8xrXvIBmRr0GTvhJUYZOfjx0skPyXqVF74Rtw9b8
 tD5je0qeF+CGqJRDXdArTdvMWHe4U4klCIUPTZvmdLcndmX5WrgJOpCPp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383545919"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="383545919"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897644083"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="897644083"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 07:40:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:41:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 07:41:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 07:41:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaTtOGZ9Be+S0Q32umKY42btoQWrEpGgJWxhg415t24RQHTqzI7G1EcQ0ma309vvhKz0aIS0+q8Bqg+nbm5VK9Z+mhATmPbc0pDKa1w+2Wq/dxcm1Rbg3LOyArpxNNXSoSalwJErKyJ1gK89kWQQ/sGNUDGgpaajnk2jOw4zAClsTr0H7F7PJPcetJcuy4ypAL0QxuDW6kovi8KP5dGtjGPbA1zHP0W0XhcD0knoTJkocoYswNBBv84A4jrn+w4fd9YlGPWe7RKxY+pKfOXTKohicQOYiykXjsE4l6QzxWPp8H4eYqcfzF0UJN3hz79oIlWR5gw90QuriIW1/p8BuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uT/ERwFecmVUG0H4t3Bq8C37V8PdQbZcR/MoszLvd8=;
 b=Qwn9q12I1TVJ+qLw/TFKD99MQLbb8uprSdLQ8VhxBg/L5Kd3J/1+gWduhdMrB96yt0rP5MQgSCljvKYP4fM+h+CwwQy3Cz52Mx6xVyjDS3y/7JKY5xqa5ARHI6MxZuEN1zAmCNLFR3FlW6KPKqnrkZjK4j3NxR/YlMcIAFyjSQHpe8vEEZNREVenSvbD/VY/C05iGQgnVZvunIL1CTJ8qGKAYHLtmOuOLlQ4bUK6BS0vhJ1zRayF42lORFJJpkcglzDSsWvr9HLibMb5oik7X3L8qdy27e4CzQoXKlNbWPjtTzoDnX35AQHAqxhAe1E/8tgADg0hag5mX8ARuxZYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 14:41:53 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 14:41:53 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [RFC v1 00/17] uAPI Alignment - take 2
Thread-Index: AQHZ/EtLhT9sxcGXFE6c0grUE0wFvLBEqYwA
Date: Wed, 11 Oct 2023 14:41:53 +0000
Message-ID: <d26c7f4a2ad849463bd0ff73ddc22a8a8f75d1e0.camel@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4711:EE_
x-ms-office365-filtering-correlation-id: 5eed8544-0313-4c67-4695-08dbca6835c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ojv17PQGVbA9IWq9NJ71vr8uyI7PMF/awcwl40TZzaJjmSxWRUDOCGRy4JzYnVTCpqpaxTPh5gGrX2hgdThiEJap/Dufegn/Dxm58lm02iOK4LWvN36hHVaHunN7fnXjSPETuSS6o5E/ML+nzESJzGJ6kIZjN6PNsCPUSDMQdIPdO2Lgo3kCj9DlOB+2xYm1LdJQQccU7nOdxP03J0DqLyWWSb+JN3ZiVV2riMQPpXgAaaq0aav3kYo+HMSa1Av1xt5/3IlfIuUGt3VtFj4BKc9faoCd2NtSZvRZpBGHiervgQ1bkgvTPAmMS2rKnqmN8hJnBn1OG/KBkO0BVDYMBQghIgx9Cp9DeOrKOpJlpsM+MWi0WGn/N9ye1SrLj7eBGbiVhCClPxJlp6/aIRJypVKeyr+y5Mnu/15D30fSCdFmP7pQME/t0IFzhPozOn3Tdg4/nGGprP0lov9/hRej+ikgGmMvTpI/hdzPPQbrVyfsVPe2y6lDovLHhUy4MJ587gm93WSUynDrzkiaUQxbElSuqY2YgfhMEzrdjSc670ljSLXuz114M3Of+VPwEkCY3gVXCgdHx7Jxe9YgB7EEboD0Jd3hCzRdC2fFPld78eE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2616005)(83380400001)(26005)(6512007)(38070700005)(5660300002)(82960400001)(66556008)(66476007)(38100700002)(6636002)(316002)(66446008)(64756008)(8936002)(8676002)(122000001)(71200400001)(4001150100001)(2906002)(110136005)(76116006)(66946007)(91956017)(41300700001)(478600001)(6506007)(36756003)(6486002)(966005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGlIOElIbnpxUWpBMHMzLzdyNER1YitMWG5qWWJQRU5NQnBoQ0ZreUJNcVdk?=
 =?utf-8?B?RUppRElhVmEzcHhodWZUZ0VCQWMzN2hvemU2OW12MzRma2plZHBLb1ZmWjNl?=
 =?utf-8?B?TXNFUW9JRXRGMysvb3RUdkpZV3E0cjd5U2dFQUNpQjA1RktCM0pGbTJ4b1lt?=
 =?utf-8?B?TmlIVmJRMzZSdGtLMUdSc2NOYWxqVENlbXBrZG15bWNpdTNwcmkwajl0NGxq?=
 =?utf-8?B?OVZoU2EwZlNJSkdYbElSWnJjdlNoaU1OME5NYW9rYUROM01PbFBJeUpjTkRi?=
 =?utf-8?B?SFhpZFJYVmVFK1pHY3llRUwrUjlvTzI0R3FHT0loUXVPcDRvSFNrVFJsZzdQ?=
 =?utf-8?B?QTN4bE9YNVhoWEdRTlhHbkNXMGJnczVZekRncVlhb3J4M1hvbkxlNE9uRDl5?=
 =?utf-8?B?TExINzFpNXhvWXBXVGlGQ3VORFJZZnM3SVF1VFFsTlJ0RjloeStycGxjakhy?=
 =?utf-8?B?WGhRV25INkcyQTNxODNUYWZURmtscW9JSEtjNjZYSnluUkh6cTJPbDZHU1Vr?=
 =?utf-8?B?S3dvd0dWOHBwUUhHckZId0kyRGgvam5nalhXY21BckV3bW5tTEJMb3hRMVFC?=
 =?utf-8?B?clNCWEx3bXdTdkVaRFZ2bnNkb0svQVlQR1ltQmF2OEV3dVB1cjBiNzBoY29F?=
 =?utf-8?B?b3JZOUJGdkw3QjdJblJsNEgrc0MrQzlvQ1dCSXMvUkp6NE1vTkxVNGpIT0Jv?=
 =?utf-8?B?NFNMRUc3dDF5L0ZtTWpRWWdYVFpWV3IxN1kwWHk4TFJ3RWN6clc1WGpYRzB3?=
 =?utf-8?B?SFFXaWdlNWU4K1pPTDlPcFZrTWhXUkhoUm1DZDdYbUVrRThIRzlFRkwySzhH?=
 =?utf-8?B?SmNlZGxYTEVXN2dzRW5oWSs0SzRzYVYyWng3eGl6QW5zVFYycWV2Kzg1QjA3?=
 =?utf-8?B?Z3RWL2M3Z0JiWEhtK1FMSWJORDU2czVVSy9ZdGtyWTR6Vy9XeUtCUEJUeDAw?=
 =?utf-8?B?WU1QVmF6aFViWms4SHE0aU4vVmkxaHI3MDFuU0taOVNkaUhrbjlwOUY1TjVW?=
 =?utf-8?B?aDRabmlVVWl6NWFuc1VyN1RvL2ZGNjJaSnBSMDZYS3QybGVvcnBuTVpERHhj?=
 =?utf-8?B?bDZyTnUrbG1wa3NBVGpsU3NyaTh2cXJWbStkenh2bzRnSFpoTTZvNWpaSGFy?=
 =?utf-8?B?SjFHQ3FtMzYwS2VySXhkckxUdjdUQWc3clF6WlZnUXkrcUdTY3NCa2ZFM3d0?=
 =?utf-8?B?ZmhpZ2EvbTFGbERUY1Z5NGhsaHlEQnd1OWlBVG9OMnZmNXBrQ0ZjaDhNdmgr?=
 =?utf-8?B?R0ExUXNLdjB0MXN0L1BOZit4ZFBvNDFjeTA1cGFXcEF3RGFXSjFHdEVDWEFv?=
 =?utf-8?B?RXNFWUhuclhhOU51V0JvU3BDZ0pvMXpjYnZnRHpoR2pyOGVuN0tWUnc0L2RY?=
 =?utf-8?B?c0w5SVQxK3ZQTEp0SU40UkZ5K2V3SXYzbitGSUFyWmR3bmNJYzJGWWpFZGUr?=
 =?utf-8?B?aTFrL1pMQ3FMdWwxQTBDMXhVbVVXYVA1YnBqNERMMlJzbmR3WVhVZDI3bEpt?=
 =?utf-8?B?dlRobUZYYktqY29IQjBUeWdIdEg0QWdUeE5IRWM2RnErTE0rcG1ZM0YwaUNu?=
 =?utf-8?B?cGh2cTVjL1FCVnBwdzVsbHB1U0pLTVAva1dpUWhUTG02aStjQTFXTmZuSnpF?=
 =?utf-8?B?cmYxdUlFblNoOFVTcEpxdmJMMUwrZnc5cDhETWlRZjZ2T3I4amlSSHh0NytK?=
 =?utf-8?B?VmlHY1UxRnZRRmRac0dQNkpFeHdQZlQyTE05SmRZNFY5QWYzbmhqSHVOQ1Av?=
 =?utf-8?B?WmloeENqdHFqamdhcnl4RzZhUmh3V2VzYjhxT3EwbDlDcGRobDhuajJNTURn?=
 =?utf-8?B?MVN4KzFMeEpaaTRHeTVuQUlxQ3lDdTJIVkR4MzFMQ3hmZEdmMm03MllHWHo2?=
 =?utf-8?B?YTlJRys3R3NRWFExcWttVUhCZzdGWDNnck1tTTVibVlsZ0RQZ09KTGVZai96?=
 =?utf-8?B?V0xhSkVkcGNYdTY5YmZEdEp3bDJLcVNtSzA3MDh3ejIyU1pUbXFZR3NQZGJW?=
 =?utf-8?B?KytTYVcvcjdFNVZnb0VHQUdFcklzdytCK2xKQzFOYUwrVzk4QitCTU5qa0pQ?=
 =?utf-8?B?bkhVdXVSTUxwMyt3RG92cTZQMnFYcSs3Ly9VdlBCY3FEUnVRQTBtTGx6Witu?=
 =?utf-8?B?cnZ3ejhBV2szQ2p5VjNDT0lyMUJyY2J1S2FWL1FrTXhCTEdCM05oN1FYdzIz?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <474F7C337AF23C4189BD2A91F11765E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eed8544-0313-4c67-4695-08dbca6835c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 14:41:53.0351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqmH3e2cJTLkobALKFVA/UQKpPUUdMVP/c1fSssU4MW4lJreKdkaPLLOL6T49kZFeZaU/W/3Vx0Wv7wB0AZgMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 00/17] uAPI Alignment - take 2
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

T24gV2VkLCAyMDIzLTEwLTExIGF0IDEzOjU5ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoaXMgaXMgdGhlIHNlY29uZCB0YWtlIG9mIHVBUEkgdXBkYXRlcyB0aGF0IHdvdWxkIGxl
YWQgdG8NCj4gYnJlYWthZ2UgaW4gdGhlIGNvbXBhdGliaWxpdHksIHdoaWNoIGl0IGlzIG5vdCBh
Y2NlcHRhYmxlIGFmdGVyDQo+IHdlIGFyZSBtZXJnZWQgdXBzdHJlYW0uIFNvLCBsZXQncyBicmVh
ayBpdCBiZWZvcmUgaXQgaXMgdG9vIGxhdGUsDQo+IGFuZCBzdGFydCB1cHN0cmVhbWluZyBhIGdv
b2QsIHJlbGlhYmxlIGFuZCBjbGVhbiB1YXBpLg0KPiANCj4gVGhpcyBzZXJpZXMgaXMgbm90IGNv
bXBsZXRlIHlldCBidXQgaXQgaXMgc2VudCBmb3IgZWFybHkgcmV2aWV3DQo+IGFzIHNvbWUgcGF0
Y2hlcyBhcmUgYWxyZWFkeSBhIGZldyB3ZWVrcyBvbGQuDQo+IA0KPiBJdCBzZXJpZXMgaXMgaW50
ZW5kZWQgdG8gYmUgYXBwbGllZCBhZnRlciB0YWtlIDEgWzFdIHdoaWNoIGlzIG5vdA0KPiBtZXJn
ZWQgeWV0LCBzbyBpdCB3aWxsIGJyZWFrIENJLg0KDQpMR1RNIHRvIG1lIGluIGdlbmVyYWwuDQpB
Y2sgZnJvbSBNZXNhIHNpZGUuDQoNCj4gDQo+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzEyNDcxMC8NCj4gDQo+IEZyYW5jb2lzIER1Z2FzdCAoMTApOg0KPiAg
IGZpeHVwISBkcm0veGU6IENvcnJlbGF0ZSBlbmdpbmUgYW5kIGNwdSB0aW1lc3RhbXBzIHdpdGgg
YmV0dGVyDQo+ICAgICBhY2N1cmFjeQ0KPiAgIGRybS94ZS91YXBpOiBBZGQgZG9jdW1lbnRhdGlv
biBmb3IgcXVlcnkNCj4gICBkcm0veGUvdWFwaTogRG9jdW1lbnQgRFJNX1hFX0RFVklDRV9RVUVS
WV9IV0NPTkZJRw0KPiAgIGRybS94ZTogRXh0ZW5kIHVBUEkgdG8gcXVlcnkgSHVDIG1pY3JvLWNv
bnRyb2xlciBmaXJtd2FyZSB2ZXJzaW9uDQo+ICAgZHJtL3hlOiBSZW1vdmUgdXNlbGVzcyBxdWVy
eSBjb25maWcgbnVtX3BhcmFtcw0KPiAgIGRybS94ZS91YXBpOiBBZGQgbWlzc2luZyBEUk1fIHBy
ZWZpeCBpbiB1QVBJIGNvbnN0YW50cw0KPiAgIGRybS94ZS91YXBpOiBBZGQgX0ZMQUcgdG8gdUFQ
SSBjb25zdGFudHMgdXNhYmxlIGZvciBmbGFncw0KPiAgIGZpeHVwISBkcm0veGU6IEFkZCB1QVBJ
IHRvIHF1ZXJ5IG1pY3JvLWNvbnRyb2xlciBmaXJtd2FyZSB2ZXJzaW9uDQo+ICAgZHJtL3hlL3Vh
cGk6IE1ha2UgY29uc3RhbnQgY29tbWVudHMgdmlzaWJsZSBpbiBrZXJuZWwgZG9jDQo+ICAgZHJt
L3hlL3VhcGk6IFJlbW92ZSB1bnVzZWQgaW5hY2Nlc3NpYmxlIG1lbW9yeSByZWdpb24NCj4gDQo+
IEpvc8OpIFJvYmVydG8gZGUgU291emEgKDEpOg0KPiAgIGRybS94ZTogQWRkIHVBUEkgdG8gcXVl
cnkgbWljcm8tY29udHJvbGVyIGZpcm13YXJlIHZlcnNpb24NCj4gDQo+IE1pa2EgS3VvcHBhbGEg
KDEpOg0KPiAgIGRybS94ZTogRXh0ZW5kIGRybV94ZV92bV9iaW5kX29wDQo+IA0KPiBSb2RyaWdv
IFZpdmkgKDQpOg0KPiAgIGRybS94ZS91YXBpOiBSZW1vdmUgR1RfVFlQRV9SRU1PVEUNCj4gICBk
cm0veGUvdWFwaTogS2lsbCBWTV9NQURWSVNFIElPQ1RMDQo+ICAgZHJtL3hlL3VhcGk6IFNlcGFy
YXRlIGJvX2NyZWF0ZSBwbGFjZW1lbnQgZnJvbSBmbGFncw0KPiAgIGRybS94ZS91YXBpOiBCZSBt
b3JlIHNwZWNpZmljIGFyb3VuZCBHdUMgVmVyc2lvbiBUeXBlDQo+IA0KPiBVbWVzaCBOZXJsaWdl
IFJhbWFwcGEgKDEpOg0KPiAgIGZpeHVwISBkcm0veGU6IENvcnJlbGF0ZSBlbmdpbmUgYW5kIGNw
dSB0aW1lc3RhbXBzIHdpdGggYmV0dGVyDQo+ICAgICBhY2N1cmFjeQ0KPiANCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSAtDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYyAgICAgICAgICAgICAgfCAgMjcgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ib190eXBlcy5oICAgICAgICB8ICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmMgICAgICAgICAgfCAgIDggKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVj
X3F1ZXVlLmMgICAgICB8ICAyMCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgICAg
ICAgICAgICAgIHwgICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcG11LmMgICAgICAg
ICAgICAgfCAgMjAgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jICAgICAgICAg
ICB8ICA5NSArKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5bmMuYyAgICAgICAgICAg
IHwgIDE2ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgICAgfCAg
ODYgKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9kb2MuaCAgICAgICAgICB8ICAx
NCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYyAgICAgIHwgMjk5IC0t
LS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuaCAgICAg
IHwgIDE1IC0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0X3VzZXJfZmVuY2UuYyB8ICAx
MCArLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgICAgICAgICAgIHwgNDc4ICsr
KysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMTUgZmlsZXMgY2hhbmdlZCwgNDM1IGluc2VydGlv
bnMoKyksIDY1OSBkZWxldGlvbnMoLSkNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuaA0KPiANCg0K
