Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78A1C001DB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 14:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5C310E253;
	Tue, 15 Aug 2023 14:05:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6856E10E257
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692108308; x=1723644308;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8qPzODD/503w51qUV6XHieLjeqvqm5TewYIkGDfSRFw=;
 b=Br7llQtFJzlBPsenpdfHWeZF76nL+wj5ihvJpda/yrDRfU1VsgUz2bCE
 YsaIxONQeKfA0A8WFZOhsLNFZ7d6FA79G+GogE+ReTWn2/0pTGfZ1hIle
 0n+EGe0rg6NULdcZbKmNvQfslRm4z8+zjap/bAY6N7PQZSYUHH5WyMOmI
 MUXXFbVE08zq+sPlbpKxv1EgUiTcdY/AlESyVMNYh/L1jP0GNGodvhUDh
 3HyphdOHinBDh3o3v96yqB9FB4u840bltMEWPDFF8NiiVxMQFv4PBrFh+
 ta+6n9CtQLoFXQx4+ZZ7wHBY/dVD3ZaklpUkESguqYLCctjYl5PzmrBtl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371192341"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="371192341"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 07:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803829996"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="803829996"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 07:04:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 07:04:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 07:04:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 07:04:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 07:03:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNCBys1cebYeqC8weTJlJvkLHwdrOTJk4y1GLEuzs5w8xqVWQDCsJS4YEz/8c5ZqmEIaxbBBXMOcCQ9yRrocUPbjmeAifhLCJ7dC1Eva4B+X74i7RjP2tJUMZ4p4jqUVZr+Zl68HpAIOJa1O5uUX320TCIXaO5QswwXeetTF32+upO6cndHvp3YvCIAsyQRZ0RZeZuLNg7CMzHOsJm153OHl5G1Afvf3jd567A9uDJm4QRiOqMiIYn/CSphhVcCZ0KUPLEKqV39dQ7adGbakpUwh9K5EaCdpAsNg7DvfHB/pMWF9j6yGL9V829zrbnQNZWXeHi/8bKR4fX3BRLGx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qPzODD/503w51qUV6XHieLjeqvqm5TewYIkGDfSRFw=;
 b=IFDSZYOrOeFXonLswcxXqoinZ3VcIEL0AMIz5jPK4DtKQPqULGI3axTJPCyzhW5n4GfExeDauUJOM3a61hCoXsx5+b1h2a8JLLk8Kk7L6hziTFAWc9G8bjwwBzIJcmcXOULIRo6GVLOWeAJJtO/M2b9sFusTipRwPK3OTMmJFDqw4rrYHJI1vntOQja9Kf4eSSCluK9/N+amRtrnyOkAHwraVrfye1EZTBG7xlAA5A9gDBAJdyozYFXLQGz64edkJEPM3sJszxU7wwm1h4z2tRyxJSa8w4mFWGKurnT6Nv4l9qmZgxTmwHI0ubywBQlyJUJim0mEJ5QOl+T6RzWUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 14:03:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 14:03:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Thread-Topic: [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Thread-Index: AQHZzv/2GhQSD4hm40ehEBA3yYxRX6/rZJYA
Date: Tue, 15 Aug 2023 14:03:42 +0000
Message-ID: <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB8154:EE_
x-ms-office365-filtering-correlation-id: c6d3dc11-45e8-4067-514f-08db9d986f3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9tArsVTfAfiBrkQkxySLQyYc9x1rQEKid2YATlqFJFdwcIFHnrbTTmJtg8K4vobjzSelV0pk/thaXM4HLu0PDq9MoDKBpCnZyWnlM1naRBw+3nHA1js6gkcxzW5Emah0Qbq1N90KDAeziD/c3MsPdRoPhGZv+GkFmrNzsPDdQfu/H7ceolJIBZb19YmPUg1iLWxmMgcnP5O1e4HZOZ6EkwXkdCL/7xjW/xWQdVpwx5WoXkOyOQJ5U/jlwb5blKKEV4SNlXrJ5zWhXrvWK55TiKy/WmGzGZOL9RrhudkLUSx2HvDILBIxRGoPQUP57lXKn+3Sm96zynoCGkUgUegW2lt82DTDaYfuFt+XuBi8szMXFEva2BZ9AbGWna8+x27UY1uqRL0hlAzXQ3ccC3lD019tTpneB58fdSVJGJpUyjNYT22u03k2xPTD8cicpyaXSQDMpNvQzaOjxSa3Z/lU1p44YMNXP4ZxadLMBGOvma0B9vlfJMygLmou28g36UBVn12/YJ9uY7wFcxhVkDLMKxcpw5Jvp5NkPXW8Fl6sAGsw244kaizGt9QJLtIoAyWjGdalmbkfBpsiiL7XHUijCBvpvA+5Fq3Pbo4E698od5HQlCKC3YI+CVyeJwshyybe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199024)(1800799009)(186009)(83380400001)(36756003)(26005)(6506007)(6512007)(2906002)(8936002)(2616005)(8676002)(478600001)(4326008)(86362001)(38070700005)(122000001)(38100700002)(82960400001)(5660300002)(110136005)(54906003)(316002)(66946007)(71200400001)(6486002)(76116006)(91956017)(6636002)(66446008)(64756008)(41300700001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U096YWtYZllGR2dEOTFkSXBuMUozNktVZXRqWjZMQXNlMlFZbHRPeVdVUXhH?=
 =?utf-8?B?SlF0YzhoZzVjaktnT0M1ZU11a0R2bkhXdGxOM0MrcC9QeFdYUHBlMWl6LzEr?=
 =?utf-8?B?TDNSQ1E4bjA0QndOaGNBRldvUHpUSTdYVExwdFVYdFdMTkZ5N0gzOUZJODFU?=
 =?utf-8?B?Rm5ZaDNMRjIrRFN4RENWQ1Q4RWdIbEd0cWg4T1VSOUg5SVZ2RHZVNzBZUlJC?=
 =?utf-8?B?bUJvYzI4TmdtamVoU1R2NVhkQ0FOaWFwTjFrOTBLKzBrVk5OM3IzZzJtcGIz?=
 =?utf-8?B?RVFKdkxpdVhjenV3QjdEZ0d0SXAvdDhjcDVWWitrWHhXMnlvV3N4RTlaVDBL?=
 =?utf-8?B?Wnd0ZTZCQ01iclU5aldBdWFiNE12VWNBZHpOUUg3QkRjazBGa1VtWG9YUFdh?=
 =?utf-8?B?M3I5K05CNjhpWDUybG9oMFU2Y1pVY2FPYTVtK21OekNBTEdaS3BzblVWZ1VT?=
 =?utf-8?B?bHJGRFdBRDc4OVpKZ1A3d1ZteHlFWWt0MkthN1FHQVBBWWxrWFhIeFlYNHhQ?=
 =?utf-8?B?T2NZb1MxTW9zTm1DMkJHTWlzMXlYK2ZMSW5WbmpIZWVSY1pnaVpGOWdJc3lV?=
 =?utf-8?B?YmN5N29NRDl6bmFHWFkxb3A3c0p0b2hlOVlCd1A2Rmw0cGZ6aG53SlErNVRG?=
 =?utf-8?B?cDNIZjRNcVV1bnNKMUFqUXM5ZGp0MDRNV3ljd2xtZExKd3d5MzZaZjRYYTBr?=
 =?utf-8?B?QU9NYllDdlN3YjRid3E4SHlyMS9tU0c2c0FOK3NMQ3hLVEpNQ3VCc0FmUUVm?=
 =?utf-8?B?OCtJeEU2cE00Nm1YeW92NWs4Wmt4WlR0Q1dmK0F0WmduVUNnVzVVdWFTNm9p?=
 =?utf-8?B?UVpONzlQbmt0V2hMeXRBU0FvQjJndUs1dzAxSDl0a0M2eHNxR0xwMnVoRjdw?=
 =?utf-8?B?K1gwdStCVjQ3eUo1eUxBdzNpcUt6ZUVWSlZVWDN4YXJBR2dBZWZ4Vmo2V083?=
 =?utf-8?B?TndiR3NyM1JuMm9VWmZLVGRpN3RBNWlOUTNtU1M1d0VuQXlIZkdGM1JNam1n?=
 =?utf-8?B?RTY2a090cThSNUpLTUtWWi9PYmg3SUhIM3NTdk1IRW5BM216YUdSTkJVbE1n?=
 =?utf-8?B?c3NkUGo4VWowVlcrSk1HL3VSQnFLK2hFTVJ5ck9kckVXOGN5YUprMUZJTUI2?=
 =?utf-8?B?THRzL3lISnBIV2o1WnFnMnE2UmNsdHBuaDZxQjkxOXV0eFR5V1J3M2J0TUFa?=
 =?utf-8?B?WklsaEZROW9xODV1VmR0K3hESDRXMnlOOURwZkJYRHhCRk5YekFwNlg5RDd3?=
 =?utf-8?B?Wmh6NlczQW9ZdWQzaCtNZWdJTDNuclJQdzU2NmszVm4vSC9nRE5La1BnVDJQ?=
 =?utf-8?B?cmRWQVZ5T1NpUVQzckZQeTcyZ3U3amlZb2laL1pFMWpZQkRzVjhtQ2ROV2tw?=
 =?utf-8?B?L3V0MS8vMVlObDJVdmV2QTUzYU5mRW1DOG5wdXBBc3k2RzJzZXE1VFl4SVlw?=
 =?utf-8?B?TFNYVW5JbU13azZRMGJ3aGNlVVlZNjUwVldKZVl0RXJhWHUyNC9WMWV0S0tL?=
 =?utf-8?B?UVVQMTJYTWdiME5HTTE0ZXFpbCtUSXAzTnFoWnVyWUhsSjlrMUNucjQ4ckFp?=
 =?utf-8?B?QzVLZHpFRWNkdTZGUUJuNDBIdUFvUFFrSVdObHdmZ0R5OVB2eThKd2tZRU5T?=
 =?utf-8?B?VEtBSkFOTG43ZFRNcHRqKzBhYTdUT09pMTRLeXVFcXhRMURaR2RmVGRwUUpr?=
 =?utf-8?B?QXpvREY1VitiYzB5U1dNUVVKTkxGVzdoOGdHTlUwVWlMR2dzeFpqOWdWdEw3?=
 =?utf-8?B?U2ViVzlQRnNsekFGNHFObnAzVmNqQXFUakppMmFvdWI1ZFJJenQ3ZE1nNm14?=
 =?utf-8?B?UUhuWDlvVE1TUFV3V2hRSkYwaUVhSUlOakIrWk1RT3dDTHB2N2QyKzFMZnVw?=
 =?utf-8?B?TjM3NytpLzd4dVBUSUkrbVdwM0pVWEg3eW1tbXlFOGVyWkdRRmY2ckNpYmpp?=
 =?utf-8?B?NlRtSHdYanBhdWg5clEzUE1YUlZFNHZSRVpLb0E0Vjg5QjJKZkZqM01TaThm?=
 =?utf-8?B?QkQ2L256bEY1K1FlQ3lzU0t2VW5IZlA5V0VlTGN2Tm5lZWdHSDZnZ1pzaVBT?=
 =?utf-8?B?czJrZjRQWUZibHlRRDl5eWIxVHB2OEJlSlFkQlV0T2M5ekdlTUZMSFVKVmFq?=
 =?utf-8?B?Y3JuYnRlb2hmaXl3c1RRSTdRNWFEMEVQR0ZTWUN0OUlOeWozQU9XR1lPQjYy?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B08E1677B88C634682647D571E58EC90@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d3dc11-45e8-4067-514f-08db9d986f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 14:03:42.9519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfi/pz4rDe8diphA5/65feMMwKHfu7Ts9EozkJfyLCYVKqdhfMJAEg1vMLiD8S7V5hjaSNzf9VXgt3uKh4Vvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: "lionel.g.landwerlin@linux.intel.com" <lionel.g.landwerlin@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA4LTE0IGF0IDE1OjM3IC0wNzAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+IHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIG1pZ2h0IGdldCBw
YWRkZWQgZm9yIDY0LWJpdA0KPiBhbGlnbm1lbnQgYmFzZWQgb24gY29tcGlsZXIgdXNlZC4gU2lu
Y2UgZW5naW5lIGluZm9ybWF0aW9uIGlzIGttYWxsb2NlZA0KPiBpbiB0aGUgcXVlcnkgYW5kIGRy
bV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgbWF5IGJlIHBhZGRlZCwgaXQgY291bGQNCj4gcG90
ZW50aWFsbHkgbGVhayBzb21lIGtlcm5lbCBtZW1vcnkgdG8gdXNlci4NCj4gDQo+IEFkZCBhIHJz
dmQgZmllbGQgdG8gc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgdG8gbWFrZSBp
dA0KPiA2NC1iaXQgYWxpZ25lZCBhbmQgemVybyBvdXQgdGhlIGZpZWxkIGJlZm9yZSByZXR1cm5p
bmcgdG8gdXNlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8
dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcXVlcnkuYyB8IDcgKysrKystLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0u
aCAgICAgfCAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggOTlhNDgwMGM3YzUzLi5i
OWQ1NjUyNjRjZWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC02NSw3ICs2NSw3
IEBAIHN0YXRpYyBpbnQgcXVlcnlfZW5naW5lcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+IC0JaHdfZW5naW5lX2luZm8gPSBrbWFsbG9j
KHNpemUsIEdGUF9LRVJORUwpOw0KPiArCWh3X2VuZ2luZV9pbmZvID0ga3phbGxvYyhzaXplLCBH
RlBfS0VSTkVMKTsNCj4gIAlpZiAoIWh3X2VuZ2luZV9pbmZvKQ0KPiAgCQlyZXR1cm4gLUVOT01F
TTsNCj4gIA0KPiBAQCAtNzgsNyArNzgsMTAgQEAgc3RhdGljIGludCBxdWVyeV9lbmdpbmVzKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCQkJCXhlX3RvX3VzZXJfZW5naW5lX2NsYXNzW2h3ZS0+
Y2xhc3NdOw0KPiAgCQkJaHdfZW5naW5lX2luZm9baV0uZW5naW5lX2luc3RhbmNlID0NCj4gIAkJ
CQlod2UtPmxvZ2ljYWxfaW5zdGFuY2U7DQo+IC0JCQlod19lbmdpbmVfaW5mb1tpKytdLmd0X2lk
ID0gZ3QtPmluZm8uaWQ7DQo+ICsJCQlod19lbmdpbmVfaW5mb1tpXS5ndF9pZCA9IGd0LT5pbmZv
LmlkOw0KPiArCQkJaHdfZW5naW5lX2luZm9baV0ucnN2ZCA9IDA7DQo+ICsNCj4gKwkJCWkrKzsN
Cj4gIAkJfQ0KPiAgDQo+ICAJaWYgKGNvcHlfdG9fdXNlcihxdWVyeV9wdHIsIGh3X2VuZ2luZV9p
bmZvLCBzaXplKSkgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggODZmMTZkNTBlOWNjLi41M2NkNTcz
NDI2MjAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtNzUzLDYgKzc1Myw3IEBAIHN0cnVjdCBk
cm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIHsNCj4gIA0KPiAgCV9fdTE2IGVuZ2luZV9pbnN0
YW5jZTsNCj4gIAlfX3UxNiBndF9pZDsNCj4gKwlfX3UxNiByc3ZkOw0KDQpJIGRvbid0IHRoaW5r
IHRoaXMgY2hhbmdlIHNob3VsZCBiZSBmaXh1cCwgYXMgdGhpcyBicmVha3MgdGhlIHVBUEkuDQpQ
bGVhc2UgcGluZyB0aGUgUm9kcmlnbywgTWF0dCBCcm9zdC4uLiBhYm91dCB3aGF0IHdlIHNob3Vs
ZCBkbyBoZXJlLg0KQnV0IGF0IGxlYXN0IHlvdSBuZWVkIHRvIHN5bmMgd2l0aCBvdGhlciBVTUQg
Y29udGFjdHMgYWJvdXQgbGFuZGluZyB0aGlzIGNoYW5nZSBhdCB0aGUgc2FtZSB0aW1lIFVNRHMg
dXBkYXRlIHRoZWlyIHhlX2RybS5oLg0KDQo+ICB9Ow0KPiAgDQo+ICBzdHJ1Y3QgZHJtX3hlX2V4
ZWNfcXVldWVfY3JlYXRlIHsNCg0K
