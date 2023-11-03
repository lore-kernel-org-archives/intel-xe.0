Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976ABC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 09:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84D10E4F4;
	Fri,  3 Nov 2023 09:18:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4092110E4F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 09:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699003104; x=1730539104;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vsSCtl/8TT+BAQ+e+uruZBXZuVNQe7zkDZRGW6qEA/0=;
 b=TP4sF7O8AQOStq+ox8qeg17xXYWEATLtWExqbHi9M5BBQFlmhmS2XbkR
 U96jEzB0Avaw4Q+1MD86/b+IuLw10pLCksoe2rHHfjjZtpumdQFMRD/a6
 zVJBNP151b5/VeXezCsgQDck8W49zgj/abv8GWItrxxP/Y8CUMS5s49QM
 0I0FW3H9EQkQ+WRf7ET9seReRnjXhd9zM7qOrIMo0H9bh6zXNP/1DYlZZ
 MQ1i15VbFGQ7FQUuTCnhaLljtn3p/Zh6sexfDBhOSZiv6IddXQSBNpCQx
 UoWfceDlVZuZt/jwzggtC2WxMwv1cpKatGJLaJ4IPr/h3lE8w9yqUKfwD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="420020955"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="420020955"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 02:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="755101606"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="755101606"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 02:18:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 02:18:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 02:18:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 02:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koGGOzrxxoI6Lnob40uTV9Xp61m9zMkAC2RDPE9Fux/q4OEbdKao6Iu5yuU5pmM0LbBOJU40JUR/O/vR+FIvyRMzRC+LuCrvKaXNSTEXulzHQp0zVOEAH/JXnxC4NWQx3I/WP7dDRsKR/6d9kpwD1bLkcVKAQmsuAO7/CWFVYEduMqNAf08Td4N/oOeFrb17/Z9E4qG2qTq7WvkLneNVdwoN7hkZDNi90Dr3d04JSGx+BcobJ/1dbaSmeS7cCsjpGYEJfVebVksPkm67As35kyS0SYReWBaGNiwWrqSB5knHgvT2TasdAnfev1I+EKiC1SNmB0t6428bR1PBhhLwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsSCtl/8TT+BAQ+e+uruZBXZuVNQe7zkDZRGW6qEA/0=;
 b=lw3tO9TwCCfosWaxWV24k3mhYJYxIz96P1DutxBZzF5jikyjzX5K40eS1I06HDmjBc0SWyAU1McL6VJoPaslVM6HH39OBninE3LOJVDQiBVrJ+idpR4EpAXnp9HnfCMNusrnzCGaH3u+s2hcrBrCmXgAVwV4KLQYLqfzmsYqhq1f0NkCWUm1SR7tDqRVvB8/Mi9P+m0/sXAnFuyyxABzo5HXnkRSN4KSAmgdEdRY0Nu9lucCCIvzr98O89pP5zvXVsFIMQfGx3F8aZfNl+0Ba5QBsy7X5gTuDyZKl2VWP+o1vQ+xbB1cUnV2Zj7JOc5mV6dBr5VpFZysob/5sYvHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 3 Nov
 2023 09:18:20 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 09:18:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/9] Cleaned up revert of remaining changes.
Thread-Index: AQHaDLjoZ7Yu+39TK0yl9tn3k7PGrbBoUG6AgAADfQA=
Date: Fri, 3 Nov 2023 09:18:19 +0000
Message-ID: <dd812c5f3436fed34a6145a7ec18141afa325cb7.camel@intel.com>
References: <20231027113453.117020-1-maarten.lankhorst@linux.intel.com>
 <122156991261aa88cc360d0e11e2e6ed2f79aefa.camel@intel.com>
 <e8c2d93d-3a3d-4c48-bb5e-498461991bbb@lankhorst.se>
