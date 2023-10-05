Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC28E9270D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B039B10E167;
	Thu,  5 Oct 2023 15:38:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A79D10E02B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696520324; x=1728056324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WttK1TEM5/1B6Rsxt1p0Od4+aFgXKuBbumT3kS3TMCA=;
 b=n9BnHXA+DFTZV7xcNXR9GvVaNEYPmLA1mNE+ztIys9JSloSIPKE323t5
 1L69M06PU7aMf8GHQbSDWTTEEvpddmaSWJmPZOTVvrqXEC8Y6pWyRl0Mb
 gMXHB0jvbisIOwYUsFBoINtZ5+cvbDRLNVKYm3da9xMOv9oRWkF/dcoJE
 zdeZaQPI8cuoZP8b/Plb4etxlOEKfwfdcIdunPf97+gIOdgOT9KwkbREv
 PGeUiQesk+pVT5vGjExF0I+ev67ddwD9vT8zxBfV0srEV6nLKA1YAWqVX
 0JbgShNOUblNFUpRPBsSNfgxvbJQct1G7BGizY/vQx7qDLhx7Ek6QC9q3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380811077"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="380811077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875591095"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="875591095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:38:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:38:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:38:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNl864yuRtIK23y1YFRnL2zC+3jRnfCuEJ/l4/zfWtGtaMrrBeypNocNFi0ybAuPyGwc+sAuu6n/j6ZeRY4KgeNggEUmLpoEeqMKjkrU1FoBdSt3A4tax+ds6OgJ24Tohg4f716DMXovIa5kmB4unayTSjIzVLbuOiu/9W17hKL5rlupIqznfh5A/dUTO3cW19whg9J/zv4rYOZUA3PLuneeirxAxLI0MQ1MgLPJ1vUh/VTBje43H4WN3mpXsDdYOBxUj8Nnf8PLCb3FHvCJg0xAM8wLynDgmbJ3J6IzziQfVLSBTDjAfvJN+Smghka3vSqPyZA++fqdKbO7Rc6Ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WttK1TEM5/1B6Rsxt1p0Od4+aFgXKuBbumT3kS3TMCA=;
 b=SuZ6sO5xUkY99+1ZWqmasXW9hdUGofjCanqAFs6kWvmVsMEmg0PW7fsn9psMgYJ9UOWO49MoAYD3U6IXliS1kema+1rp2L2X9ZShaK/nYlz5kCIQdp/ZcAHy3N2Q6ndGnKiAy9RB1kqYNFwKQrgkYoHx0gufwfn7a9eQO52VROjz1oHi6X98I/xzKrO7wOg7YI0r+Xh3GFw9BpiQbsVrMC2iU62c4BcS2SnY6Gf3cYkwxXfnJpibZ+k9Wvq+ZFnHyk5+QXLz/TlXEqusG8Z98WDiMQ8N5Bg6+xIK+BbjlxnJdHZUSu0+eIvjh1yatXsOg42RpMbqNmkKphFzALIzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Thu, 5 Oct
 2023 15:38:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::b0d1:9c31:5561:496]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::b0d1:9c31:5561:496%5]) with mapi id 15.20.6838.016; Thu, 5 Oct 2023
 15:38:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
Thread-Index: AQHZ8L9kxUyrUquO5Ee69XE+HZNLSrA5rl0AgAG0BoA=
Date: Thu, 5 Oct 2023 15:38:10 +0000
Message-ID: <4c1b54f514d3303c1436e66bf278fc16d5ad7e41.camel@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
 <ZR1qnvcWDY40i0vD@intel.com>
