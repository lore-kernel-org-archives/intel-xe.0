Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102CFC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C657610EC25;
	Mon, 22 Jan 2024 18:03:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749CF10EC25
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705946602; x=1737482602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ahrw1HxqR/6lwr4ElPetW9yYKCycNOitp4PZ1279rJE=;
 b=eIDyaA397+I+i4NZGY1SKtIbyE9YybnDgcp3QRuJOWseIss9BA7Ny0x1
 Y5dV1lBv/CMHwA0d/4HJ8RFBq7gAvBs0aDl3JXuHh3xY0A1HkFN38SN0d
 FjHWCOZFAxCkEWCvgGsObwvogDI5wt7yAj6uiUpAuHh9KNMQ89b7zU3lf
 q8opl1pXeRBE6zz2fyEYyGBzXG9ftzIjR+abbHsNqes7R0v2uI+n58FUF
 6XzFVTsiHUJzHQdkV0cAOpVD7wsneR5LDaGy1YUpAAXnWLArWwlsBk3Kb
 UoAH5Ks8VoVTq2MNjaXn++MDWWU0vwipxMzUjED6jWm9w3VVjJx805oJb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14626321"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="14626321"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 10:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1375343"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 10:03:18 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:03:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:03:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 10:03:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 10:03:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5kc3zYqamHC2+WX2k/laikBo8LOOWKAkBxr5tsQVk8OM3NY1ckoj72GYlnlSFVPIce7C34HmCoIUtJA87RQiP2ZnwsFc9GbTrNY8fWS93BHZOFtXxcKTJyYgjWwdNkiNlByOO890e2aTuPtDTMfAPdxKETONlENYCzXfoHEcULl6sVvNyNAkPn+laLoetB9RgUYjWfFVGPYwze4GkwiXn193SvtuIOFddfnB/2JoxEiCGmlnZvT8ZkqA4+kJOruiwmyu83rWqx2SFpDXqGWPLymn/7+DFffVDyS7p2XFk7HSEIsq57sadgvV75bO/5E9BAKQeCP/LaWpxfa8tdxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahrw1HxqR/6lwr4ElPetW9yYKCycNOitp4PZ1279rJE=;
 b=jdppY5XSNifHHBgT+xsDa+8AdRTmQVFu+Ae7BAbV8SNYgkmrYF6MJ7MRkcd8ffKbIJLkYuqueWPE1E6ojgnDLoXMLN3GtikZ8kgnnmpbAK+x9thYNbc6GVohUCX62N8YZdU2RpGSD3j1W5J3VdGfiaq3xyEn25LnptmUWqGJjd1Y2xtvH1k+MFf6lR+1I0Ue0qFYd1H8GZW+d2WdzR6JLydBw3aHdYYJViq2lfn1Yl3snDVSLqf4baJcbwlU+3WZ4v5POnu3G3SsOU1golPd4T74Of8IWL5Oh1t5eQl60yn+ziQjzYBhiOeATZ0bi2sx8COcGXZH9CDby3vX4r9jnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 18:03:08 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 18:03:08 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Maarten@mblankhorst.nl" <Maarten@mblankhorst.nl>
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Implement VM snapshot support
Thread-Topic: [Intel-xe] [PATCH 4/4] drm/xe: Implement VM snapshot support
Thread-Index: AQHaBnTl2GZDq+DBU0Cw427HsUR/RbDmrZSA
Date: Mon, 22 Jan 2024 18:03:08 +0000
Message-ID: <07570cab857b4b162487e643778158cadb164378.camel@intel.com>
References: <20231024122256.19512-1-dev@lankhorst.se>
 <20231024122256.19512-5-dev@lankhorst.se>
