Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAA8E82CB7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 17:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D8C10E571;
	Wed, 27 Sep 2023 17:22:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E973910E571
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695835362; x=1727371362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YFCr4kVHvRj+ffk2w8ly5XrKXt6djLw1mnDbbseNl8s=;
 b=VFckcSOYsI5b5augeqFgVK8VS9m3feuB+Sh5h0sF0FPacdRjWWc1wcpm
 RmWE+0jaFvL/kTUApWPinlezbJtBH5vXsDOei6W+vxA8mHsZfEuAScJSH
 nX5cm4YAzpMe1k8XCYYRAUp0YGQ82lmKyeAgVZ2UtAHVHuy/exN0SfpKC
 yEKgoAQQ7OIMepiCBn9+FVBHBRHFs4RAC3xfqhVsnlZEXfkIMvmoSq081
 KSZlKbZTKZrOwU+h5AbnxUUARdi3uWr7AW4jd/Lm0Vc6kJpGOCwSowKt1
 2BT5Srp37k4m4lMSkx88dXHuA+JXkoDWGDxnRCCpGlqkeHwey4hv+c8P5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448376228"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="448376228"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 10:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864931782"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="864931782"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 10:22:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 10:22:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 10:22:40 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 10:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1DALM4cWYcTkRrtefKcpLmbEmOZSU8e/q+1IymHju+s0pQTi7CL7WdwIf38lSJbpQa/wQn6j7dvia7FID6AGDpEtJa8pCufxN361a4CDvZTLrKARpDkWGTwj0CpZ5MhUGey9/IbjN+P+kFEQ95Ye7bt+s6IepsIVEc8sgCNUrvkne11NapJs7Aqd7gLjX24OFgq5nBRea1Tzh772vlWDDNcIqfFaNwz6MkL70xwV4sKCZ+dswgShW5ykTptbOnWcD1aXpWixiHXJxbUOEmUAd2WfyT/3fYLu8lo27NeZUlKA3VrEhgs1rX9gvg/zm3dQIWWcsPmL880SWI/dEnfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFCr4kVHvRj+ffk2w8ly5XrKXt6djLw1mnDbbseNl8s=;
 b=RNbRg8LAfYYP1d6ttjkOe6xLqzxLpEAo3Qedu8CgB/5wiGAPXrY8NWCxfTjA6DmdnPDqy9/hzBb+QrWRjrJYjguCFCCI7KxPHIDnAadGhKKvxjP+ghaxkUNINmIiY7q7p40ZIMWACBlVJfMZSH51n4W/RO9x+Izyk/uNnnqyELykhIGSsj6ZQTbDyRd++kZ2cj15mAeUc/H1iwoA5vaWdeRCffsIiJgCM++UVZobZ3s5+7Quj+QxwcHGVvhuWHrzlEzH01uo7sUV6HA/6eP/R74VEbqoEHKa5BRerdUZL2RMJVD8eGf7tFPheOm/+NlgBrXk0x7Sx9PENTtCnrN+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 17:22:33 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 17:22:33 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
Thread-Index: AQHZ8HoGcN+923X40UuKuEW2Quipi7AtUQ0AgAGXeICAAATqAA==
Date: Wed, 27 Sep 2023 17:22:32 +0000
Message-ID: <30f2ed3daceb731b579938b87abdc0d16f182d10.camel@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
 <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
 <ZRRgt81Ekx0tNk3e@intel.com>
