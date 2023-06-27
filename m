Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D99EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 18:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B159E10E2F8;
	Tue, 27 Jun 2023 18:17:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA410E2F8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687889858; x=1719425858;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=UVm0IYcHGpzMYn7fyoUDh7c4HYdqf6kIq6Muw7G4FD4=;
 b=Ys8LY+k5et/mSj0ateHWTsEn//UJyfvI8eQSWkw8msgjeoeBZv7tpIuy
 GmUHXeYUXzOJ9HIyA4Y2dNNdeO/Ti/czkqBeCNrIrU7iloSemCIN9Ecm/
 KYccPBgnu2Ix0w1YHQ1hc5v/Q0tN8yuHIEt4rJOFuyPRdT/aqJ/BO88cr
 vUFMlsTjxBWie0DqD0DzGVAu4jSL2K5kI0HqMHoq3vdmFYChA5alH4Fsi
 AHGtoEEy/GlSVsaQQyIqExChAbduXRNmMNQpBWc2lYZsMFSragFOUwIea
 RFUF1qYAS77P2tle6j7OQbRlRMb3lVK8Wy3GueWovFoZeOQnECt6CmTLq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392266123"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="392266123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 11:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="719918376"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="719918376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2023 11:17:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:17:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 11:17:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 11:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMwm6m4VJUvGcFOYb9mR2oNS5rjIDoWshSlrG358eYI3Fmj0WX1wBujMbIJI05Wd1LizGJzi7yCRhmI1+cbHfFoKlgEIxGiuhI2ztubdp0D7rTx6hAHCoJqkCDigJoarj4KPf9QDHPI6sn6bwI/vL64d11vjbYBWXlVkwp8qyQG9lTx85hCrbC74vwBofH4ZC4f+e0WA5EzxYWbPRfnAjN7Pd2B/NmG29UAktiZgh6LU0d4+TINwcpWbPdrY7Xp003i2bgivbxlgrRR89ND+csAGgE1AzRkMevgys/rzOmjST2bT7a3vBVBpPeNFqW0v132ro24o4mELpI0zJ50eeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVm0IYcHGpzMYn7fyoUDh7c4HYdqf6kIq6Muw7G4FD4=;
 b=D5hkf3lXgNNVShFCYORrpnOXzFBUXUDKPE0lzokzZZoHT1Rpt3IRWBqZZ6dvaeSvpE/7+CDvihXJ7/wfM/4I+PCiSRCkYo+rvqAXYKfV5EjPGMKrjT5/BEnpwODq3Bu5sUJj3w5ZDw8gpJ3J+fOnRsYvPaXqNjblAfkSoDAUGs3ZQbjF/21016Jk8q6dL63wvgqn9JPuQ/24mywIy83Jh3eHMZ1qK5TBqjuXH0t+/jQ4fAAMUbOJLb9Yt4RCqdoBTN3fCdfFtH+MECEJGFQ3Tow9G1y0H98xHCdY9dtbuHZNCxQvkYulIj412bJpvYJLn0kV0xnJSfkNKJePI7ddWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 27 Jun
 2023 18:17:12 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 18:17:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
