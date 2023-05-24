Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB5C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 08:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6A410E592;
	Wed, 24 May 2023 08:16:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779410E592
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684916209; x=1716452209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XjxMZyYeEn4frZon6G9AMC7lICGglyA/ZAL2cFEy/g8=;
 b=VRpt+mqhdnoq0udqWAE7TlMP0e1/jV3wKGAgJ2uJMHHggz0qjvET6JWG
 FYIXFnNTS6PqVo8gIqBU2pKMkK0xH5L4nKdkh+/Dx7j4JAX2xqhyCitjY
 F5ui9k+4VzxF4jOKXIMWGQGkKGqLj73xqnPNSQxdN6Qvr88ibg2FNOOmO
 xZ5biT+ZyYpdb+/vV6girQWMT5ufnH0zfyVTXX25jWfQUbRfqVgh1bpJj
 naKVitolp1Pyg9+aPB8YQL4hBkswwRPgpAZRCwMTmHxG6Dsyp5+y7d/6K
 7tdEtsLzosDzBSNfTl6XodNqwiHSJNC6Ara2KdeSupd9/r707QJYE9E2s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333117055"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="333117055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 01:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="707418411"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="707418411"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 24 May 2023 01:16:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 01:16:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 01:16:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 01:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGZsfavljAcLKwwgNDa684X/G89Xu5eZfj9ZTUWD1Hn8Jj3Hsp/5wUefLoD+Xj1EowMfAQtx2UmRvMxniZnhtqp4H9VwNVeaDghzulLuGvo3GUFmYJGlSg/V2hPGjIXgjsbllV0k36OqFixr84kVyPCZck0XbJohHcWZtyQUW/VycWIp1INyYQj8ccrX3X1eFCTh2VHt043x9YuVu36fRGIK3QgdKRK3l9i+jRl04mjdpmzCfAqxin7yuUZbuDC6d+zEmA748uzIdmryThuW2w12cJeQaqOuTXb6+B5+/PBDrFx/J/vGoOznWEPYujThyGAF8L3vIqXLbZYVN/MKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjxMZyYeEn4frZon6G9AMC7lICGglyA/ZAL2cFEy/g8=;
 b=nti/ZYHxSPEh7IM+yEre1j6RqWhWhENd+NdVS2rR0aVySTynpgJ5w9/jAGwnJvZeWPzwnnQ8CmoYBFMEFROF7YaBg8aTVwzRxDUgt4CzCmsl9z1HXuWcSnmmmHvDt1grQQ9YLxiPo0DaVIz3obOMr4zK78yrkEkfncQUxGgRZ32ZIZe8C11umWdw+rxCeT89NvYx9acmdJoCYXUEr5AtvZ4NoqvVQZN1jqvXvrx5auvLAHQ/XlGqzIHOANF+ng6LQt86wWKtNkyojx2lZatAC6v/JWfr4pNyScDJW7lWT1E37tdF32aoGRIhr9K1sdpDJ3uviovNCkjx/49Uv64k0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 08:16:46 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::bd04:720:a75a:8bd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::bd04:720:a75a:8bd%5]) with mapi id 15.20.6411.027; Wed, 24 May 2023
 08:16:46 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
Thread-Index: AQHZiCZ5+uhGqiRDOUmYnivPcYLBkq9d+aUAgAGKWQCACZvZAA==
Date: Wed, 24 May 2023 08:16:45 +0000
Message-ID: <649e27fc619fd2506f634248049de05e16f1130e.camel@intel.com>
References: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
 <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
 <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
