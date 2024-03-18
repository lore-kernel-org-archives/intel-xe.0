Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E010CC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B6610FE19;
	Mon, 18 Mar 2024 19:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/8OWRm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C4710FE19
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710790041; x=1742326041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uEpXePnHjW1cT/rXcXoBy0vRstRUCTUnbdXmYQWJUyk=;
 b=D/8OWRm6JGPB1GqpwWI6qb3lxw0WPynvYmIBZsRjLR1f/Y3gyqykkxaV
 /xUIKRIIvBfRa5JOvHKo4fJEwtsIs7PEXjW7Mt/R25UmWATX5TV9sYSsw
 zT3PY0dh/MQYnpe9y2/e2V9DDtEqXC57ApI2/1eW0oOgwiySga7wRRVjW
 JAQg1q1KnHXSzDeo+FtXJnqg3UBgpFO/E5e2r0elKtFR0t1N6iBDD3Czj
 ZqeB0djqiLu3MnaE6dQjp07+0Gt4rAbpjSW9pLryr540uOmXGlje5/BVv
 LFjDDnRa9f7JcAWEGvuFsiMx9xUMt0/lzONJ43lU948ca40k7fik/rFEB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5486550"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5486550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18039833"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:27:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:27:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:27:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKWMTjhlWqr/MHUCiXBJrKf7p/PW7MA/L9cja2shXRc7XHltnFi0MUhJ/Euoauv/gaz6wJohTqDGSPrxRVyGLMn3t2Wbne32znRKu32gBywprfCXt5MuTbE1kN5NP6AmmDeC/e9e4TMFXvIO4pEMpP3CQ6vT1aUJ1l+PmyQkrWmaDW/csxyixyLoXpYvDp3I8t1CAm71cvMr3Ix4Bjnoovwe+JX7k03hZpq8CnZUrWnvqaSU3CKMUsSof75/WV6Qr43r8R5td2AoHZHLUf00mI9tf+6LP5raiBL2NZ/tdmUY+OlKWGm1Q0yCTwpvRpx5iO+zRbPm5FwMGh0xzAPvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEpXePnHjW1cT/rXcXoBy0vRstRUCTUnbdXmYQWJUyk=;
 b=GAh06Er7pIxdtIxsBAUEdVMiiHczhl4iIfaxeKMLnMY5ovLFvgy4drIMakeDkgnlYU6+Qoyekj30vXLiSjgScvJQhazFVq1xJZO4j91AWUIB+TYyEYnKrLkdcj47ZEyZpokxC2VU+Tm3kLumNRfZawVVrSQWseU8gLae4rijeimUbzoGWKdPXrWJxPch5sppdSrU3pFkIqOBo9VicQNv9n4taxm2xx//LX8UtYGjun/TXR0LAdV6LSgzM+TtOm+Sqa8SFPhxrKpyNg0rZ+rO3kqYTyuiAoEea/fVZQzwH8LUlguBuxM/SQFAPUkZb0lMYLHyh0zqwQWgyDmdmQYihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 19:27:17 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 18 Mar 2024
 19:27:17 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Topic: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Index: AQHadb8bBxOarH+uokOgL+zi+HiXOLE3gYaAgAXtSgCAAHorkA==
Date: Mon, 18 Mar 2024 19:27:16 +0000
Message-ID: <SA1PR11MB6991787BCACDB5085E55D6D2922D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-4-oak.zeng@intel.com>
 <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
 <37e37163450c4b5c41587cfa354500b7f06f4d20.camel@intel.com>
