Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D13C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E30D10E117;
	Fri, 10 Nov 2023 15:56:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA9910E114
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699631764; x=1731167764;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=mUGEcwbHtuge+lmzMeRdNPufy4YNmHJDdjZBdA9wAak=;
 b=koJWM2RRvjNIC4lAClzG8uWL6ayvfIt93HhHmjdxXoTngGl4ddCUeBQ9
 q/by31TpeoZh6AcizLWguaOWSWvKUc0oDyo33IdoXdqZRoL6Pe5crZivS
 Dp6bI0C4ossvaXSznY+B7CnKSz9FBkV+xX/vhRmmz4Ns12eK21MztAyIa
 EYa43rwQwH5uSBEvEZCVSpYpIIYmvqpa2LQ6WYnNhG6mAOyVM1k2N39mn
 rcye1c7pBjabyoeNKF7yoiAhUbT/5ks/Mh4kQYGkJQV/fK57WZyXLMTrp
 dV7hV6sFTZlC142tevjdvUsLV0aYz5nc9RmNA/t0q2WYQEsIukVx4Qx1m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3248444"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="3248444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11514868"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 07:56:03 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:56:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 07:56:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 07:56:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMukQfqr78BcL0wBHisFGMZvX8mYckKtQmz0xYaA6NBBFp6AquLP/SJJSZK+mjWwVgFcTugJS95HsrajSKgcK4olggZGS2HMDgTWRnNdeVX1+3/xCLnecxfyFY4kculoNGyvNohQLzjRDEi65cV6T48cQ0OdX0krPVVZsG2veEFtWJ6f4Lu1vnwZcDAHPreS81A+uA2pl67FzRl/8woGl9ZzhOeIAXCWIams2stSnqvc4VH3lwF/L8YOrmMVyLbJ7px2PRZ24msL/AqO9oCtb+3aat+jc56dR02KZwxtYfXNHaeZaqBM5eMn6LuvZVYzPJlUkzH3y0381bOVJZifKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUGEcwbHtuge+lmzMeRdNPufy4YNmHJDdjZBdA9wAak=;
 b=la8Bw5CUpoMBWMhUaYAMfYzwo6ikUTf7tQwFLJPUrc4EWMjCxInZ4E+SIyVxUAuQN1DZGNGcV4yH477iM8hPZ5stP/7+NA3r3XHoXshioIWKy9tftkS8/vcWPJIfs7h+8ZmeFgr24b7yZX+znEWlW8G14mzk7sFJ4pot9onwssZU0k2hs25IuOgJYfPVv4QVmXrX1TfoEUUoJ825HtN6QDGtrmk/9aSeh1Tq8zak2SwsGuc99brUMhmwoQg3gano23FMwCHAf/0TOVHv922u6ru8rp+K3LIZ0fhfs7MjMOmR+70YnG0eeIf5zYOSXViK4s3ke97ZQlOPqnkurXJy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 15:56:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.020; Fri, 10 Nov 2023
 15:56:00 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v1 6/7] drm/xe/uapi: Remove unused
 QUERY_CONFIG_GT_COUNT
Thread-Index: AQHaE+yOvaSy5GRdXU6NJd8DLFw5jbBztPEA
Date: Fri, 10 Nov 2023 15:56:00 +0000
Message-ID: <467a38d86f72d6bdc1a5d08ef7e5c2899d7031e8.camel@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
 <20231110154156.6-7-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-7-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5420:EE_