In-Reply-To: <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|SJ0PR11MB7153:EE_
x-ms-office365-filtering-correlation-id: eb914b4f-e769-48d3-ff83-08db5c2f36f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LUC+bxqVPtlj+rVqSYn7oS1yrgNdzOX4An2X26Fb2nhUD4fGa9wlVNhMwvb/+iNSuDpR42TiW9wps+6mCEfLfKaxn04MepwxGuqWHEhQcO170a7TfI2puRxDKWNpMGfPkaNv1CUVC7RbBcvJRKGGVLEdeV1gr6k8RuQFPHWo+LsaF+kYv2tySYTBzzI5OarxGb9zu87HqBrrGuE8J6SqkTCJ471caHLhYR0VK2q57X8jTA1k8aRMX4xMLyYEZqlW3DQnYqEg0Wt22+exzSOKbV8vz6csPfHx2C2h8sDmKzPAQk5f8Esb0Lb/vPwdWNuPWE5GckHtasJlKiJhQe+8Hz7glAvXeAMuEyP5EsVaMU6qbwmoNKRFqeufG5IBPPhcLhoif0vmSdWMGgDvkJEYNRZDGQsi0Veucd3T1VGRkamEaCR/1kTrNJee4suANnBywMUgnuJBCNmNhl5mnFalCtv9PpFyM9yighP4H9nLIkk6VT11MWDPfjFIZpLJfxtk+1FYSu7Tj4rNvINe7mZ0kRmowleyrKpjWQNlXl7u+74Os7pgOLadmxqPC9AmUgRi5r/8c7Hqf9Kff24zrAsua7Pc3OhflbY2b7+o3uD4fc8PLxN8VoSCMoo3YkVFFmkG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(2906002)(5660300002)(83380400001)(91956017)(8676002)(6862004)(8936002)(66476007)(76116006)(6636002)(316002)(64756008)(66556008)(37006003)(66446008)(36756003)(4326008)(66574015)(41300700001)(478600001)(71200400001)(6486002)(66946007)(6512007)(86362001)(2616005)(82960400001)(26005)(122000001)(186003)(6506007)(53546011)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDhZMSt0S2NhQ1REemN2TmJzOWYvb3I1SmJOY09ZTEorMEdDNVErV2RFMVc1?=
 =?utf-8?B?U2E1cmtTSnBpOHRNdGVPaThzTk5nQnpHMzNYdzJnbHYrUW1qNzB2U3U4VHVp?=
 =?utf-8?B?SkpHSzhieXR0M3FpYXN3VTBselE3RkNoOHpJQk4yV2lVV1AzbzNmQVZNRUFV?=
 =?utf-8?B?eWxWcGlvSDI2aTA0VU96N3VVcVJ3SGNIUkVaWVdnTWprcXFCN29ib3MrMDNu?=
 =?utf-8?B?NzJFYVZMcDU0UGZZZ09ob3FlRzRNYnpvaG1rTmhhY0RIVmtVaU1qcUxERUo0?=
 =?utf-8?B?WUV5cHEzcXFJTk10ZUp1b1Y2V1haaXJEcStmTkNWTXFaZHFJSmFrd3dBM245?=
 =?utf-8?B?ZC9BQkNuZVZ4aVh6Qm1xRVlvRXB0d1BQMUFyb1JPUThIWHpQYWw1b21nWFpN?=
 =?utf-8?B?QUducUhwMUZxenJtRnNBSnFnc2M1YkI4aGFpRmJRSnhaaG5WdWRYUStIU3FT?=
 =?utf-8?B?eU92dTR5d3NjSFFxMW5LYUQrMThuS09EMGRmcXZFa3crUkpUaEFRRkhFamw0?=
 =?utf-8?B?V1BmUVJJNXpsSzI4c3dobVBVMWtwLzkxRmpkVUVOby9Wc3c3TzBjYlVxbjJD?=
 =?utf-8?B?MEt2S08vbjdhSDhCWmJxNlRKdXI5SEFxR1JUSzFKNEloN3Zoa1oxOVB1OFpE?=
 =?utf-8?B?aDhtSjhsVGkrWE1zTHptUWw1WmRKLzlCdW5PaWg5YjV5dURXMExGWFFmSnUr?=
 =?utf-8?B?MldtM0t3bzJZMWVFNENJQmdNQTlqTi90cUxqRWJ6NmJDbm5XZmY3V2NDLzRK?=
 =?utf-8?B?a3lmZ1ZxbTZVY2Y5SnpaTTlQVHVCc0QwNEk2RVZueGUyZTFheVJJSUFNTndP?=
 =?utf-8?B?NTZ1QjZLTlF3dkFZaDEvcFBTdzVpcVJQaTR0V1p2N0R4ZmFESEd5dEkvNEJO?=
 =?utf-8?B?dGF3UDRPUjRacGRHb1BGYVErL2NPQ2YrM0srdHM3NW5aNXNnTTZyTkdrUlFv?=
 =?utf-8?B?b3FGMnZEeHR0RHg0Y25BY3lWWktRdDRzcFIrTEp1b0tsZHlseEl2Q0Zaenh6?=
 =?utf-8?B?TG0yTC9IS0dqVlJGMWFjZ2g2T212Q0plU25uc1hWaE9xUVhWSHk2bnVXL0c3?=
 =?utf-8?B?WnBNdHBGdDFxVVpTZTRnNHh2c213L2VlRzRyT3M1V0hXR284VlVaRXpCa3Fm?=
 =?utf-8?B?QzJiS3h2Wmo5WmQzYWRhRDF4RWY1T1BUYkIxbmNFUUNuam5XQ2prVHVWWTRs?=
 =?utf-8?B?SUZhTDArY2tCZEJ6KzRVSUJlMEU4VkprUVh4NnpGZ2xrRjNwUXE1YmRKRzJW?=
 =?utf-8?B?T3dvZHRlVjV3OGxlUmNQdzJGWGtsK0ZqendBMGlUSnR2d25PL296aDJYdDhN?=
 =?utf-8?B?akh4K2IzUVUwSVV1Z1AybGt1TzVCWGVPY0FQTkxvMUhQbGluZWNxd3M0THdB?=
 =?utf-8?B?S1VPbWJmQld2SS9IT2RuajlvUEl3RCtGOW5lK2dCN1JrTUd0TTMxaXlvOWxx?=
 =?utf-8?B?UnVKNkdSa2FkWTJFTFA3NjFpT0xnZS9heTF4Ulp0dFpFQVBRMDh3N2hra0wy?=
 =?utf-8?B?RjhKZEx3MXV3VGtLZDFaZEw3ZmREeUsrOW5LYnl6ajF3KzV2S1VQQkxISk9j?=
 =?utf-8?B?amRWTnN6V29HT2UwYmkrNVduU2xmbEFiMHhwUW5RREdoQlRIM1Y3ejQrYkRU?=
 =?utf-8?B?MjFBWVU5YXowVXJRVGR6OHlwWkdVemxwR0J0dVBmVGxubmpWNzhNM1QyMVZE?=
 =?utf-8?B?SXZIdDZtYmFxcGpldFg2Q3JzRXcyL0w0SWw0M0pxcmxmRTd4TlYwNGQvNDJD?=
 =?utf-8?B?bmNHZys0b3hHT25wclJ1dlNkczJRSDhSUTBXZ29SMlg3VzJ4cnp4SzZKdHdh?=
 =?utf-8?B?V2lOZ2xtMEhQZlVGK2J3TG1TL3BDdmZnS0FpNXJUaEI5c0VYNGlkUWY3dVgv?=
 =?utf-8?B?TmxtbXhDSlF4OWFJQUZpYXZGMjJ1dUV2WXNzb0IreFhYc2lTUS9IcERDcnVJ?=
 =?utf-8?B?eVlYWnMwY0MxVnVDSmFpK0Jia3R1WHdQVGNsMUZwOGhWaEJMK3JJSGMxKzZl?=
 =?utf-8?B?aU82UnhjclprZUczY3FzRCt4QTJBVEZicGVyWFI3aW4waGVqZ0EzT1RYaUVY?=
 =?utf-8?B?TkozMDdaRFpSYW9HRFp5cWdlUDNrRmw3bkxEeW1PTnVERmpxL0RGYjV3WW5Y?=
 =?utf-8?B?dkxwalJITFBoMm1TbGxhVi94am05dlI5L05Md0FrbmVUbVJMcFJGN01zbXdj?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F373F0EA4DB074FB48DDF8EF51D492E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb914b4f-e769-48d3-ff83-08db5c2f36f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 08:16:45.8206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 61+jcghc7o06jMMEc27c7DLzgsmCQQerwV9rsBNNLtYxNYv/740fw+WJcnAkgDvfEgbotarMq0vPvdeb1SyWyvhF9wEBU9s9DAIIznytkyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
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

