Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63331CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 21:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2D10E7A9;
	Wed,  3 Apr 2024 21:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnpTO3d2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78B010E7A9
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712178157; x=1743714157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jZTCGX7/ORCuW9bUEkJqgTsmv+QY2ILwm70MfZESKPw=;
 b=LnpTO3d2Kx8agca6U5aWBrDvbyDUYtvei8I2Nu2yDtbViGnoF3jKeVb2
 K+HSPsUJwg5F4SrJwNRnee2NYFpRderBwWRAHuW3DFWrx4IzqIUibyJWK
 +V0yiMXroFwWzFH3gQUXlj8+L8B/dVTkaRz8GkYQFtbuzIX68LfoIXcdj
 bBeWyQStItAeJnBiDV1Rt0mjhk/L/f/HV/xp9o591rhKSPgV80p2mId7J
 kgY/f18JZvmz0wwCmFeif3y+eDp8UGn2yViQRqYVu+yLmZV5BZAY+Gbz+
 +OX5gMAnXSB3KMUeyci9ehKlqqtsRhrsOnCYYGS8T4AM3fHKaBV56TVQu w==;
X-CSE-ConnectionGUID: L1LxXDJ3SPyaPR357mQl/w==
X-CSE-MsgGUID: vouKfgnYSLSZHpOA1AsJ4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7340781"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7340781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 14:02:36 -0700
X-CSE-ConnectionGUID: klgveHOSRYak+098ce5WYw==
X-CSE-MsgGUID: g34p8d4+QnCjBSEGy5RqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18649231"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 14:02:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 14:02:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 14:02:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 14:02:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 14:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNhs8iSHtNw5TRyJ1GM3JZmy4cQfwZwMYGvNH3t3oSnG5NRkGuagutokXzswnER4/bvC0QA/8t0QRgwPXO4WZ9nDH9uQBc/r9kgl6cMbPccCa9MswaX22tSH5fgPelamtqifleJ5yq2AbB+1EiHPj+iCun9BUDOzbfq2I+b6jD1v51fo6M2wj/WpXTefAz3RziqZbOANTP5IcaQhobMTFx3Hu9VRjdX0mazcvGV7rK6yok7CB57cpDXlTyd70Nli+6qbFdijD/r2+Bt+9lGwyYWGQyHU0ieRCU+qtRRtg4l+wLdzKU7ZnUfi/uWNF6J4MtIkQKVZCLumZaNdrgY4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZTCGX7/ORCuW9bUEkJqgTsmv+QY2ILwm70MfZESKPw=;
 b=QOoOKbHiPd5w4kcR5oqjO+L2I/0ETMPDu5B5h9KbUcVPYlEKcR06M69dTDY/qQb8FAurmcMSjww/qwZwrFyoOuIFRGw5r0KNZI5Tttisw6AiNO0zH9OKhkdyu+zCOpGjhCbXvqEy46H608xV2HoMK7rLpQ9tFFdc7njFjfzd/ZTnRMiQlZcijrYqU28F8SuWDidN+Ul22XhyP4IE70ozJtskteFBKSywkuXDUxUf7QbRHWTvVNQQ/2FvOmLiTVIhMDmDcwBnrTqZfmSDQRLDZ4+d3RxFYMyXxae4er1XKwB0RtpCUcdE1oOj+3ufyWE3xuENH90iciB+rzXo46IJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB6373.namprd11.prod.outlook.com (2603:10b6:8:cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 21:02:32 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.031; Wed, 3 Apr 2024
 21:02:32 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe: Protect devcoredump access after unbind
Thread-Topic: [PATCH] drm/xe: Protect devcoredump access after unbind
Thread-Index: AQHahgA7TBHcyTEYGkmGkRALn43KPbFXCHgA
Date: Wed, 3 Apr 2024 21:02:31 +0000
Message-ID: <398e4106a286c2a2c53d996164e7c7df97e7210b.camel@intel.com>
References: <20240403195044.239766-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240403195044.239766-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB6373:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LuDVqSZ7Ok5eCwIrdVBaZ9e4Ve3LR+nCBBN1KBxVmlA0soqSyOlQeiW40rLCmbKPn3xiY+JM7ulVHIDdFsyMcyMNuMMvdyICVtKV6tQxAzqayelOBAcoBGxH7SNce236A5JWLo65/1+cTnsnnZefkQIQ+Cu5oXFEkfQy8oSGsAC6YAQ3YtNs1Kk9dBn2Cqw5fp/N6Y2Iv3sV28+sBLT606KN0TqqnkZd/iqHUZMrdhhnFRbixJKGQI4fb5P1aHpay91dxzu+9iVfd4KmTrkfPyr7rYxysj++3bBlGqZoZfwcvvMm1QvUatJSZ8Rv8u9b6A2JbjJq+hi1Kc5CXV6HN5V4ajLq7g043qRmwQPyXkNhol/0/3PaTBeo5W/i4HKeoJE/ev0PL7ChdDdhsttL2JZmTwwQuGBjU1sTV1cLEMOsZDx6h/0HjeW/eRU9AZrvUbnaczU4ezaabbxlgWQF8vouEzrF5Q9DWEsZ/khcuEpzOx8zEH1HYRd82nZfX0NXaTOPGHl5UqM7sMEfwUtpAjYzntwrcgRMI2nKaX+g99Ep4kRy7jq9ZeBQxKBq9YMYLKyAXyGD701ia5HxEaKJuZ0jg5J2gl4AYO1XVrD2xnv6u+3Pk4tHf2lJ3cW1IAMIcHB8oJcs0ywKGDre86Om0pJyU0cKIWGPcImt2w3lmXM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmxYWWJrNTY0QnpJZ1UyZDNxTExaV3VhRjBhWjNqNGZWT0hrQUVRNS9lRlNo?=
 =?utf-8?B?eFFhdFRNSlljYnl2MGc4VjFTMVh6RTNKWWpSNHhKc3o2RDM2QlB3dzNvM296?=
 =?utf-8?B?UkxWZ0dkdUhoVlp4akRHODVTeUh5MXRPSStuWXNOaUJsUTIwaTMyWnAyRXoz?=
 =?utf-8?B?WnJHYkIyenlSbCtyWjVoMXA3azB2ZHZRbTRBeEJZMHhjVFYzWXh6ZG5mZjNn?=
 =?utf-8?B?SkxFK1pOQjNoSEhqeDdkWTNnRXhGL3BtekFEdlp5QW5SdXJrdVBUZmZSc0JF?=
 =?utf-8?B?bmZKZnFaTFRyUDJRRUF2L1lFMFc5SXJlbGZkWlNqd1VxRENvR29WMUQvVCto?=
 =?utf-8?B?OXVSWmNFR0lvWnV2bGRsOFpXMVhqUStKTmhKNlprV1V3YkRQa3FOclUvRDdq?=
 =?utf-8?B?cHdzNVVrSyt6cWQzTS9acTJ4czBHT1YyMmFleXB6WHFtV0d1cFF6YzdjMWFl?=
 =?utf-8?B?SWdaYkpwNG45V2tFcTNJcko2L3FEQkdmNjMrblNEK3N0cytxSnplN2FkNDhO?=
 =?utf-8?B?aE10cGU1WnNYdzQ1SDZsNm16ckJ6bWY2d05XMitWWkE3Vk9vb1NKbWl5c0Fx?=
 =?utf-8?B?VWtLL1dPUE41NHZqYy95YmtqbnRKeW1LbWsxd1VESTRCaFdNbG5Kamg0MXdm?=
 =?utf-8?B?eFlJTUYrRFVJWkpNRHZjdUp2WEdyNlUwcUs4UXdrSGhLdjFsVlZWM2RqSFE3?=
 =?utf-8?B?L1RRWWExRVY4Z0Z6M1N0aDVoQnVuS29ZeHhsem5mckJ5WkRUZFV6SGFwbHo4?=
 =?utf-8?B?dTVuOSsvK0ZKN0l6OHZla2pDNjJpQi9lQkRyYjJ4UXlJb1BWcjdjYmRnODdr?=
 =?utf-8?B?NE84SHZFSEVFK05haXJadVlid29PWHptR3M4ajIxQTBWbDZYcU5sZEM5V2No?=
 =?utf-8?B?a1BvSnlkQjZJTjJxbkJ6ejErSFhqSjZ0c20wZ1U1ZmppU0QybGx6Vmc2am5l?=
 =?utf-8?B?c01VL3ZTMzRUNmFySU1mM3JKbHIyZEg2cjVlMUtVWVAzREc4S1ROOXRLOEpQ?=
 =?utf-8?B?a05IL25qUks5OGNUY1EyUmplTHRuaEFCMEpNUHZ6WWJXWU9IVG1xa1p1NWFK?=
 =?utf-8?B?R05XTFM5VXZVcUtFckVxU0kxNXhqS2h0aWFwWmJPTWRwS2JVSy9KeHIraTNa?=
 =?utf-8?B?M3E0SjcwdnFXU2xsa09rcFpKaUgxQlh1bWdkZ3JTUktqYmVkMGZqZkkvYmM5?=
 =?utf-8?B?NmhHK09oSXlHZDBaajVqQjFSVi9yRTJlOGN6OER2aXIrZ2h3UTY2aU1hSys2?=
 =?utf-8?B?QVArVnpKb3VvNVBodlJ5TER3UkxYNXFmbFRRd0UrcVlaaUQ4YitLMjRUazlV?=
 =?utf-8?B?eHZybVhaY0c2OVNVUmhhMTAwakJOcnQ5bXhaMUY2cmRFN3dHM1R3ZW5wcFBI?=
 =?utf-8?B?NXlkeC93T25RMTltd3VtanhySW9NRU9kakZiMThnUmVFVzcxYlk2TnQ1cjBt?=
 =?utf-8?B?VnhEckV3dlJnSCs0T3BqQVFhK3lmczlKNFo5UE9qZnhSVEJWM1ZDb0ZzUG9n?=
 =?utf-8?B?dWtJUmRsUmNLRDBaTVVSQy9ITitldmd6cTFoYVc4QXE5L1lCRlZ6Vk9yZUU3?=
 =?utf-8?B?QWl4eGNJUXFyeUJTdWpxa3FZTXRvVW9hSllHaUNaMWhya0Y3VjZjanJrRDRk?=
 =?utf-8?B?VVZISFE1SnV6Nmo5amtKdnpQUHlxTHFBMGQ2WDVoczBRNndPU2dNY2hBZWph?=
 =?utf-8?B?V1lRKzV3aVhpcDVuZDFtdkJSVGFON1J1TjF1NG1kaVBHLzVyZURCRkVrUkdZ?=
 =?utf-8?B?dVN1eFJ5YjBiTVlPQUJCRU9YRVZsQm1USndlODV3RGUzRXpEK3FzQ3NwNFRy?=
 =?utf-8?B?Nkk5SXJHZnoyOE10Wi9tWU12aUR0QnYyL1lJdTNTRzFXb3ErUVhNRXdkaEVk?=
 =?utf-8?B?WXg3WE5DaERtbkhGREFBaWdUbFdtQUxNcTFncTdTenhqTWNDRlBrY2ZueGVa?=
 =?utf-8?B?cVZIYUdSQ28vMWs3VlQwVGhyaytVQUF2YXdkbDVtVGlxUEUxa1lDU0Z5TzF2?=
 =?utf-8?B?QmRRSFVKTVJOV2x3OGRNM2J4V3RNdHJhb1pRTGlPTmRyMnZDbDNGb1ozY2Zs?=
 =?utf-8?B?aVVwTGJzajhtcG9kV0RxbDMzMXR4SXhwNS96TUl3cEtjckMvTkxCWHd4bWpO?=
 =?utf-8?B?TXhDeHhmNFlVUjNNUkk0cUxTdXdtazF3WEFTTnROcjdHdWUrODNvdjAzaHl2?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC487487AA37FE40A979C28DF4D896F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4553bdc4-6120-48b0-f38d-08dc5421611a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 21:02:31.9384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9UW+pqkemksIo39crPud36evxsmRaHqHgahfQpxZRfjMO/Yod7lpR1SZ7lBCH+I4RBvsJjLXKe/aW7Gm0StDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6373
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

T24gV2VkLCAyMDI0LTA0LTAzIGF0IDE1OjUwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFdoaWxlIHdlIGRvbid0IGhhdmUgdGhlIGZ1bGwgZmxvdyBwcm90ZWN0aW9uIHdoZW4gZGV2Y29y
ZWR1bXANCj4gaXMgYWNjZXNzZWQgYWZ0ZXIgZGV2aWNlIHVuYmluZC4gTGV0J3MgYXQgbGVhc3Qg
Zm9yIG5vdw0KPiBwcm90ZWN0IGFnYWluc3QgbnVsbCBkZXJlZmVyZW5jZToNCj4gDQo+IFsgIDQy
Mi43NjY1MDhdIEtBU0FOOiBudWxsLXB0ci1kZXJlZiBpbiByYW5nZSBbMHgwMDAwMDAwMDAwMDAw
MDAwLTB4MDAwMDAwMDAwMDAwMDAwN10NCj4gWyAgNDIzLjExOTU4NF0gUklQOiAwMDEwOnhlX3Zt
X3NuYXBzaG90X2ZyZWUrMHgzMC8weDE4MCBbeGVdDQo+IA0KPiBXaGlsZSBhdCBpdCwgSSBhbHNv
IGZpeGVkIGEgbm9uLXN0YW5kYXJkIGNvZGUtZGVjbGFyYXRpb24gYmxvY2sNCj4gb24gdGhlIHNp
bWlsYXIgZnVuY3Rpb24gb2YgeGVfZ3VjX3N1Ym1pdC4NCj4gDQo+IHYyOiAtIFVzZSBJU19FUlJf
T1JfTlVMTCAoTmlybW95KQ0KPiAgICAgLSBFeHBhbmQgdG8gb3RoZXIgZnVuY3Rpb25zDQo+IA0K
DQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+DQoNCj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
Pg0KPiBDYzogTmlybW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYyAgICAgICAgIHwgNiArKystLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1p
dC5jDQo+IGluZGV4IGY0MmYxYjU2NzA2Ny4uNmUzMmY5Y2U0ZWI1IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTE5NjEsNiArMTk2MSw3IEBAIHhlX2d1Y19leGVj
X3F1ZXVlX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25h
cHNob3QgKnNuYXBzDQo+ICB2b2lkIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2ZyZWUoc3Ry
dWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9zbmFwc2hvdCAqc25hcHNob3QpDQo+ICB7DQo+
ICAJaW50IGk7DQo+ICsNCj4gIAlpZiAoIXNuYXBzaG90KQ0KPiAgCQlyZXR1cm47DQo+ICANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtLmMNCj4gaW5kZXggZjRiZmIyNzA1OTU2Li4yYTQzMTY5MGQyNDUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jDQo+IEBAIC0zNDI2LDcgKzM0MjYsNyBAQCBzdHJ1Y3QgeGVfdm1fc25hcHNo
b3QgKnhlX3ZtX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX3ZtICp2bSkNCj4gIA0KPiAgdm9p
ZCB4ZV92bV9zbmFwc2hvdF9jYXB0dXJlX2RlbGF5ZWQoc3RydWN0IHhlX3ZtX3NuYXBzaG90ICpz
bmFwKQ0KPiAgew0KPiAtCWlmIChJU19FUlIoc25hcCkpDQo+ICsJaWYgKElTX0VSUl9PUl9OVUxM
KHNuYXApKQ0KPiAgCQlyZXR1cm47DQo+ICANCj4gIAlmb3IgKGludCBpID0gMDsgaSA8IHNuYXAt
Pm51bV9zbmFwczsgaSsrKSB7DQo+IEBAIC0zNDgzLDcgKzM0ODMsNyBAQCB2b2lkIHhlX3ZtX3Nu
YXBzaG90X3ByaW50KHN0cnVjdCB4ZV92bV9zbmFwc2hvdCAqc25hcCwgc3RydWN0IGRybV9wcmlu
dGVyICpwKQ0KPiAgew0KPiAgCXVuc2lnbmVkIGxvbmcgaSwgajsNCj4gIA0KPiAtCWlmIChJU19F
UlIoc25hcCkpIHsNCj4gKwlpZiAoSVNfRVJSX09SX05VTEwoc25hcCkpIHsNCj4gIAkJZHJtX3By
aW50ZihwLCAiWzBdLmVycm9yOiAlbGlcbiIsIFBUUl9FUlIoc25hcCkpOw0KPiAgCQlyZXR1cm47
DQo+ICAJfQ0KPiBAQCAtMzUxNCw3ICszNTE0LDcgQEAgdm9pZCB4ZV92bV9zbmFwc2hvdF9mcmVl
KHN0cnVjdCB4ZV92bV9zbmFwc2hvdCAqc25hcCkNCj4gIHsNCj4gIAl1bnNpZ25lZCBsb25nIGk7
DQo+ICANCj4gLQlpZiAoSVNfRVJSKHNuYXApKQ0KPiArCWlmIChJU19FUlJfT1JfTlVMTChzbmFw
KSkNCj4gIAkJcmV0dXJuOw0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8IHNuYXAtPm51bV9zbmFw
czsgaSsrKSB7DQoNCg==