x-ms-office365-filtering-correlation-id: fdea799f-2a14-4a36-0bbf-08dbe2058948
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D3tIi4SiOBzKwTOeX517AJC7BCwkI8gakAF6e9NAkxBNF51IvOkcSxGBKJWMe1zDMvwprnn11faUz0gk7zUwrU7NRmzgOYdi9FaDWNb8QbGkNwKolHPDRtgJK7YFFE6+G66/kCB5Cqc7Nn9W+u3biYJ3cBxo/U1hei1MLmcFeLzsrowql+GIrVR360d46DtJErudSg9slqw3DuuzkjdBGeyCZEFnHFvVfUvsJ0ZsSVtPvNBGC6Xib9/MZ2tSkkKn5yFlZMBmZ3gasKg2UlZMUItJ1HqQIYFqu1t/qTkBaEciErBwBtEOW3XmPwfW3y1osW+nU8q6CXWZwsLA6kT7UJPCLJGo0wV0vNy5RbfHF7zg7Cg4q703cctFApbf+Ac8cGGiqmVY7z37XP3ULqzLThKuq0fkhy52lzhdMwxJSPxkolA3Tlwewz8+1WIAc650zjxLUB8sdcPs8pEr99G6ysjdF2S6Nt3KITDXROgldZakp84LLZrs3w0duv8fmUvwkIY/ItR/o6v77M0IYmcMYNf96knPVcdtV6KBeZayUI78tgIoaxHOHcwVAND0I7K6MNURHDzARXRGYXsmdOb8Ayl7Xb4IUe6fGXJOe7bCyhETZFpVEuVITr53RLSRS1Gd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(6506007)(6486002)(38070700009)(71200400001)(478600001)(6512007)(36756003)(86362001)(2906002)(122000001)(38100700002)(5660300002)(4001150100001)(82960400001)(83380400001)(8936002)(41300700001)(8676002)(26005)(91956017)(316002)(6636002)(110136005)(66446008)(76116006)(66556008)(64756008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFGZFhNanlKSE9ySmwyUHpoeEVjNENzUmpCWGlPeU02ZFF5TkNaQkM2RjJ2?=
 =?utf-8?B?WEUrc1Q0b0F4eFdXOXB4WEE2NUxMdEE5MEdzeFlUaHl1bmFzeno0M2ZpeHVB?=
 =?utf-8?B?bnh2cWp0WjA3QkQzckw3RlFXVGcyd2M1NE4vR1dMUThjQzdHL3o0ZkpZeUNJ?=
 =?utf-8?B?NVRlRzBqcy8xdDdSN2srNFk1VkZsdU5XbFNSeTBvQ2RRZlpuMUhmSmlkTEV5?=
 =?utf-8?B?QXNjWmZaWFc2aFdjbFlvRk1aU0hkZmxmTEJUZDBOSkNHVkU2TGgxSGM2S3Z3?=
 =?utf-8?B?bTVjNkJIWXhFcHZYRmlXYlV4b2thTEhTQUJBaTlqdmcrL2VrY1BBeFNoUG5E?=
 =?utf-8?B?WnNhUmxqVEJrNE5pT2VDb2JOL2YzckJaRmV6anBpQzFiNWZ2YzV5Z3RxVzd2?=
 =?utf-8?B?d2tRTzhqMVRldEFCeHhvdmlramF3NXVtQVVVVXFKdUpGczFwY3VlWHlyaGhx?=
 =?utf-8?B?NGpRdW9BNkJBYmIrMVlIZU01ZENxUlJuVTVtSFBQSzZ3VjkrbWoxZGx5bmNH?=
 =?utf-8?B?OFlZQThqZFVkRk1HN1dNaWpLOU5aWmRycm9uZ3ludm1SQXdvZlpkK1JOV0FM?=
 =?utf-8?B?a3VYT2ZsalhtTXVDR1VxbTd1V1UxV21TNzFnYUFqMGlIV3U5RGQ3YkNmckV3?=
 =?utf-8?B?VVd2V2c5T0hCR3YyUzNjZUtKQWVQTlp0VE1DbzBia3daSkJXcTJseThNVzdo?=
 =?utf-8?B?cC9ueWN5SHIwT2NwY2lrem1iQ0pvRVIzSkFPN3V6M3I4R3ZSakdkZTJXRHkz?=
 =?utf-8?B?dkNyOC9RSXJ0VTduZ1VzTHJ6OGFTMUlTUFpWY0x3M3JaZk5xQ3dQUWtSRjlF?=
 =?utf-8?B?T2srdFF2RmV4WGQ3Vnl0S1hmV0JaVFM2TDBwL0IyMWJ0T3AwcFlla1d5ak1V?=
 =?utf-8?B?N3lLZEFGWURWRksydlhubVUwMDdBblhBeTRNNUhwaGNyU2tQNFdzQnlPenRH?=
 =?utf-8?B?WlI1RzFnR0xzZmpIS0pFVjNlbUU0S3FrRVp0em5wRlJ4RStZaVpobnY3Rmkv?=
 =?utf-8?B?U2lDMlhZZXlOdUxzQ3ZaakVYc1VKZkxOY3paUlFtdzRXMU90SS9UaTB4S1ls?=
 =?utf-8?B?cXlQYWhONGIrMk9SN21Cck5GSEs1dTB2TTJBRXlISEFoc3RkeXM3cDV3MVcw?=
 =?utf-8?B?cXNOUVJqMGR5YkVCbmUwUHVpUWtSV0N0cW5iSG1RSy9JRnJ3QjJteEFTTWxX?=
 =?utf-8?B?Zzdrb1lBS2QwcW9TZDgwQXBxVDBsdkNBM1NkOXptdEpPVzRLbksvUFIrSXJK?=
 =?utf-8?B?S0JPL2F3ZmMyWkpnemg3YVNUUGNPNlBQQnlRT0o2RUVwQSt1U1BQMTNRL1dL?=
 =?utf-8?B?bk1LNFVNQUJ6SFJYdUZSekVzKzU0SUNpTUJiajNaRnZGWnRIaGNyazJiL0lH?=
 =?utf-8?B?c2lBOHRlOEtzSjl1MkJVNEVFcFAxVnA0NTEwamhybmJzUXR1OVp2SFJESkFX?=
 =?utf-8?B?cThGc2Z0RnlFTnhNNkQ1Z1NUb2pEaG5GV0sxRlpMbEdnRzBPMjlIcEJaOVpP?=
 =?utf-8?B?RWpuVkJiejBPOW1OK2RSS3FIaDdEQ1haekJxZTZOM0M4dXNMQ3RNWWFzUy9E?=
 =?utf-8?B?aWlwQlNOOUwreXpPSlhJUmJoWkc2VzVIMmVhSmdXMXVhTmF0emRxREMyS0Ez?=
 =?utf-8?B?anlMWEs5dlRXbHZPaDk2TzhWV1FXQW14am9LRmR6alNZQk56QWhmcXNzb1ox?=
 =?utf-8?B?ZDYwblpPUDVVZHpHaXA0SXdhbWk3UzI3L2hqWitJeThHWm5hUFBrd1dMTWxT?=
 =?utf-8?B?V1VpQlkwOW1sWTVpdU1XWWZSeVI3b2E2aXRPdW1rQjJ2NzJmMGl0bmRjK1U2?=
 =?utf-8?B?VVB5ZUxiQlJhVDVGcUpOZjNGS2VUSHNWVVRZWWhxSlZKOTUrL1NCb0FDdTB5?=
 =?utf-8?B?a2syV2ZWbmdOZWpPRFFLV2ZGRzZ6YkxjbUp6Wk9zN2x3VURvaUxmNDZpL0dG?=
 =?utf-8?B?eXNVSHRWQXpBeXNzWCtUMW5lN1g4Nm1DUDZaNXNBRnJwNzM2VXYxQnlkY1g1?=
 =?utf-8?B?eWdhR1l6cktzSkQ3ZXcrV3dRejNaWWFqcXdoMFVScGNzMFJBZStYckJTRURp?=
 =?utf-8?B?RlJuQVZoOWVhaEUvKzFibVFnYmRndFl5cHRkcW5VbHEwREFnZElpa0dDWTJj?=
 =?utf-8?B?a1lEeGxqNlFwU3RKNFZKSUc2Z2lmVmxTdzJWQjBPenMyMCtaU09UczgyaW1w?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF69860A41F8E54BA8E294FBA7787460@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdea799f-2a14-4a36-0bbf-08dbe2058948
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 15:56:00.8814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbsjlMmQlTofEqS8bYLvR5uIWY5W1k8TZbv8JTFeYuvF4BCgXjspc4gZzcDS5NvaXAVP+hKF67rnACXilKA+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 6/7] drm/xe/uapi: Remove unused
 QUERY_CONFIG_GT_COUNT
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

