Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E865FE7071D
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B844010E5C7;
	Thu, 21 Sep 2023 11:16:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098EF10E5C6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695294963; x=1726830963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9gEGNDkokq1OqzwB1eElpCHIp45YXPCpIV5ZpgqLBlo=;
 b=JcIudX7M+yHP6TUN8AjcLuu56fiWHnV8jY/NUQvd7XTdV3pNdNAlh2Vf
 odlzgpe8wGy5QyJquBiCtZoJtfxK9ta3ERWSR1Y5fAqRc4G9hCZhfNiuE
 /zMDWCpv0OjvBNraNBrHRvFkNSAfG0ntl+qlMeKojRhK7soIB1VvyectS
 dE7CDVdxaJxKgu9KXxB0nIi+zd9txjeLJZ1XFwuo2KtgD/Hxkyp1f899X
 S8REtkU1F9CrLSpmmw3+H1xTRv+gWZOH9rCyd/ylDnxc/JzEmBYpOBjr5
 X5rQHueXVr9k8kNvFRXWLkQ+hErtvGqvDZw9PzMQPZOTLPiDEaiHGKCwI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370807238"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370807238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="890324775"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="890324775"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 04:15:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 04:16:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 04:16:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 04:16:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 04:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDVbqdcPOLJZW4moiNfyax+hjhsNK2VMWdE+y8PlA+zgSACrSbFH006CVPGgp3owpDsOChlZVgZBw1y4C4ubRG6eoQ/FUpbTHfqMWpaTDJdzmyYeD3zHHgFbjI3X0DUMThDWQh3k/4wcqL0J+x5ssyCldd0m1Q5dUdfK3jNPyTZApZUQ5uHx9vQB+GbGWIWpos8TosvHt9sA5a7aArT2ILKuMCv4o9ft2YF/3o/h9Pjwk25Xyqd8US+xlSrWlxvPqX0S7I6jea7pjzTBW2ocU8W50LvaCLKxRIWjS/xs1QfdF2v04zBYyP9kBVdDn0b5sF0Zo0MNbvSHk1HY9KA1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gEGNDkokq1OqzwB1eElpCHIp45YXPCpIV5ZpgqLBlo=;
 b=PbMiGa4y7vOIAq2L6GNhI0GrU1hTsIs8y8yGtV8GHmlY7aJc28kbzHVwiisq6Fmq94JF4c3PWExigckCc2qDTjqmsrdZjD91lXrAS0QDlAlOlHgrbG/tqsXX0DO9eqGIGQspWZslWHoIyFmYTBwX02XpyOh5HzI+nLXjCWh5qaL71mU9f27weNagBIJ6t80+2IfPmRws/eYe+ttKKTIRfqnqDMVq0D9H3PlSQiNlUbnGm1xNU3cOLoQzy8hiNSnN9rl8LUhNSNpiJAjzq49eFZkwDesPY3GVeALGuVjMmLpT6grtKzQU9WU/zT3RpWsmI2RiMCAud/UUrQK2ahok0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 21 Sep 2023 11:15:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 11:15:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
Thread-Index: AQHZ6f4ABK7jSVjBQUyNmbMQNTDME7AkJtaAgAD/JgA=
Date: Thu, 21 Sep 2023 11:15:57 +0000
Message-ID: <eb2756db37418d43d336071305e15a7655c073f4.camel@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
 <20230918070100.1387082-4-jouni.hogander@intel.com>
 <ZQtP4YvzBrK5osx/@intel.com>
