Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52550C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 20:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC77112C7B;
	Mon, 11 Mar 2024 20:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Er9wlYhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E433112C7B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 20:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710190603; x=1741726603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c4OVkjKRznBXjGssLLklxvJSX3LohB5gboziZC32ISE=;
 b=Er9wlYhZWcnfklGoorQFG33w2p7RqbmZdOQJUFftWZjWuFxtn4xU3EIU
 gh0/aBhZ4K9tfIneRxqWvuxFR5f4m5F1U6v5JaGBJemtSTVIe+nAxrSDA
 PHZIgpPHVTQ7OSmDFV71MAjNO+/bhRGkrVF0uSsS5mMaTkAhZwrkzuTX8
 s7Ck25p0+YJb+2+40R8NvwmpiAqageyw2eQszaqnOBRt3yO52sPbTDshu
 B1aWZdkgAGW9Iqj1Bvh7jM/xcXIxcg1uKYRwDYa/8cutLER8PM4j6uMps
 7tFLp3O0yLdCOeWG0s/UrijxhATIMMHZwh1XVM9qDFMgyDy7zhZNvGzDz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5012528"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5012528"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 13:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15906375"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 13:56:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 13:56:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 13:56:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 13:56:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 13:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGLHutnPDYO04N4R1EUzG0cgrdnMgOqZayu6+G+9qxa0Lea/D7/F5jkuloRHVeS9Y4oYikudObH72ElusU/u/Kk8RTYLy1jr4Gffz5Qwq++FXVPivX9yG1vjU3X42mQSTB3UOhCoYN+Vo/tJjqIq8OR6EV0FG++tvyndhb32tOAI3ZXHFeFZaY5VqJ5dVytDPU64EhI35syEO1rWAkaXb5+hDWfG1NROYw03Ag362oYHtdeXGh74fxCaG54J7T+hRQnhdQLJHvLNd+4UW6CQmW2THdJW/XM3P8Fx6YSL88bz8A8WrD7tfYc20fA5RT/zLLEM5pk39SpmLdx+xq39LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4OVkjKRznBXjGssLLklxvJSX3LohB5gboziZC32ISE=;
 b=DUsjutnCDa1iONqznihcHnXUdXOqdU+YTBhPsSIjS+BRQIG6HJfe9zNAObngh140HvRj0wUSAyq4KMTJe1dawFwUbMuChgKNVNCtxrAZV+0XO5VzVBr1g+8eu9Z6enWLanTqC3nyrw+2BvP9JowS24Cg1tEwjYwq755YL2/4tVQ2DQ1fiFsXTUC252WoQy8vPfn1PaIoclo88NYZfvjJafnB6g9sV+Xm4cdm44hn7+ZqQj3IdNw0QtCDZ+uGNEbFQKbfsy3BswdAviIkd2wcvM4WbtNuQ+dZcM9MhTwimDL9FcfJf59qBv6netenl9FOQbbuPA+NwOq7trito3uq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 20:56:39 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 20:56:39 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "quic_mojha@quicinc.com" <quic_mojha@quicinc.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 2/4] devcoredump: Add dev_coredumpm_timeout()
Thread-Topic: [PATCH v3 2/4] devcoredump: Add dev_coredumpm_timeout()
Thread-Index: AQHabkHHanzUOwR7gE2NE9Rgc7qov7EoQrkAgArN+QA=
Date: Mon, 11 Mar 2024 20:56:38 +0000
Message-ID: <1871f3b6625b1c36a8e8c7dbf13e5c2619a6cb62.camel@intel.com>
References: <20240304143905.52740-1-jose.souza@intel.com>
 <20240304143905.52740-2-jose.souza@intel.com>
 <lp5at2yebh4in7ecddh45gkmaqhys6uyedtf3oh6ow45amgocl@2pw54fui6hos>
