Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5DAC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 18:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A8810E65E;
	Wed, 29 Nov 2023 18:34:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC9010E236
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701282840; x=1732818840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Juu7G0A94FJQz5uWK6PodRMFFKWZI+JlmOp5oN+sTMQ=;
 b=fqdHvYb3YpwvUI6OYcYGwyCE/EQksBdmtQvewajW6+ok9KsOI7FqzRAi
 mh5R6mUvIkK9tbOI5Ef222YSopjzb+LaxfRKfwLrc2v0LwzZo26IgpDtz
 ouzFUYlY6x+1e1kvOXqY8jrW4vBxs34PxoaV+K+YwnR44rFfxhFE74/kP
 BufdXTYyo9AjUAQPevAVpkup5RHKYEWu3C3p7ElJgMiIBvDdHeJkkTiUZ
 TwtwOVq0+8IqMgnlAIT2/UpG96hz3SaZCs6gigW9elhnDB3aWBDWylo3s
 bz+XYHTjmJNNErEAdfATf6+xP8hRaZkXJpNm3B+x+HkjudyBeuJfgK19F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="396017621"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="396017621"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839527801"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="839527801"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 10:33:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:33:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 10:33:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 10:33:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnHOrZeZA4QhU7XPeCFNnKBPP9h+8prjoo5XPmN4hOdswOY4Zc8f9AiJNHrpt/3R3UtkJbm168XI+pih1gGnzQQ6HlJSdp5Z3KYwQT+Cz3luLQmYxQ0aLlxbTfRS8nkaV3frPv1s1Svr/UVgzloIifhCZBPhmhBiZgCQscddp/WW/hsBDo09hZwB+BfFq4LDb9TZOCwZy8JVlZPeIjqk065c0zn4IiEQattTm968eL59UNv0mKJj7N05uUc9weycmKPCfJnouoWTfDXmbZDGZLkaD6CUT79GcXuVE8w1lGqiHV0KUAvftE209xPYtExkOe4cIzUSq0NLg7q7ve6f3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Juu7G0A94FJQz5uWK6PodRMFFKWZI+JlmOp5oN+sTMQ=;
 b=nrmnnbWnkItjMJdGNUjYoHelmBtqdcrnbhLSWHWK6igLa0IPgDoQocyF6ux61GtXvYmNDTP1B+SXICfwa+ZreyDM/zu8l1Q5Zj1Hd6XEn5mzBrkM9/vfmY5591CtPfqeS3FJ0z4tUZxjRb11EETpB85JcrHvqefkisAxMP89lcsu1Xc44u5Az4V77yGJ6MjpEQZr6GVFeMbHugVZ9ibdJte0B+OFnb2emfxG2geLHkfuq4Js5PgxgsT4Q/dTGGQNs9ldrkXMriVzArhtGtKPsGfZWmXPLvrxCLxPyGxTqn+Nvbn7bAOQ0U1Md1jdHJt2ZE2R7eEfzIjzu56TguRInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 18:33:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 18:33:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 12/14] drm/xe/uapi: Add Tile ID information
 to the GT info query
Thread-Index: AQHaHVGpWHEjO3+cjkqYvYL8FiS4F7CJ0gcAgARppICAAANKgIADa5sA
Date: Wed, 29 Nov 2023 18:33:55 +0000
Message-ID: <b0c5c2ff17239546a5c6b0cbea7a70375ec31618.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-13-francois.dugast@intel.com>
 <09a13c69df528c028abaf2c32c8285a65d22c5fb.camel@intel.com>
 <ZWSiy_XVQ1HNywv-@fdugast-desk.home>
 <74f1088679ef4fe73648c09f639afe6a2ec2e3c8.camel@intel.com>