In-Reply-To: <37e37163450c4b5c41587cfa354500b7f06f4d20.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|BY1PR11MB8079:EE_
x-ms-office365-filtering-correlation-id: 8c3a5ad4-08e2-4343-815a-08dc47816c1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8WWqN0mpQjGJhGgOX2YgHjcOF9Z+gpAr353oBOFqsRxNAYxliOXL2Fyfidu8v2S0ZjExjixWYzZDsJGOrLzl8FydEl2RZ5hOP/szx4MUzTi9unWcVHCleJFqFgWz2H8VL76x9jNbfC7xoNyH2n9cPtWirOnMYSuZcOO5R2eZ5OBlFRs8781HcCxyrmksWFgRGpG5B/aufX3EcC92F299P0+bC1ExoGAo5uwkawVO9N5U9+eEmzogHdG0CmXndE0OhFrDnXT/5ajGrS5u9wjpIGr92Qdx4QMCokzUC7xNOjKZC+H8k/tBD0Sc01B4u7nfKQem5+/wsT2RLA7+/q8rYOtzmVH7Bw47oEXKnkAhBvhlbFKRBwRadBdIpbU9oet7G7VNJpvROx+6L00gXaj8tmeCPoNBPb5n8gnVXahB+ia+rUuRsX7mm/nd5cK/tEMdT60BddnNfmYA7SQbQ+iNkz5nBs7l0swL32sr9MGsaHaI2yPqznRR6JdJbk6aOqCfiFmAvTjtX2a8vP97qwkK+Zu1zjYrVvM8XVeLrFLw6uwKaImQ/TEGhm/iF2TY07JQV/rFpN/Krs9P9h6wKAfTp6KTknUtY8wbJ/HuRrWKY1uZY47xQ4EPFULlSyejqbwZGTaouOqvbSMieXKcvOufvzEO/as69c6nYLGKQJINb7Mp7cd0MmksA7ux3+j2klPn7aSzzAFroDrjJhcuoArzkUJfVVHyJRbLCMLEbECxMMg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWJtQytlUXBCQTU4b3FjTSswbzNGdStaWm1sM2F4RHRvSnBiNVNNRGRDWEdQ?=
 =?utf-8?B?cTEzOVBQK2gwZVpFVlRHQ0pqY1o0WHhmU0dIeFJyaGFjeUVoY1N6djZNYjYw?=
 =?utf-8?B?QnViaXdlNVllWmZPY0l6ZGljWU1JVThSNUU4TWFacnVjUHZpQWJvaUZMTHVl?=
 =?utf-8?B?enk5QksxTmJzQmdQa0ZRMS9JV2RubStiUzRvMDk5UEFlR2NtMGNKeFZ5WVh0?=
 =?utf-8?B?Zk9NSmtoZXBSeUJSMVN4Q3R2SnBUb2JjU0pUejk5UkRlNmtMRy9ZOTEwRmtD?=
 =?utf-8?B?eENSRUNuN05PYkM4WFhka2VNNldjcFhUb3IyNDloSk9ZaEE5d3d3RUNhRUV5?=
 =?utf-8?B?ZTgzTHJVRm9oZXU5QzFhWmRwdm5kVy83ZlFyb2xIaXdVVU42K21vWTZKL1p6?=
 =?utf-8?B?UWRGb2krODF0a28yVHNWeGtDVHpRSDkyT1JOaFdraVJUb3h6OG9HYTlLZ3Vo?=
 =?utf-8?B?ZGZOemZsYjBGYlUwRTRsVUtFVHRpQjVESXQxc2Y0RzI0QjRGVWczMFlFcDRj?=
 =?utf-8?B?NEZ0ZXdjMi9DT2Q5Szk3R0lLWnBXQ0JUbGhmSTdMclJVRGFmcDhjT3R0Qy9h?=
 =?utf-8?B?d3NjQkhqUE1RKzFGZUNmMzZ5dG5lTXB0eHZCOU1mb1lNM3VDNWREL2F2SXBx?=
 =?utf-8?B?RllxbDFHVUJ6QWdXam1RZmp6MU1CVlBHck9DWFpwM0JkczR3QnRPbE5wTVhn?=
 =?utf-8?B?VWhiTlBzM3RaeXFjRHUvK2dzYVpNbHhUd2R6ZWdObnUxRGQvVGQrVlR1ZTVl?=
 =?utf-8?B?RUc3ZU9XdFZuanNlTmFLQ1lqSk14NU5SV2JLVWRkT2ZxRVFmWGU0UW5UNUFD?=
 =?utf-8?B?TU54Q3NSZjB3NkMzWWRvZWVsU0RpbVNMN2NENHh3SUc5dGJFQ2I5a3JWcFFh?=
 =?utf-8?B?RCtiaXhKMmxCU2RhYVh1VWxLWEMxL1BCV0NnSlo0em9QRk9mVTQ1TzVPNjcy?=
 =?utf-8?B?V1lCYWJiOTZtR2pIbTAyblJZTFliRzQxcHpTWmtaTDJzVUNMUFJ2OUNXTHRp?=
 =?utf-8?B?MTlaVkN1b2YrUlIvMjRodzZGNlBsQjMvbitxOTcxdHVwNWsvK1pmOGZRb1du?=
 =?utf-8?B?VCtSbDExK1BadFdpYjJGa3M5OVZYeHFtdVRYbVo5cnV5OVo0Mm1yaWxFRng3?=
 =?utf-8?B?ZHFEZ0Q5V2tWd2p4UURmYy8yeUlTc2VpQ1ozMFZUejk0RmFYWGR2S3BPLzk5?=
 =?utf-8?B?cFdoVE5Ndk1PZlZvNjVoQXN2V3ZRVHk4V3FWTnM4a1docDNORzJpK3J5VkEz?=
 =?utf-8?B?ZTFqTDlid0ZOWTczL1dtdm53UUVEZkszSExYK0VPdjV3WXhvb25IK24rMXhl?=
 =?utf-8?B?aGl0TUxrUVBtYmZ5OHcvZkZTYkZVT2VYUXlsM0xaUHlhRFdyUnA0aXQ2a1FP?=
 =?utf-8?B?UXVQcVNTcWI2Ym9HN1ZscjF3WUlUVGsvN1FKbS9MMkNRd2xvUVJsdnI5czll?=
 =?utf-8?B?VGpQV0F5NHFNcmNMa3ZMM2tTNUdPWjFjSS8rQlMrRC9sNFM2VDhzeUVSOCs1?=
 =?utf-8?B?MWpId3dJSXRoMW0yZHIwTkRVeGVxaE84czRtTkJSdlU2T21NTm1KNGlqUXd3?=
 =?utf-8?B?QjZsbkhOMU1WQmpIT0lkMXYwcDhJUnVCeWoxUVV0dzUyNVMrYmxROFlpTy82?=
 =?utf-8?B?Q1RvKzF4NkRwanhTVnQ3ZzBiS3ZOd1VNZjJUVk1oV0YyVFVPL2VjT24ydjFI?=
 =?utf-8?B?ZGFMbTljTGZlaVlPQzNzdEE5OWZ1cGdPU3pFMWZpS3VmaHAwdjRQN1VKQVFt?=
 =?utf-8?B?SUM4eURxajQ1c1NrWkJNQmowTEo1MDJvcDdpM0dGRHBGQTVXRmRwN2l3V3Qr?=
 =?utf-8?B?a01NeEJVMWJsOC93MjhNenlLOSszZFFWRXNCYlRIYU4wSGNrSjE2dG5xVlo2?=
 =?utf-8?B?UDdTS0hGMGJ2TEZIbllCc24zcUNqQ2ZVaHNLK3BpdW1ZOG1BQTVkczFqR1Fk?=
 =?utf-8?B?SlJnSGIxVVNQOUpZVjJYNTRUMlVQVE01ZTAzTlVNMlFYM0dvVS9OdHNxSUxq?=
 =?utf-8?B?U1ZPbFRwZVI0b2RmczYyZmpwM0tYUDUxUEdmQTArNWJBeWs2b2I2V1JjRHVi?=
 =?utf-8?B?Y0MvelJ6bTBCZGlWTUFOWS9VNUhlcktBZVNpeVowZ0lOR1RNcGVKZllXTlRJ?=
 =?utf-8?Q?0HOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3a5ad4-08e2-4343-815a-08dc47816c1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 19:27:16.9251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oD2fv+5C3qlg66G/s8QHJDG6mT1o/1KXSyXAdfVc8vjTvYUV+MJf09uxrP5Tg9KOOvE7I3ctIc2yuXTImuk7EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVsbHN0cm9tLCBUaG9t
YXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDE4
LCAyMDI0IDg6MTAgQU0NCj4gVG86IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IFplbmcsIE9haw0KPiA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5QGludGVsLmNv
bT47DQo+IGFpcmxpZWRAZ21haWwuY29tOyBHaGltaXJheSwgSGltYWwgUHJhc2FkIDxoaW1hbC5w
cmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNV0gZHJt
L3hlOiBIZWxwZXIgdG8gZ2V0IGRwYSBmcm9tIHBmbg0KPiANCj4gT24gVGh1LCAyMDI0LTAzLTE0
IGF0IDE3OjM5ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+IE9uIFdlZCwgTWFyIDEz
LCAyMDI0IGF0IDExOjM1OjUxUE0gLTA0MDAsIE9hayBaZW5nIHdyb3RlOg0KPiA+ID4gU2luY2Ug
d2Ugbm93IGNyZWF0ZSBzdHJ1Y3QgcGFnZSBiYWNraW5nIGZvciBlYWNoIHZyYW0gcGFnZSwNCj4g
PiA+IGVhY2ggdnJhbSBwYWdlIG5vdyBhbHNvIGhhcyBhIHBmbiwganVzdCBsaWtlIHN5c3RlbSBt
ZW1vcnkuDQo+ID4gPiBUaGlzIGFsbG93IHVzIHRvIGNhbGN1YXRlIGRldmljZSBwaHlzaWNhbCBh
ZGRyZXNzIGZyb20gcGZuLg0KPiANCj4gUGxlYXNlIHVzZSBpbXBlcmF0aXZlIGxhbmd1YWdlIGFj
Y29yZGluZyB0byB0aGUgcGF0Y2ggZ3VpZGVsaW5lczoNCj4gU29tZXRoaW5nIGxpa2UgIkFkZCBh
IiBvciAiSW50cm9kdWNlIEEiDQo+IA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE9hayBa
ZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgOCArKysrKysrKw0KPiA+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmgNCj4gPiA+IGluZGV4IGJiZWE0MGI1N2U4NC4uYmYzNDkzMjFmMDM3
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
DQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiA+
IEBAIC01NzYsNCArNTc2LDEyIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHhlX3RpbGUNCj4gPiA+
ICptZW1fcmVnaW9uX3RvX3RpbGUoc3RydWN0IHhlX21lbV9yZWdpb24gKm1yKQ0KPiA+ID4gwqAJ
cmV0dXJuIGNvbnRhaW5lcl9vZihtciwgc3RydWN0IHhlX3RpbGUsIG1lbS52cmFtKTsNCj4gPiA+
IMKgfQ0KPiA+ID4NCj4gPiA+ICtzdGF0aWMgaW5saW5lIHU2NCB2cmFtX3Bmbl90b19kcGEoc3Ry
dWN0IHhlX21lbV9yZWdpb24gKm1yLCB1NjQNCj4gPiA+IHBmbikNCj4gDQo+IHN0YXRpYyBpbmxp
bmUgaGVhZGVyIGZ1bmN0aW9ucyBhbHNvIG5lZWQga2VybmVsZG9jIHVubGVzcyBzdHJvbmcNCj4g
cmVhc29ucyBub3QgdG8uDQoNCkdvb2QgcG9pbnQuIFdpbGwgZG9jdW1lbnQgaXQuDQoNCk9haw0K
DQo+IA0KPiAvVGhvbWFzDQo+IA0KPiANCj4gDQo+ID4gPiArew0KPiA+ID4gKwl1NjQgZHBhOw0K
PiA+ID4gKwl1NjQgb2Zmc2V0ID0gKHBmbiA8PCBQQUdFX1NISUZUKSAtIG1yLT5ocGFfYmFzZTsN
Cj4gPg0KPiA+IENhbid0IHRoaXMgYmUgbmVnYXRpdmU/DQo+ID4NCj4gPiBlLmcuIGlmIHBmbiA9
PSAwLCBvZmZzZXQgPT0gLW1yLT5ocGFfYmFzZS4NCj4gPg0KPiA+IE9yIGlzIHRoZSBhc3N1bXB0
aW9uIChwZm4gPDwgUEFHRV9TSElGVCkgaXMgYWx3YXlzID4gbXItPmhwYV9iYXNlPw0KPiA+DQo+
ID4gSWYgc28gY2FuIHdlIGFuIGFzc2VydCBvciBzb21ldGhpbmcgdG8gZW5zdXJlIHdlIHVzaW5n
IHRoaXMgZnVuY3Rpb24NCj4gPiBjb3JyZWN0bHkuDQo+ID4NCj4gPiA+ICsJZHBhID0gbXItPmRw
YV9iYXNlICsgb2Zmc2V0Ow0KPiA+ID4gKwlyZXR1cm4gZHBhOw0KPiA+ID4gK30NCj4gPg0KPiA+
IFNhbWUgYXMgcHJldmlvdXMgcGF0Y2gsIHNob3VsZCBiZSAqLmggbm90IGEgKl90eXBlcy5oIGZp
bGUuDQo+ID4NCj4gPiBBbHNvIGFzIHRoaXMgaXMgeGVfbWVtX3JlZ2lvbiBub3QgZXhwbGljdGx5
IHZyYW0uIE1heWJlOg0KPiA+DQo+ID4gcy92cmFtX3Bmbl90b19kcGEveGVfbWVtX3JlZ2lvbl9w
Zm5fdG9fZHBhLw0KPiA+DQo+ID4gTWF0dA0KPiA+DQo+ID4gPiArDQo+ID4gPiDCoCNlbmRpZg0K
PiA+ID4gLS0NCj4gPiA+IDIuMjYuMw0KPiA+ID4NCg0K
