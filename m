Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596FEC001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 15:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCFE10E2B3;
	Mon, 31 Jul 2023 15:24:54 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50AA10E2B3
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690817092; x=1722353092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fpr3A6Doq3wQsfmbqdFAzra2HkAgKm2YbaVomAmKaII=;
 b=ONfyypXaSq/3hpzml2CHVDHgDXnTwJ8p9eMpQ2Mev+xf4P/2LTz4DYqm
 lFD5TEQfej2wsR3JeqEA3a8h4BgfimJl/tQU/t0xgYMJOqKTP8gOdJXMi
 HkoH7K+QA2mwg6YJrCKf+yHCWFJdRH/6TIFUktt/4ZZHhzXDvSfsB51MA
 eNOqNrkXJqHqnaeHv2MBMG30JpGPEQFK25gmT8QxZBL1nClZhyHBQm4SR
 eElUjOlC/4snEg/SDlKXaj3MgW083+VYhORDKakE+pGfwhfGBmM/PtFZH
 4veXKgV80AdflNHKMQBOjrBH+qOFRMkDjudL9Xw6wQ9vKBxE6RGCgMEiP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366527532"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="366527532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 08:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728342661"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="728342661"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 31 Jul 2023 08:24:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 08:24:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 08:24:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 08:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0Ht0+QRRhwp6lkIHtxJXiryVEiEp0Wx9KA/RJMfFDAK3oJZRstP5RJrFM6k4lAUQcqZvTTCx4HJiqjzAbcvDuT5djeDjhn81+l9WDkFNg4rR/NvBZikIUOLsUIVs7gKwRUNQMsLXqrzz6QYHwyYuDUV8o3/L43wKhoirhIuvZOBglwNMUpyeecffY9uceNaZhWwI53/jW0Ah7NPPknw0ozriOIpg+49NKkysmv2BZOuXQk0GrUvd/yeT0gW5cdSdjhy+OCihAySz9xe/buCx5Nv4vQr3x/j20Mam5vEWWJ6M+zuZsSWyJDK7YrDKhvGvhFpvyIj1jFdDxw0xe8WMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpr3A6Doq3wQsfmbqdFAzra2HkAgKm2YbaVomAmKaII=;
 b=I88/tqPjscHI/f2RXWQHobxj3ado/yBe9HL6aC+bR1o6DXG9z3RewblzuQmStCHwJv7xFFw+u3hT6IREgm5SCd7qUAelee1VJ70fuhEqCfSIyuQWjUjwm6Wr35nDC6jv1UJXnqI7ud3sbMALPuR8+adkruPJgZYAJGww4fI76WuiVcrWLUbKw8BH65zMOBCsP+fX6pWfZcvRmaKr8nFl5RgFPvq1S0ejOMhYvboCCaNBoGWPIkT6Pnl6T0E+CZ7S2w4llxl0/Mb2nfHuiDsq6l0j1M4flwphblhlErrZQHCC/VMKoka0ISy4cLi+yVjYEhgBwQCt5J4xjQKGhpE/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:24:27 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 15:24:27 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
Thread-Index: AQHZwBf59cfM18kIo0W+TuHXjgNGlK/T9sqAgAAOnNA=
Date: Mon, 31 Jul 2023 15:24:27 +0000
Message-ID: <MW4PR11MB7056657DF4820D71CBB0DBE5B305A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
 <ZMfFaXW7607Cy45j@bvivekan-mobl>
