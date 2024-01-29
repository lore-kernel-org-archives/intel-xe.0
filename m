Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85957C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A51112B58;
	Mon, 29 Jan 2024 21:21:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C45B112B4C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706563260; x=1738099260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SQ2r+B2aPgN4t0/YQYhhOzheMybYtxvJ0OmNKCKEwpo=;
 b=ecSTmr3v0Ol4qjr1UFfMEjDeGi+wKP/RfuZcTlAVK6G89/iHRHmMeXFM
 Gum/LOSN8nxVFYC5rYT6IvFzZEDOzjTfvaWGMpxorsG/8/SfQ2YMnHKgj
 B4khVXuhUx8MDhoa9PL6fzAinje+hGVcwoixcIUwc3p3IhS0JegvmMwR8
 8ujP3HLT/Fo+OED7+LMmSA0DSjcdKtdBH0XXjRpAPXLb2RegQImZUk8aS
 lJdCkC/tvlUvboTrGFObJ3iQexkqDQdRd0HZ4s0POd4V4ZrZjzmzFdKSI
 paOMCwl8CMHGykmREdhIKsvVkDPTQV3Kv//Ssy6uDn5ELKUZ2GIyENd64 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16622027"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16622027"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931221789"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931221789"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:20:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:20:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:20:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2uh/SB8Uk5LlggHpMSi9OAYpaIYpElrcxcQWH7QCpD7YEEGD0oIxD+Jf9JQRYwYqCnLHMQaCaKFE53qATgcZg1i+380bnplo2VqzC6TKZ4ubWt6ik3yBhEpmwcyoAQahWGxTaZE1U6wO4kSPtf07rMfEPmOrvFMzo5fRAvugbPDMHYpKf4cf//hFByp0HFAMe4ojzl6QAzXGFQjY4slR6uXwpu2yk0ioIQtRBJCS8I2WQqOoPqZ2F1U6M9TNDlrXTifpYQvNKjgqwMYj5tFMxE+pbkJe0+Dsw4kzLf5+EigoV8WLIJooo83FpXdhUuqu6BFe8vbMkaqgLWHBD+DRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQ2r+B2aPgN4t0/YQYhhOzheMybYtxvJ0OmNKCKEwpo=;
 b=TcjuHnYen8lScqzanKKJGdyCTFdEV7c11n/R3lFoToBI0+Yfpkxwqm9kyqsgbY8CvXbcDoy9bnVBpUHTiquM3bjDRwnCA9gF92YlLquLbv+5O8c/EwF3zgz+xqqivRKa/xlhVaKq6V76+skre6tqft2NJcDODaJya/38Z6J0JStoVEdSBSp47ryJfHtmkzfzYugce3Cagq3Nv/xlSP0ydrc3lsLfzrzvV27HcLbMfcLX3DBiBpD9b2L7d1dCBsNUpd6ZX3C42pTxzfHbjlol0UTwKX4ZDsm5mXLkmWqWvvGpuvuBuE04yHXqhXIaP8ZrfSb+awhJeJt+TufTnP86uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Mon, 29 Jan 2024 21:20:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:20:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 3/6] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
Thread-Topic: [PATCH v3 3/6] drm/xe: Store xe_he_engine in
 xe_hw_engine_snapshot
Thread-Index: AQHaUt+GrzQHMbhoBkaghVvdyb3stbDxSyaAgAABLQA=
Date: Mon, 29 Jan 2024 21:20:55 +0000
Message-ID: <b37001dd5dd865b8a428faf3059f82572af25030.camel@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
 <20240129181742.183694-3-jose.souza@intel.com>
 <20240129211639.GL5506@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240129211639.GL5506@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB6068:EE_
