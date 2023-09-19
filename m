Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA660CD54B2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 11:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580E010E39C;
	Tue, 19 Sep 2023 11:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2F010E39B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695122161; x=1726658161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cQIfiymxKHS9iHuWT44a4Be+bZU09uJ4wfWul7awAlA=;
 b=fbvF4at2xUAOWeIhKVDFvZKAaskY3UE6jNcJovILUWTTiAhAVT5aoR5w
 xGViSr1mM+UEXLL4ckQ1AznJSaB8a9BVZPW+PugYMHNQaaX1yfy6LJqvO
 oy9j3Lb+0ozLkwadjTqZEqtPemDVjmj0p2HNZj7DmYTxTHzI2KIIQGzui
 U+rIbmhBEKnjr+tHXUK4XPi8VTQfP1UFGKQfNw8508OO47KTUFqyRFqbd
 ZywkXfpq7g9IHdMhA4NZbvK3LEWXbzoGA8Og0jGmDMVt902iVHczmuwQ8
 w/8RQjsfbgD01E5REySfdq4bcr7VxlBZYKuw1R91M2MJiNZVkpvwjRrSb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364957580"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="364957580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 04:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722833922"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="722833922"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 04:16:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 04:16:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 04:16:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 04:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajI4e/TEbLQ6+lDYoEZ1JKNqwGW/MtpJMRxk+N0zkud+nxeSn7QUJ16BJwxFXmBrM3vIxpQ1BPe9Kmwd05AP3Pm702mtRusofewOeiTVXwUlRH4+K0QEsuTo/o0HpoD2dzJzVPTgP4EHH9U/wSydJnk0NBdbROHPgkjvidMHooE7tzSrw9vVJqmAwIqVrl+OOIZHgf16BUPHm1Ux+k+02S34kFNvoUoZfSVi38YZSWpeML5f2CIf56vNHl+TypeDkpAQv+E8fjd19kWHek6jiFbZEZn64sudluG+HlCMbdpMqdAFgKQwB2LPPbiByCvzCF6fAZ13dMxyLgN8X1U+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQIfiymxKHS9iHuWT44a4Be+bZU09uJ4wfWul7awAlA=;
 b=SnHRQiNLI9uHl4EfowjnNVfgQLqaoCmA6G0GmmQPqQ1GkDhnrzy7hxIsIQ+q4Rv+RRjU7IfPEt3cG0jPFYquVs4y+SCuDhWwVbO1TdOkMPTB5zF75sGi9SHR/QPyY8USMxwwcBBpe8VSgjfKclwZErp0H2IpxBRnlfKVPoOOM6UMOaAEciXH5ndzj6EdLzbiDIEfyvRBGGx5xJECSrtStIEqMn4bUGmXRtPoLWxYaChHo1s5aGQVqsg4tFLzBi3NfBCbHdpM3J3jp37JAJywIKjE8OCHETo5RCmyn3OcefPeofy4rdXy2bx6wnOjPAOPsgOok6qeRyxxFpnGYDtRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 11:15:57 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:15:57 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Thread-Topic: Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for
 non-display paths"
Thread-Index: AQHZ6gHeAs6BjJcdmUWHCcpVz/srwLAiAUyA
Date: Tue, 19 Sep 2023 11:15:56 +0000
Message-ID: <0bc5536a0e3dbf8506b824fc0564ab8c64cbaeea.camel@intel.com>
References: <20230914145451.159278-1-vinod.govindapillai@intel.com>
 <279c4847f8ee05d341ded2fabcc84071aa5d9784.camel@intel.com>