In-Reply-To: <ZR1qnvcWDY40i0vD@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB7055:EE_
x-ms-office365-filtering-correlation-id: a22d2af1-2dfe-4a73-04d1-08dbc5b9145d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UC35Ug28riNilD63zNJH+d9eLtdl49kzRZUVyby5tW/Z7tp5U8wgBoEkxCRInHJVJ18Yje5Ue20XmzplCWKTxSWbyAiaiozpBaiypLhLEd0zVOk2vQH/m+QqZxOreHYztULKDhGDCi0fPYKG02oDyq7kJ19TXVYGkoGHUlu2aGvJjbKNbi6L8hV4HMMLh6xFhKl/gq93KV8A+uCnSIrnT+ZBa4EYqyK0ndRirVZnMdnqGFjblrZ53mXiPU6OcWvjFL4U8alvB0R3hqAbryfISw+h3tckhSO1p0JNqDryzjVuuqps3z/jpFHtSqvGNTwMUA3DPLhqsySaiV9pJkPWmxIYG7/pFw2yKsjGhY9i4m7gIHdOoop+8s4zrn2IV+F/5PiMu4gmCqF2jq0McmERvaBIt84cFEBLutrolLN6HnqGS2oXo8lkAm8XU3L6p0b+kPAeoV0lFz3gr0i6Je3WOP0ISjG9wy0XsZN3XJy8V0ImON7+Lej/G2WH9dFgteu6mbJIrdRbhN5Kv20Pd2epQigNfxe3cSE7/gBwkAotkr18wggkQe28tCbDuFa5P1gx8RBRdo6ClYNks9Z0nKAFt4aIoDn9ThWvIWaF3EFQwvhteXJpUyhGHS9idcoZcnUN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66476007)(66556008)(66446008)(66946007)(316002)(37006003)(6636002)(64756008)(41300700001)(2616005)(6512007)(26005)(71200400001)(6506007)(36756003)(6486002)(478600001)(38100700002)(82960400001)(38070700005)(122000001)(86362001)(83380400001)(91956017)(76116006)(2906002)(8676002)(6862004)(4326008)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1RZcys4VUhzVXRMcVg5WnZoeWs3alI1Q3VtaExQUVFWZ25NeUg2TzhxbzZH?=
 =?utf-8?B?OGxNOW9UM1dhTTJONGJMVUpVbkJXMDNmSTRLWjJDdUkwa1dZS0V1TUl0aEl1?=
 =?utf-8?B?RGVHRXJVaUY4RXkyV0Q2RVE3OVZZSWFFbkIxS2pPYXZaMVVSaVlnaVdoZ1Ir?=
 =?utf-8?B?RWtjMy9Mc0hrMXRmMEZjREJxc2pMVXJvWEtvMmlpa1RLRjhPTDhrNngzSkhT?=
 =?utf-8?B?K2dTS2RoN1hFZnNOV2UrQkdLK1RPditDd2VzTExDN0FFblNuMkFxR01vWjJZ?=
 =?utf-8?B?Q2xhYjU3WE1lTmpFUHFLNytvaUpzclVEOXNkTmN6TzV3bEQ2SW5SeVNXZ0FM?=
 =?utf-8?B?TjBUKzhiVnBDaE1heHZ1SUNLNjZOcEgrNHNkd1NoTlhBV0JwM09ZMHM2L1ps?=
 =?utf-8?B?S1pUbHp1OG13bkVObEx3dVFySThwNzY5Y3hkbHlzZlgwS1hxQ0VWUmFRbzFq?=
 =?utf-8?B?NElUdkRtRHhnQnhadDdtdHgyRlVJdG5IbGNoMzVsMGQ5MEpodDdTWHJKcERP?=
 =?utf-8?B?VjV0dTR6amtCUDJ4V1NYMERvak9hOWs5THF1YldzekNlNkcrbkZVWVhPZUpB?=
 =?utf-8?B?QzEwUUJGa0JzN1NEQzJvbmpZcVcvejVuODNKS2RUcnlrWll5T29QVW9tUUZL?=
 =?utf-8?B?bGUzd29RVzVEUnJ4b1RLZG5IcWYxNGNwVjA5aWtHLzhvdy94ZnoxOGRST2o4?=
 =?utf-8?B?Ylk0aXVQclkrbDd3WC9rSFRKWkEzMW1MMExrZWxvZGFtRnVmRytBdis1R2tX?=
 =?utf-8?B?bWxkVW10enVVaEpWeG8yeEFnUzdGbWp1K2RSMGlGMDhRUHJkSzBXem4xV3lj?=
 =?utf-8?B?YzZPV2tLT2dCOGdsRGVOM2hTWEhrTjhENmpTYU1HOE13YXZ5M3oxUExtUGd3?=
 =?utf-8?B?UTBaZU10by9RbSsrNk9FTjhJSDlyZDhBWVF0aHlmak1IWVV1WHRwbkdhQUZz?=
 =?utf-8?B?cjBYN2lDZ3lGS1k1c08vRk83NkxXRjJGQVovbTlsUlhlVUN6RlV0eW03M0Y2?=
 =?utf-8?B?a05tMC9LRTczUUQvMDByVDhHRk5RSEIycDRJR0pQUGEwd0NKdTF6YnB3b3hV?=
 =?utf-8?B?NFQrZlJOclFqNjVRdE9Yb2J2WEpOZnpJOWV6MDh4aTRSdFg1R21jeHBnS1d1?=
 =?utf-8?B?ak5IWlo0NThOd0F4aWZ2RHVWbkNKekowa3dLOWZ0QmFGRE02d0x2VzBiUnlU?=
 =?utf-8?B?TXVGUkdnTGdMTjdMTmYxbHkyU1lTOSt4M3RTc0xCZVVVZVBvWTVIVStVRkJY?=
 =?utf-8?B?U0ErcmtBT0lnVzNCT3RHbURFVnBnOERMRForelFXT09YZGVnVWVrNW9NaHVV?=
 =?utf-8?B?eU9IaVd0clY0Nk1hRUorOUdocG9NVkNOWCtzNENaUWN2Y2pPcHU5VTFJU2Iz?=
 =?utf-8?B?cXdEdWYrY3MyaUtBd1F1c2k1SDhRQ1lUYnU4Q21ZYm1XNklNb3pTNExzemYy?=
 =?utf-8?B?eWlUWXhEMHgxeUhMUzErL2dFbzlGZ29zZGdFcGcwbFlaNEo0dXFKbE82Q0xW?=
 =?utf-8?B?NUlRTndkT0F4RHpPc1ZQRjZFMkhGUWFNWEtsVmZkVkZuTFBGTkIwYXg3Yjh1?=
 =?utf-8?B?d3E2NXZoSHhINkZXVlo5SkxLclFoYWdGNlk5L003Nnh0VG5pNHU4elBFVjlE?=
 =?utf-8?B?NGlQdjZoUXJqemJVa1I4Y3d6QmJYVTZ6NVVMdENFbmlZTFAvMGJiZU91S3pE?=
 =?utf-8?B?eVptRmhqb0gxb3NtWE1SMjdGV291VzZlZE1kNVd4c0dSQjlINHJ2Vm9LbDZX?=
 =?utf-8?B?Z1BJZU5mUnREcm16WDRlNTBmNjl4Y0lXQzJRRzRPWmdZUEJnTTVHQXR0ZHhH?=
 =?utf-8?B?OStiYUF6N3J3eFd1U1RnMDc1K2ZTL0JMOEtNUURDN09yTVlrZ1ZqRzNiYmhO?=
 =?utf-8?B?eTl2TG8vM1NXSU1KQ2h1NUFYczFJUHY1MUhHTElMTnN4ekdrQ24rT0d4MnRi?=
 =?utf-8?B?cVZ3aVp3WlRjcWFYM2k5UUR5a041UCtsTU9oakEvTDFZSktVcHZobitmRFZv?=
 =?utf-8?B?dENtYVNXSWoxVDJveUdPNGd2YktaMWU0ejhFdW1yVmdsdHpQNHM5TDdwSU1O?=
 =?utf-8?B?WjY2aDFlV3gvR0IraUE3ZllLSi9mQTZHRjFlODNKd1M1RXF0cWRUWEhBQk9r?=
 =?utf-8?B?YUY0ZG1mZlo1QmMyZWlnZUlHbE1HN09hY0pBUjBhNlI5U1ZOQWNoakZVcXla?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CA88784F5849F4B8CF02110C93BCA8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22d2af1-2dfe-4a73-04d1-08dbc5b9145d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 15:38:10.3896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bH6ibANgdRZG6eB8f66y78ImcWu5bavahsFnGFdpq2xi+rHUpp2nv6ySLiO/lJcGg/N10vdTBIQ836AlqmFxjiFmBU5oHBWrxSAnf11uFi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEwLTA0IGF0IDA5OjM3IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgU2VwIDI2LCAyMDIzIGF0IDA5OjIwOjU1UE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOg0KPiA+IEN1cnJlbnRseSB0aGUgZGV2Y29yZWR1bXAgaXMgYXZhaWxhYmxlIGluIHRo
