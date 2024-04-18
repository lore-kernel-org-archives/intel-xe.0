Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C22C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 19:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7220113F4E;
	Thu, 18 Apr 2024 19:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAzCu4Tz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BE4113F4E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713468800; x=1745004800;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=e09ebDpiDeZghmkSFzRBxJqyjRx0BERtr1panHxdnUA=;
 b=cAzCu4TzSfn/GO+NWmy+xR241xUURjHXypBUQFTyJeZzvoOKRNg33Xb6
 //fH+5U2GZikedRc84z2WBn/iXB9VqIEvFRxWpuZhnqotpHgvCu8+dJqs
 XoUSrZa2QQtdbICfek7qR6yrMDtBZezfug2MkCs/y3umVuy5kL8QXrrVu
 Swff+j1afv3w+MktY5IEGHt+n8/BywfosrBfT8RXmDR4dsGBArD0JTvqa
 ch1HC3A5iiRQCY/O9emg2K/XDB9JH6ImtNz6z4ddwSx9WHCGkFp7g/9f+
 A8nkominwCeJcw8lxD8l317FEShiVUwy3FX325XwCDw8Kcos43HBMh6WY w==;
X-CSE-ConnectionGUID: ++G0U//QQPaBYxTEEPxBcg==
X-CSE-MsgGUID: rtnbdOK7SIKGFxA95IRi0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8968052"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8968052"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 12:33:19 -0700
X-CSE-ConnectionGUID: 7vKATVJpSiaCef6LndMl8w==
X-CSE-MsgGUID: P4hhjaBgT2+xmcwNW0wimw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="22955490"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 12:33:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:33:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 12:33:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 12:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUME/5yvNU+czxGxAwRTiK8gxaKl4Akba1E3Oozc+giXu4thRl3wgn4De0b+IfRWNi8rGEXIKA8p3aR2FzEd2+sLaraAth2JjdCZPJLQ5UyO23sRuYz3vwwQpgLxAXfsmqbZFS3Kp3X8LYqKSkKjsT14oV6kVDOPNGAnPkmEFnynKAO0AbKqFZJZYwK3ag3FrzC5cKRLIEUzY++CwzIhkz91WkR2K5btbnRfPi6NG1R1l5mU/JeFRESv+k18NMlLgRhv2LQ1ZjuA+U7tfvlhe63geqeUvpRZX51W2AFk3UtZVzRGCc5mrADnZhJppW483enbpUuj3XHniStnXOS1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e09ebDpiDeZghmkSFzRBxJqyjRx0BERtr1panHxdnUA=;
 b=B0iYAHLYMMy/Khbmilu69HiXa0MPA6Inw3ise3oNX4SHg0aK9i12i7JpEYeTkkhNtOOf5wIjeFnh9tfV+UAy7Ugb+oOjORFOx0yAhb6IVAGoxyzAK5Iyq9xfsbg0NiPyitW3oGACkdo3Q6HR2EF+IBCjy4pjMvbxS0ibBqfvYxSoQFDsoUzcXLUR10XNug4RmvWj0oi9qJ36Sldc0WGafId+PREvi3Ege0lyN67rBuM5ovfGw9gkOWlli+EnPUJZX2jtxSo3xwOCndngsUA5U9/v3nfZ3wSh1e6vJ+2/B+8iZx81RA4+nNG1G71e3GW4OE/IveWjErc+g6MSNIANkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Thu, 18 Apr
 2024 19:32:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 19:32:45 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/7] drm/xe/guc: Check sizing of guc_capture output
Thread-Topic: [PATCH v7 4/7] drm/xe/guc: Check sizing of guc_capture output
Thread-Index: AQHagIcRsy7SNeB8bkKeKzWZa08CArFujU2A
Date: Thu, 18 Apr 2024 19:32:45 +0000
Message-ID: <47397b15d81f3d4ec47b6388367dd9e29c1df232.camel@intel.com>
References: <20240327204041.178879-1-zhanjun.dong@intel.com>
 <20240327204041.178879-5-zhanjun.dong@intel.com>
