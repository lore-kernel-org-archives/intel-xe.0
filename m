Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965C8C47DDB
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 19:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34D10F7C2;
	Mon, 29 Jan 2024 19:01:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D20710F7C2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706554877; x=1738090877;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Y5XtvkmHauWr29FeS2inMFcwdf327gjSkh3VZ/dSWW0=;
 b=NpwWCFSoxYl5aR+kPD9jsoz+cwwTn9/zeacFOL4P1u24S8wyq9kZI2TK
 dMhQG34owL8i+lYblt2mY8aMNJzqYm3ntqfk58oKtPbqFCDbXEs/vEBqK
 zeNa4sbB+WpWWWpNfcIupyKtc23/VgiFSNDJIGxlRBPj3HFiE2aoYJxZh
 O0sfAuwibi8UvHWBSd8i+gxCuFABtr6g3Yt8XfMH4Lw/Tcbfyc+H+Hs29
 UuCwKSxunhm1ejswbLZZZBFjGz1J0toYKnyZFyIwyW1eMqq33qiQ6aSNQ
 ra3R2y/2FbZMiW3KE1f0TYikGcrFZLKo5t4VxwSoR2+xj/lGHBE0hAiTy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="401928387"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="401928387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 11:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="36240876"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 11:01:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 11:01:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 11:01:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 11:01:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHrdGXIUF8TKzFzjTdwz1p/LuBxuwSXYehKeZm0sL2/FE/OtRlrV4s90l1InBpE2wjk6ib0LgimYL9JdGyGFejMV3Z0gebGmC0oVAcDxKD6/r27tX9avUraj8HxrPS7jft1dtlELQmmCYX1K2dtjgglSRi9YIN1lMwJQsGttLGLRFPx6ttduX3fFENdRU7dwmabvcw1GTqACVyaHMi1+iRZ1TU4uUkmMRHdPdCSXAkraXHerMSwyOOx/5xD8XLEHA0bJwfwIhSQPbs4e19/g5o7rrOrgRm786ZQa7YowZWsBBKEaTK+JscOVuYsL6dMsSoE5BHWj7F4PgYQNbGGG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5XtvkmHauWr29FeS2inMFcwdf327gjSkh3VZ/dSWW0=;
 b=U9ZbvMRrcO28RyLWMmErMXZKyP+Fk+/LNVG8WvdsbheGfYo+Rzrhl+Tpav6Q75LwJfqwxOScxdTkGpn99ySNCrMA9+ccgN4D99y+bJMG9ZZNu45ZOKdNyep/dXTr995VlLKyirgMsc7vTUvW2jg2avSBcm+m7kQD6E/kqTcAoiyaxq4SAjSh1pZfus5c4mx7WJb1Ed0pR3faNeX21ZIclUKQM1nU4EZTnndTSnZNXp2JcjlPZJVVdUwnCD4OGeEftIaycHOT/Or+riM/etmrVRjp3GT9s3RpjKt1ySOwrT4TXLKT0Ci0e4qWV1YXxiQE20k3LWm1FOrgHOpvhzmO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 19:01:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 19:01:12 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Knop, 
 Ryszard" <ryszard.knop@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>
Subject: Re: [RFC 34/34] drm/xe: Enable D3Cold on 'low' VRAM utilization
Thread-Topic: [RFC 34/34] drm/xe: Enable D3Cold on 'low' VRAM utilization
Thread-Index: AQHaUJbLp5yV818hZkCRPdNtvBe49bDwt5GAgAByTYA=
Date: Mon, 29 Jan 2024 19:01:11 +0000
Message-ID: <f45349d57090d1ccdb22acbd94963a104afded9e.camel@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-35-rodrigo.vivi@intel.com>
 <edf5e029-a310-4bd5-ac06-8d42dd389c9a@intel.com>
