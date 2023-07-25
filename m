Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3CEEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F25A10E180;
	Tue, 25 Jul 2023 20:49:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1679D10E180
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690318145; x=1721854145;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=TevM0k9F/0SfWpz7mWx3OyuzbHyjEo8FP8iur4rOTaA=;
 b=b1vQ6yOyi1cLCFQSJQWwSRngBS+EJihsyDJfgnX62HGwso21CoIldCPq
 bDyj27yjlo0/OdGjbgXSHZ8ATaNzZsoj+UCNotmDQA9tr9JWwigDhIRsH
 0cHO7R64fUExOmettjdkzkA5o6YMKEn5XVq3A3ElyeXu1Zs6zmsJJo+aP
 +4F64xTaBmPWavy7PgJ4naSJrJWxjeWt7LnyBNtDGGSlPacLBabmT9qxi
 oAeuVyFzy+B8D8duycAwl5ErgWVgc7WkCoMUN9ACGdjacwk3xzVqvRHuy
 g0vSJHZg7ey7jUb/gRzZYHtanpIBxgmDHWwBDV9FTlP7xI6lkgtg90Spq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366721856"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="366721856"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="755902680"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="755902680"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2023 13:49:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:49:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:49:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 13:49:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 13:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ena2+i0X5nQTSgnAp5quiDzOzgBo3sams7CLnuvM/W8SS0mjPHRreftlMtd83ZDQwNKQ6pIdnehP031kPfWz61TsAYtzhIKJh+U60+9I6Qjirdx2FqD92+JiAP4kwfAFjIbirT528WubkHKy+UA5RboQJ/E+RphXHU2jwBlxZHEC69Z0rA1b+WvMWPpa7x22PItWYmn/RRuIjzpBPQgM/y0HUz8tJ0xWqx0bxYYbVb7Ef9hpEOTG5eiKbl8ycTP74umS2dGCXDYISje28m6OxdulTyj6yxdjIBgsBmxKWUBpQupCZ8uOj4E91J/n3bQHJd9UMOUG7SmKL8h4GbpBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TevM0k9F/0SfWpz7mWx3OyuzbHyjEo8FP8iur4rOTaA=;
 b=h+npszvVoHtDDocpRGt1N0MBjZCXSd7C8XoXrLJlm76PofZO2qiZvS2h2HkslrevisVAFzKmySmP+BZPtlS1JDo1j4yWhwQOQ1NxNft2uoPrLlje7R+VgdFqfmatxutjIHjTJUWv77dFWcsUHewZMCW6qlXmsoe6mpgHT1mc5AOnlU9A2mDOa6FI4xTD1q3i3G3PsLbIj9kkZDzR7UcO9tvL3phxTymdltek42O7WCOY5Q9PddXxHVrGkM75Xr0IYlsr4hnKB4b87OUBXLkCa9xOYrIbRHTVzJIszWnmBTCZyGcZz6R/h59ad6yzU/eq0FtoKFPOA5ozg5eSloSIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 20:49:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 20:49:00 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yu,
 Effie" <effie.yu@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Hazubski, Filip"
 <filip.hazubski@intel.com>
Thread-Topic: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
Thread-Index: AQHZop1ZstXJZEoUaEaaqGiTqqsaSa+iNWCAgAAAt4CAKPeMAA==
Date: Tue, 25 Jul 2023 20:49:00 +0000
Message-ID: <fd0446d5e9ff3e4a6ff7fd4a5a19b618b084ca6c.camel@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
 <fb445fe4c72588d7582aa877b7a2653d321bec7a.camel@intel.com>
 <46ad96b97b10828cf721b944c84c5b75de7b5872.camel@intel.com>