In-Reply-To: <lp5at2yebh4in7ecddh45gkmaqhys6uyedtf3oh6ow45amgocl@2pw54fui6hos>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB4836:EE_
x-ms-office365-filtering-correlation-id: f1a23c28-dda5-4f81-6521-08dc420dbf39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xOIYQxJzbbZtIwpl+WVeITvQq9Edu4exnM0H2+yhZdMSesfRhZNrNabRek6iwY2HV38KFBSudCOeZyzc5vdPj3m0KiA/zy69GNfCbyIXppdKVG/NDfX3k+E2s9iH9ptjFZZLUEQGjXSwZWtjr3e6CodO9agADp7GjbZmCYCxHFiefGg90cADPPJRBrXmZx9AFzBQjjKZaHSwGd6Uf89BDhDttb7NrAfcYmh7PosM+6HqoJkqxAXfQz07neuUxarKwpiOAHUlh+GOZP9mB1dBudas1a2i4VMYRIKVpmV9isG1U8Dd/VIN40iS4LUPB0+rOKq93XhJLIek2fKgwSOYREQCJEyrs6xP84ZEXXy1IK5Re2/fTrSD8myT1yG+G/ihDlrg8WxLovo00rI0xpqT7Ukn0oNxnRfOE+EBWMSOlDXAl6kKjYnUg/Dvul63GDptEPi9V9HfNf7mZRHmNmmXo/UjHrvJiBUnxkbI0CBkOdgWl9xTvafLpLwM7pbEvfz9M+wU1rmeXsiKGXM0dQAf+Wnzgb9Mzf1wgPUqjIv8P3D0LGHE0ClpnmEVLrXCLv8y+y/2OkrjV4EuhRJ4LHAEaF10UFJfQ51QXI9NRagyIgN6PhhiEkIlvD+4FS1sguk6/s3pEUvtzQop8wfoDmIj2q4LbVeF5sO6YPX00SNxxmFAtKCdEGXaR6G9yu3fpFB/WlUL9RNZDBg5nD3UukeJbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWdiS1JQcGpYampGWGxqNUJZa25uWUVObThDQ3JQaVlReGlUeGlDamFkYVZh?=
 =?utf-8?B?RTA2allIb2lRZVNDYlFQb0w1L1RKelI2Y0tOSWNCQXJkWElyaWdkWkdjNG9F?=
 =?utf-8?B?MU1QM1Nyd3FNdU50UzRURGo3K3RsVUF0dXlmak9RNWluc28vMmNHSmFsWUE1?=
 =?utf-8?B?aWcxVnVRRmplUEcvWlh6ZUJQb3pzSDdTTEsyQUpXWFZweXFncHN3VzZXSCtl?=
 =?utf-8?B?cERSRkQrR1RDSE04eEJydzhwdHNYRlRQSHFFd0pvMTJBdWJURHl5UVZmU21K?=
 =?utf-8?B?VDJudWdwdUdWcS9taWNoNHpmWXRheTdYWERyOHA5VUtZTWlFQUxKa2NSbXp5?=
 =?utf-8?B?UGxKWW5RekhYTW5LOWZDU0ZUTExzQlY5ZlF6Q1lSQUcydXJTb2pNUUxaY29n?=
 =?utf-8?B?STJmNmVUaS9telF0NnUxU3VDREs1OFQzVXo0NXgyR2t6M0dZTGJKVTlDTjdt?=
 =?utf-8?B?SERhU04zQjdzYkw3VkI5NmRKTkwwVlR0UDRMbjVBbnNKc3lyYjVzL2I0dC9a?=
 =?utf-8?B?TkdRcFRPK1YvWUVGNWUyUHcrQjhiZ3JTZVl6L3ZMWERLc0hXdjVqZFhFMGQ1?=
 =?utf-8?B?M2Nuc3Fwc0V6RzFrSHRuQzdpZ1IxQ2t5bG9GNWpJbFZDZmNWMzlrZFl1aHli?=
 =?utf-8?B?QzJobVVaVHJLdnBnTXhscEVNbzVqT0l4RHJsTG5sbnFBbDZHbjJ4WHkrRTdH?=
 =?utf-8?B?eWFOUmdPMkhlZjBhQlh2VFBRd1BzMjNIN1U0RG1jVjZSNGoraFVvRWs5emY3?=
 =?utf-8?B?c3luUFRVSzhPdXJicTBSZWtVM0xNY0VVZ1hRd2hZSkFrUElpUDhSOWh2TVdO?=
 =?utf-8?B?RW1Lb0UvRkY1bmVDWXRvcnpobEs5NnViNGJvMlJxaFVwcDFtVjN6VlREQnli?=
 =?utf-8?B?ckQ0cFliTWhkWnE3cWRPLzF2YkJqMkJOS3NJWnRENWJVQjBjNUFhVllJYldL?=
 =?utf-8?B?cWtkSkxTYVNmUUptVnNmejBDL1ZPWFJ0M096N0drWnB4T3YwdHBBTzVjY3BY?=
 =?utf-8?B?S1pBQW9GeFY1VXNjeGlQOVlVK2xNWjdMWnRrZGpnL25tUWVxY1o3cDNDNUZO?=
 =?utf-8?B?cWZUWjdDUGNWSGNSZklJWGpPUGN5YUxKNjYramk3dFpnQ05hRm1oY1RleG9S?=
 =?utf-8?B?SUMxbldGNDJYQytkQkJ4a2kzd2pWa09mdFJCR1RISzBWNlMxc1hoNkFqQlRP?=
 =?utf-8?B?c3h6WUtjbVJ1c29uV3BnbEt4OTZHS2dQb1ZBMW56OEZZbmttS2lkd29xbkhu?=
 =?utf-8?B?VGlOc3J4Zmc0SjhEUll5YW5CdndhZ0FlY1g5WEh4Wm40SG9HVnhqdVMxVlBG?=
 =?utf-8?B?M2xmLzdVR2xsL0RBWW1zb2tFR3BUb2Rnby96TEM3c2xKR0VKUWlSTFRtZTVt?=
 =?utf-8?B?ZVJtVHZDVGFENzV2bno0WVBTanlCWTFtNGhDcU5zdk1xWEFZbXlqTkVLaEpF?=
 =?utf-8?B?ckZMblFibkNDUHR1cHlPYzBFRHdETHd6djZGbHNpbElyeVJUM2xTZFRzT0Ri?=
 =?utf-8?B?OUVheXpaNkQvWlNrZEg1N0txOHpmaGdDOFQxV2pORHNkVVFIR1UwbmdiaHNB?=
 =?utf-8?B?UGR4WVlqaC81TU0yZndJajFod3RybHVmQ3RQU1FueGs4bUtWVG9FS1plOHRO?=
 =?utf-8?B?cVJFN0tyT1g1T3VYdkJQSXZyVkZja2xWQjlMZ0FRdE1nMFllK3A2WThmVHBi?=
 =?utf-8?B?Y01oT05PVld1M0xNTGQvQ1ozRWdlcmR6U2tzdDBmaGpKVlNyVjZUTjZLRzJM?=
 =?utf-8?B?eTBuVWZOWmExdkpmVjk4NHJ1NlBIa2hNU244UDZYRnFmNitQaGxtTGJJS1Az?=
 =?utf-8?B?TnkvOTA3ekFJQ2Fhc3pkNVJ1SUNKOTBYUS9FbUY0enNRV01mb1RIZTNoK2hW?=
 =?utf-8?B?YVVsRjFJcGw4Q0FpN1NXRHV6VVlDTnBkQlI2K2tKNDRXUTVycjBxMGxUV3kw?=
 =?utf-8?B?K2oxQXFzZDFWZjBkUFVqSmJiRmVLcFBLTks1ZWdvS1k5TkdMeHlhYXMrWFA0?=
 =?utf-8?B?dHNBcFgwa29PcEc1MGgyK2NLMUdocG5xRWpLU1p2MWJlQmZoZ0NUZnIyWXJZ?=
 =?utf-8?B?TElHYitreW5Nbmh5d3E1T2xxeWVGSXI4YnB1cENhNnVoWGFvdWdwbzNNc0E2?=
 =?utf-8?Q?z+d002Gk9h4j5BMLvsDDUzH0G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69C1EEBE259AF14F859FD15269F60622@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a23c28-dda5-4f81-6521-08dc420dbf39
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 20:56:38.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 208l731cfR8IcTSzrv54ueGweTHVqBl6/9AcBP05svpvWTer8ETG/B/GDlNgoajuVs4yYMmn+WKyf08QW1jsGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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

