Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933B6E92FDB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 03:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321FA10E1C3;
	Fri,  6 Oct 2023 03:21:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A3810E1C3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 03:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696562475; x=1728098475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DxOyBCMdQqw8TI0d2LKV36KEHiEdp+Jw8D8cBGQEXtU=;
 b=nsgpsUsGZsmKoXWzmHusOQugg9KozjfHlRTxeUO4XjExiY5EYZBm/nzi
 glG/5U7UdVrxZdCrcLxhzqYUKj1olT0GznUgM6c+7QU2RVw8AU1Nlr63a
 bT31XJT3Chhqe7BDF4TIvE4RMCfu3YMTmZpbhhn2qDY0m70YPWrb5fKeK
 zXBQ1iGm8B1Q9PM6q6EPDf4rjrpuDbL9760Mr7TKhxIHXkfHkbUFKIATa
 IfgtLrTGxKrsTa71D3thUyT9LR2iPVqADX6FdDtmr4OUGo/cnFDRAPxDu
 5UUdhWp5m6dw8b0KV5RLfzLT6BLgEdJmv/f4Wz26ssXQWUU8J184BTXSi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="450164421"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="450164421"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 20:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875797552"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="875797552"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 20:21:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 20:21:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 20:21:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 20:21:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 20:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAPWFz8VwrXDrnEfHip+FmA6oAdkBhxyjlgHwGYDCVy/eJ+F/ssOmJ3nvnCljHiqOY55l5+AXCVqyaRVGDhO59Vtfi3T9lUp37amwBcKjEAfzWMNabLdp43DvlJPRddZNvyQiloZ3GKSrsgHuf73KGjDhgTqW29Tk9fWTShU9gzuqNPuz3whOgZzOROqfevn3bhv/xgZE0bHtPfEN98XdB9FH6T+zP+13bbkJX3tg1Xz4+A1HKot5j+ET17fwxX9rC8rCApv+53xgDhJI7PgHi//rgEGG/vuFC8o2S7ZYCjU2FnmXZzP7qKfDb1T+68xM9af2EtkO+dzRdDO/bnafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxOyBCMdQqw8TI0d2LKV36KEHiEdp+Jw8D8cBGQEXtU=;
 b=EyyhanJCnHIVtXIcWvn4Yt3k36wOrZ5UxLUqh8vb0ihIrJBU+PoU1EZWqAVMPowZgt9yp6IL/zyohstBS2/tP+rFUiJZxaoD+yqj5JyomofhYygGaxjZRKr8fWN16zR/dypnC7AYubpzoyrI6YW+cko0vdORHV7JLJu7qHFG2KWjkO26w30yciqaM+h3ijC0+K+MHAJDgDUlfmj1j8W2mu+ubveiJkIjXfXtaNjVHjL0r+4ijj1EmcgK4EzYdKCP9grx6gAlinqkEzJmWPKlEru4/w9V0RVDqHgZwSH6p9osefPSNPWNDGcvZMGikk1R0wFp/4B4wJlKQDE3rGoM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.34; Fri, 6 Oct 2023 03:21:11 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 03:21:11 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 2/3] drm/i915/display: Created exclusive version of vga
 decode setup
Thread-Index: AQHZ95Ms3zDtv/VjpkOXhN5jNk6cSrA8GPfw
Date: Fri, 6 Oct 2023 03:21:10 +0000
Message-ID: <DM6PR11MB317745E672849A045038655BBAC9A@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
 <20231005135918.2345364-3-uma.shankar@intel.com>
