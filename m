Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526EAEEAA44
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 13:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE68C10E26C;
	Thu, 14 Sep 2023 13:57:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BC910E26C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694699841; x=1726235841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o8NZfNPUI9j6NdHB/Ni3yfru0KesT3Rby1+DQ4RDRSc=;
 b=Od9U+Jkw+H0EhjCXKVAe88b3uc/o1iNQRv8IJqfSy+xYN+WlvV04feG7
 ZbWZ0fxEknUWeHddK4WM9PfLVti/sAtRzomrjdOHu7bvQBI9pXBtO1sf2
 pehUKRnL2DLx81I6Avkf3Qc4GvWOp5sc0D5YLDSwzuBe2LLMHiCFbOUca
 BmtGpDb+9D1OFp2lnA18bYmeUrkW5DtZms9dR6HoiQ6Q0oxAmvREIuCbK
 SZPKbtSxb3e88hJaHKLeKGLGzRLSB2xMFuWxS968xZBo0R2RYjhsdn+9l
 XgKa1Cj8E82Suymj5ICtdoAouzPixyUbHS47fKdFJplY8ormvYRWdBlCy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378876104"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="378876104"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779631019"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779631019"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 06:57:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 06:57:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 06:57:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 06:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKV9QF/SEmJjeoo9WT/WmfRs5MVlbZwOmDRQ8SiJO1ex6qHROCdSCMThmlBJvfx0uy5RYAXcJDp0Ecg4z39uIW9Aldmo7R0JSnI1ieI9qWbGzPaM7GFsIfvp63p/duLY8Sxur1AlwHZNQYO6Nf7AaVjr0CBhJc6brp+Z9na1XvjsVCuxTjpO+omyCLeTImcFWgC6hWR/rHX9BV6F9/XNIqhf/b3IS5sPfyI5eEzxW/Tz1ON6npFnvBG1WJSIxA89leWwGq7MeU5Y8DfJz+9Y3Ji4me2J6/S6LTMw4j0Ffqeq4JFphkyaoGfq7UApk3OBvQmu0WnuYc7WwOGMgJcWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8NZfNPUI9j6NdHB/Ni3yfru0KesT3Rby1+DQ4RDRSc=;
 b=nFl7AyD9UGlLeNnv/JnrKhR9/Zv6PqsYOUqUUMbSk2ESYBNsnTWh6CX7OWse0OcIQd+YUaCg9ZSkgybYREt7PEbKQUMoP4SVvIkMdWWLlZ0Afc2b5EKS2FMZHjiwWJg2blqm6vtxDpg8f+9yoPlUbq1S91UuKzAy0DpWBfna+ArlyevPKKcbH4Ip2tO0VOuRbGFBXT4w2QQG+SkG+9nyO5lTvlrkzcds7BQZ9JBcPOGXXRFL7rH59bBXKvTvXuTkqSUqW3MoKlA8FnmRZqxPDWp/7HzHRY8M+u17jncSYEnqyHCywV52eZrHEbNqhdOdtONB5Od+MqICo9gMPEiU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5426.namprd11.prod.outlook.com (2603:10b6:610:d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 13:57:15 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 13:57:15 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [RFC 2/5] drm/xe/uapi: Document drm_xe_query_gt.
Thread-Index: AQHZ4pO9ABGryyxnq0aLv7zVc7fDjbAZMzoAgAAVwYCAAAlfAIAAAnyAgAEMtQA=
Date: Thu, 14 Sep 2023 13:57:15 +0000
Message-ID: <cea2cd12a5a855955f7af5c5c926b4ce170d1ffb.camel@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-3-rodrigo.vivi@intel.com>
 <20230913195506.GC233750@mdroper-desk1.amr.corp.intel.com>
 <ZQIl2bmrq0XgFD88@intel.com>
 <20230913214630.GR2706891@mdroper-desk1.amr.corp.intel.com>
 <ZQIvy2XeRnTZromd@intel.com>
In-Reply-To: <ZQIvy2XeRnTZromd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5426:EE_
x-ms-office365-filtering-correlation-id: 792e073f-0ceb-47be-8100-08dbb52a806f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /JLACzwds0KFm7ylZMl1NLQHHoFHcAYZRAp4mYLOZ6vS3EZaciEA4hRlBJPaO/2SD4V1y3Y0dAwv4/oC2ug8PZry2u1HUJMiIR3f9KorYQCP4yir+WPYA+l6WRsFJQzNngBcMLuXKb1TiI66czt+7fJKFoFmAPCYnqn7rYXammr2GFbEiltbn7sUAt/iWaOzP9RqdB34VeEfcupqvobDuEhH78sJ/ilBh/0iwNQjPXpkk2HhvhaCT15FgOt/gL7ZFKBLi5z/q2pnTJe3I1L/gFEEXqzuNdiIb/AoJIu8aoiSPUT5lecdxuasWVcg5LxiOtJ4UE+UFeA8RELNXWuvNCsTftz3TfBLtwW/JC1kfq2l01SuWTy18ePsYqAqmOqp/HnKc4+JjQbFb7n260LBgnmDO7iWwDPrx/+ntPxm1UbN7SOmNmc4cFDQe5l3n3CH7W6ORTJouDigYTaWpaghKzotixmJpxN8M3h2NhcU4J27OQnb+Yh1X5dc6Vq6FalVQpJPEgWR8bbArj7xkd35bgIzAM7F/lf3VinpOyWT+UvXlWdXuWmN8+fWw3ZQ0kaspXAbxO/3jF0zFU1YCZBaP8mhvRGv4d1wF6MEjSX6WznpQ3O0F5qeLdiYLZ7ppFeh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(1800799009)(186009)(451199024)(66446008)(5660300002)(36756003)(8676002)(4326008)(8936002)(41300700001)(478600001)(91956017)(66946007)(76116006)(64756008)(66556008)(2906002)(66476007)(6486002)(71200400001)(6512007)(2616005)(26005)(83380400001)(86362001)(66899024)(6506007)(110136005)(82960400001)(316002)(6636002)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THNLQVhKZTBXNk0ySjI3Qy9IcXRvSkNwQkZCOVJJRFVRSEh4YzVheGFCTVNF?=
 =?utf-8?B?ZU1WRnRjODZ4ZTM1Z05hak5kVi9vUWYxcVM0UHc0aHFLQWNXK1pjVktCVjBP?=
 =?utf-8?B?WldDM3g2SE9TaS9hOVpMc2tYVGZ2SWdSeTNWZndFa0Z4KzdyUDVkblZDU2hZ?=
 =?utf-8?B?ZkcxVFpOQlh1LzN6WXhvRDAzSGl5eUdwWEEvV0dMZ3RtQ1FjTVltcG5TU3U0?=
 =?utf-8?B?TjNsZFNYRVBjSVN3SGMvMDBWOWpQdVpZMDZUOXcxbmpyMXV4K1V5Yk10eGMz?=
 =?utf-8?B?REc5ZithTW5MckkzQmNJcFE2VDZYYUg0MzBFeHdXOWhGTjVTSlY2MVpMTm1Q?=
 =?utf-8?B?NmdhaDRCMnhzQmNYUnM5QWp5SEtkcm1mQ1JjcEo3ejJRZ3dJWk9QeWNBNWJi?=
 =?utf-8?B?aERBZzRHUUYwSURFeUtmUGVuT2hDYkYrZTZGVVp6N1FONEJ0dkd4ZS9MbkF0?=
 =?utf-8?B?UDNYQ3pFRUlBT0RaT0xvSGF6MVVKT1p3L2pxbDhSOXRLZUdPYkxuTklmZ0RY?=
 =?utf-8?B?ekRTWU13bm1BY3l5aUl4RE9LM09WdWNJTDk0U0lobDdPVDNDZm85ZWdrZ3V3?=
 =?utf-8?B?M2NZdDg1STJjTVdvalVKY2M0RzhTcXYycFVrZHBjY3pKY0tKNnVndWZSYXdS?=
 =?utf-8?B?YmFpMmx6WERIdThMYjdqTmFQV0JvMHQwRDkweEk3QlpONGJpUTBvT2F2U01I?=
 =?utf-8?B?RXJ3Z3JUcGt5ZDZpYWkvTThwcDEzSEVDc2pkbHlLbDR1SFZwc1o5WWtvYmNy?=
 =?utf-8?B?SUJhTktvSjIxbklHZ2EwZWd4UWdESVRIQ3hyc2NDTFB0aWhXNkhTSnlObk9a?=
 =?utf-8?B?RTFNb1A5cmphbHRhZm1VLzRZQkVVWUNUMStnR3Y5V3BMN2lKYmpzY3YzanJ0?=
 =?utf-8?B?Q3VET25zNWE4NlBIY1Q3cGhoN21RWGlDTjVlS0hDemNNTmNsQnlOK2lmSVA3?=
 =?utf-8?B?cW1OV2lVNVhpWkV5UTVSbUw0TGdXK29DYUNmdG5lTXVIWnBlQ3IwcjNncXdr?=
 =?utf-8?B?Rkh2NTR6emUzSU1HdkpEZWM3dGllMGo5TWNVTm5sT250VUN1dUl0bEFDWVdK?=
 =?utf-8?B?RkdkNE5qalhSakdyeVV1NlpIalNHaDFRTW5OeFZ0NXQvQXNmL1UyUUM5Nm5U?=
 =?utf-8?B?ZmJYNjlabzE3U0Z0QXEwUjlCK1AxWkxLenl3OHpGVmxLeUhRU3R3Z3p6UDRj?=
 =?utf-8?B?b3p4RjZxOVQ1QjFDSWtpeEVFTXd2cFZIZkc3dEFtTms3Z1docnk0NDZjN09l?=
 =?utf-8?B?WEpSRlhFU0J3Zkxzd1VwV1c4aEFWUThUNGFwSDg2OGUzRmpUYllVaGlzVHE4?=
 =?utf-8?B?NWNWSXAyK1NmN2hTWXIzVm1jM0VTdHZDOGN6emJMVlFsUTAyc0lLWVRlaUFE?=
 =?utf-8?B?QUxJOWRiOE84bmY1QUJPQXkwb3ZuK1A3MVBSK0tNSjhoYjdpNFpxbkFoMjdH?=
 =?utf-8?B?Q0J5ZEcwNzhrUFp1bm1tWXNVZXVLY2xscCtlMGNHSzZtU0ptWmdUb2JVQkFG?=
 =?utf-8?B?K3JnV2FLczNQYUlSa004RE40ZkYvVUY2Mm13RzVoZnE1ckVHc1lMM254RDdn?=
 =?utf-8?B?bkFGbmpvUVFVK2tEZW9USFhFMVFSMkFrVjdKUkxrZDdac2ZqWWk5NzB5WG1I?=
 =?utf-8?B?akh0LzQreWhuK3ZrUUgzZjBEWHRteWFXdWdjUjcybi9pdzRHUWJBZWp4QjJ5?=
 =?utf-8?B?a29vSm4xMmVGUjFnNVNSYi9FUFlQbDJzSmhrQVYzazVjbzgyM0hJallHV2x6?=
 =?utf-8?B?WmJ5clFGQlNZNlpSRDlkSVBZY3dBWERXcjB6c2xSMVJWa0dUalozaTh6Y1Ba?=
 =?utf-8?B?L1Rrcm5oT0Q4NGFFRFhaSmRDYW1uTndNNlNyanpYK0ZxanJDRXYwSFFzUzVt?=
 =?utf-8?B?Y2JzQ1d3NmRWWHFXU0NxUlcxKzJvUUR6bW1USFpzVUNCRlVvOW9QWDFhWWZ5?=
 =?utf-8?B?YTJUR2hyWGRIWWFRNkRGWlordnpXWlhzMGVFVXE3b25pT2N3V3VXNWN2dkRL?=
 =?utf-8?B?enErR0dlQzd2Ri9HT052SENUVXduYzdxc3VKZWV4UE5sWG1wL2xSbVRKdGYr?=
 =?utf-8?B?eGZhc0txNmt2anlGNC9MMDRiQlo2eUo2czRJVjdtTU5JbUt4SjJDc1dPMzVT?=
 =?utf-8?B?WUNZNFlvaGt1dE92em16TDlqZ1lwcFMzQkR2VEdRME5uQ2RqSGUyRmFYWkJQ?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12E3D344EEB9FB43A22336F259F18115@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792e073f-0ceb-47be-8100-08dbb52a806f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 13:57:15.0558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIEJqpdGAMyFjVJG4FTot+9mkjRXg31M6pJTEuyvRYyeo+Eikz9PZ2OIhJ5bVMmXN3hdloNdJnlgcBl+vzkuEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5426
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/5] drm/xe/uapi: Document drm_xe_query_gt.
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