In-Reply-To: <edf5e029-a310-4bd5-ac06-8d42dd389c9a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|CO1PR11MB5041:EE_
x-ms-office365-filtering-correlation-id: d609a977-b51b-4a5c-6955-08dc20fca90f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HVdYeDIVTArUF4I+Di2I1nx7lvlC44Qu7h/rxkDc5iput5Np34P5ISaKxB+M6QrQqtvbX6WDM0OKfnG2eDhReqMmWdRqyuPJpFeiT3rVXMdLizuYwH/FffJVKeRJ7gc7M4DLUsEZeUK4zh6VhBfOWaae4ENyAasDWSyzJMZsa1F6OL5eTzLLnCsQjLPaklXhhamUzx+9/6R5oFYlGL7FgvQ3fIh4KNlLywWgqUkoUD4ef5wDMWx36KjaVNGkC5MyZswTvhj10OLUHbFrAwKhNiRpVj7nys/ndRjzKefg+NtH7zxYx+zZwMsBT4/LO6Cu5bc39BqLzk+zj5akVfgpzY7JUuJLMy2oPVQ2V48tmEn1KRW+zvqxI9e72qho/WJ+fzOKQrD5cfNGO1f4DpgZDU7ZdKc7t+XhHH+SwBJVnZ4PvV0UFfThe4XPGYOxs5zNLAxeJBRmAwSdYrN1SrPzTiLzrraeFi2vXRaxq/jvmlk1p8NpOq1jzy/7pfMwYmSxiMsIh9zRBqBa0A755/dkuVdLjRc5uYcJDJNKOYosLLHf0CdyvioNs/8a4g6yZMN/gHqvzOsZdlA0cDVf3JaihrXSkQZ0db3nBYU4HFpRsjcWaW2mcYJTUHS6o8wI7OuFh+3FKyCYJd5G3u0+bXNTjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(82960400001)(86362001)(36756003)(38070700009)(122000001)(38100700002)(26005)(6636002)(2616005)(6512007)(66556008)(66446008)(53546011)(6506007)(2906002)(6486002)(8676002)(478600001)(110136005)(76116006)(316002)(64756008)(66946007)(71200400001)(41300700001)(66476007)(8936002)(5660300002)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVZvYUxPK3V5S3p0NVhZODE4cWY0L1dSaXB6ajNzNm1JWWRJelkwOG9xbGlF?=
 =?utf-8?B?Wjc2N3hrQXlMalZVU0FyM0NHaWx4YlhmMHdLME8vYkErWG43L1lQUkQ3cVdj?=
 =?utf-8?B?eWZ5ZDArOFRoMEdBMGRPYm9UdjYwNHo2MHVCejBpekxXRW42R0ZicDExU3FP?=
 =?utf-8?B?VFZIL0M4S3JwNXZ5eFNzV1UxZXV4UW0yUTNCV0FZaXIvM1FiRzRTb3hyMXpl?=
 =?utf-8?B?cGVMNXY1Yks3ZnhVR1U1bi9iQjk4ZGs2dnlUYmJZQmxzZDZ6N1RXRWJiSVVP?=
 =?utf-8?B?Ui9Lb2EwYVRsYzNpakoxN2VYTDZUQ0xwOSt1RjM1bzdndmppWFlLTGlBV3V2?=
 =?utf-8?B?cVRiU2trNmZZcnZuUzRoWC9XYTNFRDBLUnVTbEIzemVUM3JUbG5PYnV0dGRx?=
 =?utf-8?B?aEdqdDJ6RGdNbTdpRXUwN1dTNWhRRW9pc2dkdnEwUFJtYmRKalMxREVyZEgw?=
 =?utf-8?B?V1ZvQzkxU2k5NzVBd3Rhd09HSVFzOUhhdWMwbGNhb095dUxuNFpJWm5Xcitz?=
 =?utf-8?B?YVlHS3ptaUo4Tkk1SEZJK3BwSTRlK3VzRU9QUWp1WGdCU1lIRW5Mb2ZkRDFa?=
 =?utf-8?B?Ky9MVVpFZFZYZFhlYll6aXYwOHI2bVBYVDZlTjVib1lnN0ZVSDRvVGJUaFFu?=
 =?utf-8?B?MnArOVI3Q3Z2QU1UKzd3TUU5Ky9lZ0IwVTNpU2pTVGM4d29oajZBZWQzcy9M?=
 =?utf-8?B?Q0FxblFFY2cvSXdoZWt1WEh1VlcxZ1g0cCttS0ZNQXhzaTgyME1sb2ZKaUFF?=
 =?utf-8?B?L202Ukc2Qzd5SCtCd2RJb3dsWmJ5MENhdjRaUjIxRVRreUJMRGM2ejNnSENw?=
 =?utf-8?B?OERyS0pVMmlqekE0ZkJ3c2dlMkxCQ0F4LzVBdzErbzM4ZDVOL3hPNVhiNEcr?=
 =?utf-8?B?ZTZIbERqd3J0emF1ZXoyVmlrbGV4LzFPUUwwWUVoR2pueGZtRHRSTjkrVXBT?=
 =?utf-8?B?YmF2Y3pka0ZaZ2d1MUVydjF0dHZMK3pBMmpscE80bXNmMExaQktDSkFvYk5u?=
 =?utf-8?B?dWRPWGg2QVFKbnlQVHcySjZMUko3bEx3K0Q0citKVGhicVVKZmRwT2FTbzA1?=
 =?utf-8?B?Z2dIQU5nOHlNODRtby93ZkVtV1pWZE9YZE1tM21vT2w3MFNkQjFnYVZYTElC?=
 =?utf-8?B?cUQzdW5nY2JmcmFmdlhCdXpEWE5BdjhYaUNQN3hMbHRIVTlPL1laZ2RtNXU0?=
 =?utf-8?B?VjM1cTFRcE9lN21xNngzQk1xSlVheGlmNWFJUURCVXNPSWs2U1FOZjhqaDFr?=
 =?utf-8?B?NGNlVnVBRytaall1VDJIRkNUWWNYZUpUTFE1TVBvV01XTlZINnNXMHVTcjAz?=
 =?utf-8?B?K0Q2ZlpHRWdGdDhHQjN4dUNkb0RZZGpvckszeE1mS2lqZFI2aitoMW90WEpj?=
 =?utf-8?B?V1FaY2tEU1kwYUV4ZnU1WkgrenpQMEhGSjBuRm1FWlJtOFREV0s0WmdJQXZF?=
 =?utf-8?B?MXdPOGp6U3lSSXl3SGVUdk1BZCtJRDdWL0VKQllFYVlVd2ptVzZDbmZtOC9m?=
 =?utf-8?B?WWZFalNMbjdQNDhMYkpCNWYyUWtiYUYydU5WRDVzdk9xb3orQll0OEJ1Yk5F?=
 =?utf-8?B?MUFRMU5FUG9XekpIVWNVZ2NJMkpJKy85NEpmaXJHUXB0eEg2NW55VGJlS1o2?=
 =?utf-8?B?c21uLzRKdDZGRWZvK1hyV0dPeDNvbC9BQnZvTnBvL1hXcGNhMUhaL2V5aEhS?=
 =?utf-8?B?WUpzcmwwWHNLM2xqblZmcG1oT0N6NUZvRVN4YnU4LzB0YmlpUjZBcFczQ08y?=
 =?utf-8?B?RWdUQTZRa1E3a2xDWHQ3NUdMdnF3Y0FFU2M1bTdQajVoR0FMSFhlSUlCU3Nq?=
 =?utf-8?B?dmdEZXA3bDZmYmtFYWwrZnpKMHRGK3ZDWUFiQ2lLRWRjL20yY0Y1NFF1YUh1?=
 =?utf-8?B?clVzWjZHN2NyZXRBZ1p1dlA0Zy9GNEtWbDJtR28xVFBTQitSRmpuNW1nOXZp?=
 =?utf-8?B?S3A4S0hQRDluaWpabE9ub0Nocy90RDJhTWgvZFFVbkE4YlJKK1REQWg3emxv?=
 =?utf-8?B?THd3bExNSSt1QWt4Q0NnQW43OUtCOXhQK0tWNG4yamxCQmtDc3g3NS9xdUtl?=
 =?utf-8?B?ZlJOWjhhY3dUUmk2Y2JISU1ZVWhSZlRNcjZydXNqKzhmMnRsNmJneit2RkU4?=
 =?utf-8?B?UnB2MFQvUUsxYlJZM2JYbkoxZWRjdUtMdTlJNFoyOUxhUEg3dTFqdGkvY1ZL?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEDED0CBB39D1142A163042F353F9699@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d609a977-b51b-4a5c-6955-08dc20fca90f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 19:01:11.9785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIS9TG9T7b9HRfg0I3hdBuKbhgm4n7mQ1S9IqzO3vVGpug5VI1heViIUv4iEG9CorxPlx81upgFNAqA28IHC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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