x-ms-office365-filtering-correlation-id: f70dacbb-ecd3-4102-d396-08dc21102dc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R0OVhI4QcLfw69l7+Ba8uSWztUx6mXFxCptLfdMlNWJMVgvILwjSTJHQLQn1SGR39zNppBN8MoMd4aDsrdBEYUmTVcjPPsPH0+5a3/38/Vh9qToLiZoLnCgvviWaIvHiRz9A7FYN4eK/I/Ev/qs52Yb1E+bJ5rmrdCyJrKXYvD0JmGOkr7Cnl+7UX9TswNEuIlK+7iABgOtzfEPbJS8eKA4gGxC3HmXtJfK1buBHHHWbnl41ly7atFyD9IV2lWGjlE9X9jMcuiEYewqZUx8o8nu1itcsU5/trpK4lNIlDws03Ixz8Nk4gwhBC9PccQOXg3X8p38xEFE4tf6sCbhMRboNs030adcNY8M1H6WhHxf1XOQtzA3dHHlLj9ASkkTG++sbGIEbFU8B0jZVDXGgF0kwB2IuWTqgGwvzAGVedlPsOvTx+3qk1Kt6cxPRTswTUdEgouMVh+II5bj5jkJktzt+D0EkBAGJivquWEjXlu07cRXc7wmfFvgZjZ0kaMw2uw6SXmTJOku6wFb/FHo4DGFHo/w/JGJc1d1QtpK+YNtuBODDg4UcZ3rS4hF6JIukc2VvFTB3FJ9xdM4cPiAntgK77Ac81TvRC6/Ra0lLvJo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66899024)(107886003)(6512007)(83380400001)(86362001)(36756003)(38070700009)(38100700002)(82960400001)(6862004)(4326008)(5660300002)(2616005)(6506007)(8936002)(26005)(122000001)(66476007)(64756008)(6636002)(316002)(66446008)(41300700001)(2906002)(37006003)(66946007)(478600001)(76116006)(66556008)(54906003)(966005)(6486002)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXhpN2NmUDhrL2gvL3dEeTdhUmRQTXFycU9zSjJ6QmxMenVGVURsYm1vQm12?=
 =?utf-8?B?cmppaEJETnJvR2ozanJrbjZhZHpmTjZNNDNBVFBmTUFUeUpJRisrSFNEQUR4?=
 =?utf-8?B?VU1HR1NZK29rYnNsVTZjVUhGTDNNOEFjQlRqcFBXWHR2OTdScWkwSlJlQlpG?=
 =?utf-8?B?a1Mwem5sbUQvOWU5eVFsNUNsdy9XeU50aTdWMUlkU2FORlNSb2E2dlFTRjhV?=
 =?utf-8?B?SkRXR0RRVTFtbWgydkZzUDMwMHJFSFRHcG1HMnNuM3dUaSszSEo0ekpGYVll?=
 =?utf-8?B?eFdRZDlhKzgxT2NMblllSXEyb3Z3UUk0RmFTRFZkN2VkWHowd0s5eExlMGNt?=
 =?utf-8?B?aldweTJVZzBLRS96cGhYYmN2TlRPU2dqODZjR1YxWTMzeWtQOG5xbHhzYk5Z?=
 =?utf-8?B?V0tZaXI3NnY0MkdUU1dodG5icXBJakJyNWRWKzJYSk1uTzVCQ2MrcUhNVDkv?=
 =?utf-8?B?c2RwYmFaa3pUa2RMVmJrMG1iS25jNEdzWVRzNG5nUmp2eUhJR2ZvS0RHOVhn?=
 =?utf-8?B?aVFqZDJPa2pmZDk2ako1WW9Edi8yVStGN1huQjR3NnZqWGdyeW9KWjVETEVH?=
 =?utf-8?B?M1VqekNOeTZUcERNazFyb1dvNWoyZ3Via3FYK25mM1RmR2hhYWpTKzFwT2Np?=
 =?utf-8?B?ckFZdVNNNWwra2djcVlPSUFKbzdvVGZDaHlpUGpwTXJ3MThjVzh5QTdxZ0xQ?=
 =?utf-8?B?NFdFaHBTay8xanlNQWJIdU5Pdmo2NWo1TUNyV0ZITUYyZGFCU0RsZzRvclVq?=
 =?utf-8?B?VlZib1BmazNYdkVUZ3pJODZ0cXR0MGNLTy9FZGFpcmxiYk40UFZ2SGc5b3NR?=
 =?utf-8?B?MGdDTFBVbnVieDJZZHVhYllFb1l6cWVONmlsdDUybG9qTlpJMU9nMUw4c3VD?=
 =?utf-8?B?MHRPVlJhSmVnNkZhTlZIdEF1SXZuVUREYXU4QWw4MzI3bmxrMFpKQ3IvMFBt?=
 =?utf-8?B?RzZsczE0WUFGTnZkU2ZjQlVLK01qcWpTN1ZGQWQzOVk3QVN6cnVQUWprUEpk?=
 =?utf-8?B?Q2dvbW4xbG5CVHB1YW1YdnFRdktVRitqWUx3SG5oUWJYQlVvUi9wYVc5dm1r?=
 =?utf-8?B?NnJDeS8zb1N4R01Id2YybXZOd1dpY2M2alpNUlM1S0xHa3BvU0lGTDF6SVln?=
 =?utf-8?B?S2U4VDV3ME1LN1dJc2Zjckk0Ui84eklCbWpuOTljUUV1dFJtZW43WXpaUGlv?=
 =?utf-8?B?UVhzV2RHUzB2Zi9yajhQZTNGQXcxaCtmTlhCYU9kaytaYWU1MXpSUEtoOVdJ?=
 =?utf-8?B?bGhCYytpRkxsRjdnU1lpSnFxUGJPTUcvU1doa1k5eW9iTCtIWFNlRWQ3VlBV?=
 =?utf-8?B?NGxlWFNRZ0Nwekdsb3dDeE9WcGhvRnMzclRCZ05yanJxa1JXamwzZ0twZ3N1?=
 =?utf-8?B?SzhISXBSMThUQjdnaDhsYkk2dDhPelAwOXBPcTIzbjYwY0xDcHhvdWtMcFd3?=
 =?utf-8?B?d2lmV2JmaVVQN25ZR29hd2Z3NWpFd3k5bUpYaUZwV29WYmxtU2w1MnBnRXND?=
 =?utf-8?B?L3JMUHdoVnNYSHY2SjZmV3RMWE1LWWZmR0dLa2RObjJGa0NnZ2NMQ3N5VU1L?=
 =?utf-8?B?VVNIT1BVaW1yVk1pN3BFTDJRWTRlTFNqd1I1UXJLNllhWStVMWtzTURyeGVX?=
 =?utf-8?B?OEFNb0Nhc00zZmNuWlpmS1laMEhzK0FUQjFKUEp1N3pybW5mVHdLR09jL3ZT?=
 =?utf-8?B?ZS91bHRPci9yY0x1TURYVExiV05qSXRlZmJOSG1jVkl4ZndRTEVBV0pyTjky?=
 =?utf-8?B?bFFhUEx4NDFpWHNBU1FBOVlpSjBiVmZuK3BmZXhob2N3TlNwVVpPYjMzcHAz?=
 =?utf-8?B?a1U4Qm1BaGJPamthK0pDMG5RUXprWmJNSUM2TTQ2S2x2MFc1d2c4bnNYZVJN?=
 =?utf-8?B?V3QvR1FIYTJBTXh0SnYvdDQ0U1lHbkhmcCtYOWROY1R6L0xRbjlURXB2dncx?=
 =?utf-8?B?dFZpTWl5eCtNSDJ6dDVRYmMvWXJ0aDlLZEFiblRtK045TTkza1Yrc1VXc3Ja?=
 =?utf-8?B?Y3RqbkQ3amh4UEFwb1RFN0FUMnhGK3ZKbUxneldERk1RUWMwWGlKOUZldENx?=
 =?utf-8?B?cjJHQ2RGT1R5dnVzSWlIdlhVZXkwZEJ3RTRnTHh2UEJaU212Smlpb3ZwaHdN?=
 =?utf-8?B?Z29IaThiUjIrSGp6TTdMQWZpN0tpSzBLQ0FYUmRkTUdBZnlEQ3YvdTB0bjE4?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDE9A33D6A66824A8D868D271E998CE4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70dacbb-ecd3-4102-d396-08dc21102dc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 21:20:55.0587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIRFXC/GfOxUj0JGm7LyuFGpnrYdzq6OEkeflLLQeFP4wEVvDYxJxPpq/uOVf4nJZUyuMLwHDdNSagXcu0BAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTI5IGF0IDEzOjE2IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIEphbiAyOSwgMjAyNCBhdCAxMDoxNzozOUFNIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IEEgZnV0dXJlIHBhdGNoIHdpbGwgcmVxdWlyZSBndCBhbmQgeGUg
