Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A8BC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 22:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4AB10FFAC;
	Wed, 20 Mar 2024 22:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wemso7eV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6B110FFAC
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710974091; x=1742510091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FE+JHZFEC6aaqMKCrHp+fIWaIKp2VyQ6rWt6/5qGecE=;
 b=Wemso7eVod0jo/QnfLeejrbBWefQX0La1Nd0KTzQ9uxcrUeBzFFDD2Be
 iDZLF3jXK4q60la/SGRvm6kqtaLB7lDBubR1Zsvbp0rpJBXgQhPZK9vm1
 HF2z5I1xpkXJVIxFY3cPn+QGP1OQer95juVoSSX583dJAtSKNiL58taud
 KHJdhePNaUJEGlf3j1OcnAom1CbZsT0Yf3rLuUZHUybehTacJKZzfctTg
 491AR46Fv+gSpq5xI/+0bVN/m3JV1tReXcd2okMklES9kmSLNLS+UZycX
 SiIj9JJjOXr1px3gmFTxBZWPq2lCn1aOJ6OjxBSBgFhU/IhW6FcVioh5x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6063718"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6063718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 15:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14369243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 15:34:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 15:34:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 15:34:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 15:34:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 15:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InwcPAvOtJ49Vmdj0QiVbxLgB5aSWp6+ciF+S9zZJdan4qeNLocu7Z7WHHmn4HNrTPJxI81qw0gArtWDFrNFplz+9rmwlj96ls4BZndcieO65Jj2tWgNONcEZ2th6Ap6Yfqsfd1lV4MTnY0nfpzNEJoisHBtDBWJjKquKWOTdKscj4GrktRHdSOE5Jb3kCz6nGJtk+A9/voTmjMtkUVg0yItiMkM/JtBVsx5cuoLOWelWpFRcvyQBTRySYgj4jQwo1wo7Ud+LGVzHg6IEEqssVWqAi9o+yWtLieTkNE14KOXVqH78pVk+TVqL9R7fGFWLcB9rTuA4YIZd7jUNiqrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE+JHZFEC6aaqMKCrHp+fIWaIKp2VyQ6rWt6/5qGecE=;
 b=nh8+CgDl4sY/nmXpuGsU7pNeng1E21D2uig16JJ5v9JfWWuAk0MmG+X/3SK6tUdTx+714LL/uNrOrI/Fu31Lk10MZk01qYsvgw47z6QneJUb6aZyvh1bYHo3Ayab6ZZ5CgqsKobiSAuRm7yVgdxlEBE/fiTBVdkEKcSfdI4n9dSL2DGUN489M/Ucy27MgTnD6c851ZINc4n5ezn9eB1DPRC/SeAYHFvS+gT/sZmg9hMY0G2Ftl7FuPLRmtT5jBG3L7v2HS1Y7bsNz8VXIxCzm3onJ0Qgf34GyHMi18mHf67AD2GaO8bBTSeDH8GiZr2sqsW83HtSfoxwHhf0IjLHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 22:34:16 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Wed, 20 Mar 2024
 22:34:16 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 4/8] drm/xe: Introduce a helper to get dpa from pfn
Thread-Topic: [PATCH 4/8] drm/xe: Introduce a helper to get dpa from pfn
Thread-Index: AQHaendB3rhhXWwJL0OKscFF80bD6rFBKdwAgAAOKxA=
Date: Wed, 20 Mar 2024 22:34:16 +0000
Message-ID: <SA1PR11MB6991E41B1B0A52FCC4075C9492332@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240320034425.1785007-1-oak.zeng@intel.com>
 <20240320034425.1785007-5-oak.zeng@intel.com>
 <4f386d5a-1bcf-4489-b82f-17b2c0673b7a@intel.com>
