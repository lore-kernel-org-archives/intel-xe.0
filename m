Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD07DC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABEE10FA64;
	Thu, 21 Mar 2024 19:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5QVuGUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A4610FA64
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050306; x=1742586306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eL2duZx8N0Hc6SzMSvSrLNJn8Z9fvxWX1k5IrV51mMc=;
 b=O5QVuGUoyWtOJzJt98ouXukIaQWmyDWYsxEG/ztpBsA7AsMfFwt/moh+
 a3bTlPTykraniWAWmvELlqfCmBLwQeprNAPV/8G8BIeHcbH2NMR8DXXgQ
 nSmAXc/JCexzZPPB1aLlK4wN/DaDuQdys7Dr4hiCxkAdKFqZGxtxwBCMz
 KfPndIgKsuW+SQMZFe80QdM0LIzaOceyaBhbn1r62lv2R3wPbCXyVroOQ
 R/UO/lVx/zYqZ5uB7cltYJk1y4jBa8bLeRE1L3Mcyg69MNgcXvPBjnkmP
 Kmx139sSilVEcnWOoaRZuoD3USSq/NZv73wNEzFb/8MLPvrmM1fopJCqP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28540576"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="28540576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37754736"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:45:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:45:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:45:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdprUEsUFtKMLXtsFH7eQokHykjeJMZMaEo/JFUrBXed7o6zYH9i9Xk2AT6Q918UgrwbqhunZVq4ELb5SPFxwStL94uo3of8cVo3BYKh3DDfuDKvP7ZM9Wis6mRzBPdLzZADpNVz+wZoMOVQf7FcTzrgtcaBx2fw6QyPg3C01+qXivfFNeQEqlLIezKNrXCbAfKZy+RnfU6NL/5waZoPQcVvEPRRJYA6RFf2IjFMal+r/2y7map5c031Uwg9sidnHyp9CWa+Bu7UariqPDK7jFBugg2bc3JtOv6oEUJ27XnpEWZuisT4V4x2rRxw3KchKOOoe7UYaaaRJMHuzQjmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL2duZx8N0Hc6SzMSvSrLNJn8Z9fvxWX1k5IrV51mMc=;
 b=QUmzOMllURVronmX1BoLpoWMKtaLDd5j9ys2Jgo7dfM74rfhQTHW1lH915MA5GSef9aHWJOmZrgIgNZgC0zHn6dw6MFnyth32PMAHPBWTHkZ8xqlfpkwJTX6C7BMd354FxKKtFF5iA6hTfu+itQvv9RrUvNEyHdbejDuXxGY+As/lqIJRuv2TOLSSYUkR1Lq3FVM6B+VJfrhQE7i0nM9EtVn+Lw9VYfy18eA9CI57pCLuoCMbRMIeZodx7EY3KAoeCjF/d6QlNxvT1ugnRhDVi72tyuGfq3O9wuxeWnVwgXO+lVZCoV0EM2GYys+LQXFr9Fi4kgzW5WT0prd0ttJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Thu, 21 Mar
 2024 19:45:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 19:45:00 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Topic: [PATCH v2] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Index: AQHaeoTLjwGRqkCObE+jxHOhmbcK+7FCm3kA
