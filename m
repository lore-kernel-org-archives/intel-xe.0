Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFBAC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F73010E541;
	Fri, 22 Mar 2024 16:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX8o8Rdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADF010E541
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711126668; x=1742662668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6pDmCfrhUyAeWP+MpSTc/Xt0984IARP60gKXapCHxII=;
 b=EX8o8RdpQBzzIVS8ejxm2miRfS0l8En5svBJ0YOpQsNR9WtJ+PT+fG5+
 wX5vZoAMC0TPi/CkvmAP7YVrjzmXAJQ9cfzdLnkFjs5v2AaCMYnYj94K1
 a+0Js4mTvSAkCJ9i1mdRlZk7VUZdtyanAVczhNTv+JfciGRrPon7pf7IS
 KBLFucMWgzgZpgixkG7FytUnULW8lXFoYboD43dgBNSZmDSDsr7lUlA1R
 aOadNx4hys54NnAQUgG/LmilLl2cqFmQvV7/elk7vzDabH8B3v/fdJwJx
 elzPoIix/MGthwm3bJvCdNAcDBd1/UTRqFaxOvRr37AxbLUTjZf1rtYxg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6297095"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6297095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="38100522"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:57:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:57:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:57:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:57:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4hfrshiEOczMHGaVE2LOdcu5qaUszY/OBcGynwYLjn0ued0DXW3/m3RxBeaVfuFkFH0fHJg8PRTkxygWljES21TowyfeaNM4qZu1yS3fsIybxCrwej0jXfwDQOo9fviGhzrIDYc3z0whATwCyWollrNuUHEmacyEqix98xKfA8PKCkAI9xtj0n9szjNJX5+81b4OObSTtBLGcZ7GTLzcQDkbFjW9F1vgEA1wwKLGG727CbfC+s13lVL31EKp8oGfmByiFFkZxZaAzAE3v4Jy4IXLF6swd7hCfwPLVedGDLVvVqsawkHLxyWFZLM3y8LSn0PtMbVlYvJyDu3sNHgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pDmCfrhUyAeWP+MpSTc/Xt0984IARP60gKXapCHxII=;
 b=evw4Sm6Sui6W+Z2cEoFxNLkjYO9L1VIzNtiae9w81WIcHri1VVqYwa7IBTnZIiFS3uobnAs81J44Lpjr4kVh+S0JhW5+URSlxW70BYPDi0YmOzRu5t1+idJZ2gP3Jn8E+X0BMoF+oSWXLkDvZa4lBjd7ZE/LRWDvdehIbCaPbd/fvyJHLO93MaYzVHAhn9OcZDjVKlgh921wv5VreGwxrlZRdcRgCJP4zYpK52ZYLh012wQyVYRygcWCeKFhqtYtWdOrzRBbJ+gfW9tXgGCR1ip9qp/C8d+7MYgHP8ifH7ZVeVjMXSND8GjToj3sY2eB0vOpfArQzLb7PL2XyVdgHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 16:57:41 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 16:57:41 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Topic: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Index: AQHaegrqUXaKghHnyUW/Q8HLczM2hbFEAAAA
