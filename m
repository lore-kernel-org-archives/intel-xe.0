Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC96FE784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60610E281;
	Mon,  2 Oct 2023 10:33:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0396110E281
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696242817; x=1727778817;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4iKthKEZ9Oa06o0xMvA8PuuPcD7MpoqlEXw8l4AHJao=;
 b=bR3wxKqkOAhKi3BbH+z5HFvFgMUV4yxBrIHrNSLuytSKDg4Dyj932mTl
 Y7kXaozWkYSr0VhgvkbP9BkVIACj2HaQeqlo24Tl4oYLHXzvFr2dLVHgr
 ep1f6ezF0bIDu3g4Va/3mM+stcQ2F+BdbUqe9B1aNCr6WyyafaIh0MPsv
 eJ4KCPr5H+IVe9dK77gFb5HdrxDmGaX15TvDzPgvOyU5fyYPUJyVQx8uE
 h4FhDoBn/wogX/u+Xv2T10CrV2Xr/wxF7sVtBORAmaRMUgh+byu7gBuDX
 GSZZozX8MKA6TcilDUwOvfDnlAsA20WhgoqotnZOBkvKrF9ZotvkEYmcQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="372966626"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="372966626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779903314"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="779903314"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 03:33:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 03:33:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 03:33:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 03:33:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 03:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZDURYV/fXxf+sb2ar6V9t9IcTYAYqvlvDeNW8wZ00kl+EbXTCWP4oblophU1TqeI/FwCPkSikIR9VzKZ3CDqs0f5xL5zCE7NNJxjMo1lZDrywVGlQ/roK51zj6QkgV9fDrBHNwDF2vLpP/aNIw4eWgmRo/jvT1sKyLI5YodYneUwqvu0h2j0uER32ki5/oHAmOZ7BBzr185TkH2o0CmhFqHiPFvKq/uyTjpURf+dCqXrhvwK2u0X0kk/Jy9CuPhn9lb9/Dui3KfuCJaMAKS5nh/l3S4gDrO+wCQkwOUxWoOwvGNY6MBmgYJkyB9li/TxAQRu6La5u41JV0ZIwImTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iKthKEZ9Oa06o0xMvA8PuuPcD7MpoqlEXw8l4AHJao=;
 b=lDoNvKhutMG1KnEQyZLh7GN0du6L9dnmGxlujN1PYnfansaG9y/xD9N29B7l0CBFWKlXEoEG6/R/CZKFFtURCrl7WEvqLI6BKdNLNvc3o+zyWDwdFVaaShjp7cq7r5U/evqCbYnxDie4pc0uh2s1gpM6r1xApBJ/rY5Slv5DE2/1UuFYCWNVd/S4jzM0BqYqNhmzJDzDaaCdklIlIRXSFHxzXMI7+FvEPDgpc4DSwQFH5H8/hjaEgn/DAat1+3GJSSaXX4sbzHHc48G0wGWAM/prVXeV5BOsJ9vlksx8iiv2R+kkrglYVFblZgpmJ5/LuoHZ1oiLYugyVnlfS+hN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Mon, 2 Oct 2023 10:33:31 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 10:33:30 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 0/2] Backport including i915_active.h in
 intel_frontbuffer.c
Thread-Index: AQHZ9P3dXvhtkTjE60q6YI0l6NQl6LA2E10AgAA6YAA=
Date: Mon, 2 Oct 2023 10:33:30 +0000
Message-ID: <69012691aecbdb459d37451827900f7b415ba3d8.camel@intel.com>
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
 <87cyxxijyf.fsf@intel.com>