Date: Thu, 21 Mar 2024 19:45:00 +0000
Message-ID: <48c1d7d3274c2934325e83748ea13388615646bb.camel@intel.com>
References: <20240320052239.3249222-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240320052239.3249222-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB8277:EE_
x-ms-office365-filtering-correlation-id: eb6d1406-7c26-4d32-7ac0-08dc49df657b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bHVVy2nh+nKaLiVLkqe1UYPqbeCWtayNxMNoSjzyuXqZz+5MKbR/iJNU00TjGqw9pHorRDgV3t6cgD2a64Vrg2n/zetFDK8AgYpaJh5gcB/GuL8Mwni1yWxv4WXIjTz70iMH0hDLs72f3W28GVJ2waKPuq8bF2RVX07tWtbGDMgiIl238NtI+MuyvVfrSTMz1hKDt45wHsvQP6DZ2OuhefpX6Xr1YFa8AlJc9/jcbKfpcoNC/bwrqzocXUtl9v3PuRXSif1XyEquIsng0jBtHzaIDHzlwrf7Y060i7es/LXy7/Xb5rgG/Mw/dbs+vMPFTbISbVyq/0PMDwNhsGroD6B2uvBuF2kfwNlqCvtyAh4g0CqtnAfO8EuwrpheZhwbTtrcIIhC6n1IxzszcORB4Sc7NX/8X8cha3Uca79B9q4a2uMectEwuLi7L02flCsIDwiuns1Kcu9Nmd/b8EYuCcToWmlqJ592uNhWNfoUzD428FsKtBwMk6McpmqGQBOaBAY1eK6iCdF/JdNXZPzAYMfET3eEfWtoPNM5R5CAfAu3YejVCjGallN6cLHW7DplRL9y/7To8Pp/7QbT+5sV2D59n5M6D2wpK6AV84w0m11cItqzosbhn5+OdSpOD4333Q0nsSGw9soJQLXZ+fku76BfulFSZ7d+9G8zh8LbXcewWQFrUWOywdppVTnqGw4ciujGqy7SzIdwB/0txdledg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzVvdHZyKzNRUEkwVFhOS0ZmMjE1M2NtZW5UMW1WbHBhbTBjWmtDekpxQnhW?=
 =?utf-8?B?YUl5TFN4bFpoQ2FVNGZxRlBCNFF6a1AzWEMzcnUrL0JKbGF0cE5zT0xqeDZm?=
 =?utf-8?B?YnN1a0h5em0ralZycmd4a1kybmhjMVhYWnFvdzR1RERwZnk0dVVkaTV6ZVph?=
 =?utf-8?B?M1JKM21oK2RucXpMTXJ1dE1ZSlRKNzR4WXhPeGc5S3RmdUxDMkNiTUNadGw3?=
 =?utf-8?B?TWp6NlFKUlFxRHZSYnBWVjRuTzRhZTJmQm9udlNtamxpdDFIdURZT1o1YUZS?=
 =?utf-8?B?ZTVtbjFlVUorRlpHalFBbzVQRFNIeDg1czdLQjJ2ZitKQmc2bm1pZUVDa2dm?=
 =?utf-8?B?OEFidDRqSXVmN3QzOEFpeU5icW53anYyMWpDL1lwbE1aVWhCSmwxa3VvN3Z0?=
 =?utf-8?B?WjU3N0R6SlA4RDhvN2xZeERiSGVPamhiUW9VanQ3UEhPRk16NFYwUUVYZ0VX?=
 =?utf-8?B?SzFWU2t4VDVnbXVTQ21ydzhHU01GMVNmZ0Q5MGNldzFwRmxUVTV5T3l3VnJx?=
 =?utf-8?B?MjFQQ25NSTFCdi9Ec3dWcE9sYk9JY2U0Z3M4ME1qeGRRbHNoQm82MFdkL0NO?=
 =?utf-8?B?NnNiWXBVeWEySUUvcTRxQlJKSno3SEM1U3ova0xNazhnRFlhbGJRRnJ4VVg5?=
 =?utf-8?B?cjVxeFNndHhOY1BZZVdaNE9hOEk5QWNkQi9lYW9IOWxVM2RRaWo1cnB6M05U?=
 =?utf-8?B?ckZnUjJnQ2tQMGRPSlQvQUJYUGxOdDcxR1c3WWZkamMrTC9ReW95OWZqZGVO?=
 =?utf-8?B?a3c1a1dmL2M4U2hpUmVldmdXaVVDWHdJNEtUUExNeXY5dytXeGFjWDRCN3ky?=
 =?utf-8?B?M0Zzek95OEtHTHV1Sml3NXBRbmM0QUZNNUFMYXVNR2I0OXorOGoyN0pzTUZk?=
 =?utf-8?B?SFRwWThSYWZObktUQzlaZmJRcmE1MTdvTmc3RzJUT1YxZ0VyQUJlN01ZVHVu?=
 =?utf-8?B?YTkzYmRQR1M4M3Zmb21rbVlWVnQrUlJGRkh1R3dVbnJwa3RyUXIwVzZWT1NS?=
 =?utf-8?B?Y0JhM3FLTEtOOTR2eklpakwxU3Q3RGs3MUhMN2NqLzFKT0EzKzh1ajVnbVRY?=
 =?utf-8?B?T2Q5MXQxVEVrRkMreE84QmNtbWsrbG9Zb0hXTmNjdENqbnhhdHl1K0J6ZnNp?=
 =?utf-8?B?MUhabWF2bkpMMmdnUUVJSmdjN3cyZVE1SVhvSHZzaE90MFBMb3Zvam5vVmJo?=
 =?utf-8?B?ZS9ZN1A1a2djL0lUQW5ieUIzaFpkYkZhVlBVYnhKZ0IyUXVBd1J2N1Q3eUt5?=
 =?utf-8?B?QWhYZTlmQzJsNW1WcEZIcEc2bDY4Y3VMZXpZbDJGR256emcvMVZ1SllWTm9h?=
 =?utf-8?B?U2RRU245WjdzeUNSUU1WYWwzSHM0d0RnNnJSYWhVaktDSTg0WVp4c3hkajJZ?=
 =?utf-8?B?UHp2MHRtZ2J4NTJPSTVMWE84aFVNc1VMcFZYUHJrQkVDV2FQZjI1U1E3S21w?=
 =?utf-8?B?a1VXSUYzVTdYdXRJMzJKQWNiR3g5UnV5clROekNyMzlwOWxDWk53YkNQOWVF?=
 =?utf-8?B?RkJIdms2RjNCU08rTlFVZUUrQ0tCaTd2WlloYXY4bWZiYWxuRGxjSGhUUFVW?=
 =?utf-8?B?ZFdFbjV3Q21HdWFiMlgwMFpqVG5EM3c4REZmUWo4ckZVY1QwdytJcHkxWHU0?=
 =?utf-8?B?QllmMGd2SUplUS9GVG9UL3QrNjdkdXJyOGlhVUdXMktjcW1lOWFVZFVPd1Jq?=
 =?utf-8?B?T3BaNW1zV2M1U2doVGxwbnpmdUJTaWZyOG0vSlhaeVJTSGZzL1d3K1UxUzg1?=
 =?utf-8?B?a3RMcmhMd2RiSStKT3IrYmlmT1lBWkJ5N2JBaVVnQk9tYVdDVEdndGdIY3oy?=
 =?utf-8?B?TDRxdnRVVUtmTzNOT3RQQmFoSUtvbGwzalN2SnJrMGNzTDRJQTVkSCtqV29Y?=
 =?utf-8?B?MTRXTHE3eEZnWVQ4NnlCcEpCMWprZG9haG1velQ1ZEV2dC9WWXk3dFMxdnF3?=
 =?utf-8?B?SkdRdWYxL3N6ZU9kWFJLdUpLWkNMVDdFUkxMRm90TTloa0lIOFQ3Wnd1NUFS?=
 =?utf-8?B?WEY5ekNiU3NCOHVtRy94aVZ6RHVHbFk5SkZHbzBTUkxPNG0yU0g5NWlzNWhl?=
 =?utf-8?B?VVdMNG1rS2JacCtNUmorNjcvNlpiSzFBV3kvK0VQZ2lsRTFoU1J6WlcxQXJW?=
 =?utf-8?B?TCtqMlV4TlZqeXh6dkFRL3NzeVMvZCtlV0RTbmlDT1UrTFhEVytGNTBTRzZ6?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B18AE5A1FFB07149AB791E6B171BA504@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6d1406-7c26-4d32-7ac0-08dc49df657b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 19:45:00.8499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFEEoI7c6jbK/QTfhE4Y2XaEBmtF+VawiclXP/8X0j4+QfAum4d7E4wbZDFrox2IOoRSK7us0PDnckPtcQ9tTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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