T24gRnJpLCAyMDIzLTExLTEwIGF0IDE1OjQxICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEFzIHBhcnQgb2YgdUFQSSBjbGVhbnVwLCByZW1vdmUgdGhpcyBjb25zdGFudCB3aGljaCBp
cyBub3QgdXNlZC4gTnVtYmVyDQo+IG9mIEdUcyBhcmUgcHJvdmlkZWQgYXMgbnVtX2d0IGluIGRy
bV94ZV9xdWVyeV9ndF9saXN0Lg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lz
IER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcXVlcnkuYyB8IDEgLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAg
ICAgfCAzICstLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDI3ZjY2ZGU0YzFjZC4uOTMy
MGJjZTM4MmRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtMzMzLDcgKzMzMyw2
IEBAIHN0YXRpYyBpbnQgcXVlcnlfY29uZmlnKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3Qg
ZHJtX3hlX2RldmljZV9xdWVyeSAqcXVlcnkpDQo+ICAJY29uZmlnLT5pbmZvW1hFX1FVRVJZX0NP
TkZJR19NSU5fQUxJR05NRU5UXSA9DQo+ICAJCXhlLT5pbmZvLnZyYW1fZmxhZ3MgJiBYRV9WUkFN
X0ZMQUdTX05FRUQ2NEsgPyBTWl82NEsgOiBTWl80SzsNCj4gIAljb25maWctPmluZm9bWEVfUVVF
UllfQ09ORklHX1ZBX0JJVFNdID0geGUtPmluZm8udmFfYml0czsNCj4gLQljb25maWctPmluZm9b
WEVfUVVFUllfQ09ORklHX0dUX0NPVU5UXSA9IHhlLT5pbmZvLmd0X2NvdW50Ow0KPiAgCWNvbmZp
Zy0+aW5mb1tYRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJVFldID0NCj4gIAkJ
eGVfZXhlY19xdWV1ZV9kZXZpY2VfZ2V0X21heF9wcmlvcml0eSh4ZSk7DQo+ICANCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+IGluZGV4IDFhYzlhZTA1OTFkZS4uMDk3ZDA0NWQwNDQ0IDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gQEAgLTMyNSw4ICszMjUsNyBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2NvbmZpZyB7DQo+
ICAJI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfRkxBR1NfSEFTX1ZSQU0JCSgweDEgPDwgMCkNCj4g
ICNkZWZpbmUgWEVfUVVFUllfQ09ORklHX01JTl9BTElHTk1FTlQJCTINCj4gICNkZWZpbmUgWEVf
UVVFUllfQ09ORklHX1ZBX0JJVFMJCQkzDQo+IC0jZGVmaW5lIFhFX1FVRVJZX0NPTkZJR19HVF9D
T1VOVAkJNA0KPiAtI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJ
VFkJNQ0KPiArI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJVFkJ
NA0KPiAgCS8qKiBAaW5mbzogYXJyYXkgb2YgZWxlbWVudHMgY29udGFpbmluZyB0aGUgY29uZmln
IGluZm8gKi8NCj4gIAlfX3U2NCBpbmZvW107DQo+ICB9Ow0KDQo=
