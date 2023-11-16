Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80515C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272F610E6E4;
	Thu, 16 Nov 2023 20:39:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59110E6E4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700167160; x=1731703160;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=gO7Dk4EaSKmrd0rzNVt/1rh6XgqzIBoL7zI5FMT2rlY=;
 b=d8Qi9nzZlD9qlZOgA8pzaaQ2kFY3Dz1J8q+w0JPMX5yI/3FYMrXasf+w
 N/AwEHreQcEfgH3WhCoiQWuiL76rhCpyhRPPm5rS3s9wJPC72mjo2fnP3
 lG8PsSobV/6y8956PkYY4JiaU5ULvcSMde6pb7T2YP2eYPKDc85n7ptA6
 UkLewh2hlXkL4V8uKHQ0d713Bm7K6q/74PQ4EkPBlbgspGbPXbwdeoJQp
 65zeBEOOL/uaJ/LnsLnB9rDX0nTUCBYSBZftEZS/j+d08xbU9K/89Evk5
 SE4EMzuTsGKiTRAWHuYuC7Lr0QVXDSSnkYpl01eD8Y1E1d4fYuwd4mwgV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457676624"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="457676624"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="800268768"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="800268768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:39:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:39:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:39:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:39:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WClE80CkqPI9a+xeWZY7aBLOjbALgkKaedLI6NpW2QGiqFB5rDhqvnTQReujB4W7s+2yPEsGcug9Hxzoa8Z2qmo5TNMlgx4+z5wv9baA3z6jHtrioI8gTJqJHgRxVyIjtUBsQGCFtvqjPIeuHRlOqAZcxH+8VIRfpKEoHmucwIxMmSjEjl5hGyedjDtZoPKyzC4otyMJOQTE63oN3wrroKyFJyVFEdzOSGNl3IZ5gyja9Yx90vVz+xKPfPEpoYJLjhMy1REZDMO2darzdhWvQALSGEMcvL3ldNSYdt0xvBezneoNzLr73ZAnhlXdF1xWEIBSk8cgPy9/xC1x220VbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO7Dk4EaSKmrd0rzNVt/1rh6XgqzIBoL7zI5FMT2rlY=;
 b=LT6zvOT/GgXdhx8a+gxxKUYcUfe7Acc1GzDXR3UaBtgHwws98akW27TAoFLK7RMv4OVYz848NA87Py6vNIMl4Z+8U7I/mYSS4sFkWJDm+lRs7HyUC0ZQbkASb4hSjko7jPmxXyYDQ3ixXf7bbdCBkMqzoG8TTul7qvLKthJqdQLq6W34z7WD0mrUO+04F/svxhE5QyYYytwQpRtg6akj2KR5LQQ1GogWB3K9H4VEOP9HO47/dM0rV1SVykC+vNbiTPF62nkfkOfcZMfq2h8kGhFAqeYh+iYpC9SZ3VrEpRoBTWhkhNMd1YtzYA0SUCZysZ3dJ76vsRu4nCzJkagEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 20:39:16 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:39:16 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 5/8] drm/xe/uapi: Align on a common way to return
 arrays (memory regions)