In-Reply-To: <ZRRgt81Ekx0tNk3e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7972:EE_
x-ms-office365-filtering-correlation-id: bd46dbb4-e83e-4a3d-e708-08dbbf7e55d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sto52cygZpEtqjMAzFJuFFfftJzdAIyGcBU5IcjaqOq+6qeYXbvNXDYdJRoZx3/ePPLc1soTPPodpP4fzuGw09widjwGA/VBnOKn2A0oMyszuGTuUUPNq4cx45P4WBHnTNpzYBwZ3/5BOULofxU/g+BsLVX/YpqEVWYrRGgHgy2ztETHSy+Yg8qZkkWZdZ33oUtxua5avEBzeLLcmvYaipqNq6LpCWaxjDGEYWB0GyFIUHpUzqPwa108rLInt1hb/DSOK5IKmzrDgzPjrR4mK5FYYYAnluDOzHD5eqPdMXiAvbWwF4X7q+Mc8DS35Sykiy+obPFVHssk2Nnu1IxACo8AiXeaeKuesWVDGA4PbKfQVudDOFWrcu7hwmk6/jkwJZTcx41u9x7mdc1mwILeWNw9GUsKvs3kVghIJjz5TJ1VmJLk4dqNryOsho/XJnZ8ZL8QCbHnU24sRSeux9m0Y28jEJKleXrX9owZCHsVJ2roksAXeP3DLvKh1z3iBaghlLyyt37rc2KI7Vu0bNrXePiYVctyWLYDKjou2kBYc1nweCV1VoyFp0Not56MlAPlt7uEKCMk19rYf2ZR5b67dYQtG4EXs20BYqF/3cISIoAD6B6JNlAqo0SG6MNjj6EH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(2906002)(83380400001)(38100700002)(38070700005)(107886003)(6506007)(86362001)(36756003)(6512007)(71200400001)(2616005)(6486002)(478600001)(26005)(41300700001)(8936002)(66446008)(8676002)(66556008)(4326008)(5660300002)(66476007)(54906003)(64756008)(122000001)(6636002)(110136005)(91956017)(76116006)(66946007)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3RxKzN6T3JJLzV4Nlg0U2dsRGtBd0VLK2Rwbm5BRlBXcTYzZFlFTUpHaFhE?=
 =?utf-8?B?dmdrVDBIc3FCeHQwR09oWXBVUmhaM2ZPNEVaZFRWTmRyVzZHT0FwWXZTRHJr?=
 =?utf-8?B?NVFJRUQyRStKS292R1JPZlZZZFNNSHRhdnd5dmNEOGh2cjJ0cnBWOXdrd1Jo?=
 =?utf-8?B?QTF6RlRGZUtuZmo0MCt6VWd0SEVhUUJXUUh1N0VWNE5kenEzcVFFNXVqTm5K?=
 =?utf-8?B?cXRDanlvSlYrc1VRQ01NZ2dsVnhvZXNyRXlzUmlacVlsaHpaN2Y0a1EwZkVO?=
 =?utf-8?B?Mkg5V0FVZ3o1em0xRUEwNWRpZzlQbENvVjdBQmhQT1Qzakx4RGplRnhXcmFv?=
 =?utf-8?B?YTNZMUFxMzhVcDMzZ3ovaGZ4b2NtWDhUVGFVOElneTgvdVJpZGZTM0M5TVVL?=
 =?utf-8?B?KzlGWHArZ0R2RlQ5THJwUFcwTHMyQTVHY1c4VGRxR1BWcmpXNHRRNkIwWVI0?=
 =?utf-8?B?R09KQ1FlN3VXZDdXSTBFK0lmYU9hemVvMHZrVmRLcXEvYWRVaE1JUGFMU216?=
 =?utf-8?B?WkQvelFkREp6N1E0c2VheEw3SE5zMzMwdmdMYzB6UDBpdGxWaDQrU1VhTU9H?=
 =?utf-8?B?UXpHN252aTdqTzU1a3ZRTU9BSGpCTDMzZ00ySlJscTBRdUx2eUtvZVBwNCtV?=
 =?utf-8?B?Q2hjWWlFMjFEam0wMmVvM1M1cEQ2dkpzeUl3THVZRmZTU0VXTEZ1ejVsUFBy?=
 =?utf-8?B?azdvc2hCWTBNdmNwSklXbTdCbGljL0hySC81TTIwc1o0ZE1JdzVZQ1crSm90?=
 =?utf-8?B?U3h4WXJrZ0tCV09BNWc3WXhSakVOMC83TGZOSW5sTDlldTBIOXovWlpkcTRw?=
 =?utf-8?B?TTVmVDVMR1VTMzNaUUhSZUpnV2FSNWtIalVyRittVzhHZ3BRNVZpa0xobUN1?=
 =?utf-8?B?MlR2bTFISmpnTTNkckFXUnNxT09OZnYzdWZycitoK3BjSVhFbmdSa3lXL1p6?=
 =?utf-8?B?N29hK3VNa2tnZUdTYlMrSXRoNzNYZExHNlFVY2hJT1h3Q1hQQ2VocjNiVTFP?=
 =?utf-8?B?cmJKWmdUNjB3alhKZ2RkcGRPYkpYQ2xaMTFOemk2dDBIZUtaNEpOdEltQXNI?=
 =?utf-8?B?ZGg0SmpoWHg5YXkwOE5NZXR2b0Y0cEpFenVuL0UyN0RVMTFVeUhCVG5zUXhJ?=
 =?utf-8?B?M3F2WmFtTWtjQzFpaHV0SUFXU3Z2czJaNWxhTXArREVmM0Y4WTNCSGwrYlNo?=
 =?utf-8?B?bUN1ejc5UzdJS3FXMmtJVE0wQWtBcHhySzc2dEhlb3VpTzRIM3VwVkxka3A5?=
 =?utf-8?B?RTBmTjRQYTZITWVSNFNSLzg3MlRqakZoeDlza1BGaDlhNmdDbUZIMG4zVlJn?=
 =?utf-8?B?aEZlS2MyTk5DQ1JPdUVsK3lFdjd0VW5uZDcwWHdDRHZHZGNsYjVTWWtmeDRh?=
 =?utf-8?B?S2dvWFA4MkR2M2lIdlJETTlFMlNIeklpUkl3ejMrRTBiU0NRSVYwMm9Ea3Fo?=
 =?utf-8?B?QjlEZzlRWVZzQ0hWQzZ0SEpFUmdYM0JUd3NJWFdVMG93a1FmMDVndTBzbHgw?=
 =?utf-8?B?Tkc1S0RvS2NhY0pvMkNpNXRnWC8zR3Z3ZkROUHlSZmt1a3ltRDA1aHFwaWRO?=
 =?utf-8?B?RE56ZkVtTHR2RkNJc09QNlFoRWlQczUzZ1lVa3E2dXJURDRLdk55NzBEY2dj?=
 =?utf-8?B?RDhBN3Y3M1RYTE9ZcmxkNWlDWERxdmx5clBhVHRzSkFiWGNCemlJTy8vSE9U?=
 =?utf-8?B?bWd2OVd6b0FoZDJWcTRLdmlFb1BHdEdJZkdpSmsrNVkwV016enpQbUE5ejVP?=
 =?utf-8?B?RjJaeHlxQjI0QVBISEZIdGRKajhOem4zVE5hQUF6YS9lN1JuOWRVVC82QlpL?=
 =?utf-8?B?by9lUUlBNzlEMU5HZGZtSXhEcE9VWHV4cmdHMUdpSXpoY3FmbFZPTEMwNGlS?=
 =?utf-8?B?TldiZWRuVDVmN21sK2lKQWw3NTdXaDM4R2x3SUdIMDRNeTJCY2h1clFLRlpw?=
 =?utf-8?B?NlNwSkRlV25uM3VGYTZ6SysyaGF2Q3A0RDBWUmErMmJJQmtUenVOTllpZ1dy?=
 =?utf-8?B?S2hlWXpCbTBveEFPVDdZRW5iOU1uMGFEUnVmTitrUThzWHpsVTZwbzY5bUJv?=
 =?utf-8?B?RjRGTVRQbENSV2JtQTBsSm1HdUhsSzlVU1VwV21IRElIV2dKUDJvSGdjczY2?=
 =?utf-8?B?ZFJyZ3djS2FXUk41UTVxSXEzQS9Denk4Qi9FN3FGd295UDhhUGtQSExMZEpr?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABBD1559D39E1448A0EF0790662E43C3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd46dbb4-e83e-4a3d-e708-08dbbf7e55d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 17:22:32.9529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+sxjcJWE61vbs+vx7T1KWRAwDVG3en5Z+7yp9XDkaybJRVFKYSC8sHFQlE39ZfBT7r7UBKP/6Si10xoV9SWhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

