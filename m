Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72CEC48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 18:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBE310EE6D;
	Mon, 26 Feb 2024 18:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PB72R8uI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF7C10EE1F
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708973328; x=1740509328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nMLXGKKJJhTKJIM9r28EKiiOS4pIWD+c/sO/tQaWVj8=;
 b=PB72R8uITWL3qhBxLGCkRLWub1EvCPGbRmNip7f7szxlaTKKAUE0S6D2
 D+azC43Nx0f8QnDrxXghBOaUFmEChg6K+9dBc9GP+Kye1G838TSOcpuYF
 pOghynJIHvJgxls6j7EPzhdFAWqbhvEbQzsOSUNzkX4zDhfbNtiBVEUar
 ieJWuwxoLY/kpxC73/t9bOvtn5eQiRX1VFywPhR70TIg0bcpPgryezSUr
 8Jo+WZDhcJXVsNXZhzbwJcGaG+ZvnlRK4uDYRRRSu0fsi8CYtp5a2AfAT
 KmkiS3We5yPllexpaeeXZ9ZTTY4FN3pobf89C57Z6A06eyrO2G1tqKjiq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7103649"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="7103649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 10:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="6788496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 10:48:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:48:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 10:48:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 10:48:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6ed4Yq6GahA8YCWXLE2upsigHKxTsbz3X4K4cp+Xis3Bhe3XgUmls4ArF7C3diJKZ/Ww17pu+ZGk2M5ahMvqQlDB9KGDG5kDXk0SiczDcq0hUaHmGFWLgKpQPE85rP+g+QBxWyyyJ9A/rrn0dLoyP0ulrvj1rLzv/UFzPXj+y2x8xG/FlbPq/Agtncv3Lie/+0nNAbijVN9gLnMML2pRwVwxEEUWubk8S5jrVrCC8oAgJnCAw6C2/jwfzmzoSaM+JHA2r8SqhGLt1THfBdadE45/Ep6vQUJ9TFkSvHFTmdx7cMbT2XqBfotUuWcG+rcaeCt3BUq6bKp2gef6DPoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMLXGKKJJhTKJIM9r28EKiiOS4pIWD+c/sO/tQaWVj8=;
 b=RlkNsHqPyD1oOQiT2D1hmkHzvoGYhCYbefCf8AtPhn2qQthhjT4LjGvTebps/m05MapS/K2dmE0Yj5MSN2fWXL3XpsI0MY+zu9AMrXNHZp1n1yJxALkgDhQYxSl478nMBGcrPUZKfMXMC0QD/48rQlZLJY9274oeHUy7FDEP9cY15YSQeI1NDc2qFBoOg0UlrAqWK8TC4Wi4XOMDNQkVo8jXa3DFgLCb0sgT8PbicXBw/Ra9mM3E0zcB2sZoeonaHgd25UrNcgSNThcdY6FhZWqpWEEpjEPozWerBMaPgHD2trGwQuR6Rr0NCLk8h9GKSvOZV/S/BB1XUjnz/9scGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 26 Feb
 2024 18:48:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 18:48:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Move LRC snapshot capture to HW engine.
Thread-Topic: [PATCH v2 2/3] drm/xe: Move LRC snapshot capture to HW engine.
Thread-Index: AQHaaMzfoBXR8XXNIUihTdPGtr04XLEc9zoA
Date: Mon, 26 Feb 2024 18:48:42 +0000
Message-ID: <03686a0e723d08020e8ad571c336e29cfdcc97b7.camel@intel.com>
References: <20240226155913.77158-1-dev@lankhorst.se>
 <20240226155913.77158-2-dev@lankhorst.se>
