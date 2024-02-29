Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B24C54E49
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FB810E4DD;
	Thu, 29 Feb 2024 15:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6LtAJHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE3C10E4E3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709221948; x=1740757948;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=qeNMd7m58V068xYkFgyH2ZabpJl901bHuFm+I6Gm4Tg=;
 b=B6LtAJHgTU4/K5UvBmJa5iUy9S4o62uHCbeVer1Bxp8AEQqLwcrnSm3G
 PIMNKHVhd9vsUguo/x7gi3WSp1Yx4NIWpatZnHc7JAlHE0mefNfV9odUQ
 dEFhkpQ0m2kuHj0pTK9aIF7Xf5ih+1xzBP+Xravvc5Kahd53NmBgPUDFQ
 AZHW8K/z9ZuqaPGPTzBSnB+yftmaQUDR5v+M+XYVlkkWfkGaU0Rzz0tTk
 awHNeaWzE44h8PHYQICqSit12BaA0xiP7OiYcQV/7mJK3RRbHvHO0VQ8e
 7RZJ6WXQQa+VIqK7ag1JXfBr/VEiT9tX0K1/fgjyfkd4hOO7KywFlQmJZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3580653"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3580653"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 07:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12550842"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 07:52:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 07:52:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 07:52:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 07:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlAOBqvh35bOBrm1hpPaMESUZNgz9Pftrc/CsrNFipSGf6j48ZxF2HLswnlO7C9PM5J+ZfKN3CeJbnATYADeg/8SAVi0UHrE1an/XjIPnCPLJLxHDxOeyZ/2jgmPbdKoylP8I18M9pF+OAgNZ/LS/LT5bnnmOfYKyXIM5apqFNwvjMbT0KgyTvFqyWBQ9wtyb4dSgl27Ipp8j9QQTvPbYmh2lf0xcuYuA5PhyckRqm8a+yfy00aMzGeMuu5hnS2Ggop+YFdJQSGa/4gWoGvnb4swrxraDR59u64319ReRoQ5VMV1HxZquUsXCVFVPdR+1u6oeeZz/3GRIK95t6wYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeNMd7m58V068xYkFgyH2ZabpJl901bHuFm+I6Gm4Tg=;
 b=NvNrTuaQPeLA6CJst7qsib/t4aus/qO63+6By8iEfpAchWVyqfwiHgwc2ZBWTigvW9giI7aIMSTus2C59tLhWNoOdB+dyjX94lsrR9WAd6wAkRHoIBLqWCgjQMsnsYqvDrQFcsZmG9xV8r+4Xz+IZhHt4ZsE+OBV08jJt0/RAax/FH8sr9Z2BU0n3ZanFcMF29lCAzuijXN/arODW79B3++QBEhv0b72MJrH8BcrRt5V9lUOBdgVqMAxdgEzoLZ7Xo6WeBx48m07HhI6FJqpaJVEwEAUG2KG2s1PESJ+C6giQ9PTL9Jd/VbuCL3K8xeVSGiUL6AOxsYNmV/vLxoOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 15:52:22 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 15:52:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Add infrastructure for delayed LRC capture
Thread-Topic: [PATCH v3 2/3] drm/xe: Add infrastructure for delayed LRC capture
Thread-Index: AQHaaX6ziIUQdGCPak2Im3XKfwGYF7Ehe4+A
Date: Thu, 29 Feb 2024 15:52:22 +0000
Message-ID: <a0c9c9f5bdf05d44d1b8917bfa4438fe68010595.camel@intel.com>
References: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
 <20240227131248.92910-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240227131248.92910-2-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4858:EE_
