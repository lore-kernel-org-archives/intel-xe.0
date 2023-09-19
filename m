Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3661CD343C
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 05:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBFD10E3C3;
	Tue, 19 Sep 2023 05:39:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD31F10E3C3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 05:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695101966; x=1726637966;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=yZ5qbl59sNwvrTI12tV6+ieo/JTicFly5Jl4sre7Vbw=;
 b=DrwoKsWQhZDigwdqZZ2hgBAjp9GjZzK+PhcFU9/n/qHg+mSi8wzVFeFU
 G7cS8KimipJYY856ekWCUXxFoa4xoy6aIDpfdlCrHwb4Rnm4uQpAwYjJ+
 kpM8dhV/urxX5UE6+0qhyxiNm3wqNBV7Ls69D6pFh3SzYC/O1gv+xAJ+Y
 ZXSsgrKJK1xpI7jKDQbgUqXHaBwI+WYNZVi71qG3pPZi4MgJoGhvrkyFq
 xrKnDi8fqoMmU1pdzQ2LqbPQqsee3FC/Oo5JIdo3pcnfZXDjuGd3qbRlj
 Lyz7wHBPHyaP2WbhmjhXwCZAHY28/y5honcMCofEqnkfYgtDhKeMlIVPC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443939391"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="443939391"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="993028226"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="993028226"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 22:39:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 22:39:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 22:39:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 22:39:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 22:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc1lf8RCuJTOHeLv4COjnAJ2/mtGECCU7Q4VwstQyWQvA5cJCwAHlGQEBWGZKtIZDe/F8lUmgsOPIj3iJFLB/c3IYXaN7J3l+h4IQ4zD2AK1GuOJNRGzP3XhXYgB7QYvzFiNSNzITtmsTObUao4hEnnaopp0DjBhSmLBv9yGHbismU4aK7ronxPQ4fGpzgFqbXn9Ii9p5cv06SYzFKW1FbvgaoY2uh2NRH3QIm3+7bhj6RYKCZPqScv0SHcGx0ZmM29uiydwqPBaCWsg85zRV93GXGX2ocsSxT1sNttmTekG1CGW6XOcOSDOqQUlZ0H9j5Fs8GDU3DWooWYEYNFn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ5qbl59sNwvrTI12tV6+ieo/JTicFly5Jl4sre7Vbw=;
 b=JohaUzNX7iT4qSpsF3Dyb79D9loI7vC6OucdDTZ3JcooRzGnYHnw8HXPQWk1p20xgjRYm9kYGz/wvUSIAv3jSqwAVL4j3mwKRBcaScXXOzROmFAeRSqz3JqzJlsqcyYzM+z1svZn0QnSsyWPR+8wpkerLzLSAwioXMo51jfeKNU2pO/WMcccHBIAhmQpK5P2fySG2jTLMjdzu9RHh8mZjqrG4IzFnxDVaWflvWWuWmU1+aIjDawNk8/PcWuQnE46zaDeAKmRE2ESFru8733F3OLwSz3omFQ0oH+SgGYSN6ZIuyc2u/m7PIKUL+aQ6Fp7RiN6hf9g2+brClaRMONySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 05:39:21 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 05:39:21 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
Thread-Index: AQHZ58N0dDEA8XNhjES1j3pSzGdzXLAhFP8AgACSwAA=
Date: Tue, 19 Sep 2023 05:39:20 +0000
Message-ID: <fbdb146cfcea0dd1bb147a669836081cccda7e5c.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-2-jouni.hogander@intel.com>
 <826cdfdb62b6033f60aeaa9d6384b3d92a4e81fc.camel@intel.com>