KyBKb2huIEhhcnJpc29uDQoNCk9uIFdlZCwgMjAyMy0wOS0yNyBhdCAxMzowNCAtMDQwMCwgUm9k
cmlnbyBWaXZpIHdyb3RlOg0KPiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCAwNDo0NjozNlBNICsw
MDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjMtMDktMjYgYXQgMTI6NTUg
KzAwMDAsIEZyYW5jb2lzIER1Z2FzdCB3cm90ZToNCj4gPiA+IFRoZSBpbmZyYXN0cnVjdHVyZSB0
byBxdWVyeSBHdUMgZmlybXdhcmUgdmVyc2lvbiBpcyBhbHJlYWR5IGluIHBsYWNlLiBJdA0KPiA+
ID4gaXMgZXh0ZW5kZWQgd2l0aCBhIG5ldyBtaWNyby1jb250cm9sbGVyIHR5cGUgdG8gcXVlcnkg
dGhlIEh1QyBmaXJtd2FyZQ0KPiA+ID4gdmVyc2lvbi4gSXQgY2FuIGJlIHVzZWQgZnJvbSB1c2Vy
IHNwYWNlIHRvIGtub3cgaWYgSHVDIGlzIHJ1bm5pbmcuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgOSArKysrKysrKysN
Cj4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDEgKw0KPiA+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVl
cnkuYw0KPiA+ID4gaW5kZXggN2EwZmZkOWE2NTRhLi5jMjUwY2E1MzRiYjkgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+IEBAIC01MzAsNiArNTMwLDE1IEBAIHF1ZXJ5
X3VjX2Z3X3ZlcnNpb24oc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2aWNl
X3F1ZXJ5ICpxdWVyeSkNCj4gPiA+ICAJCXJlc3AuYnJhbmNoX3ZlciA9IDA7DQo+ID4gPiAgCQli
cmVhazsNCj4gPiA+ICAJfQ0KPiA+ID4gKwljYXNlIFhFX1FVRVJZX1VDX1RZUEVfSFVDOiB7DQo+
ID4gPiArCQlzdHJ1Y3QgeGVfaHVjICpodWMgPSAmeGUtPnRpbGVzWzBdLnByaW1hcnlfZ3QtPnVj
Lmh1YzsNCj4gPiA+ICsNCj4gPiA+ICsJCXJlc3AubWFqb3JfdmVyID0gaHVjLT5mdy5tYWpvcl92
ZXJfZm91bmQ7DQo+ID4gPiArCQlyZXNwLm1pbm9yX3ZlciA9IGh1Yy0+ZncubWlub3JfdmVyX2Zv
dW5kOw0KPiA+ID4gKwkJcmVzcC5wYXRjaF92ZXIgPSBodWMtPmZ3LnBhdGNoX3Zlcl9mb3VuZDsN
Cj4gPiANCj4gPiBIYXZlIHlvdSBjb25maXJtZWQgdGhhdCBIdUMgd2lsbCBub3QgaGF2ZSBzb21l
dGhpbmcgbGlrZSBzdWJtaXNzaW9uIHZlcnNpb24gbGlrZSBHdUMgaGF2ZT8NCj4gDQo+IE5haC4u
LiBHdUMgaXMgdGhlIG9ubHkgY29tcGxpY2F0ZWQgZncgaW4gb3VyIHNldCBvZiBmdy4uLg0KPiAN
Cj4gPiBBdCBsZWFzdCBpbiBHdUMsIHdoZW4gcnVubmluZyBpbiBTUklPViBtb2RlIHRoZSBWRnMg
d2lsbCBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGFjdHVhbCBHdUMgdmVyc2lvbiwgdGhhdCBpcyB3
aHkgaXQgaGF2ZSBzdWJtaXNzaW9uIHZlcnNpb24uDQo+ID4gDQo+ID4gTm90IHN1cmUgaWYgcHJv
dmlkaW5nIGEgY29tcGxldGUgZGlmZmVyZW50IGZpcm13YXJlIHZlcnNpb24gZnJvbSBvbmUga2Vy
bmVsIHZlcnNpb24gdG8gb3RoZXIgd291bGQgYmUgY29uc2lkZXJlZCBhIHVBUEkgYnJlYWsuLi4N
Cj4gDQo+IGhtbW0uLi4gYnV0IG5vdyB3aGF0IEknbSBhc2tpbmcgbXlzZWxmIGlzIGlmIHdlIHNo
b3VsZG4ndCBtb3ZlIHRoZSBndWMgb25lIHRvDQo+IGhhdmUgdGhlIGN1cnJlbnQgbG9hZGVkIGZp
cm13YXJlIGFuZCBjcmVhdGUgYSBzcGVjaWFsIGNhdGVnb3J5IGZvciB0aGUNCj4gc3VibWlzc2lv
biB2ZXJzaW9uOg0KPiANCj4gWEVfUVVFUllfVUNfVFlQRV9HVUMNCj4gWEVfUVVFUllfVUNfVFlQ
RV9HVUNfU1VCTUlTU0lPTg0KPiBYRV9RVUVSWV9VQ19UWVBFX0hVQw0KDQpJIGRvbid0IHRoaW5r
IGFueSBVTUQgd291bGQgZmV0Y2ggdGhlIGFjdHVhbCBHVUMgRlcgdmVyc2lvbiBhbmQgcmlzayBm
YWlsIHdoZW4gcnVubmluZyB1bmRlciBTUklPViBWRi4NCklmIG5lZWRlZCB3ZSBjYW4gbWFwIGEg
c3VibWlzc2lvbiB2ZXJzaW9uIHRvIGEgYWN0dWFsIHZlcnNpb24uLi4NCg0KPiANCj4gQnV0IHRv
IGJlIHJlYWxseSByZWFsbHkgaG9uZXN0LCB0aGVyZSdzIHNvbWV0aGluZyByZWFsbHkgZmlzaHkg
b24gdGhpcw0KPiBzdWJtaXNzaW9uIHZlcnNpb24uIFdoeSB0aGUgVkYgY2Fubm90IHJlYWQgdGhl
IHJ1bm5pbmcgZmlybXdhcmUgYW5kDQo+IGdldCB0aGUgc3VibWlzc2lvbiB2ZXJzaW9uIGZyb20g
dGhlcmU/DQoNCkdvdCB0aGlzIGluZm9ybWF0aW9uIGZyb20gSm9obiwgaGUgY2FuIGV4cGxhaW4g
aXQgYmV0dGVyLg0KDQo+IA0KPiA+IA0KPiA+ID4gKwkJcmVzcC5icmFuY2hfdmVyID0gMDsNCj4g
PiA+ICsJCWJyZWFrOw0KPiA+ID4gKwl9DQo+ID4gPiAgCWRlZmF1bHQ6DQo+ID4gPiAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPiA+ICAJfQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiBpbmRleCA4NDA5
MTg2MGM3ZDIuLmZlN2U4M2E1YmQzZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+
IEBAIC00NzgsNiArNDc4LDcgQEAgc3RydWN0IGRybV94ZV9xdWVyeV90b3BvbG9neV9tYXNrIHsN
Cj4gPiA+ICBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gew0KPiA+ID4gIAkvKiog
QHVjOiBUaGUgbWljcm8tY29udHJvbGxlciB0eXBlIHRvIHF1ZXJ5IGZpcm13YXJlIHZlcnNpb24g
Ki8NCj4gPiA+ICAjZGVmaW5lIFhFX1FVRVJZX1VDX1RZUEVfR1VDIDANCj4gPiA+ICsjZGVmaW5l
IFhFX1FVRVJZX1VDX1RZUEVfSFVDIDENCj4gPiA+ICAJX191MTYgdWNfdHlwZTsNCj4gPiA+ICAN
Cj4gPiA+ICAJLyoqIEBwYWQ6IE1CWiAqLw0KPiA+IA0KDQo=