SGkgSm9oYW5uZXMgYW5kIE11a2VzaA0KDQpPbiBNb24sIDIwMjQtMDMtMDQgYXQgMTc6NTYgLTA2
MDAsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gT24gTW9uLCBNYXIgMDQsIDIwMjQgYXQgMDY6
Mzk6MDNBTSAtMDgwMCwgSm9zZSBTb3V6YSB3cm90ZToNCj4gPiBBZGQgZnVuY3Rpb24gdG8gc2V0
IGEgY3VzdG9tIGNvcmVkdW1wIHRpbWVvdXQuDQo+ID4gDQo+ID4gQ3VycmVudCA1LW1pbnV0ZSB0
aW1lb3V0IG1heSBiZSB0b28gc2hvcnQgZm9yIHVzZXJzIHRvIHNlYXJjaCBhbmQNCj4gPiB1bmRl
cnN0YW5kIHdoYXQgbmVlZHMgdG8gYmUgZG9uZSB0byBjYXB0dXJlIGNvcmVkdW1wIHRvIHJlcG9y
dCBidWdzLg0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gcmVwbGFjZSBkZXZfY29yZWR1bXBfdGltZW91
dF9zZXQoKSBieSBkZXZfY29yZWR1bXBtX3RpbWVvdXQoKSAoTXVrZXNoKQ0KPiA+IA0KPiA+IHYz
Og0KPiA+IC0gbWFrZSBkZXZfY29yZWR1bXBtKCkgc3RhdGljIGlubGluZSAoSm9oYW5uZXMpDQo+
IA0KPiANCj4gYnV0IGxldCdzIHdhaXQgdGhlIGRpc2N1c3Npb24gc2V0dGxlIG9uIHYyLg0KDQpM
dWNhcyBpcyBmaW5lIHdpdGggdGhpcyhzZWUgdjIgdGhyZWFkKS4NCkNhbiB5b3UgcGxlYXNlIHRh
a2UgYW5vdGhlciBsb29rIGF0IHRoaXMgc2VyaWVzPw0KDQp0aGFuayB5b3UNCg0KDQo+IA0KPiBM
dWNhcyBEZSBNYXJjaGkNCg0K
