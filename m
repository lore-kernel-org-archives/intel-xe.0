Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8664C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBAE10E64A;
	Fri,  5 Jan 2024 17:31:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E554410E64A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704475876; x=1736011876;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=iHef3zgN3YYsbMOwvFFl77AsP8rgxluD8dOFNWTK6DE=;
 b=BZuGErbKeZCpXlWOGv5XzOd/OUKJXxgy2LOnMlMfDcJnVauf22/MtX9u
 4tPBi5wDS4quSA/Nb/Ti3KTfzarpTzvo8Bb/E3kMQrnHPPu+o1iNqkwvY
 PB6sdq8zOFP/xgc1PNuL1CTc8O/HvHy5Pe3YaVsyQd/eHpx08KdPAhTav
 Pajt0xN5HaJrZUbUnjY6Vooid+u3oIW8H3yAgqqoR3IhXIhswF02CKhw2
 dAd5lup37Avoy4EDk9ki7qpNoon/IzO8R50/DdTAxWMuHXmVDFeoQni/p
 qF98+hzsOKuuLIwKFzP6ZW8ygOpOSyylT/4df39AJu5AAsVtYgP8lHc/Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="396431876"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="396431876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 09:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="730516423"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="730516423"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 09:31:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 09:31:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 09:31:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 09:31:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 09:31:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFe8b4jQ1Urzr4v+P/7B72Ucp4YLHw2IBdVmyaR+e3BCtSLqR5dwzdv1EyvLi1g/4mb5gwef9KYaffi5hyXWwow9t0dWzYJ3UQMubkzi4a8aI8Ep+XNy+MbDGetVqj86I5XJsKEEA5Srn7d6UMJfQqBtb0kisyUAr1IaT/avP2asvyYajqeoEy7xtNohNd0/72d4qSXW7dYkJqqfxgUuRwRjjPrZL9E+/jSKkgpDHOAVTaYqR6enXyGPiqdlgZsobGQWsV3RIKLwpUALsY2jmuE8on1SBOt7YwOj5tP39uqWBT2CGhLP5xAYMISuvfwVbIA/ird4Un04L3PA6fmzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHef3zgN3YYsbMOwvFFl77AsP8rgxluD8dOFNWTK6DE=;
 b=Ot8wnlNHxojIcGt7HIkNqWssPgqnK+YB9UjJP/YstFJRUis3eUQw07H0BS8iXz3KP40P8Lf5vzvVh5fky2NdqzFzeEqIRclIlan345xNkFFUGER+VSwde1Q763Lf0OyOWKtJpxi3TH8/e3JpFowjN/VLbM/nOd6AnbGJodnouQ2C0o8pf7npJULGX7HAzRdmDhVhPhTqVNzQi52ld2/kCjBNYN83QR7yrBsGyv0JnOKbioYE7Nzdhb/1/o6bL/shy35B+zB9LWeojmVCuOyCD3zk/njfiuejtgIdaNqWqmVCJ+o6JzSUq0/g9kZv0psXyvnMwZ6AJ/h4SZ7GXyLoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 17:31:12 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 17:31:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix compilation without CONFIG_KUNIT