ZSBmaWxlIHN5c3RlbQ0KPiA+IGZvciBhIHVzZXIuIEhvd2V2ZXIgMSkgQ0kgaXNuJ3QgY3VycmVu
dGx5IHNldCB1cCB0byBkdW1wDQo+ID4gdGhpcyBkYXRhIGFuZCAyKSBpZiB3ZSB0cnkgdG8gZHVt
cCB0aGlzIGR1cmluZyB0aGUgZHJpdmVyDQo+ID4gbG9hZCB3aGVuIGEgZmFpbHVyZSBpcyBvYnNl
cnZlZCwgdGhlIGRyaXZlciB3aWxsIGJlIHRvcm4NCj4gPiBkb3duIGJlZm9yZSB3ZSBoYXZlIGEg
Y2hhbmNlIHRvIGFjdHVhbGx5IHJlYWQgdGhpcyBkYXRhLg0KPiA+IA0KPiA+IEFkZCBhIHF1aWNr
IHJvdXRpbmUgdG8gcHJpbnQgdGhpcyBvdXQgd2l0aCBkcm1faW5mbyBhcyB3ZWxsDQo+ID4gaWYg
Q09ORklHX0RSTV9YRV9ERUJVRyBpcyBlbmFibGVkLg0KPiANCj4gSSBmZWVsIHRoaXMgaXMga2lu
ZCBvZiBhIGR1cGxpY2F0aW9uIG9mIHNpbXBsZV9lcnJvcl9jYXB0dXJlKCkNCj4gdGhhdCBJIHRo
b3VnaHQgd2UgY291bGQga2lsbC4uLiBhdCBsZWFzdCB0aGF0IGhhcyBhIG1vcmUgc3BlY2lmaWMN
Cg0KV2hhdCB3YXMgdGhlIHJlYXNvbiB0byBraWxsIGl0Pw0KDQo+IGNvbmZpZzogQ09ORklHX0RS
TV9YRV9TSU1QTEVfRVJST1JfQ0FQVFVSRQ0KPiANCj4gSSBtZWFuLCBtYXliZSB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8gaXMgdG8ga2lsbCB0aGF0IGFuZCBoYXZlDQo+IHRoaXMgb25lIGhlcmUsIGJ1
dCB3aXRoIGEgZGVkaWNhdGVkIGNvbmZpZz8hLi4uDQoNCkkgZmVlbCBsaWtlIHRoZSBhYmlsaXR5
IHRvIGR1bXAgZXh0cmEgaW5mb3JtYXRpb24gd2hlbiBhbiBlcnJvciBoYXBwZW5zDQpkdXJpbmcg
ZHJpdmVyIGxvYWQgaXMgY3JpdGljYWwgZm9yIGRlYnVnLiBXZSBjb3VsZCBjb21lIHVwIHdpdGgg
YSB3YXkNCnRvIGR1bXAgdGhpcyBkdXJpbmcgdGVhcmRvd24gdG8gc29tZSBvdGhlciBmaWxlIHRo
YXQgaXMgcGVyc2lzdGVudCAtDQpldmVuIGluIC90bXAgb3Igc29tZXRoaW5nPw0KDQpUaGFua3Ms
DQpTdHVhcnQNCg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8
c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmNvcmVkdW1wLmMgfCAxNyArKysrKysrKysrKysrKysrLQ0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmggfMKgIDMgKysrDQo+ID4gwqAyIGZpbGVzIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4gaW5kZXggNjhhYmMwYjE5NWJlLi5hYTQx
ZDhlOWI2MDIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVk
dW1wLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+
IEBAIC03OCw3ICs3OCwxMSBAQCBzdGF0aWMgc3NpemVfdCB4ZV9kZXZjb3JlZHVtcF9yZWFkKGNo
YXIgKmJ1ZmZlciwNCj4gPiBsb2ZmX3Qgb2Zmc2V0LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpdGVy
LnJlbWFpbiA9IGNvdW50Ow0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHNzID0gJmNvcmVk
dW1wLT5zbmFwc2hvdDsNCj4gPiAtwqDCoMKgwqDCoMKgwqBwID0gZHJtX2NvcmVkdW1wX3ByaW50
ZXIoJml0ZXIpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoaXRlci5kYXRhKQ0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwID0gZHJtX2NvcmVkdW1wX3ByaW50ZXIo
Jml0ZXIpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGVsc2UNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcCA9IGRybV9pbmZvX3ByaW50ZXIoY29yZWR1bXBfdG9feGUoY29yZWR1bXAp
LQ0KPiA+ID5kcm0uZGV2KTsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRm
KCZwLCAiKioqKiBYZSBEZXZpY2UgQ29yZWR1bXAgKioqKlxuIik7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoGRybV9wcmludGYoJnAsICJrZXJuZWw6ICIgVVRTX1JFTEVBU0UgIlxuIik7DQo+ID4gQEAg
LTEwMiw2ICsxMDYsMTUgQEAgc3RhdGljIHNzaXplX3QgeGVfZGV2Y29yZWR1bXBfcmVhZChjaGFy
DQo+ID4gKmJ1ZmZlciwgbG9mZl90IG9mZnNldCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IGNvdW50IC0gaXRlci5yZW1haW47DQo+ID4gwqB9DQo+ID4gwqANCj4gPiArLyogUHJpbnQgdGhl
IGNvcmVkdW1wIGxvY2FsbHkgYWxzbyBmb3IgZGVidWcgcHVycG9zZXMgKi8NCj4gPiArdm9pZA0K
PiA+ICt4ZV9kZXZjb3JlZHVtcF9wcmludChzdHJ1Y3QgeGVfZGV2Y29yZWR1bXAgKmNvcmVkdW1w
KQ0KPiA+ICt7DQo+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVCVUcpDQo+ID4g
K8KgwqDCoMKgwqDCoMKgeGVfZGV2Y29yZWR1bXBfcmVhZChOVUxMLCAwLCAwLCBjb3JlZHVtcCwg
MCk7DQo+ID4gKyNlbmRpZg0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgc3RhdGljIHZvaWQgeGVfZGV2
Y29yZWR1bXBfZnJlZSh2b2lkICpkYXRhKQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgeGVfZGV2Y29yZWR1bXAgKmNvcmVkdW1wID0gZGF0YTsNCj4gPiBAQCAtMTkyLDUgKzIw
NSw3IEBAIHZvaWQgeGVfZGV2Y29yZWR1bXAoc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ID4g
wqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgZGV2X2NvcmVkdW1wbSh4ZS0+ZHJtLmRldiwgVEhJU19N
T0RVTEUsIGNvcmVkdW1wLCAwLA0KPiA+IEdGUF9LRVJORUwsDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2RldmNvcmVkdW1wX3JlYWQsIHhlX2RldmNv
cmVkdW1wX2ZyZWUpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV9kZXZjb3JlZHVtcF9w
cmludChjb3JlZHVtcCk7DQo+ID4gwqB9DQo+ID4gwqAjZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZjb3JlZHVtcC5oDQo+ID4gaW5kZXggNmFjMjE4YTVjMTk0Li5iYTBjMmE3Yjcx
YjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmgN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuaA0KPiA+IEBAIC04
LDYgKzgsOSBAQA0KPiA+IMKgDQo+ID4gwqBzdHJ1Y3QgeGVfZGV2aWNlOw0KPiA+IMKgc3RydWN0
IHhlX2V4ZWNfcXVldWU7DQo+ID4gK3N0cnVjdCB4ZV9kZXZjb3JlZHVtcDsNCj4gPiArDQo+ID4g
K3ZvaWQgeGVfZGV2Y29yZWR1bXBfcHJpbnQoc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVt
cCk7DQo+ID4gwqANCj4gPiDCoCNpZmRlZiBDT05GSUdfREVWX0NPUkVEVU1QDQo+ID4gwqB2b2lk
IHhlX2RldmNvcmVkdW1wKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKTsNCj4gPiAtLSANCj4gPiAy
LjM0LjENCj4gPiANCg0K