ZGV2aWNlIHN0cnVjdHMsIHNvIGhlcmUNCj4gPiByZXBsYWNpbmcgY2xhc3MgYnkgaHdlLg0KPiAN
Cj4gSSB0aG91Z2h0IHRoaXMgZGlkbid0IHdvcmsgYmVjYXVzZSBpbiBjYXNlcyBsaWtlIGEgZmFp
bHVyZSBkdXJpbmcgcHJvYmUNCj4gdGhlIHRoZSBkZXZjb3JlZHVtcCBjYW4gcGVyc2lzdCBmb3Ig
YSB3aGlsZSBhZnRlciB0aGUgeGVfZGV2aWNlIChhbmQNCj4geGVfZ3QsIGFuZCB4ZV9od19lbmdp
bmUpIGhhdmUgYWxsIGJlZW4ga2ZyZWUnZD8NCj4gDQo+IEkuZS4sIHdlIGNhbiB1c2UgdGhlIEdU
IG9yIEhXRSBkdXJpbmcgdGhlIGNhcHR1cmUgcGhhc2UsIGJ1dCBieSB0aGUgdGltZQ0KPiB3ZSBn
ZXQgdG8gdGhlIHByaW50IHBoYXNlIHRoZXkgbWF5IGFscmVhZHkgaGF2ZSBiZWVuIGRlYWxsb2Nh
dGVkIGFuZCB3ZQ0KPiBjYW4ndCB0b3VjaCBhbnl0aGluZyBleGNlcHQgdGhlIGRhdGEgd2UndmUg
YWxyZWFkeSBzdGFzaGVkIGF3YXkgbG9jYWxseT8NCg0KTm8sIGRldmNvcmVkdW1wIG5lZWRzIHRv
IGJlIHJlbW92ZWQgYmVmb3JlIHhlX2RldmljZS4NClJvZHJpZ28gaXMgZXZlbiBmaXhpbmcgZGV2
Y29yZWR1bXAgdG8gZG8gdGhhdDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMTE3
MTk1MzQ5LjM0MzA4My0xLXJvZHJpZ28udml2aUBpbnRlbC5jb20vVC8NCg0KPiANCj4gDQo+IE1h
dHQNCj4gDQo+ID4gDQo+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jICAgICAg
IHwgNiArKystLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5o
IHwgNCArKy0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiBpbmRleCAw
ZDE3ZTMyZDcwYzg3Li42MWIwYzE4ZDhiNjI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
d19lbmdpbmUuYw0KPiA+IEBAIC03NjAsNyArNzYwLDcgQEAgeGVfaHdfZW5naW5lX3NuYXBzaG90
X2NhcHR1cmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAJCXJldHVybiBOVUxMOw0K
PiA+ICANCj4gPiAgCXNuYXBzaG90LT5uYW1lID0ga3N0cmR1cChod2UtPm5hbWUsIEdGUF9BVE9N
SUMpOw0KPiA+IC0Jc25hcHNob3QtPmNsYXNzID0gaHdlLT5jbGFzczsNCj4gPiArCXNuYXBzaG90
LT5od2UgPSBod2U7DQo+ID4gIAlzbmFwc2hvdC0+bG9naWNhbF9pbnN0YW5jZSA9IGh3ZS0+bG9n
aWNhbF9pbnN0YW5jZTsNCj4gPiAgCXNuYXBzaG90LT5mb3JjZXdha2UuZG9tYWluID0gaHdlLT5k
b21haW47DQo+ID4gIAlzbmFwc2hvdC0+Zm9yY2V3YWtlLnJlZiA9IHhlX2ZvcmNlX3dha2VfcmVm
KGd0X3RvX2Z3KGh3ZS0+Z3QpLA0KPiA+IEBAIC04MDcsNyArODA3LDcgQEAgeGVfaHdfZW5naW5l
X3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAJc25hcHNo
b3QtPnJlZy5yaW5nX2VpciA9IGh3X2VuZ2luZV9tbWlvX3JlYWQzMihod2UsIFJJTkdfRUlSKDAp
KTsNCj4gPiAgCXNuYXBzaG90LT5yZWcuaXBlaHIgPSBod19lbmdpbmVfbW1pb19yZWFkMzIoaHdl
LCBSSU5HX0lQRUhSKDApKTsNCj4gPiAgDQo+ID4gLQlpZiAoc25hcHNob3QtPmNsYXNzID09IFhF
X0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiA+ICsJaWYgKHNuYXBzaG90LT5od2UtPmNsYXNzID09
IFhFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiA+ICAJCXNuYXBzaG90LT5yZWcucmN1X21vZGUg
PSB4ZV9tbWlvX3JlYWQzMihod2UtPmd0LCBSQ1VfTU9ERSk7DQo+ID4gIA0KPiA+ICAJcmV0dXJu
IHNuYXBzaG90Ow0KPiA+IEBAIC04NTIsNyArODUyLDcgQEAgdm9pZCB4ZV9od19lbmdpbmVfc25h
cHNob3RfcHJpbnQoc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hvdCAqc25hcHNob3QsDQo+ID4g
IAlkcm1fcHJpbnRmKHAsICJcdEJCQUREUjogMHglMDE2bGx4XG4iLCBzbmFwc2hvdC0+cmVnLnJp
bmdfYmJhZGRyKTsNCj4gPiAgCWRybV9wcmludGYocCwgIlx0RE1BX0ZBRERSOiAweCUwMTZsbHhc
biIsIHNuYXBzaG90LT5yZWcucmluZ19kbWFfZmFkZCk7DQo+ID4gIAlkcm1fcHJpbnRmKHAsICJc
dElQRUhSOiAweCUwOHhcbiIsIHNuYXBzaG90LT5yZWcuaXBlaHIpOw0KPiA+IC0JaWYgKHNuYXBz
aG90LT5jbGFzcyA9PSBYRV9FTkdJTkVfQ0xBU1NfQ09NUFVURSkNCj4gPiArCWlmIChzbmFwc2hv
dC0+aHdlLT5jbGFzcyA9PSBYRV9FTkdJTkVfQ0xBU1NfQ09NUFVURSkNCj4gPiAgCQlkcm1fcHJp
bnRmKHAsICJcdFJDVV9NT0RFOiAweCUwOHhcbiIsDQo+ID4gIAkJCSAgIHNuYXBzaG90LT5yZWcu
cmN1X21vZGUpOw0KPiA+ICB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmVfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlw
ZXMuaA0KPiA+IGluZGV4IGQ3ZjgyOGM3NmNjNWYuLjI3ZGVhYTMxZWZkMzEgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oDQo+ID4gQEAgLTE1OCw4ICsx
NTgsOCBAQCBzdHJ1Y3QgeGVfaHdfZW5naW5lIHsNCj4gPiAgc3RydWN0IHhlX2h3X2VuZ2luZV9z
bmFwc2hvdCB7DQo+ID4gIAkvKiogQG5hbWU6IG5hbWUgb2YgdGhlIGh3IGVuZ2luZSAqLw0KPiA+
ICAJY2hhciAqbmFtZTsNCj4gPiAtCS8qKiBAY2xhc3M6IGNsYXNzIG9mIHRoaXMgaHcgZW5naW5l
ICovDQo+ID4gLQllbnVtIHhlX2VuZ2luZV9jbGFzcyBjbGFzczsNCj4gPiArCS8qKiBAaHdlOiBo
dyBlbmdpbmUgKi8NCj4gPiArCXN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZTsNCj4gPiAgCS8qKiBA
bG9naWNhbF9pbnN0YW5jZTogbG9naWNhbCBpbnN0YW5jZSBvZiB0aGlzIGh3IGVuZ2luZSAqLw0K
PiA+ICAJdTE2IGxvZ2ljYWxfaW5zdGFuY2U7DQo+ID4gIAkvKiogQGZvcmNld2FrZTogRm9yY2Ug
V2FrZSBpbmZvcm1hdGlvbiBzbmFwc2hvdCAqLw0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KPiA+IA0K
PiANCg0K