Thread-Index: AQHZqHRbhaRkWlDDv0OynaSyfDrYza+e9jKA
Date: Tue, 27 Jun 2023 18:17:12 +0000
Message-ID: <c386a297b512964a8d34b5df9a80ebb4eaa9229e.camel@intel.com>
References: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20230626212221.136640-1-paulo.r.zanoni@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6467:EE_
x-ms-office365-filtering-correlation-id: afb978b7-b3f7-4d3e-ea1f-08db773aba65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BZt5MLi/t/Vr6R5xRBQOD5ZVstrT3X3ttmqCDrbhcNOP/RuIC/bTY6c70o6vseG7jo92ItoTsRTXJVD+CIBqt29ynJQCXXmc1E8cjZ0VIEemoCmXvZT/BOpmVorB2siEE2GBvtTOgFA2i2oQlPRfVz8Qe2yOkzweddXyVNEGzctJNqj/hIo13XDMEv9pf+yzdCJ1M8EV2gJbVgi8oqxs3q8Ig4P5PoYMHFmxElx3Gsr4DTi40/pHHfwJz2GTFN/QTO41MuXlCJsrV7mjsocf5leqmHscwpSSrXYn2ZOEazWR+Ht+OMprRivoi2AR4aWCUfR/+CtcDduorW1V5nz21PHVgjbisdFa1RnvPdq0iwuVtShTPeJAtLRko/qptmqICdivX5RfuML5xf6p1R8nufrDR4vz4sEB7bTDVkcx2EBSB9uRn5lqJXrcAOF9hHpfHNonupZ1U8pafd4zqobcD8oBaQ9N5dqK6Nplu+EIb8zGK5CxrCa+Ym4EhSmR/0nirL92rBaWfMElglpeew2DEkTd54VY/i2CcmiYHA/brqDLNZPT3Fh0LiOKpL/1A8lya+Pu31/Vajs95WA7ZRINdYTNpi7h324hpw2ntpURi/0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(6506007)(36756003)(6486002)(966005)(26005)(478600001)(71200400001)(110136005)(2616005)(83380400001)(2906002)(6512007)(186003)(5660300002)(316002)(86362001)(66476007)(76116006)(122000001)(82960400001)(66946007)(6636002)(91956017)(41300700001)(38070700005)(8936002)(64756008)(66556008)(38100700002)(66446008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y29ZRnBtdEhIQWIwNHp2M29wV0o5Q3ZhTmJoUCttZEtGeG5YQk4zQk44Y0gz?=
 =?utf-8?B?eGxjdDJ2Y0VzeVB4dHR2bzJPVUNES1plaXFEQUExcys3M0h0U3dFSk1nUytu?=
 =?utf-8?B?L2ZYVXcxZ3pPS3pKWDlkOG1td2VERlNkTkVyS1VmT2NCWkVLbDR4eGRFMzZi?=
 =?utf-8?B?Q0oxclBQeExBOGsyaVlXTXg3ZGtRWDI4WWpmZmg5bFlhWHZ2a3YwUmpXdGlt?=
 =?utf-8?B?WXFoWWxnWGpZZmJpeldnaW51djV5MDQzVlYzZTFyRGpha2hUYkMweFdDRlhH?=
 =?utf-8?B?NEtzaHhWRjB1MVFMSnYwSTJmS1BDTk1WMmcyVlFKaGk2UW1TS1pYdGdJR2Zm?=
 =?utf-8?B?OEtwdUE0NGlhZnFjRFMxdDVoenRLNXFKNXIvQnJhdHZPWXRmZ2Y0cDZHelJk?=
 =?utf-8?B?RDEydUI4M253RjgxOXFOcDl4dm1OS2x6RkZYalBUK0w3dmxCY01GV2FrWFpn?=
 =?utf-8?B?MEVER0FmVUhINDBWc1VJQUVudVAzN1lIRi8yNXRacTFacG5lanUyOXZ4U25T?=
 =?utf-8?B?OXQreitXYi9acG5jVlVHQ0orZ09KQ2R6OUQxankwY0dlVk03WU5GZ3RuN0Rk?=
 =?utf-8?B?bW1pWklxZE9UY0pLR2dkQXlBK2FuRHNEdHFSS3VBMlk1bFNrditEWkZTd2VD?=
 =?utf-8?B?NEU1U0l5My91S3dMUm9VUUdJYWNFRUdyWGtJakc2b3lkR1hVK3d4Y1RVMmNC?=
 =?utf-8?B?Y2RFNG1YdUFpOS9TczV2VitJOVAycndoQ0ZSUzFpT3lWRXdvVDZ3S3NYSkJj?=
 =?utf-8?B?bjlXUkc1R2ZRZ2J2L29vS1JrM1J1VzdIQkY1Q0llTnl5VXc1Z1FQUURMWW5z?=
 =?utf-8?B?UDhEcGdyUGFxVnBoVStLSTYxRkZ3SEhuWStKakR0YTY1TnhkVHpiMHNkOTE3?=
 =?utf-8?B?eDRORlpESzVEL282ME9KaGJmRU9lTlVlWWF0dFRKdklsWjF4M1FRWlkxMmdn?=
 =?utf-8?B?bFZ1RWN2OHAwV0VhajlFWnNXU2E2UkFxMTY2UDBvWlZpNnZTSVByb00vbWhJ?=
 =?utf-8?B?QTY0Tmp3MGF0bXQ2bTMvRiswcTU4dG5JSm5kNXBvZkdYZit3TnFXTTVmWTdN?=
 =?utf-8?B?a3pKM2QyQWs0d25ZcWJMRFRPdFJWdVJNelZHMm9JY01SY01nL0pNUU4vdmY5?=
 =?utf-8?B?OXdUT1ZRUTlGUHhpTTlaZ3l5SkdTSGZ0NkhjcTN0eXdsRTRodndrQW5oVHIx?=
 =?utf-8?B?Z2tZQ0s0L2VMU3JSdTZzYnNMYmlkeHhtOW1SVjNjUDMyRFhzQWNCTWg2OUFt?=
 =?utf-8?B?bmJ1Zy9vY0M4TE55VGJnN3J6emc2QXcwZWtvbFhtMDlpQ251R253MXpxUUJk?=
 =?utf-8?B?TlNReEFYVVlCdWtlWnlFcURmbXN2Ykd5Ym11dmtaRXhYSkQyUUI0S1BKYVFH?=
 =?utf-8?B?R2ZzY2xJSVZLTU95MDVPUVlDUnR1SXdLWUhmWDVtY3NHUEFhdXp6LzRLNVRQ?=
 =?utf-8?B?d3lmT0EyL1FUM1VOM25EUnJFSzl1RldTaUhqc3NhQkU1ckNtZFYvREtnd0RU?=
 =?utf-8?B?cUdXZVprNzV2amZYUGNZdVQ0QkVwYlFoRWtRek1yQ1VYa2JVcUJrREJtdlVl?=
 =?utf-8?B?UE05ZUFsSVpqeHBES1IyMkM5a2NlUDBmYldTNUp6MERZTzkzWlY2VjZ1SVhv?=
 =?utf-8?B?Ym1uTlRQd0dFRENncW9nSnptM0U5Y3FoZ1c4WmV0RTJCODhPM1RyM2lQV2pq?=
 =?utf-8?B?WE9ETDdQQ1JseGMxa2xBQzN3VmcyaTlVdG91c0FaODhUMEFpdlZoaFFDcyta?=
 =?utf-8?B?NTkzZFRpWEpyTGNDUkdJdWlCR2hxU3dWYlFUaDJRaUNCNWJQQlRuK3VSc0Nn?=
 =?utf-8?B?MHp4MHUvOGtHSk1tOVFVNFhwZk1CS3R3S09JWXFiZGx6b3Jhd21qZWc5V1hw?=
 =?utf-8?B?RGZjVzVqakVmLy9UaUVvOGV4alE4TXJqVmhHTXpTNmUrR2hBdERhOGx4S0Uv?=
 =?utf-8?B?bE43c3FyQXF6OXhsaDNpZGlQaFNGTFhTU1NpMnVxSGZEVlhERnBPSi9hZXFO?=
 =?utf-8?B?MzM2aE16MGZqZC9ydW1PZEJYMkZaZzEvdi9weXZXLzhibWJ3eUVVU1U0RTFo?=
 =?utf-8?B?cmd3V1V6WXk1djBLK3lCL3B6UklmZlhxUXFYaG9OaWpVNFgyOFRmeTRHdUU2?=
 =?utf-8?B?cHJlYlVSaXh4cmdsWkRzRzQrUXB1bDMzcjZsQ2FPNDl2NWhlWjU3UDR5Nkw1?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68EDEFF207D9C04F8CA1FD2338914687@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb978b7-b3f7-4d3e-ea1f-08db773aba65
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 18:17:12.1895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvUs8DsutcBmoTeu58kjuyOUrNrII4Z6B+jMbExAhj6h8Eg/6SGabAyoCaxnHSHvKjSgsaNaXAXJyeY9ANfyeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v2] drm/xe: fix bounds checking for 'len'
 in xe_engine_create_ioctl
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

