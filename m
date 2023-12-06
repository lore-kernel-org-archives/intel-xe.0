Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2206CC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 08:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4410E6C4;
	Wed,  6 Dec 2023 08:27:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBD710E6C4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701851225; x=1733387225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ptMy9qEeNl/CYZafpEJzSh3CmFkMnYiy/SCxu9ZSODQ=;
 b=ZKemFu4mPTYt8DpqFZEdbTUyYlo5g6zBaUCk7zF263fhoXfDnbUjC7ds
 t1Z8pZ4uO3mvyC4xcEJVstXetxtq8edU9N17k5T9Zt96DeUY22mFHpKot
 XPAijb8fMKTN+3KM3X1ZkTtKNW3InsjzvbVUBT9/nsGW2dFOIXUEbajcJ
 gC6FYkT8kJa4+tJb/7hOeuJbkmfSp0sqs4VOguoK0s7LX3ecLXzLtLJuJ
 z1Uu/RYAq5T6A3TD5CfyORep8H4e29mIbQ6QPGEIPwezQLGGm77ZK+f2D
 gEwXkhCMyhuEebw8LmdROPBt/007E5nTYBU4jaWUFJxOg/3+P7yJXt02i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393755848"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="393755848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 00:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018485990"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="1018485990"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 00:27:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 00:27:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 00:27:04 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 00:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/XOv08klZmgdqdgznSF1vJhmJ+wo5agErYJiJq1e3KlI9ZgRUNHJtfqJdRHG8zYN1erVWspa8GlZAjRjeSFI2Q3tBtk0qarZs2j9BefBJ77x/j3cb4PjTdfbIPmlD7qyqOPDqSJt0HTyHWlSPmvG56RzUihDxYts9Ms/rYi7Vnr3onNXqTcVfuI/a5G8vPl2rmk0rwheqvveiQMJqLIZMfXPlLMinyUaw7/zOkVTNDgIj/aYAQW6AXkpNiG6FTQTmigjLeWkbNqOkAEu1kN+k2ohWBws1th8YxoPl/0WkJvMzULGurcLeMG/cPIFb7FMrhJ8bMKeenX5wq05RMaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptMy9qEeNl/CYZafpEJzSh3CmFkMnYiy/SCxu9ZSODQ=;
 b=PlwHbjpxWwRMVHx/H6rmlbN359Swm3w5tF9r+fVY4RAGte1oos0jJgVhbEakxtCd5HDXDWmufpvxMiaSz1roW+ZQ1619kV118EyZEqYEhkznu9mwq9uL1Pb36NJ3McOGGIr+UGR3tvAuGUDpCxn36tqYJnpgB8ewRMyikv8nacJbZUSQ6aEoKyoEi3zDOSbEyCJzIUkNQz034ny9+bAdgDcRtUOsCLs/K6VGwhcVS9m/jnCnZpnlXGiO46KHGL8vlAi+ShN9X5G9FK3nFx7DL74dhF/Xl7p4Ktycw8CDhRP2sCTU89v0lWlPeiOD5fvsvreFX/qdEUqtsidUcEptwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.25; Wed, 6 Dec 2023 08:26:57 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::83fd:c944:e8ef:8adf]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::83fd:c944:e8ef:8adf%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 08:26:57 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Thread-Topic: [Intel-xe] LLC configurating, mmap and bo cache management
 questions
