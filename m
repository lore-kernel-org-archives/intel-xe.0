Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD1CC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2C010E103;
	Fri, 10 Nov 2023 15:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9413510E10B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699631526; x=1731167526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M04FFgNK3EiTF3R642NzaarasbPBoMHlLVGLqNt6qck=;
 b=PfYAgri8t8ixq8pimI68U5n5yvO1Rfyvr1kw2IooWFv8HVzMsYUbgF1y
 yts+/l6/1uV560qVfCuNHRbdQYDXhu3N9FemhXvC8LoqIVW/PQbqujl25
 oczuX6gtjGfgt6tGvGg/D+OL/0xUypcm+EDAd0mbkegEKieoSPS/24WZb
 t1EeoWObC2+TjG3nnKjZ2usoO6FoTbDG244w5KNa6YRISjkjuKo4Nein4
 o4jDBrA33JuQUrXiMaiGL0zTMYLaIbg5YXrbj1S0CQqaHKwn/pcnbASmI
 IjGLX73f0sIQFhrQqF0FCz73UtKakBeOvnr3J2GDQrXqxmfFVe/rMDMeO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476422970"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="476422970"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="5081614"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 07:52:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:52:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:52:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 07:52:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 07:52:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1BrvN+CNRCWV+ycOjJbk/S3A/pq7IIw5Buxe120N3pxIV/ELc8fFmHI7auelCiPBRw9GtAIhROYi0GH70qA7IVn1gb541NgA1iK7gO2wdz6lggfeG7d6fcjNX1pALofqSFslpILxhBWpq57jJ6Q/EwdNMZZR7cEWz+K/k5Nd8xV3yg2mmx/IeIL436Gy8AzsTvDVyceRA/CksTnQQmmGshOkmY+cYxyxN/Sp9tQg6gtqAwqk1OcfXhq9nwX+w3SUfFoVxGFTD92inQYfG4WaSvx4lAmprURZvMCno5PdzvEORuLweybjRVq1aUY4D/pIf8UPfI4+Xy/tdXvXIdotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M04FFgNK3EiTF3R642NzaarasbPBoMHlLVGLqNt6qck=;
 b=aV+NYupbkzensd9vGVuGw+hePpCfR8CG+q/5NDPP/Ke6XXbhAT7yEvcZ7ET8AVJ072khgd5ux7r4zb6ryEBJiGSitaNBt98xn16x4vqs2zBLUUITyNjFtSLPBO0OooLDWXlCJUALtB9TZePmWO0iAEfrerY/Tj09LpBFjmQl/aXwoBk/ZcAjAh5Rly0l/FEmI4OaOfReGFlQZMTRYdTXAGG6j/u+PUtrsR1Kpc9eq/pkL0xJACxBlBjOEOovuL0t22vb2zhgsOjDi9HH4Urdj1pkuf+S9BartN7I2OJ94hYzM2AgY/+sJ7FgSaQaxEx1sMT9uZjv9M5XR8nMU0ZG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 15:51:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.020; Fri, 10 Nov 2023
 15:51:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 2/7] drm/xe/uapi: Remove GT_TYPE_REMOTE
Thread-Index: AQHaE+x9gmvWq2r3YEazcMWxLe2Eo7Bzs9AA
Date: Fri, 10 Nov 2023 15:51:58 +0000
Message-ID: <969de5d4354a1defa6ae7d2efc3508bfd3f1955b.camel@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
 <20231110154156.6-3-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-3-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA3PR11MB7526:EE_