In-Reply-To: <4f386d5a-1bcf-4489-b82f-17b2c0673b7a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MN6PR11MB8104:EE_
x-ms-office365-filtering-correlation-id: 24052a9c-9a3b-478b-fccb-08dc492de07f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ezcF1vtknbE2rsl5AiRcCNShNj0Py13elOlEmx0wKkz2DhV+AJpddgMK1IAEOC1/etd20gXs52Mq4reBgsMSeVXqWGwSiikQa40VbIt2eIKzLiGaboUhQ2wNwahsKIdIOG0RHJwirU/meNSQ6358/3Fj2mgYMZfDZwAwnsXZB0hv/mZw9PEAf1dzkA66H0CHgDlRUW4lUPJea9q5+d73b1rRpj3kaxuHQv6IS301aSN+6ZQ+0W4O5wzWKZcRurgO7oZKN9i5T5zZDakJEWtjy67mhT8p0y2Jv86KD5Vlv1z0P4Zt/adpgGDcI0CPyj5HemLSixsd8X297eEDCBwqFP8DTXDSr3tHp1av82jrjybYWTUx3wzjxpDAnS6LguLreY2kOhtfZWmqomPH0Xf3IseHCSUOPqwD6tfJi4j1BVcE7sASUBBmyCC2VI21bvYHdW6dj4IQYKhkqrfAqkQiRgw5BJCik5G1raJLASmIcTGJD/l4fexfHZnk8qGtr1srvXADakG3ciOxjtHtw6MJorJDI4bvDTGaEjRaUWA+VXxj0nhWKECh7B65pkxpjkvosjtNNMR4GsVWaZdGYKav6iTyJgNn0bwBOZdq/a1N8yIrT90Mi4yiEfhm6Ad5JeQlvps4C9pQuEj3B1cJKRw01Is68JskwBGw5GVj91YjpsjOBy4BaDKL9JDtkk3lwQq76Sb89lf1p2Rb7rHT11T7A1N9E98b9kp3cHzt0CcYSHY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1lHa1V3NkJ6UnFIN3JjSWU5aXhnVlZXMEhhUklWZTc5bytkTnd1QWtlS0w3?=
 =?utf-8?B?UjZnbjJiMWQ1WUZCbjM2WnE3UW1NOWcxNWgxOXAxZElRZm1Sa3ByZnc4amo5?=
 =?utf-8?B?Q1ZrV3RyLzdUckozL1dnTDJBdXJpQ1g4elhFbHNWUDJ1WmkyMVVVYkF6UU5G?=
 =?utf-8?B?bG1CK21XYjNnL2g3a0Z2WWZqbmwrYkJMTkNNd1B6Ty9VMEN3T1ZxbGQxc1NR?=
 =?utf-8?B?ZVNnNHgwbnEzS0NNa213RW1sVW4yVGJLSlRMdFFLeG0yYUVTWGR3elBrcG1h?=
 =?utf-8?B?QzB1QkRrOFlESGRERnRQbjRlWW0zMEFGcEtwT1ZTUDV6REUxWWswanMxMDNN?=
 =?utf-8?B?d1dSL25lU25LUUpneGJIVkJydGNsOWx2a1RtU053bGlXMGFIaUZXNGdxRFB1?=
 =?utf-8?B?Y05ldW8xTWErOTNKUkR5T0o2MTdqbnJvYVBUQzg1QzAzS3MvSFo3VW1KVHJu?=
 =?utf-8?B?M0NsSlZlV0hkSEJkeWx4UnBCREQzZm9YZzFOSkRLZk93YWpURmlCZGMvanR1?=
 =?utf-8?B?Mi9ZZjgxRmluT08xd1pWbmVuMHFGMEJhRTZQbTNwTWtVZ3BySE9Za0w2Y3BR?=
 =?utf-8?B?d3ovdEVFeEtubXVXc2I4M1BwYzBLSUlJUjJZcDB3RjUydHFPU1QwdVViZGty?=
 =?utf-8?B?T3pwcHZKMGJUbUhFY3ZCb2RDUDU5Nk9xcWp1N0U3V3lFcUhXK0hCdnNSdXdU?=
 =?utf-8?B?V3J2dW1oWXRJN2FqMkh4ckZ0R0RvTWtyK2pCN3FsajB2Ym91TmdLNGd6b3pp?=
 =?utf-8?B?dXVSNXZtdCsvZGVCTFZBc2p6d1hzTTIzWkxkSDZIWFd1K05vRkJCOVpKNk02?=
 =?utf-8?B?Y2hyKzZpNDBDandVN1ZKUDkyOG5vVHlTak11QWx3N0V3N0RaYko5RFlTK0Ix?=
 =?utf-8?B?Tm8wRHlmQmFjMWR1cEtnbTBHbFBtL3FueGVGVUx5OVBJblZ4VEhLNWVZeGtr?=
 =?utf-8?B?RE1lM1pLaW5SSnByZG5hYU00endrRW9sdDRhSndXNTlzWDhVcS9PMkY1dWdG?=
 =?utf-8?B?bzFJWXZLTXZzZmhVeW91eVZOMWFQM0NCQXByTExJYXNERTVnTlJLL2ZmdnRO?=
 =?utf-8?B?dTlQZ0FLOEw3MmhtaTVaaUlRYVltdTUrUEdxbzJ1cFlKUS9nbGFiY3NhSERN?=
 =?utf-8?B?TFV1ZXhIRjBSQS9MZlpPQng5dFhkQlFEb0dsbnhyQnhTRG5ucnlCcUc2SUUx?=
 =?utf-8?B?MXNsdmJrS1VreHFGYklybGJ0MUd5WGtKcGFyOVdFYVA4WUFLYWdJTk9VOVNh?=
 =?utf-8?B?eVFUNWYwOWRMVGMra0xEYzJ0OU1tbC9wd1pnVkI1YjlyZTNkcGI2dC9sMVFx?=
 =?utf-8?B?MjRrb0puY1BGeDlEZ20xWWFWZVBTcWJqUTdzYnNGNFZ3NTh2UEVoUFY5M3NL?=
 =?utf-8?B?OVZtcEYxUmk1M1Z6d1ZLWXUwQkRhaHozMGtNTXk5V1ExdUYyR0x4NWVlRzZ3?=
 =?utf-8?B?ZWEwNGtqdkN5M2poQi8xVTFWdFF0bS9zRHg4VERNNkdUdk1nMlVsWHNkSC9G?=
 =?utf-8?B?TjRGVjNHTy80OGFaN214a2dXcTJKTk0wUGtudVF2SVhDVElPVGZoTEU4QmFk?=
 =?utf-8?B?aGdYZEg2dHJOeEZnOG1GTkVYSGtyUWNaK1oxMkh5V2VKSU1tZ0hEVk9FQzVI?=
 =?utf-8?B?MzJQSjFRVWtBL2RwZE01ZDh0TExvdTlQSlQ5ZkpmU2NiZWFuV3ZjTS9uUnZH?=
 =?utf-8?B?amtCd2xBMWxSNFJhaVVFN2duK3VDeGd0QkFVTUhtZGR6SHBuU0RpSlpKb1VN?=
 =?utf-8?B?NHRPeER3VWlJUmhtcUM4bzhIYUpMTFF6L1QydVhvMHZhUW9PNzg3bWdHQ3Jh?=
 =?utf-8?B?cm9MK0pGZ2RtaTBmSlZadHVXYlNaQ3NHcGxwZnpjZS9wZEZOSnkxZFBXZGJW?=
 =?utf-8?B?TXk3NFA3TkRyU0thZHhWMEY1YnpPKzZRcmlvNU1KWjZWQ0h3TWZOMkxROWp4?=
 =?utf-8?B?YlY2c3paYzNPbXJ5TGFSSm9od2VnZmU1QkNMYmNENzR3Q0wyWHRiVDFORC84?=
 =?utf-8?B?K2FySnFDVUtmZzFZdnhKK1Y4WWIyQ1BaWlJMYng3MitFZGcvWGVyOThGUXdD?=
 =?utf-8?B?SzRiK2MvSXhPdWhtYzNKNXhLUmFBSEMxZ21aeTJBeW40Y3JWYnJLR1RjZU9D?=
 =?utf-8?Q?5jos=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24052a9c-9a3b-478b-fccb-08dc492de07f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 22:34:16.8520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtOod0N2nQJxDnVGmYTvH5ZFlqXSSMF6DADpQNs+1bm3TPInqv0WuHTgQWwMQ1mITqoNAqc9gBOAAh8Wvp+gHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
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