In-Reply-To: <74f1088679ef4fe73648c09f639afe6a2ec2e3c8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5117:EE_
x-ms-office365-filtering-correlation-id: 77185184-cee4-450d-a88b-08dbf109be64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2eXG5ebddYowyqhoTHyTSN9bso6QkxlpDL2E2jNisPKIt9sUD8OiraQlg43NByKpuQKm6dJF3yq1fQjdlZLRewPWXrPiD49NHJem5mU/nOFaZclFJYHKFVfNtHvvm0lmhUyRyZW+6yhwf6MjcUS5zw6RFEp7Z1MLpIiOWJezP/larBJrnddWaNQQmtCybHU3DxU0YUz9ki9QehbuZGMsQT7fYEkiKadNuJRdOjRyE6JIQjNO9l+b0+uTYSRUBuqJrBd6hAL8t3qGw55iqUXx50nOdPH8AchXXYHZDaPRGp7Hwqvsaxyy917o6sgYc/rbMcET+PEAmp1zPD1Z+JmqaEYrzzP+BTUU1qw/Maosgr6xgf96szcZzPuvKm/6dWfty9zsdxFqcd5kCNUB8XJDExC7zb+sYLkeHBCN3H2GqjWc/DLzEhczXwtD1yi+nv2P/cD6MIBh3nZ5TIlugcI3aEo9PoQPE+2Hb0mTVRNX/CMOtCRDxrq3fsRI671yl0GkLJ5pSyWg7ABDX/i4j7F2MA/ncWBwpSe2ytlv3O2JmkRLTOTYjLT7uP6YQpcwsVd6q3AmupMpzTogd1zh5rtvoMaS59JVLTjdfNxO8ytEK3May6xS4UdzPz7Vr7ZoogPR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(36756003)(83380400001)(86362001)(122000001)(38100700002)(91956017)(6636002)(66556008)(316002)(76116006)(66946007)(66446008)(37006003)(6486002)(64756008)(66476007)(8676002)(478600001)(4001150100001)(5660300002)(6862004)(41300700001)(38070700009)(4326008)(8936002)(2906002)(26005)(2616005)(6506007)(71200400001)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUk0TTdzbFBXbWppamxzOUZCYjF0Tzl3ejBoN216ZWxTWlVybEVaNU51Ukwr?=
 =?utf-8?B?RUtjYnEzLyt3VWFDaHZlWkN4c08wMEJiTC9RZ045aG9ZLzlWaXJVZmt4UUFF?=
 =?utf-8?B?NXhVbnJkdElYWk9DUnl3SUFkQ0dodVA2R2x3RXAxRU9KNHpSZlZON3lJNHkz?=
 =?utf-8?B?MStXdWt5TlNjVEtqek4zVGMwcktSSmgya0ZuekRFRHhjMjJha1p1dFRJczJK?=
 =?utf-8?B?aENraHJCbW9GY29MaFBKT0svQWJJSGU4UGxiRDZCSWlBQTdNZCt2SkVhYUUz?=
 =?utf-8?B?QUZpb0h0aFRKVC9kOXUrUlI2ajY4b1NBSkJLeDZvRnBkdFZsY2NCSmRqSllN?=
 =?utf-8?B?SkpWTCsvU2tlb0QyRTRJZS9mYjJDeVBFaENsbFF4NnlBNFVPcmRTNEdyaFp3?=
 =?utf-8?B?SlZPaXpSQkgyN2VKSnk1SkJiNEZyTjhmUDJiK1hvNFpEK2szNkUycm5GQ2tl?=
 =?utf-8?B?aDJERUYvcy9XVmtGUm0xVmttNlZsb2hSOUlXRkpidjRjUTM2MmJWNlpqSWtr?=
 =?utf-8?B?MXBvTjZ5QUxSZUkyVG03RTArbHp3bXg0bWk3ZkhVUDhyTHJoeVJXR2luVjRZ?=
 =?utf-8?B?cXVnRjJ3RnNDUzhMck5jNlZIb3JCL0hhN0drNWZlSXVhak55dVBweGM3QmJ4?=
 =?utf-8?B?M3JhRVBZdXV3UzdFMDJmenR1WElCNldTTUhMVzg5dW1IWEVaWmtkV0c3eFRV?=
 =?utf-8?B?UWxIRjk0U1FMREU1UVY3S21QdTFxbDNWSlBPbXMyTC8yRWRoWjZKRitpMkl2?=
 =?utf-8?B?OG0rUjN1cnZpdHhCLzF4SVNtd2E5dk1taERVdUNRZmRvQ3F4VTk2b0pkcCtG?=
 =?utf-8?B?L090czR2dTlPdTV2b3BPWDFZNVE1OHJiTGZST29oNEY5ekVZajdOU2pJdjND?=
 =?utf-8?B?UDA1N3R0ckg4S0ZDcWphZmM5TXRtaG1Lbityc0xnUUk1YUkzNTViZzdNcmZM?=
 =?utf-8?B?c1FNYThRdk9xNDhuMldJYTFOYk0vVGptNVNhMmp5SGpmSncxbkF2bHZCZ3pP?=
 =?utf-8?B?NU5GQ0dCQTVTUU0zUnJ0WWVoZGZjbFkrU01lcndRNXRvbDE4K2VzQ1hqYjE1?=
 =?utf-8?B?YVF5d2hZWFh6YlI0N0xScktGMnJacnR6S0pUbUFUSGlZS3c5UEt1Kzd3THJm?=
 =?utf-8?B?MENacHd3QmZRYUdVVlljRTliT1BST2ZRSmhoMHN0cm9idGk0ZDg1RjVkb0hH?=
 =?utf-8?B?R1ZIS01xSW9GdmRtc2RTT09YQk5sNXdDdkxzNy9FNXBrREQzN2N3L0pWT0JL?=
 =?utf-8?B?OHFBdXJ0R3FQYnplc3hFbEpScFdxM3NMbkNhYTZwd2R4NUo1UWNIUnZpNFJI?=
 =?utf-8?B?Z08wT2lXQ1ZURDJPQUdYWGNzdXpEdU41YnhreW1VMVR2TGl2UW1ULzJmYUJW?=
 =?utf-8?B?c1VJaTNYVkk0SXluenA1Qm5XcDFIME9kc2c1am51aDNzRDQrSnBDb3pVakFP?=
 =?utf-8?B?OG9VQ0dCSVc3cGxuV05ZTk4zVVdFN29FMEV1VjhaVmo4QWtHRUszWmZLZW50?=
 =?utf-8?B?OW9pS0V1bVhCazNvcStMMjFpNUxUbUUzQ2Y2SVRZSkVMZHdoZkVqakxVem9n?=
 =?utf-8?B?aHgwZm1oN0g0SmgvR211Y2g5SjYwSE8yYVdmb3gvNENGc3JrSDJhdlVaTjZG?=
 =?utf-8?B?SkNRdHQ0NEh4b2lzNW9jTGdvM05hUUhTWEJ6L2Z3Q0NEQUEvblZtb1FMbC9s?=
 =?utf-8?B?U01jZnlVZXcxSmc4QWZnTjJiRzdaUThzSlFpdE9TRFNDb3A2V0h6LzRmbXdV?=
 =?utf-8?B?UEhnYnJ5Y3hySHNYdHJvNzV4d1JkVzV4eG1rbHBGa3k3MjdFR0RzS3NoamRj?=
 =?utf-8?B?NFlIRXFnTTNoMjN1a2dVakloaXZzVFJGYmo2MXZuS0dOaEVzbkg4amd0Z1NQ?=
 =?utf-8?B?K3hRZVRrNzNoRHErMXNVd2YydHhBamFGVmZsUE1IV01EQ3JSenhqMGxzVDhZ?=
 =?utf-8?B?VDV1bzg1cXQ0bEx4TTN2UHlkeThqY3BWRmRLTm1TYjNxS0JqdElrb0ppd1Rj?=
 =?utf-8?B?UjlQMlFtQ0FzeUoyY2YrdXZra05JL1BGRVdha1dDK0ExUUhYdC9QMy85SU9P?=
 =?utf-8?B?VHpIc2F2d1V6eXFDelc2anozNEl4SXNNMjNMakhGV2EyM3VRK3hIbWVTWkxx?=
 =?utf-8?B?clowSnNLY1Z4WDBYekgySU43WXEvZVlrMGV1NzFQL2hZZ1BTVWpRcEpacmxO?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D55A02919627E439FB723176B38630D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77185184-cee4-450d-a88b-08dbf109be64
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 18:33:55.4141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQZkPMCq0zw1HzuRHklzed5qPjS1L+++l7OwGSLCM2EQibVyTyzqXNRYW1Qj5djzwr1rVFPJ3Zdb6O8E/+2GWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/14] drm/xe/uapi: Add Tile ID
 information to the GT info query
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