x-ms-office365-filtering-correlation-id: cb0aaa87-9f0c-4ea9-dbd5-08dc393e6b1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kto5yJWbSq/NuCIvSoh84cJLPJ79xINJjgFW9wpEaYtDbD8e4dhLbIkzqkwwmgaMxpFWFUY1hJ0OQdchPpqXZ/G12F6q6Bf4mUJ+UEfZkKqR0xVnsQ87F8ZDcPAEtpvBJ7U6L3KCZ6rwM91o6t3TsRXltUhIMOdO4Z4irhsfyvAuETDCiWyU/M2gr8wz8o6F3a7RkstxuSrxc8K9uWD/qnF45oOqk9O+fKfE8JFuli+/I9vh99wiUlMs2XvGzxusBg9gjrWFjyOAj9IvmzaCJ5Hy/UVPRt6AUGE2Xfz+pR8fFI0BZocOZo9EXausnYOY7NvDlYbX9rvd5kUeYertHS7kSUDbU1LaRMqzz1RVVL+hs8gn9mTGsmlU4l3gQtx+llbT3W018v0kkkzTq5Vn4ofQM4uswueue+lo8ut669H7gGqGYUao+awLBXLmWwuM+EwnuhgLMeB03FbYi7r3eV/9Qx9GH4mOZvHXksPJuKHQQBF1LeIbYBoppU64C3SaCD3hcGKlGR6KAohbOAby0PdHwkniurkf8ZUo5N0yf/c3lPUGWvo8RAoZtPdqC5auXRYLb7L/L3rSBrAeBw3uHaQ2Ad0taTp1w250D6PRg9jpPT9goWDoX0ugWJ0eYUzVZZavNk927vt0CuqPWly+YJ4MkGg/UxVxzFR4RT1YL6Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TllycTMwU2NITS84OS9IdVpSV1VyQStxUW4zN1lEY3A2ekpvWW5kSTNGOFFK?=
 =?utf-8?B?VDkzVjlsbEpxZDduc2dlQ21McXJqZmZlWUNKRWtYbzdWcWk4Ny9RWityOTVh?=
 =?utf-8?B?TGxCYVBQRGk3M1B1K3NhKytNZmRqUnlpSW1mR01QNG5MdnNRUDk4WkRZYW1l?=
 =?utf-8?B?UFhoTmpURnRibG1tZktnbTFtWnNkOWloWWR1TTFMd1dsdk9rL0RQUDErZHRC?=
 =?utf-8?B?QkxqLzVLR0FXWEg3L1E4SlFjcEdOcndZaWovTkRuNUNTSzYyQVhhbEpJdTJ3?=
 =?utf-8?B?cG5QbWFkMS9TZ2k0QXJoVXo2QmhjSU83MU5meDJqbFNlOEMwSG00Q0k1eFFs?=
 =?utf-8?B?dGhDOEVORWJNWXk4QTRIb3ZYeVBpSGZIT3dkOTVrOUR2eWo3Tk4vR2ZxTUsx?=
 =?utf-8?B?R2tQRUZEdUpTRVJ3UjZzQTFWcDR3ZEROQUhxeXJkMEZvWmcrVDBWTy9yTjFJ?=
 =?utf-8?B?ZWFLOW9IRmE1UDJLbGZjeWx6WDdJRzRpcjlpNDRxeUI0MWhGN3FwMFR0L3lF?=
 =?utf-8?B?bk1oWWd0OFZZYXhIbWtEZ0JWRDVqNWt1QlRnamxMK29BSXF1TWkzVjZKdEtQ?=
 =?utf-8?B?UG9MUlpxa29Oc2F3eGtoRFpLK20rYUc1eFVxUHpHZW5ySTNEUExLVVR5QzhU?=
 =?utf-8?B?S2ZkRTRXdXpQL2lUb05jNTdRcTdwWHNzZU03UG9YR0YzNlhvOTN1M3paY0x2?=
 =?utf-8?B?YjhVMDNJK3p5WnVPQmsxK0xmUWlrNWw2cGF1VnVjcUxQb3d6a3NlcXlUazVm?=
 =?utf-8?B?ZU1qeU5CWTUwalFKZjFPSHQ2UGhXNTJ1bGxoeUZjYU5rQUV1cFg1V2RUR2hm?=
 =?utf-8?B?dWJGS2Nxa2VET2tYZU9uZ0Exb1NrMEdLWUR2aFZHOWQ3a3paWTRwVGV4MlBw?=
 =?utf-8?B?cUpDNTNCMElpWkM1bGJBOFZhOGFmVHFydUxueUttNVpBMy94RDlUNkhUb1ho?=
 =?utf-8?B?THVPWlJJWFBYUElZRnA0NXI4K0pITmRyRUlGU0xQOEYzQUJvdFlsV1Vwek1L?=
 =?utf-8?B?QjFVQzVpeFIvUFIvRHhxZkxPbFhWZktiZDhYUTNvS0V2b0ZBblRhbFJZVmI2?=
 =?utf-8?B?amRUSmZEd3didWhWV1BqaHlQRVpIYkhIQ0p4UFprc1NPL1k0QVlaOFc5UGtQ?=
 =?utf-8?B?UXB1eGZFczlIdUxrbkRYRnJEQXFiaUZDd05QdkpYeks4SjhiMHJtQzNFNlFG?=
 =?utf-8?B?WlVQSk1GbmY4NW84Z3phNDM4VHZMMndveitWMGlBbklxdzlUTWlUdlRCZkVv?=
 =?utf-8?B?WXptMW9yY2NaNE4vWHpUdldMcTBBUlNsZXltWm5ldmJVYVZHT0pDcUlqRi9F?=
 =?utf-8?B?NXd5dFYzRVh0N1V1NzF1dW5YOEZ0M3UrSytPTFZDL3pNUzhXeURHdmdWQWl1?=
 =?utf-8?B?cTd0VjdzQXJvaHlHVzNYVFA0M0RIVnUyWUF5Q0toOTRneUNoTVRYbVdMZ1pj?=
 =?utf-8?B?VTlhUkZXSXFTd2hJd3VSNWJZSXA3YmZWeXE0OS9hVXZQdVJlek9USUdMZ2lR?=
 =?utf-8?B?U1pVNWhpUk9YTGFVeXpJa1BaL1RmSlJEWEJVV3M1dHhqbEk2aDErOXdGUm9N?=
 =?utf-8?B?ZWx4SGJ4ZjJhQWZIR1BtaG5wUlNmaTJ6NTlWYk5LNzc5V09QeThuTm0wZlZD?=
 =?utf-8?B?clVlRHR0VVVTWlhVelZKM2x0N1Z2V0h2TjBPYWhNMExHbUFuRFRoaitrTlZI?=
 =?utf-8?B?d0dtRUxvOU9pYldjY2xKUkNhSzM1K1FZWUxVNkl2ZWhUYnFsbis4VldOdHFt?=
 =?utf-8?B?UVdyeTBwdm0yVVgwUFUvTGNZMXNhMVYvM0VXekxXdFlTc1kxd1dORDh1Mkdr?=
 =?utf-8?B?WlZkNDV0bThaaHBEaFJDRmNma29YVGpBTkRMaUI0MDR6NEVmYXFLd3R6dXc2?=
 =?utf-8?B?dTRBeWh2Zm1rcDc2Y3ZaOEpKRWtLMllWRFlnVklHc01PcTY2a3B5cmMxaE9Y?=
 =?utf-8?B?QzRpV1VpRzFGREJuSlZITkdMenZJbGNsbDRzUTkvOU15WG5UOWlTVkdXc0JI?=
 =?utf-8?B?amJaR25HNmlhZVVBWTROTEZBUjNWdUVzVGZpeDZCVzBwTHpUaFd3U0dteE1O?=
 =?utf-8?B?UFMyNVlMa09kc29OY0oreSs4MHFwdkp5ZExNUk5XZzRQVmpralJCUWVmNnp1?=
 =?utf-8?B?YmdmbjNIcFdKUWlqbjBGSm5WMmFFaUw4M3pFaGFiUlBrU290RjBSTGlhT0py?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7547FBF382F8A14B9F00F6F54BA2A1AF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0aaa87-9f0c-4ea9-dbd5-08dc393e6b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 15:52:22.7043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XuIHRtzqJ+ch/rczJfVpDYcn3bOhKsXmNBQlF/GtIhhSeQNOpeSIl2JLFFhfMw10fniH6hN85Rj6jLzXO+8PjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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