T24gTW9uLCAyMDI0LTAxLTI5IGF0IDEyOjEyICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IE9uIDI2LzAxLzIwMjQgMjA6MzAsIFJvZHJpZ28gVml2aSB3cm90ZToNCj4gPiBOb3cgdGhhdCB3
ZSBlbGltaW5hdGVkIGFsbCB0aGUgbWVtX2FjY2VzcyBnZXQvcHV0IHdpdGggaXRzDQo+ID4gbG9j
a2luZyBpc3N1ZXMgZnJvbSB0aGUgaW5uZXIgY2FsbHMgb2YgbWlncmF0aW9uLCB3ZSBjYW4NCj4g
PiBhbGxvdyBEM0NvbGQuDQo+ID4gDQo+ID4gRW5hYmxlIGl0IHdoZW4gVlJBTSB1dGlsaXphdGlv
biBpcyBsb3dlciB0aGVuIDMwME1iLiBPbg0KPiA+IGhpZ2hlciB1dGlsaXphdGlvbiB3ZSBvbmx5
IGFsbG93IEQzaG90IHNvIHdlIGRvbid0IGluY3JlYXNlDQo+ID4gc28gbXVjaCB0aGUgbGF0ZW5j
eSBvbiBydW50aW1lIHJlc3VtZSBkdWUgdG8gdGhlIG1lbW9yeQ0KPiA+IHJlc3RvcmF0aW9uLg0K
PiANCj4gTm90ZSB0aGF0IG5vdGhpbmcgaW4gQ0kgaXMgZDNjb2xkIGNhcGFibGUgaXQgc2VlbXMs
IHNvIHRoZXkgd2lsbA0KPiBuZXZlciANCj4gdHJpZ2dlciB0aGlzIHBhdGggQUZBSUsuIEFsbCBw
bGF0Zm9ybXMgcmV0dXJuOg0KPiANCj4gW2RybTp4ZV9wY2lfcHJvYmUgW3hlXV0gZDNjb2xkOiBj
YXBhYmxlPW5vDQoNCkJ1bW1lci4uLiA6Lw0KDQo+IA0KPiBJcyB0aGF0IGEgYnVnLCBvciBwZXJo
YXBzIHRoZXJlIGlzIHNvbWV0aGluZyBlbHNlIG5lZWRlZD8NCg0KTm8sIGl0IGlzIG5vdCBhIGJ1
ZywgaXQgaXMgYSBsaW1pdGF0aW9uIGluIHRoZSBERzIgcGFydHMgdGhhdCB3ZSBoYXZlDQppbiBv
dXIgQ0kuIEFuc2h1bWFuLCBkbyB5b3Uga25vdyBleGFjdGx5IHdoeSB0aGVzZSBDSSBwYXJ0cyBh
cmUgbGlrZQ0KdGhpcz8gYW5kIHdoYXQgc2hvdWxkIHdlIHB1dCBhcyBhIHJlcXVpcmVtZW50IGZv
ciBvdXIgQ0kgdG8gZ2V0IHBhcnRzDQp0aGF0IGRvIHN1cHBvcnQgRDNDb2xkPw0KDQo+ICBNYWlu
IHF1ZXN0aW9uIA0KPiBpcyBob3cgdG8gZ2V0IENJIHRlc3QgY292ZXJhZ2UgZm9yIHRoaXMgaGVy
ZS4NCg0KV2VsbCwgdGhhdCdzIHRyaWNreSBhbnl3YXlzLiBUaGVyZSBhcmUgbWFueSBvdGhlciBm
YWN0b3JzIHRoYXQgY2FuDQpibG9jayBEM2NvbGQgdW5kZXJuZWF0aC4gVG8gdmFsaWRhdGUgaGVy
ZSBzb21ldGltZXMgSSBuZWVkIHRvIGZvcmNlDQp0aGUgcnBtIGF1dG8gZm9yIGFsbCB0aGUgZGV2
aWNlcyBpbiB0aGUgc2FtZSByb290IHBvcnQuIFdlIGhhdmUgYQ0KdG9vbCBpbiBJR1QgdG8gZG8g
dGhhdC4uLiBwcm9iYWJseSBuZWVkIHNvbWUgYWRhcHRhdGlvbiB0byB4ZS4NCg0KQnV0IHdlbGws
IHRoZXJlJ3Mgbm8gcmVsaWFibGUgd2F5IHRvIGVuc3VyZSB0aGF0IHRoZSBlbnRpcmUgQ0kgcnVu
cw0Kd2l0aCBhbHdheXMgZW50ZXJpbmcgRDNDb2xkLiBVbmxlc3Mgd2UgY2FuIG1ha2UgdGhhdCB0
b29sIGFuZCByZXF1ZXN0DQpDSSBmb2xrcyB0byBlbnN1cmUgYSBwcmUtc2NyaXB0IGJlZm9yZSBl
dmVyeSBydW4gb24gREcyPw0KDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28g
Vml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcG0uaCB8IDcgKy0tLS0tLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BtLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oDQo+
ID4gaW5kZXggMGFlNGY2YTYwYzZkLi5iYzZiZDJhMDExODkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BtLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cG0uaA0KPiA+IEBAIC04LDEyICs4LDcgQEANCj4gPiDCoCANCj4gPiDCoCAjaW5jbHVkZSA8bGlu
dXgvcG1fcnVudGltZS5oPg0KPiA+IMKgIA0KPiA+IC0vKg0KPiA+IC0gKiBUT0RPOiBUaHJlc2hv
bGQgPSAwIHdpbGwgYmxvY2sgRDNDb2xkLg0KPiA+IC0gKsKgwqDCoMKgwqDCoCBCZWZvcmUgd2Ug
Y2FuIG1vdmUgdGhpcyB0byBhIGhpZ2hlciB2YWx1ZSAobGlrZSAzMDApLCB3ZQ0KPiA+IG5lZWQg
dG86DQo+ID4gLSAqwqDCoMKgwqDCoMKgwqDCoMKgwqAgMS4gcmV3cml0ZSB0aGUgVlJBTSBzYXZl
IC8gcmVzdG9yZSB0byBhdm9pZCBidWZmZXINCj4gPiBvYmplY3QgbG9ja3MNCj4gPiAtICovDQo+
ID4gLSNkZWZpbmUgREVGQVVMVF9WUkFNX1RIUkVTSE9MRCAwIC8qIGluIE1CICovDQo+ID4gKyNk
ZWZpbmUgREVGQVVMVF9WUkFNX1RIUkVTSE9MRCAzMDAgLyogaW4gTUIgKi8NCj4gPiDCoCANCj4g
PiDCoCBzdHJ1Y3QgeGVfZGV2aWNlOw0KPiA+IMKgIA0KDQo=