In-Reply-To: <46ad96b97b10828cf721b944c84c5b75de7b5872.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4857:EE_
x-ms-office365-filtering-correlation-id: 8d3c93cc-9859-49dc-be99-08db8d5092e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zyu+U+F6HYF4svW2VKC7PtWqg7TMHfFEgn/SoHvjUwNmb51s4htIqCJDCBXZuup6o4jydowhBNbLGwg/LTKZyEm/HnEwRO8qAlLeskeQ/5nCrD1G9MyiY9qutrDHVc7cIWDmfoyhhuVmKgniKgZnIjp/q7zy3XVxBQrIZUV5hyls98h9GRnSPPHaBXSBDMdQzYeD4tQuCDWPO7pbQz6RrTzQZ91zb0XzmXqOoK9+wbRG3G+R7srBjHaQGBE2jYfhL23nTwiNIUJw5Qyzm4GPvvK0vsJkA2IrzYEv2IjMlPsfe82cB0cBhNyfucBk2xLE0AR++z3lj1TXJ9+o21kb+BjTguU3PtM83acqaMxyUTm93cvjdARCBv8+knnxqw4SN1GXfQGBOhhmOeddp4G3KAoZPK+PmQnZUmdH67XxJzIGuLRAO86squx7lOrlst7FwfF8Z//FL178VJ2RrD5UUybzgC8P3EwXSfzxiGJb0aApEzr4SmHVJgOwwxkqrJiwgHscAx8EIcGSBoSU5U43DcqesEjjt79xdtYwYGe5P9mjrTHdgZ+Jfmh5aVtOz1Yj/CuaIKbTFmpHP1Y82+MPbmmeS4+e5qKUIvPrT0L65Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(2616005)(2906002)(83380400001)(6636002)(316002)(66946007)(66476007)(66446008)(76116006)(91956017)(6512007)(966005)(66556008)(64756008)(41300700001)(6486002)(38070700005)(8676002)(478600001)(86362001)(71200400001)(36756003)(38100700002)(186003)(122000001)(82960400001)(110136005)(6506007)(8936002)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0Nob2kvMk5maVBPQzhoeTNwOHVmS1RIMnU2emxXNTUvQmRWcjJoVE5ueUN2?=
 =?utf-8?B?eHpDR3NjeHlWTnVQU1J6aUYwWm5RSHhleDR1aHJYMVZQTHJjYUtKTnhzU0tS?=
 =?utf-8?B?cTAzdUIzOGZiVldlcURBS2x0NXhObmJRVTBzME4vZ29PVUlNVE5FUTd1WXFO?=
 =?utf-8?B?Ni9qZW9NTFpuUEhMUGMxMmVZbWFPcHZoRTgxZURWUlgwaTdMRXR4NDVKVFZZ?=
 =?utf-8?B?OWluaEZtRGdHSGtGdTZtRy8vMzFhcGFWVDcybEVnTmdkWXE0MlhjeEhlTWZQ?=
 =?utf-8?B?TFRTcmszMHRJMno3cjdUa3J4bnNHWG00WWV6K1lUbjRWdnNSWlBjbzlRMjlw?=
 =?utf-8?B?cjNaUFFjZGp5eHQ3cVpsZlFGQitSSThVc0ZFNEVtWUVvUGhicUtMZ2F5dUkz?=
 =?utf-8?B?S2R3MVh4RjQ2NFpoQ1QvNVNKd3ZRTUVLM3l4bHF1WXZTRy96elVJbm82eG1j?=
 =?utf-8?B?bUlPaUdQQ0FQZW15Q0Z1SXE4cEk5elQ0U0JCSXhrcFVXc2U3OFFlTHJIajNV?=
 =?utf-8?B?UlRXRXozUWxaSTVsNGJnSEp2QWZCRDQrdlc5dHpPQmZMWTdMNVBMdE52UjRE?=
 =?utf-8?B?RUFQVi9COTlJNGQrOUtwYVNIZ0MyUCs4cWQwNWdVOWUzejkrOGsxRnAyak1R?=
 =?utf-8?B?eDR3M2FHb012WUg0L1JlMzk1c24vdUF2L1lvd2ZveXlJYTRKZGtSdWpjSUFw?=
 =?utf-8?B?QmhuQnhPamlvOXp0NFJtUSthaXJOem4vbjJ5eHB5bHNBTG9ZWkh5UUpTSkpx?=
 =?utf-8?B?ekxWTDZ1VWc0ZWYranM3VVJ4RDgweEZkSzJqQUZTK0Eva0M4dHVKNHN5clp2?=
 =?utf-8?B?bGNtcjJyUGU4L3BIQzlCNEFWQ1AyaHdsbTByS1N6YmR5bjE0OWlPTFVJV3Bl?=
 =?utf-8?B?S01xSmx2eDkxQ3FWekhYdHdERlFzV1l2UTc0RW94S3cvbVZGYTJJeG5QK2s2?=
 =?utf-8?B?eE5MMDNlK3JSS3RUWkpSTUV5YkVoZnFDWnRFdVZWRFBTNzFnZUQ2dzVzVmYz?=
 =?utf-8?B?RG82eEdkTnhVU1VYQ1VpRGo4SUZGTy83Kzd1dTNJQXJjc0w2VDlGOU9QWVd4?=
 =?utf-8?B?SEMwZWlBV3lGV1BTL2NhMFhrTmFjQVNOdUVlSFBWUHhCZWJ4Tk81M1FNWmZT?=
 =?utf-8?B?S1B0dS92aUlhY0pBM24rQnpzSTUweDMxL2ZvRi9OeVNBNGlGS0VqWTczZDV6?=
 =?utf-8?B?Wmd1M2xXT0x5SHRRdW5mK1pYcVdZWDRjWWxkL1ZhYUd5c3QwakcyT0UrcVZK?=
 =?utf-8?B?MkJZY1dZaFdyd2VjaDJOS0hOUWtOcytXMDd5WlFIUUdUODBzR3k3aVdqZ0k2?=
 =?utf-8?B?eGM5R2RNOXVwcnp4ZFpnZmhoYUs4cW1rUUhiZ0NlWC95MklYZ3dWMHEzcXVK?=
 =?utf-8?B?WldNK0lnQ2pIamlwRTl4UkNsdjE0UVZCcDJGZ0dSNHd3a2xXbnJRUDA1MmRn?=
 =?utf-8?B?LzZ3SWpaK3lXcDdUYzcvWFRuS0F1SWZQR2N5NERIdSt0bkRweGlDeDhkNklF?=
 =?utf-8?B?amdjNzdmRnBTZU12Y1RyOHM3UGtDL2ppOVdxVVg0VlJMbTF4Z1FxZTh2ajA2?=
 =?utf-8?B?NGJObHR5eVJGbnhydmh6dHhRZXJQNlRlQW9uRkYwaG9VSmg5VkRwZXNxNzF4?=
 =?utf-8?B?dWlKYjg5NDBnK2h2S01RbGZybmp2bUUxRlp1K0w0NUt6am1PN1FiT1BwbE45?=
 =?utf-8?B?blhydlpXRHpBa21wYW9YcmozeVVHUHNIS1N1Q2s1bFQ4YTNuNlM2MlhaelVQ?=
 =?utf-8?B?eFEwRXp6L0hWaVdLKzVqWW0reE8reVAweEFSOUQ4dE1WNXZTbHU4b2JPb2pa?=
 =?utf-8?B?ejVmbE5pMTcrMll4RDZ4ZXpGSUFmWTRDR09KUzF1UmcwMmlPM3hEQ3hMdkNF?=
 =?utf-8?B?VFZMQWNtaHlkWmNtRG1kQkNFZm9ybDhDbDNEenpzS3hCMWJCQ1J5aTcxWXA5?=
 =?utf-8?B?djhOelJPdmx2TUNyaXhacUs5ekw2ejRsZFQ2WEkvZWZoVlk5ays3S1NqYUtV?=
 =?utf-8?B?ZzFwZTVvdFkwMnNBZ1FCb1NxSTV1bm5TbFlSa0dZc081Y093T0hINm9GMjZ5?=
 =?utf-8?B?bnpUNFVHNTduQkU3QzY5N3gvOHJjdURFeDl4RURWdFpCKzRvcVk4ZHF3ZkFh?=
 =?utf-8?B?R0pRYUV6TG1wNEVkd0hpOTJWVjgwalBYUlVUd3FUdjk1TWRNTGVyM0VKYmNn?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE41C35B87076144B9C2FE2F5D810707@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3c93cc-9859-49dc-be99-08db8d5092e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 20:49:00.4502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1zyLjvUJBw03mEPr8Hutq9tzSOG6SnqnR7tS4UNsOgxWmR+yK44oSKER8jNZ+p9qc9+oVJfxSUwGEzeujoUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
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