In-Reply-To: <20231005135918.2345364-3-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|PH8PR11MB7072:EE_
x-ms-office365-filtering-correlation-id: d9b342dc-8baf-4a05-629b-08dbc61b49f3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I7njOGFAJY3Ha4X1mCUt6WYkiEy4GZUCSDF2UOpK5hhgBGMFmbmTt96uVPNnjusEWx8ZzCHfNjyu9IdVdinf1cppsJ7hLBQuZAP/isWe/jJmjV6lrEuzKt4CZnBeleJiXiD4GMvbGlh0unnVYTK1iLpgnsv4mZWjpW9AnYSMD0Zqx6a6iIYwqa8jhwfqrF13faxGShGWXXU+LHopJU5BZbdChK12HuGkpYiDfPD0Nj3etYXNBspHFOy4uiqojWB5kX/cpypjDrlBlE15LJERPpxKwGw7SYefMlTm7C93y07qgP/EjGp/RBFer+YxXu8Luo07YThKy5PWK65F4DEv5mZf1l0gNk77A357jTgVswzWQa9MEGPiLOpK17JbRJCmXdcxTo4gvqWgmzclWHBcQQdxzpXIhE9NJOmj2p+B71+YP6BLc0xiwhT4Ui9CI41RWTb8+Vb5z+B+vzCrudJL8X4w8byrxY3jS8OR/MycO76SuIE0DY0Y3SHZ3cFlOPDkIYTO+3CIDkkaVP3XEute+V6ky4bXuGNwztt71CaTLwV9K2AL35G19ku5JLkqsYQWg3CvjhVhSckLoVJftLE+kLd+Jk7vzyYffsWOjCVz1m4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(107886003)(9686003)(6506007)(7696005)(53546011)(83380400001)(66946007)(966005)(26005)(71200400001)(5660300002)(110136005)(4326008)(66556008)(76116006)(66446008)(66476007)(41300700001)(2906002)(64756008)(52536014)(8936002)(478600001)(316002)(38070700005)(82960400001)(38100700002)(55016003)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTBjdEY3TTF6bGV4aElXelIxR05YVXNRNVdITE9KVkpwbzJiQ1ZvbHNpZWhy?=
 =?utf-8?B?NGdia09VL3hkTEJ5dGRzMkIyNmpSUWZxRUxCNU9WWUFIenhkcndHd1pJZk0z?=
 =?utf-8?B?WjYwcUhzYlE5bXZadlhoY1R4NW0rNVNLQjI1TElGVklkOGJVOG9EOVY1ajBC?=
 =?utf-8?B?UmN4NVIwYmorOU5ab3pGRitXTjRpZkhrZkxod2cvTmZLZEtJVWNKRk9XTGx3?=
 =?utf-8?B?bW5KTWJxN2IrNmVWZDlLeithbFkraERwQlgzYVhWK0NKbEdRdnpGSHVmcmJ2?=
 =?utf-8?B?UHhnV3ZQWFZkOW5yS3NsWEJTVjhlWmNtWE1MWGhyT3VMSGdWdGZTdVBSTWl6?=
 =?utf-8?B?b3JGU1RnSk1lakc5R3p0Q1pnUlZtOGNVdTgrRW1BL2l1MFprdjhFNThva2RV?=
 =?utf-8?B?VWNFUXJwRHpxWVhkR0tQRUg3b2gzYXVUdkF3dnQrSjhhSWlPNVRTa1dxTCsv?=
 =?utf-8?B?cm1sY0haSmc1K3RSM3o4QTV2UituN25Fd0FVVGpRRXd4RjhaZUt1eWhObjZr?=
 =?utf-8?B?ckJSaHNwTHhXS2hFME16alhXelFtekJrcllvd3hSTjhHK3VyR2ZoMXNkSEp0?=
 =?utf-8?B?V2xRNGZRWk16SXFZMWtFcEhqR1RiY3pPY1lVd2JCSDRyNC9ZSXplZ3BLRlZz?=
 =?utf-8?B?VnhFeWs4YlViLzJhWHZ6endCRkhPdVNBY0p0M2pOWmZaZUxXSmdvTUpaMERu?=
 =?utf-8?B?STlKMmJOK1BXUkNRMUlFQ1YxRjZHVlFzVU9BZW5ab08weDIvRzZGRjdrUDhC?=
 =?utf-8?B?eUJaUHNTeW5XSDlNaHczeHhmTm55TU15c2U4akZDQnNXYzhrdVk5STJqOTN3?=
 =?utf-8?B?SVBENmFNQ1RUM0dIOCt0dUx4V2w0SmFqVVZTampyUFVlL2RxS0piVGE0cGpZ?=
 =?utf-8?B?MUVNSmxhNGw3SUVLNkNPY3hJM0l3R0grb1V1bS9KWWVqdjdJcEVWMlVLdlk4?=
 =?utf-8?B?VVpoRFMxdDhBK3RZZ283ekRmMUk1WCtrZXF0NkNZSE5jM3gwQm1KMFlaNy94?=
 =?utf-8?B?VTRQaTdkWnpNUUs0WFhGbDBVTHFSeE4wRUxBY3NGYlpaRkhYR0NjQXZhczVs?=
 =?utf-8?B?djRhTU4zSVBMSnVISnhqRktBanhuOGpXaC9XYTZFa1hONThBTEZhZUhvdERl?=
 =?utf-8?B?VUxCSkk3QTd6QTNIL0JtN0dkRFA2QnNoUmpTdmxjK3o2akk5OHRWakVWa1VP?=
 =?utf-8?B?Y05ibHF0SXBSOXYwUFZKUXBRRjJWRGpKODY4d3FtL2V0SWlTaEphNldYTGp3?=
 =?utf-8?B?Zy9heDZoOUVjdTJIS1pkaDFvVG5GZ0xUUzg1SENsNlMyeFFwU3NlQ1I1S0wz?=
 =?utf-8?B?dGdnSDl6Qms1bUVDd1BiSGxJRXhrYkxJVFhrZ1krcFlIS0xhVkx4R2hTWXJj?=
 =?utf-8?B?MGNIUjh5ZDNIWlc4bzZCbVFXSWxPZzFKRkFiSzJvTUVRMHZIa2g3T2MySnhP?=
 =?utf-8?B?eWNhaVlqR1ZjTXB4K0hoVGwwcENkTWVGTG5VbnRCYWFXSTIzdkF3YmdVWVQv?=
 =?utf-8?B?OGt2V1h2ZE1nYk54WjB6aUFIWWtHYVcxbUJ1Ym54aDZpNW9ZeUkzVkJoVFBm?=
 =?utf-8?B?Q1FQckhmb3E1d0lZZHNJYjZWYXZTQm1GbE1YREM5TkdlbFBtMTlkSStERm93?=
 =?utf-8?B?NjdSV0JFMUJtV0N6bDlPcytzaERCV2tuL2toUmZLTUNFdEFkQ2RLNWh3MVk5?=
 =?utf-8?B?K1ZMWUN4MkJ5TEU5bExoRnIwZVBSN0hCeFI1ZVB1UWVpaUdHcUkzbnJubmpO?=
 =?utf-8?B?VmN4S3Rta1AybEFqSklpSG1vNTFGRnFFMlBGQ1RxWHYrelJYK3QwNEQ0U2dC?=
 =?utf-8?B?Y3dRRXNBR0FLcDV3STJFT3FBTzU1S05vZ0ZlbSs0ZVlGVVhSaXB2Slo0TXFB?=
 =?utf-8?B?cTN0SmRLN1BveGsyWGxuK2IycFJJd2Y1eVJDYytrb2hRWGcwc2FTaXlxdnl4?=
 =?utf-8?B?aGlyZjVQREFmWGJoSjVxekh5bnlzY2dYR1ZnNG56b0IwSlJpZ3pUUmlpQURw?=
 =?utf-8?B?U1greVhnS0VBUUNOeE4yWlhKcHdpVDgwWVhFbVNZcmY0bXFZM1NBYWFLOWw4?=
 =?utf-8?B?U1NrRVFDZ2d3WmFpQ3lVeVF5eUJZZU1TY2Zxb2JncnNUQ3FveHFwaEVNUUNk?=
 =?utf-8?Q?xM6sxdB8DNiCkEy+9pnQ5F21M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b342dc-8baf-4a05-629b-08dbc61b49f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 03:21:10.9595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FekNwLeeiKqBUxEyxuJ2p4eb6cllgBzBX1KPHM9DexjKXLOx8PdJYQNCDZlIr5JSGWpij4QYapGejXRscK2Xxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/i915/display: Created exclusive
 version of vga decode setup
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhbmthciwgVW1hIDx1
bWEuc2hhbmthckBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDUsIDIwMjMg
NzoyOSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBOaWt1
bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVu
LnIubXVydGh5QGludGVsLmNvbT47IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8zXSBkcm0vaTkxNS9kaXNwbGF5OiBDcmVhdGVkIGV4Y2x1
c2l2ZSB2ZXJzaW9uIG9mIHZnYSBkZWNvZGUNCj4gc2V0dXANCj4gDQo+IEN1cnJlbnQgdmdhIGFy
Yml0ZXIgaW1wbGVtZW50YXRpb24gaW4gaTkxNSBuZWVkcyBhIHJlLWRlc2lnbi4NCj4gVGhlIGN1
cnJlbnQgYXBwcm9hY2ggd291bGQgY2F1c2UgcmVhbCBwcm9ibGVtcyBpZiBhbnlvbmUgYWN0dWFs
bHkgbmVlZHMgdG8NCj4gdGFsayBhbm90aGVyIEdQVSB1c2luZyBsZWdhY3kgVkdBIHJlc291cmNl
cy4NCj4gDQo+IFRoZSBtYWluIGlzc3VlIGlzIHRoYXQgWCBiZWNvbWVzIGEgc2xpZGVzaG93IGlm
IGl0IHRoaW5rcyB0aGVyZSBhcmUgbXVsdGlwbGUNCj4gR1BVcyB0aGF0IGhhdmUgVkdBIGRlY29k
aW5nIGVuYWJsZWQgYXMgaXQgaW5zaXN0cyBvbiBhZGp1c3RpbmcgdGhlIFZHQSByb3V0aW5nDQo+
IHByZXR0eSBtdWNoIGZvciBldmVyeSBsaXR0bGUgb3BlcmF0aW9uIGludm9sdmluZyBhbnkgb2Yg
dGhlIEdQVXMuDQo+IA0KPiBUaGUgY2xlYW51cCB3aWxsIGJlIHBsYW5uZWQgZm9yIGk5MTUuIE1l
YW53aGlsZSB0byBmb2N1cyBvbiBYZSB1cHN0cmVhbWluZw0KPiBhbmQgaGF2ZSBhIGNsZWFuZXIg
c2VwYXJhdGlvbiwgdGhlIHNhaWQgZnVuY3Rpb25hbGl0eSBpcyBiZWluZyBtb3ZlZCB0byBhDQo+
IGRpZmZlcmVudCBmaWxlIGV4Y2x1c2l2ZSBmb3IgaTkxNS4gWGUgZHJpdmVyIHdpbGwgcmUtdXNl
IHJlc3Qgb2YgdGhlIGRpc3BsYXkgY29kZQ0KPiBmcm9tIGk5MTUuDQo+IA0KPiB2MjogQWRkcmVz
c2VkIEphbmkgTmlrdWxhJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPiANCj4gdjM6IERyb3BwZWQgYSBk
dXBsaWNhdGUgZnVuY3Rpb24gKEphbmkpDQo+IA0KPiB2NDogVXBkYXRlZCBjb21taXQgbWVzc2Fn
ZSB3aXRoIHJlYXNvbmluZyBhcyBzdWdlc3RlZCBieSBWaWxsZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBB
cnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gTGluazoNCj4gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMjMwOTI5MDc0MzA2LjE1
MzM4NTktMS0NCj4gdW1hLnNoYW5rYXJAaW50ZWwuY29tDQo+IChjaGVycnkgcGlja2VkIGZyb20g
Y29tbWl0IDU4NDZjZGZkM2Q1ODg1MmNkYzk5MWU1ODlkZTc1MzUxNTFhNDdhNGUpDQo+IC0tLQ0K
UmV2aWV3ZWQtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KDQpU
aGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92Z2EuYyB8IDE4ICstLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvc29jL2ludGVsX2dtY2guYyAgICB8
IDE0ICsrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zb2MvaW50ZWxfZ21j
aC5oICAgIHwgIDIgKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF92Z2EuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
dmdhLmMNCj4gaW5kZXggMjg2YTBiZGQyOGM2Li40Yjk4ODMzYmZhOGMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmdhLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92Z2EuYw0KPiBAQCAtMywxMSArMyw5IEBADQo+
ICAgKiBDb3B5cmlnaHQgwqkgMjAxOSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiAgICovDQo+IA0KPiAt
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3ZnYWFyYi5oPg0KPiAN
Cj4gICNpbmNsdWRlIDx2aWRlby92Z2EuaD4NCj4gLQ0KPiAgI2luY2x1ZGUgInNvYy9pbnRlbF9n
bWNoLmgiDQo+IA0KPiAgI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+IEBAIC05OSwyMCArOTcsNiBA
QCB2b2lkIGludGVsX3ZnYV9yZXNldF9pb19tZW0oc3RydWN0IGRybV9pOTE1X3ByaXZhdGUNCj4g
Kmk5MTUpDQo+ICAJdmdhX3B1dChwZGV2LCBWR0FfUlNSQ19MRUdBQ1lfSU8pOw0KPiAgfQ0KPiAN
Cj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQNCj4gLWludGVsX3ZnYV9zZXRfZGVjb2RlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LCBib29sIGVuYWJsZV9kZWNvZGUpIC17DQo+IC0Jc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmk5MTUgPSBwZGV2X3RvX2k5MTUocGRldik7DQo+IC0NCj4gLQlpbnRlbF9nbWNo
X3ZnYV9zZXRfc3RhdGUoaTkxNSwgZW5hYmxlX2RlY29kZSk7DQo+IC0NCj4gLQlpZiAoZW5hYmxl
X2RlY29kZSkNCj4gLQkJcmV0dXJuIFZHQV9SU1JDX0xFR0FDWV9JTyB8IFZHQV9SU1JDX0xFR0FD
WV9NRU0gfA0KPiAtCQkgICAgICAgVkdBX1JTUkNfTk9STUFMX0lPIHwgVkdBX1JTUkNfTk9STUFM
X01FTTsNCj4gLQllbHNlDQo+IC0JCXJldHVybiBWR0FfUlNSQ19OT1JNQUxfSU8gfCBWR0FfUlNS
Q19OT1JNQUxfTUVNOw0KPiAtfQ0KPiAtDQo+ICBpbnQgaW50ZWxfdmdhX3JlZ2lzdGVyKHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICppOTE1KSAgew0KPiANCj4gQEAgLTEyNyw3ICsxMTEsNyBAQCBp
bnQgaW50ZWxfdmdhX3JlZ2lzdGVyKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQ0KPiAg
CSAqIHRoZW4gd2UgZG8gbm90IHRha2UgcGFydCBpbiBWR0EgYXJiaXRyYXRpb24gYW5kIHRoZQ0K
PiAgCSAqIHZnYV9jbGllbnRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FTk9ERVYuDQo+ICAJICov
DQo+IC0JcmV0ID0gdmdhX2NsaWVudF9yZWdpc3RlcihwZGV2LCBpbnRlbF92Z2Ffc2V0X2RlY29k
ZSk7DQo+ICsJcmV0ID0gdmdhX2NsaWVudF9yZWdpc3RlcihwZGV2LCBpbnRlbF9nbWNoX3ZnYV9z
ZXRfZGVjb2RlKTsNCj4gIAlpZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQ0KPiAgCQlyZXR1cm4g
cmV0Ow0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NvYy9pbnRlbF9n
bWNoLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zb2MvaW50ZWxfZ21jaC5jDQo+IGluZGV4
IDQ5YzdmYjE2ZTkzNC4uZjMyZTlmNzg3NzBhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9zb2MvaW50ZWxfZ21jaC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3Nv
Yy9pbnRlbF9nbWNoLmMNCj4gQEAgLTUsNiArNSw3IEBADQo+IA0KPiAgI2luY2x1ZGUgPGxpbnV4
L3BjaS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BucC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3Zn
YWFyYi5oPg0KPiANCj4gICNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gICNpbmNsdWRl
IDxkcm0vaTkxNV9kcm0uaD4NCj4gQEAgLTE2NywzICsxNjgsMTYgQEAgaW50IGludGVsX2dtY2hf
dmdhX3NldF9zdGF0ZShzdHJ1Y3QNCj4gZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwgYm9vbCBlbmFi
bGVfZGVjb2RlKQ0KPiANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gKw0KPiArdW5zaWduZWQgaW50
IGludGVsX2dtY2hfdmdhX3NldF9kZWNvZGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGJvb2wNCj4g
K2VuYWJsZV9kZWNvZGUpIHsNCj4gKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHBk
ZXZfdG9faTkxNShwZGV2KTsNCj4gKw0KPiArCWludGVsX2dtY2hfdmdhX3NldF9zdGF0ZShpOTE1
LCBlbmFibGVfZGVjb2RlKTsNCj4gKw0KPiArCWlmIChlbmFibGVfZGVjb2RlKQ0KPiArCQlyZXR1
cm4gVkdBX1JTUkNfTEVHQUNZX0lPIHwgVkdBX1JTUkNfTEVHQUNZX01FTSB8DQo+ICsJCSAgICAg
ICBWR0FfUlNSQ19OT1JNQUxfSU8gfCBWR0FfUlNSQ19OT1JNQUxfTUVNOw0KPiArCWVsc2UNCj4g
KwkJcmV0dXJuIFZHQV9SU1JDX05PUk1BTF9JTyB8IFZHQV9SU1JDX05PUk1BTF9NRU07IH0NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NvYy9pbnRlbF9nbWNoLmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9zb2MvaW50ZWxfZ21jaC5oDQo+IGluZGV4IGQwMTMzZWVkYzcy
MC4uMjNiZTJkMTEzYWZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zb2Mv
aW50ZWxfZ21jaC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NvYy9pbnRlbF9nbWNo
LmgNCj4gQEAgLTgsMTEgKzgsMTMgQEANCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4N
Cj4gDQo+ICtzdHJ1Y3QgcGNpX2RldjsNCj4gIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlOw0KPiAN
Cj4gIGludCBpbnRlbF9nbWNoX2JyaWRnZV9zZXR1cChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
aTkxNSk7ICB2b2lkDQo+IGludGVsX2dtY2hfYmFyX3NldHVwKHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICppOTE1KTsgIHZvaWQNCj4gaW50ZWxfZ21jaF9iYXJfdGVhcmRvd24oc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUpOyAgaW50DQo+IGludGVsX2dtY2hfdmdhX3NldF9zdGF0ZShzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwgYm9vbCBlbmFibGVfZGVjb2RlKTsNCj4gK3Vuc2ln
bmVkIGludCBpbnRlbF9nbWNoX3ZnYV9zZXRfZGVjb2RlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBi
b29sDQo+ICtlbmFibGVfZGVjb2RlKTsNCj4gDQo+ICAjZW5kaWYgLyogX19JTlRFTF9HTUNIX0hf
XyAqLw0KPiAtLQ0KPiAyLjQyLjANCg0K