In-Reply-To: <ZMfFaXW7607Cy45j@bvivekan-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA1PR11MB8489:EE_
x-ms-office365-filtering-correlation-id: 2ad47621-afa8-4fb6-5ed5-08db91da3a71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +1gVIpU1xyJXXPaibkE1i8bOh+mj6tl2gVDnJYjdIk0OnaCFbPZxZkcvg9Hud/4RGS12fY6vifRy/FbAuyR9vQ+hL+IaDxaVPXNjIGMIrZhF7D12SB5S9c/bRJQPvW5gBuUkMwVrle2N+zeJNMYcJGLWlI4UaVJwmkc2Jvv82ZiLUX8V5y2gYEwsS8xYt8deFBJgXyuSfeHzilAaWcKio2ePn7slls9kFffhpLsz3OvxByXsX3KY4Wx4V9UBibtf2cESkyiiIH9LvlLoeXr3SrvltUGoQqeQcWF4PVrWt2K6prWPFBT3rNWBlifDfbwW2obp3oIiATkpH7CGS3mhjoCyWedDMcicBRILL3lM40BPvYeuVtH5/ag0b6LYjctZemLnMX7XyIbZXHptzQG2QsChwQ5jHL+BzHoFtgUPlRiPWi+XFxl/gLYACadQlsmHm6kbirZBu36rr2RTuLyxKEzh3ef2Ff1DKSd4Lpc4mugTXzbfIae5/5yFYzfwEXiasdY5Gen1Om1XGSbSn4aJcb8WBqNGvWmCTLkjagZfUay4iZcQTV7+8wKf8QG7QQG2lg1pdNNS0PgLDATWGJ3Or9r78lxziV6eaWiZiY+FUB3EBdk/qUcBKFLg2DyQdprU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(38100700002)(82960400001)(122000001)(55016003)(86362001)(33656002)(38070700005)(9686003)(478600001)(71200400001)(7696005)(53546011)(107886003)(186003)(26005)(8676002)(8936002)(6506007)(52536014)(5660300002)(76116006)(4326008)(2906002)(66476007)(64756008)(66446008)(66556008)(66946007)(54906003)(110136005)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2NDeStDNFlRUmVhZExNMkFuaTRJR1YvTVFKSWFROU1OQ0pKRkh1MVNydktC?=
 =?utf-8?B?N3d5UkJvRTZ4ZGJ2d1pQWVpITnByTU14Nkc3SEx6Zk13TXprL1Q4aGJxRXNX?=
 =?utf-8?B?eWhadDMvRUpCZG0wT0ExRVhOcW1uYmZJdldHMmQzWW9zU09JdGpmUmlTK3dx?=
 =?utf-8?B?c1V5VUFvV3VQbnpaTVpJcVRzVXBGRlNubXh2UU96R3lZS0QweU1nalJqZ3hH?=
 =?utf-8?B?RVNMZXM5cjMvcUNoaVFBSUhuK25GZzRXUXU0eGlnSEplSndLN0xWWVdZY3hk?=
 =?utf-8?B?RWh3SXJMNFJPR3E1eEJaMzNqMmVVUW1XM3FCM0lHdjdrK3FvUDJrTmFPQ1Z3?=
 =?utf-8?B?ZmlFYlRYOUFmZGRUM2h4ZnhqMmh6RmZJY0xtd3JuTjJEZFFhYXdUaUpVM2Ni?=
 =?utf-8?B?R0lUNThKeFdSR1ZQdERFOWt6NnczazV1c1pEcmw2KzEzL2pnbnM5RUlQWjYw?=
 =?utf-8?B?WTQzWG9rUEp2c1FFTnhUSFBHT2lRQjVNalp6ZEZ2aUwyVDRQbGZVcEU3ZXNR?=
 =?utf-8?B?RXVCT2M4dDZJVVBRaHZlSVlCd2w5eU53ZXhEeS9TOXM1SmV1TVdwRk5LeFho?=
 =?utf-8?B?blNrZXl4aWNpZjA4K0w5V1hOd2ppOUdNS2dRQithSEVrQmZqTVpsdmp4L2hP?=
 =?utf-8?B?RmhCbnUwTnBtTWpONFJ0T1RDKzFGM3RNRlY0UWNuZ0o4ODRRNE1MZmRRNlNT?=
 =?utf-8?B?enRpYUgvdFdSdUpXcDZxd2NEczkzZHk5ME9uR1ZpUHZScDVoanFLTjFGT2tT?=
 =?utf-8?B?dWI4SnZZSk9ZY0FCcTJ4QVhrZFVQd0VMeC9VbExjVDl6V3lhSUVDVjdHMTZK?=
 =?utf-8?B?M3B3NkNaWSsvRXV3NEZLb2VnbXprbU5Wemo5Z3BXcUJab1IrOVZRS3I2U2xD?=
 =?utf-8?B?ZGIvb005U1ZsaVpRUFVUTnZnUDVBaEZDRkFURDliQVlSS1NjNmhaT1oxTld1?=
 =?utf-8?B?UVZQVkxOUG9KWlBmZkVDQVliZmNwSkpCRVNObHhoT1RvWE5vaUcyNUw2RDJm?=
 =?utf-8?B?QUxxUC8rMnY3VDNSbVV5ak1yWExqTG5sTjByTzZTTGo0OXNYMWlVNlJROEtZ?=
 =?utf-8?B?a1hmdlpGem02UTY3cjVKaHBsVmZRYk9Wa0lhVnY4ekhTNTB5Z0F1cDVIeXJ3?=
 =?utf-8?B?OFBhc0R4ZUNCSGp5UGJBdStaSWFBTHdobXdMTUtCQkJIQ3k3ZlZKK01nQ3p0?=
 =?utf-8?B?dXJrb3hGb0RYbnhyRm11YTVMRjBMNHI0UEFIc2dUUGFodnVnVWNQSmtSaENq?=
 =?utf-8?B?NjRyRGtsbFVVeEhQRnFoRWlpYytEK3FHbCtGM0krWkJiTk1SVmwxTnlxR0Mx?=
 =?utf-8?B?TWRPTHE2U0pTbEF2alh4Q0VadkYwTmVzcG55M3ExNGgyQjRZaGJ3NGhhT2Nx?=
 =?utf-8?B?WlpwckVraWV5Mm9YN3J6c0xLbGcxUjA1LzJjRmkwRGRNNDMrMGNPeVgvZEQr?=
 =?utf-8?B?aTJIa2lnVTFJa0ZMS0JUTTFzb2dmSGhxQWtOcnlMbVMzVWd3RFJzT3ZnVnpa?=
 =?utf-8?B?N2tqNFZ2S3piWkJGQWtlSFJRVjB1N3ZiSjJNbmpJTWgrd2tscmMzdUxRZEx3?=
 =?utf-8?B?bElobGNsRFN6OXNhcmg1MTR0aGZXOHRsMUVaU1JFd2E0dzh4RTRlVXQ1YTVI?=
 =?utf-8?B?YjNFR0RYeVRLenpDekIrWGVuazlhNTAwcGtWMFI0UVY5MmZ6ODhNbmdvL1FU?=
 =?utf-8?B?VFl6Vk9aQ2NJc0pVYUR4S0dXNEUwMmpNN3NoNXhHQzd3YmxsY1FFeFlaejVj?=
 =?utf-8?B?cy9IcjU0NDRNQm1xS01wTWZCQ1lSSXZqZWl1dkk0Znh4QkljSzF1MGVBcHpQ?=
 =?utf-8?B?QUFTdEZNTXJOTkdQM1laa3dMQ0RhcFlvMXJ5eXpBY3M0MllYSEE2RFVPUTdq?=
 =?utf-8?B?YXdTWTB0dUcza21VYlVRbE1UWkF4Rno5SGVUWTdjdjFTTXNOdUdsbVdVZm5l?=
 =?utf-8?B?ajd1UTZIeTh1Mmp1TzNmeWxIdklPaE9mZ2t3RXlYQjVLb0d6dDFOdUhKemYy?=
 =?utf-8?B?VzNOYUQ4RkJjYXNYb2hCbU5LSllOMTB6YUJSSDhuVHJlbjlTSzlORDk4amlE?=
 =?utf-8?B?alZ4a1JSVFJ5V3pBSXFOUzNXb08xZ1Z4aGxxWGkzYUZTMGY5SHI5alhDd2hl?=
 =?utf-8?B?RTlLL0d1cm0vWFVTb09vWUsrR0FTUURxMmxjbyt1cmFEbHBNNmhHRHNMTVZ2?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad47621-afa8-4fb6-5ed5-08db91da3a71
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 15:24:27.2247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F37xkPggS6ftYtoIYLVoWGLoTncztfPfPs5cWVr1IaiKtk9ttl+rfO3lGg+BZK8DyFmO6BfoueTAZ2Uh5Cqjbv9nJki1dnzAlbc6AqtSd1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGkgQmFsYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaXZla2Fu
YW5kYW4sIEJhbGFzdWJyYW1hbmkNCj4gPGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVs
LmNvbT4NCj4gU2VudDogMzEgSnVseSAyMDIzIDIwOjAwDQo+IFRvOiBHaGltaXJheSwgSGltYWwg
UHJhc2FkIDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJj
aGlAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIHY5IDMvM10gZHJtL3hlOiBJbnRyb2R1
Y2UgZmF1bHQgaW5qZWN0aW9uIGZvciBndA0KPiByZXNldA0KPiANCj4gT24gMjcuMDcuMjAyMyAw
NDo1NiwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdyb3RlOg0KPiA+IFRvIHRyaWdnZXIgZ3QgcmVz
ZXQgZmFpbHVyZToNCj4gPiAgZWNobyAxMDAgPiAgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxjYXJk
WD4vZmFpbF9ndF9yZXNldC9wcm9iYWJpbGl0eQ0KPiA+ICBlY2hvIDIgPiAgL3N5cy9rZXJuZWwv
ZGVidWcvZHJpLzxjYXJkWD4vZmFpbF9ndF9yZXNldC90aW1lcw0KPiA+DQo+ID4gQ2M6IFJvZHJp
Z28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiBDYzogTHVjYXMgRGUgTWFyY2hp
IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhpbWFs
IFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYyB8IDEwICsrKysrKysrKysN
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgICAgICB8ICA4ICsrKysrKystDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5oICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jIGluZGV4IDA0NzM0MWQ1Njg5YS4uMWZkMDE2
ZTZmN2EwDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVn
ZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4gPiBAQCAt
NSw2ICs1LDcgQEANCj4gPg0KPiA+ICAjaW5jbHVkZSAieGVfZGVidWdmcy5oIg0KPiA+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9mYXVsdC1pbmplY3QuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3N0
cmluZ19oZWxwZXJzLmg+DQo+ID4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fZGVidWdmcy5oPg0K
PiA+IEBAIC0yMCw2ICsyMSwxMCBAQA0KPiA+ICAjaW5jbHVkZSAieGVfdm0uaCINCj4gPiAgI2Vu
ZGlmDQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19GQVVMVF9JTkpFQ1RJT04NCj4gPiArREVDTEFS
RV9GQVVMVF9BVFRSKGd0X3Jlc2V0X2ZhaWx1cmUpOw0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4g
IHN0YXRpYyBzdHJ1Y3QgeGVfZGV2aWNlICpub2RlX3RvX3hlKHN0cnVjdCBkcm1faW5mb19ub2Rl
ICpub2RlKSAgew0KPiA+ICAJcmV0dXJuIHRvX3hlX2RldmljZShub2RlLT5taW5vci0+ZGV2KTsg
QEAgLTEzNSw0ICsxNDAsOSBAQA0KPiB2b2lkDQo+ID4geGVfZGVidWdmc19yZWdpc3RlcihzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPg0KPiA+ICAJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkNCj4g
PiAgCQl4ZV9ndF9kZWJ1Z2ZzX3JlZ2lzdGVyKGd0KTsNCj4gPiArDQo+ID4gKyNpZmRlZiBDT05G
SUdfRkFVTFRfSU5KRUNUSU9ODQo+ID4gKwlmYXVsdF9jcmVhdGVfZGVidWdmc19hdHRyKCJmYWls
X2d0X3Jlc2V0Iiwgcm9vdCwgJmd0X3Jlc2V0X2ZhaWx1cmUpOw0KPiA+ICsjZW5kaWYNCj4gPiAr
DQo+ID4gIH0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IGluZGV4IDVlNzBlNDg2YjI3Yy4uNjkxZTNi
YWY5N2M5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiBAQCAtNTI1LDYgKzUyNSwxMSBA
QCBzdGF0aWMgaW50IGd0X3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4NCj4gPiAgCXhlX2d0
X2luZm8oZ3QsICJyZXNldCBzdGFydGVkXG4iKTsNCj4gPg0KPiA+ICsJaWYgKHhlX2ZhdWx0X2lu
amVjdF9ndF9yZXNldCgpKSB7DQo+ID4gKwkJZXJyID0gLUVDQU5DRUxFRDsNCj4gPiArCQlnb3Rv
IGVycl9mYWlsOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgCXhlX2d0X3Nhbml0aXplKGd0KTsNCj4g
Pg0KPiA+ICAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KGd0X3RvX3hlKGd0KSk7DQo+ID4gQEAg
LTU2Myw2ICs1NjgsNyBAQCBzdGF0aWMgaW50IGd0X3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+
ID4gIGVycl9tc2c6DQo+ID4gIAlYRV9XQVJOX09OKHhlX3VjX3N0YXJ0KCZndC0+dWMpKTsNCj4g
PiAgCXhlX2RldmljZV9tZW1fYWNjZXNzX3B1dChndF90b194ZShndCkpOw0KPiA+ICtlcnJfZmFp
bDoNCj4gPiAgCXhlX2d0X2VycihndCwgInJlc2V0IGZhaWxlZCAoJXBlKVxuIiwgRVJSX1BUUihl
cnIpKTsNCj4gPg0KPiA+ICAJLyogTm90aWZ5IHVzZXJzcGFjZSBhYm91dCBndCByZXNldCBmYWls
dXJlICovIEBAIC01ODQsNyArNTkwLDcgQEANCj4gPiB2b2lkIHhlX2d0X3Jlc2V0X2FzeW5jKHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gIAl4ZV9ndF9pbmZvKGd0LCAidHJ5aW5nIHJlc2V0XG4iKTsN
Cj4gPg0KPiA+ICAJLyogRG9uJ3QgZG8gYSByZXNldCB3aGlsZSBvbmUgaXMgYWxyZWFkeSBpbiBm
bGlnaHQgKi8NCj4gPiAtCWlmICh4ZV91Y19yZXNldF9wcmVwYXJlKCZndC0+dWMpKQ0KPiA+ICsJ
aWYgKCF4ZV9mYXVsdF9pbmplY3RfZ3RfcmVzZXQoKSAmJiB4ZV91Y19yZXNldF9wcmVwYXJlKCZn
dC0+dWMpKQ0KPiANCj4gV2hlbiBgZmFpbF9ndF9yZXNldC9wcm9iYWJpbGl0eWAgaXMgc2V0IHRv
IGEgbGVzcyB0aGFuIDEwMCB2YWx1ZSwgdGhlbg0KPiB4ZV9mYXVsdF9pbmplY3RfZ3RfcmVzZXQo
KSB3aWxsIG5vdCBhbHdheXMgcmV0dXJuIHRydWUuIFNvIGlmIHRoZQ0KPiB4ZV9mYXVsdF9pbmpl
Y3RfZ3RfcmVzZXQoKSByZXR1cm5zIGRpZmZlcmVuZXQgdmFsdWVzIHdoZW4gaW52b2tlZCBmcm9t
DQo+IHhlX2d0X3Jlc2V0X2FzeW5jKCkgYW5kIGd0X3Jlc2V0KCksIHdlIHdpbGwgaGF2ZSB1bmV4
cGVjdGVkIGJlaGF2aW91ci4NCj4gDQo+IFdlIHNob3VsZCBhdm9pZCBjYWxsaW5nIHhlX2ZhdWx0
X2luamVjdF9ndF9yZXNldCgpIG1vcmUgdGhhbiBvbmNlIGluIGEgc2luZ2xlDQo+IHJlc2V0IGN5
Y2xlLg0KPiBXZSBjb3VsZCBleGl0IGltbWVkaWF0ZWx5IGluIHhlX2d0X3Jlc2V0X2FzeW5jKCkg
aWYgZmF1bHQgaW5qZWN0aW9uIGlzIGVuYWJsZWQuDQpJbnRlbnRpb24gaGVyZSBpcyB0byBjYXVz
ZSBuZXh0IHJlc2V0IGZhaWwuIFVubGVzcyB5b3UgbWFrZSB0aGUgcHJvYmFiaWxpdHkgMTAwIHRo
YXQgaXMgbm90IGd1YXJhbnRlZWQuIA0KQW5kIG5vLm9mIHRpbWVzIG1vcmUgdGhhbiAxIGFyZSBw
ZXJmZWN0bHkgZmluZSBhcyBsb25nIGFzIHByb2JhYmlsaXR5IGlzIDEwMC4gDQpFdmVuIGluIGNv
bW1pdCBtZXNzYWdlIGl0IGlzIG1lbnRpb25lZCBjbGVhcmx5IHRvIHVzZSBwcm9iYWJpbGl0eSBh
cyAxMDAuDQoNCkJSDQpIaW1hbCANCj4gDQo+IFJlZ2FyZHMsDQo+IEJhbGENCj4gPiAgCQlyZXR1
cm47DQo+ID4NCj4gPiAgCXhlX2d0X2luZm8oZ3QsICJyZXNldCBxdWV1ZWRcbiIpOw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaCBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndC5oDQo+ID4gaW5kZXggNzI5ODY1M2E3M2RlLi5jYWRlZDIwM2E4YTAgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmgNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuaA0KPiA+IEBAIC03LDYgKzcsNyBAQA0KPiA+ICAjZGVmaW5lIF9YRV9H
VF9IXw0KPiA+DQo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX3V0aWwuaD4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L2ZhdWx0LWluamVjdC5oPg0KPiA+DQo+ID4gICNpbmNsdWRlICJ4ZV9kZXZpY2VfdHlw
ZXMuaCINCj4gPiAgI2luY2x1ZGUgInhlX2h3X2VuZ2luZS5oIg0KPiA+IEBAIC0xNiw2ICsxNywx
OSBAQA0KPiA+ICAJCWZvcl9lYWNoX2lmKCgoaHdlX18pID0gKGd0X18pLT5od19lbmdpbmVzICsg
KGlkX18pKSAmJiBcDQo+ID4gIAkJCSAgeGVfaHdfZW5naW5lX2lzX3ZhbGlkKChod2VfXykpKQ0K
PiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfRkFVTFRfSU5KRUNUSU9ODQo+ID4gK2V4dGVybiBzdHJ1
Y3QgZmF1bHRfYXR0ciBndF9yZXNldF9mYWlsdXJlOyBzdGF0aWMgaW5saW5lIGJvb2wNCj4gPiAr
eGVfZmF1bHRfaW5qZWN0X2d0X3Jlc2V0KHZvaWQpIHsNCj4gPiArCXJldHVybiBzaG91bGRfZmFp
bCgmZ3RfcmVzZXRfZmFpbHVyZSwgMSk7IH0gI2Vsc2Ugc3RhdGljIGlubGluZSBib29sDQo+ID4g
K3hlX2ZhdWx0X2luamVjdF9ndF9yZXNldCh2b2lkKSB7DQo+ID4gKwlyZXR1cm4gZmFsc2U7DQo+
ID4gK30NCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICBzdHJ1Y3QgeGVfZ3QgKnhlX2d0X2FsbG9j
KHN0cnVjdCB4ZV90aWxlICp0aWxlKTsgIGludA0KPiA+IHhlX2d0X2luaXRfZWFybHkoc3RydWN0
IHhlX2d0ICpndCk7ICBpbnQgeGVfZ3RfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KTsNCj4gPiAtLQ0K
PiA+IDIuMjUuMQ0KPiA+DQo=
