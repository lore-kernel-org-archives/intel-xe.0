Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCB2CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 17:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1646A10E4B4;
	Thu, 12 Oct 2023 17:20:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8F10E4B4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697131238; x=1728667238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F8eacKtk6beb92YHTixI4a42/JAU/L1iX+RJCCgWsyE=;
 b=nt7KIODwuCoyjkl4Y+xuhJ/lf3r0iz6HhnKpnkKqDSgondWQtYiCnEUY
 zUUdXi27I2w72GWWDqUoO45DsY6gg4BVJs2A0Tr/nty2b0Gp3rfcjFPP0
 Etw8UosMfEjufMl/k/0may0DkFpogneqMh60iHH+wxPKcjpOhQpwYPqtT
 9H2gragNjYBGQKQAxwSPIxQPyRqeUfIXg1LNUtlWjCXgl7ivubD3xOVrN
 b+gOTKX8wCRSJlfSeth2LRWrkaGfWqMsjtWe9wE1kECHaeTE103YFhtg/
 IS954YbTzol2IgcYRV7HS2iIqCwhlumPGsUHUHHaOFt4fve+S7LgBpHrl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451474401"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="451474401"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824686635"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="824686635"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:20:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:20:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:20:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:20:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgrT9elgIn7LZAizqBeeK5a9pw9Jm/OvPAUnyFGTDcqPtC4LQz0CVio97909oCr5fU7K+lXuQi//bdXJkTdBetSafsGX7ONwbQPzxLE9r0SfwpClrPtWrYC1fPrWGgM1v1m47zf8SFnMSYemYrv910I9OpefD/zfB5hoOznm6xK+RNtnN9nhRVPL6KpZDdwoFd/bipl/pR++twVeXzYhs0YzrdO/VsgvBAA4ir/XOxwsDOVd2o1NPYv7B5szyAoaCSn8KBik/J1Wsd7p/EhXegAbXC6Q3X3Pt50WCC3OkcyZffd6Qxr/yOaPK0k1DLGFZPwlB+BDgJHLDtLYDWxM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8eacKtk6beb92YHTixI4a42/JAU/L1iX+RJCCgWsyE=;
 b=Mi6PoC26RnB3AwoUr9+9/eGGlWoJbkSI1hpC2o4WcKqV/2n9Z8SirGbFw7hVQYk0zuJHz8dEmhXBICpbTk/qYO4DWoQURcqmKWu++Yt/6p2J5jEGTFuPufkphmggBbAygzpgszGYe1FMnwEbkmlUq8/9IdWJgI6Lqb8qTkZw+UFah9R7LhzoY1a8NwSwzf2zqbNCQdKMPt/j7+VO5FwydyN+pBevtLG5F/wVoEP5Pl5RRP5azYe4kcSI9iL9dJkpC4q639vNon0cd4dGEVJ9SihqTrn8m/PkEA17qAtm3ycAs2oOVK/qQ97QB4CagTbQtgRv0D8kBoI2EfmSrYU+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 17:20:34 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 17:20:33 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH v3 1/3] drm/xe: Store xe_he_engine in
 xe_hw_engine_snapshot
