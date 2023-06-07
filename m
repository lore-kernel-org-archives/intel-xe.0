Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890F9C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 18:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A6510E539;
	Wed,  7 Jun 2023 18:02:33 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9CF10E53A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686160951; x=1717696951;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=oxxFXKlxjiyXrIWqOlN1HRQXjkC8I0SAL0paITpoTo8=;
 b=BbFpPoQUCcs+kwHRRltkVhXCM5Va/uhYXXYZf02T/1bwUW9f+1vZWdSu
 Y0nFPATayEbYy6eYidah+j9/bvPJ6QNAfMX1K9pF/iXnFBwwX+HmYQi27
 07gJ0qFEk2iHHVN1Myda68PMuOg/qPFW2N08uWywir2w7Dp4Ynvh9U6zd
 ZjyIHN3s36P+PHQ6c9cQKb5et3Nz4FaOkEaAaWOLyc1N3I6qIbkwqLc8G
 1uMQc8PR+tZ1iQvoStDdXy+ljqvSlM7X1ObXCGLSNCQNXVlmqYsoRi3w1
 FCxvfWf6+CyMwF/nXNS6GKe1ETloFMS/f/DdsgnjJxWhvWriuAR74AtTP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337427392"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337427392"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687065687"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="687065687"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 07 Jun 2023 11:01:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 11:01:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 11:01:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 11:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGacJTjnPM1ktEz/YRWx/qF/fULgGBcnaT50f9xWLmkQ9w4IUAQuOiivb0vC4rStzmrz2PKlxcCLRD0y+WhXf1SyJbJkg9cHtH0kb/vVmTVA9u7XgNABClnaRLVVuItw47SjLEcI3XI8p1ssRYvyyNjDKQtH8b1yqT7dJ7hm4WPHpGsR0fdaz2enCEVR2lE4Cr3HmIYKIKCh46F56b2HZ6UsQgn/pQ7eT95qmzfB9wb6dvnZ/VRmPKIvhAsPd9vHk9Dft3eDz/gkmVxQGe0YXykJ0hUJ/9L3U8Ry7oKd6/OYylnpvdc7TMiMGRGusnAziRENjJj59q3K20G9snpN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxxFXKlxjiyXrIWqOlN1HRQXjkC8I0SAL0paITpoTo8=;
 b=cJVLipoeoUT0WqQR/qOW0M3sz3WTEfa6tfDppv75OP19T+6QD0cIyE1bnj+w7auP1o4hr0rfCA5VcQY+kB6Nd/TbGH3OBqWv5r1yVkXfB5kej09RdgDiPXQC48sg5gNaZFvPPkm4oqzwAb1SZKOZ6zVMr8ocCpXjuJ5xQIeiZaaJ4PUKFAIM1DCvZd0Y9XJr2wKwBrbk1rwOf24pFwQ3Uf89rPLGRhS7qAW5s05gp3F8uYu5aUO55fVswtIXxnUD1H7Yzh+K7pKLOlbSR4ZE8zaqEsYRWHK2CIt4KPW1eaxGWgL8UvSzInjxhEIxz4Oj/8VhXn7872OKcQpaz6ozuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 18:01:22 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 18:01:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Invalidate TLB also on bind if in
 scratch page mode
Thread-Index: AQHZmWgy/OmmiWPflkOfCPV0b0Xh4a9/oU0A
Date: Wed, 7 Jun 2023 18:01:22 +0000
Message-ID: <8aadce6648157d37f56f0593855accd406c10705.camel@intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
 <20230607174729.54899-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607174729.54899-2-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6185:EE_