T24gV2VkLCAyMDIzLTA1LTE3IGF0IDIyOjMyIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDA4OjAxOjA4QU0gKzAyMDAsIFRo
b21hcyBIZWxsc3Ryw7ZtIHdyb3RlOgo+ID4gSGksIE5pcmFuamFuYQo+ID4gCj4gPiBPbiA1LzE2
LzIzIDIwOjQ0LCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOgo+ID4gPiBTcGVjaWZ5
IG1heGltdW0gc2VnbWVudCBzaXplIGZvciBzZyBlbGVtZW50cyBieSB1c2luZwo+ID4gPiBzZ19h
bGxvY190YWJsZV9mcm9tX3BhZ2VzX3NlZ21lbnQoKSB0byBhbGxvY2F0ZSBzZ190YWJsZS4KPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEKPiA+ID4g
PG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8wqAgOCArKysrKy0tLQo+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9iby5oIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gPiA+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfMKgIDggKysrKystLS0KPiA+ID4gwqAzIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYwo+ID4gPiBpbmRleCBjODJlOTk1ZGY3NzkuLjIxYzVhY2E0MjRkZCAxMDA2
NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMKPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmMKPiA+ID4gQEAgLTI1MSw5ICsyNTEsMTEgQEAgc3RhdGlj
IGludCB4ZV90dF9tYXBfc2coc3RydWN0IHR0bV90dCAqdHQpCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoeGVfdHQtPnNnKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAwOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3Bh
Z2VzKCZ4ZV90dC0+c2d0LCB0dC0+cGFnZXMsCj4gPiA+IG51bV9wYWdlcywKPiA+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoDAsICh1NjQpbnVtX3BhZ2VzIDw8Cj4gPiA+IFBBR0VfU0hJRlQsCj4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHRlBfS0VSTkVMKTsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgcmV0ID0gc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlc19zZWdtZW50KCZ4ZV90dC0+c2d0LCB0
dC0KPiA+ID4gPnBhZ2VzLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG51bV9wYWdlcywgMCwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAodTY0KW51bV9wYWdlcyA8PAo+ID4gPiBQQUdFX1NISUZULAo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NnX3NlZ21lbnRfc2l6Cj4gPiA+IGUoeGVf
dHQtPmRldiksCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgR0ZQ
X0tFUk5FTCk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uaAo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5o
Cj4gPiA+IGluZGV4IDdlMTExMzMyYzM1YS4uYTFjNTFjYzBhYzNjIDEwMDY0NAo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uaAo+ID4gPiBAQCAtMjk2LDYgKzI5NiwyNyBAQCB2b2lkIHhlX2JvX3B1dF9jb21t
aXQoc3RydWN0IGxsaXN0X2hlYWQKPiA+ID4gKmRlZmVycmVkKTsKPiA+ID4gwqBzdHJ1Y3Qgc2df
dGFibGUgKnhlX2JvX2dldF9zZyhzdHJ1Y3QgeGVfYm8gKmJvKTsKPiA+ID4gKy8qCj4gPiA+ICsg
KiB4ZV9zZ19zZWdtZW50X3NpemUoKSAtIFByb3ZpZGVzIHVwcGVyIGxpbWl0IGZvciBzZyBzZWdt
ZW50Cj4gPiA+IHNpemUuCj4gPiA+ICsgKiBAZGV2OiBkZXZpY2UgcG9pbnRlcgo+ID4gPiArICoK
PiA+ID4gKyAqIFJldHVybnMgdGhlIG1heGltdW0gc2VnbWVudCBzaXplIGZvciB0aGUgJ3N0cnVj
dCBzY2F0dGVybGlzdCcKPiA+ID4gKyAqIGVsZW1lbnRzLgo+ID4gPiArICovCj4gPiA+ICtzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGludCB4ZV9zZ19zZWdtZW50X3NpemUoc3RydWN0IGRldmljZQo+
ID4gPiAqZGV2KQo+ID4gPiArewo+ID4gPiArwqDCoMKgwqDCoMKgwqBzaXplX3QgbWF4ID0gbWlu
X3Qoc2l6ZV90LCBVSU5UX01BWCwKPiA+ID4gZG1hX21heF9tYXBwaW5nX3NpemUoZGV2KSk7Cj4g
PiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogVGhl
IGlvbW11X2RtYV9tYXBfc2coKSBmdW5jdGlvbiBlbnN1cmVzIGlvdmEKPiA+ID4gYWxsb2NhdGlv
biBkb2Vzbid0Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGNyb3NzIGRtYSBzZWdtZW50IGJvdW5k
YXJ5LiBJdCBkb2VzIHNvIGJ5IHBhZGRpbmcgc29tZQo+ID4gPiBzZyBlbGVtZW50cy4KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgICogVGhpcyBjYW4gY2F1c2Ugb3ZlcmZsb3csIGVuZGluZyB1cCB3aXRo
IHNnLT5sZW5ndGgKPiA+ID4gYmVpbmcgc2V0IHRvIDAuCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAq
IEF2b2lkIHRoaXMgYnkgZW5zdXJpbmcgbWF4aW11bSBzZWdtZW50IHNpemUgaXMgaGFsZiBvZgo+
ID4gPiAnbWF4Jwo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiByb3VuZGVkIGRvd24gdG8gUEFHRV9T
SVpFLgo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+IAo+ID4gSXMgdGhpcyBhIGJ1ZyBpbiB0
aGUgSU9NTVUgY29kZT8gSW4gYW55IGNhc2UsIHNob3VsZG4ndCB0aGUgZml4IG9uCj4gPiBvdXIg
Cj4gPiBzaWRlIGJlIHVzaW5nCj4gPiAKPiA+IGRtYV9zZXRfc2VnX2JvdW5kYXJ5KCkgYW5kCj4g
PiBkbWFfc2V0X21heF9zZWdfc2l6ZSgpCj4gPiAKPiA+IHRvIHNldCByZWFzb25hYmxlIHZhbHVl
cyB0aGF0IGF2b2lkIHRoYXQgcHJvYmxlbT8KPiA+IAo+IAo+IFRoYW5rcyBUaG9tYXMuCj4gSG1t
Li4uSSBhbSBub3QgZnVsbHkgZmFtaWxpYXIgd2l0aCB0aGUgaW9tbXUgY29kZSBoZXJlLCBidXQg
bGV0dGluZwo+IHNnLT5sZW5ndGggb3ZlcmZsb3cgbWF5IGJlIGFuIG92ZXJzaWdodD8KPiAKPiBM
b29rcyBsaWtlIGRtYV9zZXRfbWF4X3NlZ19zaXplKCkgZG9lc24ndCBlbmZvcmNlIHVwcGVyIGxp
bWl0IHRvCj4gc2cgc2VnbWVudCBzaXplIHdoaWxlIHNnX3RhYmxlIGlzIGNyZWF0ZWQuIFdlIG5l
ZWQgdG8gdXNlCj4gc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlc19zZWdtZW50KCkgdG8gc3BlY2lm
eSB0aGF0LiBJdCBzZWVtcwo+IGRtYV9zZXRfbWF4X3NlZ19zaXplKCkgaXMgdXNlZCB0byBzcGVj
aWZ5IHRoZSBtYXhpbXVtIHNlZ21lbnQgc2l6ZQo+IHRoZSBjcmVhdGVkIHNnX3RhYmxlIGhhcyB3
aGlsZSBkb2luZyB0aGUgZG1hIG1hcHBpbmcuIFRoZSBpb21tdSBjb2RlCj4gZG9lc24ndCBldmVu
IGNvbXBsYWluIHdoZW4gaXQgcnVucyBpbnRvIGFuIHNnIGVsZW1lbnQgd2l0aCBzaXplIG1vcmUK
PiB0aGF0IHRoZSBvbmUgc2V0IHRocm91Z2ggZG1hX3NldF9tYXhfc2VnX3NpemUoKSBkdXJpbmcg
bWFwcGluZy4KPiBTbywgZHJpdmVyIG11c3QgZW5zdXJlIHRoYXQuIEkgdGhpbmsgd2Ugd291bGQg
c3RpbGwgbmVlZCB0aGlzIHBhdGNoCj4gYW5kIHVwZGF0ZSBpdCB0byBjYWxsIGRtYV9zZXRfbWF4
X3NlZ19zaXplKCkgYWxzby4KCk9LLCBJIG11c3QgYWRtaXQgSSBkb24ndCBmdWxseSB1bmRlcnN0
YW5kIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbgpkbWFfc2V0X21heF9zZWdfc2l6ZSgpIGJ1dCBJ
IGFzc3VtZWQgaXQgbmVlZGVkIGFkanVzdG1lbnQgaWYgd2UgY2hhbmdlCnRoZSBzZWdtZW50IGJv
dW5kYXJ5LCBsaWtlIGJlbG93LgoKPiAKPiBZYWgsIGxvb2tzIGxpa2Ugd2UgY2FuIGNhbGwgZG1h
X3NldF9zZWdfYm91bmRhcnkoKSB0byBzZXQgYSB2ZXJ5Cj4gbGFyZ2Ugc2VnbWVudCBib3VuZGFy
eSBzYXkgKDB4ZmZmZmZmZmZmZmZmKSBzdWNoIHRoYXQgdGhlIG1heGltdW0KPiBzaXplZCBCTyBm
aXRzIGludG8gaXQgKGllLiwgd2UgbmV2ZXIgcnVuIGludG8gYW55IEJPIGNyb3NzaW5nIHRoZQo+
IHNlZ21lbnQgYm91bmRhcnkpLiBCdXQgSSBhbSBub3Qgc3VyZSBpZiB0aGF0IGlzIHRoZSByaWdo
dCBhcHByb2FjaC4KPiBJIGFtIG5vdCBzZWVpbmcgbWFueSBkcml2ZXJzIGNhbGxpbmcgZG1hX3Nl
dF9zZWdfYm91bmRhcnkoKSAocGNpCj4gcHJvYmUgc2V0cyBpdCB0byBkZWZhdWx0IDB4ZmZmZmZm
ZmYpLiBPdXIgR1BVIG1heSBub3QgZW5mb3JjZSBhbnkKPiBkbWEgc2VnbWVudCBib3VuZGFyeSwg
YnV0IG5vdCBzdXJlIHNvbWV3aGVyZSBlbHNlIHRoZXJlIGlzIG9uZS4KCkhtLiBJIHdhcyB0aGlu
a2luZyB0byBzZXQgaXQgdG8gKDB4ZmZmZmZmZmYgPj4gMSksIGFzc3VtaW5nIHRoYXQgdGhlCmlv
bW11IHBhZGRpbmcgd291bGQgdGhlbiBuZXZlciBvdmVyZmxvdz8gT3IgbWF5YmUgdGhpcyB3YXNu
J3Qgd2hhdApjYXVzZWQgdGhlIG92ZXJmbG93IGluIHRoZSBmaXJzdCBwbGFjZS4KCi9UaG9tYXMK
Cgo+IAo+IEFueSB0aG91Z2h0cyBvbiB3aGljaCBhcHByb2FjaCB3ZSBzaG91bGQgZm9sbG93Pwo+
IAo+IE5pcmFuamFuYQo+IAo+ID4gL1Rob21hcwo+ID4gCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiByb3VuZF9kb3duKG1heCAvIDIsIFBBR0VfU0laRSk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+
ID4gwqAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0tVTklUX1RFU1QpCj4gPiA+IMKgLyoq
Cj4gPiA+IMKgICogeGVfYm9faXNfbWVtX3R5cGUgLSBXaGV0aGVyIHRoZSBibyBjdXJyZW50bHkg
cmVzaWRlcyBpbiB0aGUKPiA+ID4gZ2l2ZW4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bS5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiA+ID4g
aW5kZXggMmFhNWJmOWNmZWUxLi41YzJmZGZjMGU4MzYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bS5jCj4gPiA+IEBAIC0xMTcsOSArMTE3LDExIEBAIGludCB4ZV92bWFfdXNlcnB0cl9waW5fcGFn
ZXMoc3RydWN0IHhlX3ZtYQo+ID4gPiAqdm1hKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJl
dCkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsKPiA+ID4g
LcKgwqDCoMKgwqDCoMKgcmV0ID0gc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcygmdm1hLT51c2Vy
cHRyLnNndCwgcGFnZXMsCj4gPiA+IHBpbm5lZCwKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oDAsICh1NjQpcGlubmVkIDw8Cj4gPiA+IFBBR0VfU0hJRlQsCj4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBHRlBfS0VSTkVMKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gc2dfYWxsb2Nf
dGFibGVfZnJvbV9wYWdlc19zZWdtZW50KCZ2bWEtCj4gPiA+ID51c2VycHRyLnNndCwgcGFnZXMs
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGlubmVkLCAwLAo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCh1NjQpcGlubmVkIDw8
Cj4gPiA+IFBBR0VfU0hJRlQsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfc2dfc2VnbWVudF9zaXoKPiA+ID4gZSh4ZS0+ZHJtLmRldiksCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgR0ZQX0tFUk5FTCk7Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdm1hLT51c2VycHRyLnNnID0gTlVMTDsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIG91dDsKCg==