T24gTW9uLCAyMDIzLTExLTI3IGF0IDE0OjIwICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gTW9uLCAyMDIzLTExLTI3IGF0IDE1OjA4ICswMTAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+ID4gT24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMDc6NDU6MDRQTSArMDEwMCwgU291emEsIEpv
c2Ugd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjMtMTEtMjIgYXQgMTQ6MzggKzAwMDAsIEZyYW5j
b2lzIER1Z2FzdCB3cm90ZToNCj4gPiA+ID4gRnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPg0KPiA+ID4gPiANCj4gPiA+ID4gQXMgYW4gaW5mb3JtYXRpb24gb25seS4g
U28gVXNlcnNwYWNlIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlvbg0KPiA+ID4gPiBhbmQgYmUgYWJs
ZSB0byBjb3JyZWxhdGUgZGlmZmVyZW50IEdUcy4NCj4gPiA+ID4gDQo+ID4gPiA+IE1ha2UgQVBJ
IHN5bW1ldHJpYyBiZXR3ZWVuIEVuZ2luZSBhbmQgR1QgaW5mby4NCj4gPiA+ID4gDQo+ID4gPiA+
IFRoZXJlJ3Mgbm8gbmVlZCByaWdodCBub3cgdG8gaW5jbHVkZSBhIHRpbGVfcXVlcnkgZW50cnkN
Cj4gPiA+ID4gc2luY2UgdGhlcmUncyBubyBvdGhlciBpbmZvcm1hdGlvbiB0aGF0IHdlIG5lZWQg
ZnJvbSB0aWxlDQo+ID4gPiA+IHRoYXQgaXMgbm90IGFscmVhZHkgZXhwb3NlZCB0aHJvdWdoIGRp
ZmZlcmVudCBxdWVyaWVzLg0KPiA+ID4gPiANCj4gPiA+ID4gSG93ZXZlciwgdGhpcyBjb3VsZCBi
ZSBhZGRlZCBsYXRlciBpZiB3ZSBoYXZlIGRpZmZlcmVudCBUaWxlDQo+ID4gPiA+IGluZm9ybWF0
aW9uIHRoYXQgY291bGQgbWF0dGVyIHRvIHVzZXJzcGFjZS4gQnV0IGxldCdzIGtlZXANCj4gPiA+
ID4gdGhlIEFQSSByZWFkeSBmb3IgYSBkaXJlY3QgcmVmZXJlbmNlIHRvIFRpbGUgSUQgYmFzZWQg
b24NCj4gPiA+ID4gdGhlIEdUIGVudHJ5Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgfCAxICsNCj4g
PiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMiArKw0KPiA+ID4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9xdWVyeS5jDQo+ID4gPiA+IGluZGV4IDc3Y2FiNjZkMzM3Zi4uMDk1ZjFiOGMyMjkwIDEwMDY0
NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gPiBAQCAtMzc2LDYgKzM3
Niw3IEBAIHN0YXRpYyBpbnQgcXVlcnlfZ3RfbGlzdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3Ry
dWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5DQo+ID4gPiA+ICAJCQlndF9saXN0LT5ndF9s
aXN0W2lkXS50eXBlID0gRFJNX1hFX1FVRVJZX0dUX1RZUEVfTUVESUE7DQo+ID4gPiA+ICAJCWVs
c2UNCj4gPiA+ID4gIAkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLnR5cGUgPSBEUk1fWEVfUVVFUllf
R1RfVFlQRV9NQUlOOw0KPiA+ID4gPiArCQlndF9saXN0LT5ndF9saXN0W2lkXS50aWxlX2lkID0g
Z3RfdG9fdGlsZShndCktPmlkOw0KPiA+ID4gPiAgCQlndF9saXN0LT5ndF9saXN0W2lkXS5ndF9p
ZCA9IGd0LT5pbmZvLmlkOw0KPiA+ID4gPiAgCQlndF9saXN0LT5ndF9saXN0W2lkXS5yZWZlcmVu
Y2VfY2xvY2sgPSBndC0+aW5mby5yZWZlcmVuY2VfY2xvY2s7DQo+ID4gPiA+ICAJCWlmICghSVNf
REdGWCh4ZSkpDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
IGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiBpbmRleCA0YmFkODRlNzc5M2Yu
LmIwZWYxZjYyZmQ5OSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaA0KPiA+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+IEBA
IC0zNzcsNiArMzc3LDggQEAgc3RydWN0IGRybV94ZV9ndCB7DQo+ID4gPiA+ICAjZGVmaW5lIERS
TV9YRV9RVUVSWV9HVF9UWVBFX01FRElBCQkxDQo+ID4gPiA+ICAJLyoqIEB0eXBlOiBHVCB0eXBl
OiBNYWluIG9yIE1lZGlhICovDQo+ID4gPiA+ICAJX191MTYgdHlwZTsNCj4gPiA+ID4gKwkvKiog
QHRpbGVfaWQ6IFRpbGUgSUQgd2hlcmUgdGhpcyBHVCBsaXZlcyAoSW5mb3JtYXRpb24gb25seSkg
Ki8NCj4gPiA+ID4gKwlfX3UxNiB0aWxlX2lkOw0KPiA+ID4gPiAgCS8qKiBAZ3RfaWQ6IFVuaXF1
ZSBJRCBvZiB0aGlzIEdUIHdpdGhpbiB0aGUgUENJIERldmljZSAqLw0KPiA+ID4gPiAgCV9fdTE2
IGd0X2lkOw0KPiA+ID4gPiAgCS8qKiBAcmVmZXJlbmNlX2Nsb2NrOiBBIGNsb2NrIGZyZXF1ZW5j
eSBmb3IgdGltZXN0YW1wICovDQo+ID4gPiANCj4gPiA+IGNoYW5nZSBpcyBnb29kIGJ1dCBpdCBi
cm9rZSB0aGUgYWxpZ25tZW50IG9mIGEgc3RydWN0IHRoYXQgd2FzIGFsaWduZWQgDQo+ID4gDQo+
ID4gVHJ1ZSBidXQgdGhpcyBhbmQgb3RoZXIgbWlzYWxpZ25tZW50cyBhcmUgZml4IGluIHRoZSBu
ZXh0IHBhdGNoIG9mIHRoaXMNCj4gPiBzZXJpZXMgImRybS94ZS91YXBpOiBGaXggdmFyaW91cyBz
dHJ1Y3QgcGFkZGluZyBmb3IgNjRiIGFsaWdubWVudCIuDQo+IA0KPiBPa2F5DQoNClJldmlld2Vk
LWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg==