Date: Fri, 22 Mar 2024 16:57:41 +0000
Message-ID: <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
In-Reply-To: <20240319143621.371087-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5243:EE_
x-ms-office365-filtering-correlation-id: 94ea95f1-90b3-4806-67ce-08dc4a912ff6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rg0qMHK4rkqrY0/dfLTkMOgCpAopo7WeMxGcJ5QUdzNfGTvH/Gx1MrHmi5yS4SbGP1qrtYhafRPjBNwTD5qxVcvN1Ngtc6O3bGy3bkv2VpkTxbWSzhhn1CxkevxNjwmpbS9rehzzF36Uo8589gkWPCf/mLBdwGaFRce5eO2gyWRZBsdcUumCm81suPKDGI7+OXzKatE14HcxXEAVHRBnBMSG161AADrAXf26rkRNauaysJBOOSgJk9H4zaMVUlNiHV9PEXPgAJVR5GBlxNgih5+wMrT+zcZIhXvnQEPk+Qj6WPA9FgcPjukKpMo3bRVoygkKG92eJFxzONHeRqfEZdSz0Evp50MhoCyToEbMpyAT9LVY7D4ZihBPOjGwteP0H+Rni/zXyrO1FHEAal1S1sXWJPvHCLySmhnN91qfYd+nG9N9AXVi9FwpGyNkl0PIc2R9lntyf8pqTs2z4Bde0oUFjIzhN7sj/DiCIrD9VQ6BpDZRSq2691d23/7GjuxbnrXH851tlKYi7alMhq3hrL9dfvwJRenzAQT8dCB3GmVrsca9ec2YtHvCK3gYeb1Z6akUWqshIWyBYBezoReRZKprebunyIOZmB947Y5rQ0unwVxq0hFXG6GDtsWigA0p/V5ZDhZGu1mqOz6CzreG5e9afwEFDfc+PpKJFRSsOkdK+tZg/Y/abSsFw/WS3YaVWg1enWTfiv4eqsYDZD88jJQ9bICNqeknR+I0VqGk33g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2toQ2c1SEtaNkp6WUpEV0p0Tm5rdHRuS2RDTHZuTytSbklacVVvYTk4a2pV?=
 =?utf-8?B?bGY5YU5ndnRleHFvL0dSeHZEc21OaVN5eE5jRUVvR0lQVnJ2djB6bkZDU1U2?=
 =?utf-8?B?bXRMa3liWXZHYTBhU0U3dm5Jc0tlUGFsUEtvRmEvdk5yTGdxNzVLWmFSaGlL?=
 =?utf-8?B?T29vRVhDaUNaQ1FTTDRuV0dnbGlZZi91SkJxUUJ4WWFsTU82TytFRGg5bEd5?=
 =?utf-8?B?Y2lHSzRlU3ErSGNDWmhqb1lkY2J6MHE2OVZic2U0ZkZnL2JKK0JQb1Z1WWRT?=
 =?utf-8?B?QkpISDQ2ZG9GK0R1eDdNalhJVzJ5QTR1YXIybEhsa25pL24zRzlJdHp2bkE3?=
 =?utf-8?B?Z1RGR3hEcXcwRTRjTTJaQzJIWFVNTS9vcG5ucjNVKzA1RTRyNUVPSEUyYWNs?=
 =?utf-8?B?bGoyNTYzWnFrWG9JRnl5TWsxQTZpajZobUFiRGtZYzAyOEtBRm1WRCt2R0o1?=
 =?utf-8?B?Y296Q3dlN3YzeUxWUllhc1Jmcm9BVUZwMnp0dWZMZTJ5ejN6aEVQOUxYMVh1?=
 =?utf-8?B?N2R1YzUrRFdEVTR2WE5CcXkxbms0Q0k4TU1iVUk4MWFzWDB0NWRiY2FGdXpl?=
 =?utf-8?B?OXJSNDZHcVV4ZGhoUU12RnVqR3NDSjhFbTVocFdJZnJ3MHpCK0dVQS9aSmlE?=
 =?utf-8?B?WVdTZXBPUHNib2o0ZzJwMk9KalBRVmlKQkhDS1pQNThoSEVYdmFTRWtsbFFM?=
 =?utf-8?B?cUYzWm1QT3B6Vm1uNzN0eFhEZXFXN0VSS3FMdDl0aFprTGdjY0NwVStoUWZC?=
 =?utf-8?B?MkcyTXBUWGpoTzFHZG5NbDV0MUpxYXE3bTZub1h1aE9uSnFYdzdhMktJSG5T?=
 =?utf-8?B?MlczR2tqdGpqM1g2VUhzcmx3b25mRXJVT3VWaCtpU2dPOEpkbUk1OERHQzFK?=
 =?utf-8?B?NGtGTDdaMEFwYk5CWW1EVVpBNENUMCt1NFZrWm1qSmg3RjdDQXBiSnA1RzZM?=
 =?utf-8?B?bmNIM04vbmhQR3QvcEFUbU5wOElJZ1dUMG1tN1lFeHE2WVNEbE4wSmxERW5r?=
 =?utf-8?B?cEl5ZVpySUlXS1JkMmkyWFBoak5nK3pCdCtoekF4MzVhajRya2FGU21yVnBJ?=
 =?utf-8?B?YkVBYXpxRm5vNU5NYVo0cllydWFJQVJHNEJHYmdsbDN6UjNudzdiQkNYcjVQ?=
 =?utf-8?B?MXdKWDVMeE5DZ3FiRW0wQldiYytpUUFSNnZBSnpqSE5tVit3ZmJSRzZGUmsw?=
 =?utf-8?B?WVI2MWJ1YVMwRjFHZ0VWMXVHNmFucC9uVnpzNEFVa0Z3M0FlZklyQi8rRitS?=
 =?utf-8?B?VTdLaTZnSy9ib1Jhc2VlVzFXaVBRYlZiMDU4UE9iUlpyWUgrTU8yUkFpRFp6?=
 =?utf-8?B?SEczOTREZHVlQkVhY3lFNDhrYkRHc3BFQk9PejN0ZitMSnhXUzJ2NVhVODhL?=
 =?utf-8?B?L2ZVOEZnc2tORnFuMFFZVDZQUHF6UnMzMWFKZ094eHoxN1UxaW5keDJTeURX?=
 =?utf-8?B?cmxUQ2lyVFpsekkySTVXYU5JM2FvdFhEMDdYMFJvaUREdU1CZW1na2ZhQU9j?=
 =?utf-8?B?b0xmRWtIYVlPanprQ3JJTloyczJoaVJZbFhoeExCNnAzMDlZSHJmeWhKTVYr?=
 =?utf-8?B?ZEdCczFnT2pYQ3BDVDVZSm5UclZzUTdwWjY0dkNMaWo4WGdVNU5hRXBDSWxG?=
 =?utf-8?B?OG0zSFJPOGxEeGJGRFJNQ3kvVHBFdVN3OGJrRFVoT2krYmQ2clZ5SW4wUnJa?=
 =?utf-8?B?M1ZzZ1NyQzgzS3FZV3MvNnZWVkFVVitLdjVXdlhEZ3VPeVhSUjI4SEt0UTY5?=
 =?utf-8?B?WlFLa0lUMDRmVDF1WTB4LzlXdS9WTk43THNTcjFMajNROEhyQVVGa28wWjZU?=
 =?utf-8?B?ZVNRSWgxamQ5c0RieExBeU1XNStRM2tPYUppU3lWZjVQSzBFRmdXVzZORFEy?=
 =?utf-8?B?TWxsZ0NKeWFIYk5SZmx3Qjc0R25lU0hMV1JXd3ZlVzRqejF5NGdaa2ZLQ1Zq?=
 =?utf-8?B?V2syeHIrdjNQZktBRXFHYTNQNFVyV2R2bUw2ZGRnZERvcEhyeWRRR2l4bENG?=
 =?utf-8?B?L1R4ZmRvOTQ3WmxJN2VteEU0V2psUEtjdEFSVFdEN3o3UzNpdnpVUWJaM1Fi?=
 =?utf-8?B?VG4zbFp1N0xuOFd2TE9TdEg2dFBJMmhibnJYTGVKOTZTdHFuaUgrTERsRE1i?=
 =?utf-8?B?Q3pEZitML29COE4vMnVTR0cwazFYcUZSUktqNkhEQ1hESU9WaWNEazhKaFhp?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1231A2875E821458E8655008A461713@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ea95f1-90b3-4806-67ce-08dc4a912ff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 16:57:41.4909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kay7NZbrhDmSFbzPMMTsCe9vxYGpEPGfLaNw5LX868S1DN9mDREF0Ozi80lKGtR0v9/uroOEctm91NVkMaPyVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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