T24gV2VkLCAyMDIzLTA5LTEzIGF0IDE3OjU1IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDAyOjQ2OjMwUE0gLTA3MDAsIE1hdHQgUm9wZXIgd3Jv
dGU6DQo+ID4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMDU6MTI6NTdQTSAtMDQwMCwgUm9kcmln
byBWaXZpIHdyb3RlOg0KPiA+ID4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTI6NTU6MDZQTSAt
MDcwMCwgTWF0dCBSb3BlciB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCBTZXAgMDgsIDIwMjMgYXQg
MDQ6MzI6NTlQTSAtMDQwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+ID4gPiA+IFNwbGl0IGRy
bV94ZV9xdWVyeV9ndCBvdXQgb2YgdGhlIGd0IGxpc3Qgb25lIGluIG9yZGVyIHRvIGJldHRlcg0K
PiA+ID4gPiA+IGRvY3VtZW50IGl0LiBObyBmdW5jdGlvbmFsIGNoYW5nZSBhdCB0aGlzIHBvaW50
Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaCB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQ0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMjIgZGVs
ZXRpb25zKC0pDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gaW5k
ZXggNTFjNGVmNWRlZTZkLi40YmNlZTcwOWJlZjkgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gPiA+ID4gPiBAQCAtMjYyLDYgKzI2Miw0NyBAQCBzdHJ1Y3QgZHJtX3hlX3F1
ZXJ5X2NvbmZpZyB7DQo+ID4gPiA+ID4gIAlfX3U2NCBpbmZvW107DQo+ID4gPiA+ID4gIH07DQo+
ID4gPiA+ID4gIA0KPiA+ID4gPiA+ICsvKioNCj4gPiA+ID4gPiArICogc3RydWN0IGRybV94ZV9x
dWVyeV9ndCAtIGRlc2NyaWJlIGFuIGluZGl2aWR1YWwgR1QuDQo+ID4gPiA+ID4gKyAqDQo+ID4g
PiA+ID4gKyAqIFRvIGJlIHVzZWQgd2l0aCBkcm1feGVfcXVlcnlfZ3RzLCB3aGljaCB3aWxsIHJl
dHVybiBhIGxpc3Qgd2l0aCBhbGwgdGhlDQo+ID4gPiA+ID4gKyAqIGV4aXN0aW5nIEdUIGluZGl2
aWR1YWwgZGVzY3JpcHRpb25zLg0KPiA+ID4gPiA+ICsgKiBHcmFwaGljcyBUZWNobm9sb2d5IChH
VCkgaXMgYSBzdWJzZXQgb2YgYSBHUFUvdGlsZSB0aGF0IGlzIHJlc3BvbnNpYmxlIGZvcg0KPiA+
ID4gPiA+ICsgKiBpbXBsZW1lbnRpbmcgZ3JhcGhpY3MgYW5kL29yIG1lZGlhIG9wZXJhdGlvbnMu
DQo+ID4gPiA+ID4gKyAqLw0KPiA+ID4gPiA+ICtzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0IHsNCj4g
PiA+ID4gPiArI2RlZmluZSBYRV9RVUVSWV9HVF9UWVBFX01BSU4JCTANCj4gPiA+ID4gPiArI2Rl
ZmluZSBYRV9RVUVSWV9HVF9UWVBFX1JFTU9URQkJMQ0KPiA+ID4gPiANCj4gPiA+ID4gSSBrbm93
IHRoZSBnb2FsIG9mIHRoaXMgcGF0Y2ggaXMganVzdCB0byBhZGQga2VybmVsZG9jLCBidXQgd2hp
bGUgd2UncmUNCj4gPiA+ID4gbG9va2luZyBhdCB0aGlzLCBvbmUgb3RoZXIgdGhpbmcgd2UnbGwg
bmVlZCB0byBkZWNpZGUgYmVmb3JlIGZpbmFsaXppbmcNCj4gPiA+ID4gdGhlIHVhcGkgaXMgd2hl
dGhlciB0aGVyZSdzIGFueSB2YWx1ZSBpbiBrZWVwaW5nIHRoZXNlIHR3byBzZXBhcmF0ZS4NCj4g
PiA+ID4gSS5lLiwgZG9lcyBhbnkgdXNlcnNwYWNlIGFjdHVhbGx5IGNhcmUgYWJvdXQgdGhlIGRp
ZmZlcmVuY2UgYmV0d2Vlbg0KPiA+ID4gPiAicmVuZGVyIEdUIG9uIGZpcnN0IHRpbGUiIHZzICJy
ZW5kZXIgR1Qgb24gb3RoZXIgdGlsZXM/IiAgR2l2ZW4gdGhhdCBHVA0KPiA+ID4gPiBhdCB0aGUg
dWFwaSBsZXZlbCBpcyBwcmV0dHkgbXVjaCBvbmx5IGNvbmNlcm5lZCB3aXRoIHBvd2VyIG1hbmFn
ZW1lbnQsIEkNCj4gPiA+ID4gY2FuJ3QgcmVhbGx5IHRoaW5rIG9mIGFueXdoZXJlIHRoYXQgdGhl
IGRpc3RpbmN0aW9uIHdvdWxkIG1hdHRlciAoYnV0IHdlDQo+ID4gPiA+IHNob3VsZCBzdGlsbCBj
aGVjayB3aXRoIHRoZSB1c2Vyc3BhY2UgdGVhbXMpLg0KPiA+ID4gDQo+ID4gPiBDYzogSm9zZS4N
Cj4gPiA+IE1lc2EgaXMgdXNpbmcgdGhpcywgYnV0IEkgYmVsaWV2ZSBhIFhFX1FVRVJZX0dUX1RZ
UEVfUkVOREVSIGNvdWxkIGJlDQo+ID4gPiBlbm91Z2guIEFuZCBpbiBjYXNlIHdlIGhhdmUgbXVs
dGlwbGUgR1RzIHRoZW4gdGhleSBqdXN0IGdldCB0aGUgZGF0YQ0KPiA+ID4gZnJvbSB3aGF0ZXZl
ciBSRU5ERVIgaWYgZmluZHMgZmlyc3QgYW5kIHN0b3A/DQoNCldoYXQgYWJvdXQgUFZDPyBYRV9R
VUVSWV9HVF9UWVBFX1JFTkRFUiBtYXkgY29uZnVzZSBjb21wdXRlIGZvbGtzLCBtYXliZSBhIGJl
dHRlciBuYW1lIHRvIGluY2x1ZGUgYm90aCByZW5kZXIgYW5kIGNvbXB1dGUuLi4NCg0KQWxzbyBj
b3VsZCB3ZSBoYXZlIGEgZ3VhcmFudGVlIHRoYXQgdGhlIG1haW4gdGlsZSB3aWxsIGFsd2F5cyBi
ZSBpbnN0YW5jZSA9IDAgZm9yIFhFX1FVRVJZX0dUX1RZUEVfUkVOREVSKG9yIHdoYXRldmVyIG5h
bWUpPw0KSnVzdCBpbiBjYXNlIHdlIG5lZWQgdG8gZG8gc29tZSBzcGVjaWFsIGhhbmRsaW5nIGJh
c2VkIG9uIGEgbWFpbiB0aWxlIHBhcmFtZXRlci4NCg0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4g
PiA+ICsjZGVmaW5lIFhFX1FVRVJZX0dUX1RZUEVfTUVESUEJCTINCj4gPiA+ID4gPiArCS8qKiBA
dHlwZTogR1QgdHlwZTogTWFpbiwgUmVtb3RlLCBvciBNZWRpYSAqLw0KPiA+ID4gPiA+ICsJX191
MTYgdHlwZTsNCj4gPiA+ID4gPiArCS8qKiBAaW5zdGFuY2U6IEluc3RhbmNlIG9mIHRoaXMgR1Qg
aW4gdGhlIEdUIGxpc3QgKi8NCj4gPiA+ID4gPiArCV9fdTE2IGluc3RhbmNlOw0KPiA+ID4gPiA+
ICsJLyoqIEBjbG9ja19mcmVxOiBBIGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+
ID4gPiA+ID4gKwlfX3UzMiBjbG9ja19mcmVxOw0KPiA+ID4gPiANCj4gPiA+ID4gV2UgbWF5IHdh
bnQgdG8gYmUgbW9yZSBjbGVhciBhYm91dCB3aGF0IGZyZXF1ZW5jeSB0aGlzIGlzLiAgSS5lLiwg
aXMgaXQNCj4gPiA+ID4gdGhlIGN1cnJlbnQgZnJlcXVlbmN5IHdoZW4gdGhlIHF1ZXJ5IGlzIGlz
c3VlZD8gIElzIGl0IHRoZSBtYXhpbXVtDQo+ID4gPiA+IGZyZXF1ZW5jeSB0aGUgR1Qgc3VwcG9y
dHM/ICBEb2VzIHRoaXMgYWx3YXlzIGdpdmUgYSBtZWFuaW5nZnVsIHZhbHVlIG9yDQo+ID4gPiA+
IGRvZXMgaXQgcmVwb3J0IDAgd2hlbiBub3RoaW5nIGlzIGV4ZWN1dGluZyAoYW5kIHdlJ3JlIGlu
IFJDNik/DQo+ID4gPiA+IA0KPiA+ID4gPiBCVFcsIGlzIHRoaXMgcmVkdW5kYW50IHdpdGggd2hh
dCB3ZSdyZSBleHBvc2luZyB0aHJvdWdoIHN5c2ZzPyAgRG9lcw0KPiA+ID4gPiB1c2Vyc3BhY2Ug
Z2V0IGFueSBiZW5lZml0IGZyb20gZ3JhYmJpbmcgZnJlcXVlbmN5IGhlcmUgcmF0aGVyIHRoYW4N
Cj4gPiA+ID4gdGhyb3VnaCB0aGUgc3lzZnMgaW50ZXJmYWNlPw0KPiA+ID4gDQo+ID4gPiBvaCBt
eSEgV2hlbiBJIHdhcyBhZGRpbmcgdGhpcyBkb2N1bWVudGF0aW9uIGhlcmUgSSBoYXRlZCB0aGlz
IEFQSQ0KPiA+ID4gZXhhY3RseSBiZWNhdXNlIEkga25ldyBpdCB3b3VsZCBjYXVzZSBjb25mdXNp
b24gd2l0aCB0aGUgR1Qgb3BlcmF0aW5nDQo+ID4gPiBmcmVxdWVuY2llcy4gVGhpcyBoYXMgbm90
aGluZyB0byBkbyB3aXRoIHRob3NlIGZyZXF1ZW5jaWVzLiBJdCBpcyBhDQo+ID4gPiB0aW1lc3Rh
bXAgdGhpbmcuDQo+ID4gPiANCj4gPiA+IENoZWNrIGdldF9jcnlzdGFsX2Nsb2NrX2ZyZXEoKSBh
dCB4ZV9ndF9jbG9jay5jLg0KPiA+ID4gDQo+ID4gPiBEbyB5b3UgaGF2ZSBtb3JlIHN1Z2dlc3Rp
b25zIG9uIGhvdyB0byBtYWtlIHRoaXMgZG9jdW1lbnRhdGlvbg0KPiA+ID4gYmV0dGVyIGFuZCBw
ZW9wbGUgbm90IGNvbmZ1c2luZyB0aGlzIHdpdGggdGhlIEdUIGZyZXF1ZW5jaWVzPw0KPiA+ID4g
DQo+ID4gPiBtYXliZSByZW1vdmUgdGhlIGZyZXEgdGVybSBhbmQgdXNlIGNyeXN0YWxfY2xvY2s/
IDovDQo+ID4gDQo+ID4gQWgsIG9rYXkuICBZZWFoLCBJJ20gbm90IHJlYWxseSBzdXJlIGhvdyB0
aGF0IHdpbmRzIHVwIGdldHRpbmcgdXNlZCwgc28NCj4gPiBwcm9iYWJseSBhbm90aGVyIHBsYWNl
IGZvciBKb3NlIHRvIHdlaWdoIGluIG9uIHdoYXQga2luZCBvZiBkZXNjcmlwdGlvbg0KPiA+IG1h
a2VzIHNlbnNlLg0KPiA+IA0KPiA+IEkga25vdyB0aGVyZSdzIG90aGVyIHVhcGkgd29yayBmb3Ig
Q1BVL0dQVSB0aW1lc3RhbXAgY29ycmVsYXRpb24gZ29pbmcNCj4gPiBvbiwgYWx0aG91Z2ggSSBo
YXZlbid0IHJlYWxseSBmb2xsb3dlZCB3aGF0J3MgaGFwcGVuaW5nIHRoZXJlLiAgRG9lcw0KPiA+
IHRoaXMgcmVsYXRlIHRvIHRoYXQgaW4gYW55IHdheT8gIEFuZCBpZiBpdCBkb2VzLCBzaG91bGQg
dGhpcyBpbmZvcm1hdGlvbg0KPiA+IGJlIG1vdmluZyBvdmVyIHRvIHRoYXQgcXVlcnkgcmF0aGVy
IHRoYW4gc3RheWluZyBpbiB0aGUgZ2VuZXJhbCBHVA0KPiA+IHF1ZXJ5Pw0KPiANCj4gR29vZCBx
dWVzdGlvbnMuLi4NCj4gQ2M6IEpvc2UsIHNpbmNlIEkgZm9yZ290IHRvIGRvIHNvIG9uIHRoZSBw
cmV2aW91cyBlbWFpbC4NCg0KSSBiZWxpZXZlIHdlIHNob3VsZCBrZWVwIGl0IGluIEdUUyBxdWVy
eSBhcyBEUk1fWEVfUVVFUllfQ1NfQ1lDTEVTIHVBUEkgd2lsbCBmYWlsIHdoZW4gcnVubmluZyBp
biBTUklPViBtb2RlcyBidXQgTWVzYSB3b3VsZCBzdGlsbCBxdWVyeSB0aW1lc3RhbXANCmZyb20g
ZW5naW5lIGluIHNvbWUgY2FzZXMuLi4NCg0KQWJvdXQgdGhlIG5hbWUsIHdoYXQgYWJvdXQgdGlt
ZXN0YW1wX2ZyZXF1ZW5jeT8NCg0KPiANCj4gPiANCj4gPiANCj4gPiBNYXR0DQo+ID4gDQo+ID4g
PiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gKwkvKiogQGZlYXR1cmVzOiBSZXNlcnZlZCBmb3IgZnV0
dXJlIGluZm9ybWF0aW9uIGFib3V0IEdUIGZlYXR1cmVzICovDQo+ID4gPiA+ID4gKwlfX3U2NCBm
ZWF0dXJlczsNCj4gPiA+ID4gPiArCS8qKg0KPiA+ID4gPiA+ICsJICogQG5hdGl2ZV9tZW1fcmVn
aW9uczogQml0IG1ha3Mgb2YgaW5zdGFuY2VzIGZyb20NCj4gPiA+ID4gPiArCSAqIGRybV94ZV9x
dWVyeV9tZW1fdXNhZ2UgdGhhdCBsaXZlcyBvbiB0aGUgc2FtZSBHUFUvVGlsZSBhbmQgaGF2ZQ0K
PiA+ID4gPiA+ICsJICogZGlyZWN0IGFjY2Vzcy4NCj4gPiA+ID4gPiArCSAqLw0KPiA+ID4gPiA+
ICsJX191NjQgbmF0aXZlX21lbV9yZWdpb25zOw0KPiA+ID4gPiANCj4gPiA+ID4gV2FzIHRoZSBw
bGFuIHRvIGV2ZW50dWFsbHkgbW92ZSB0aGVzZSBtZW1vcnkgcmVnaW9uIG1hc2tzIHRvIGENCj4g
PiA+ID4gdGlsZS1iYXNlZCB1YXBpPyAgTGVhdmluZyB0aGVtIGluIGEgR1QgcXVlcnkgc2VlbXMg
YXdrd2FyZCBzaW5jZSB0aGUgR1QNCj4gPiA+ID4gaXNuJ3QgZGlyZWN0bHkgcmVsYXRlZCB0byBt
ZW1vcnkgcmVnaW9ucy4gIEl0IHNlZW1zIGxpa2Ugd2hhdCB1c2Vyc3BhY2UNCj4gPiA+ID4gY2Fy
ZXMgYWJvdXQgd291bGQgZWl0aGVyIGJlIHRpbGU8LT5tZW1fcmVnaW9uIGxvY2F0aW9uIG9yDQo+
ID4gPiA+IGh3ZTwtPm1lbV9yZWdpb24gZGlzdGFuY2UuICBIb3cgaXMgdXNlcnNwYWNlIHV0aWxp
emluZyB0aGlzIGluZm9ybWF0aW9uDQo+ID4gPiA+IHRvZGF5IChhbmQgYXJlIHRoZXkgbmVlZGlu
ZyB0byBqdW1wIHRocm91Z2ggZXh0cmEgaG9vcHMgZHVlIHRvIHRoZQ0KPiA+ID4gPiBjdXJyZW50
IHBsYWNlbWVudD8pPw0KPiA+ID4gDQo+ID4gPiBUaGF0J3MgYSBnb29kIHF1ZXN0aW9uLiBUaGV5
IGdldCB0aGlzIGluZm9ybWF0aW9uLCBidXQgaXQgZG9lc24ndA0KPiA+ID4gbG9vayB0aGV5IGFy
ZSBtYWtpbmcgYSBnb29kIHJlYWwgdXNhZ2Ugb2YgdGhpcyBhbnl3YXkuLi4NCj4gPiA+IA0KPiA+
ID4gTWF5YmUgd2Ugc2hvdWxkIGp1c3QgcmVwbGFjZSB0aGlzIGVudGlyZWx5IHBlciBhIHRpbGVf
aWQ/DQo+ID4gPiANCj4gPiA+IFRoZSB2bV9iaW5kIG9wZXJhdGlvbiBoYXMgYSB0aWxlX21hc2sg
dGhlcmUuIFNvIG9uIHRoZSBxdWVyeSBndCBoZXJlDQo+ID4gPiB3ZSBtYXliZSBvbmx5IGluZm9y
bSB3aGF0IHRpbGUgdGhhdCBiZWxvbmdzIHRvLCBzbyB0aGUgdXNlcnNwYWNlDQo+ID4gPiBjYW4g
Y2FsbCB0aGUgdm1fYmluZCB0byB0aGUgcmlnaHQgdGlsZT8NCj4gPiA+IA0KPiA+ID4gQW5kIGxh
dGVyIGlmIHRoZXkgcmVhbGx5IG5lZWQgdGhlIGRpc3RhbmNlIHdlIGludHJvZHVjZSBzb21ldGhp
bmcNCj4gPiA+IGxpa2UgdGhhdCBpOTE1IGRpaSBmb3IgcXVlcnkgZGlzdGFuY2U/DQo+ID4gPiAN
Cj4gPiA+IEFub3RoZXIgdGhpbmcgdGhhdCBjb25mdXNlcyBtZSBoZXJlIGlzIHRoYXQgbWVtX3Jl
Z2lvbiBxdWVyeQ0KPiA+ID4gZG9lc24ndCBoYXZlIGFueSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
dGlsZS1wbGFjZW1lbnQgYnV0DQo+ID4gPiBqdXN0IHRoZSB2cmFtIHZzIHN5c3RlbSB0eXBlcy4u
Lg0KPiA+ID4gDQo+ID4gPiBTaG91bGQgd2UgYWRkIHRoZSB0aWxlX2lkIHRoZXJlIGFzIHdlbGw/
DQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IEFsc28gcy9tYWtzL21hc2svIGluIHRoZSBrZXJu
ZWxkb2MgeW91IGFkZGVkIGhlcmUgKGFuZCBpbiB0aGUgb25lcw0KPiA+ID4gPiBiZWxvdykuDQo+
ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IFJvZHJpZ28uDQo+ID4gPiANCj4gPiA+ID4gDQo+
ID4gPiA+IA0KPiA+ID4gPiBNYXR0DQo+ID4gPiA+IA0KPiA+ID4gPiA+ICsJLyoqDQo+ID4gPiA+
ID4gKwkgKiBAc2xvd19tZW1fcmVnaW9uczogQml0IG1ha3Mgb2YgaW5zdGFuY2VzIGZyb20NCj4g
PiA+ID4gPiArCSAqIGRybV94ZV9xdWVyeV9tZW1fdXNhZ2UgdGhhdCB0aGlzIEdUIGNhbiBpbmRp
cmVjdGx5IGFjY2VzcywgYWx0aG91Z2gNCj4gPiA+ID4gPiArCSAqIHRoZXkgbGl2ZSBvbiBhIGRp
ZmZlcmVudCBHUFUvVGlsZS4NCj4gPiA+ID4gPiArCSAqLw0KPiA+ID4gPiA+ICsJX191NjQgc2xv
d19tZW1fcmVnaW9uczsNCj4gPiA+ID4gPiArCS8qKg0KPiA+ID4gPiA+ICsJICogQGluYWNjZXNz
aWJsZV9tZW1fcmVnaW9uczogQml0IG1ha3Mgb2YgaW5zdGFuY2VzIGZyb20NCj4gPiA+ID4gPiAr
CSAqIGRybV94ZV9xdWVyeV9tZW1fdXNhZ2UgdGhhdCBpcyBub3QgYWNjZXNzaWJsZSBieSB0aGlz
IEdUIGF0IGFsbC4NCj4gPiA+ID4gPiArCSAqLw0KPiA+ID4gPiA+ICsJX191NjQgaW5hY2Nlc3Np
YmxlX21lbV9yZWdpb25zOw0KPiA+ID4gPiA+ICsJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8N
Cj4gPiA+ID4gPiArCV9fdTY0IHJlc2VydmVkWzhdOw0KPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiAgLyoqDQo+ID4gPiA+ID4gICAqIHN0cnVjdCBkcm1feGVfcXVlcnlfZ3Rz
IC0gZGVzY3JpYmUgR1RzDQo+ID4gPiA+ID4gICAqDQo+ID4gPiA+ID4gQEAgLTI3MiwzMCArMzEz
LDEwIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfY29uZmlnIHsNCj4gPiA+ID4gPiAgc3RydWN0IGRy
bV94ZV9xdWVyeV9ndHMgew0KPiA+ID4gPiA+ICAJLyoqIEBudW1fZ3Q6IG51bWJlciBvZiBHVHMg
cmV0dXJuZWQgaW4gZ3RzICovDQo+ID4gPiA+ID4gIAlfX3UzMiBudW1fZ3Q7DQo+ID4gPiA+ID4g
LQ0KPiA+ID4gPiA+ICAJLyoqIEBwYWQ6IE1CWiAqLw0KPiA+ID4gPiA+ICAJX191MzIgcGFkOw0K
PiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtCS8qKg0KPiA+ID4gPiA+IC0JICogQGd0czogVGhlIEdU
cyByZXR1cm5lZCBmb3IgdGhpcyBkZXZpY2UNCj4gPiA+ID4gPiAtCSAqDQo+ID4gPiA+ID4gLQkg
KiBUT0RPOiBjb252ZXJ0IGRybV94ZV9xdWVyeV9ndCB0byBwcm9wZXIga2VybmVsLWRvYy4NCj4g
PiA+ID4gPiAtCSAqIFRPRE86IFBlcmhhcHMgaW5mbyBhYm91dCBldmVyeSBtZW0gcmVnaW9uIHJl
bGF0aXZlIHRvIHRoaXMgR1Q/IGUuZy4NCj4gPiA+ID4gPiAtCSAqIGJhbmR3aWR0aCBiZXR3ZWVu
IHRoaXMgR1QgYW5kIHJlbW90ZSByZWdpb24/DQo+ID4gPiA+ID4gLQkgKi8NCj4gPiA+ID4gPiAt
CXN0cnVjdCBkcm1feGVfcXVlcnlfZ3Qgew0KPiA+ID4gPiA+IC0jZGVmaW5lIFhFX1FVRVJZX0dU
X1RZUEVfTUFJTgkJMA0KPiA+ID4gPiA+IC0jZGVmaW5lIFhFX1FVRVJZX0dUX1RZUEVfUkVNT1RF
CQkxDQo+ID4gPiA+ID4gLSNkZWZpbmUgWEVfUVVFUllfR1RfVFlQRV9NRURJQQkJMg0KPiA+ID4g
PiA+IC0JCV9fdTE2IHR5cGU7DQo+ID4gPiA+ID4gLQkJX191MTYgaW5zdGFuY2U7DQo+ID4gPiA+
ID4gLQkJX191MzIgY2xvY2tfZnJlcTsNCj4gPiA+ID4gPiAtCQlfX3U2NCBmZWF0dXJlczsNCj4g
PiA+ID4gPiAtCQlfX3U2NCBuYXRpdmVfbWVtX3JlZ2lvbnM7CS8qIGJpdCBtYXNrIG9mIGluc3Rh
bmNlcyBmcm9tIGRybV94ZV9xdWVyeV9tZW1fdXNhZ2UgKi8NCj4gPiA+ID4gPiAtCQlfX3U2NCBz
bG93X21lbV9yZWdpb25zOwkJLyogYml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20gZHJtX3hlX3F1
ZXJ5X21lbV91c2FnZSAqLw0KPiA+ID4gPiA+IC0JCV9fdTY0IGluYWNjZXNzaWJsZV9tZW1fcmVn
aW9uczsJLyogYml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20gZHJtX3hlX3F1ZXJ5X21lbV91c2Fn
ZSAqLw0KPiA+ID4gPiA+IC0JCV9fdTY0IHJlc2VydmVkWzhdOw0KPiA+ID4gPiA+IC0JfSBndHNb
XTsNCj4gPiA+ID4gPiArCS8qKiBAZ3RzOiBUaGUgR1QgbGlzdCByZXR1cm5lZCBmb3IgdGhpcyBk
ZXZpY2UgKi8NCj4gPiA+ID4gPiArCXN0cnVjdCBkcm1feGVfcXVlcnlfZ3QgZ3RzW107DQo+ID4g
PiA+ID4gIH07DQo+ID4gPiA+ID4gIA0KPiA+ID4gPiA+ICAvKioNCj4gPiA+ID4gPiAtLSANCj4g
PiA+ID4gPiAyLjQxLjANCj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IC0tIA0KPiA+ID4g
PiBNYXR0IFJvcGVyDQo+ID4gPiA+IEdyYXBoaWNzIFNvZnR3YXJlIEVuZ2luZWVyDQo+ID4gPiA+
IExpbnV4IEdQVSBQbGF0Zm9ybSBFbmFibGVtZW50DQo+ID4gPiA+IEludGVsIENvcnBvcmF0aW9u
DQo+ID4gDQo+ID4gLS0gDQo+ID4gTWF0dCBSb3Blcg0KPiA+IEdyYXBoaWNzIFNvZnR3YXJlIEVu
Z2luZWVyDQo+ID4gTGludXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCj4gPiBJbnRlbCBDb3Jw
b3JhdGlvbg0KDQo=