In-Reply-To: <87cyxxijyf.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB6029:EE_
x-ms-office365-filtering-correlation-id: ddf2c07e-ab70-4adf-5be6-08dbc3330597
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qm9H+Lfv/cHn+tf1gKE1HyL0puRk0CHcrvo8MpX6AkXlBVbu+26GGrkFNgClMQuiUZtpbl7u/vcKkqY/52H7U88cdjDcW2J4LJHhU+mprEm5X6yOioyc7uxVJWqGik8zdJULfK1gWQyIE1mtBdO33CrdlMGIRbYlKA+aizge8+dWZL0JZvZVZcX9fzKjp8cAR6ClSLd72Y2dU0nYTN+eLqpH05kjL4pszZaJ5yaRQwH/92DTxZmfU/VkZMQItQ7Bp+bFHT2RHclYa982sxJq9u8gjeew9LCjYwffPt2S0QNry5bsm5q1T8EBykpIUStnboYyHGoSHeaLZOdhJf15202er+6jp5GCd07FJCv/6kTMGuYKGGgQwtkaYf/qanGQrSUMfl+OujHD36RiN4okocfC0k5rsSCaLPSylMh9c8h5e7twXziEG7D/967xz5o3sBiqs1qH9XetxVW6kdPvzP32CubLc7k8HpKrS28BLay4IqXB784I+fZG5ueE2PC5eCEmbtYjtMkRpd1SurAUD/xf6vyifeVIfoPWC1J1iKZ8tVyv01+buMTYquvxDQ7uwteyxxcAFYLbtfqVea6kS6G5d0WC5rV4lMF1u81KwrK8r+FVi++/DJcbGQiNO9VX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2616005)(26005)(6512007)(6486002)(6506007)(38100700002)(86362001)(36756003)(38070700005)(82960400001)(122000001)(6636002)(41300700001)(66446008)(110136005)(5660300002)(91956017)(76116006)(66946007)(64756008)(316002)(4744005)(2906002)(478600001)(8936002)(66476007)(8676002)(71200400001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUFSaVF3OGRPVTRyQnlISHR2L1VzcFQ3dGJpMmtwVCs2WG1GbmxwazdMdXpo?=
 =?utf-8?B?R0oxL004a01JWWJZU3MvY2tRRGp4VGp3UXhlaWpJbnBWM2NFa3pmWElVYnh2?=
 =?utf-8?B?ZjVHaXBvaGNiaTVIVHFXREcvb3AvNjRRT2ZLNElwQkdsWHh3N0VJNDNTVzlj?=
 =?utf-8?B?MGFmemszWnlId05yM3BCazREc21maUpKckRoVjV6NUY1cnZqVWtYbkRVd3k2?=
 =?utf-8?B?bjlrVmpqM3k4cmlQVjdDMlZWcHNIaTNaZC93cUNVbnlqdE1ZemsxOWx4Njhj?=
 =?utf-8?B?ZXlKUzhxdVUxQnUyQ3k0UlRNZnJxSjVuL0xEOElCWDBmSVNKY2cvb3V3akd4?=
 =?utf-8?B?VjZmNUZzUzYrS2RDWGNZbzVETktsc3VhTWhnR2MrckozS01XRnp4WEt6YkYx?=
 =?utf-8?B?R3J4N3E4UzRaV1pqTGVNUlFNQnlyVkZmdUIvZHNacUkzVXFHVVRqZ0M3ZzFG?=
 =?utf-8?B?enhadlFlekJJUzZCa2VkMkZrYXhjTDVEVUI2VjFzYkVXNGxPRnpQZlNIZWNi?=
 =?utf-8?B?YzB6QTJFRUdnTEJiSUtRRmlGazlJbHJSVEt5bGh6NEVOTkpUZC82NUd5aVY1?=
 =?utf-8?B?aTFCMWNIc3I1SnYyNExub1hjeUVpcWYydmR2ZHE4RWM4aDV0aE1BUTZRaWRG?=
 =?utf-8?B?SzU5RHhxK2NydWExYURCektwMVd5UHR1SWJPMVIreW52VGpZSjBBRWFIeEUy?=
 =?utf-8?B?TEgzTCtWWkZYeDRwSi9sN3N1VVNnZDl5eXp2Wk9TenlFSDVrWU92WVNJN2JN?=
 =?utf-8?B?SDVWK3h2TTlwTGtxZGRzbUprbHVzeTdGM1VKS0N4aXBCcGZOWVpuL2kzNjhC?=
 =?utf-8?B?WGdOalB1cWRid0ZwN3FhSE9tdW1WU1drSWxRRHdJWVl2ZnN6eEtRTy8zdzd1?=
 =?utf-8?B?UEVxbDhsK2k2cEs5eTFWWmlMQ0FKajhNR2hrVk9QS25JZXlCc045ZVJHQzRL?=
 =?utf-8?B?a3dKdThGM0wzR1NwOFBmMnVHait3eVJDbU4wWTNMVVNrZ3BvbWhaWElKUzZM?=
 =?utf-8?B?WG9LZ1Z2VVRTbHJ2aXJvYnZ1S0dKM3Y0ZTZQbGlmazhBZmpnQXdmNXA5bC92?=
 =?utf-8?B?U0JOVXFqKzR4Uk9xQUJvcThWRlhQbytIanRVZy96V3BEanZ5Mmg2QVBaL2Ry?=
 =?utf-8?B?OFBFVkY1WVV4bnVFandKRHJSeFM3bkRIcndkSTZpZEY1Sk1pRkIzMGNHcXVh?=
 =?utf-8?B?N0ZtV3Y4VDZNZWJKM0FUNkNuQ053NEdxeHY1RHYzVllhOXA1RXUySUhuNDVq?=
 =?utf-8?B?Mkx3SVdoTlBUVER3VFRrYUlhZW52cENRemE5cnNKU1ZWYW9KMS9CcXJLbmVK?=
 =?utf-8?B?SngvN0Z6MTcwcENaa1o1Ly92YUoyeTIwR05iTHE2RHd1WjArcFlwcDgwZ1dG?=
 =?utf-8?B?MDJwTS9TclAyc2xTbHVmUjRwZkNMQTBKbGx6bHI1b1EvTk4yeG0veGZwdkM2?=
 =?utf-8?B?ak0yOWpUUWloNmtsbGZTRDc1ZzZWL0JTUU8rb2ozcnYyL0xpOUdBcEFUZExH?=
 =?utf-8?B?RHVldjZjdi9IbnRsMHpvOWtoN0orM2tMWExmTlNwZ3hXQUhSakZyUENEY1g2?=
 =?utf-8?B?ZDJNMlpZb3RyMjJTUGxQb0JRUi9pZXpnSFFVTnVpNDdPYUZEUzN4SnNWL0tM?=
 =?utf-8?B?RkNBcDNjM3E4UTg4Q2JLUHlvTUhXeFFXZC80aVV2OVVEaEJ6OVlvVFAwcHJ5?=
 =?utf-8?B?d2tPb1hOSjNQVnJ2YVBsUlJzY2xqcStIelNPbVp2MGdZTHJRajJEYWtKNlBi?=
 =?utf-8?B?L3RHVTU0VHlEUXJMN0o2cXk0NmtwNm1tbUtuMW5PSmVaNGFwY2lEQUx1aUFX?=
 =?utf-8?B?NC8xeTk5UlZpckRDTVNPVW16SGVjbUZlSkxvS2g0UG55OVlDeDI4QldRc2lv?=
 =?utf-8?B?dTdkNVJpUlM0SEJaUDJycDZUN3ZOUFFRaVZiVVhpM1RFajlPcURZbzl3NjF5?=
 =?utf-8?B?Q2N1YXJwaXg2WC9LYzhTcUYzT01zQU95akVScWFHdHlYRDJBL2xjQ0dOdk83?=
 =?utf-8?B?TjY1MTNHREhydnpoeVpIRllDYk5WVUdpWTBqdFY4QzY3aTgyK2ZEdnJ3akxI?=
 =?utf-8?B?cHBxWjQyVFRHelMwU3lYeTRnTXBzSE1BcmtlYjZwTGUrcmh2amJ1TW9VbGZs?=
 =?utf-8?B?V1YyYk9tWXpXTVhlMDgyR1ovSTV6eFpkUkl5ZERLVkFFem9SOFU2UWk4WjQ4?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8473DDEE12A6FA4087A4FCDAA1D9491E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf2c07e-ab70-4adf-5be6-08dbc3330597
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 10:33:30.7307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYuKmzCDzumkd+tncObdZ7suKDx3/Sy6M2WtHj1iffUb03CN8dVu+Weh9mbsLcQMdrQzbXOxF9CgjTz4Afbdl+ZiKmTRKvgT5Oyz+0Voatc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] Backport including i915_active.h in
 intel_frontbuffer.c
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