In-Reply-To: <20240327204041.178879-5-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB8290:EE_
x-ms-office365-filtering-correlation-id: 87e99dac-8e42-47d2-7036-08dc5fde52d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: doNBVMg8XFZVRca/rr3vloVBrhEHh0yNSX5n7nnkNMjbIdnLlBOl8NlX1OfH3t2+HgQru7zOblT0a9MtGEOedEJSwdq0uZmIEeRJwRauWhlikysJEbvbxUYdIdwV01DXxegNWp2tkQfEHthz0+yN/f5hfNjUFJWX4R1+N/ClJl+VGxjdR7uJXanAKICXjjJDyO6xyQ3yi7zSYVZdlusewrMRC+sK5cFe7LEeLfuXZTWvky3PTY1wzNzDXo+ATt5TbioNCv6keSdJ28ZxvXsm8VyCLrvHiBpp3K2TADy2/xaG67PU83iyN984Lm2G/CADluC0BsQg8kINuWMAeVnNerhIoUdz3DedNhrmFQ1O71pU3lhQl7O0QUTindXUhMqYXspUL8qdMS84jICDA08xrZdIzPN84J8M7kHCAz6XsVWoRSsypO3nCXcAEQ16KzGXar3bn6GNo5fHG75laVBvoNugRmRwWUe6pDxRPUl/sHgIolNswz5x0wLPdNqyWQkfM49ksAgim8NgBmiYuUaWZhJeNKJaoHfxF52gYs4VzReweCIP/DUGRAdWev2TgjmLLiu/hAXo68EUaZE6HqsXVl51pGWEVbOd34w5d7DbH/Pnz3FCynd2pGx4pXVNQPIkHfbR6CnuZtYhOVHlWZSz3tLviYqMx2S4LuUvvVlOtQJBlrzRCwmUI8ao0XI/9tiEfviedGPIrGHyrHbEPZXRfsQ/u/5KUiQi572cfMB20lY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3hXWUVSbHg5aHAzRlFNcEp6SEJzUXh6M2NUSzZ2UjI3MXlGd3VlRGEwRXNU?=
 =?utf-8?B?YndlcmMyb2FPT1pXb2cvL1FyUkxkaFhvRmNpSGhZN0kyQjVSQUFscnVjUWk5?=
 =?utf-8?B?ajRWMmZLQjIyNEVLZGVUcGs5TnEweitJTmhTK29QdGNQbXEwV0Y0VzhnU0pM?=
 =?utf-8?B?NFVtY3dieHBzd1V1WHpROHpsYjBETytmVW5vY2ZkSmJPdnJLbFhvQkdOSmxT?=
 =?utf-8?B?cWl1MWZjVEhOaXZ0N3FQd0ZsWmFzSXhMdW9wZ2tHUncrdzNrNlBpenRucUNG?=
 =?utf-8?B?K1ZyN003aDUrWGRPY1lUNzIybUYyelRvaWpIN2dYeENlMndLb3VEN2hBQmpR?=
 =?utf-8?B?V2tPY09LK25aREYrVS9XbXkxNEU0a2U0KzFHekFPTi8yc0FMZEVDNWVZL2xP?=
 =?utf-8?B?L05VMkc0dXR3NDNDNlFVTXExMXV4ZWRPRzNjaDBlaVFFdzJ6cE8rcmJ6WTlD?=
 =?utf-8?B?U1ZSZ0xKckVmWHNkNnRYUmlTZTVVQjJZb21ZWVFWUzNaeGJPUE55aUNVYXR6?=
 =?utf-8?B?ZUJjQnc1ekt2dEdsdGVaSmxiWHRRYWxzc0JpeXJJSTFzUHlSc09qMHlCQXFx?=
 =?utf-8?B?U1RzZFFjdW5sSGQxc0t1Y2tsSUkxT3hoeVU4Q3U3STZiSitYSktlMlpHd2Ex?=
 =?utf-8?B?SEloZEVNN2RWWFVUMXNuTU5HYlJwZ2tlN09GbTIzTDFOVzN1bTBnVUdqRFpR?=
 =?utf-8?B?VFNOMWlLdm5kUFJwUFp6MmJITy9vNVlVRWxLR25SV2lBNGdlaHhqeDBicjRM?=
 =?utf-8?B?TW9sdzg0VUozTWNrRmhoVFhSdnV6QzdGVkozdHZiQmhlb2xxd1JLR1NVaW12?=
 =?utf-8?B?TnpPb0V6ckFEaHNSd09jZzByamlnRm0vL3JUNnBPdSt2VDhuZHFJQjB0L0Ux?=
 =?utf-8?B?UEcrekdCVDRnTEs4OVBZUGQ2QWNaY0IzMldpNlRpaWxhSUVNMitpTE1sVnEx?=
 =?utf-8?B?WlFwYmh2bTl2b1hHcHNZMW15L3pDazlwL2hNTWtsYzNRQzNRVVlBcThwMjFt?=
 =?utf-8?B?anN1SFpLc1dYeFhsUk5nZi9LWG5qTktyZ1l0NTQ5SWdnY3ZRdkdYUDFjZUF5?=
 =?utf-8?B?dDlISmFvUnlCYTEyQUR1MGdtT2NTNmFhUWtwWjJpTy8xQzlWejBEQXpUY3ZJ?=
 =?utf-8?B?bytibEdmdXVlbE1vSmRWRkZSVW5JNytjZlloN2JwYWxFWk5PQlgrNGRVWnlj?=
 =?utf-8?B?RTFPY2RObVAvRXd4cC93SkNTZjZmMzFTUDZkaGNXUGNOZVQzVHFQQTUyTFVy?=
 =?utf-8?B?Y2F6dnB3Vms5Y0cyMEptd0hIOVJNMkwwMXIvYlBINGpSbFNvMzQvamxERDJh?=
 =?utf-8?B?Z2E2MFZiRVU0R05ERjdHRzhHNjA3a0FWWndoeEg4S1NuUDdtUDZQbE1QOWQ2?=
 =?utf-8?B?L1Nia3RPeGdleTV4cmEyaTFMOFRYNkk1aGJ2eVdobThNQnBzSEh2ODJ6azd1?=
 =?utf-8?B?T2FuNXFnbjlYQXlQbjdZb2RhS0x5WXMvK1ZwMjJKMld2akRLbFZwNjllK05n?=
 =?utf-8?B?S0VQcW1GV2R6WHlTTmR4eHFKaXhZdGtwM1l6aGd0Q1FKNG1xeFNCWDZRbmlw?=
 =?utf-8?B?SHRMcUg5eXA2dXB3V3pZdVgza0lGVkF2MjI3L09udjRDUktRU0FIaTRTRXoz?=
 =?utf-8?B?VVV5VHNOTHo1N25hb1QwdHNxSHVFaEFOVW54V3h1QUJseFBpanVwTUVhaHJM?=
 =?utf-8?B?S3JxejRJMDJKYUdndzFUdUdVS254UzFjZk5VNVY2Yk9aMGlQWGlUc0lRcFhZ?=
 =?utf-8?B?bXBEU0dOSFRRejZuMDd5d2tkK0VQVm9rSEx5MkgxbVNEeU9abWpMUWU3T3JD?=
 =?utf-8?B?akwvcGdRWjRSRE0wMWZGREhrdnBoRW1CVVVrRzdKZnNpcVdqQTJROVVUcXkz?=
 =?utf-8?B?KzRjLytsMmRza3pRUXNwVHRoamZUdm5CZlFsSVUxcng4LzZEY0xyS09Gb0Qw?=
 =?utf-8?B?bzFzK3JiV2piZ2k5bEtuZ0Fsa1lOMExaaXY5NnJiSGgwT3R6dmZvdVIzUXdi?=
 =?utf-8?B?N0U2MHRhYklTU2l3ZDdCMkJPcEVCUDFNWm5ITHpBUStOL1A2bi9tcktGTHc1?=
 =?utf-8?B?NFNYcnNKVVl0REtoSjVSUjR6ZGRydWVLUWpTUit3U0F4ejl6T05xYXh3OHlz?=
 =?utf-8?B?bm5PTUxreWoxeEM3Z2J5dmVCcHRlem9JSlFqRGVPREtxV0tQS3RCQnU3bFFz?=
 =?utf-8?Q?4OdgfKYKab+3W+qP4tSnSCQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <878055C4A4375247B206CB5FDFA95096@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e99dac-8e42-47d2-7036-08dc5fde52d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 19:32:45.6847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVWvbv9r2gK5j1y57If0e4qwdZFpV3LYGNzaZ0uDconNmPHBN/uDCFDIOvof4V8phPokTshs0Ic47GdGafkLZfteX+0CMxikbPdbtRdKWw1fp0kHzjHCuItDquZSEf4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDEzOjQwIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEFkZCBjYXB0dXJlIG91dHB1dCBzaXplIGNoZWNrIGZ1bmN0aW9uIHRvIHByb3ZpZGUgYSByZWFz