x-ms-office365-filtering-correlation-id: 9923c07e-7ff1-4ffc-52b9-08dbe204f8d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Es/5FCmV6morWO2YrAecbZdxauhVk2D7+3HSMU+r1orhYElNng8fOQ1zh5djdpiJvIRvKLcsWMm0YeiLzUHxzSw93cRjTVUNFLg2wLO6+OHISsvuGk10VBGR2eCUmOp/4bQdbRLNJfXEz+/IOW7lrl95QLpw3LLQPJBs2B89kXckT4e+X56UGdRp1PIomGXzYChzRI/g4q2Mra56P/cg5RT3RiEu8ocHZL2aOGBsCbEbhzuC6bF3bRTKNYBHc4FdbCk3nCeC/BV286VRhMEX2VFLkocIfKUhINfJaPgQKNgBOwf8MWg9jK6DHizZcusVYRvFWsKfvkOs7QPXFSpU43Gw/p86ckWghtuDDVLNvJLgaQcn2WUS3JXAGj8vv+/61ZNz5745k1qYqFPzdItKkKiHsYPXltP11r7Zq9JI3+N+8Jk6VrtPMPYVQdVwletYKd0a7Az/YbA79D47p2lauyyzd0+z0YCvsulYbQXKPkXBvlwXSMZnWxV4BWCM8eZymknPdPBRqMU7BtqYxtV+PJ2JdS0BDWAzqJ9CTBwoNMxKVaS6YdLLKnBs54Yv45yAo9TrcQ5rBL4RdjW2BWlYMaGEaK1An432KQeDaScr/TE/zSEoyWRVIsrpseps5YyR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(346002)(376002)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6486002)(71200400001)(2616005)(6506007)(478600001)(6512007)(2906002)(107886003)(26005)(41300700001)(66946007)(66446008)(76116006)(64756008)(5660300002)(66476007)(83380400001)(66556008)(38070700009)(54906003)(6636002)(316002)(8936002)(4326008)(8676002)(110136005)(91956017)(38100700002)(36756003)(86362001)(82960400001)(122000001)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejNqTm9vSFRTTE04QXlCNXZnUTRuNVQyTzlVckY5NnJST2JCVjlFVVFOeEVE?=
 =?utf-8?B?aCtTUE1ENmRlcGhiaG9vQ1hVSTRqUml3VVFGMEx6eGZoRXNQOFE5bW1xQVJx?=
 =?utf-8?B?bExGcU50Q3JSQWhKT1VYMmJkeWRJOE00VjNyenQydWkwM2k0WFVZSGkraUVS?=
 =?utf-8?B?aWdaUmVZdnJrT0dVUllpamYxTnN0NVVKdmxGNmkzcEs4NDlVT0g0S0dyZUQ1?=
 =?utf-8?B?SDhtTlIrWVEvUUwrdGZubDNnTzhCOUlINk9nZDZkckFSeWUwcnhQV1NYbmxy?=
 =?utf-8?B?WjJ5aGRLamhremJ6ZnFKL3BKQ1ZGS1FuTlVOcnpFZ2YzbHhJN2pob2xOb09B?=
 =?utf-8?B?cVNaWm51UGd0RmtacGQxL0pRL2p1YmlqbmRlcncvclNCMUY4djVRK2hSTkJY?=
 =?utf-8?B?S1NWOFJicms0R2F0MXVDWnROeG84VkZ6Mkp2cm9UUkdhbFR5V3djaTdFczVH?=
 =?utf-8?B?S0wzL2VJOFR5djBDQzhtWXVwODR1djA5QlZ2ZzZaUHdYaFV0Q3VtQkZOWFZs?=
 =?utf-8?B?eEI0QmFqM0lGbC9mY2M0aFNnNXFzZjJWa3JrVmRuejRVVjRTd0I2dHZwdjBn?=
 =?utf-8?B?cFh4MENRQnlxVWFHRitnUTlpRVpmR0tPNHNLcWVUeXd1enhxSWtKa3pjaDNQ?=
 =?utf-8?B?ZC9Pam1vVk55akNkRUN6RkFQR2w1dGFHQ216N2ovVmR2VDR1K2JGTGtOZUxs?=
 =?utf-8?B?TzJSQ09IYnJtS3VpZjhVOU1kMmxLN0JFYTlTYlpBOXh1Y29wSVNYQWt2QUdP?=
 =?utf-8?B?SW9hRXNzZktrbHM1YUlVZEhieWY4TU9VTXlBL1JnRnU0L0taUElWOC96ZFVo?=
 =?utf-8?B?SWVTa1drck5Rb1Azdk95OHc2UGdNM3YyRTIwWkt5c2ZtQVNsa29rOVAxbjhF?=
 =?utf-8?B?ZG9kVUc4QU9KK1JsaVBkWDV1elB0b0JYZUhzTW9UajFQZ2FNMkVOQS9seGMy?=
 =?utf-8?B?Ynh2UHk1eFQ4bGlTUThEOHAvemNkTEJMSXkyNUxGOW9XWHAybVN1Q2pOSUl4?=
 =?utf-8?B?bDV3TGl3ZGFQVEZvbkdNTDg3K0tGSStSZEw0YWp2UVI2bGpHVHg0ekFYK1Vi?=
 =?utf-8?B?aWlDZVFrcEdtUHJXWHUyM2VXb2F0cFh3YmViY0JsK2FsNGNXZGlaM0Q3WDZM?=
 =?utf-8?B?UnNITDVhdm9oN3g2UFZMcUd5TzJBancxSFMva0R2Z29YVitWY28vLzBPL1Bl?=
 =?utf-8?B?NXUrcWpmMW5WMjZ3S0dMdGs1NDFBeEdHWmE1MkM3U2wyTG82T0pkUUlZV3M3?=
 =?utf-8?B?ZzFvYytzMzYzZkJuUFRYaGRvOTlERytjZlBKTkhESWFTU3dGWi9NK29Qb2M0?=
 =?utf-8?B?bkgvRG1SQTZETFJQcCtwOTV0dHRBZTZCWjBYeENvc0lLZkFlVmxvYjJ1VEFO?=
 =?utf-8?B?M1ljeFMwY3krQ3F3aWFjSFM4M3FlamJWaFV6TlNNNEFLeW42dWoxNThFcGx0?=
 =?utf-8?B?TnpEYzN1cWc4QkFkVnB5TTBjOWpOQk1uWGlESytFZEVYNkloMHpUNGNJYXV0?=
 =?utf-8?B?L2VrcUZ5cG1JNVJkeW5DaXRMaW1iQnBmSzlWZzdRWk1ib1MwcGIvOUNjeS92?=
 =?utf-8?B?OURnWmZrYUVOQzEwSFZWTXBKV1RUNnltYm5MT3hLelZpaUFlZUZMUHAzayt1?=
 =?utf-8?B?dy9aR3pYbmo3Q04rMk0vRVZSRFFqajBsc29kcDhFd1IwUUFzOFFsK1cvSDE1?=
 =?utf-8?B?dEd4KzluUWtvYjc3emFLMG4yNEI1TEM0ZGJ4YnhjSlhIQnA5a1RJNVY5My9m?=
 =?utf-8?B?Z1FjS25rNkUveHdMRCtYK1lLTStQRXdPT3RvalNncmxrclh1MUhzSDZwZlFM?=
 =?utf-8?B?QXlXTldQeEJoeTRZMHN4RUV2NlJRK0pkMXVieW1oNk94cGVWVlpycmFjMEhk?=
 =?utf-8?B?dk10SkZhTjFldEdnWWk0UjJzeFVNMG91NmU0Uzd3aHV0ZlVRNkh6TUdxZk1a?=
 =?utf-8?B?aTl6cllFZ0pLZjhUb1NEYTNlWk1aeGF3OENTMER1RW9McmFOMXBjaC90TUxo?=
 =?utf-8?B?MFFFc2dzRWZYT2lrcGFUUkNqMVZ1L2dDUmU4aTJwUFVDZnFwclp5RFdpUk1P?=
 =?utf-8?B?K2JYSUl1STFYZ0dzbHRTOER0bHZBUGJnRkhtUkVubVdYN1FUVUIzNm5ML2dr?=
 =?utf-8?B?OGwxR2lscmIzeG5EdVRpZU9FZmtBT3c5NExnZHI4bVBtY0NramZiejdaNkpz?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61835B79769A9C46BE726A09D6D9AAB3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9923c07e-7ff1-4ffc-52b9-08dbe204f8d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 15:51:58.5357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2t1FL283sdTkWpmIyMdQmuk5PjpV/9sXaGNyBNGDxTyjO/1X9+fK29mmDtU88E0sOvU5leOsiAxTftOsaLBZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 2/7] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