T24gVHVlLCAyMDI0LTAzLTE5IGF0IDA3OjM2IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IFBvcnQgR3VDIGJhc2VkIHJlZ2lzdGVyIGNhcHR1cmUgZm9yIGVycm9yIGNhcHR1cmUgZnJvbSBp
OTE1IHRvIFhlLg0KPiANCj4gVGhlcmUgYXJlIDMgcGFydHMgaW5zaWRlOg0KPiAuIFByZXBhcmUg
Zm9yIGNhcHR1cmUgcmVnaXN0ZXJzDQo+ICAgICBUaGVyZSBpcyBhIGJvIGNyZWF0ZSBhdCBndWMg
YWRzIGluaXQgdGltZSwgdGhhdCBpcyB2ZXJ5IGVhcmx5DQo+ICAgICBhbmQgZW5naSAgbmUgbWFw
IGlzIG5vdCByZWFkeSwgbWFrZSBpdCBoYXJkIHRvIGNhbGN1bGF0ZSB0aGUNCj4gICAgIGNhcHR1
cmUgYnVmZmVyIHNpemUsIG5ldyBmdW5jdGlvbiBjcmVhdGVkIGZvciB3b3JzdCBjYXNlIHNpemUN
Cj4gICAgIGNhbHVhdGlvbi4gT3RoZXIgdGhhbiB0aGF0LCB0aGlzIHBhcnQgYmFzaWNhbGx5IGZv
bGxvd3MgdGhlIGk5MTUNCj4gICAgIGRlc2lnbi4NCj4gLiBQcm9jZXNzIGNhcHR1cmUgbm90aWZp
Y2F0aW9uIG1lc3NhZ2UNCj4gICAgIEJhc2ljYWxseSBmb2xsb3dzIGk5MTUgZGVzaWduDQo+IC4g
U3lzZnMgY29tbWFuZCBwcm9jZXNzLg0KPiAgICAgWGUgc3dpdGNoZWQgdG8gZGV2Y29yZWR1bXAs
IGFkb3B0ZWQgY29tbWFuZCBsaW5lIHByb2Nlc3Mgd2l0aA0KPiAgICAgY2FwdHVyZWQgbm9kZSBs
aXN0Lg0KDQpKdXN0IHNvbWUgbm90ZXMgYWZ0ZXIgdHJ5aW5nIHRoaXMgdG8gZGVidWcgYSBpc3N1
ZSB3aXRoIHRoaXMgc2VyaWVzOg0KDQotIENPTkZJR19EUk1fWEVfQ0FQVFVSRV9FUlJPUiBpcyBu
b3QgYSBnb29kIG5hbWUgZm9yIGEgY29uZmlnIHRvIGVuYWJsZSBHdUMgYmFzZWQgY2FwdHVyZS4N
CgktIGluIG15IG9waW5pb24gdGhpcyBzaG91bGQgbm90IGV2ZW4gZXhpc3QsIGFsd2F5cyBjYXB0
dXJlIHdpdGggR3VDIGlmIHhlX2RldmljZV91Y19lbmFibGVkKCkgaXMgdHJ1ZS4gDQoNCi0gY29y
ZWR1bXAgZG9uJ3QgaGF2ZSBzb21lIHJlZ2lzdGVycyBsaWtlIFNBTVBMRVJfSU5TVERPTkUsIFJP
V19JTlNURE9ORSwgWEVIUEdfSU5TVERPTkVfR0VPTV9TVkcuLi4NCkhlcmUgdGhlIG91dHB1dCBp
biBMTkw6DQoNCioqKiogSFcgRW5naW5lcyAqKioqDQpyY3MwIChwaHlzaWNhbCksIGxvZ2ljYWwg
aW5zdGFuY2U9MA0KCUZvcmNld2FrZTogZG9tYWluIDB4MiwgcmVmIDENCglIV1NUQU06IDB4ZmZm
ZmZmZmYNCglSSU5HX0hXU19QR0E6IDB4MDE2OTMwMDANCglSSU5HX1NUQVJUOiAweDAyOWQ1MDAw
DQoJUklOR19IRUFEOiAweDAwMDAxOTE0DQoJUklOR19UQUlMOiAweDAwMDAxOTY4DQoJUklOR19D
VEw6IDB4MDAwMDMwMDENCglSSU5HX01JX01PREU6IDB4MDAwMDEwMDANCglSSU5HX01PREU6IDB4
MDAwMDAwMDgNCglSSU5HX0lNUjogMHgwMDAwMDAwMA0KCVJJTkdfRVNSOiAweDAwMDAwMDAwDQoJ
UklOR19FTVI6IDB4ZmZmZmZmZmYNCglSSU5HX0VJUjogMHgwMDAwMDAwMA0KCUlQRUhSOiAweDdh
MDAwMDA0DQoJQUNUSEQ6IDB4MDAwMGVmZmVmZmZmOTIwOA0KCVJJTkdfQkJBRERSOiAweDAwMDBl
ZmZlZmZmZjkyMDkNCglSSU5HX0RNQV9GQUREOiAweDAwMDAwMDAwMDI5ZDY5NjgNCglSSU5HX0VY
RUNMSVNUX1NUQVRVUzogMHgwMDAwMDAwMDQwMDAyNzljDQoJUklOR19FWEVDTElTVF9TUV9DT05U
RU5UUzogMHgwMDAwMDAwMDAyOWQ5NzE5DQoNCi0gYSBsb3Qgb2Ygc3R5bGUgaXNzdWVzLCBzZWUg
J0NJLmNoZWNrcGF0Y2gnDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhh
bmp1bi5kb25nQGludGVsLmNvbT4NCj4gQ2M6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJl
cy5hbGV4aXNAaW50ZWwuY29tPg0KPiANCj4gQ2hhbmdlcyBmcm9tIHByaW9yIHJldnM6DQo+ICAg
djY6LSAgQ2hhbmdlIGhhcmRjb2RlZCByZWdpc3RlciBzbmFwc2hvdCBmaWxsIHRvIGZvbGxvdyBt
YXBwaW5nIHRhYmxlcw0KPiAgICAgICAgIFdoZW4gY2FwdHVyZSBpcyBlbXB0eSwgdGFrZSBzbmFw
c2hvdCBmcm9tIGVuZ2luZQ0KPiAgIHY1Oi0gIFNwbGl0IGRzcyBoZWxwZXIgY29kZSBvdXQgYXMg
YW4gc3RhbmRhbG9uZSBwYXRjaA0KPiAgICAgICAgIFJlbW92ZSBvbGQgcGxhdGZvcm0gcmVnaXN0
ZXJzIGRlZmluaXRpb24uDQo+ICAgICAgICAgU3BsaXQgcmVnaXN0ZXIgbWFwIHRhYmxlIHRvIDMy
IGFuZCA2NGJpdCBlYWNoDQo+ICAgdjQ6LSAgTW92ZSByZWdpc3RlciBtYXAgdGFibGUgdG8geGVf
aHdfZW5naW5lLmMNCj4gICB2MzotICBSZW1vdmUgY29uZGl0aW9uIGNvbXBpbGF0aW9uIGluIGNv
ZGUNCj4gICB2MjotICBTcGxpdCBpbnRvIG11bHRpcGxlIGNodW5rcw0KPiANCj4gWmhhbmp1biBE
b25nICg4KToNCj4gICBkcm0veGUvZ3VjOiBBZGQga2NvbmZpZyBmb3IgR3VDIGJhc2VkIHJlZ2lz
dGVyIGNhcHR1cmUNCj4gICBkcm0veGUvZ3VjOiBVcGRhdGUgR3VDIEFEUyBzaXplIGZvciBlcnJv
ciBjYXB0dXJlDQo+ICAgZHJtL3hlL2d1YzogQWRkIFhFX0xQIHN0ZWVyZWQgcmVnaXN0ZXIgbGlz
dHMNCj4gICBkcm0veGUvZ3VjOiBBZGQgY2FwdHVyZSBzaXplIGNoZWNrIGluIEd1QyBsb2cgYnVm
ZmVyDQo+ICAgZHJtL3hlL2d1YzogQ2hlY2sgc2l6aW5nIG9mIGd1Y19jYXB0dXJlIG91dHB1dA0K
PiAgIGRybS94ZS9ndWM6IEV4dHJhY3QgR3VDIGVycm9yIGNhcHR1cmUgbGlzdHMgb24gRzJIIG5v
dGlmaWNhdGlvbg0KPiAgIGRybS94ZS9ndWM6IFByZS1hbGxvY2F0ZSBvdXRwdXQgbm9kZXMgZm9y
IGV4dHJhY3Rpb24NCj4gICBkcm0veGUvZ3VjOiBQbHVtYiBHdUMtY2FwdHVyZSBpbnRvIGRldiBj
b3JlZHVtcA0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnICAgICAgICAgICAgICAg
fCAgIDExICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAg
ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2FjdGlvbnNfYWJpLmggfCAgICA3
ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaCAgICAgfCAgICA1ICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wcmludGsuaCAgICAgICAgfCAgICAzICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAgICAgICAgICAgfCAgICA2ICsNCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgICAgICAgICAgfCAgMjI5ICsrKy0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzX3R5cGVzLmggICAgfCAgICAyICsNCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jICAgICAgfCAxMzMyICsrKysrKysrKysrKysr
KysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5oICAgICAgfCAg
IDIxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZV9md2lmLmggfCAgMjIx
ICsrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyAgICAgICAgICAgfCAgICAy
ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5oICAgICAgICAgfCAgIDY4ICsr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jICAgICAgICAgIHwgIDE3OSArKysN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmggICAgICAgICAgfCAgIDE1ICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nX3R5cGVzLmggICAgfCAgIDI2ICsNCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgICAgICAgfCAgIDIxICstDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5oICAgICAgIHwgICAgMyArDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3R5cGVzLmggICAgICAgIHwgICAgMiArDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lLmMgICAgICAgIHwgIDI2MSArKysrLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5oICAgICAgICB8ICAgIDQgKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oICB8ICAxMTcgKy0NCj4gIDIyIGZpbGVzIGNoYW5n
ZWQsIDI0MjEgaW5zZXJ0aW9ucygrKSwgMTE1IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmgNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVfZndpZi5oDQo+IA0K
DQo=