T24gTW9uLCAyMDIzLTA2LTI2IGF0IDE0OjIyIC0wNzAwLCBQYXVsbyBaYW5vbmkgd3JvdGU6DQo+
IFRoZXJlJ3MgdGhpcyBzaGFyZWQgbWFjaGluZSBydW5uaW5nIHhlLmtvIGFuZCBJIG9mdGVuIGxv
ZyBpbiB0byBzZWUgbXkNCj4gdG11eCBjb3JydXB0ZWQgYnkgbWVzc2FnZXMgc3VjaCBhczoNCj4g
DQo+ICAgICB1c2VyY29weTogS2VybmVsIG1lbW9yeSBvdmVyd3JpdGUgYXR0ZW1wdCBkZXRlY3Rl
ZCB0byB3cmFwcGVkIGFkZHJlc3MgKG9mZnNldCAwLCBzaXplIDE4NDQ2NjYwMTUxOTY1MTk4NzU0
KSENCj4gDQo+IEkgYWxzbyBzb21ldGltZXMgc2VlOg0KPiANCj4gICAgIGtlcm5lbCBCVUcgYXQg
bW0vdXNlcmNvcHkuYzoxMDIhDQo+IA0KPiBTb21lb25lIGlzIHJ1bm5pbmcgYSBwcm9ncmFtIHRo
YXQncyBkZWZpbml0ZWx5IHN1Ym1pdHRpbmcgcmFuZG9tDQo+IG51bWJlcnMgdG8gdGhpcyBpb2N0
bC4gSWYgeW91IHBhc3Mgd2lkdGg9NjU1MzUgYW5kDQo+IG51bV9wbGFjZW1lbnRzPTMyNzY5IHRo
ZW4geW91IGdldCBhIG5lZ2F0aXZlICdsZW4nLCB3aGljaCBhdm9pZHMgdGhlDQo+IEVJTlZBTCBj
aGVjaywgbGVhZGluZyB0byB0aGUgYnVnLg0KPiANCj4gU3dpdGNoICdsZW4nIHRvIHUzMi4gSXQg
aXMgdGhlIHJlc3VsdCBvZiB0aGUgbXVsdGlwbGljYXRpb24gb2YgdHdvIHUxNg0KPiBudW1iZXJz
LCBzbyBpdCB3b24ndCBiZSBhYmxlIHRvIG92ZXJmbG93IGJhY2sgaW50byBzbWFsbGVyIG51bWJl
cnMgYXMNCj4gYW4gdTMyLg0KPiANCj4gVmVyeSBzaW1wbGUgcmVwcm9kdWNlcjoNCj4gICAgIGh0
dHBzOi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+cHphbm9uaS9lbmdpbmUtY3JlYXRlLWJ1Zy8N
Cj4gDQo+IHYyOiBNYWtlIGxlbiB1MzIgaW5zdGVhZCBvZiBjaGVja2luZyBmb3IgPD0wIChKb3PD
qSkuDQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogUGF1bG8gWmFub25pIDxwYXVsby5yLnph
bm9uaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5j
IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jDQo+IGluZGV4IDZlNmIyOTEzZjc2Ni4uNTMwZjU1
YTMzYjAzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2VuZ2luZS5jDQo+IEBAIC01MjIsNyArNTIyLDcg
QEAgaW50IHhlX2VuZ2luZV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwNCj4gIAlzdHJ1Y3QgeGVfZW5naW5lICplID0gTlVMTDsNCj4gIAl1MzIgbG9naWNh
bF9tYXNrOw0KPiAgCXUzMiBpZDsNCj4gLQlpbnQgbGVuOw0KPiArCXUzMiBsZW47DQo+ICAJaW50
IGVycjsNCj4gIA0KPiAgCWlmIChYRV9JT0NUTF9FUlIoeGUsIGFyZ3MtPmZsYWdzKSB8fA0KDQo=