In-Reply-To: <e8c2d93d-3a3d-4c48-bb5e-498461991bbb@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB7465:EE_
x-ms-office365-filtering-correlation-id: b25dcf61-81dd-47f4-99e2-08dbdc4dd1d0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+TGwcGgM5tO0nna5ZA7E3h3Gy9wtVhspm/pgyoEwHmiwvsczGoCOtu7U7gT6Own6uPoGFHPV4Jxks/XKEc+h28W1q9LUsuoW5fGka9w/fZRWwPfT8Vu57wQ2nmyFczAOSnCEuPM+prXVB5QYWi3VeFCArrSl4FzJQpqwpEcfLKq1CcAawarPeL6B0RFe10XhRjpd3BzeuZo9zwFOWdHmDDakhlzRa3mxkFhUGoG/q+YU/xr4mTcqkoVyv+N1Wmikf417cvq6QpshmPErR2ViThBbHDLamQ2r7aYfxLthNf+HzF5IzTWBUdR08QS8SzkrtGzktT0A8cyvYhldNZwMwKRQFRfbN/U8jJeSsLuQIpzpiA0hsknkRWTyFa7KJzkDbFKa0alGcX0wbIa6AY+u4yBSOHqSo99eMq+qDrgbnDJP7YF6FPUo8N+ROMpCd6jlSqAKHQUWgKbQ6Opi4VNDGrFIr1Wu7YXpDsi8P5P63NJMYGiXvLayCleY3TOW1rvZ7ceeuXJ3qmscp/zQ9BSHWPUYTucE2rqinNOHLCP7Cq6FlxZq4OshxyZTX4jX/hPqrHByIU16SUhCO6R39ONub50rrjAkUd9ekTy2kmLnjgn4Cd/kMpzkBhimpCafYHS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(38070700009)(53546011)(110136005)(8676002)(8936002)(71200400001)(478600001)(2616005)(966005)(83380400001)(66446008)(38100700002)(316002)(5660300002)(6506007)(66556008)(64756008)(76116006)(66946007)(6636002)(26005)(66476007)(66574015)(6486002)(6512007)(91956017)(122000001)(82960400001)(41300700001)(4001150100001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDFPR1djZ0tmTHgrcGY3d2Uvc3JMMEpEZVVaZUdMejdUaE53NGV6aDhFQU5G?=
 =?utf-8?B?K2RlV0dSV3lKaUJIQU1nY3JaOWVlRlUvblo5UDFkWTdBZzV4T2JTbkdNR1RC?=
 =?utf-8?B?VTJDTmNtMUVDcmgvQTljRjRhK0hGRWNoc21LRXp4ZEo1Y0NVK0c2bXVHN3ha?=
 =?utf-8?B?d3hXN3lkVkhsVXpOS0MrTEV6VkhJV1ByUnZ5YnJXSmdtczhwUDVFb09MMDUx?=
 =?utf-8?B?WkdlWVRrZmZtalBza05CZnY0RFdjRmRZYnpxa212VEZIT3AwcGY4RCswZHlH?=
 =?utf-8?B?VjR5WG1RaTV2VnBRNUt2cWZxdXo1MnAwbUNXNG9NWXFBQnJvWmlqaGxVeFk1?=
 =?utf-8?B?ekVoaFgxL25QblVRcUJScm5kbGZoZmtHazAwVGJrNkd3V0ZES1dOaDFNenls?=
 =?utf-8?B?a0Iwb1FWS3NCWUNzRThVWEs3cjlIOFZ1L1BzYUpTd0xlVVZkNGJPTVBydlBn?=
 =?utf-8?B?eUxsaFpsdjduQU1QaHlwS2gzSDhRR1lFNnBncElvVjJYQkhyM1A1NEN1L01G?=
 =?utf-8?B?YmNnYk81YU1pekJqeUh4dWc0YlpJWks3Tm9kTEdES3YxU3kwaC9OUWFQZDY1?=
 =?utf-8?B?RDhRR2MvYk9KazNLYmc5YlpKUm1ocWlidXlKcncwSWpUdk15akhWdGN2djNr?=
 =?utf-8?B?SmpLZzZSZks1cHF5MGM3N09YNFFUSk5mMGtXTmxVMDliSTFEeVlCUVhBdW9W?=
 =?utf-8?B?bnJidFhSbUFaZS9pc2YvT0U1VlIzZ0lBOVJvc3QvckZkMno1U1VrS3NtRnFO?=
 =?utf-8?B?c2lBK0x1OXVpZFFOdi9IVEdiUWRobktXT21CbldJOE1BaDRBSVRzR1VGUkRG?=
 =?utf-8?B?M0ZKZnMxN09oTTcxU2lhUHlQMGdBanNDZGs0WFFZZndrakp4YUs4TGhVT1lZ?=
 =?utf-8?B?NFB4RTRGZ3JwRWt1a3c2TnBrcTRmTmhSbStHNUdYcDkydWk0SDBrY1BrVGtO?=
 =?utf-8?B?SSthQWRjWGtINTBaWU1BR0l3V2ttdFBBSXlyQytmZmpxbnZLVzdmWldVWXhq?=
 =?utf-8?B?d09mYkdPREVQL3lnbUNFb09ETnlvTzdiWXJjNUZBR2EyQyt4MnI0QUZOVnZB?=
 =?utf-8?B?Z0JtUWJ4eVpYTENhZ2Z5aysrV3hKL0NsYVVndmNMRzlPN3QxRkpJYS9SMlNq?=
 =?utf-8?B?dnRXQzFPeXNHd1d2VVM0a1BJdEt1UktKN2pwQ1hBZ2J5OWFzVWJ5Nng2NDAy?=
 =?utf-8?B?bWlmWmVrSlBQUjRlVWJvUkt4eFc1VGhxSGhOYWhwS0g3ZWUzMk1Za0FtbVFp?=
 =?utf-8?B?RUlRNnR0NDF5QUQ3dnhhSi9zTmVtMElldk5NU1IzeTlUQlQ1MmhpY1ZydG1Y?=
 =?utf-8?B?TFBUZ3FEaStkeElJQVlML2RCRjUvcUVUQnZiaUcvU1Jjb2V5Wld4bzdFTTNr?=
 =?utf-8?B?ei8rU2VFa0Y3TTA1WHlDdC95TUprd3Y4ZkIxR2RlYkVGUVF3VnA4TmFYR1Y4?=
 =?utf-8?B?OEkrUml3TllNTWJqOVBYTEMzaEhQbThrcm5kYUlrcDBhcnFNRVJuSjk3Q0xR?=
 =?utf-8?B?MVZERUVCNFc2Wmt2UVhPM0Zid2gxbm1GZHRNN1ZLWE9GMDRJOWdMUExEd0RQ?=
 =?utf-8?B?aVJWb3hZSWEvdEk2WndFaGRiU2tGYkRxU1JDeU4vSlBKeG15cVduL1RRbVhP?=
 =?utf-8?B?aFdyeTh3MXE3a2FDdFNBQlBtRkxkM2swNE8rUUFsYVpYSFIwclV5alJybFhV?=
 =?utf-8?B?R2lTbWYxYXAxNit2WUhqZUZMUCtGaDI5aHZ3dzQ4MHo4dzhzSEJXcTJqZ3p5?=
 =?utf-8?B?SG5iMDlPVkRqVGVab3Ztdi9abFNuYVpSc2R6WGhHSjdtenBUYzEzYTQ3WEV2?=
 =?utf-8?B?YnZrQnFMdjVZZ200R3Y5dUR6Y2o5MU0xYnljdXdNWUJMbTY2bWhGTEtOSUZO?=
 =?utf-8?B?ckpNa0RWcS9PT3NYQnJJY0ZuK08wV01QQklzZ1pFcEF0U2V2QitFQTk1Vnpv?=
 =?utf-8?B?OWV4ekpBOHpPM3dha25zTkUvdnh2WTR5TVNjNTFOd3dsWEFaZ09SNUlsRnZa?=
 =?utf-8?B?YVUzdm9XM1JzWVBTdFI0YU0rSkhPRGg3aUpPTW41MW1HK0g5bzBLREdYZFAw?=
 =?utf-8?B?R3lZb1A1NXdPa3ZramcvdGw2SXpFdjJra1kvL2QrcFBLVnJ5YWdkT0t2M1Nw?=
 =?utf-8?B?a00yN1BvVzZEc1hMUHdrYlo4Ykk0MUZkS2xucERIQXRDV3JoSm9MTTRQRjdt?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82C1EB0A3CD84A4586CA1C82BF6FAF26@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25dcf61-81dd-47f4-99e2-08dbdc4dd1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 09:18:19.3248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kOS7zuFkJ/W3qftY/Ido1Dt15fAjvinctQVajQpBfqzpLL1f3P8Vplh24cH3wl6AsnT5Q0WVJ/FONlGcrCZl01tXZeIMb4XrHYaUUSrQhp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/9] Cleaned up revert of remaining changes.
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