Cc: "Zhang, Carl" <carl.zhang@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTExLTEwIGF0IDE1OjQxICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IFdp
dGggdGhlIHNwbGl0IGJldHdlZW4gdGlsZSBhbmQgZ3QsIHRoaXMgaXMgY3VycmVudGx5IHVudXNl
ZC4NCj4gQWxzbyBpdCBpcyBicmluZ2luZyBjb25mdXNpb24gYmVjYXVzZSBtYWluIHZzIHJlbW90
ZSB3b3VsZCBiZQ0KPiBtb3JlIGEgY29uY2VwdCBvZiB0aGUgdGlsZSBpdHNlbGYgYW5kIG5vdCBh
Ym91dCBHVC4NCj4gDQo+IFNvLCB0aGUgTUFJTiBvbmUgaXMgdGhlIHRyYWRpdGlvbmFsIEdUIHVz
ZWQgZm9yIGV2ZXJ5IG9wZXJhdGlvbg0KPiBpbiBvbGRlciBwbGF0Zm9ybXMsIGFuZCBmb3IgcmVu
ZGVyL2dyYXBoaWNzIGFuZCBjb21wdXRlIG9uIHBsYXRmb3Jtcw0KPiB0aGF0IGNvbnRhaW5zIHRo
ZSBzdGFuZC1hbG9uZSBNZWRpYSBHVC4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUg
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBDYzogTWF0dCBSb3BlciA8bWF0
dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMu
ZHVnYXN0QGludGVsLmNvbT4NCj4gQ2M6IENhcmwgWmhhbmcgPGNhcmwuemhhbmdAaW50ZWwuY29t
Pg0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMiAtLQ0KPiAgaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCA1ICsrLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
DQo+IGluZGV4IDZiMWNkNWM2OGE5OS4uNDNiYzYwOTQ4NTVjIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYw0KPiBAQCAtMzczLDggKzM3Myw2IEBAIHN0YXRpYyBpbnQgcXVlcnlfZ3RfbGlzdChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5DQo+
ICAJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgew0KPiAgCQlpZiAoeGVfZ3RfaXNfbWVkaWFfdHlw
ZShndCkpDQo+ICAJCQlndF9saXN0LT5ndF9saXN0W2lkXS50eXBlID0gWEVfUVVFUllfR1RfVFlQ
RV9NRURJQTsNCj4gLQkJZWxzZSBpZiAoZ3RfdG9fdGlsZShndCktPmlkID4gMCkNCj4gLQkJCWd0
X2xpc3QtPmd0X2xpc3RbaWRdLnR5cGUgPSBYRV9RVUVSWV9HVF9UWVBFX1JFTU9URTsNCj4gIAkJ
ZWxzZQ0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlwZSA9IFhFX1FVRVJZX0dUX1RZUEVf
TUFJTjsNCj4gIAkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uZ3RfaWQgPSBndC0+aW5mby5pZDsNCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oDQo+IGluZGV4IGI5YTY4ZjhiNjlmMy4uODE1NGNlY2Y2ZjBkIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gQEAgLTM0Myw5ICszNDMsOCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2NvbmZp
ZyB7DQo+ICAgKi8NCj4gIHN0cnVjdCBkcm1feGVfcXVlcnlfZ3Qgew0KPiAgI2RlZmluZSBYRV9R
VUVSWV9HVF9UWVBFX01BSU4JCTANCj4gLSNkZWZpbmUgWEVfUVVFUllfR1RfVFlQRV9SRU1PVEUJ
CTENCj4gLSNkZWZpbmUgWEVfUVVFUllfR1RfVFlQRV9NRURJQQkJMg0KPiAtCS8qKiBAdHlwZTog
R1QgdHlwZTogTWFpbiwgUmVtb3RlLCBvciBNZWRpYSAqLw0KPiArI2RlZmluZSBYRV9RVUVSWV9H
VF9UWVBFX01FRElBCQkxDQo+ICsJLyoqIEB0eXBlOiBHVCB0eXBlOiBNYWluIG9yIE1lZGlhICov
DQo+ICAJX191MTYgdHlwZTsNCj4gIAkvKiogQGd0X2lkOiBVbmlxdWUgSUQgb2YgdGhpcyBHVCB3
aXRoaW4gdGhlIFBDSSBEZXZpY2UgKi8NCj4gIAlfX3UxNiBndF9pZDsNCg0K
