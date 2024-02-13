Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69572C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 18:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E0D10E550;
	Tue, 13 Feb 2024 18:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hi+wsx5+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B582610E550
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707847300; x=1739383300;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Xt0EAyMzfnywLSMhi4FPoSqCX7Ccj1+pE2frKe1MDao=;
 b=hi+wsx5+SNpWXxrwySMUP7ysNFy6+ulF93bA5esRmCTrs2UvnDI1NsTW
 vZCqG3FMDq6sAuop8OVLxs0m0WdXitMQDUInVBn1G1RH+Sd0F8HvPQktP
 tQ4lOXqGuEzXBf0hsvxM4QKQVh1mR4gLTJu6DUAsocs9GOA6qBCC4SCtS
 /SNVbkpv6BoLQ23s1p2g2F7xVvv+D26P4b9QFwqohrmw3Stftid03YCsE
 VRbkKkp9jn9ErFFFAJGnqjpl3kyyYhDXY2s3b3W3rh71QGW4MXNi5kbur
 gNmwjYkTX9n09ep6ViWmcW98JegoAE8dQ4Ilc1sVRKBboFAA//uU/3qdd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19379738"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19379738"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 10:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3251001"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 10:01:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 10:01:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 10:01:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 10:01:38 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 10:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLTckAd3ddWpKQ56agFFqgvSadLyz+hHcvQ4ACgE9bNsEoVAzWS5n9uIA+BRyy0lM6e0buUtXSaEgMF3L13NZeSjcQ4XHcKZcQxsrlAZbH+ibLPjCksRME5tdSzI6pANfIDjiK0U89Ap+bMSM0vIqudrUMQF3fuPFXK6U3HOSm5FC81M459rpelrLlEqW+fBXEkDasVWpsrqPQWguiCDQL6ITPJ5kaf/9qbd/22gpVHmP1Aom11YNfMUE2SgEmgfGRJVhGY+ou8A/G+pivW+dGj3XuokmoVklvb5cK8GPWCeERDcVqpsHcUHhvTmIfkj19IgHDyMVedogAKVSyahig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt0EAyMzfnywLSMhi4FPoSqCX7Ccj1+pE2frKe1MDao=;
 b=WH3zYPz/Yywxz2L66mBTW/l3/V050OylgWAr8/+68aBn2vdTF+lFlDSBWm/vO70boFPemMhC1ZCt2qORmaYgUdJAnY9+RulcdqWyiC96F7MgY45gTi79QZohCtD+4qtBj4HPCPDbUiKMOOvqXHfAFcUPYsyzq91znAYC6S4hbHsUh8K05SjWRGUKgkK4gZjXbndKn/cjWUBNzYLzJeNF801DxnfBDh5IYAxtVFVX5gpy9dC6/ZHgcLHUhU8LgU61SK/TX1LW5BgAsyZCUwSfQSKNwmeS9Arr+Kb8FRWfReMIjhagZtBYWKHP0GN61OH3k9LLDq8cyPi+TIUWzMQP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.33; Tue, 13 Feb 2024 18:01:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f%3]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 18:01:35 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/1] drm/xe: Add helper macro to loop each dss
Thread-Topic: [PATCH v9 1/1] drm/xe: Add helper macro to loop each dss
Thread-Index: AQHaW3/cYQY+1O7T2UuXtJWsmhnxDbEIlluA
Date: Tue, 13 Feb 2024 18:01:35 +0000
Message-ID: <f4b21a2f7572a912160f3916b6e93b4cbc3e236c.camel@intel.com>
References: <20240209174548.19389-1-zhanjun.dong@intel.com>
 <20240209174548.19389-2-zhanjun.dong@intel.com>