T24gRnJpLCAyMDIzLTExLTAzIGF0IDEwOjA1ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gSGV5LA0KPiANCj4gT24gMjAyMy0xMS0wMSAxMjo0NSwgSG9nYW5kZXIsIEpvdW5pIHdy
b3RlOg0KPiA+IE9uIEZyaSwgMjAyMy0xMC0yNyBhdCAxMzozNCArMDIwMCwgTWFhcnRlbiBMYW5r
aG9yc3Qgd3JvdGU6DQo+ID4gPiBGcm9tOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3Jz
dC5zZT4NCj4gPiA+IA0KPiA+ID4gQWxsIHJldmVydHMgYXJlIG1hZGUgc2ltcGxlciwgYW5kIHRo
ZSBoZWFkZXIgdXBkYXRlcyBhcmUgc3F1YXNoZWQNCj4gPiA+IHRvDQo+ID4gPiBhDQo+ID4gPiBz
aW5nbGUgY29tbWl0Lg0KPiA+ID4gDQo+ID4gPiBUaGlzIG1ha2VzIHJldmlld2luZyBhIGxvdCBl
YXNpZXIuDQo+ID4gDQo+ID4gSSB0b29rIG92ZXJ2aWV3IG9mIHBhdGNoZXMgNCwgNSBhbmQgNi4g
SXQgc2VlbXMgeW91ciBhcHByb2FjaCB3aWxsDQo+ID4gdGFrZQ0KPiA+IGNhcmUgb2YgaTkxNV9n
ZW1fZmVuY2Vfd2FpdF9wcmlvcml0eS4gVGhlc2UgdGhyZWUgcGF0Y2hlcyBzaG91bGQgYmUNCj4g
PiBzZW50IHRvIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmfCoChhdCBsZWFzdCBwYXRj
aCA0KSBhbmQNCj4gPiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLiBJIHRoaW5rIHdl
IGNvdWxkIHVzZSB0aGVtIGluIGRybS0NCj4gPiB4ZS0NCj4gPiBuZXh0IHdoaWxlIHdhaXRpbmcg
Zm9yIHJldmlldyB0byBjb21wbGV0ZS4gSSB3aWxsIHNvb24gc3RhcnQNCj4gPiBiYWNrcG9ydGlu
ZyB0aGlzIGZyb20gZHJtLWludGVsLW5leHQ6DQo+ID4gDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjUxNjAvDQo+IE5vdGljZWQgdGhpcyBwYXRjaC4gWW91
IHJlYWxseSBvbmx5IHdhbnQgdG8gd2FpdCBmb3IgVVNBR0VfS0VSTkVMIGlmIA0KPiBzdGF0ZS0+
ZmVuY2UgaXMgc2V0Lg0KPiANCj4gU2VlIGRybV9nZW1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIu
DQo+IA0KPiBDYW4geW91IGZpeCB0aGlzIHVwPyBFbHNlIEkgc2VuZCBhIHBhdGNoIG9uIG1vbmRh
eS4NCg0KSSBhbHJlYWR5IG1lcmdlZCB0aGlzLiBUaGVyZSB3YXMgcmV2aWV3IGNvbW1lbnQgZnJv
bSBWaWxsZSBhc2tpbmcgdmljZQ0KdmVyc2E6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC81NjQ5OTEvP3Nlcmllcz0xMjUxNjAmcmV2PTMNCg0KQlIsDQoNCkpvdW5p
IEjDtmdhbmRlcg0KDQo+IA0KPiBDaGVlcnMsDQo+IH5NYWFydGVuDQo+IA0KPiA+IFN0aWxsIHdh
aXRpbmcgZm9yIENJIHJlc3VsdHMgdGhlcmUgYmVmb3JlIG1lcmdpbmcgaW50byBkcm0taW50ZWwt
DQo+ID4gbmV4dC4NCj4gPiBJIHdhcyBvcmlnaW5hbGx5IHBsYW5uaW5nIHRvIHVzZSBpOTE1X2Nv
bXBhdCBoZWFkZXJzIGZvcg0KPiA+IGk5MTVfZ2VtX2ZlbmNlX3dhaXRfcHJpb3JpdHkuIEkgdGhp
bmsgeW91ciBhcHByb2FjaCBpcyBiZXR0ZXIuIFNvDQo+ID4gaWYNCj4gPiBpdCdzIG9rIHRvIHlv
dSBJIGNvdWxkIHNlbnQgdGhlc2UgdGhyZWUgcGF0Y2hlcyB0b2dldGhlciB3aXRoIG15DQo+ID4g
YmFja3BvcnQgKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1MTYw
LykgaW50bw0KPiA+IGludGVsLQ0KPiA+IHhlIG1haWxpbmcgbGlzdC4gd2hhdCBkbyB5b3UgdGhp
bms/DQo+ID4gDQo+ID4gR2VuZXJhbGx5IHNwZWFraW5nIEkgZm91bmQgdGhpcyBwYXRjaCBzZXQg
YmVpbmcgaGFyZCB0byBmb2xsb3cgYW5kDQo+ID4gcmV2aWV3LiBJIHdvdWxkIGV4cGVjdA0KPiA+
IA0KPiA+IDEuICJmaXh1cCEgRklYTUU6IGRybS9pOTE1L2Rpc3BsYXk6IFJlbWFpbmluZyBjaGFu
Z2VzIHRvIG1ha2UgeGUNCj4gPiBjb21waWxlIg0KPiA+IA0KPiA+IDIuIEZJWE1FOiA8bmFtZSBm
b3IgY2hhbmdlcyBzcGxpdCBvdXQ+DQo+ID4gDQo+ID4gd2hlcmU6DQo+ID4gDQo+ID4gMS4gcmVt
b3ZpbmcgY2hhbmdlcyBmcm9tIEZJWE1FOiBkcm0vaTkxNS9kaXNwbGF5OiBSZW1haW5pbmcgY2hh
bmdlcw0KPiA+IHRvDQo+ID4gbWFrZSB4ZSBjb21waWxlIiBhbmQgMi4gaW50cm9kdWNpbmcgc2Ft
ZSBjaGFuZ2VzIGFzIGEgc2VwYXJhdGUNCj4gPiBGSVhNRQ0KPiA+IHBhdGNoLg0KPiA+IA0KPiA+
IEJSLA0KPiA+IA0KPiA+IEpvdW5pIEjDtmdhbmRlcg0KPiA+IA0KPiA+IA0KPiA+ID4gTWFhcnRl
biBMYW5raG9yc3QgKDkpOg0KPiA+ID4gwqDCoCBkcm0vaTkxNS9kaXNwbGF5OiBSZXZlcnQgYWxs
IGJlZm9yZSByZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlDQo+ID4gPiB4ZQ0KPiA+ID4gwqDCoMKg
wqAgY29tcGlsZQ0KPiA+ID4gwqDCoCBkcm0vaTkxNS9kaXNwbGF5OiBSZXZlcnQgcmVtYWluaW5n
IGNoYW5nZXMgdG8gbWFrZSB4ZSBjb21waWxlDQo+ID4gPiDCoMKgIGRybS94ZTogVXBkYXRlIGhl
YWRlcnMgdG8gYmUgbW9yZSBjb21wYXRpYmxlIHdpdGggaTkxNQ0KPiA+ID4gwqDCoCBkcm0vYXRv
bWljOiBBZGQgZHJtX2F0b21pY19oZWxwZXJfc2V0X2ZlbmNlX2RlYWRsaW5lKCkNCj4gPiA+IGZ1
bmN0aW9uDQo+ID4gPiDCoMKgIGRybS9pOTE1OiBJbXBsZW1lbnQgZmVuY2UtPnNldF9kZWFkbGlu
ZS4NCj4gPiA+IMKgwqAgRklYTUUgZHJtL2k5MTUvZGlzcGxheTogVXNlIGZlbmNlLT5zZXRfZGVh
ZGxpbmUgdG8gYm9vc3QNCj4gPiA+IHJlcXVlc3RzDQo+ID4gPiDCoMKgIGRybS9pOTE1L2Rpc3Bs
YXk6IFVzZSBpOTE1X2dlbV9vYmplY3RfZ2V0X2RtYV9hZGRyZXNzIHRvIGdldA0KPiA+ID4gZG1h
DQo+ID4gPiDCoMKgwqDCoCBhZGRyZXNzDQo+ID4gPiDCoMKgIEZJWE1FIGRybS9pOTE1L2Rpc3Bs
YXk6IE1pbmltYWwgY2hhbmdlcyB0byBmYmRldiB0byBtYWtlIHhlDQo+ID4gPiB3b3JrDQo+ID4g
PiDCoMKgIEZJWE1FIGRybS9pOTE1L2Rpc3BsYXk6IE1ha2UgaW50ZWxfZmIuYyBjb2RlIGNvbXBh
dGlibGUgd2l0aA0KPiA+ID4geGUNCj4gPiA+IA0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX2hlbHBlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE1ICsrLQ0KPiA+ID4g
wqDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYyB8wqAgNzAg
KysrLS0tLS0tLS0NCj4gPiA+IC0NCj4gPiA+IMKgwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2N1cnNvci5jwqDCoCB8wqAgMTIgKy0tDQo+ID4gPiDCoMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmPCoCB8wqAgMzcgKy0tLS0tLQ0KPiA+ID4g
wqDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaMKgwqDCoCB8wqDC
oCA0IC0NCj4gPiA+IMKgwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmPC
oMKgwqDCoMKgwqAgfMKgIDg5ICsrKysrKy0tLS0tDQo+ID4gPiAtLS0tLQ0KPiA+ID4gwqDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmPCoMKgwqDCoMKgIHzCoCAxMyAr
Ky0NCj4gPiA+IMKgwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmPC
oMKgwqAgfCAxMDAgKysrKysrLS0tLS0NCj4gPiA+IC0tLS0tDQo+ID4gPiAtLQ0KPiA+ID4gwqDC
oC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mcm9udGJ1ZmZlci5jwqAgfMKgwqAgNyAr
LQ0KPiA+ID4gwqDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mcm9udGJ1ZmZlci5o
wqAgfMKgwqAgNCAtDQo+ID4gPiDCoMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNh
bF9wbGFuZS5jwqDCoMKgIHzCoMKgIDQgLQ0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfcmVxdWVzdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArKw0KPiA+ID4gwqDC
oC4uLi9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dlbV9sbWVtLmjCoMKgIHzCoMKgIDIg
Kw0KPiA+ID4gwqDCoC4uLi9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dlbV9tbWFuLmjC
oMKgIHzCoCAxNyArKysNCj4gPiA+IMKgwqAuLi4vY29tcGF0LWk5MTUtaGVhZGVycy9nZW0vaTkx
NV9nZW1fb2JqZWN0LmggfMKgIDc2DQo+ID4gPiArKysrKysrKysrKysrDQo+ID4gPiDCoMKgLi4u
L2dlbS9pOTE1X2dlbV9vYmplY3RfZnJvbnRidWZmZXIuaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
NCArLQ0KPiA+ID4gwqDCoC4uLi9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9k
cnYuaCB8wqDCoCAxICsNCj4gPiA+IMKgwqAuLi4veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1
X2dlbV9zdG9sZW4uaMKgIHzCoCAxMyArKy0NCj4gPiA+IMKgwqAuLi4vZ3B1L2RybS94ZS9jb21w
YXQtaTkxNS1oZWFkZXJzL2k5MTVfdm1hLmggfMKgwqAgNiArKw0KPiA+ID4gwqDCoGluY2x1ZGUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDMgKy0NCj4gPiA+IMKgwqAyMCBmaWxlcyBjaGFuZ2VkLCAyMzQgaW5zZXJ0aW9ucygrKSwgMjUy
IGRlbGV0aW9ucygtKQ0KPiA+ID4gwqDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0veGUvY29tcGF0LWk5MTUtDQo+ID4gPiBoZWFkZXJzL2dlbS9pOTE1X2dlbV9sbWVtLmgNCj4g
PiA+IMKgwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1
LQ0KPiA+ID4gaGVhZGVycy9nZW0vaTkxNV9nZW1fbW1hbi5oDQo+ID4gPiDCoMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gPiA+IGhlYWRlcnMv
Z2VtL2k5MTVfZ2VtX29iamVjdC5oDQo+ID4gPiANCj4gPiANCg0K