TWF0dCBBdWxkIG1lcmdlZCB0aGUgS01EIGFuZCBJR1QgcGF0Y2hlcyB0b2RheSwgTWVzYSBwYXRj
aGVzIHdlcmUganVzdCBwdXNoZWQgdG9vLg0KDQoNCk9uIFRodSwgMjAyMy0wNi0yOSBhdCAxMjox
MiAtMDcwMCwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gY2MgdG8gb3RoZXIgVU1E
cywgaW4gY2FzZSB0aGV5IGFyZSBub3QgYXdhcmUgb2YgdGhpcyB1QVBJIGNoYW5nZXMuDQo+IA0K
PiBPbiBUaHUsIDIwMjMtMDYtMjkgYXQgMTk6MTAgKzAwMDAsIFNvdXphLCBKb3NlIHdyb3RlOg0K
PiA+IE9uIE1vbiwgMjAyMy0wNi0xOSBhdCAxMjowMCArMDEwMCwgTWF0dGhldyBBdWxkIHdyb3Rl
Og0KPiA+ID4gVGhlIHJlbWFpbmluZyBzbWFsbC1iYXIgYml0cy4gQWRkIHN1cHBvcnQgZm9yIHJl
cXVlc3RpbmcgQ1BVIGFjY2VzcyBmb3IgVlJBTQ0KPiA+ID4gYnVmZmVycy4gQWxzbyBleHBvc2Ug
dGhpcyB0byB1c2Vyc3BhY2UsIGFsb25nIHdpdGggdmFyaW91cyBiaXRzIG9mIHJlbGF0ZWQNCj4g
PiA+IGFjY291bnRpbmcuIEZpbmFsbHkgdHVybiBvbiBzbWFsbC1iYXIgc3VwcG9ydC4NCj4gPiAN
Cj4gPiBNZXNhIE1SIG1ha2luZyB1c2luZyBvZiBuZXcgdUFQSSByZXZpZXdlZCBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMjM3ODEganVz
dCB3YWl0aW5nIHRoaXMgdG8gZ2V0IG1lcmdlZC4NCj4gPiANCj4gPiA+IA0KPiA+ID4gdjI6IFZh
cmlvdXMgaW1wcm92ZW1lbnRzIHN1Z2dlc3RlZCBieSBKb3PDqQ0KPiA+ID4gdjM6IEFkZCBzb21l
IGtlcm5lbC1kb2MgKEd3YW4tZ3llb25nKQ0KPiA+ID4gdjQ6IFNtYWxsIGtlcm5lbC1kb2MgZml4
LCBhbHNvIHVzZSB0aGUgY29ycmVjdCB2ZXJzaW9uIG9mIHRoZSBzdHJ1Y3QNCj4gPiA+IHY1OiBS
ZWJhc2Ugb24gbGF0ZXN0IHhlLW5leHQgY2hhbmdlcw0KPiA+ID4gdjY6IFJlYmFzZSBvbiB0aGUg
bmVlZGVkIFBMX1RUIC0+IFBMX1RUIG1vdmUgZml4LCBwbHVzIGZpeCBzb21lIG90aGVyIGlzc3Vl
cw0KPiA+ID4gICAgIHJlcG9ydGVkIGJ5IEpvc8OpIHdoZW4gcnVubmluZyBhY3R1YWwgd29ya2xv
YWRzDQo+ID4gPiANCj4gPiANCj4gDQoNCg==