In-Reply-To: <20240209174548.19389-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6261:EE_
x-ms-office365-filtering-correlation-id: 35ac89ef-17d8-493c-414f-08dc2cbdd171
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6oOLmJs/COMfPT7JlmR6lImdbHPktVkBnfqyO7x55KWyfQP4FLaYAnE5gfLn8A/E7XayOdwzgaM99pc+Z6sldU/OQWAFudKgwuSGxtFuwkvtC5J37uWPcI9pXUAqEMN4Nb1p8NT/3k8QzMcLnmA1RsWVp4Kjp2m/RFgCJmp2b4TQGTfIqM9A5sAvlbFtDQJ1NXtcJrriiY+fgE0jaGm4psepLnj8Jt4Ag7uVIjYzKdkzix5lHEi9tXwT59JNagSovs0wNHiHCawk2EOFKQTBUGFgxOUBRnA+5rI2s4YN4L+Jti4AOBrouK5IKR0wrJ8gVSrby9E5RdLuTj835f/HzYSalEjw7CACAw5vzJhMbb2N6t8EQ2L+9FRKM5FD7Kgmh54/yKQn43Dp6s9p4jhRBikqTF0siJbUB0A1sN2pYs/5G+/0rGdEqbgIiKtImnZy2S/R6E1f2UoO5E9MgWX7c2dgcEiwHXxG++NuJhB+v0d88uFDtkBrHhFMl7stzRomjB2zHfdotUNPD6KME9ND3DpLobK6ZnM0IsCY/xrXcJzSHMvwiELBbRxE26AypNZUY2rOFgCiDvq6IE0/V0j340SJkS9RcWYCkPQBMNwaLl9r7NQT1rPclxBn6OXT8zr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(8936002)(71200400001)(26005)(41300700001)(2616005)(2906002)(66476007)(66556008)(66946007)(66446008)(8676002)(64756008)(4744005)(76116006)(110136005)(83380400001)(38070700009)(316002)(6512007)(6506007)(6486002)(86362001)(38100700002)(122000001)(82960400001)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VNMFRJbFJvYUg4ZE5pY29QdTk5MTg4WEVGd0h3anRDbnB2cEJ6aEhqZ3hO?=
 =?utf-8?B?ZTRrTmpQZWtja1J4R1lCTmdaODV1TFc5NjdiRG9HQmVQMHVDTjdpMmNMSmpz?=
 =?utf-8?B?U25xQndseUpLL0pnOGpRa25GS0hkSnJuN20zeFd2ZHQyeFB1QzJTNW5WeUxz?=
 =?utf-8?B?cUxnZHJKWDJmbmVrcGQ3NERZZkhDZ0JWWUMzaVg4VFYzQ2pVd2tPRU9wN1N1?=
 =?utf-8?B?Q1pwbFowcFZuZElmdkw5KzQ4UXFaeCtGc2M5azhGMGM3bGtOTHMrVmxLTmlj?=
 =?utf-8?B?bC9MN25Pa0pmWHFqQTd5cG12QzNzSDArOE82OFBGcnduTTNGNVRmNWMzSW5X?=
 =?utf-8?B?UUszWkdXbFBPL2Foc0J4QndYVUFVNlQySmR0NmtoSzIyMnJ0T3VXV1UvL2pI?=
 =?utf-8?B?bkx2T2hRMjkzc0F4Wll0ek1sNndVemNqcjBicWtGMzNsNVpnR0t4NzlzQ2gz?=
 =?utf-8?B?eFVyMUVjVVR3YUZxZ3kweGVQY00vOG4wcytSVnMvbGUwZWR0b2Rpckc3NFgy?=
 =?utf-8?B?RmpRNkFnTitHd3owMXNWUHpJdXM0b1IyTnRPMHhNWmdBWlVMTE1DOGdkSmVj?=
 =?utf-8?B?R3A2b3pjMU15a2F1YWN5am4vNlJWTWVJckw2NTRiTDJiTWYvOStaSDNYTjVK?=
 =?utf-8?B?elg2RUlEZUlwR1Z4QTlOYTBaOGhwZlRoc2E5bktoZ0g1TndDNytRRkFhVkFy?=
 =?utf-8?B?NjhFV1FDdDl3ci9vRUcwUklVRy9rT2gvclBONWU2K2ZCYWNRbWw1QWNMa05s?=
 =?utf-8?B?cFNONDVFaUppNHRTWFRnNldvSzlleS93WE53ZEp6MWtvbU10Z0lySGVGRXU2?=
 =?utf-8?B?cFJSOC9XOGh3Slg0WlVSTmdmMHFXMmtUaTd1QmphMXovRmZDWjN5eFJNOXVP?=
 =?utf-8?B?dEc5end5a2xYUnJVUXFocXVmQU9GeFEwd1VqYzNwTDlvdUJROXJ6M3lqYVYw?=
 =?utf-8?B?Tlcrb2xMdSt6VFB0UlJhWGNHMHpTWHNGTExydFRza3UvN01sc2ZBZUVxcG0y?=
 =?utf-8?B?VzFWSDdLVmJxRGR3L1JpdDRhSkl3TElOVk5vWUIrVTlZVi9MZllUYURnbE1K?=
 =?utf-8?B?eldCRDAzeFhNd2RqUTBkVjZwak5Nam1wT3Q3OSsvUG9oVGV4ZWdtMStLaTVQ?=
 =?utf-8?B?aS96UU5PNDQ5dmtXbHhZVTRJTk9tdVVxbm9mSXdUdGx0YWx2ZFFsSGVzb3Ev?=
 =?utf-8?B?UU9nTkN6cHVqNTdIRE5UN0xUbWtmbitlL2x1Y2V0ZHpiVEFDRWUzMGRNaE4v?=
 =?utf-8?B?ckVpUWNDZTZJWFIweG9URExkME9nOHJ5LzBTYTEzOGk2ZXY3dXJ1a1BjNTRD?=
 =?utf-8?B?TjlCd3dST0Q0NjdlWDQ0bVFwZjJvWUZtZnpKdVFvM21ZaytpUStMNXQwM0pO?=
 =?utf-8?B?My9iYjM0WkhvU2M1dmdOSmxYcHJRc25Cd2hPWi96ZWV2WHZHRk1RQWtVR3dn?=
 =?utf-8?B?Q3FOK0tGQ2M1RmJmWFZGbGhhNmlCNHNuZThwUUNkQ1BWUnNka09FTFFzUFhn?=
 =?utf-8?B?SE85azJ4b3JpdWJydmdubzR2T2Y0cmsvTi9RbjVONW0vbVZ0VEZKRkREVkwv?=
 =?utf-8?B?anM3QW9wVkEzSHRIdmRvRTVOOG84dXl5WTZ1VnZ1UDJBRElUM1FJYU1aaXg5?=
 =?utf-8?B?Y00rTjBMdDVub0hjUk8xU3ZlTFRSUXVwMVpGSndKdHlRUkZGdEdOUGZSSGUr?=
 =?utf-8?B?MVFoV01kWGFoM1ZGVzBxZTRJSGtSQjI2TGVKTVFMczA1VC9Ma09uUkIzaFVQ?=
 =?utf-8?B?a2dvbzhha2pSamxRK0NhVVQ0dEl5VlhPVE5uYk9MNDVWaCt6dFJTbXFpdFRn?=
 =?utf-8?B?QU8rak8yK3I0dkh0bkNaUE9RQWZqOEdZWmkwYnpOYkxKOVZyYmVpN3FKWXJY?=
 =?utf-8?B?eEJWU0N6RTNZOVNKOENhMU5tcWR3am8xUjl5T2VYNG81T0V2WXRvbUZZQ1Rj?=
 =?utf-8?B?MStJK0VMUndZWlZqYkpYS3RTWkthZGRUbUFET2ZUSlM1WjdpVlEzNWVaM2Nh?=
 =?utf-8?B?eUpKc1ExYUNSc2s4U09FdEp6RGU2Z0tlRGJqWnErNWEyVDZYM3QxUUsyaHJm?=
 =?utf-8?B?LytYK0xPUGxvQ0d0ZEZUbEd1NG1haUFqZmRZMTVCd09OeWkvTmd1ZTJiWkpI?=
 =?utf-8?B?SkF3cEFQSTVaTVEraTg0cHhaanZCbTNJNnc4Z0h0elN1azZjSVdjcVRXM2M4?=
 =?utf-8?Q?qTliWunCizEyEl78kie6MGs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6F28305141C114C9A1E8976D253B9DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ac89ef-17d8-493c-414f-08dc2cbdd171
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 18:01:35.4015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrwo6kJl/Sw0fEXKK9bGWeycN0lxSRhONjUFrILffQS1WRILts6BwsiX58wfwc0HnXZkv/0zseswqFUp9gdbcD534/Ns4jinTl3imMZIRk6NmkeC6MeOQO5IhVP+URgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
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