x-ms-office365-filtering-correlation-id: d1e5c985-bc9f-4de0-da1c-08db678133d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oJgrHjL17btrf4YNIshJYCAQ9eVQK/XVNCtdNrlxGQXFH8CZtSxRRdqqcU8conuJsUfpAjDuXjJ/QQ4I78olzbekp9md2P0T6lBFBleFYUMHrptriTc0U5nCdL2tPPXfQX2y3vSbeBw5gXk+tg3ZWdWw03Nqh4GeB1UuOE1MF0eW2d4uIrSoLYStqdYSvjht+AOIbfaMBtJF7Bl8qpS3rsHhanaHQspHB20sRy5VCcgYPuxXMJcFDp8yGKTnxMTlSbdYLQhgT4tKetxb64pcKL0/1hUnOnN288BJSr7ikMzrGO7CTJVRwOZmPp/oq29gkse28jfWKuUvLKS2KEu5w/KWL8PQ2jTjJ9DwZRXLf1DPyVSfSMdO6jSmr05F+ekLcThsc4jbFKpNlM3evL2UmCsc+xtM+HY4S5zVoHkdg3jXUAto6WJl6gnm8ETLqZ1cH4szk6W99VIL6ExEqb54V5c4Ko/EoN+pE4nQ58VDJmDZnCtNEAbvQ0oko6710SvuFMOpbDhhj+lD9zrsG5GJfKCet3UP5XM7t3AXffJMBE8+q8qCYdUDjmI8Vuzl2Riq+pkQwXUt38BAJubr/3Tu0LnVZ+1MRJhN1COX/rzeR6M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(6486002)(66946007)(186003)(82960400001)(478600001)(110136005)(91956017)(8936002)(8676002)(38100700002)(64756008)(316002)(122000001)(66476007)(66446008)(66556008)(76116006)(41300700001)(83380400001)(26005)(6506007)(6512007)(71200400001)(66574015)(2616005)(86362001)(38070700005)(5660300002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0UyY1ZGemhKT284dTNmbVZ4eXdoeG4zYVVUUnNyQkVZa0k0U3JDelBGTXda?=
 =?utf-8?B?OHpWMWNzQlZrMWEwZk5CcTVXeGRKK3hoNUdLRU9wWTNpSnMyRm82ZXNZWEJv?=
 =?utf-8?B?NVlRa29zczJMM3RobHNIa3pXajlRbjhSWHVTOTA1Y2hIcWRGSWY2UVNnbzlp?=
 =?utf-8?B?cS9ibmVJS1hXTlV0WEkwRUlJRHpacVg1ZUsvT242UEVZTVdCSnB5MlZCSzRm?=
 =?utf-8?B?WFNEU2tOZnFvL2R5U3FvTGVOTFlRWTBOM1oraDAxOWJpVE5RTDBTSWhkS3dF?=
 =?utf-8?B?WEwyUE9YcS94UVNMM0dneDFrUUxZM2E0a3lNVmVUTldYZWovZzcrYWlJaG5i?=
 =?utf-8?B?RC91N1pWd0hab0ZZUDQ2SWdoL0cwRTFaUmRSMHpXd3lWWG1FZEZZeVRvL2Vi?=
 =?utf-8?B?NWx0aFlneG1sOWdSYkNtVGh2YnNCM3dGdXhIa2ErejcxbVFYMGZzQkswb3c0?=
 =?utf-8?B?SlFVNlpjRFIyQUFPYTNKc3JtNGtzdy84T3lIYXRSVUlZQlRyT2MydU9jZUlq?=
 =?utf-8?B?VDE2Slc2OWtRZk5nNURXMXdORnlWZDU1VVlXYTIweFNvMUk4dFh0c3R4SGZ0?=
 =?utf-8?B?NW1uVjhLY015OVBWRWVYTFBKS1JqSzhUTy94NTlSOTAralpWeDlTcktJeTRD?=
 =?utf-8?B?M092RUhyT1YzdEpMaGV5VnRjRUtNM3E4UVdUSW1RbmFzU3ZTME5IRmdhS3Vi?=
 =?utf-8?B?c0JBdDZaRHM1QWdCd0dFUGJrckx4MkZrSEFBSGI3Rnd2WTFQQ3B4R0ExM1Jm?=
 =?utf-8?B?NjAyWEtsVnZLTFE0eC9CRDdzdlM1NDNZbGpxN3lubjEvcGljemhma2pFQUJN?=
 =?utf-8?B?ZjJnemRkdm5UR29Yc1BSdGt1Vk5hdDE4Tkd0U01Bd1pzTXg4dmhndGNLd3Vr?=
 =?utf-8?B?S2EwdlU5dFAxcE1wNlJkdWpCZjBMeitBVWQ3TlIwbE11bGE2NXVnR3FtQ0Vq?=
 =?utf-8?B?TE0rdXZzak92eTNTU1Nqb1diVGpVaFNESnFmUUtwY2VpUWtXbFlvL3Q1ZHVp?=
 =?utf-8?B?OUk0Y254U1JXcElEMUlTMTZkS0NWZGZaWWN6ZnJGa3FJMzhyNW15Q093NC9N?=
 =?utf-8?B?VWd4SVBnc045aVBIMlZvWGI2OWJLejlHUHQ4bDgyUGtGTzBFSVFHRzErZ0Yy?=
 =?utf-8?B?aDlpRTVGZ012a0pjZnpnL0hHR0J2S1ZOREY5a3lNbzd3ZTJadHNiSk5rZkRD?=
 =?utf-8?B?bU1SSHdWSmk5enZlVVBwWGpJSVNyWWw3cUNLbzNFa1RTaTR6aURHVGNXVWpl?=
 =?utf-8?B?VVF2bEYzdDJQaDM1aHI1bXc4UWsvc1VLTlYvdkVxTXp5R3ZVV0hQbjNkNkMx?=
 =?utf-8?B?amh1S0pIK2hnT0dMVit5M3Q3aWRFVUg2aHBraGZqUSt1Nkd0ZUYyNTBKU0pK?=
 =?utf-8?B?NUV4SHdQbndXR2kxVloxTnYwNDhuVVQ5UStGN21heXl5V1RhcVIvdHlzYjNr?=
 =?utf-8?B?ZDFsTlhNclVvdzkvTHgrQ3ROa2M5ai9hV2g0UStmWXRETXJzOGZIdFRZVVg2?=
 =?utf-8?B?QnJBaldSVkJRQS83VjBkVjM3dENlYW1iZmRSSUxUVkN5VEV4REhrdThYNU1W?=
 =?utf-8?B?TDl4UUpzTUJCMU83NDFVWWo1R1pnKzhtaTlpR1MzZjZrWm51dTJEVldneXRt?=
 =?utf-8?B?RHpSZ2JVQkphUjQ0RW1RUUozQW5Za1k3Zi83QnFONDc1Qll1ZHhtYXhOVjFY?=
 =?utf-8?B?d25yemo5azI0b3N6ZWZnREVxcXJ4TWpWTHlHa29LZjRuSkRRd0VHWncwVEY3?=
 =?utf-8?B?R2E5dmYvUWNhcktaN0g5ek54QU8xV05pMncveWR2dC9YSk5tOXlob3FFQjJF?=
 =?utf-8?B?b3V2YUxScmkrUmY5MUp6WDZaYzBNeWh3ekg4ODlLUjhjK3hMeS8yVzN5V1JO?=
 =?utf-8?B?L2ZRUGdDZEM4ZnUxY3RZcTlqdGQ2Yy9SVThFeDg4OHJ6YmEvZDkrQ3p0ODRU?=
 =?utf-8?B?NUdTcmZMU0JoaHF1UXA0cmp5RHVPVGpyK0ZMMnhwTjBQLzAwdnBpcit2b0dl?=
 =?utf-8?B?Vllhc0Nxd1J3U2lJbDJqZ2Rjb3V6UUNydXBCYnNhMlBaaEVaYjBLY3RlWDZ5?=
 =?utf-8?B?SG10cHRtWWlVTEI4UjlvakI2THRvcXQzRGFzK3hCb3dlS1BhVXNrMWJMT2NL?=
 =?utf-8?Q?7hUQGAAABhfJYdxv7D1NYlaKP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5068C02379BBE428F6C7A3DCB0AA673@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e5c985-bc9f-4de0-da1c-08db678133d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 18:01:22.0852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/G6L+mFuoucj0ErJJmtlf5GNB0eFwoC2AxE3YQdI6JXAsA9tUYnZyOFk8aQFYaAhxvTyCuTLGxTgyymS0+6cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Invalidate TLB also on bind if
 in scratch page mode
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

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDE5OjQ3ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gRm9yIHNjcmF0Y2ggdGFibGUgbW9kZSB3ZSBuZWVkIHRvIGNvdmVyIHRoZSBjYXNlIHdo
ZXJlIGEgc2NyYXRjaCBQVEUgbWlnaHQNCj4gaGF2ZSBiZWVuIHByZS1mZXRjaGVkIGFuZCBjYWNo
ZWQgYW5kIHVzZWQgaW5zdGVhZCBvZiB0aGF0IG9mIHRoZSBuZXdseQ0KPiBib3VuZCB2bWEuDQo+
IEZvciBjb21wdXRlIHZtcywgaW52YWxpZGF0ZSBUTEIgZ2xvYmFsbHkgdXNpbmcgR3VDIGJlZm9y
ZSBzaWduYWxsaW5nDQo+IGJpbmQgY29tcGxldGUuIEZvciAhbG9uZy1ydW5uaW5nIHZtcywgaW52
YWxpZGF0ZSBUTEIgYXQgYmF0Y2ggc3RhcnQuDQo+IA0KPiBBbHNvIGRvY3VtZW50IGhvdyBUTEIg
aW52YWxpZGF0aW9uIHdvcmtzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmMgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKystLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAgfCAxNSArKysrKysrKysr
KystLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ncHVfY29t
bWFuZHMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oDQo+IGlu
ZGV4IDBmOWM1YjBiOGEzYi4uZDJkNDFmNzE3NTI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9ncHVfY29tbWFuZHMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUvcmVncy94ZV9ncHVfY29tbWFuZHMuaA0KPiBAQCAtNzMsNiArNzMsNyBAQA0KPiAgI2RlZmlu
ZSAgIFBJUEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYCQkJKDE8PDIxKQ0KPiAgI2RlZmluZSAg
IFBJUEVfQ09OVFJPTF9DU19TVEFMTAkJCQkoMTw8MjApDQo+ICAjZGVmaW5lICAgUElQRV9DT05U
Uk9MX0dMT0JBTF9TTkFQU0hPVF9SRVNFVAkJKDE8PDE5KQ0KPiArI2RlZmluZSAgIFBJUEVfQ09O
VFJPTF9UTEJfSU5WQUxJREFURSAgICAgICAgICAgICAgICAgICAoMTw8MTgpDQo+ICAjZGVmaW5l
ICAgUElQRV9DT05UUk9MX1BTRF9TWU5DCQkJCSgxPDwxNykNCj4gICNkZWZpbmUgICBQSVBFX0NP
TlRST0xfUVdfV1JJVEUJCQkJKDE8PDE0KQ0KPiAgI2RlZmluZSAgIFBJUEVfQ09OVFJPTF9ERVBU
SF9TVEFMTAkJCSgxPDwxMykNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
dC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gaW5kZXggYmVmMjY1NzE1MDAwLi5l
ODE3ZmE5ZmU2NWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+IEBAIC0xMjk3LDcgKzEyOTcsMjAg
QEAgX194ZV9wdF9iaW5kX3ZtYShzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwgc3RydWN0IHhlX3ZtYSAq
dm1hLCBzdHJ1Y3QgeGVfZW5naW5lICplLA0KPiAgDQo+ICAJeGVfdm1fZGJnX3ByaW50X2VudHJp
ZXModGlsZV90b194ZSh0aWxlKSwgZW50cmllcywgbnVtX2VudHJpZXMpOw0KPiAgDQo+IC0JaWYg
KHJlYmluZCAmJiAheGVfdm1fbm9fZG1hX2ZlbmNlcyh2bWEtPnZtKSkgew0KPiArCS8qDQo+ICsJ
ICogSWYgcmViaW5kLCB3ZSBoYXZlIHRvIGludmFsaWRhdGUgVExCIG9uICFMUiB2bXMgdG8gaW52
YWxpZGF0ZQ0KPiArCSAqIGNhY2hlZCBQVEVzIHBvaW50IHRvIGZyZWVkIG1lbW9yeS4gb24gTFIg
dm1zIHRoaXMgaXMgZG9uZQ0KPiArCSAqIGF1dG9tYXRpY2FsbHkgd2hlbiB0aGUgY29udGV4dCBp
cyByZS1lbmFibGVkIGJ5IHRoZSByZWJpbmQgd29ya2VyLA0KPiArCSAqIG9yIGluIGZhdWx0IG1v
ZGUgaXQgd2FzIGludmFsaWRhdGVkIG9uIFBURSB6YXBwaW5nLg0KPiArCSAqDQo+ICsJICogSWYg
IXJlYmluZCwgYW5kIHNjcmF0Y2ggZW5hYmxlZCBWTXMsIHRoZXJlIGlzIGEgY2hhbmNlIHRoZSBz
Y3JhdGNoDQo+ICsJICogUFRFIGlzIGFscmVhZHkgY2FjaGVkIGluIHRoZSBUTEIgc28gaXQgbmVl
ZHMgdG8gYmUgaW52YWxpZGF0ZWQuDQo+ICsJICogb24gIUxSIFZNcyB0aGlzIGlzIGRvbmUgaW4g
dGhlIHJpbmcgb3BzIHByZWNlZGluZyBhIGJhdGNoLCBidXQgb24NCj4gKwkgKiBub24tZmF1bHRp
bmcgTFIsIGluIHBhcnRpY3VsYXIgb24gdXNlci1zcGFjZSBiYXRjaCBidWZmZXIgY2hhaW5pbmcs
DQo+ICsJICogaXQgbmVlZHMgdG8gYmUgZG9uZSBoZXJlLg0KPiArCSAqLw0KPiArCWlmICgocmVi
aW5kICYmICF4ZV92bV9ub19kbWFfZmVuY2VzKHZtKSkgfHwNCj4gKwkgICAgKCFyZWJpbmQgJiYg
dm0tPnNjcmF0Y2hfYm9bdGlsZS0+aWRdICYmIHhlX3ZtX2luX2NvbXB1dGVfbW9kZSh2bSkpKSB7
DQo+ICAJCWlmZW5jZSA9IGt6YWxsb2Moc2l6ZW9mKCppZmVuY2UpLCBHRlBfS0VSTkVMKTsNCj4g
IAkJaWYgKCFpZmVuY2UpDQo+ICAJCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gQEAgLTEz
MTMsNyArMTMyNiw3IEBAIF9feGVfcHRfYmluZF92bWEoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0
cnVjdCB4ZV92bWEgKnZtYSwgc3RydWN0IHhlX2VuZ2luZSAqZSwNCj4gIAkJTExJU1RfSEVBRChk
ZWZlcnJlZCk7DQo+ICANCj4gIAkJLyogVExCIGludmFsaWRhdGlvbiBtdXN0IGJlIGRvbmUgYmVm
b3JlIHNpZ25hbGluZyByZWJpbmQgKi8NCj4gLQkJaWYgKHJlYmluZCAmJiAheGVfdm1fbm9fZG1h
X2ZlbmNlcyh2bWEtPnZtKSkgew0KPiArCQlpZiAoaWZlbmNlKSB7DQo+ICAJCQlpbnQgZXJyID0g
aW52YWxpZGF0aW9uX2ZlbmNlX2luaXQodGlsZS0+cHJpbWFyeV9ndCwgaWZlbmNlLCBmZW5jZSwN
Cj4gIAkJCQkJCQkgIHZtYSk7DQo+ICAJCQlpZiAoZXJyKSB7DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5n
X29wcy5jDQo+IGluZGV4IDJkZWVlN2EyYmIxNC4uYzIwZmU0MWMwNzI5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcmluZ19vcHMuYw0KPiBAQCAtMTUsNiArMTUsNyBAQA0KPiAgI2luY2x1ZGUgInhl
X21hY3Jvcy5oIg0KPiAgI2luY2x1ZGUgInhlX3NjaGVkX2pvYi5oIg0KPiAgI2luY2x1ZGUgInhl
X3ZtX3R5cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVfdm0uaCINCj4gIA0KPiAgLyoNCj4gICAqIDNE
LXJlbGF0ZWQgZmxhZ3MgdGhhdCBjYW4ndCBiZSBzZXQgb24gX2VuZ2luZXNfIHRoYXQgbGFjayBh
Y2Nlc3MgdG8gdGhlIDNEDQo+IEBAIC0xMDcsNyArMTA4LDcgQEAgc3RhdGljIGludCBlbWl0X2Zs
dXNoX2ludmFsaWRhdGUodTMyIGZsYWcsIHUzMiAqZHcsIGludCBpKQ0KPiAgCXJldHVybiBpOw0K
PiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGVtaXRfcGlwZV9pbnZhbGlkYXRlKHUzMiBtYXNrX2Zs
YWdzLCB1MzIgKmR3LCBpbnQgaSkNCj4gK3N0YXRpYyBpbnQgZW1pdF9waXBlX2ludmFsaWRhdGUo
dTMyIG1hc2tfZmxhZ3MsIHUzMiBleHRyYV9mbGFncywgdTMyICpkdywgaW50IGkpDQo+ICB7DQo+
ICAJdTMyIGZsYWdzID0gUElQRV9DT05UUk9MX0NTX1NUQUxMIHwNCj4gIAkJUElQRV9DT05UUk9M
X0NPTU1BTkRfQ0FDSEVfSU5WQUxJREFURSB8DQo+IEBAIC0xMTcsNyArMTE4LDggQEAgc3RhdGlj
IGludCBlbWl0X3BpcGVfaW52YWxpZGF0ZSh1MzIgbWFza19mbGFncywgdTMyICpkdywgaW50IGkp
DQo+ICAJCVBJUEVfQ09OVFJPTF9DT05TVF9DQUNIRV9JTlZBTElEQVRFIHwNCj4gIAkJUElQRV9D
T05UUk9MX1NUQVRFX0NBQ0hFX0lOVkFMSURBVEUgfA0KPiAgCQlQSVBFX0NPTlRST0xfUVdfV1JJ
VEUgfA0KPiAtCQlQSVBFX0NPTlRST0xfU1RPUkVfREFUQV9JTkRFWDsNCj4gKwkJUElQRV9DT05U
Uk9MX1NUT1JFX0RBVEFfSU5ERVggfA0KPiArCQlleHRyYV9mbGFnczsNCj4gIA0KPiAgCWZsYWdz
ICY9IH5tYXNrX2ZsYWdzOw0KPiAgDQo+IEBAIC0yNTAsMTQgKzI1MiwyMSBAQCBzdGF0aWMgdm9p
ZCBfX2VtaXRfam9iX2dlbjEyX3JlbmRlcl9jb21wdXRlKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpv
YiwNCj4gIAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gam9iLT5lbmdpbmUtPmd0Ow0KPiAgCXN0cnVjdCB4
ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiAgCWJvb2wgbGFja3NfcmVuZGVyID0gIShn
dC0+aW5mby5lbmdpbmVfbWFzayAmIFhFX0hXX0VOR0lORV9SQ1NfTUFTSyk7DQo+ICsJc3RydWN0
IHhlX3ZtICp2bSA9IGpvYi0+ZW5naW5lLT52bTsNCj4gIAl1MzIgbWFza19mbGFncyA9IDA7DQo+
ICsJdTMyIGV4dHJhX2ZsYWdzID0gMDsNCj4gIA0KPiAgCWR3W2krK10gPSBwcmVwYXJzZXJfZGlz
YWJsZSh0cnVlKTsNCj4gIAlpZiAobGFja3NfcmVuZGVyKQ0KPiAgCQltYXNrX2ZsYWdzID0gUElQ
RV9DT05UUk9MXzNEX0FSQ0hfRkxBR1M7DQo+ICAJZWxzZSBpZiAoam9iLT5lbmdpbmUtPmNsYXNz
ID09IFhFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiAgCQltYXNrX2ZsYWdzID0gUElQRV9DT05U
Uk9MXzNEX0VOR0lORV9GTEFHUzsNCj4gLQlpID0gZW1pdF9waXBlX2ludmFsaWRhdGUobWFza19m
bGFncywgZHcsIGkpOw0KPiArDQo+ICsJLyogU2VlIHhlX3B0LmMgZm9yIGEgZGlzY3Vzc2lvbiBv
biBUTEIgaW52YWxpZGF0aW9ucy4gKi8NCg0KTWF5YmUgYWxzbyBtZW50aW9uIHRoZSBmdW5jdGlv
biB3aGVyZSB0aGUgY29tbWVudCBpcyBpbiB4ZV9wdC5jPw0KDQo+ICsJaWYgKCF4ZV92bV9ub19k
bWFfZmVuY2VzKHZtKSAmJiB2bS0+c2NyYXRjaF9ib1tndF90b190aWxlKGd0KS0+aWRdKQ0KPiAr
CQlleHRyYV9mbGFncyA9IFBJUEVfQ09OVFJPTF9UTEJfSU5WQUxJREFURTsNCj4gKw0KPiArCWkg
PSBlbWl0X3BpcGVfaW52YWxpZGF0ZShtYXNrX2ZsYWdzLCBleHRyYV9mbGFncywgZHcsIGkpOw0K
PiAgDQo+ICAJLyogaHNkZXM6IDE4MDkxNzU3OTAgKi8NCj4gIAlpZiAoaGFzX2F1eF9jY3MoeGUp
KQ0KDQo=