Thread-Topic: [PATCH] drm/xe: Fix compilation without CONFIG_KUNIT
Thread-Index: AQHaP/uGM23+pY873kSDo1vdpnQ2V7DLefoA
Date: Fri, 5 Jan 2024 17:31:12 +0000
Message-ID: <6a1231b98fdb0adbca2d05ed9e87fb176cea9fc5.camel@intel.com>
References: <20240105171947.321-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240105171947.321-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7141:EE_
x-ms-office365-filtering-correlation-id: cb9b8bfc-baa8-4a4a-372d-08dc0e141cdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S9YGm0u6FWfnPuuAXUItwFT/CYqiXRrczLUKZdRF2eeFIFgQo/FcCJVoYcj5nwfzLziLuomaaWokEe0N4tfj4PWPpdJ32sXNi0g10E9TWQLzDsQ2rYr74AQ7aBkuth9qum8Rs0OyZ0s4HhBGV8UV4uVyNXps3UmFF0Pw7bBoITE8wpS6cNs4y7rp8PmryaKAEPp2ub2sWYqAFCFjOK6JFM3ZtkPsVIzojR6Pf0ZRkxF+4iGrWdhoz9z8muB9XZnJd6h3vYHzd/tk8aMc0VC3mMK5iL6FuocIWnQ7O5XeZuBvZUdXPCtuClmOkK/IQTHpeiG9ywV0L3WAOd44YTkE/BUtlI5l9pAU4/n/BRadv47aNiBGSrb09uTiV/uWvFZ3Ziwq0UAhc1XiIdEiZEdeHahWQljbHHhwrmC/5AfsXllOSmv3HwPQoiexkHJvN9EcaO2pjfwNK+aTqm/MbM66ACaMab5tCHEp92unkvkbsNTOCgU+kVAOo3n+MgpNUb0nLboAXBQJRvRlmbfDUor+/r13hWxHIkTq3jGJgf7WjDrLAZjVfOYUdth/rmkrlza8ey84y758r4C6xOlaxJMnsUq+0/giokP//ZjRB6hRay/1Eg3qjTQDc+hrMuo+WJbU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66556008)(76116006)(66946007)(478600001)(66476007)(8936002)(6636002)(66446008)(110136005)(64756008)(83380400001)(6486002)(91956017)(8676002)(71200400001)(6506007)(6512007)(2616005)(316002)(26005)(41300700001)(2906002)(5660300002)(38070700009)(36756003)(82960400001)(122000001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDZ5MmtEeHFSN3pEbURpSFZoeTlPaldIa3FKWlRURzh6b1FyVncxODk1NTQr?=
 =?utf-8?B?LzY0U25VaVJBQlRObjZURGhsSFB2QjNyMFh4c0VPZWt5d2RNUHZSczVhbk1U?=
 =?utf-8?B?WkhiUTRlZXJZSGVQaWk5ZXJYM1AreVlHdVJuQWRYc0tpcUtXN3c2MStZYUQz?=
 =?utf-8?B?WFREMFFycGNIRVhYYkRNNWxPOFc1dDFWOFJhcGRDZjJ6K29wYVVjcjYrU0NY?=
 =?utf-8?B?em5UekJVY2pNMW1XZGRGMnNNWDEzd2FKZGpIYVk1Y2t0RmNYZVBZV29TNDly?=
 =?utf-8?B?aElNUDMvSFQxcW9xeGU5QTdWNlcweXBWai96dW1MVStVaGxOaUM5WVFhMHEx?=
 =?utf-8?B?cmc5Q0pKN2IzWkV2c1huR3RyR2pDalhsQnNVeW1ZUzdBZm9iUHJtcWoyemky?=
 =?utf-8?B?b0xBSUZ1amRyUUpiTXZKK1ZLNlkzcWlzZUJMVlBBSUVKMVdVeXZQZkI5dW9B?=
 =?utf-8?B?Y3prZTN4NDlvSW5YS2QzVnBSN3YyRW1zVnlXNjZ5RUpFY0VHWktJK3FocUZI?=
 =?utf-8?B?N2ExMFViNGpDZ0hPTXhHN3hSbU4yeWhoV3lqZ2JGSUM2M3k1a01mSlVHRkVC?=
 =?utf-8?B?Q2F4bHNkZkJJOXR2UzNtOFlpVGVxdVUvOUZzSkl6aFdCNXlNakpHS0tzVXVo?=
 =?utf-8?B?blpxRVA5T1dHck0zakdKNWJyZG4zMGcrSjR0K0pGK0s3SFErWUF3N3RSaXpK?=
 =?utf-8?B?NHJtbWRzR0FoRVUrdjBDQXNLL3Q5djAyRGRRcG03QUtEOEE1OE45RjloNjZw?=
 =?utf-8?B?SjZQdXNKUktSZVJxM1hvdERObmI3cUZweFFMcGhieFdjTkVNNjJBRzdQRGM3?=
 =?utf-8?B?TlMyMStMRnB2NjZRdzhyUUNud3JNRkhWRzJlOFRnaTBoU21uQURZM1pNSGsr?=
 =?utf-8?B?RmZmMTlzekU4aXVnRS9Hc0k0OUUyMU85QlVNaFJqYm8rZFFWNnRzS3dQeEJ4?=
 =?utf-8?B?VWhUMzcvVXozU1FoUW41L1JwbURsZzNmN1VPTVZTb3hiTWZ4OWFhRDlnVUtz?=
 =?utf-8?B?UEpIUURob0Z2RzJPeWZEUmpEMnlzNFVacGZabkFCYzE0WXpFRjFEbE1IcUM4?=
 =?utf-8?B?c2FFZTNwd2dXTWExNzJ5VHM5c1RhR05nWEtVNTI4dE5rclExTFNJQytDT1Zl?=
 =?utf-8?B?MzZFNUhiRXc2eVUvbTY1TFBZVmpqQjZuMVFoaTR1QnV0ZVN2OVpuck94T2RF?=
 =?utf-8?B?aWRqQkNCRFZaUk1Ja2V6bVhqdmNxaDFkYmU5aGVwejQzOUhOLzU5WnpnaEta?=
 =?utf-8?B?ZHdzSW1lSFhsMmxYa3l5Znh3L2RVOS9qbThDMW1JNnhzREIvcUNZVnVtakQy?=
 =?utf-8?B?Y1FHbG05NklHZTBTOFJZb0FMWG14ajRCL0EyTWJpZFIrV0dMUnNmRS9RNFRs?=
 =?utf-8?B?OS9Uei9FNUEyNVFWT0ZDSW83eVpPM0hYS3JVR2dWUUpGSmtDN1Rvb255TWo3?=
 =?utf-8?B?MWRKMFFVQ2ZveWtzSkM2RmpGUW1iSGhaazZidERGSkRQamQ2YnJXKzNrbDBh?=
 =?utf-8?B?RjZ4cjl2enFsSTMrcGJ0TzNrM0JtRG1IWlNDcHVHN1pJWnhKMmxPdnl1THFH?=
 =?utf-8?B?cERzNjNyeEZ4VFZkMnpaU2RkQUlMcmcyMW9uZ1lwTFpvejgxRjQ5VC82Uy8z?=
 =?utf-8?B?akllRktXZHRMd2RQMUdDMytKTWZlYlFNOUV3WlhadktjVUdKZ0UvdmVDS1Zo?=
 =?utf-8?B?QzAzelVaaERmUU9BYkRDNlJ3V21WMmthRGk2aExRZnJrelI1djl6djcxc2Jm?=
 =?utf-8?B?cklBczhvcCs3NVNCdEVrNHNmU09KRVdVUUNZYkdYaUswUzRqSHdnREVEY01Q?=
 =?utf-8?B?R0pIKzhWWnYrdlFBc1BIdXR4dkpTa1pzWkZZZTZ5YWdlQWE5ZlBuQ3dLdFE3?=
 =?utf-8?B?Z1hUTGhPOUZxU0JpZ1FyUGFyVGRLMW1XaUxtSC91M1htN1lHMWMzQ0NkcStP?=
 =?utf-8?B?Yld5cGs4cHgrZGRCUjRjZDFqS0NGNGJiaERVdjdDUFk2bEVXQ0FvNytQMlUv?=
 =?utf-8?B?VnVDWVJXZjN2elVlRDIvN003ZUtDKytDNFdlRkt5NXdLZGhHTDRYOFM3U29F?=
 =?utf-8?B?am5GdzBrOFdoY3VJUDFabzM5WkpKNFR1WnplbjRSTTJVeEdsSGg1NXFvNnNr?=
 =?utf-8?B?NzlCTHBKUStLdDZGamhvVVo0SzRCbzZ5THJpMmtyeEdQQWExS2FqUFJ4aDNo?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7CC0955901BEA478498F5298142E336@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9b8bfc-baa8-4a4a-372d-08dc0e141cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 17:31:12.5919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3zyPfwD/hxv3OQTbldBXAXaI0YyoeaTA88Bry61M1YURuEP+GNnjMzo9IQ08Z0yWw+0jMndzl1rmC+vkaOWhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
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