In-Reply-To: <279c4847f8ee05d341ded2fabcc84071aa5d9784.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BL1PR11MB6025:EE_
x-ms-office365-filtering-correlation-id: 82698bdb-4de1-43bf-84e7-08dbb901cbdf
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNTaeOzR/4GGhsesuweCa0KJGeTjAYuvdVYde40fx+uwnN88OC0aey1+naVWvWU9dIFRiNk8Oyxtpf8EBsaYjlQCXUpYPg8pKiXCKQYPMi+nQtHcsiJ8UPOspWFPEZkSbnK/p+jJC68gqWMqxWqRopYAZ0+9OVg7hPWvXw9PZMoSYcBeEGM63Piz4lINpOuc4/X6N0ZJWSc5sgc8KzhNYgFHH/WA5MRd4uOG5WvgdYg+RklyLOskyTDjMKa/Nnm5Vcyrc9/ApVq+izFEDZiMn5PjvtfY6weTDSIRLvo2h7Y6Cx7OyctVNYrFuIVt30KHfUo4o0yVzRg0J02tHSzSOCvAiRO8LDHzU1KSDHx0ZKJJGtaH6GxxsQPxXLUTFD9ojlk+N+rGvVqHWMGhpJZwhoFP6GC5OoEbba3ROpPZlEIu5XrXRtGJplNgGuY4bMZMqp5DOIUOwUlct+Eaz92GRSGdrLJpNODa5IuIV5StG9r1A+SILWEE0UwNfgwvreJJooQ/lziwYijq7JjEMUFcNUmsjB+UZ2drPPouHlrDuGo1TjDgLDaIbZuCV3oKqMGylt4OZtWQuea+wKd6JrAxc9AUOS1oD/dznq91LKk8ttzT9jm+05Qee1b4M2001U3I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(186009)(451199024)(1800799009)(6512007)(4326008)(6486002)(6506007)(26005)(66574015)(2616005)(107886003)(8936002)(8676002)(83380400001)(82960400001)(2906002)(122000001)(36756003)(41300700001)(66476007)(86362001)(64756008)(66446008)(66556008)(66946007)(76116006)(316002)(6636002)(110136005)(38070700005)(38100700002)(91956017)(71200400001)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djlmMXk4dHlvelhqUEdzbkp3SnlOTU5HME9vTitMWHAwOGJQS1JOTjc1aUxl?=
 =?utf-8?B?U052TUtYT3Q2WTkxRG9VdzJzSDZ4enpZSmg2R2RHQ0FPS1pTaWs2Z3RRbjNo?=
 =?utf-8?B?ZVVSSHJjMndlbUdnVFdGOUFIT3I5STFVUkwvSmpRMDVBZnZWekFCZzBqeFNK?=
 =?utf-8?B?dGpwYzVPa3lBcEQxT3JONUJqUGhjZjRRMGhyUEVKcWdPQTZjME1XQzJJQjZz?=
 =?utf-8?B?b2dHY282a21kK2w4TTcrekRXdGFkZXNYUHdUcVBKR3E5S0V3ekJZNzJneVBZ?=
 =?utf-8?B?cmdNVTZScktieUdtSnFaZlFlaVB6dXQ3c1drcW5iVnpiblJPR2pNTVJydXlJ?=
 =?utf-8?B?cGZOL2EyUmsxUENuOXBGRFA4enBVOVpjOUJHNC9MeDIxa0hGMTVIUU1UUnJE?=
 =?utf-8?B?VUNKa2gyM1BwTGNyb2FFTGN4ZURPbWFQOFAzanB2aG5XNU45YXFaRkNuZW9X?=
 =?utf-8?B?ek5MNnMzM0loZjNJMFQrWjZHNVhUUVFPaGU2SEFiaGJ3YlV3b21pM09KK3Rp?=
 =?utf-8?B?NDV0WUlXWjV2eVZ6OWJKY09nWkRzUzdQVFpCQkhEclVaK1lFdUtoM2JEalQv?=
 =?utf-8?B?USs5YzV1dkhjb01zdWpzRnVmeWJtcVUyeUljRmlQUXZZRVdicDFac0kvakNU?=
 =?utf-8?B?cHZlOWN3Y2lqZWRaM1B4eDUwUHQvamhWSlY3bUtyemJxeEJrYXcrcTdpZTBX?=
 =?utf-8?B?aWVjUG1DYlFDdTBZcDFXaTQyNlBheE5DdU5WQWFKblQvWVkzOTVlZnhsZXZE?=
 =?utf-8?B?R1ZrdUh1MFpNeXdYUDRvT2NYdnNPMHRhb3Nic2JjbFQyK3R6c2ZjLzBIVlVY?=
 =?utf-8?B?MUZPNSt6d2xyeStFVGVGSUpnMUdtOW9BODRjY3FXbUhWTW8vUnFKYUlwTUtE?=
 =?utf-8?B?WUxzaGtQVEx4NEFzYmo1NkRtbEFPeGp4UzQxMmZmK0loOVlJaW9Vay9rV1Ry?=
 =?utf-8?B?MFhKZ3pQUExBMWdLREFwOVdaMUZqaDd3Tnpvb0hRSUVUWGJJYlczQ1JlMHBq?=
 =?utf-8?B?bENDYlhDS0dXM0x5a1IrVHluQ0N1Ym40bmFxMkFJanMvbDA2TTI2bEcyaW5R?=
 =?utf-8?B?NXVid0xOSmhLdmVXZThZaXBpN3hENCtHblAyRnRGR0w5cWFOdHR3SkJuRk1p?=
 =?utf-8?B?Y1VDdDVmYW1NeHpqNHZlUXA5a1hxa1hTYklUVk1uYWdXQ2dYR2ZQb2wxS0RM?=
 =?utf-8?B?OS83SWZBSXgvOWFwQ3BVQTl6cTRaczJaaXVQc20xSGlDTHY1Z3U3dFhLNjBB?=
 =?utf-8?B?ZTgzZFRxNmNSZk5ZRkJDeS9WSkZQQlJ4a2hZZ0N1RGFUOTRrMnVEbU56ZUVh?=
 =?utf-8?B?dkRrVzlSRldDa2RKOHl1UVpBQVNVZlRKVUNSTnJDRW8rQzFrT1UvZ2g2c0wv?=
 =?utf-8?B?U2R5b2lWSU5GWncyRjJFUjgrMFJEcHN4bk1xZTYyU2NLVThSSWtCamQrZlgv?=
 =?utf-8?B?Q2ZwVmU5SzdsdStqYkxTWm9rT0Q0U2l6UDhVMGVaM0NRWjVZUDZGSE85bnNw?=
 =?utf-8?B?UFg1L1NNSnk4SFpFRi8zSFI1WmcxM2wwMFFCa0Z3VEwxdnV4cGFGYU1DR3Ba?=
 =?utf-8?B?MFozeVZwcEZoNEk4UjRWR1p2YWJNanRDM2djc2JlMGExanVjSkpJWEx4cXRY?=
 =?utf-8?B?bEhXM3Fmbjl2Q0ppSGJCUjFkYlhzV3N1eWRFa0oxSGZISXpsa2JOWVU3MFdU?=
 =?utf-8?B?SzY3TTFhSDNOZmV3clIzU0gybytDTzQ1VnYzSnp1cTREaEJsQVpjNEg1RjJN?=
 =?utf-8?B?Y3lmSXVvMU5JZmNGaFNzaEpadzU0MEFTRVlqUWNtZ3dQdjJrZHFNbFRKNTZU?=
 =?utf-8?B?N29SaVJQK0NnSG5MNThXTkxDOFFrbWRJTmlwRDhzY1dQcHVWZjhJTVhDcmlz?=
 =?utf-8?B?Q2d3NEprdHZxR3UwN2p4WGYzL280YnZ0MkRDTFczYnZMNzRkb3dBOHpBc0hj?=
 =?utf-8?B?MTQ5emRybWJYemo2a2dQbDMwZHBpWXNvOWRxbTRkNU1TeVBMVld1amdTeEIz?=
 =?utf-8?B?WC9BaWlROWJFeVp1MVp1UHA1VTdEWW1xZWFZbm1odFZYVDdVS2xud09HN1pl?=
 =?utf-8?B?akRVOUx1U1BQRElvNEhMUFlPOHJQaTQzd3RMc1hvL1BRclcyK1pjckxNNTUy?=
 =?utf-8?B?VUtLdWJwWnNkRU5idWkxUHpFM20vT1RyUjhobmdUcFlVemQwZC9xdE5LUGpl?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6E9E9DAE6E96E4A9546200669C3EBFF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82698bdb-4de1-43bf-84e7-08dbb901cbdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 11:15:56.9144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxYiISyrKN84Yy60mdP4YdwRnVv94P7UAYCp8+06dR/2z4lPylRcPGDUdi55tqMH/kDKjc3qhwMlecjjgn5iDxX73kHCNf9Vgyof714uZtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Revert "FIXME: drm/i915/hpd: skip
 intel_hpd_poll_fini() for non-display paths"
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjI5ICswMzAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIFRodSwgMjAyMy0wOS0xNCBhdCAxNzo1NCArMDMwMCwgVmlub2QgR292aW5kYXBpbGxh
aSB3cm90ZToNCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDViNTAzZjdiNmFhMTU2ZDQ1MmZhZTNj
OTJkOTA2MGI1MzFhYTYyOGMuDQo+ID4gDQo+ID4gVGhpcyBjYW4gYmUgcmV2ZXJ0ZWQgYXMgdGhl
IGludGVsX2hwZF9wb2xsX2ZpbmkgaXMgY2FsbGVkIGZyb20NCj4gPiBkaXNwbGF5IHBhdGhzDQoN
ClRoYW5rIHlvdSBWaW5vZCBmb3IgdGhlIHBhdGNoLiBUaGlzIGlzIG5vdyBtZXJnZWQuDQoNCkJS
LA0KDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gSSBkb24ndCBzZWUgcmVhc29uIGZvciB0aGlz
IGVpdGhlciAtPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3Zp
bmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMyAtLS0NCj4g
PiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiBpbmRleCA5ZGY4
MDgxZjc4ZDkuLmIyZTE2Y2I4ZDAyNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4gQEAgLTgwMjcsOSArODAyNyw2IEBAIHZv
aWQgaW50ZWxfaHBkX3BvbGxfZmluaShzdHJ1Y3QNCj4gPiBkcm1faTkxNV9wcml2YXRlICppOTE1
KQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3I7
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBjb25u
X2l0ZXI7DQo+ID4gwqANCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoIUhBU19ESVNQTEFZKGk5MTUp
KQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47DQo+ID4gLQ0KPiA+
IMKgwqDCoMKgwqDCoMKgwqAvKiBLaWxsIGFsbCB0aGUgd29yayB0aGF0IG1heSBoYXZlIGJlZW4g
cXVldWVkIGJ5IGhwZC4gKi8NCj4gPiDCoMKgwqDCoMKgwqDCoMKgZHJtX2Nvbm5lY3Rvcl9saXN0
X2l0ZXJfYmVnaW4oJmk5MTUtPmRybSwgJmNvbm5faXRlcik7DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oGZvcl9lYWNoX2ludGVsX2Nvbm5lY3Rvcl9pdGVyKGNvbm5lY3RvciwgJmNvbm5faXRlcikgew0K
PiANCg0K