Thread-Index: AQHaGJtKkIUD8AFLXkmEqbWLyl0xN7B9aLSA
Date: Thu, 16 Nov 2023 20:39:16 +0000
Message-ID: <a8ebae3289945717ef6b13eb025896fb400c238d.camel@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-6-francois.dugast@intel.com>
In-Reply-To: <20231116144316.7-6-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB5210:EE_
x-ms-office365-filtering-correlation-id: 82bba78f-ce63-4dea-6be2-08dbe6e419ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFqIKUrSel3lQeNra74pTVY13e3lUk3arqgQbT4rtC7VtCy81PDyKz9Osk3YhHOhuNiYyXTlChjAS1gnpNaSKkBbjs0wg+XO8OxOF42aNKcSGzrsjHoE4T/26IvD4H/HGIOm/GZKJL6Usc1u+oPyr4CU3xZ3izH902eboApE2YRhq91OZhzLDA+c3QeJzp9WwGKX3+eDlt0Xr5hmVBdoL6LIIq+JN23ziUCipWyFQFaZjaGx2HZ+3mX3Ed30l4pgEALshoNitXdk1K7yH0Jvc34xGtCjrk+IwoMSOyL9hWX2awXvaha1gAB2Ub3AR7S8Z/tCBohCHOoUJ7ZjB44nINC75lYb/hRolR1+NCELqOpndp6YWruN1QEB+ugmUeYwKxaMKpf7DSxoqw5m6WUQTDIDPbLlCB1gSlkKwPtabVtj1O6nW1xUsmnwjMFa3ENaufjFnvk5DSaMQJDBEbc/C9EE8nkTqCyESlGIIML1oEWx+86UJ987iDrkn5Oj6p12J2MENt97UFHddxziZHyn/5HXBhjP9xeoFDjctnjfFUO7MnkMM40HKnZ85H7WtTNcS6Pacvv8Aq4IYiGAIMHPizO+Gm2GYtBiUUYq5MjNFTLdF2TaiLlGLkDvIS9V1cRdy2D8byE/LMwiex6pzc0R3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(41300700001)(110136005)(66476007)(6636002)(76116006)(8676002)(66556008)(66446008)(8936002)(64756008)(36756003)(91956017)(6486002)(478600001)(66946007)(316002)(86362001)(5660300002)(2906002)(38100700002)(83380400001)(6506007)(4001150100001)(2616005)(122000001)(82960400001)(6512007)(26005)(38070700009)(43043002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU1yeEtTYVlVd3greXovTWNYZVVDamNyTHdQVktIRkZOT0s1R3F1N3BUQXYv?=
 =?utf-8?B?VXNjVUxFTVNPYUVCbFBraDZPZVpHTGpQa3Uyb0lpRDQ0RTIzZjJJeWtwdkl0?=
 =?utf-8?B?eS9RN1NETXNidC9sNmxHSmRXOWhXbUxMUGJSTnNwMEV4UEthUGNRZnVOdk1I?=
 =?utf-8?B?dU9jRDJiLzhxRTN3dXY0NVJ2dnJQd05CeE1kcFJxY2tVR201RHpzMG0wV1Z5?=
 =?utf-8?B?QkpMb3k0cjFIRnhPdGpJRUdlcEZUTkVwRHJyRkxuVzF2SHFzUUdheEdzVFlx?=
 =?utf-8?B?Wk50RXpodFJzaHhVZDhFVzU3WnkyMWVJd1l4R1NCYnI2M3RzNTdNWGlHODJm?=
 =?utf-8?B?Uks5TDdSTWIvQVRzSWkxcjVMWG5HRE5WVmtpQVlMeFpkSVFWUXI5dno2V3dL?=
 =?utf-8?B?R3QzTys3S3RidndIYVB6Q2NpTVhlTGNEOUY5ZkFYaTJOdXJKcG5JZ3VGcU05?=
 =?utf-8?B?dzhBNVhFUElFMnpiK0JnQ3hlUnFQMGQ4ZU9Ca0dqbWxxcFE3Yi9rUDNkV1hR?=
 =?utf-8?B?NDVybTdnY3QvSTRuWGpQMmM1SGhlbmRxTWNuaHBoVG5rSTBPaHdlTHhCQUJV?=
 =?utf-8?B?MXliQXNHN25ZbU9rbm9aOFk0RzdPd24wemo3R0k1TDJQZ1VTYVlqeElDV3ZR?=
 =?utf-8?B?Z0E1c1BBL2xFeDRXZlpBeFNGTGJDa3puYVh2WmpHeUc0aUg2NWtQcmQ5bCsw?=
 =?utf-8?B?VE1KS1RKWHVsV2ZkZXphR3NCVXNZS0hPMHUyd3NQOFpiWEdHV1QvWFIwMDZH?=
 =?utf-8?B?YUJla2dMR2pESi9MdFdYMWQvanNZeTlXRlZhS1J4cGFCd1Y0RXFQSjVzZWRm?=
 =?utf-8?B?TlhkUGpzNUs0MEVTYXpCN3R0cWpjaURsd1I1K3Q0WlNqdTJJR3dmaW85U3N3?=
 =?utf-8?B?SGhuTmpETVlrUUpVOUpVNG12UnFIZzVEd1RVL2FWdVFOMCtpRC9KRjNub2xC?=
 =?utf-8?B?NENGVzU5K2dpbFhTdU45TklQbjduL1h1NEtMUGUwREJwaHRCRmYzRndMbkNr?=
 =?utf-8?B?UUF0RW5xNmdQYlhJVWdaOW1HMFdZZytBMGFaOGdjQUwvUnNlcm55VnEvOFBo?=
 =?utf-8?B?bmVpN2JpRzlPN2IvVm43d3hqdCtqYnczeW1SSWZJUlMwbjFUYlhBNUkvbmdN?=
 =?utf-8?B?cXdmUmRrdXNZb0I0UXV0MUtEdFVBaExrelRLWWkvdkw4Q3doVStQdUVFblBZ?=
 =?utf-8?B?bno4Y2lDUUZYbCs3bjlCcHVFdnVyVW5Pb2s5QkNQTFd2SDVIdXoxcEhFUHlr?=
 =?utf-8?B?T3BTUncwOXAzbW4wN2pIbWJvZHBVb0JFcy9ZRlJZODBXTXBMdnRWdlNLZWVW?=
 =?utf-8?B?eUpHWDFFUk9QRlVGNVE4dWlHaHNRSVFSaVFmSzc0NlRrY2dJUlBzZktVeTcw?=
 =?utf-8?B?d21GeGRJVGpwWUNjSk1JWDhtRGsvS2N3QXpSdkpBM29ONWRyT2x0T1JxT1ZB?=
 =?utf-8?B?YTVndVJNY0ZRQmtaT3pEekM1UDdRUkNmZ2JrVUVCTUN6bXZDSzIxVWExZzMy?=
 =?utf-8?B?cVk2b3kxbEszUlVNZ3htNEZORUFabW1td3RmWmxac2sxY040TjZCajZsWHo3?=
 =?utf-8?B?ekVLdE12MFlkQXNyNkJXV3l1ajgrL0hzK3JKQzlVcXpBR1hiYUZabEZmc3hm?=
 =?utf-8?B?ZmZBWDFleGdwaGd3c1k5TFRSTEdBN2ZjTVhiN2Ixb2U1NjJ6MUtkWFAybDJU?=
 =?utf-8?B?RXhJbk02TjI2WDBQenVrdEc3WnZGSnJYbzNCYm1sQjhiczVGQW13aWwrNm50?=
 =?utf-8?B?QkNKVGtUYkluakVnNGVqTUNzNmk0QUtJVlBpK2hWc2picDdGdFlxMUMzNjla?=
 =?utf-8?B?ZSsyaXRUKzdicGcvdmhPa2NoU0c3TUpUT05jNXpZZ2ltV3M5V0JocGtoa01E?=
 =?utf-8?B?cmdMSTJ5YVNZd1ByWXZhdXJMamhLNVhpMFRmajVhdjAwcWZ5T2RUUnpTYjNq?=
 =?utf-8?B?ZWFOWnE1cC9xemRMVlQ1WjJYV2xBYjRuSlhlcmgvR1JlQThmd3hVZkZtL2lw?=
 =?utf-8?B?eWNrOEJyTU1qazMyaFA4bHNGT1cxNWJaR1o0Z05GZERSbWwrSDc5SVRDUGE2?=
 =?utf-8?B?U3NxdytaTlJpektXcHVzTnVGMGFrSFRYUnFzeWRIZE94c1RBcUp6QVl6NUMw?=
 =?utf-8?B?SkxwQzA1T3dBYUpJVzdiRkFvWVdJKzBQbHVFYW1JVDFyOVBrejNraDNJd3Vz?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9CB4AC057A84A4192E81F904733197A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bba78f-ce63-4dea-6be2-08dbe6e419ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:39:16.0254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJBR0ddYs8vZZHR7EAp4hIWflctGa8uI6FDriuY4uqYxsLwEba8htgJoXsgmOJZUUKiqADIBLUxXMJfaaUmIYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 5/8] drm/xe/uapi: Align on a common way to
 return arrays (memory regions)
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE0OjQzICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoZSB1QVBJIHByb3ZpZGVzIHF1ZXJpZXMgd2hpY2ggcmV0dXJuIGFycmF5cyBvZiBlbGVt
ZW50cy4gQXMgb2Ygbm93DQo+IHRoZSBmb3JtYXQgdXNlZCBpbiB0aGUgc3RydWN0IGlzIGRpZmZl
cmVudCBkZXBlbmRpbmcgb24gd2hpY2ggZWxlbWVudA0KPiBpcyBxdWVyaWVkLiBGaXggdGhpcyBm
b3IgbWVtb3J5IHJlZ2lvbnMgYnkgYXBwbHlpbmcgdGhlIHBhdHRlcm4gYmVsb3c6DQo+IA0KPiAg
ICAgc3RydWN0IGRybV94ZV9xdWVyeV9YIHsNCj4gICAgICAgIF9fdTMyIG51bV9YOw0KPiAgICAg
ICAgc3RydWN0IGRybV94ZV9YIFhzW107DQo+ICAgICAgICAuLi4NCj4gICAgIH0NCj4gDQo+IFRo
aXMgcmVtb3ZlcyAicXVlcnkiIGluIHRoZSBuYW1lIG9mIHN0cnVjdCBkcm1feGVfcXVlcnlfbWVt
X3JlZ2lvbg0KPiBhcyBpdCBpcyBub3QgcmV0dXJuZWQgZnJvbSB0aGUgcXVlcnkgSU9DVEwuIFRo
ZXJlIGlzIG5vIGZ1bmN0aW9uYWwNCj4gY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgNDQgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMjIgKysrKysrKysr
LS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDMyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggMGNiZmVhZWIxMzMwLi5i
MzFlMDBiZDI5YmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC0yNDAsMTUgKzI0
MCwxNSBAQCBzdGF0aWMgc2l6ZV90IGNhbGNfbWVtX3JlZ2lvbnNfc2l6ZShzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSkNCj4gIAkJaWYgKHR0bV9tYW5hZ2VyX3R5cGUoJnhlLT50dG0sIGkpKQ0KPiAgCQkJ
bnVtX21hbmFnZXJzKys7DQo+ICANCj4gLQlyZXR1cm4gb2Zmc2V0b2Yoc3RydWN0IGRybV94ZV9x
dWVyeV9tZW1fcmVnaW9ucywgcmVnaW9uc1tudW1fbWFuYWdlcnNdKTsNCj4gKwlyZXR1cm4gb2Zm
c2V0b2Yoc3RydWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9uLCBtZW1fcmVnaW9uc1tudW1fbWFu
YWdlcnNdKTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBxdWVyeV9tZW1fcmVnaW9ucyhzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSwNCj4gLQkJCSAgICAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkg
KnF1ZXJ5KQ0KPiArc3RhdGljIGludCBxdWVyeV9tZW1fcmVnaW9uKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLA0KPiArCQkJICAgIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gIHsN
Cj4gIAlzaXplX3Qgc2l6ZSA9IGNhbGNfbWVtX3JlZ2lvbnNfc2l6ZSh4ZSk7DQo+IC0Jc3RydWN0
IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyAqdXNhZ2U7DQo+IC0Jc3RydWN0IGRybV94ZV9xdWVy
eV9tZW1fcmVnaW9ucyBfX3VzZXIgKnF1ZXJ5X3B0ciA9DQo+ICsJc3RydWN0IGRybV94ZV9xdWVy
eV9tZW1fcmVnaW9uICp1c2FnZTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb24g
X191c2VyICpxdWVyeV9wdHIgPQ0KPiAgCQl1NjRfdG9fdXNlcl9wdHIocXVlcnktPmRhdGEpOw0K
PiAgCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuOw0KPiAgCWludCByZXQsIGk7DQo+
IEBAIC0yNjUsMzYgKzI2NSwzOCBAQCBzdGF0aWMgaW50IHF1ZXJ5X21lbV9yZWdpb25zKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLA0KPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gIA0KPiAgCW1hbiA9IHR0
bV9tYW5hZ2VyX3R5cGUoJnhlLT50dG0sIFhFX1BMX1RUKTsNCj4gLQl1c2FnZS0+cmVnaW9uc1sw
XS5tZW1fY2xhc3MgPSBEUk1fWEVfTUVNX1JFR0lPTl9DTEFTU19TWVNNRU07DQo+IC0JdXNhZ2Ut
PnJlZ2lvbnNbMF0uaW5zdGFuY2UgPSAwOw0KPiAtCXVzYWdlLT5yZWdpb25zWzBdLm1pbl9wYWdl
X3NpemUgPSBQQUdFX1NJWkU7DQo+IC0JdXNhZ2UtPnJlZ2lvbnNbMF0udG90YWxfc2l6ZSA9IG1h
bi0+c2l6ZSA8PCBQQUdFX1NISUZUOw0KPiArCXVzYWdlLT5tZW1fcmVnaW9uc1swXS5tZW1fY2xh
c3MgPSBEUk1fWEVfTUVNX1JFR0lPTl9DTEFTU19TWVNNRU07DQo+ICsJdXNhZ2UtPm1lbV9yZWdp
b25zWzBdLmluc3RhbmNlID0gMDsNCj4gKwl1c2FnZS0+bWVtX3JlZ2lvbnNbMF0ubWluX3BhZ2Vf
c2l6ZSA9IFBBR0VfU0laRTsNCj4gKwl1c2FnZS0+bWVtX3JlZ2lvbnNbMF0udG90YWxfc2l6ZSA9
IG1hbi0+c2l6ZSA8PCBQQUdFX1NISUZUOw0KPiAgCWlmIChwZXJmbW9uX2NhcGFibGUoKSkNCj4g
LQkJdXNhZ2UtPnJlZ2lvbnNbMF0udXNlZCA9IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX3VzYWdlKG1h
bik7DQo+IC0JdXNhZ2UtPm51bV9yZWdpb25zID0gMTsNCj4gKwkJdXNhZ2UtPm1lbV9yZWdpb25z
WzBdLnVzZWQgPSB0dG1fcmVzb3VyY2VfbWFuYWdlcl91c2FnZShtYW4pOw0KPiArCXVzYWdlLT5u
dW1fbWVtX3JlZ2lvbnMgPSAxOw0KPiAgDQo+ICAJZm9yIChpID0gWEVfUExfVlJBTTA7IGkgPD0g
WEVfUExfVlJBTTE7ICsraSkgew0KPiAgCQltYW4gPSB0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRt
LCBpKTsNCj4gIAkJaWYgKG1hbikgew0KPiAtCQkJdXNhZ2UtPnJlZ2lvbnNbdXNhZ2UtPm51bV9y
ZWdpb25zXS5tZW1fY2xhc3MgPQ0KPiArCQkJdXNhZ2UtPm1lbV9yZWdpb25zW3VzYWdlLT5udW1f
bWVtX3JlZ2lvbnNdLm1lbV9jbGFzcyA9DQo+ICAJCQkJRFJNX1hFX01FTV9SRUdJT05fQ0xBU1Nf
VlJBTTsNCj4gLQkJCXVzYWdlLT5yZWdpb25zW3VzYWdlLT5udW1fcmVnaW9uc10uaW5zdGFuY2Ug
PQ0KPiAtCQkJCXVzYWdlLT5udW1fcmVnaW9uczsNCj4gLQkJCXVzYWdlLT5yZWdpb25zW3VzYWdl
LT5udW1fcmVnaW9uc10ubWluX3BhZ2Vfc2l6ZSA9DQo+ICsJCQl1c2FnZS0+bWVtX3JlZ2lvbnNb
dXNhZ2UtPm51bV9tZW1fcmVnaW9uc10uaW5zdGFuY2UgPQ0KPiArCQkJCXVzYWdlLT5udW1fbWVt
X3JlZ2lvbnM7DQo+ICsJCQl1c2FnZS0+bWVtX3JlZ2lvbnNbdXNhZ2UtPm51bV9tZW1fcmVnaW9u
c10ubWluX3BhZ2Vfc2l6ZSA9DQo+ICAJCQkJeGUtPmluZm8udnJhbV9mbGFncyAmIFhFX1ZSQU1f
RkxBR1NfTkVFRDY0SyA/DQo+ICAJCQkJU1pfNjRLIDogUEFHRV9TSVpFOw0KPiAtCQkJdXNhZ2Ut
PnJlZ2lvbnNbdXNhZ2UtPm51bV9yZWdpb25zXS50b3RhbF9zaXplID0NCj4gKwkJCXVzYWdlLT5t
ZW1fcmVnaW9uc1t1c2FnZS0+bnVtX21lbV9yZWdpb25zXS50b3RhbF9zaXplID0NCj4gIAkJCQlt
YW4tPnNpemU7DQo+ICANCj4gIAkJCWlmIChwZXJmbW9uX2NhcGFibGUoKSkgew0KPiAgCQkJCXhl
X3R0bV92cmFtX2dldF91c2VkKG1hbiwNCj4gLQkJCQkJCSAgICAgJnVzYWdlLT5yZWdpb25zW3Vz
YWdlLT5udW1fcmVnaW9uc10udXNlZCwNCj4gLQkJCQkJCSAgICAgJnVzYWdlLT5yZWdpb25zW3Vz
YWdlLT5udW1fcmVnaW9uc10uY3B1X3Zpc2libGVfdXNlZCk7DQo+ICsJCQkJCQkgICAgICZ1c2Fn
ZS0+bWVtX3JlZ2lvbnMNCj4gKwkJCQkJCSAgICAgW3VzYWdlLT5udW1fbWVtX3JlZ2lvbnNdLnVz
ZWQsDQo+ICsJCQkJCQkgICAgICZ1c2FnZS0+bWVtX3JlZ2lvbnMNCj4gKwkJCQkJCSAgICAgW3Vz
YWdlLT5udW1fbWVtX3JlZ2lvbnNdLmNwdV92aXNpYmxlX3VzZWQpOw0KPiAgCQkJfQ0KPiAgDQo+
IC0JCQl1c2FnZS0+cmVnaW9uc1t1c2FnZS0+bnVtX3JlZ2lvbnNdLmNwdV92aXNpYmxlX3NpemUg
PQ0KPiArCQkJdXNhZ2UtPm1lbV9yZWdpb25zW3VzYWdlLT5udW1fbWVtX3JlZ2lvbnNdLmNwdV92
aXNpYmxlX3NpemUgPQ0KPiAgCQkJCXhlX3R0bV92cmFtX2dldF9jcHVfdmlzaWJsZV9zaXplKG1h
bik7DQo+IC0JCQl1c2FnZS0+bnVtX3JlZ2lvbnMrKzsNCj4gKwkJCXVzYWdlLT5udW1fbWVtX3Jl
Z2lvbnMrKzsNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiBAQCAtNTAwLDcgKzUwMiw3IEBAIHN0YXRp
YyBpbnQgcXVlcnlfZ3RfdG9wb2xvZ3koc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICBzdGF0aWMg
aW50ICgqIGNvbnN0IHhlX3F1ZXJ5X2Z1bmNzW10pKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAg
CQkJCSAgICAgIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkgPSB7DQo+ICAJcXVl
cnlfZW5naW5lcywNCj4gLQlxdWVyeV9tZW1fcmVnaW9ucywNCj4gKwlxdWVyeV9tZW1fcmVnaW9u
LA0KPiAgCXF1ZXJ5X2NvbmZpZywNCj4gIAlxdWVyeV9ndF9saXN0LA0KPiAgCXF1ZXJ5X2h3Y29u
ZmlnLA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUv
dWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggZTAyYmVmOGRjMjI5Li5mNTRlNTQ1Y2M0ZmIgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtMTgyLDEwICsxODIsMTAgQEAgZW51bSBkcm1feGVfbWVt
b3J5X2NsYXNzIHsNCj4gIH07DQo+ICANCj4gIC8qKg0KPiAtICogc3RydWN0IGRybV94ZV9xdWVy
eV9tZW1fcmVnaW9uIC0gRGVzY3JpYmVzIHNvbWUgcmVnaW9uIGFzIGtub3duIHRvDQo+ICsgKiBz
dHJ1Y3QgZHJtX3hlX21lbV9yZWdpb24gLSBEZXNjcmliZXMgc29tZSByZWdpb24gYXMga25vd24g
dG8NCj4gICAqIHRoZSBkcml2ZXIuDQo+ICAgKi8NCj4gLXN0cnVjdCBkcm1feGVfcXVlcnlfbWVt
X3JlZ2lvbiB7DQo+ICtzdHJ1Y3QgZHJtX3hlX21lbV9yZWdpb24gew0KPiAgCS8qKg0KPiAgCSAq
IEBtZW1fY2xhc3M6IFRoZSBtZW1vcnkgY2xhc3MgZGVzY3JpYmluZyB0aGlzIHJlZ2lvbi4NCj4g
IAkgKg0KPiBAQCAtMzE1LDE5ICszMTUsMTkgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9lbmdpbmVf
Y3ljbGVzIHsNCj4gIH07DQo+ICANCj4gIC8qKg0KPiAtICogc3RydWN0IGRybV94ZV9xdWVyeV9t
ZW1fcmVnaW9ucyAtIGRlc2NyaWJlIG1lbW9yeSByZWdpb25zDQo+ICsgKiBzdHJ1Y3QgZHJtX3hl
X3F1ZXJ5X21lbV9yZWdpb24gLSBkZXNjcmliZSBtZW1vcnkgcmVnaW9ucw0KPiAgICoNCj4gICAq
IElmIGEgcXVlcnkgaXMgbWFkZSB3aXRoIGEgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgd2hl
cmUgLnF1ZXJ5DQo+IC0gKiBpcyBlcXVhbCB0byBEUk1fWEVfREVWSUNFX1FVRVJZX01FTV9SRUdJ
T05TLCB0aGVuIHRoZSByZXBseSB1c2VzDQo+IC0gKiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9y
ZWdpb25zIGluIC5kYXRhLg0KPiArICogaXMgZXF1YWwgdG8gRFJNX1hFX0RFVklDRV9RVUVSWV9N
RU1fUkVHSU9OLCB0aGVuIHRoZSByZXBseSB1c2VzDQo+ICsgKiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5
X21lbV9yZWdpb24gaW4gLmRhdGEuDQo+ICAgKi8NCj4gLXN0cnVjdCBkcm1feGVfcXVlcnlfbWVt
X3JlZ2lvbnMgew0KPiAtCS8qKiBAbnVtX3JlZ2lvbnM6IG51bWJlciBvZiBtZW1vcnkgcmVnaW9u
cyByZXR1cm5lZCBpbiBAcmVnaW9ucyAqLw0KPiAtCV9fdTMyIG51bV9yZWdpb25zOw0KPiArc3Ry
dWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9uIHsNCg0KYWNrIG9uIHMvZHJtX3hlX3F1ZXJ5X21l
bV9yZWdpb24vZHJtX3hlX21lbV9yZWdpb24gYnV0IG5vdCBvbiBzL2RybV94ZV9xdWVyeV9tZW1f
cmVnaW9ucy9kcm1feGVfcXVlcnlfbWVtX3JlZ2lvbiwgdGhlIHNlY29uZCBvbmUgY2FuIHJldHVy
biBtb3JlIHRoYW4NCm9uZSByZWdpb24uDQoNCj4gKwkvKiogQG51bV9tZW1fcmVnaW9uczogbnVt
YmVyIG9mIG1lbW9yeSByZWdpb25zIHJldHVybmVkIGluIEBtZW1fcmVnaW9ucyAqLw0KPiArCV9f
dTMyIG51bV9tZW1fcmVnaW9uczsNCj4gIAkvKiogQHBhZDogTUJaICovDQo+ICAJX191MzIgcGFk
Ow0KPiAtCS8qKiBAcmVnaW9uczogVGhlIHJldHVybmVkIHJlZ2lvbnMgZm9yIHRoaXMgZGV2aWNl
ICovDQo+IC0Jc3RydWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9uIHJlZ2lvbnNbXTsNCj4gKwkv
KiogQG1lbV9yZWdpb25zOiBUaGUgcmV0dXJuZWQgbWVtb3J5IHJlZ2lvbnMgZm9yIHRoaXMgZGV2
aWNlICovDQo+ICsJc3RydWN0IGRybV94ZV9tZW1fcmVnaW9uIG1lbV9yZWdpb25zW107DQo+ICB9
Ow0KPiAgDQo+ICAvKioNCj4gQEAgLTQ5Myw3ICs0OTMsNyBAQCBzdHJ1Y3QgZHJtX3hlX2Rldmlj
ZV9xdWVyeSB7DQo+ICAJX191NjQgZXh0ZW5zaW9uczsNCj4gIA0KPiAgI2RlZmluZSBEUk1fWEVf
REVWSUNFX1FVRVJZX0VOR0lORVMJCTANCj4gLSNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9N
RU1fUkVHSU9OUwkJMQ0KPiArI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX01FTV9SRUdJT04J
CTENCj4gICNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9DT05GSUcJCTINCj4gICNkZWZpbmUg
RFJNX1hFX0RFVklDRV9RVUVSWV9HVF9MSVNUCQkzDQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0Vf
UVVFUllfSFdDT05GSUcJCTQNCg0K