T24gVHVlLCAyMDI0LTAyLTI3IGF0IDE0OjEyICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gQWRkIGEgeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfY2FwdHVyZV9kZWxheWVkIGFu
ZA0KPiB4ZV9scmNfc25hcHNob3RfY2FwdHVyZV9kZWxheWVkIGZ1bmN0aW9uIHRvIGNhcHR1cmUN
Cj4gdGhlIGNvbnRlbnRzIG9mIExSQyBpbiB0aGUgbmV4dCBwYXRjaC4NCj4gDQoNClJldmlld2Vk
LWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KV2hv
bGUgc2VyaWVzIExHVE0gYW5kIG5vIHdhcm5pbmdzIHJlcHJvZHVjZWQuDQoNClVNRCB1c2FnZTog
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3Rz
LzI3ODg4DQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZjb3JlZHVtcC5jIHwgIDcgKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuYyAgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdC5oICB8ICAyICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJj
LmMgICAgICAgICB8ICA4ICsrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmgg
ICAgICAgICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgIHwg
IDMgKysrDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCA2OGQzZDYy
M2EwNWIuLjBmY2QzMDY4MDMyMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmNvcmVkdW1wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
LmMNCj4gQEAgLTY1LDggKzY1LDggQEAgc3RhdGljIHZvaWQgeGVfZGV2Y29yZWR1bXBfZGVmZXJy
ZWRfc25hcF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gIAlzdHJ1Y3QgeGVfZGV2
Y29yZWR1bXBfc25hcHNob3QgKnNzID0gY29udGFpbmVyX29mKHdvcmssIHR5cGVvZigqc3MpLCB3
b3JrKTsNCj4gIA0KPiAgCXhlX2ZvcmNlX3dha2VfZ2V0KGd0X3RvX2Z3KHNzLT5ndCksIFhFX0ZP
UkNFV0FLRV9BTEwpOw0KPiAtCWlmIChzcy0+dm0pDQo+IC0JCXhlX3ZtX3NuYXBzaG90X2NhcHR1
cmVfZGVsYXllZChzcy0+dm0pOw0KPiArCXhlX3ZtX3NuYXBzaG90X2NhcHR1cmVfZGVsYXllZChz
cy0+dm0pOw0KPiArCXhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2NhcHR1cmVfZGVsYXllZChz
cy0+Z2UpOw0KPiAgCXhlX2ZvcmNlX3dha2VfcHV0KGd0X3RvX2Z3KHNzLT5ndCksIFhFX0ZPUkNF
V0FLRV9BTEwpOw0KPiAgfQ0KPiAgDQo+IEBAIC0xOTYsOCArMTk2LDcgQEAgc3RhdGljIHZvaWQg
ZGV2Y29yZWR1bXBfc25hcHNob3Qoc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVtcCwNCj4g
IAkJY29yZWR1bXAtPnNuYXBzaG90Lmh3ZVtpZF0gPSB4ZV9od19lbmdpbmVfc25hcHNob3RfY2Fw
dHVyZShod2UpOw0KPiAgCX0NCj4gIA0KPiAtCWlmIChzcy0+dm0pDQo+IC0JCXF1ZXVlX3dvcmso
c3lzdGVtX3VuYm91bmRfd3EsICZzcy0+d29yayk7DQo+ICsJcXVldWVfd29yayhzeXN0ZW1fdW5i
b3VuZF93cSwgJnNzLT53b3JrKTsNCj4gIA0KPiAgCXhlX2ZvcmNlX3dha2VfcHV0KGd0X3RvX2Z3
KHEtPmd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+ICAJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5n
KGNvb2tpZSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1p
dC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiBpbmRleCA3MzQ4Njg5
ZWM1YWUuLmQ2ODE2NzI3MjFhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
DQo+IEBAIC0xODU5LDYgKzE4NTksMjUgQEAgeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfY2Fw
dHVyZShzdHJ1Y3QgeGVfc2NoZWRfam9iICpqb2IpDQo+ICAJcmV0dXJuIHNuYXBzaG90Ow0KPiAg
fQ0KPiAgDQo+ICsNCj4gKy8qKg0KPiArICogeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfY2Fw
dHVyZV9kZWxheWVkIC0gVGFrZSBkZWxheWVkIHBhcnQgb2Ygc25hcHNob3Qgb2YgdGhlIEd1QyBF
bmdpbmUuDQo+ICsgKiBAc25hcHNob3Q6IFByZXZpb3VzbHkgY2FwdHVyZWQgc25hcHNob3Qgb2Yg
am9iLg0KPiArICoNCj4gKyAqIFRoaXMgY2FwdHVyZXMgc29tZSBkYXRhIHRoYXQgcmVxdWlyZXMg
dGFraW5nIHNvbWUgbG9ja3MsIHNvIGl0IGNhbm5vdCBiZSBkb25lIGluIHNpZ25hbGluZyBwYXRo
Lg0KPiArICovDQo+ICt2b2lkDQo+ICt4ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9jYXB0dXJl
X2RlbGF5ZWQoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9zbmFwc2hvdCAqc25hcHNo
b3QpDQo+ICt7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlpZiAoIXNuYXBzaG90IHx8ICFzbmFwc2hv
dC0+bHJjKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgc25hcHNob3Qt
PndpZHRoOyArK2kpDQo+ICsJCXhlX2xyY19zbmFwc2hvdF9jYXB0dXJlX2RlbGF5ZWQoc25hcHNo
b3QtPmxyY1tpXSk7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogeGVfZ3VjX2V4ZWNfcXVldWVf
c25hcHNob3RfcHJpbnQgLSBQcmludCBvdXQgYSBnaXZlbiBHdUMgRW5naW5lIHNuYXBzaG90Lg0K
PiAgICogQHNuYXBzaG90OiBHdUMgU3VibWl0IEVuZ2luZSBzbmFwc2hvdCBvYmplY3QuDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5oIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuaA0KPiBpbmRleCA3MjNkYzJiZDhkZjkuLjJmMTRkZmQw
NDcyMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5oDQo+IEBAIC0yOSw2ICsy
OSw4IEBAIGludCB4ZV9ndWNfZXhlY19xdWV1ZV9yZXNldF9mYWlsdXJlX2hhbmRsZXIoc3RydWN0
IHhlX2d1YyAqZ3VjLCB1MzIgKm1zZywgdTMyIGxlDQo+ICBzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9l
eGVjX3F1ZXVlX3NuYXBzaG90ICoNCj4gIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2NhcHR1
cmUoc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKTsNCj4gIHZvaWQNCj4gK3hlX2d1Y19leGVjX3F1
ZXVlX3NuYXBzaG90X2NhcHR1cmVfZGVsYXllZChzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVjX3F1
ZXVlX3NuYXBzaG90ICpzbmFwc2hvdCk7DQo+ICt2b2lkDQo+ICB4ZV9ndWNfZXhlY19xdWV1ZV9z
bmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBzaG90ICpz
bmFwc2hvdCwNCj4gIAkJCQkgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gIHZvaWQNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmMuYw0KPiBpbmRleCA4MjMzZDQ1MTJmYzYuLjk5MzczOWEzZWZjYyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9scmMuYw0KPiBAQCAtMTMyOCw2ICsxMzI4LDE0IEBAIHN0cnVjdCB4ZV9scmNfc25h
cHNob3QgKnhlX2xyY19zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV9scmMgKmxyYykNCj4gIAly
ZXR1cm4gc25hcHNob3Q7DQo+ICB9DQo+ICANCj4gK3ZvaWQgeGVfbHJjX3NuYXBzaG90X2NhcHR1
cmVfZGVsYXllZChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCkNCj4gK3sNCj4gKwlp
ZiAoIXNuYXBzaG90KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwkvKiBUT0RPOiBDb3B5IHN0YXR1
cyBwYWdlICovDQo+ICt9DQo+ICsNCj4gIHZvaWQgeGVfbHJjX3NuYXBzaG90X3ByaW50KHN0cnVj
dCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+ICB7
DQo+ICAJaWYgKCFzbmFwc2hvdCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9scmMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiBpbmRleCBkNmRkNDA0NWQ2
ZDcuLmQzMmZhMzFmYWEyYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xy
Yy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiBAQCAtNTYsNiArNTYs
NyBAQCB2b2lkIHhlX2xyY19kdW1wX2RlZmF1bHQoc3RydWN0IGRybV9wcmludGVyICpwLA0KPiAg
dm9pZCB4ZV9scmNfZW1pdF9od2Vfc3RhdGVfaW5zdHJ1Y3Rpb25zKHN0cnVjdCB4ZV9leGVjX3F1
ZXVlICpxLCBzdHJ1Y3QgeGVfYmIgKmJiKTsNCj4gIA0KPiAgc3RydWN0IHhlX2xyY19zbmFwc2hv
dCAqeGVfbHJjX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX2xyYyAqbHJjKTsNCj4gK3ZvaWQg
eGVfbHJjX3NuYXBzaG90X2NhcHR1cmVfZGVsYXllZChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpz
bmFwc2hvdCk7DQo+ICB2b2lkIHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfbHJjX3Nu
YXBzaG90ICpzbmFwc2hvdCwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gIHZvaWQgeGVfbHJj
X3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QpOw0KPiAgDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jDQo+IGluZGV4IGRiM2YwNDlhNDdkYy4uMmMzMGY2Y2MyMzgwIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdm0uYw0KPiBAQCAtMzM0MCw2ICszMzQwLDkgQEAgc3RydWN0IHhlX3ZtX3NuYXBz
aG90ICp4ZV92bV9zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV92bSAqdm0pDQo+ICANCj4gIHZv
aWQgeGVfdm1fc25hcHNob3RfY2FwdHVyZV9kZWxheWVkKHN0cnVjdCB4ZV92bV9zbmFwc2hvdCAq
c25hcCkNCj4gIHsNCj4gKwlpZiAoIXNuYXApDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgCWZvciAo
aW50IGkgPSAwOyBpIDwgc25hcC0+bnVtX3NuYXBzOyBpKyspIHsNCj4gIAkJc3RydWN0IHhlX2Jv
ICpibyA9IHNuYXAtPnNuYXBbaV0uYm87DQo+ICAJCXN0cnVjdCBpb3N5c19tYXAgc3JjOw0KDQo=