In-Reply-To: <ZQtP4YvzBrK5osx/@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA1PR11MB8575:EE_
x-ms-office365-filtering-correlation-id: 00894bc2-499d-4904-7f82-08dbba9420c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KLtYWTS8mL1W24cItOoFRL6hGiw2RJnN/QKwgq1r8DcGlCp5j2bmnJGyO7MDoja5L7HseTvCqNL5+47NwgobEaIpFWZ7t6LsfZbIem01ZBkwWfQWOfPLKHFrjXkMJro3XsbDMuGfTvEKRba0N8nIqO0L9fPsq/U9AOQhswvVZFISkJy+/V/hLEGs469d1dkuZCOVPFFU9ALtfUfUKdq8HQ0OEP4XXZv9QhwRcyvM9ghAWUUaVouHWpAd75nbqWoDDJCYQ3Aa9NF3cosREA+h0Ro+zcrxui8naLDnJjLeRTy1U9ETDI0yivvFmuVLmFbsY3TQfXRGF0J8xjShqFnLEAJefhHXovAFKpA1Xi3Li3+S20yg0d6fe2nu/HRogp+M7aJsS/mxXDG36Vb6WIe2AcpmT0X7gdDI0I9bJhN+4zldefMKC69DcRLsn++WDkiO3veT7lymeVaPOlkfOFCTtoL1xU4wqOTrlTT879H7JPaU9isDAed5N4Oat2ltqGGCJdv9ZQaaVenFRAxwWHNXFhCglCp/xwMo6zkXx7ZOhn7CIFGCtyp+CDiRyhbVGX6wXH/S6lg0crU77AARVjUInxxJ/JdQspiZ2QplyDK9VnEwlLMalxXksfxkcY7pvaWV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199024)(186009)(1800799009)(83380400001)(6506007)(6512007)(38070700005)(5660300002)(8676002)(4326008)(6862004)(36756003)(2906002)(41300700001)(37006003)(64756008)(8936002)(6636002)(316002)(478600001)(91956017)(66946007)(66574015)(122000001)(82960400001)(76116006)(2616005)(6486002)(86362001)(38100700002)(26005)(71200400001)(66556008)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K29FQ2Q1blY5WXkvQzRaMDAyN0hPOUpKL0RZMFRmdThkd2Q0OUNDb2VIQkhn?=
 =?utf-8?B?UmNpZmVOQVRNaVlXU2Y1c01kR01wUHVUUXFhVW83Y2pFRE1NTmZJa2NDV1Vr?=
 =?utf-8?B?a001VmNaV3J0Z1lKVXY3SmU3U1ZmVXJYelVrS0lzTVRveGJqbGxpZnprK0FV?=
 =?utf-8?B?UEJkYkIvbHJBSDRNN0hieXVrRTBFa0t2SkJpYjQreFdxUzhJZEFPckg2citr?=
 =?utf-8?B?Zklkb3l1VWJmRjRZNkUycWwrbU95TGpFUUhpUTFXdVV2d0dxYXNnL3J5cU41?=
 =?utf-8?B?M09xbVdtUkV2Qk01eTBBOEwycVp3eHZrejdzbmlTQkRBTXlJa3FPS3Z3MURa?=
 =?utf-8?B?S2tiUURSM0doU01FK0pGZ1ovaTg5RVExS0ZPZy9kS3V6R0J6UHJEdkdPaDJm?=
 =?utf-8?B?Q3dEWVJ6aXREcDlXUXFxQmIrb0V2OW9QUlZ0TWZ3MkxFU3FwV2xtQmc3djYv?=
 =?utf-8?B?cXJDMHNHSStxdEZlSitMQW9udHdrd2tzZndiNjNqRUZva1FEM29VeUtuWFFZ?=
 =?utf-8?B?dVRDVVY0L2VsU09RZlM4eVNPcXdDeTBPWWRVcmZ1VER2aVFWaWN6Q2FqcG14?=
 =?utf-8?B?VW1jOUVXaDFZd1MwYzZnVGdQdW82YzFlM1lkZ1gwZGlyT0RwYlFCTDBMU3Qx?=
 =?utf-8?B?N0NNZkdOM0crV09KbUVFQkFhb05LUG1tVStuZzY5TDJ2enF6UGhSd3pOcWZH?=
 =?utf-8?B?cmRVT2ZraWQ1N0s5WWdOWTN6aVAxaTUwQ29GYStVY2ZKQU85amQzTGJLSnZr?=
 =?utf-8?B?QXIwZEN3TmF6YXd0REwzK045OUJKOU0yck5GcTlMMGlJOG04OUNZV0pIU2RE?=
 =?utf-8?B?NHloV2NBMXhaU0hYNXBocWN1ZGJEOGVPRGdBdW5kVDRteEZhQ0MzN2Z5OW5B?=
 =?utf-8?B?RWZaU1Z3TENPL0paeEh0Sjk0c0k1NWYwYU9LOS9reUU2cTdvMzZaTWd0VG5J?=
 =?utf-8?B?YXNpd0Zob1VJcnJrTjg0bDhyY0xscEwwMnBjNFNJNVNuYXVxdXpIZDd2SHZU?=
 =?utf-8?B?aXVUTCtLMEtXSDBqUnZzYzZtTXBqdkoyVytyelFGZWxES1hTYTMwRmQvYTZw?=
 =?utf-8?B?a01lTzVZenZrL2tUVmpjemo5YjlGbGFQbjhaeWF3UFpZbC9uVm81MUlXTitF?=
 =?utf-8?B?VHN6RkdpV0lOOHBKSWVlUUl4RTQ3azJaU09pbWppOW9PYWppOGdrcXA3VVZi?=
 =?utf-8?B?NDRFVUFNUnZneWIxQXJKZXY3OC9UcGpoSXhMUDhUbGRQY1dQOFo2UTVKQnE0?=
 =?utf-8?B?ZGJNQ2tGU3I1S3RpSWZzUyttZVpkU1JtVEV6TDFiS1p6WENHTmFuTGYyK29r?=
 =?utf-8?B?WkVXM2I5S1BtNE1YUkFLNng2Z3VOcDZ6L0s3WTFkTEliZDBMK1hkWXI0MVR0?=
 =?utf-8?B?eC9XWHV4WWQ1YWtaaE5Ccksyclg5RXJHRnl4czBnQWt5YjByVlZ4NS8wZE9Z?=
 =?utf-8?B?bFNuT2dFdTJOY2c2QUQzSXFoUDE4M3pxWnN4ekhyT0ZUdnBKOERuUXBkcGhQ?=
 =?utf-8?B?NFJXa2o2M3ZvL2tIMElsWDhRL3hqbkJiVHgrUHlNZ3ppZVVOTG1BYUNMKzk0?=
 =?utf-8?B?MGttVDVJdlZUZnBZS1NoUEpRTjlKZkNPa0VxdnhGYjRBYUtUT1hUTVJtbjBl?=
 =?utf-8?B?YnpieFl4R0JsRERqN0txUzdyOEVyenEzSEh1d0hNOEpiWUE5eTNiUzRQeGd4?=
 =?utf-8?B?U2JRZzZGRlJIeCs4ellpUHQ5cjRWU0FHZ0dTaklwbHVBZzU0QktTZHpoVzVI?=
 =?utf-8?B?Z01uZ1BZWkUyUXZ4RVV5OWlVV1ZSdEZybnpkQlFOb1dJaStXNVY5NzdRR3Iy?=
 =?utf-8?B?ZzFSRTlYT3RvVFBWMFhtTXhyN20wZFNJaFpEdVZkcFpSSExtY2N2Q2VGT0ND?=
 =?utf-8?B?b1hWQ0VqY0kvSFl4dlJobWlod3I1ZEhKUXlORkVEWWRsVzRlOUppTUF0TG8y?=
 =?utf-8?B?bFBBaW1aeERaR1RPc3ZBNFR5dThCR0ZFMXQvcG5QSFRVVmxuL0dkV0piaXZZ?=
 =?utf-8?B?ekk4MC9jbjg3a2JSWHpjbXIxdzZFNGFHdnpaTndSYlVBdkN5OVZmQkNReWNC?=
 =?utf-8?B?RWt6ZXBYZ3laWUVTTGpodVNobWdXK2NNMlA1dWREQjBIRXJCYTdMb3hNUjBy?=
 =?utf-8?B?M2I5ekEvemxqMks4NFNIVjZWbDFYZmZoN2JMNW1tZExBb0hEeVFIWGpqMWNM?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <335572FFEBBB4D4DA7C35B0F6BE4FBB8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00894bc2-499d-4904-7f82-08dbba9420c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 11:15:57.0375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UALsECFh4KtjFxUf5BsUGpxa+hLBsWGGNk4Osa0cv5fYOTj/x9d8uoUTmzq+sEWz96i9c12JRNYh5hTMqjW3OcLw4+cdq7SVQSsYx4ZrtLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Introduce a new DRM
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTIwIGF0IDE2OjAyIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDEwOjAwOjU5QU0gKzAzMDAsIEpvdW5pIEjDtmdhbmRl
ciB3cm90ZToNCj4gPiBpbnRlbF9ydW50aW1lX3BtIGlzIG9rIGZvciBYZSBkcml2ZXIgYXMgd2Vs
bC4gRXNwZWNpYWxseSBhcyB0aGlzDQo+ID4gd2hvbGUgc3RydWN0IGlzIGhlcmUganVzdCB0byBr
aWxsIHNvbWUgYnVpbGQgcHJvYmxlbXMuDQo+IA0KPiBJJ20gbm90IHN1cmUgaWYgSSBsaWtlIHRo
aXMuIGdpdCBncmVwIGludGVsX3J1bnRpbWVfcG0gYW5kIHlvdSB3aWxsDQo+IHVuZGVyc3RhbmQu
DQo+IA0KPiBCdXQgYWxzbyB5b3UgbWFkZSBtZSB0aGluZyBub3cuLi4gd2Ugc2hvdWxkIHByb2Jh
Ymx5IHNpbXBseSByZW1vdmUNCj4gdGhpcyBsaW5lIGZyb20gdGhpcyBvcmlnaW5hbCBwYXRjaC4g
QW5kIHRoZW4gb25seSBpbnRyb2R1Y2UgYmFjaw0KPiBvbiB0aGUgZGlzcGxheSBwYXRjaC4NCj4g
DQo+IEFuZCBpbiBhbnl3YXkgSSdkIHByZWZlciBzb21lIGRlZmluZSBpbiB0aGUgY29tcGF0LWhl
YWRlcnMsDQo+IHJhdGhlciB0aGVuIGluIGhlcmUuDQoNClRoYW5rIHlvdSBSb2RyaWdvIGZvciBj
aGVja2luZyBteSBwYXRjaC4gUGxlYXNlIGNoZWNrIG5ldyB2ZXJzaW9uIEkNCmp1c3Qgc2VudC4N
Cg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgMiArLQ0KPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gaW5kZXggYTgyZjI4YzZhM2Ew
Li5hZTE4MDk3Y2Y4ZWEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oDQo+ID4gQEAgLTQwMiw3ICs0MDIsNyBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgdTMyIGVkcmFtX3NpemVfbWI7DQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDC
oMKgLyogVG8gc2h1dCB1cCBydW50aW1lIHBtIG1hY3Jvcy4uICovDQo+ID4gLcKgwqDCoMKgwqDC
oMKgc3RydWN0IHhlX3J1bnRpbWVfcG0ge30gcnVudGltZV9wbTsNCj4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgaW50ZWxfcnVudGltZV9wbSB7fSBydW50aW1lX3BtOw0KPiA+IMKgDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoC8qIEZvciBwY29kZSAqLw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
bXV0ZXggc2JfbG9jazsNCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg0K