T24gV2VkLCAyMDI0LTAzLTIwIGF0IDEwOjUyICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IERlcmVmZXJlbmNlICdjb3JlZHVtcCcgdG8gYWNjZXNzICd4ZV9kZXZjb3JlZHVt
cF9zbmFwc2hvdCcgb25seSBpZg0KPiAnY29yZWR1bXAnIGlzIG5vdCBOVUxMLA0KPiANCj4gdjIN
Cj4gLSBGaXggY29tbWl0IG1lc3NhZ2VzLg0KPiANCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIHwgMTEgKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCAwZmNkMzA2ODAzMjMuLjgzYTFmM2NkMzdjZiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gQEAgLTc0LDE3ICs3NCwyMCBA
QCBzdGF0aWMgc3NpemVfdCB4ZV9kZXZjb3JlZHVtcF9yZWFkKGNoYXIgKmJ1ZmZlciwgbG9mZl90
IG9mZnNldCwNCj4gIAkJCQkgICBzaXplX3QgY291bnQsIHZvaWQgKmRhdGEsIHNpemVfdCBkYXRh
bGVuKQ0KPiAgew0KPiAgCXN0cnVjdCB4ZV9kZXZjb3JlZHVtcCAqY29yZWR1bXAgPSBkYXRhOw0K
PiArCWlmICghY29yZWR1bXApDQo+ICsJCXJldHVybiAtRU5PREFUQTsNCj4gKw0KPiAgCXN0cnVj
dCB4ZV9kZXZpY2UgKnhlID0gY29yZWR1bXBfdG9feGUoY29yZWR1bXApOw0KPiArCS8qIE91ciBk
ZXZpY2UgaXMgZ29uZSBhbHJlYWR5Li4uICovDQo+ICsJaWYgKCF4ZSkNCj4gKwkJcmV0dXJuIC1F
Tk9ERVY7DQo+ICsNCj4gIAlzdHJ1Y3QgeGVfZGV2Y29yZWR1bXBfc25hcHNob3QgKnNzID0gJmNv
cmVkdW1wLT5zbmFwc2hvdDsNCj4gIAlzdHJ1Y3QgZHJtX3ByaW50ZXIgcDsNCj4gIAlzdHJ1Y3Qg
ZHJtX3ByaW50X2l0ZXJhdG9yIGl0ZXI7DQo+ICAJc3RydWN0IHRpbWVzcGVjNjQgdHM7DQo+ICAJ
aW50IGk7DQo+ICANCj4gLQkvKiBPdXIgZGV2aWNlIGlzIGdvbmUgYWxyZWFkeS4uLiAqLw0KPiAt
CWlmICghZGF0YSB8fCAhY29yZWR1bXBfdG9feGUoY29yZWR1bXApKQ0KPiAtCQlyZXR1cm4gLUVO
T0RFVjsNCg0KQWxsIHZhcmlhYmxlcyBtdXN0IGJlIGRlZmluZWQgYmVmb3JlIGFueSBjb2RlLg0K
DQo+IC0NCj4gIAkvKiBFbnN1cmUgZGVsYXllZCB3b3JrIGlzIGNhcHR1cmVkIGJlZm9yZSBjb250
aW51aW5nICovDQo+ICAJZmx1c2hfd29yaygmc3MtPndvcmspOw0KPiAgDQoNCg==