T24gRnJpLCAyMDI0LTAyLTA5IGF0IDA5OjQ1IC0wODAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEFkZCBoZWxwZXIgbWFjcm8gdG8gbG9vcCBlYWNoIGRzcy4gVGhpcyBpcyBhIHByZWN1cnNvciBw
YXRjaCB0byBhbGxvdw0KPiBmb3IgZWFzaWVyIGl0ZXJhdGlvbiB0aHJvdWdoIE1DUiByZWdpc3Rl
cnMgYW5kIG90aGVyIHBlci1EU1MgdXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4g
RG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X21jci5jwqDCoMKgwqDCoCB8IDMyDQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5owqDCoMKgwqDCoCB8IDEz
ICsrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90b3BvbG9neS5jIHwg
MzEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IC0NCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfdG9wb2xvZ3kuaCB8wqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3R5cGVzLmjCoMKgwqAgfMKgIDIgKysNCj4gwqA1IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KYWxhbjpzbmlwDQphbGFuOiBJIG5vdGljZSB1IGFk
ZGVkIHRoZSByYiBpbnRvIHRoZSBjb3ZlciBsZXR0ZXIsIHNpbmNlIG5vdGhpbmcgaGFzDQpjaGFu
Z2VkIGFuZCB1IG5lZWQgdGhlIFJCIGluIHRoZSBwYXRjaDoNCg0KUmV2aWV3ZWQtYnk6IEFsYW4g
UHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