T24gTW9uLCAyMDIzLTEwLTAyIGF0IDEwOjA0ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAwMiBPY3QgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IEluY2x1ZGluZyBpOTE1X2FjdGl2ZS5oIGluIGludGVsX2Zyb250
YnVmZmVyLmggaXMgbm93IG1lcmdlZCBpbnRvDQo+ID4gdXBzdHJlYW0uIExldCdzIHJldmVydCBz
aW1pbGFyIHBhdGNoIGZyb20gZHJtLXhlLW5leHQgYW5kIGJhY2twb3J0DQo+ID4gZnJvbSB1cHN0
cmVhbS4NCj4gDQo+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
Pg0KDQpUaGFuayB5b3UgSmFuaS4gVGhlc2UgYXJlIG5vdyBtZXJnZWQuDQoNCkJSLA0KDQpKb3Vu
aSBIw7ZnYW5kZXINCg0KPiANCj4gPiANCj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCj4gPiANCj4gPiBKb3VuaSBIw7ZnYW5kZXIgKDIpOg0KPiA+IMKgIFJldmVy
dCAiZHJtL2k5MTUvZGlzcGxheTogSW5jbHVkZSBpOTE1X2FjdGl2ZSBoZWFkZXIiDQo+ID4gwqAg
ZHJtL2k5MTUvZGlzcGxheTogSW5jbHVkZSBpOTE1X2FjdGl2ZSBoZWFkZXIgaW4gZnJvbnRidWZm
ZXINCj4gPiB0cmFja2luZw0KPiA+IMKgwqDCoCBjb2RlDQo+IA0KDQo=