Thread-Index: AQHZ+6l8AqqlkLXTC0enGwzIMrOb+bBGaFkAgAABIYA=
Date: Thu, 12 Oct 2023 17:20:33 +0000
Message-ID: <ff3e03acf78dda8cb52bde94de70f89a005596c7.camel@intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231012171628.GH21382@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231012171628.GH21382@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB5914:EE_
x-ms-office365-filtering-correlation-id: 1e34e15e-bce4-4d67-8b96-08dbcb478b02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EdRu8Gzy6anj5lZ7z7sowMUnOG2/S6WMdcEW16VG9YlroVig6fU2lX3BwnP3x4ieS6gR9Pxr/xVw5bWMSortJ0stc6U9q5F5CCjBpQUcq2sRd+RgThArA2janLbnKkxk95ytnB2yF6jb/43wdgqSl2//BylsDWBqGk42iBiFVB95V9di32FS7wZ0eP5A4nCmN5ZflLjvDh11Neu3Mlr1mSyFG8vYZK3dtD+5nQKQEcMimVyy1ziIqvOcwg8npb7SaRxl8SZh+QuYuqmxDz15HPh+WoLeqs3ZpBkHSQ7yRYSCnt1n4tTApJ4T5G+zINZB27glXIEAYBLD8JrkSTZ1z5M/9QiEU0kUxrXM49+P/aT3V3dQvKJ0u2wDk7uoM+qj7T4Mqqk382mEFtj6+og9LI9DCfle2JUa0YrjT1xiQWUuUxGtFn6MJoLvws/rtLuzVcebp/e9WDSsmTYZoHxuLX88N48KZ9mYrscUEC0vUYHVmI0AAHktKdgwWdGt/qWm0f++0Kd5NqTjE2PZ9H6zg0XunOm23dd2mA3ipOosYTy2VUyghTRS+zQ7zooawpY+I4S0YcBvPpEtL+19DOpNoD3d1PjjYP30k2sbMAoTEeAledwW583/mJuXMqYbZpVk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(36756003)(86362001)(38070700005)(4001150100001)(2906002)(64756008)(66476007)(41300700001)(6636002)(5660300002)(37006003)(478600001)(2616005)(66556008)(91956017)(316002)(76116006)(66946007)(6512007)(66446008)(107886003)(71200400001)(6486002)(6506007)(54906003)(6862004)(26005)(8936002)(122000001)(4326008)(8676002)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEUrVWlSd0hHbjNYQWM2T1FYQ2tjUmphY2lNRW9ETlBZUHN1VTl2RlFsUTNh?=
 =?utf-8?B?bUVocUo3UWRiUEJWUUE1UGdiMGttTHdNOTdsQ3JIRDE1ZXdac25OMk5tNGg5?=
 =?utf-8?B?eDZZQ2JZdmVCZFU0b0gzbEV0aUljR2owMWVtRXBQL3k5UDN4amx6WUxQbEFP?=
 =?utf-8?B?a3hDcEV6RnQvTlNQWnJMSXFVOW1KcmpydEs3amNSS1dUZDAzRytUWTYwMEty?=
 =?utf-8?B?dDZrTEltd0ZBQWJDaFFyK3lRdGNyLzBtdmczSGgvcXdlaEFkb3ZZVmNtQ3Za?=
 =?utf-8?B?UDlOZ1ZnYWg3eEU3MkMvVTdOcUxCenZYSDE0Qlo1dlk0czRMdTJyUUxoV1dn?=
 =?utf-8?B?UUFwZm0vZ1ZjenNFRDIvLzVnLzNvVitLczhrdXpVa01NdThUMVNBRGxoaGJM?=
 =?utf-8?B?Z25rb0NINkJiaGN0SFVCd1g4UmRJczhaM0o4MUc3alcvbXJCVEY3UWxpRTAv?=
 =?utf-8?B?S0FDR0N1b3oyazRqMlhUVHIxYzFFVEtkaHJKZlpWRjBYRks2Q242WUUrOTRX?=
 =?utf-8?B?VDR0Y0E0N3kxcjVPQzFFQUVaNmxiaXR0bGw1SVRvMzhYVGZMb0pvYlZ6aFgy?=
 =?utf-8?B?ZWxOZjVXak9xb0E2VlBEOE8zOXdFY3BWY0R4ejVQYmR0cm13YjducGIreDFF?=
 =?utf-8?B?b3VldXZtRFBVQzkzVXJPVk55RkROSDJwT1BDaWlkaThGN1kxSEt1V1FOaHho?=
 =?utf-8?B?RjhTZG96dTZaZjdNQ1ZScHFFWGRDY0NMVjhNRXNNOXpvanFQMks3UkpLY0dH?=
 =?utf-8?B?MTVkRlZMdWRFSGdkTjJLWTc5WnZic0I2ZHBWVHpMYWVuaFJOSi85N1FURTU5?=
 =?utf-8?B?dlo3VUFUZ1Q0SlVYdWVuU1djSVA0MHErVEhpNXNpQ1I2a3RNZ1FUeEEyb2Fv?=
 =?utf-8?B?TnBsT2wyWEJMcm1SWjUwbW5iSFE1bVVSbklEb1pGQ0RXalQ2di85OWk0Q0Nv?=
 =?utf-8?B?ZTNiczRwQnh4bGpnb3ZJcExSQ3pMV2FuZURiL3pMMmM0V2JPa1A2Zm5wRGJ2?=
 =?utf-8?B?eUt0SzJaWEJvazR5bTI3N3JSL0pmTmNUUktvU09hRzFiSXpWSG9qdW1aVkwr?=
 =?utf-8?B?Njluclg4SmZJZW9hQ0h1SmF1d0hXV0t0R29JZTRJMzd2K3FtWlFSQjVEY3FD?=
 =?utf-8?B?RzM1RUc0eGVRV2REZHVmUStXVzRZM2RXOUxxallLYS9CZlR6bDFmOWxvQzBF?=
 =?utf-8?B?YVlHZ2JKOVZTUUpQNWhwcElpSHplbEI4c0NWcWtrWWJ0Z2xTN3JsSThoQ2VO?=
 =?utf-8?B?Y21wWVRnS2pBYXk0Sjl5Qk1aODRBN3BVOE0zMDNyZnMxQk02YlpFbldWency?=
 =?utf-8?B?SDE1RzVCRmcvWHplSG9VR0owNHRMS3VHMmdMejQ1V2JrRHBMMklTaGlWaFRu?=
 =?utf-8?B?dEROaTU2QVVvaGJ0TG4rbWMvNUNTOWV2Sm8wdk8wZW11Rm9xblVuWVFhWGRy?=
 =?utf-8?B?TEZkU1VJRVBidEh5ZFNWcHNxZ0Y5dk5oM29pRWVCb3Nmc2RZU1l5aktYcnY5?=
 =?utf-8?B?ZlRnYWJ3b252bDY0RWdEN2J3TTU4UVlLTkJGMktuVjNKaHZMS29jQU9WZzNZ?=
 =?utf-8?B?NDIrRWc5YkFyWEM5b3hDemY3U2RRTTVFbEd4WVlrcm9RdGk3NXVVN0hHbzNH?=
 =?utf-8?B?UnV0OXREOUZvT1pCN0tJQWJtSDJuMVdybHNXRlRUeWFpOFU2SG5iQjN6VWdM?=
 =?utf-8?B?WklSYy8yUk1IamREQmVOYkJmTDBGSWR2SEZudUFaQ1hEMzVVVFBrNGQrNWlj?=
 =?utf-8?B?dnI5WlR6c3ZxRXFGMG9GWlJuczUxeDduajFid3g2TGZEUUVyeVVyeEl6Ritt?=
 =?utf-8?B?U0tuVmVxd3ZQT2YrYlA0Zi9XcnBUNmhIN0x0bFZkRkp5aEh4cGQrNTgrK2N2?=
 =?utf-8?B?c1pXSFlkRHZFZUx5L2tNbm1GbnhMUk84TWcrOUZ1YUpsek1LSGhwNmRmRGxw?=
 =?utf-8?B?dUtjMDl1M0l6YUh5N05HL05BSGVJOFowb3V4c0ZLeXRrRnVOWmNQTmw4LzFG?=
 =?utf-8?B?a29hZElHUWpaZVh1M2NaVGJPQUxud2J1YXlKcnI0NEFlOGc2OTdiQUVsVHZX?=
 =?utf-8?B?WmRHVEdPZzRrbnQ4WGd2anpycE1QZE5IY2FYNUJZSGM3VUl5TjhIcXZYMEkx?=
 =?utf-8?B?ZEZ6Q3FuekJhVDB1SHFMbEw4b24yOWpuT1pKNEV6dGZkTE1HZmFaNENyYU1F?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56BDC56E9E0BB9438831A939EB00FC49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e34e15e-bce4-4d67-8b96-08dbcb478b02
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 17:20:33.8254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCK1qj3hssLUH2UxN2nfefMbHrTdFlYJPofuOKYnKFFu5jt/br8kcWbJj7wgMnxP6Flgsx3o9BCdClxJRGgNOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe: Store xe_he_engine in
 xe_hw_engine_snapshot
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDEwOjE2IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUdWUsIE9jdCAxMCwgMjAyMyBhdCAxMTo0MTo0OUFNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IEEgZnV0dXJlIHBhdGNoIHdpbGwgcmVxdWlyZSBndCBhbmQgeGUg
ZGV2aWNlIHN0cnVjdHMsIHNvIGhlcmUNCj4gPiByZXBsYWNpbmcgY2xhc3MgYnkgaHdlLg0KPiA+
IA0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gQ2M6
IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICB8IDYgKysrLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaCB8IDQgKystLQ0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ID4gaW5kZXggYjViMDg0NTkwODg4
Ny4uMzdiM2VlMTI2ODA5MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
aHdfZW5naW5lLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMN
Cj4gPiBAQCAtNjg0LDcgKzY4NCw3IEBAIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9jYXB0dXJlKHN0
cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gPiAgCWlmIChzbmFwc2hvdC0+bmFtZSkNCj4gPiAg
CQlzdHJzY3B5KHNuYXBzaG90LT5uYW1lLCBod2UtPm5hbWUsIGxlbik7DQo+ID4gIA0KPiA+IC0J
c25hcHNob3QtPmNsYXNzID0gaHdlLT5jbGFzczsNCj4gPiArCXNuYXBzaG90LT5od2UgPSBod2U7
DQo+IA0KPiBJIGhhdmVuJ3QgcmVhbGx5IGxvb2tlZCBpbnRvIHRoZSBkZXZjb3JlZHVtcCBzdHVm
ZiBtdWNoLCBidXQgaXQncyBub3QNCj4gY2xlYXIgdG8gbWUgZnJvbSBhIHJlYWxseSBxdWljayBz
a2ltIHdoZXRoZXIgaXQncyBzYWZlIHRvIHNhdmUgYXdheSB0aGUNCj4gaHdlIGxpa2UgdGhpcy4g
IElzIHRoZXJlIGV2ZXIgYSBjYXNlIHdoZXJlIHRoZSBzbmFwc2hvdCBjYW4gcGVyc2lzdA0KPiBh
ZnRlciB0aGUgZW5naW5lIGl0c2VsZiBoYXMgYmVlbiBkZXN0cm95ZWQgKGUuZy4sIGlmIHdlIGNh
cHR1cmUgYW4gZXJyb3INCj4gZW5jb3VudGVyZWQgZHVyaW5nIGEgZGV2aWNlIHByb2JlIHRoYXQg
cmVzdWx0cyBpbiB0aGUgZGV2aWNlIGJlaW5nIHRvcm4NCj4gYmFjayBkb3duKT8gIElmIHNvLCB0
aGVuIHlvdSdkIHByb2JhYmx5IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGh3ZQ0KPiBmaWVs
ZCBoZXJlIG9ubHkgZ2V0cyB1c2VkIGR1cmluZyB0aGUgY2FwdHVyZSwgYW5kIHRoZSAncHJpbnQn
IHJvdXRpbmUNCj4gd291bGQgc3RpbGwgbmVlZCBhIGNhY2hlZCBzbmFwc2hvdC0+Y2xhc3MgdG8g
YXZvaWQgdXNlLWFmdGVyLWZyZWUNCj4gZXJyb3JzLg0KDQpYZSBkZXZjb3JlZHVtcCBkdW1wIGlz
IGFsc28gcmVtb3ZlZCB3aXRoIFhlIG1vZHVsZSwgc28gbm8gcHJvYmxlbXMgd2l0aCB0aGlzLg0K
DQo+IA0KPiBSb2RyaWdvIHByb2JhYmx5IGhhcyBiZXR0ZXIgaW5zaWdodCBhcyB0byB3aGV0aGVy
IHRoYXQncyBzb21ldGhpbmcgdGhhdA0KPiB3ZSBuZWVkIHRvIHdvcnJ5IGFib3V0Lg0KPiANCj4g
DQo+IE1hdHQNCj4gDQo+ID4gIAlzbmFwc2hvdC0+bG9naWNhbF9pbnN0YW5jZSA9IGh3ZS0+bG9n
aWNhbF9pbnN0YW5jZTsNCj4gPiAgCXNuYXBzaG90LT5mb3JjZXdha2UuZG9tYWluID0gaHdlLT5k
b21haW47DQo+ID4gIAlzbmFwc2hvdC0+Zm9yY2V3YWtlLnJlZiA9IHhlX2ZvcmNlX3dha2VfcmVm
KGd0X3RvX2Z3KGh3ZS0+Z3QpLA0KPiA+IEBAIC03MzEsNyArNzMxLDcgQEAgeGVfaHdfZW5naW5l
X3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAJCWh3X2Vu
Z2luZV9tbWlvX3JlYWQzMihod2UsIFJJTkdfRE1BX0ZBREQoMCkpOw0KPiA+ICAJc25hcHNob3Qt
PnJlZy5pcGVociA9IGh3X2VuZ2luZV9tbWlvX3JlYWQzMihod2UsIFJJTkdfSVBFSFIoMCkpOw0K
PiA+ICANCj4gPiAtCWlmIChzbmFwc2hvdC0+Y2xhc3MgPT0gWEVfRU5HSU5FX0NMQVNTX0NPTVBV
VEUpDQo+ID4gKwlpZiAoc25hcHNob3QtPmh3ZS0+Y2xhc3MgPT0gWEVfRU5HSU5FX0NMQVNTX0NP
TVBVVEUpDQo+ID4gIAkJc25hcHNob3QtPnJlZy5yY3VfbW9kZSA9IHhlX21taW9fcmVhZDMyKGh3
ZS0+Z3QsIFJDVV9NT0RFKTsNCj4gPiAgDQo+ID4gIAlyZXR1cm4gc25hcHNob3Q7DQo+ID4gQEAg
LTc4Niw3ICs3ODYsNyBAQCB2b2lkIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9wcmludChzdHJ1Y3Qg
eGVfaHdfZW5naW5lX3NuYXBzaG90ICpzbmFwc2hvdCwNCj4gPiAgCQkgICBzbmFwc2hvdC0+cmVn
LnJpbmdfZG1hX2ZhZGRfdWR3LA0KPiA+ICAJCSAgIHNuYXBzaG90LT5yZWcucmluZ19kbWFfZmFk
ZCk7DQo+ID4gIAlkcm1fcHJpbnRmKHAsICJcdElQRUhSOiAweCUwOHhcblxuIiwgc25hcHNob3Qt
PnJlZy5pcGVocik7DQo+ID4gLQlpZiAoc25hcHNob3QtPmNsYXNzID09IFhFX0VOR0lORV9DTEFT
U19DT01QVVRFKQ0KPiA+ICsJaWYgKHNuYXBzaG90LT5od2UtPmNsYXNzID09IFhFX0VOR0lORV9D
TEFTU19DT01QVVRFKQ0KPiA+ICAJCWRybV9wcmludGYocCwgIlx0UkNVX01PREU6IDB4JTA4eFxu
IiwNCj4gPiAgCQkJICAgc25hcHNob3QtPnJlZy5yY3VfbW9kZSk7DQo+ID4gIH0NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oDQo+ID4gaW5kZXggNWQ0ZWUyOTA0MjQw
Ny4uNzFjMGEwMTY5ZTYyYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
aHdfZW5naW5lX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5n
aW5lX3R5cGVzLmgNCj4gPiBAQCAtMTU2LDggKzE1Niw4IEBAIHN0cnVjdCB4ZV9od19lbmdpbmUg
ew0KPiA+ICBzdHJ1Y3QgeGVfaHdfZW5naW5lX3NuYXBzaG90IHsNCj4gPiAgCS8qKiBAbmFtZTog
bmFtZSBvZiB0aGUgaHcgZW5naW5lICovDQo+ID4gIAljaGFyICpuYW1lOw0KPiA+IC0JLyoqIEBj
bGFzczogY2xhc3Mgb2YgdGhpcyBodyBlbmdpbmUgKi8NCj4gPiAtCWVudW0geGVfZW5naW5lX2Ns
YXNzIGNsYXNzOw0KPiA+ICsJLyoqIEBod2U6IGh3IGVuZ2luZSAqLw0KPiA+ICsJc3RydWN0IHhl
X2h3X2VuZ2luZSAqaHdlOw0KPiA+ICAJLyoqIEBsb2dpY2FsX2luc3RhbmNlOiBsb2dpY2FsIGlu
c3RhbmNlIG9mIHRoaXMgaHcgZW5naW5lICovDQo+ID4gIAl1MTYgbG9naWNhbF9pbnN0YW5jZTsN
Cj4gPiAgCS8qKiBAZm9yY2V3YWtlOiBGb3JjZSBXYWtlIGluZm9ybWF0aW9uIHNuYXBzaG90ICov
DQo+ID4gLS0gDQo+ID4gMi40Mi4wDQo+ID4gDQo+IA0KDQo=