In-Reply-To: <20240226155913.77158-2-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7876:EE_
x-ms-office365-filtering-correlation-id: cd1e15a3-3c02-4146-60c1-08dc36fb8e30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: INz7SJS9aUdhazio2deotreq3LHRkQzdR7lUrSRGB2/y0XoTCntXxvwBbBRZFbJLTmq7TfIEcWWgwD0OGRb34tFeDiEyR85m+fbftrGOcffd13V6CIGabyQiVjtOKbbgHB9IolEOhfYZcpelBM+2anwaiMsrh7N774gYw+jud4xTeVJ2xz7t6iXq+P1iJibd1x5lPkqTknUUvp10ghw7xBP7Firr8z2RR/Ve4BJq5o7aQNnix7TBH788jAmiHGndR7GmoH4w32ulbcc9sALqIT8U4sH9MT4xupxY07YkPmZbpexcoQbR9RkqcD1TGZFrYZkKpUWT9FmIxTdTlJV6Cu2CXW2BXUr3ON3HqA+6J3DERC1OSvTChjdUibl1fdTc9+ANayN8K5koUjQED/gwEx5nH6+649Z8evfbYVSLVpZVZnNjEer2evMYRpqHu5//zXz2wRySasrq+vK9KmqX7+9e1WvEqFndgQ/Md56pGuzGWZMg/WfAsEXSIn6jlgJ2DjSvJTTQwDrgbBH5K+TqgLc2DuI/z2MOtD0c1ZrmWmT6OC8elBKFnwDpeyYIsO0DK1rOuuKGJ7PR2BgSIvhQhelHTPeJZxOUVpAMQWxC0zpYoC19I0XObjqFlRn/ieSD4or5JMPrTbJIIe93Aadl4uX3aPBRKPkaB422PusI6vCrf0ffxTA9OvBg1rsYmHKBhOlZhnwrRZqO6leFMrr3JlVoNB7hmf10fUC/PKf1+m0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWl4R0VjNmNoK3VsQjZuWmUvbHdEaFNlMTRFbjBoQVJ6UmpBWGluSFo2Umto?=
 =?utf-8?B?bUNmNGhYeFBWdVNSWTl6NTkyUDVpMXU2ZGVsTUh0TVkwcmhhSnBDUFUyMFYv?=
 =?utf-8?B?Y3pYTXJ2OG1MV1BERTBoZ01DVTUyMCtNeUxKd1BuK3J1WU1GM0J6bGIxVjQ4?=
 =?utf-8?B?aTR1MWVJcy9OYjJCSEF5bEcvNjI3SldxYU1LWHF5LzdsdXU3VHV4RVc3WTBZ?=
 =?utf-8?B?NmE2ODRORDBDRHIvQ0NWY0lHR1JUR0VhKzJzNXNQcS9BNjUwVEZ0S0tMcXk0?=
 =?utf-8?B?T0o0TEhvWkIzSlBQdDhtanNnQitjWGlYZkNpTVlMaktsZjFDWENOdjN2Ri85?=
 =?utf-8?B?Q1AxbStQbEsxZVkwdHRGdDd2MVV3SlRBcHVZbjl3Q2xKK1pkN1dUbW51bWdv?=
 =?utf-8?B?VWVFd3U2eURWVmxQM3N1QXhTZWNRTGpQRWszbXpyQjdYdHJxTjR0eCtaL0d2?=
 =?utf-8?B?SFl3MmZBcDl3YXdhUjVLZVdGRzBqa1hCdU9DK1pMYWMzc3JadVFVZGkvK2hU?=
 =?utf-8?B?YUxjNVBSNnhwSmpGTmhsd2ZHYVFOa0UycWtiSW1IaXh4V1MyaytRL0NCM015?=
 =?utf-8?B?Nk5FODVGT1EwZFBFRzNueGJLWWpqOGsyUTluYjBtQXlpSjZFSkpsaFdjQzVv?=
 =?utf-8?B?OFNKV0ZJVnZUb0ZsbHFVU2RRRXhrMnE5OXp6RklaTGxBWERUTlY0c1VtMnNL?=
 =?utf-8?B?OWo5RVhrYVRVN2tBZ003d2NoS2dEbXFzdm1qWW9NQWl2YWJER1hTY3g0dlJM?=
 =?utf-8?B?a3l6Y29wVXhpTUxJVUwwUFV3MEZMbktHRWs4dEpYR09PUW9pbFVicVJPZ2ZH?=
 =?utf-8?B?bVJLR081T0c4OElieDdIaTRTK1Q0RmJyblBYeDB4TmJYWmpUUVlDaXYyenpv?=
 =?utf-8?B?MmErbys3U1dxUENqK09mVUJzSXVCTVorNEM2RXBXWEhOdzhRZHhuQkpRS1lK?=
 =?utf-8?B?SExDZjRLbVM4cEhuaU55WUxoVTZ1YXI3UlBkeGlNWmVHVEJyWCtmWm9FQ2gv?=
 =?utf-8?B?aGFZL3VSbWRUMzVIM09TT0JIZEhJYTh3aGVwZWNMeEhtRERRRkd6SHRDbGhz?=
 =?utf-8?B?eXMvM0hKQy9XTjlsWmtWamVBc2NiSndxL1RidHE3clBnbjV0WE5hcEoyUUlR?=
 =?utf-8?B?UzVTcWt2QUQwRDR6WU1Qcjl1QkdrMmFUOGhlN1ZSNHFjMTN3Skh5b05sNjlw?=
 =?utf-8?B?V3k4dlZZK3NBZC9abi85RDIySFZESEEvbHZVL3FJQithZm9ZSitIUGNMa2ZJ?=
 =?utf-8?B?VUFsN2RNazRQYTcwNnVDR3N0Q25HUStuUHBKaUlNY1JadmZlOFhKZkxSK3lR?=
 =?utf-8?B?TSt2SklDUDRkVGhIOVRRUTlZZ0JlQk9adXAvemtsQllFWEd5QkZjQ3N0NGhv?=
 =?utf-8?B?cnpwREF4NnVub0J4VkxsVWg1WDdDMXdkK3BSVXlQa2gzNHhKWlhwbFRFNWY3?=
 =?utf-8?B?TW1Yckw3UGRXZ00wSXN3dVdQRWJncmZ3SXJHRDdjV2pYWHVUS3pnV2FJSEsz?=
 =?utf-8?B?Z24rSVpiYmpqWEkrbmFtNUo1ZzA4bGtHRlNFTENZUEIyY1p5QURkM3hxUHJE?=
 =?utf-8?B?bEJlbnBERU4zOVlrK1dVQStuZnMzanA0MEo4NzZFclo2UTV3RGxScjNWQldI?=
 =?utf-8?B?RGdYZnAwUEl5azFkZTE3U1hnUURzOXNyMlBPTGpDbE5FSmhiYSttZm8rRnM2?=
 =?utf-8?B?NDdqOHlUbElnbEthZy9jK2RhNUd4V2RpbmZubncwV1RmRjhFUHV0dlZmRkdq?=
 =?utf-8?B?eVhDQWFIK1ZsMmMyaC9UODU5ZjRaZDRMeDJMQ3QwR3ltMCtlVDZLQ3JHYnI3?=
 =?utf-8?B?Q01va0xnSUwxd05CQXRCb2RGTUt3Q3NMbHAwam5OQ0NVaWEwQk9Ra3A5SGFq?=
 =?utf-8?B?TUlHRTVhazFHeEZGSzE0SGE1ZzdaL2FjMUhNSURFZDg3bHEzUjJJcFFBNUFC?=
 =?utf-8?B?RE1LVllkWjFSNUt6UVB1MGlsYm9zTHBDaUtYcGhVcjViRmR0UkRzczcrcnNR?=
 =?utf-8?B?VDhadkdjcVh4NHhqdnpHeEIrMU1HNzYxNTl4Z05hRkZ2TDRmbnZhMm9QRXYw?=
 =?utf-8?B?V3ArTlpMZUQ0aTlBMmFQTkx1MkpiVFRLVkhQaFdZa0RrM3B1bWxXSU5vR0hM?=
 =?utf-8?B?U2lDd2NCL3MxSVV1R1lRMjJWTWczYVFwTjc0cnNPU2srd3h6LzI1OFU3UzN5?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7493590C47CB49468F9C7945ED2B712F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1e15a3-3c02-4146-60c1-08dc36fb8e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 18:48:42.9637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNv9sQ7m3wX89URBd9qF0ksyJJoQZl8/2E8o3+j6IBgXAHxbHbJhN9+aKfDvaDbtJ8KakPXtq86drJQS5jGtnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

