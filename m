Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A4C48297
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 03:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463BD10EACF;
	Wed,  7 Feb 2024 03:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noGK/4Qd";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 07 Feb 2024 03:23:34 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D515E10EACF
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 03:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707276215; x=1738812215;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HwE4RXZ6ES4ZVzy7Lvh0S6nILPiT9rBfF0SnOHkmz9s=;
 b=noGK/4Qd8uahiIi0GQtr1Lxu4Fuk58VgQ0P7k6gLrad2nFdd1waFUtiJ
 X0ZoE+D41PMtfyEpZPrLOohz6xbqn1mOvDUa5SP5p6qzqcbhCO7fd7M+e
 9Q6M6ZrhLfrGTb6cTry2KXP+v8JbJURFwlNFs4GLKmE++A4pqnravkALM
 mew1M2z14O3JKBvkEZJ2LLM0LxhlpZdAGI2l14FV9gUAaR7/6o3p0yQef
 kocSHRgYI7qnDIv5gdjvRwo8zWfq6pSFsHbTKE9gYEaijh04yqhXGDrCf
 ioR7h8ocOoo0IIlcVXjEn9hUkTQqj9MW3iVjpbSMyitCJG5KGBFBGDbCX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="807582"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="807582"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 19:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1483984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 19:16:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 19:16:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 19:16:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 19:16:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 19:16:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+tVxCj8Vxiq/PKUCuYZVv0ZsNCW5c+DD9QoohFSsNyQOjXFQIONx+0zfmcEMQ1dvJu8CFN7MaJN1znwqSpAkyqb2lswSA/QNrKb+3NMWm2mmMZ7e+3TXQ24mNOLJ8+kEWUGlSm4ONawPJLXfD3/0YGn8AU/cO5h02O8cvE4+gSdnkILw+anzzzNQFdiI7sFbDMpNirv2929VF4LySd99WwmRTxu7wUYerFrJUQQps0PJ3WLHSNoolIFfTp0PkX3LuHPYCj+cINnvd9OxlHvl9Nx4F9cnv1aNLKY3zXEhfcPCVnMsUN99czSwAP14zCiZl6eIdqgpM1r+lImq7GuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwE4RXZ6ES4ZVzy7Lvh0S6nILPiT9rBfF0SnOHkmz9s=;
 b=BP/SJawimvtwEJSenzrEC62JkoPCwbJDCHHgJRJk9TTJtcpjVG/xNZmPYxeglLwBU3MEyO6S0oT/xogcG08CpwcFpkoTfaCkFi0gnBRVOnNfQfWfW5GUsAmXE27GvO6KOJ5ybj/xayOr/Uyi8FTu+mfY23pSuKYy3GP2Lv9gMG2BPmYj0A/MYKrAH/wePfr6Q+fqHFXVocdcNr8BWzAPIZDiX0UsNutWOFoTm4LrTFxE+3TLfc2Yc6t3w/pL3WiUw6lEZhW4isNjvP55cevYvQacqhK04sWb6NL6GJ6gLzAAoaYeznoc1Y7aNmEgCsLc4LypBBJPxGuy8VCf+D0NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 03:16:22 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7228.029; Wed, 7 Feb 2024
 03:16:22 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Topic: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Index: AQHaWOuQZ56ALQqzrk2IXbnyxMyu+LD+NTcg