Thread-Index: AQHaJ4YS5+oCPjcXB0uWT5v3pcaZKbCb7OYA
Date: Wed, 6 Dec 2023 08:26:57 +0000
Message-ID: <c16bc9f7bd18f531136ebbcf6504d497db9a793a.camel@intel.com>
References: <02c74379-6513-40cc-a195-c4eeb7a7fd79@linux.intel.com>
In-Reply-To: <02c74379-6513-40cc-a195-c4eeb7a7fd79@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|CO6PR11MB5617:EE_
x-ms-office365-filtering-correlation-id: c0aa50d6-df04-44c0-8deb-08dbf6351c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bH0XbudLShiK7slJf97Oedq6Gm6y9t9dFfW/47QmR/xus0zGG/mt8A5SIUOuSp5lAJLptGrJ7iGs6Hd0TWdtcdKI5hwBNolZ4YgqteGvu2f8z3uYLtl4PLj5B+IhBCQp+TOSxdNZ2Ru2CGJuKvCqv+cSkek3XBhDW0IROSVbG+OZHV4yEz8xJkeE8oaKvYW1CxLqBpaaKtG9l6nMu3aUrS/TpPOyGdmuPsEH/DjflY89JomRp8+lXEqEskIeqjWAAHCUsYzJnxgbhj7xt4fp3SJkapvl5+2xcIzzu9oLukSnRRxE7/c5uQ41t/Nf50qRZT1txVGrBrEoxcK06zrv/0mCH8BnNF/baV0AVsQM4OQRh7NlrNv1AcFZl1mFhKA6/aWCwjIGVlo1Zb6qqorIDaRICj53K4YkvTC4BPFb9UmztmWXoNxFYqQFvBv5mjybYcXRPpnYPYtohDoC6t5bB7rLbfD4GKG02zA18He/i+eFVZu0fGkGKNzzi0hLOzw6WP8htBfLtUKbLHmm2lIguEJOCwOV7AmJW4ogx24w3BjiGohpAB+BWilg7HrcaI385bGfEPrZbL8r9iHF+45Mu+wjhf7Two7Gv1Ixw8utHMg3b2X9N9jMLhvEB56RECDU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(66556008)(66446008)(64756008)(54906003)(316002)(86362001)(8936002)(4326008)(8676002)(66946007)(6486002)(76116006)(478600001)(110136005)(91956017)(41300700001)(36756003)(2906002)(5660300002)(38100700002)(122000001)(2616005)(26005)(71200400001)(6506007)(83380400001)(82960400001)(6512007)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3JvUHh4V0JFQUJ1T1l6SEsvMXphUmdITWlXdXNJb2hBVm9qbjBrVjhaaUtO?=
 =?utf-8?B?bjF0VkVPRHViTXk1SXF0YXFtbHVKL0NxaTFaQjhWRGszV3VXaDBpZW8xZkd4?=
 =?utf-8?B?cFlOajJHN0FsV2JNV2dXcVhCSTNNR2hmOTRSZ2JvZnhZOVMwNnowM0NybUoy?=
 =?utf-8?B?Z2VwbzZ5RHo5MlVFcjRudDlQZDQ2My94YUdZK1RrMUp6WUpKWDNLSEE2dklJ?=
 =?utf-8?B?eXlkc0c3YUgxRjh1Vk5iZC8zNTdlb1MxRHN2YWVITkY4R2dHNDc1eFJ6V2xt?=
 =?utf-8?B?TzN4ekV5UVJ0VExmVEN5eStqTm5vTXp2WUJYY2grUkxMQzdSUEhvZW43MUpL?=
 =?utf-8?B?R3lSSERsUVZsT0w0YklUR0xMalV4QzBqVGsxdjhwZGhZZHloVzhXNC9IVUhh?=
 =?utf-8?B?K2NKMEFZcXlwaitpV0F5Y05ONHlKQTRCTW1GdEphNG5oSFNNOG1xQjhxRkRQ?=
 =?utf-8?B?NUkyak92cU14SnVhWjlKeElSTVlubWRpbG5RSWh4alI2TmJxUzBpa0NrZ1Yx?=
 =?utf-8?B?cmhRUG82ZEk3am0vbzBVQ3dhQTBrcHpHbDA5RnNadzc4dTQ3TE51QUdpWm1I?=
 =?utf-8?B?RUtFMnNuYlU3NDg4enAydnBCK3RadDNrbnU2Q21nLytKV0tpSEk4OVZNRHp5?=
 =?utf-8?B?VTBiZnlFd1dwcGh3SXlUVmxTc2ZIMklISG8ydWZvRUJiM3NNTE5HcmlrNmxy?=
 =?utf-8?B?VHJWbUhyMnhzYVR1RE05MzlPNkVLUlp1WEdzbXBEWkNkallKREVzdjRVMGJq?=
 =?utf-8?B?Vnh5V0FTN1lxb0pVZkRQQTZBMGpKcTJwRzEvSVZ0c2VZM2RqUzRLcDRkUHRt?=
 =?utf-8?B?alFZRDQyRThldFJCVVkyWGRBM2pBS0d1dUNKeEZ6SE9Sa3RUZExWaEZnUXl4?=
 =?utf-8?B?RE85b1NscXFtdUVnS3hGd0YxZHJ5dG9zdUt4ZEM2bEU1MENhaFh4c0MwaDE4?=
 =?utf-8?B?Z2s4Y2F1aW0yM0FJOEVVbitYQU5YNTFYK09nR2lzL1pGcG03Sms1L3MrZ0Mr?=
 =?utf-8?B?aXhjTE52QWxuMENlN3dDdmRSN2EyaTFyemdUci9UKzQ2NmVzRXV4S0ZBYXBW?=
 =?utf-8?B?N0pmbXBvZlJMdVFHem1XWUJnUEwzeDh5U1h4bzBjeVlyeDl5djJTQjYzSXpC?=
 =?utf-8?B?THFFS2tFMVAzVTV0eGMybzkyQ0RmbmJPalpxSzVmQTVsZ2xzb1BRQjc5UUtZ?=
 =?utf-8?B?QjZKelFVNFJ5SjF6U0t3VHV3dHY2SVZSQ3p1UkhYYm1xTGg3NGJJYWhqRklY?=
 =?utf-8?B?dENhTWcxdzN1T3FMekpNMHhZdnF4emRFZk9NVXdFUUhuQytYRkN0bGMwL0c4?=
 =?utf-8?B?Q0ZaMitvT0orTnZONVhYMlRZT3AvZUtYaldZZ3pBYTYzM2RNZUJ6Q2IxbzZx?=
 =?utf-8?B?dUZNYnozNCtoOWowWDBFMmJlcTZFNUVoQzBtYjd4STlPVTcrN3hPM1RsZGJw?=
 =?utf-8?B?Myt4WnhST0RnLzUwWUlLRTBsZElSb0pwRTREY01VNjJYdlRmaTltbG8vL21Z?=
 =?utf-8?B?YTRad1EwY3pMd3RJRGVyaDdFOFNBTlB2bHZGd2hETjNONlZHMXcrTkNTS1Yr?=
 =?utf-8?B?UW5qMWFxMmpSNkhvSVBiODAyUmJwQ2pjbjN6c0tnQk1BRWhKQU94RG5BeHJY?=
 =?utf-8?B?R3VBNmsxa3VBMjBDQ0lOT1FJMXk2WDlVaU84Q0JkYVQyY2V3ZUJQVnVoWFFj?=
 =?utf-8?B?bkdtQjk5OHBUYzlacGF2TDUyOWZ4eU5YczZyZGNFYzNWenU2NFlEQkQ2cWs0?=
 =?utf-8?B?OS9MLzlTYnJaaEx1VXNCalIycFdSRWRLemVCUi8yb2IxOXZ3MUUxbFVEM1hx?=
 =?utf-8?B?RmZiOWUyTFoxRm9OTEhIcUUxTFhtckFjVlFNQVI0RjQvT3pOQXZlVUZDTzds?=
 =?utf-8?B?OVNOSTg3Q01RdWhGeGJWRXU5NlhHU2paaVVGR2J2N05DN2lzL0lhTElPNE93?=
 =?utf-8?B?Vit3aUhGVkFVY1c4YUthVit4NkVET0E1bDh5cFErcmw0WDF3K3FTM1p6SkZS?=
 =?utf-8?B?elErRXhNQ0N3S0VrYlNQdEwvQnhsS0QzTCtVR0hyTGtTRFEycVkvV1ZpZzZF?=
 =?utf-8?B?YUtSUEtsejQyWm1QMUlOME5ka2NMUFNqYkVVRjNNb3lNcFJFNXVRSkNZUEw1?=
 =?utf-8?B?VmpFWlBXOUNwaGdqSDFpMGRNNi9zVDBRbHVWMFoxYnVoeEZtWEdpQ0lHMkU1?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D5BC05A45F73B488C7CB5682FB95CFF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0aa50d6-df04-44c0-8deb-08dbf6351c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 08:26:57.5522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBNEU6eiHhwdu5AbUiVZVviHiN5wuuE+RKrSbxP07/puOjXIB0naDv75M71vmPoEOtO3FTRv/IKJPaRoWU6HOJojfBnFATsos7Zloxwk0H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] LLC configurating,
 mmap and bo cache management questions
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEyLTA1IGF0IDE0OjE5ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gDQo+IEhpLA0KPiANCj4gV2UgYXJlIHdvcmtpbmcgb24gYWRkaW5nIHhlIHN1cHBvcnQgdG8g
Q2hyb21lT1MgbWluaWdibSBhbmQgaGF2ZSBhIA0KPiBjb3VwbGUgcXVlc3Rpb25zLg0KPiANCj4g
SWYgSSBmb2xsb3cgdGhpbmdzIGNvcnJlY3RseSB3aXRoIHhlIG1tYXAgY2FjaGluZyBtb2RlIGlz
IGZpeGVkIHRvIA0KPiBvYmplY3QgY2FjaGluZyBtb2RlcyBzZXQgYXQgYm8gY3JlYXRlLiBGb3Ig
ZnJhbWVidWZmZXJzIGl0IHdpbGwgYmUgV0MNCj4gYW5kIGZvciB0aGUgcmVzdCB1c2Vyc3BhY2Ug
Y2FuIGNob29zZSBXQiBvciBXQyB2aWEgDQo+IGRybV94ZV9nZW1fY3JlYXRlLT5jcHVfY2FjaGlu
Zy4gKFVubGVzcyBkaXNjcmV0ZSwgd2hlbiBXQiBjYW5ub3QgYmUNCj4gdXNlZCANCj4gYXQgYWxs
LikNCj4gDQo+IEFGQUlDVCBtaW5pZ2JtIGJhc2ljYWxseSBjYXJlcyBhYm91dCB0d28gdHJhbnNp
dGlvbiBwb2ludHMuIExldHMgY2FsbA0KPiB0aGVtIENQVSBhY2Nlc3MgYmVnaW4gYW5kIGVuZC4N
Cj4gDQo+IDEpDQo+IFdoZW4gYSBibyBpcyBtbWFwcGVkIGl0IHdhbnRzIHRvIGludmFsaWRhdGUg
dGhlIGNhY2hlLCB3aGljaCBsb29rcyB0bw0KPiBiZSANCj4gYWJvdXQgbWFraW5nIHN1cmUgYWxs
IEdQVSB3cml0ZXMgaGF2ZSBsYW5kZWQgdG8gdGhlIGJhY2tpbmcgc3RvcmUuIEluDQo+IHRoZSBp
OTE1IHdvcmxkIHRoYXQgdHJhbnNsYXRlcyB0byB0aGUgc2V0X2RvbWFpbiBpb2N0bC4NCj4gDQo+
IFdoYXQgaXMgdGhlIHVhcGkgZm9yIHRoaXMgd2l0aCB4ZSwgb3IgaXQgaXMgc29tZWhvdyBndWFy
YW50ZWVkIHRvIG5vdA0KPiBiZSANCj4gbmVlZGVkPw0KDQpTaWduYWxsaW5nIGEgdXNlci1mZW5j
ZSBvciBkbWEtZmVuY2Ugb2J0YWluZWQgYXMgYW4gb3V0LWZlbmNlIGZyb20gYW4NCmV4ZWMgY2Fs
bCB3aWxsIGd1YXJhbnRlZSBHUFUgY2FjaGVzIGFyZSBmbHVzaGVkLiBDdXJyZW50bHkgSSBkb24n
dA0KdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgbGlrZSBnZW0gd2FpdCBpbiB0aGUgdUFQSSwgYWx0
aG91Z2ggTWF0dCBpcw0KanVzdCBhYm91dCB0byBhZGQgZnVuY3Rpb25hbGl0eSB0byB3YWl0IG9u
IGFsbCBvdXRzdGFuZGluZyB3b3JrIG9uIGFuDQpleGVjX3F1ZXVlLg0KDQo+IA0KPiAyKQ0KPiBX
aGVuIGEgYm8gaXMgdW5tYXBwZWQsIG9yIENQVSBhY2Nlc3MgZmluaXNoZWQsIGl0IHdhbnRzIHRv
IGZsdXNoIHRoZQ0KPiBDUFUgDQo+IGNhY2hlcy4gVGhhdCBpcyAvYWxtb3N0LyBjb21wbGV0ZWx5
IGEgQ1BVIG9wZXJhdGlvbiwgd2hlcmUgaXQganVzdA0KPiBuZWVkcyANCj4gdG8gZWl0aGVyIGNs
Zmx1c2ggb3IgaW52YWxpZGF0ZSB0aGUgV0MgYnVmZmVyIHJlc3BlY3RpdmVseSwgaWYgbm90DQo+
IHRoZSANCj4gZmFjdCB0aGF0IGNsZmx1c2ggY2FuIGJlIHNraXBwZWQgb24gcGxhdGZvcm1zIHdp
dGggTExDLg0KPiANCj4gSSBkaWQgbm90IHNlZSBhbiBlcXVpdmFsZW50IG9mIGFuIEk5MTVfUEFS
QU1fSEFTX0xMQyBpbiB4ZT8gRGlkIEkNCj4gbWlzcyANCj4gaXQgb3Igd2hhdCBpdCBpcyB0aGUg
cGxhbiBmb3IgcXVlcnlpbmcgdGhpcyBkZXRhaWw/DQoNClhlS01EIGlzIGdlbmVyYWxseSBjb2hl
cmVudCwgZXhjZXB0IGlmIFVNRCBzZWxlY3RzIGEgR1BVIFBBVCBpbmRleCB3aXRoDQpsaW1pdGVk
IGNvaGVyZW5jeSB0b2dldGhlciB3aXRoIFdCIGluc3RlYWQgb2YgV0MgbWVtb3J5LiBJbiB0aGF0
IGNhc2UsDQpVTUQgaXMgcmVzcG9uc2libGUgZm9yIGRvaW5nIHRoZSBuZWVkZWQgQ0xGTFVTSC1p
bmcsIHdoZXJlYXMgS01EIG9ubHkNCmVuc3VyZXMgaW5pdGlhbCBjbGVhcmluZyBvZiB0aGUgcGFn
ZXMgaXMgQ0xGTFVTSEVEIGZvciBzZWN1cml0eQ0KcmVhc29ucy4NCg0KSSdtIG5vdCAxMDAlIHN1
cmUgaWYgVU1EIGNhbiBhY3R1YWxseSBzZWxlY3QgV0Igd2l0aCBsaW1pdGVkIGNvaGVyZW5jeQ0K
UEFUIGluZGV4IGluIHRoZSBpbml0aWFsIHVBUEkgcmV2aXNpb24sIGJ1dCBNYXR0aGV3IGhhcyBy
ZWNlaXZlZA0KcmVxdWVzdHMgZm9yIHRoYXQgc28gYW55IGFkZGl0aW9uYWwgaW5wdXQgaGVyZSBv
biBwZXJmb3JtYW5jZQ0KaW1wbGljYXRpb25zIGlzIGFwcHJlY2lhdGVkLg0KDQpUaGUgdGhpbmtp
bmcgaGVyZSBpcyBvdGhlcndpc2UgdGhhdCBHUFUgUEFUIGluZGljZXMgd2l0aCBsaW1pdGVkDQpj
b2hlcmVuY3kgc2hvdWxkIGJlIHVzZWQgdG9nZXRoZXIgd2l0aCBXQyBtZW1vcnkgaW4gdGhlIHNh
bWUgc2l0dWF0aW9ucw0KYXMgVlJBTS9MTUVNIGlzIHVzZWQgb24gREdGWC4NCg0KL1Rob21hcw0K
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQoNCg==