T24gTW9uLCAyMDI0LTAyLTI2IGF0IDE2OjU5ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gDQo+IFdlIHdhbnQgdG8gc3RhcnQgZHVtcGluZyBzdGF0dXMgcGFnZXMuIFNp
bmNlIHdlIGNyZWF0ZWQgc29tZSBmdW5jdGlvbnMNCj4gdG8gZHVtcCBMUkMsIEkgdGhpbmsgaXQg
bWFrZXMgc2Vuc2UgdG8gbW92ZSBpdCB0byBIVyBlbmdpbmUgc2VjdGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+DQo+IA0KPiAtLQ0KPiBYWFg6IEkndmUgdXNlZCBhIGxpbmVhciBtYXBwaW5nIGZvciBI
VyBFbmdpbmUgdG8gTFJDLg0KPiBMUkNbMF0gYmVsb25naW5nIHRvIGxvd2VzdCBIVyBlbmdpbmUg
aW5zdGFuY2UsIGV0Yy4uDQo+IElzIHRoaXMgY29ycmVjdCBmb3IgcGFyYWxsZWwgc3VibWlzc2lv
bnM/DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgICAgICAg
fCAxOSArKysrKysrKysrKysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29y
ZWR1bXBfdHlwZXMuaCB8ICA2ICsrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXQuYyAgICAgICAgfCAyMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0X3R5cGVzLmggIHwgIDMgLS0tDQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmNvcmVkdW1wLmMNCj4gaW5kZXggNjhkM2Q2MjNhMDViLi43MDAyZTNiNjk4ZjIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+IEBAIC0xNiw2ICsxNiw3IEBA
DQo+ICAjaW5jbHVkZSAieGVfZ3VjX2N0LmgiDQo+ICAjaW5jbHVkZSAieGVfZ3VjX3N1Ym1pdC5o
Ig0KPiAgI2luY2x1ZGUgInhlX2h3X2VuZ2luZS5oIg0KPiArI2luY2x1ZGUgInhlX2xyYy5oIg0K
PiAgI2luY2x1ZGUgInhlX3NjaGVkX2pvYi5oIg0KPiAgI2luY2x1ZGUgInhlX3ZtLmgiDQo+ICAN
Cj4gQEAgLTExMywxMCArMTE0LDIwIEBAIHN0YXRpYyBzc2l6ZV90IHhlX2RldmNvcmVkdW1wX3Jl
YWQoY2hhciAqYnVmZmVyLCBsb2ZmX3Qgb2Zmc2V0LA0KPiAgCXhlX3NjaGVkX2pvYl9zbmFwc2hv
dF9wcmludChjb3JlZHVtcC0+c25hcHNob3Quam9iLCAmcCk7DQo+ICANCj4gIAlkcm1fcHJpbnRm
KCZwLCAiXG4qKioqIEhXIEVuZ2luZXMgKioqKlxuIik7DQo+IC0JZm9yIChpID0gMDsgaSA8IFhF
X05VTV9IV19FTkdJTkVTOyBpKyspDQo+ICsJZm9yIChpID0gMDsgaSA8IFhFX05VTV9IV19FTkdJ
TkVTOyBpKyspIHsNCj4gIAkJaWYgKGNvcmVkdW1wLT5zbmFwc2hvdC5od2VbaV0pDQo+ICAJCQl4
ZV9od19lbmdpbmVfc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90Lmh3ZVtpXSwNCj4g
IAkJCQkJCSAgICAmcCk7DQo+ICsJfQ0KPiArDQo+ICsJZHJtX3B1dHMoJnAsICJcbioqKiogTFJD
ICoqKipcbiIpOw0KPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNvcmVkdW1wLT5zbmFw
c2hvdC5scmMpOyBpKyspIHsNCj4gKwkJaWYgKCFjb3JlZHVtcC0+c25hcHNob3QubHJjW2ldKQ0K
PiArCQkJY29udGludWU7DQo+ICsJCWRybV9wcmludGYoJnAsICJMUkMgJWlcbiIsIGkpOw0KPiAr
CQl4ZV9scmNfc25hcHNob3RfcHJpbnQoY29yZWR1bXAtPnNuYXBzaG90LmxyY1tpXSwgJnApOw0K
DQpXZSB3b3VsZCBuZWVkIGluZm9ybWF0aW9uIGFib3V0IHdoYXQgY2xhc3MgYW5kIHdpZHRoIHRo
aXMgTFJDIGlzIHNvIFVNRCBjYW4gZG8gdGhlIG1hcHBpbmcuDQoNClRha2luZyB0aGUgb3B0aW9u
cyBJIGd1ZXNzIGl0IHdvdWxkIGJlIGJldHRlciBrZWVwIGl0IGluc2lkZSB3aGVyZSBpdCB3YXMo
KioqKiBHdUMgQ1QgKioqKiAtPiBHdUMgSUQpLCBzb3JyeSBmb3IgYXNraW5nIGl0IHRvIGJlIG1v
dmVkLg0KDQpJZiBpbiBmdXR1cmUgdGhlIGlzIGEgcmVwbGFjZW1lbnQgZm9yIEd1QyBvciBzb21l
dGhpbmcgbGlrZSB0aGF0IHRoZSBMUkMgZnVuY3Rpb25zIGNhbiBiZSBjYWxsZWQgZnJvbSB0aGUg
c2VjdGlvbiB0aGF0IHByaW50cyB0aGUgaW5mb3JtYXRpb24gYWJvdXQNCnRoaXMgbmV3IHNlY3Rp
b24uDQoNCj4gKwl9DQo+ICsNCj4gIAlpZiAoY29yZWR1bXAtPnNuYXBzaG90LnZtKSB7DQo+ICAJ
CWRybV9wcmludGYoJnAsICJcbioqKiogVk0gc3RhdGUgKioqKlxuIik7DQo+ICAJCXhlX3ZtX3Nu
YXBzaG90X3ByaW50KGNvcmVkdW1wLT5zbmFwc2hvdC52bSwgJnApOw0KPiBAQCAtMTM5LDkgKzE1
MCwxMSBAQCBzdGF0aWMgdm9pZCB4ZV9kZXZjb3JlZHVtcF9mcmVlKHZvaWQgKmRhdGEpDQo+ICAJ
eGVfZ3VjX2N0X3NuYXBzaG90X2ZyZWUoY29yZWR1bXAtPnNuYXBzaG90LmN0KTsNCj4gIAl4ZV9n
dWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9mcmVlKGNvcmVkdW1wLT5zbmFwc2hvdC5nZSk7DQo+ICAJ
eGVfc2NoZWRfam9iX3NuYXBzaG90X2ZyZWUoY29yZWR1bXAtPnNuYXBzaG90LmpvYik7DQo+IC0J
Zm9yIChpID0gMDsgaSA8IFhFX05VTV9IV19FTkdJTkVTOyBpKyspDQo+ICsJZm9yIChpID0gMDsg
aSA8IFhFX05VTV9IV19FTkdJTkVTOyBpKyspIHsNCj4gKwkJeGVfbHJjX3NuYXBzaG90X2ZyZWUo
Y29yZWR1bXAtPnNuYXBzaG90LmxyY1tpXSk7DQo+ICAJCWlmIChjb3JlZHVtcC0+c25hcHNob3Qu
aHdlW2ldKQ0KPiAgCQkJeGVfaHdfZW5naW5lX3NuYXBzaG90X2ZyZWUoY29yZWR1bXAtPnNuYXBz
aG90Lmh3ZVtpXSk7DQo+ICsJfQ0KPiAgCXhlX3ZtX3NuYXBzaG90X2ZyZWUoY29yZWR1bXAtPnNu
YXBzaG90LnZtKTsNCj4gIA0KPiAgCS8qIFRvIHByZXZlbnQgc3RhbGUgZGF0YSBvbiBuZXh0IHNu
YXBzaG90LCBjbGVhciBldmVyeXRoaW5nICovDQo+IEBAIC0xOTUsNiArMjA4LDggQEAgc3RhdGlj
IHZvaWQgZGV2Y29yZWR1bXBfc25hcHNob3Qoc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVt
cCwNCj4gIAkJfQ0KPiAgCQljb3JlZHVtcC0+c25hcHNob3QuaHdlW2lkXSA9IHhlX2h3X2VuZ2lu
ZV9zbmFwc2hvdF9jYXB0dXJlKGh3ZSk7DQo+ICAJfQ0KPiArCWZvciAoaSA9IDA7IGkgPCBxLT53
aWR0aDsgaSsrKQ0KPiArCQljb3JlZHVtcC0+c25hcHNob3QubHJjW2ldID0geGVfbHJjX3NuYXBz
aG90X2NhcHR1cmUoJnEtPmxyY1tpXSk7DQoNCllvdSBhcmUgcHJpbnRpbmcgbHJjIHdpdGggJ2Zv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNvcmVkdW1wLT5zbmFwc2hvdC5scmMpOyBpKyspIHsn
LCBmcmVlaW5nIHdpdGggJ2ZvciAoaSA9IDA7IGkgPCBYRV9OVU1fSFdfRU5HSU5FUzsgaSsrKSB7
JyBhbmQNCmNhcHR1cmluZyB3aXRoICdmb3IgKGkgPSAwOyBpIDwgcS0+d2lkdGg7IGkrKyknLCBp
dCBzaG91bGQgYmUgYSBzaW1pbGFyIG1ldGhvZCBub3QgMyBkaWZmZXJlbnQuDQoNCkJ1dCBrZWVw
aW5nIGl0IHRoZSBwcmV2aW91cyBzZWN0aW9uIGl0IHdvdWxkIG5vdCBiZSBhIGlzc3VlLg0KDQo+
ICANCj4gIAlpZiAoc3MtPnZtKQ0KPiAgCQlxdWV1ZV93b3JrKHN5c3RlbV91bmJvdW5kX3dxLCAm
c3MtPndvcmspOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVk
dW1wX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXBfdHlwZXMuaA0K
PiBpbmRleCA2ZjY1NGI2M2M3ZjEuLmQ1NmFjMjBlMmNhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmgNCj4gQEAgLTE0LDYgKzE0LDggQEANCj4gIHN0
cnVjdCB4ZV9kZXZpY2U7DQo+ICBzdHJ1Y3QgeGVfZ3Q7DQo+ICANCj4gK3N0cnVjdCB4ZV9scmNf
c25hcHNob3Q7DQo+ICsNCj4gIC8qKg0KPiAgICogc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBz
aG90IC0gQ3Jhc2ggc25hcHNob3QNCj4gICAqDQo+IEBAIC00MCw2ICs0MiwxMCBAQCBzdHJ1Y3Qg
eGVfZGV2Y29yZWR1bXBfc25hcHNob3Qgew0KPiAgDQo+ICAJLyoqIEBod2U6IEhXIEVuZ2luZSBz
bmFwc2hvdCBhcnJheSAqLw0KPiAgCXN0cnVjdCB4ZV9od19lbmdpbmVfc25hcHNob3QgKmh3ZVtY
RV9OVU1fSFdfRU5HSU5FU107DQo+ICsNCj4gKwkvKiogQGxyYzogU25hcHNob3Qgb2YgZWFjaCBM
UkMgKi8NCj4gKwlzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpscmNbWEVfTlVNX0hXX0VOR0lORVNd
Ow0KPiArDQo+ICAJLyoqIEBqb2I6IFNuYXBzaG90IG9mIGpvYiBzdGF0ZSAqLw0KPiAgCXN0cnVj
dCB4ZV9zY2hlZF9qb2Jfc25hcHNob3QgKmpvYjsNCj4gIAkvKiogQHZtOiBTbmFwc2hvdCBvZiBW
TSBzdGF0ZSAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gaW5kZXggNzM0ODY4
OWVjNWFlLi42NmRjNTYxMzM2ZGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfc3VibWl0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQu
Yw0KPiBAQCAtMTgxNCwxNyArMTgxNCw2IEBAIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2Nh
cHR1cmUoc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKQ0KPiAgCXNuYXBzaG90LT5zY2hlZF9wcm9w
cy5wcmVlbXB0X3RpbWVvdXRfdXMgPQ0KPiAgCQlxLT5zY2hlZF9wcm9wcy5wcmVlbXB0X3RpbWVv
dXRfdXM7DQo+ICANCj4gLQlzbmFwc2hvdC0+bHJjID0ga21hbGxvY19hcnJheShxLT53aWR0aCwg
c2l6ZW9mKHN0cnVjdCB4ZV9scmNfc25hcHNob3QgKiksDQo+IC0JCQkJICAgICAgR0ZQX0FUT01J
Qyk7DQo+IC0NCj4gLQlpZiAoc25hcHNob3QtPmxyYykgew0KPiAtCQlmb3IgKGkgPSAwOyBpIDwg
cS0+d2lkdGg7ICsraSkgew0KPiAtCQkJc3RydWN0IHhlX2xyYyAqbHJjID0gcS0+bHJjICsgaTsN
Cj4gLQ0KPiAtCQkJc25hcHNob3QtPmxyY1tpXSA9IHhlX2xyY19zbmFwc2hvdF9jYXB0dXJlKGxy
Yyk7DQo+IC0JCX0NCj4gLQl9DQo+IC0NCj4gIAlzbmFwc2hvdC0+c2NoZWR1bGVfc3RhdGUgPSBh
dG9taWNfcmVhZCgmcS0+Z3VjLT5zdGF0ZSk7DQo+ICAJc25hcHNob3QtPmV4ZWNfcXVldWVfZmxh
Z3MgPSBxLT5mbGFnczsNCj4gIA0KPiBAQCAtMTg4NiwxMCArMTg3NSw2IEBAIHhlX2d1Y19leGVj
X3F1ZXVlX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25h
cHNob3QgKnNuYXBzDQo+ICAJCSAgIHNuYXBzaG90LT5zY2hlZF9wcm9wcy50aW1lc2xpY2VfdXMp
Ow0KPiAgCWRybV9wcmludGYocCwgIlx0UHJlZW1wdCB0aW1lb3V0OiAldSAodXMpXG4iLA0KPiAg
CQkgICBzbmFwc2hvdC0+c2NoZWRfcHJvcHMucHJlZW1wdF90aW1lb3V0X3VzKTsNCj4gLQ0KPiAt
CWZvciAoaSA9IDA7IHNuYXBzaG90LT5scmMgJiYgaSA8IHNuYXBzaG90LT53aWR0aDsgKytpKQ0K
PiAtCQl4ZV9scmNfc25hcHNob3RfcHJpbnQoc25hcHNob3QtPmxyY1tpXSwgcCk7DQo+IC0NCj4g
IAlkcm1fcHJpbnRmKHAsICJcdFNjaGVkdWxlIFN0YXRlOiAweCV4XG4iLCBzbmFwc2hvdC0+c2No
ZWR1bGVfc3RhdGUpOw0KPiAgCWRybV9wcmludGYocCwgIlx0RmxhZ3M6IDB4JWx4XG4iLCBzbmFw
c2hvdC0+ZXhlY19xdWV1ZV9mbGFncyk7DQo+ICANCj4gQEAgLTE5MTQsMTUgKzE4OTksOSBAQCB4
ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVj
X3F1ZXVlX3NuYXBzaG90ICpzbmFwcw0KPiAgICovDQo+ICB2b2lkIHhlX2d1Y19leGVjX3F1ZXVl
X3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9zbmFwc2hvdCAq
c25hcHNob3QpDQo+ICB7DQo+IC0JaW50IGk7DQo+ICAJaWYgKCFzbmFwc2hvdCkNCj4gIAkJcmV0
dXJuOw0KPiAgDQo+IC0JaWYgKHNuYXBzaG90LT5scmMpIHsNCj4gLQkJZm9yIChpID0gMDsgaSA8
IHNuYXBzaG90LT53aWR0aDsgaSsrKQ0KPiAtCQkJeGVfbHJjX3NuYXBzaG90X2ZyZWUoc25hcHNo
b3QtPmxyY1tpXSk7DQo+IC0JCWtmcmVlKHNuYXBzaG90LT5scmMpOw0KPiAtCX0NCj4gIAlrZnJl
ZShzbmFwc2hvdC0+cGVuZGluZ19saXN0KTsNCj4gIAlrZnJlZShzbmFwc2hvdCk7DQo+ICB9DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdF90eXBlcy5oIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXRfdHlwZXMuaA0KPiBpbmRleCBkYzc0NTZj
MzQ1ODMuLjkyYTdiN2JjYjg5OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXRfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1
Ym1pdF90eXBlcy5oDQo+IEBAIC05Nyw5ICs5Nyw2IEBAIHN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4
ZWNfcXVldWVfc25hcHNob3Qgew0KPiAgCQl1MzIgcHJlZW1wdF90aW1lb3V0X3VzOw0KPiAgCX0g
c2NoZWRfcHJvcHM7DQo+ICANCj4gLQkvKiogQGxyYzogTFJDIFNuYXBzaG90ICovDQo+IC0Jc3Ry
dWN0IHhlX2xyY19zbmFwc2hvdCAqKmxyYzsNCj4gLQ0KPiAgCS8qKiBAc2NoZWR1bGVfc3RhdGU6
IFNjaGVkdWxlIFN0YXRlIGF0IHRoZSBtb21lbnQgb2YgQ3Jhc2ggKi8NCj4gIAl1MzIgc2NoZWR1
bGVfc3RhdGU7DQo+ICAJLyoqIEBleGVjX3F1ZXVlX2ZsYWdzOiBGbGFncyBvZiB0aGUgZmF1bHR5
IGV4ZWNfcXVldWUgKi8NCg0K