Date: Wed, 7 Feb 2024 03:16:22 +0000
Message-ID: <SA1PR11MB6991EF2BEA531839D4452A6492452@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240206105911.107720-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240206105911.107720-1-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW4PR11MB6935:EE_
x-ms-office365-filtering-correlation-id: daad0a24-08b2-4418-b820-08dc278b2902
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBcaaVGj5qzABnvMr+Hg6gvvtKR2teyvLNciqF1bHgoSyZerIhpwjJr20PgV7PYIVXSveIceS8u95JFVHSTUmwOifpnduPJqFNu8+DCAMop2rXC8WlTKGmLQII9dph1pZ2saIg/Tsf7w+ASvlIYikDOBlEOMiNdviVyTg3+pMwdcDEoqEYg3E0kISyrTXbgsKKVBrkrq168FdSHzYEDUWt1B0PYT1OXAY5Ut9aYDW6ERft2zcfQHX7eN872sPOSu+pyEabLXneOTu6aE1NT8urLnRY4d7wQoXeadhCcgPnpT8VLdzf+yT4X7H+qKRxSuKk8Rko2Wy6sATpkFhqeDgjHzCFgbpwAU1XOg1QrYLAlhineASId9zaGSdNBBtNcFzvxk8atVXjvgo/rIbglsysuaOdUkwSQE3szisC5qgdREoOaNzlPPArDjO5T+3eNMksPKWJ5iUaqsXBlbcVYLbzWA7XQ5RcCT8Ep9COn+yql5TJItB8QJOv774Onj/3w9udfTHzyr6a0Lcqn2kRV/NEUcLH+iFwSmTzQh8J4EqbGzF9ApTDM3UMr5xv2kxA/CGzO1ZA9ELeLvIKAriq4CXJ5UidpDDY8JHX2leGZ04SQdYpqbENSynGCa3uSUdoi8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38100700002)(82960400001)(33656002)(53546011)(6506007)(7696005)(83380400001)(55016003)(316002)(122000001)(66574015)(86362001)(26005)(41300700001)(9686003)(64756008)(52536014)(8676002)(8936002)(71200400001)(478600001)(2906002)(5660300002)(921011)(66946007)(66556008)(66446008)(6636002)(76116006)(38070700009)(66476007)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3pZUVIvYUNkTHRNTFY4S3ZpQzR6SWUzS0hwQjhnVDByYVVVMWVoWVJaQmdB?=
 =?utf-8?B?dDQzOEhXZlEvVExLK2laSStjT1dwTFBZMDhIbjZnQTVGamZQRTIvOVkvcGtl?=
 =?utf-8?B?Y1RtR0h2SEo3Znd5NmZ5Z2haTG9JWGRXZTZkcmpod3hxUitiKzlOVWVIMzg3?=
 =?utf-8?B?eUJmQjBxVE5iS1l6cnp0T1N3YjF5cVlGOVQyM2Fvb3Uzb2M4cmdzekJtWGll?=
 =?utf-8?B?eHNiWmVSNUJXSDB6SExNcnppNnpaN3dpYnhYUEEwU254SGM1ZWJISG5wL3Zm?=
 =?utf-8?B?d3dHRC9sb2w0QjhEQ0R1VlFHTEZzMk9YaWdxWlhBTy9CK1llSUhtUFIzanpk?=
 =?utf-8?B?UEhHblhoUGMyT0UxK3VtQW5VaWpBTlh6anpyNENWa0M0NlhmNDZQa0NOdWZm?=
 =?utf-8?B?aGJVVlliSnRwZFJYcHZjdko2dkZCK0xHWGZWY1RWSElHbkY3cFpPNW9KVHc0?=
 =?utf-8?B?eEQvNENEa1RxQjFUdDJtbGlnWURwUnBZUG9ab2JlZDM5TUNYaStkUW92L2Mv?=
 =?utf-8?B?b1BrbnprZE0rR1YrZVRGOWdOa3hTcHRJNmZ2UFFnVExYMWpVNkIrQWpzend2?=
 =?utf-8?B?aVF5U2xuYm1TaDdhUmkrUTM2b1ZVV0tIejUxK3NNditDdTN6ZW5IOVhnQVI3?=
 =?utf-8?B?dkRZV0VUbnRUWXNWc1VrK0lmNG1ocUNmZkFocUR0ME9LMjRmTytIcnRua2hP?=
 =?utf-8?B?REVLcVFtTUhsZXFIY1BxemtUV0l1bG1WRDVNdWYvZGMzc1ZHdjZkQnhRSW9R?=
 =?utf-8?B?ZEUramltNGs4LzlXSzdaYlBXQ2ZJeUprUWJUZHRINHNYQzBiTzNMZ0MrRjdq?=
 =?utf-8?B?eGlKMG84MVFGdG13MGJqUmhaSUxqVVM3VUk1T3NxWW9SVEU1bnlucmduOVFt?=
 =?utf-8?B?WktZZGF5ajYzblUwNHdQM0lpNHgxbVNwbTViNFlsNDhSVFNWb2xmdklhQURX?=
 =?utf-8?B?MVM1M0VUOVJCOVhmZ0JtSW1veWtUZlFpMHlQSldIdldaSkZGRk9lTTZPM1RQ?=
 =?utf-8?B?b2NlaWlEaFVDZGR0MGZaUnowT1hXVUcvOFhLN2tleTQ5ZHI5dWZjMmFzTVI0?=
 =?utf-8?B?cVhPb3BMNE15QUcyWDZoOGdOeHNzQWtjeXB1WGJGOFBuRXJPK3BQbWtYc3Nr?=
 =?utf-8?B?em9NemxoRkpLV2FpeVlta3RiekJhU0JRYVJKamladURUQlllVzB0WTd6Uzh6?=
 =?utf-8?B?QUIvYitRWVNOdE4zOUdac3laU2puMTd4QnNNTVk2N0FxSk9ZWGxsK0VnSkpO?=
 =?utf-8?B?eDBpd0E1U2t5SS90am9ZWkJPT2M4eUNFVCs5QzdFQnhEVDlYdVVpcDNpbWl2?=
 =?utf-8?B?eFJLZHhyNXkwQ3dMcFJBRW1EbkhHYk9IZk83OWhleUlBVTM4WnN4NzdiOUNL?=
 =?utf-8?B?YlBWMW5NSmdnWGxIdUdLdFQ5Tk0zb3hYMW1lQnNrOWFXdWFxNk9aR1pRb2Ex?=
 =?utf-8?B?QkdrRlI5N21YVDhVS3k0RmZ3WTdpREM0VHdiVC83dmIyV2I5cGx2VmNheUJT?=
 =?utf-8?B?d2JvMUNsMlBidFd1aUJEMG9MTEF0cDR5bVZkQ0UzTDRlMmo2aGF4cXRvRC81?=
 =?utf-8?B?VXUvbFEyWTBwRzNnemJZbFpTOVFBUkpyWEZ6WGxpOEhQT3ZKbDBDWWp2OWty?=
 =?utf-8?B?TWJnR3dYTkg5S3RCTjBpdFgyZUl4K24wbW1iYzBOTlJ3ZWZCdXlUd1Z2SEpW?=
 =?utf-8?B?Y1BsdldQSXRlc2tzZ0tQaFNaL1NTdkl0b2hRbGhQL0IwQmVCdUQ5dWd2KzJD?=
 =?utf-8?B?RGxRNFZtSExwbUN5cWNwVjhPQnBRN284bVVzMlpGdlhoeGVLNzBHVXZCWHFY?=
 =?utf-8?B?OHVqSFliZXhCckJpUm91eHRVS1FydS9lbElBTm9xVllwSVZEa0VQOFlkdGpY?=
 =?utf-8?B?Zk42UEJuYTR3bWpSVmlsTmZTWDJ0VW10VHJSTlFyUjRLWWtnejR4MmlyV2hC?=
 =?utf-8?B?cWZsdklBNlJlckJKdXo1QUdwVmp5VmhSVk1yY2N2VkFXMmZPNFdJOHhoWXdk?=
 =?utf-8?B?NWwxTmdwQkJyOTMzbXF6cnFFQkpHRFNhamVOZXI1cGFJcGJWdW1pNmt0aTlO?=
 =?utf-8?B?OE10TjlVSlpiOG93cytpZStQV1FGNm4ydXdmVjBWTzhhRHR3WG5UQmpoNUVk?=
 =?utf-8?Q?4g4U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daad0a24-08b2-4418-b820-08dc278b2902
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 03:16:22.1188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbYytY3/1YdnWJydykFVrCGKNNTu5XBMU/X9pRhOBeZNlMDC+En4e+J1cLIGmTDPHAuDFZMhlJbGTeRhP+SH6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuZGFtdWRpLCBQcml5
YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVi
cnVhcnkgNiwgMjAyNCA1OjU5IEFNDQo+IFRvOiBEYW5kYW11ZGksIFByaXlhbmthIDxwcml5YW5r
YS5kYW5kYW11ZGlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgdGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207IEtlbXBjenluc2tpLA0KPiBaYmln
bmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgWmVuZywgT2FrIDxvYWsuemVu
Z0BpbnRlbC5jb20+Ow0KPiBXZWx0eSwgQnJpYW4gPGJyaWFuLndlbHR5QGludGVsLmNvbT47IEJy
b3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIXSB4ZS94ZV9ib19tb3ZlOiBFbmhhbmNlIHhlX2JvX21vdmUgdHJhY2UNCj4gDQo+IEZyb206
IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gDQo+
IEVuaGFuY2VkIHhlX2JvX21vdmUgdHJhY2UgdG8gYmUgbW9yZSByZWFkYWJsZS4NCj4gSXQgd2ls
bCBoZWxwIHRvIHNob3cgdGhlIG1pZ3JhdGlvbiBkZXRhaWxzLg0KPiBTcmMgYW5kIGRzdCBkZXRh
aWxzLg0KPiANCj4gdjI6IE1vZGlmeSB0cmFjZV94ZV9ib19tb3ZlKCksIGl0IHRha2VzIHRoZSBp
bnRlZ2VyIG1lbV90eXBlDQo+IHJhdGhlciB0aGFuIGEgc3RyaW5nLg0KPiBNYWtlIG1lbV90eXBl
X3RvX25hbWUoKSBleHRlcm4sIGl0IHdpbGwgYmUgdXNlZCBieSB0cmFjZS4oVGhvbWFzKQ0KPiAN
Cj4gdjM6IE1vdmUgbWVtX3R5cGVfdG9fbmFtZSgpIHRvIHhlX2JvLltjaF0gKFRob21hcywgTWF0
dCkNCj4gDQo+IHY0OiBBZGQgZGV2aWNlIGRldGFpbHMgdG8gcmVkdWNlIGFtYmlxdWl0eSByZWxh
dGVkIHRvIHZyYW0wL3ZyYW0xLiAoT2FrKQ0KPiANCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE9hayBaZW5nIDxvYWsuemVu
Z0BpbnRlbC5jb20+DQo+IENjOiBLZW1wY3p5bnNraSBaYmlnbmlldyA8WmJpZ25pZXcuS2VtcGN6
eW5za2lAaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+DQo+IENjOiBCcmlhbiBXZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICB8IDExICsr
KysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCAgICAgICAgIHwgIDEgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYyB8ICA4IC0tLS0tLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaCAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysr
KysrKystLS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5kZXggNjg2ZDcxNmM1NTgxLi5mZDhkODdh
NTE0ZWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC0yOCw2ICsyOCwxNCBAQA0KPiAgI2lu
Y2x1ZGUgInhlX3R0bV9zdG9sZW5fbWdyLmgiDQo+ICAjaW5jbHVkZSAieGVfdm0uaCINCj4gDQo+
ICtjb25zdCBjaGFyICpjb25zdCBtZW1fdHlwZV90b19uYW1lW1RUTV9OVU1fTUVNX1RZUEVTXSAg
PSB7DQo+ICsJW1hFX1BMX1NZU1RFTV0gPSAic3lzdGVtIiwNCj4gKwlbWEVfUExfVFRdID0gImd0
dCIsDQo+ICsJW1hFX1BMX1ZSQU0wXSA9ICJ2cmFtMCIsDQo+ICsJW1hFX1BMX1ZSQU0xXSA9ICJ2
cmFtMSIsDQo+ICsJW1hFX1BMX1NUT0xFTl0gPSAic3RvbGVuIg0KPiArfTsNCj4gKw0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2Ugc3lzX3BsYWNlbWVudF9mbGFncyA9IHsNCj4gIAku
ZnBmbiA9IDAsDQo+ICAJLmxwZm4gPSAwLA0KPiBAQCAtNzI3LDggKzczNSw3IEBAIHN0YXRpYyBp
bnQgeGVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnR0bV9ibywNCj4gYm9vbCBl
dmljdCwNCj4gIAkJbWlncmF0ZSA9IHhlLT50aWxlc1swXS5taWdyYXRlOw0KPiANCj4gIAl4ZV9h
c3NlcnQoeGUsIG1pZ3JhdGUpOw0KPiAtDQo+IC0JdHJhY2VfeGVfYm9fbW92ZShibyk7DQo+ICsJ
dHJhY2VfeGVfYm9fbW92ZShibywgbmV3X21lbS0+bWVtX3R5cGUsIG9sZF9tZW1fdHlwZSk7DQo+
ICAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KHhlKTsNCj4gDQo+ICAJaWYgKHhlX2JvX2lzX3Bp
bm5lZChibykgJiYgIXhlX2JvX2lzX3VzZXIoYm8pKSB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfYm8uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oDQo+IGluZGV4
IGRiNGIyZGI2YjA3My4uNDlmNzcxYmYwNGMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiBAQCAt
MjQ0LDYgKzI0NCw3IEBAIGludCB4ZV9ib19ldmljdF9waW5uZWQoc3RydWN0IHhlX2JvICpibyk7
DQo+ICBpbnQgeGVfYm9fcmVzdG9yZV9waW5uZWQoc3RydWN0IHhlX2JvICpibyk7DQo+IA0KPiAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1fZGV2aWNlX2Z1bmNzIHhlX3R0bV9mdW5jczsNCj4gK2V4
dGVybiBjb25zdCBjaGFyICpjb25zdCBtZW1fdHlwZV90b19uYW1lW107DQo+IA0KPiAgaW50IHhl
X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4g
IAkJCXN0cnVjdCBkcm1fZmlsZSAqZmlsZSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZHJtX2NsaWVudC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGll
bnQuYw0KPiBpbmRleCA4MmQxMzA1ZTgzMWYuLjFhYzE0YzkxMDQ5MSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9jbGllbnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZHJtX2NsaWVudC5jDQo+IEBAIC0xMzEsMTQgKzEzMSw2IEBAIHN0YXRpYyB2b2lk
IGJvX21lbWluZm8oc3RydWN0IHhlX2JvICpibywNCj4gDQo+ICBzdGF0aWMgdm9pZCBzaG93X21l
bWluZm8oc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ICB7
DQo+IC0Jc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IG1lbV90eXBlX3RvX25hbWVbVFRNX05VTV9N
RU1fVFlQRVNdDQo+ID0gew0KPiAtCQlbWEVfUExfU1lTVEVNXSA9ICJzeXN0ZW0iLA0KPiAtCQlb
WEVfUExfVFRdID0gImd0dCIsDQo+IC0JCVtYRV9QTF9WUkFNMF0gPSAidnJhbTAiLA0KPiAtCQlb
WEVfUExfVlJBTTFdID0gInZyYW0xIiwNCj4gLQkJWzQgLi4uIDZdID0gTlVMTCwNCj4gLQkJW1hF
X1BMX1NUT0xFTl0gPSAic3RvbGVuIg0KPiAtCX07DQo+ICAJc3RydWN0IGRybV9tZW1vcnlfc3Rh
dHMgc3RhdHNbVFRNX05VTV9NRU1fVFlQRVNdID0ge307DQo+ICAJc3RydWN0IHhlX2ZpbGUgKnhl
ZiA9IGZpbGUtPmRyaXZlcl9wcml2Ow0KPiAgCXN0cnVjdCB0dG1fZGV2aWNlICpiZGV2ID0gJnhl
Zi0+eGUtPnR0bTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5o
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgNCj4gaW5kZXggZTRlNzI2MjE5MWFkLi5l
YzBjMmJlYzQ5NGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+IEBAIC0xMiw2ICsxMiw3
IEBADQo+ICAjaW5jbHVkZSA8bGludXgvdHJhY2Vwb2ludC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+DQo+IA0KPiArI2luY2x1ZGUgInhlX2JvLmgiDQo+ICAjaW5jbHVkZSAieGVfYm9f
dHlwZXMuaCINCj4gICNpbmNsdWRlICJ4ZV9leGVjX3F1ZXVlX3R5cGVzLmgiDQo+ICAjaW5jbHVk
ZSAieGVfZ3B1X3NjaGVkdWxlcl90eXBlcy5oIg0KPiBAQCAtMzEsNyArMzIsNyBAQCBERUNMQVJF
X0VWRU5UX0NMQVNTKHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmVuY2UsDQo+ICAJCQkgICAgICks
DQo+IA0KPiAgCQkgICAgVFBfZmFzdF9hc3NpZ24oDQo+IC0JCQkgICBfX2VudHJ5LT5mZW5jZSA9
ICh1bnNpZ25lZCBsb25nKWZlbmNlOw0KPiArCQkJICAgX19lbnRyeS0+ZmVuY2UgPSAodTY0KWZl
bmNlOw0KDQpUaGlzIHNlZW1zIGRvZXNuJ3QgYmVsb25nIHRvIHRoaXMgY2hhbmdlLiBCdXQgSSBh
bSBmaW5lLg0KDQo+ICAJCQkgICBfX2VudHJ5LT5zZXFubyA9IGZlbmNlLT5zZXFubzsNCj4gIAkJ
CSAgICksDQo+IA0KPiBAQCAtMTAwLDkgKzEwMSwyNyBAQCBERUZJTkVfRVZFTlQoeGVfYm8sIHhl
X2JvX2NwdV9mYXVsdCwNCj4gIAkgICAgIFRQX0FSR1MoYm8pDQo+ICApOw0KPiANCj4gLURFRklO
RV9FVkVOVCh4ZV9ibywgeGVfYm9fbW92ZSwNCj4gLQkgICAgIFRQX1BST1RPKHN0cnVjdCB4ZV9i
byAqYm8pLA0KPiAtCSAgICAgVFBfQVJHUyhibykNCj4gK1RSQUNFX0VWRU5UKHhlX2JvX21vdmUs
DQo+ICsJICAgIFRQX1BST1RPKHN0cnVjdCB4ZV9ibyAqYm8sIHVpbnQzMl90IG5ld19wbGFjZW1l
bnQsIHVpbnQzMl90DQo+IG9sZF9wbGFjZW1lbnQpLA0KPiArCSAgICBUUF9BUkdTKGJvLCBuZXdf
cGxhY2VtZW50LCBvbGRfcGxhY2VtZW50KSwNCj4gKwkgICAgVFBfU1RSVUNUX19lbnRyeSgNCj4g
KwkJICAgICBfX2ZpZWxkKHN0cnVjdCB4ZV9ibyAqLCBibykNCj4gKwkJICAgICBfX2ZpZWxkKHNp
emVfdCwgc2l6ZSkNCj4gKwkJICAgICBfX2ZpZWxkKHUzMiwgbmV3X3BsYWNlbWVudCkNCj4gKwkJ
ICAgICBfX2ZpZWxkKHUzMiwgb2xkX3BsYWNlbWVudCkNCj4gKwkJICAgICBfX2FycmF5KGNoYXIs
IGRldmljZV9pZCwgMTIpDQo+ICsJCQkpLA0KPiArDQo+ICsJICAgIFRQX2Zhc3RfYXNzaWduKA0K
PiArCQkgICBfX2VudHJ5LT5ibyAgICAgID0gYm87DQo+ICsJCSAgIF9fZW50cnktPnNpemUgPSBi
by0+c2l6ZTsNCj4gKwkJICAgX19lbnRyeS0+bmV3X3BsYWNlbWVudCA9IG5ld19wbGFjZW1lbnQ7
DQo+ICsJCSAgIF9fZW50cnktPm9sZF9wbGFjZW1lbnQgPSBvbGRfcGxhY2VtZW50Ow0KPiArCQkg
ICBzdHJzY3B5KF9fZW50cnktPmRldmljZV9pZCwNCj4gZGV2X25hbWUodHRtX3RvX3hlX2Rldmlj
ZShfX2VudHJ5LT5iby0+dHRtLmJkZXYpLT5kcm0uZGV2KSwgMTIpOw0KDQpJIGFzc3VtZSB0aGlz
IGlzIHRlc3RlZCBhbmQgZGV2aWNlIG5hbWUgaXMgYWx3YXlzIGxlc3MgdGhhbiAxMiBjaGFyYWN0
ZXJzLiBXaXRoIHRoYXQsIHRoaXMgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxvYWsu
emVuZ0BpbnRlbC5jb20+DQoNCk9haw0KDQo+ICsJCSAgICksDQo+ICsJICAgIFRQX3ByaW50aygi
bWlncmF0ZSBvYmplY3QgJXAgW3NpemUgJXp1XSBmcm9tICVzIHRvICVzIGRldmljZV9pZDolcyIs
DQo+ICsJCSAgICAgIF9fZW50cnktPmJvLCBfX2VudHJ5LT5zaXplLCBtZW1fdHlwZV90b19uYW1l
W19fZW50cnktDQo+ID5vbGRfcGxhY2VtZW50XSwNCj4gKwkJICAgICAgbWVtX3R5cGVfdG9fbmFt
ZVtfX2VudHJ5LT5uZXdfcGxhY2VtZW50XSwgX19lbnRyeS0NCj4gPmRldmljZV9pZCkNCj4gICk7
DQo+IA0KPiAgREVDTEFSRV9FVkVOVF9DTEFTUyh4ZV9leGVjX3F1ZXVlLA0KPiAtLQ0KPiAyLjI1
LjENCg0K