T24gRnJpLCAyMDI0LTAxLTA1IGF0IDE4OjE5ICswMTAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBJdCBsb29rcyB0aGF0IGRlY2xhcmF0aW9uIG9mIGt1bml0X2dldF9jdXJyZW50X3Rlc3Qo
KSB3YXMNCj4gYXZhaWxhYmxlIGluIHhlX2d1Y19yZWxheS5jIG9ubHkgd2l0aCBDT05GSUdfS1VO
SVQgZW5hYmxlZC4NCj4gSWYgQ09ORklHX0tVTklUIGlzIGRpc2FibGVkIHdlIGZhaWwgd2l0aDoN
Cj4gDQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5o
OjUsDQo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2JpdGZpZWxkLmg6
MTAsDQo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3JlbGF5LmM6NjoNCj4gLi4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19yZWxheS5jOiBJbiBm
dW5jdGlvbiDigJh4ZV9ndWNfcmVsYXlfcHJvY2Vzc19ndWMydmbigJk6DQo+IC4uL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfcmVsYXkuYzo4NjM6NTI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhrdW5pdF9nZXRfY3VycmVudF90ZXN04oCZIFstV2Vycm9yPWlt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgIDg2MyB8ICBpZiAodW5saWtlbHkoIUlT
X1NSSU9WX1ZGKHJlbGF5X3RvX3hlKHJlbGF5KSkgJiYgIWt1bml0X2dldF9jdXJyZW50X3Rlc3Qo
KSkpDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAuLi9pbmNsdWRlL2xpbnV4L2NvbXBp
bGVyLmg6Nzc6NDI6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYdW5saWtlbHnigJkN
Cj4gICAgNzcgfCAjIGRlZmluZSB1bmxpa2VseSh4KSBfX2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAw
KQ0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0K
PiANCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KDQo+IFJlcG9ydGVkLWJ5OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxp
bnV4LmludGVsLmNvbT4NCj4gRml4ZXM6IDlhMmMyZWNiMWI3NyAoImRybS94ZS9ndWM6IEludHJv
ZHVjZSBSZWxheSBDb21tdW5pY2F0aW9uIGZvciBTUi1JT1YiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3JlbGF5LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfcmVsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcmVsYXkuYw0KPiBpbmRl
eCBiNzcyMDg4OTc5YmQuLmMwYTJkOGQ1ZDNiMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19yZWxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
cmVsYXkuYw0KPiBAQCAtOSw2ICs5LDcgQEANCj4gICNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQu
aD4NCj4gIA0KPiAgI2luY2x1ZGUgPGt1bml0L3N0YXRpY19zdHViLmg+DQo+ICsjaW5jbHVkZSA8
a3VuaXQvdGVzdC1idWcuaD4NCj4gIA0KPiAgI2luY2x1ZGUgImFiaS9ndWNfYWN0aW9uc19zcmlv
dl9hYmkuaCINCj4gICNpbmNsdWRlICJhYmkvZ3VjX3JlbGF5X2FjdGlvbnNfYWJpLmgiDQoNCg==