In-Reply-To: <20231024122256.19512-5-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: 16c679f7-4198-4864-11fa-08dc1b7463f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KjfIR+lJy/kE54fGysQo+GOa+VkuwbRbWIfrVtwMjZ48gwYJmq/UBN6yAcKFXglpM7lQav2wPI8eKioCx76r7xJeUD2d7YhBx8oh9rFFFLn8bYqYRForm6e+vrnb5/1RMGpAjORrMSOdVkn9QXvOdNIIbT46H1HJL4XcBKvK05xl0awgiG5oZyJ/kvXTr0MNLpfm7QQgBvkAe3DXZun5jdHKocc9RdMxVYSyd14apWgjOjASifO6HoazbFAt+mf4RT6ASOvBQtLYXbcpcsZWE000J0bTSQtz9GzDGdncs2cIFlAiNRWbPaGV626xRp9kcQFp+bxrzrdGm2CugcblbRpFIqV4gJj6X/xerAChdzWVWDE0PJdk8p81t6uof6TbEmHTRtuCeHs3iLt3GhedpFlF7sulCGXKu1WTAlFqXe0KwIx7brOdPbnkzKHVMWH4TOaCp1s2fDyC/VasPBzx46YYttlRp+Y0YLkJOkDoMZl6nrIY48O6jyxrrrff/21vMqJL1DgT6u9KSkodNPRwf5FJwNJTrn48PygWZWb7FpyTAfxJI1y6VDoWaFsNiBhUX1JrBRyGuoWB1c3dsYTsYk7zY/JkkN5kAtkIIbWD37t9kdhbZ3530RERiSgrmFwl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(6506007)(71200400001)(6512007)(2616005)(38100700002)(122000001)(86362001)(36756003)(82960400001)(38070700009)(41300700001)(4001150100001)(6486002)(83380400001)(5660300002)(2906002)(8936002)(110136005)(4326008)(66446008)(8676002)(66476007)(64756008)(478600001)(76116006)(66556008)(91956017)(316002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUhsWm1qK2RxL2NnNXFGUTJGczFiVGJSUVBDNHFSSHBUOVhqaVpxcHdMeGk1?=
 =?utf-8?B?cTNBMW94Y1Q2S1U2L3BkZEhrV2xxQmp0MVdWOXFDSXRKbEJlOHBSNlZVRGpY?=
 =?utf-8?B?Q0R4V3k1MW1DZVJEck5aWm0vczhCRjZUU0xCSGx6emxzVjF3Z2d0SkxQU1Nl?=
 =?utf-8?B?YnMrTkZIZmtiYUwyS25NWVhPc2MzTzdwWW5yaENMcDgrNmYxZkY4WXdROTNr?=
 =?utf-8?B?NEpSUGhtMUIzRUhKT252ZTlEakNlS1huZDlFdFZRUkpQWmZDUGZ2aDVNaXpv?=
 =?utf-8?B?NGVlcGhTTllwV2ZYZVNadWZ4ZlBFRnErTmRiMUpNckpOM0lxTTE1OUtCV2RF?=
 =?utf-8?B?bGpxVVVST0RqLzlxQmRFWDdteEtrelNIWFJpbWhpZ0JJdjdDUFN3SHBPSXl6?=
 =?utf-8?B?M3pOS0RtV2p0S0NReDBRQ3ZqQlN1RE1tR05Lb1ArekJHTTQ3YXAyRmhKNlVG?=
 =?utf-8?B?YVdtb0ZCMWR6RElOMlhtZEcweWJ4VW1CZEN4U2FrU3Y3aHZtVHJLQmhHbFg1?=
 =?utf-8?B?QUFyVGlvMTdIUnNVdk5XWmIyeDByL1pVWTNZRTE5MWRISUFJQ3lPbGtyUnlI?=
 =?utf-8?B?YzdWS0t2WWRCZldOWXYzdm12VnJFNTNtK2dGQXZsMm1mVjg4WUFJb0RMS0tj?=
 =?utf-8?B?dUlUdldKMDhDR1VtWU9mNkpmeEpaUG5DM0pGdWtxTnBIMDVuUGVMRTVkSHJ6?=
 =?utf-8?B?a2pYWEU5U1N2ZHRYRDN4WVI5WFZiSjlYLytzNFByVXUzQ2s1ZzRBQ08zYisx?=
 =?utf-8?B?UWFMWDArMGtwc3paSmZWOEF6bU1UcmtZSXp6djVtbmJpRy9JbUlQREszUnNY?=
 =?utf-8?B?cmJqRHBPVUZrZk1RNGNPT1R5dlpvZ3lNOHpXbVF5Yis4Mk1mWFJXZFNiNVU3?=
 =?utf-8?B?SUFPaGpFRW01RUlxZjlJNTdOUG1SZmtzdHFJaXBqVkdiRnFTKytmTHdONUhz?=
 =?utf-8?B?STM1ZDByZzZwN0pEdngzRTlTZVk5RnlGYkhubnRaWmcvRWhHUC9wVXM1NW1P?=
 =?utf-8?B?WXVkeGhLSFRCdmFWOW55V3NWUEp0cG1KWnEyUXhKTHJoUDNtTWp5NWFpYVAv?=
 =?utf-8?B?dkVjbUFrczhqdUpFWjNzMXNtSW9zbmFBMnBNYlZoWkFXanQ2Y01Jb0hyZlMr?=
 =?utf-8?B?QjJ4eHROTE1WUHpxZGlZMjJ6bklJTTVOdFBiR1IxYkozeHJ0Ym5yTWdWN1oz?=
 =?utf-8?B?VmU1NnJZSkFSc1cvRVlpazF0SGdacEtkUFM3bzcvL1VscWx5bnRmS2I0SHdG?=
 =?utf-8?B?S0xoVU9xcHQzZ1FTbHdnengrc2dJK3ZFLytGZWpjZ0JaYVBPVjJrTTlRTFY2?=
 =?utf-8?B?bTNPM2NhQUgwVVk0TTlpeEU4QXh3eThndmZ3a3doNWx1TjJ5YjQ2Y0MzU3Zj?=
 =?utf-8?B?dUkwRVloNGI4YUsvWk8rMmplQ3Q2dlJoV3U2cUdBdjJwQkU1UUZ5ZVBhTi96?=
 =?utf-8?B?emREbEdFM1dhNVdSZ3N6MTVqcEZJNU12RE42L0JQNlJDR2NpWnk4b1k1VXdo?=
 =?utf-8?B?TGpBeUx0S01ESTBPR3k2cHQwRU5tNURVb0p3bTdORUM2MFB5OUtRMFFXS3pH?=
 =?utf-8?B?QWExTm8yWDlvOFNaa3NHWmdSek9kR3E4VlErcEt1a3BWcVp4YUgzeHpsOXI4?=
 =?utf-8?B?UlJJS2t3TGVnTFNnd2VlYXB0eS9xS1BObVlRS3hrZTd2cjN0cm1rNU5TSmxa?=
 =?utf-8?B?dERFTm1HaVlKc1NlcTlkaVlrUkk3M0ZOS3gxYXFsTSsvY1RYR1N6T3RrdDhT?=
 =?utf-8?B?dFVuQlJNeU1CQ1BwMDQ5TnlGTkR1bUcwTk44ekZOTCtqSzJ3UEZhZjlJdXZq?=
 =?utf-8?B?N241SEZGNUk5WnJLeDZPU0lBbFk3Q3U5K3FNUWJWdGphUUFHQWE1a3c0N3FU?=
 =?utf-8?B?R1Z4NGpqcGRMeExHV2VzRW1KUjIxbGRXMm1rRWJyemtITVR4VzM1ZUVNaHM1?=
 =?utf-8?B?MnRSOUlMaktvWWIrb2FBcXdhSHVYcUhlV3plWkdCcGcxU043UFN6bjRsWXlU?=
 =?utf-8?B?V0ZQQ09XcG9MdXJXZGNsVUtCZ2JjTldGcnRRb3REU2pXcWM0TG8zYlAxaE9t?=
 =?utf-8?B?ZFI0RXJzYnhoNk9wT2RjQWE5NE96cVZ6VmRrTmptTjVaRUZxd25ERk5KYVFa?=
 =?utf-8?B?WlNZcGpHOGFGZytzQ29rakZhWjRnMllMb2l4ZEtiVENHazk1V2lkQXhIUDV2?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A258F38643D80848B5A6E6C7665C9CAC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c679f7-4198-4864-11fa-08dc1b7463f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 18:03:08.6254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3kdgD9OSFJoWjObhXppVxkBcgAcHzsGh1PxIMbMc4gqFx2/sVgxo8VclVaBQLkGF+gj12zjqEOKdMNVkEjqZbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTI0IGF0IDE0OjIyICswMjAwLCBNYWFydGVuQG1ibGFua2hvcnN0Lm5s
IHdyb3RlOg0KPiBGcm9tOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jICAgICAgIHwgICA5
ICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMuaCB8ICAgMiAr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICAgICAgICAgICB8IDExMSArKysr
KysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCAgICAgICAg
ICAgICAgICB8ICAgNCArDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCA2OGFiYzBiMTk1YmUu
LjI5OGJlMTYyZWQwYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNv
cmVkdW1wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4g
QEAgLTE2LDYgKzE2LDcgQEANCj4gICNpbmNsdWRlICJ4ZV9ndWNfY3QuaCINCj4gICNpbmNsdWRl
ICJ4ZV9ndWNfc3VibWl0LmgiDQo+ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+ICsjaW5j
bHVkZSAieGVfdm0uaCINCj4gIA0KPiAgLyoqDQo+ICAgKiBET0M6IFhlIGRldmljZSBjb3JlZHVt
cA0KPiBAQCAtOTgsNiArOTksMTAgQEAgc3RhdGljIHNzaXplX3QgeGVfZGV2Y29yZWR1bXBfcmVh
ZChjaGFyICpidWZmZXIsIGxvZmZfdCBvZmZzZXQsDQo+ICAJCWlmIChjb3JlZHVtcC0+c25hcHNo
b3QuaHdlW2ldKQ0KPiAgCQkJeGVfaHdfZW5naW5lX3NuYXBzaG90X3ByaW50KGNvcmVkdW1wLT5z
bmFwc2hvdC5od2VbaV0sDQo+ICAJCQkJCQkgICAgJnApOw0KPiArCWlmIChjb3JlZHVtcC0+c25h
cHNob3Qudm0pIHsNCj4gKwkJZHJtX3ByaW50ZigmcCwgIlxuKioqKiBWTSBzdGF0ZSAqKioqXG4i
KTsNCj4gKwkJeGVfdm1fc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90LnZtLCAmcCk7
DQo+ICsJfQ0KPiAgDQo+ICAJcmV0dXJuIGNvdW50IC0gaXRlci5yZW1haW47DQo+ICB9DQo+IEBA
IC0xMTYsNiArMTIxLDcgQEAgc3RhdGljIHZvaWQgeGVfZGV2Y29yZWR1bXBfZnJlZSh2b2lkICpk
YXRhKQ0KPiAgCWZvciAoaSA9IDA7IGkgPCBYRV9OVU1fSFdfRU5HSU5FUzsgaSsrKQ0KPiAgCQlp
ZiAoY29yZWR1bXAtPnNuYXBzaG90Lmh3ZVtpXSkNCj4gIAkJCXhlX2h3X2VuZ2luZV9zbmFwc2hv
dF9mcmVlKGNvcmVkdW1wLT5zbmFwc2hvdC5od2VbaV0pOw0KPiArCXhlX3ZtX3NuYXBzaG90X2Zy
ZWUoY29yZWR1bXAtPnNuYXBzaG90LnZtKTsNCj4gIA0KPiAgCWNvcmVkdW1wLT5jYXB0dXJlZCA9
IGZhbHNlOw0KPiAgCWRybV9pbmZvKCZjb3JlZHVtcF90b194ZShjb3JlZHVtcCktPmRybSwNCj4g
QEAgLTE1MSw2ICsxNTcsOCBAQCBzdGF0aWMgdm9pZCBkZXZjb3JlZHVtcF9zbmFwc2hvdChzdHJ1
Y3QgeGVfZGV2Y29yZWR1bXAgKmNvcmVkdW1wLA0KPiAgDQo+ICAJY29yZWR1bXAtPnNuYXBzaG90
LmN0ID0geGVfZ3VjX2N0X3NuYXBzaG90X2NhcHR1cmUoJmd1Yy0+Y3QsIHRydWUpOw0KPiAgCWNv
cmVkdW1wLT5zbmFwc2hvdC5nZSA9IHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2NhcHR1cmUo
cSk7DQo+ICsJaWYgKHEtPnZtKQ0KPiArCQljb3JlZHVtcC0+c25hcHNob3Qudm0gPSB4ZV92bV9z
bmFwc2hvdF9jYXB0dXJlKHEtPnZtKTsNCg0KTGV0IHhlX3ZtX3NuYXBzaG90X2NhcHR1cmUoKSBo
YW5kbGUgdGhlIHEtPnZtID09IE5VTEwgY2FzZS4NCkFsc28gY29yZWR1bXAtPnNuYXBzaG90LnZt
IG5lZWRzIHRvIGJlIHNldCB0byBOVUxMIGluIHRoaXMgY2FzZSBvdGhlcndpc2UgaXQgd2lsbCBz
dGlsbCBwb2ludCB0byBvbGRlciBWTSBzbmFwc2hvdC4NCg0KPiAgDQo+ICAJZm9yX2VhY2hfaHdf
ZW5naW5lKGh3ZSwgcS0+Z3QsIGlkKSB7DQo+ICAJCWlmIChod2UtPmNsYXNzICE9IHEtPmh3ZS0+
Y2xhc3MgfHwNCj4gQEAgLTE5NCwzICsyMDIsNCBAQCB2b2lkIHhlX2RldmNvcmVkdW1wKHN0cnVj
dCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiAgCQkgICAgICB4ZV9kZXZjb3JlZHVtcF9yZWFkLCB4ZV9k
ZXZjb3JlZHVtcF9mcmVlKTsNCj4gIH0NCj4gICNlbmRpZg0KPiArDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oDQo+IGluZGV4IDdmZGFkOWMzZDNkZC4uOTNjMmFk
N2JkYzU0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBf
dHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMu
aA0KPiBAQCAtMzMsNiArMzMsOCBAQCBzdHJ1Y3QgeGVfZGV2Y29yZWR1bXBfc25hcHNob3Qgew0K
PiAgCXN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKmdlOw0KPiAgCS8q
KiBAaHdlOiBIVyBFbmdpbmUgc25hcHNob3QgYXJyYXkgKi8NCj4gIAlzdHJ1Y3QgeGVfaHdfZW5n
aW5lX3NuYXBzaG90ICpod2VbWEVfTlVNX0hXX0VOR0lORVNdOw0KPiArCS8qKiBAdm06IFNuYXBz
aG90IG9mIFZNIHN0YXRlICovDQo+ICsJc3RydWN0IHhlX3ZtX3NuYXBzaG90ICp2bTsNCj4gIH07
DQo+ICANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiBpbmRleCBiNDJjYTEwNjljNWIuLjEzNDk0
YzgxZTk2NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gQEAgLTMzMjksMyArMzMyOSwxMTQgQEAg
aW50IHhlX2FuYWx5emVfdm0oc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgeGVfdm0gKnZt
LCBpbnQgZ3RfaWQpDQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gKw0KPiArc3RydWN0IHhl
X3ZtX3NuYXBzaG90IHsNCj4gKwl1bnNpZ25lZCBsb25nIG51bV9zbmFwczsNCj4gKwlzdHJ1Y3Qg
ew0KPiArCQl1aW50NjRfdCBvZnMsIGJvX29mczsNCj4gKwkJdW5zaWduZWQgbG9uZyBsZW47DQo+
ICsJCXN0cnVjdCB4ZV9ibyAqYm87DQo+ICsJCXZvaWQgKmRhdGE7DQo+ICsJfSBzbmFwW107DQo+
ICt9Ow0KPiArDQo+ICtzdHJ1Y3QgeGVfdm1fc25hcHNob3QgKnhlX3ZtX3NuYXBzaG90X2NhcHR1
cmUoc3RydWN0IHhlX3ZtICp2bSkNCj4gK3sNCj4gKwl1bnNpZ25lZCBsb25nIG51bV9zbmFwcyA9
IDAsIGk7DQo+ICsJc3RydWN0IHhlX3ZtX3NuYXBzaG90ICpzbmFwOw0KPiArCXN0cnVjdCBkcm1f
Z3B1dmEgKmdwdXZhOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygmdm0tPnNuYXBfbXV0ZXgpOw0KPiAr
CWRybV9ncHV2bV9mb3JfZWFjaF92YShncHV2YSwgJnZtLT5ncHV2bSkgew0KPiArCQlpZiAoZ3B1
dmEtPmZsYWdzICYgWEVfVk1BX0RVTVBBQkxFKQ0KPiArCQkJbnVtX3NuYXBzKys7DQo+ICsJfQ0K
PiArDQo+ICsJc25hcCA9IGt2bWFsbG9jKG9mZnNldG9mKHN0cnVjdCB4ZV92bV9zbmFwc2hvdCwg
c25hcFtudW1fc25hcHNdKSwgR0ZQX05PV0FJVCk7DQo+ICsJaWYgKCFzbmFwKQ0KPiArCQlnb3Rv
IG91dF91bmxvY2s7DQo+ICsNCj4gKwlzbmFwLT5udW1fc25hcHMgPSBudW1fc25hcHM7DQo+ICsJ
aSA9IDA7DQo+ICsJZHJtX2dwdXZtX2Zvcl9lYWNoX3ZhKGdwdXZhLCAmdm0tPmdwdXZtKSB7DQo+
ICsJCXN0cnVjdCB4ZV92bWEgKnZtYSA9IGdwdXZhX3RvX3ZtYShncHV2YSk7DQo+ICsJCXN0cnVj
dCB4ZV9ibyAqYm8gPSBnZW1fdG9feGVfYm8odm1hLT5ncHV2YS5nZW0ub2JqKTsNCj4gKw0KPiAr
CQlpZiAoIShncHV2YS0+ZmxhZ3MgJiBYRV9WTUFfRFVNUEFCTEUpKQ0KPiArCQkJY29udGludWU7
DQo+ICsNCj4gKwkJc25hcC0+c25hcFtpXS5vZnMgPSB4ZV92bWFfc3RhcnQodm1hKTsNCj4gKwkJ
c25hcC0+c25hcFtpXS5sZW4gPSB4ZV92bWFfc2l6ZSh2bWEpOw0KPiArCQlzbmFwLT5zbmFwW2ld
LmJvID0geGVfYm9fZ2V0KGJvKTsNCj4gKwkJc25hcC0+c25hcFtpXS5ib19vZnMgPSB4ZV92bWFf
Ym9fb2Zmc2V0KHZtYSk7DQo+ICsJCWkrKzsNCj4gKwl9DQo+ICsNCj4gK291dF91bmxvY2s6DQo+
ICsJbXV0ZXhfdW5sb2NrKCZ2bS0+c25hcF9tdXRleCk7DQo+ICsJcmV0dXJuIHNuYXA7DQo+ICt9
DQo+ICsNCj4gK3ZvaWQgeGVfdm1fc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX3ZtX3NuYXBzaG90
ICpzbmFwLCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9uZyBp
LCBqOw0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IHNuYXAtPm51bV9zbmFwczsgaSsrKSB7DQo+
ICsJCXN0cnVjdCB4ZV9ibyAqYm8gPSBzbmFwLT5zbmFwW2ldLmJvOw0KPiArCQlzdHJ1Y3QgaW9z
eXNfbWFwIHNyYzsNCj4gKwkJaW50IGVycjsNCj4gKw0KPiArCQlpZiAoc25hcC0+c25hcFtpXS5k
YXRhKQ0KPiArCQkJZ290byBwcmludDsNCj4gKw0KPiArCQkvKiBDYXB0dXJlIGRhdGEsIGJ1dCB0
cnkgb25seSBvbmNlICovDQo+ICsJCWlmIChibykNCj4gKwkJCXNuYXAtPnNuYXBbaV0uZGF0YSA9
IGt2bWFsbG9jKHNuYXAtPnNuYXBbaV0ubGVuLCBHRlBfVVNFUik7DQo+ICsJCWlmICghc25hcC0+
c25hcFtpXS5kYXRhKQ0KPiArCQkJZ290byBrdmZyZWU7DQo+ICsNCj4gKwkJLyogVE9ETzogTG9j
a2luZywgVk1BUCBtYWdpYyBldGMgaGVyZS4uICovDQo+ICsJCWRtYV9yZXN2X2xvY2soYm8tPnR0
bS5iYXNlLnJlc3YsIE5VTEwpOw0KPiArCQllcnIgPSB0dG1fYm9fdm1hcCgmYm8tPnR0bSwgJnNy
Yyk7DQo+ICsJCWlmICghZXJyKSB7DQo+ICsJCQl4ZV9tYXBfbWVtY3B5X2Zyb20oeGVfYm9fZGV2
aWNlKGJvKSwNCj4gKwkJCQkJICAgc25hcC0+c25hcFtpXS5kYXRhLA0KPiArCQkJCQkgICAmc3Jj
LCBzbmFwLT5zbmFwW2ldLmJvX29mcywNCj4gKwkJCQkJICAgc25hcC0+c25hcFtpXS5sZW4pOw0K
PiArCQkJdHRtX2JvX3Z1bm1hcCgmYm8tPnR0bSwgJnNyYyk7DQo+ICsJCX0NCj4gKwkJZG1hX3Jl
c3ZfdW5sb2NrKGJvLT50dG0uYmFzZS5yZXN2KTsNCj4gKw0KPiArCQlpZiAoZXJyKQ0KPiArCQkJ
Z290byBrdmZyZWU7DQo+ICsNCj4gK3ByaW50Og0KPiArCQlmb3IgKGogPSAwOyBqIDwgc25hcC0+
c25hcFtpXS5sZW47IGogKz0gNjQpIHsNCj4gKwkJCXVpbnQzMl90ICp4ID0gc25hcC0+c25hcFtp
XS5kYXRhICsgajsNCj4gKw0KPiArCQkJZHJtX3ByaW50ZihwLCAiWyVsbHhdID0geyAleCwgJXgs
ICV4LCAleCwgJXgsICV4LCAleCwgJXgsICV4LCAleCwgJXgsICV4LCAleCwgJXgsICV4LCAleCB9
XG4iLA0KPiArCQkJCSAgIHNuYXAtPnNuYXBbaV0ub2ZzICsgaiwgeFswXSwgeFsxXSwgeFsyXSwg
eFszXSwgeFs0XSwgeFs1XSwgeFs2XSwgeFs3XSwNCj4gKwkJCQkgICB4WzhdLCB4WzldLCB4WzEw
XSwgeFsxMV0sIHhbMTJdLCB4WzEzXSwgeFsxNF0sIHhbMTVdKTsNCg0KSGF2ZSB5b3UgY29uc2lk
ZXJlZCB1c2UgYXNjaWk4NV9lbmNvZGUoKT8gV291bGQgbWFrZSBkZXZjb3JlZHVtcCBmaWxlIHNt
YWxsZXIuDQoNCj4gKwkJfQ0KPiArCQl4ZV9ib19wdXQoYm8pOw0KPiArCQlzbmFwLT5zbmFwW2ld
LmJvID0gTlVMTDsNCj4gKwkJY29udGludWU7DQo+ICtrdmZyZWU6DQo+ICsJCWt2ZnJlZShzbmFw
LT5zbmFwW2ldLmRhdGEpOw0KPiArCQlzbmFwLT5zbmFwW2ldLmRhdGEgPSBOVUxMOw0KPiArDQo+
ICsJCWRybV9wcmludGYocCwgIlVuYWJsZSB0byBjYXB0dXJlIHJhbmdlIFslbGx4LSVsbHhdXG4i
LA0KPiArCQkJICAgc25hcC0+c25hcFtpXS5vZnMsIHNuYXAtPnNuYXBbaV0ub2ZzICsgc25hcC0+
c25hcFtpXS5sZW4gLSAxKTsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gK3ZvaWQgeGVfdm1fc25hcHNo
b3RfZnJlZShzdHJ1Y3QgeGVfdm1fc25hcHNob3QgKnNuYXApDQo+ICt7DQo+ICsJdW5zaWduZWQg
bG9uZyBpOw0KDQpOZWVkcyB0byBoYW5kbGUgc25hcCA9PSBOVUxMLg0KDQo+ICsNCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgc25hcC0+bnVtX3NuYXBzOyBpKyspIHsNCj4gKwkJa3ZmcmVlKHNuYXAtPnNu
YXBbaV0uZGF0YSk7DQo+ICsJCXhlX2JvX3B1dChzbmFwLT5zbmFwW2ldLmJvKTsNCj4gKwl9DQo+
ICsJa3ZmcmVlKHNuYXApOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaA0KPiBpbmRleCBiMDhjNzVmYmQ4
YTEuLmVmMjNmZTNjMmY0MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmgNCj4gQEAgLTIzMywzICsyMzMs
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdm1fZGJnKGNvbnN0IHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsDQo+ICB7IC8qIG5vb3AgKi8gfQ0KPiAgI2VuZGlmDQo+ICAjZW5kaWYNCj4gKw0KPiArc3Ry
dWN0IHhlX3ZtX3NuYXBzaG90ICp4ZV92bV9zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV92bSAq
dm0pOw0KPiArdm9pZCB4ZV92bV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfdm1fc25hcHNob3Qg
KnNuYXAsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+ICt2b2lkIHhlX3ZtX3NuYXBzaG90X2Zy
ZWUoc3RydWN0IHhlX3ZtX3NuYXBzaG90ICpzbmFwKTsNCg0K