SGkgQnJpYW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VsdHks
IEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2gg
MjAsIDIwMjQgNTo0MiBQTQ0KPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+OyBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEhlbGxzdHJvbSwgVGhvbWFzIDx0
aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJy
b3N0QGludGVsLmNvbT47IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQNCj4gPGhpbWFsLnByYXNhZC5n
aGltaXJheUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC84XSBkcm0veGU6IElu
dHJvZHVjZSBhIGhlbHBlciB0byBnZXQgZHBhIGZyb20gcGZuDQo+IA0KPiANCj4gDQo+IE9uIDMv
MTkvMjAyNCA4OjQ0IFBNLCBPYWsgWmVuZyB3cm90ZToNCj4gPiBTaW5jZSB3ZSBub3cgY3JlYXRl
IHN0cnVjdCBwYWdlIGJhY2tpbmcgZm9yIGVhY2ggdnJhbSBwYWdlLA0KPiA+IGVhY2ggdnJhbSBw
YWdlIG5vdyBhbHNvIGhhcyBhIHBmbiwganVzdCBsaWtlIHN5c3RlbSBtZW1vcnkuDQo+ID4gVGhp
cyBhbGxvdyB1cyB0byBjYWxjdWF0ZSBkZXZpY2UgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIHBmbi4N
Cj4gPg0KPiA+IHYxOiBtb3ZlIHRoZSBmdW5jdGlvbiB0byB4ZV9zdm0uaCAoTWF0dCkNCj4gPiAg
ICAgIHMvdnJhbV9wZm5fdG9fZHBhL3hlX21lbV9yZWdpb25fcGZuX3RvX2RwYSAoTWF0dCkNCj4g
PiAgICAgIGFkZCBrZXJuZWwgZG9jdW1lbnQgZm9yIHRoZSBoZWxwZXIgKFRob21hcykNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3ZtLmggfCAyNyArKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
dm0uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uaA0KPiA+IGluZGV4IGU5NDQ5NzFjZmM2
ZC4uOGEzNDQyOWViNjc0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
dm0uaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uaA0KPiA+IEBAIC02LDgg
KzYsMzEgQEANCj4gPiAgICNpZm5kZWYgX19YRV9TVk1fSA0KPiA+ICAgI2RlZmluZSBfX1hFX1NW
TV9IDQo+ID4NCj4gPiAtc3RydWN0IHhlX3RpbGU7DQo+ID4gLXN0cnVjdCB4ZV9tZW1fcmVnaW9u
Ow0KPiA+ICsjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9k
ZXZpY2UuaCINCj4gPiArI2luY2x1ZGUgInhlX2Fzc2VydC5oIg0KPiA+ICsNCj4gPiArLyoqDQo+
ID4gKyAqIHhlX21lbV9yZWdpb25fcGZuX3RvX2RwYSgpIC0gQ2FsY3VsYXRlIHBhZ2UncyBkcGEg
ZnJvbSBwZm4NCj4gPiArICoNCj4gPiArICogQG1yOiBUaGUgbWVtb3J5IHJlZ2lvbiB0aGF0IHBh
Z2UgcmVzaWRlcyBpbg0KPiA+ICsgKiBAcGZuOiBwYWdlIGZyYW1lIG51bWJlciBvZiB0aGUgcGFn
ZQ0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zOiB0aGUgZGV2aWNlIHBoeXNpY2FsIGFkZHJlc3Mg
b2YgdGhlIHBhZ2UNCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbmxpbmUgdTY0IHhlX21lbV9yZWdp
b25fcGZuX3RvX2RwYShzdHJ1Y3QgeGVfbWVtX3JlZ2lvbiAqbXIsDQo+IHU2NCBwZm4pDQo+ID4g
K3sNCj4gPiArCXU2NCBkcGE7DQo+ID4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IHhlX21lbV9y
ZWdpb25fdG9fdGlsZShtcik7DQo+IA0KPiBJIGJlbGlldmUgeW91IGFyZSBkcm9wcGluZyB0aGlz
IHBhdGNoIGZvciBub3csIGJ1dCB3YW50ZWQgdG8gY29tbWVudC4NCj4gDQo+IElzIGFib3ZlIHRo
ZSBvbmx5IHVzYWdlIG9mIHhlX21lbV9yZWdpb25fdG9fdGlsZSgpID8NCj4gDQo+IEFzIG1lbnRp
b25lZCBpbiBlYXJsaWVyIHJldmlldywgaXQncyBiZXR0ZXIgdG8gYXZvaWQgdGhlIHRpZ2h0DQo+
IGFzc29jaWF0aW9uIHdpdGggeGVfbWVtX3JlZ2lvbiBhbmQgdGlsZS4gIFN1Y2ggYXMgZm9yIHRo
ZSBVTUEgd2UgdGFsa2VkDQo+IGJlZm9yZSwgaXQncyBuaWNlIHRvIGhhdmUgZmxleGliaWxpdHkg
Zm9yIHhlX21lbV9yZWdpb24gdG8gYmUgYXNzb2NpYXRlZA0KPiB3aXRoIG11bHRpcGxlIHRpbGVz
LiAgQnV0IEkgZ3Vlc3MgdGhpcyBpcyBhbGwgZnV0dXJlL3BlbmRpbmcsIHNvIGNhbg0KPiBsZWF2
ZSB0byBzb2x2ZSBpbiBmdXR1cmUgaWYgeW91IHByZWZlci4NCj4gDQo+IE5vdCBzdXJlIHlvdSBo
YXZlIG90aGVyIHVzYWdlIG9mIHhlX21lbV9yZWdpb25fdG9fdGlsZSgpLiAgQnV0IGhlcmUsDQo+
IGxvb2tzIG9ubHkgdXNlZCBmb3IgZ2V0dGluZyB0aWxlLT54ZSBwb2ludGVyLg0KPiBDYW4gY2Fs
bGVyIG9mIHhlX21lbV9yZWdpb25fcGZuX3RvX2RwYSgpIGp1c3QgcGFzcyBpbiB0aGUgeGUgZGV2
aWNlIHBvaW50ZXI/DQoNClllcywgaW4gdGhpcyBjYXNlIHdlIGNhbiBwYXNzIGluIHRoZSB4ZSBw
b2ludGVyLiBJdCBpcyBhIGdvb2QgaWRlYS4NCg0KSSBhZ3JlZSB3aGF0IHlvdSBzYWlkIGFib3Zl
LiBDb3VwbGUgcmVnaW9uIHdpdGggdGlsZSBpcyBhIGJhZCBpZGVhLiBJIHdpbGwgY29uc2lkZXIg
dGhpcyBwZXJzcGVjdGl2ZSBpbiB0aGUgY29taW5nIHNlcmllcy4NCg0KT2FrDQo+IA0KPiAtQnJp
YW4NCj4gDQo+IA0KPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSB0aWxlX3RvX3hlKHRpbGUp
Ow0KPiA+ICsJdTY0IG9mZnNldDsNCj4gPiArDQo+ID4gKwl4ZV9hc3NlcnQoeGUsIChwZm4gPDwg
UEFHRV9TSElGVCkgPj0gbXItPmhwYV9iYXNlKTsNCj4gPiArCW9mZnNldCA9IChwZm4gPDwgUEFH
RV9TSElGVCkgLSBtci0+aHBhX2Jhc2U7DQo+ID4gKwlkcGEgPSBtci0+ZHBhX2Jhc2UgKyBvZmZz
ZXQ7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGRwYTsNCj4gPiArfQ0KPiA+DQo+ID4gICBpbnQgeGVf
ZGV2bV9hZGQoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV9tZW1fcmVnaW9uICptcik7
DQo+ID4gICB2b2lkIHhlX2Rldm1fcmVtb3ZlKHN0cnVjdCB4ZV90aWxlICp0aWxlLCBzdHJ1Y3Qg
eGVfbWVtX3JlZ2lvbiAqbXIpOw0K