In-Reply-To: <826cdfdb62b6033f60aeaa9d6384b3d92a4e81fc.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB7342:EE_
x-ms-office365-filtering-correlation-id: 2c3923b2-a1b8-4364-a780-08dbb8d2c61c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CoEgUS0XgVmeTDL5lPjp1M5Ccuw116dRXw1p4O8ggQTcoRn/cL5NyTttCs0nvynyk+I61TTpMcZxtKcj7QT1c2rkkOhv/0xMkq16B+zMgeR5tiLMkWoAFQfPjrW224PqEFVXfbu+W4V2w808/S2Qdj+jxOlsFG2jGt+wHG4Ev3DFNkpsbF5wyUw5/DEkQ/cM+8pbAJFy0XN8Csz56UFyXeC6SpkWA3ETvXS70madlnOoMPaLh1DK9b/PgCpBKZq44eZIe68kHiZ0uz+Sh2IR6MatTpyJP7pqw4yLB1UJRgxpXRz7Uf8NHdrvZwLUIGUP5rhKwpDHVx3s4NthBRGtyScKx0s3zJnkSMep6Oh4KlgchauNulNLO7kctDLt8X05n3wloHkK33DvRzoFktr6XAJvvhw3mzOm8I2UZgtTjUsUrKqdOKTPw+z4un3deNBNxdEIIcZsavj/XdSoPnTCWlfK0Agie0k/OhweGxFOB5/szyiOeGSR7OZCI9SQ0FQQ/YHt7lp6rX0DIsLyKm05sawRgOz9ZujLiIBp3lbm+RQBasmuDBy87kZmZqJzhdVCiQ9L0b2VIWKSYvfJ1Xvtvl31ItzQ5qDMk15loi4idyXWzw4S76vwqFlIY9t4ziTu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(1800799009)(451199024)(186009)(478600001)(41300700001)(83380400001)(5660300002)(71200400001)(2906002)(91956017)(66946007)(110136005)(66556008)(66476007)(76116006)(66446008)(64756008)(316002)(8936002)(6636002)(8676002)(6486002)(6506007)(6512007)(2616005)(26005)(66574015)(36756003)(122000001)(82960400001)(86362001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkRDTTdRck51REFkcFB4SklORkovK2VEbTJvd3RWQ0lBU2h5ejVrZTZSSndC?=
 =?utf-8?B?WGcyakFsQTBkTHo0L3BCY3ZUWUUwTGJsdWFBWC9LZTV4RHNrWDUzU3pxQnla?=
 =?utf-8?B?RUJOT3pxK0VqMzJQcFpzZVFDYi9jZUlieTU0Z3M2eTdEbEMxV3lIanN0TTRN?=
 =?utf-8?B?MGlmcnVtdmM3L2I2Z2lYZzlJd2xkUFg0NHdiVWVRUi93ZU4zS1BqQWZPOUln?=
 =?utf-8?B?eGNyM0dEVlU4WjM3M2xoaFVkV2N5ZVk1clh4Z2hkZXNFTVBRRmVkWHExb2Ux?=
 =?utf-8?B?L0dxcS8xYkx3MXk5a1RLZGdNR1oxL0M2SThpc3FLUWFiREhTL1ppaThXeDZI?=
 =?utf-8?B?MTRZS2hPYVdta1VydGw3V3ZCYTVhS3pVZnBqU2VhTS90SVgwRmlaMi80RnVo?=
 =?utf-8?B?elFFK1JvTGwrYjFBMk1CNmZMeStUU1BzenhGaXJjMmhDQjRqTHRnUGhjWXZ4?=
 =?utf-8?B?azZ0dU1KKzBpcndFZ0FaT21lQ2Q2UFNQYzhOelJtWUx6RW1QTXVLY3NYOFBT?=
 =?utf-8?B?WUJGaFNGRUgvVngyRDRha0tSTTQ4VlZzQTEwdTJLa0lKRzJsc05jNnpwMzha?=
 =?utf-8?B?aWdmWW5JRCtVQWgzRk1ZQXIwVWVVL242ektBSGlrWUxsRnFBaFgyRVJaaks5?=
 =?utf-8?B?UEZkS0tBbUg1VlFuTys1NG1YTGxXMUpaVklZQWpNcnJHOHRnMFRCdHlsU1B0?=
 =?utf-8?B?V0JsWUFLb0FmMk5KdVdhdTBlclk0WCt3SEhsQ3NjcXJuTWNsWVFScGhpTDBP?=
 =?utf-8?B?enZBemsxWmFNUGprajNyazc0cUdwcW9Td0FobWd1aGFLQlk3Zmk3eWIvWEdM?=
 =?utf-8?B?MHFPcVo1NzZ5c2FGNkVkQWlzZzgwd2puWGJUcVBya1pWeVpQeEwvQ2QwN1Ro?=
 =?utf-8?B?UGlpVkcwUEFzYTJDODZOS05HQzZWTmc4Ylo4QzE5ODNncHZydTlXRG90K1pL?=
 =?utf-8?B?cHpEQjFNNFRPNmFFWExFSVgrdjN2T1VYUW1TWlJ4alpNcDY4YThJWDdOK1Fh?=
 =?utf-8?B?Q0hiNCsvVkw1Tm5NKzQwRTRlb1UyMWh0Ym4xVWl1dm1KZmpBWFFkSzMyb3Fk?=
 =?utf-8?B?c3VkZE1zNVlqRGZZQ2ZNZ2RxZXhGck8vMXlUcUlVWVRqVHZIZGVja21iWUtY?=
 =?utf-8?B?bzJOYWpoRlpMY1pYZUNjd0hQQTR1NWdxaU5VM21UVDdiOXd1aTFwOVdtTDla?=
 =?utf-8?B?a3FoaUEzWktLcjErV1p2ckl4eTM1ZS90ckFZMDFaaE00Z3NtOHN2OEhIbzRC?=
 =?utf-8?B?TVNuOHV3WjM0OWRneGFuTkhTQjVhVi9BYkU5ZDE3M2hPVE90SnVXT1RpdUZ5?=
 =?utf-8?B?TlAweEk1U1NnM2l2OWhyTlpHMUd0eCtqZFpjS1VDYlZZV2QxZWlnb2pqR2py?=
 =?utf-8?B?STlXVERHLy9ZTFBwNkYrbTYyVGFjcmpqNXNQaW11MkhaNXV4dkZSUFgwR2ln?=
 =?utf-8?B?cTdqc0ZBTFVVV3RENkNvV242bXRxZGt5MEtKZjVGL0NZNVFYRm1nZk95aTNl?=
 =?utf-8?B?dDZwSW9yL1lhVDY1SUMxQkNVUVBqLzRZWnpIc3V0UmJJQWhDSXZoTU93VXhl?=
 =?utf-8?B?Z3JGNzlVdFRuS1h0akl6b0hSWXcrbFN5MkNpNFBwamRjMkFDYy81Vlh2SDRW?=
 =?utf-8?B?bTQ2TGcxMDkyaVZibWZadkd3ZHhQSG0zVnFoT09pRVRNeXd1Qnl5ZXNvaFlS?=
 =?utf-8?B?Y20zK3BxMGpRaEd5N3JBSVpJNzlFWUZXTm1DajJ2dkJyR0RPRU5EZW5KOW9G?=
 =?utf-8?B?TXVuaWhFTXVWUkdxck9tZ1dZZ242UGJGeG44QmJyZmlDZStoclB6TEJ3MlRk?=
 =?utf-8?B?RGZCQmJUbmlYTjhKQU1nd1BFNjhxbEZ4ODdZNEFlVTJQb1VNblJwckhuOVdP?=
 =?utf-8?B?ZWZITHFSTUJ4bElhV0ljeTl2RTQvZDRLNW55SFZLdWxxR3J5d3RyRE0xd1Rj?=
 =?utf-8?B?T0dudy9vWWc0UXJLZDRqVGNGbWdld1QwZlB0OVl1N25CSjRSM0tJS1FuYlBU?=
 =?utf-8?B?VXAvWXJTdzFZdU0rQkt4NnA1MGo0c0dCRm9LR3E2OVZ5TU0ydmlPQmViMHJi?=
 =?utf-8?B?clh3U3ovTDFFQWsxQ0NSa1ZUVjlmUVRxVFRBemVUajhXSVFGM2pxaERIWG8w?=
 =?utf-8?B?R3JlWSt0d3NzMjg5Nk5KZUVDd0tNblFhWGdwOTBSZHpucGtUMEV3ajdPYzg3?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D726C0ED6CDE7341BF9DAFEF58588677@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3923b2-a1b8-4364-a780-08dbb8d2c61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 05:39:20.9235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFcQFfUpNLLHgHxWk/7oX8+k9oO4pDaM/t4pylKxTsgHAiDH5tumkdplZZTVgJ7Tx94Cn5ULFH7VyCqVNiFwKF5EjhOaoRG5hPZUcp6sWeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
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

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDIwOjU0ICswMDAwLCBHb3ZpbmRhcGlsbGFpLCBWaW5vZCB3
cm90ZToNCj4gT24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjU3ICswMzAwLCBKb3VuaSBIw7ZnYW5k
ZXIgd3JvdGU6DQo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBjM2U5NDJhMDY0MzNlOGM1MzgxMDhm
MjRiNGZlNzhhMDkyN2UyYWVhLg0KPiA+IA0KPiA+IFdlIGFyZSBhYm91dCB0byBiYWNrcG9ydCB1
cHN0cmVhbSBjaGFuZ2VzIHRoYXQgaXMgdGFraW5nIGNhcmUgb2YNCj4gPiBpbmNsdWRpbmcNCj4g
PiBpbnRlbF9mcm9udGJ1ZmZlci5oIGFzIG5lY2Vzc2FyeS4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gDQo+IEhpIEpvdW5pLA0KPiANCj4gU2hvdWxkIHRoZXNlIHJldmVydHMgYmUgbW92ZWQgYWZ0
ZXIgdGhlIHBhdGNoIDQgaW4gdGhpcyBzZXJpZXM/IFdvbid0DQo+IHRoYXQgY2F1c2UgYnVpbGQg
ZmFpbHVyZT8gT3INCj4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGlzIG5vdCBhY2N1cmF0ZT8NCg0K
SSBjaG9vc2UgdGhpcyBhcHByb2FjaCBhcyBiYWNrcG9ydGluZyBwYXRjaCA0IHdvdWxkIGhhdmUg
bG90cyBvZg0KY29uZmxpY3RzIGlmIGJhY2twb3J0aW5nIGl0IGZpcnN0LiBPbiBuZXh0IHJlYmFz
ZSBhbGwgdGhlc2UgcGF0Y2hlcw0Kd2lsbCBkaXNhcHBlYXIgYW55d2F5cy4NCg0KQlIsDQoNCkpv
dW5pIEjDtmdhbmRlcg0KIA0KPiANCj4gV2l0aCB0aGF0IGNoZWNrZWQsIA0KPiANCj4gUmV2aWV3
ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29t
Pg0KPiANCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9w
bGFuZS5jIHwgMSAtDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJz
YWxfcGxhbmUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVy
c2FsX3BsYW5lLmMNCj4gPiBpbmRleCA0ZDAxYzdhZTQ0ODUuLjJkZWQxYmNjZTc1NCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxh
bmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNh
bF9wbGFuZS5jDQo+ID4gQEAgLTE2LDcgKzE2LDYgQEANCj4gPiDCoCNpbmNsdWRlICJpbnRlbF9k
aXNwbGF5X3R5cGVzLmgiDQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfZmIuaCINCj4gPiDCoCNpbmNs
dWRlICJpbnRlbF9mYmMuaCINCj4gPiAtI2luY2x1ZGUgImludGVsX2Zyb250YnVmZmVyLmgiDQo+
ID4gwqAjaW5jbHVkZSAiaW50ZWxfcHNyLmgiDQo+ID4gwqAjaW5jbHVkZSAic2tsX3NjYWxlci5o
Ig0KPiA+IMKgI2luY2x1ZGUgInNrbF91bml2ZXJzYWxfcGxhbmUuaCINCj4gDQoNCg==