b25hYmxlDQo+IG1pbmltdW0gc2l6ZSBmb3IgZXJyb3IgY2FwdHVyZSByZWdpb24gYmVmb3JlIGFs
bG9jYXRpbmcgdGhlIHNoYXJlZA0KPiBidWZmZXIuDQo+IA0KYWxhbjpzbmlwDQoNCj4gK3N0YXRp
YyBpbnQNCj4gK2d1Y19jYXB0dXJlX291dHB1dF9taW5fc2l6ZV9lc3Qoc3RydWN0IHhlX2d1YyAq
Z3VjKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0
KGd1Yyk7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZTsNCj4gK8Kg
wqDCoMKgwqDCoMKgZW51bSB4ZV9od19lbmdpbmVfaWQgaWQ7DQphbGFuOnNuaXANCg0KPiArwqDC
oMKgwqDCoMKgwqBmb3JfZWFjaF9od19lbmdpbmUoaHdlLCBndCwgaWQpIHsNCmFsYW46IHBsZWFz
ZSB2ZXJpZnkgdGhhdCBmb3IgeGUta21kIHRoaXMgY29kZSBhY3R1YWxseSBwcm9kdWNlcyB0aGUg
ZnVsbCBsaXN0IG9mDQplbmdpbmVzIGFuZCBub3QgYW4gZW1wdHkgbWFzayAoaSB0aGluayBpOTE1
IHdvcmtlZCBkaWZmZXJlbnRseSwgd2UgaGFkIGFuDQppbml0aWFsIGZ1bGwgbWFzaykuDQphbGFu
OnNuaXANCg0KPiArLyoNCj4gKyAqIEFkZCBvbiBhIDN4IG11bHRpcGxpZXIgdG8gYWxsb3cgZm9y
IG11bHRpcGxlIGJhY2stdG8tYmFjayBjYXB0dXJlcyBvY2N1cnJpbmcNCj4gKyAqIGJlZm9yZSB0
aGUgaTkxNSBjYW4gcmVhZCB0aGUgZGF0YSBvdXQgYW5kIHByb2Nlc3MgaXQNCmFsYW46ICVzL2k5
MTUveGUvZw0KYWxhbjpzbmlwDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfY2FwdHVyZV9md2lmLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVf
ZndpZi5oDQo+IGluZGV4IDRiYjk0YWMxZmY0OC4uYjk3NWE2NWI2NGU3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVfZndpZi5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZV9md2lmLmgNCj4gQEAgLTEwLDYgKzEwLDUxIEBA
DQo+IMKgI2luY2x1ZGUgInJlZ3MveGVfcmVnX2RlZnMuaCINCj4gwqAjaW5jbHVkZSAieGVfZ3Vj
X2Z3aWYuaCINCmFsYW46IGFsbCBvZiB0aGUgY2hhbmdlcyBpbiB0aGlzIGZpbGUgc2hvdWxkIGJl
IG1vdmVkIHRvIHBhdGNoICM1Lg0KwqANCj4gKy8qDQo+ICsgKiBzdHJ1Y3QgX19ndWNfY2FwdHVy
ZV9idWZzdGF0ZQ0KPiArICoNCj4gKyAqIEJvb2sta2VlcGluZyBzdHJ1Y3R1cmUgdXNlZCB0byB0
cmFjayByZWFkIGFuZCB3cml0ZSBwb2ludGVycw0KPiArICogYXMgd2UgZXh0cmFjdCBlcnJvciBj
YXB0dXJlIGRhdGEgZnJvbSB0aGUgR3VDLWxvZy1idWZmZXIncw0KPiArICogZXJyb3ItY2FwdHVy
ZSByZWdpb24gYXMgYSBzdHJlYW0gb2YgZHdvcmRzLg0KPiArICovDQo+ICtzdHJ1Y3QgX19ndWNf
Y2FwdHVyZV9idWZzdGF0ZSB7DQo+IA0KYWxhbjpzbmlwDQoNCj4gKy8qDQo+ICsgKiBzdHJ1Y3Qg
X19ndWNfY2FwdHVyZV9wYXJzZWRfb3V0cHV0IC0gZXh0cmFjdGVkIGVycm9yIGNhcHR1cmUgbm9k
ZQ0KPiArICoNCj4gKyAqIEEgc2luZ2xlIHVuaXQgb2YgZXh0cmFjdGVkIGVycm9yLWNhcHR1cmUg
b3V0cHV0IGRhdGEgZ3JvdXBlZCB0b2dldGhlcg0KPiArICogYXQgYW4gZW5naW5lLWluc3RhbmNl
IGxldmVsLiBXZSBrZWVwIHRoZXNlIG5vZGVzIGluIGEgbGlua2VkIGxpc3QuDQo+ICsgKiBTZWUg
Y2FjaGVsaXN0IGFuZCBvdXRsaXN0IGJlbG93Lg0KPiArICovDQo+ICtzdHJ1Y3QgX19ndWNfY2Fw
dHVyZV9wYXJzZWRfb3V0cHV0IHsNCmFsYW46c25pcA0KDQo=
