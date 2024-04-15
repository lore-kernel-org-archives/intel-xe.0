Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D072C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 18:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525DA10E6D4;
	Mon, 15 Apr 2024 18:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1LUgJdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD90F10EC41
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713205214; x=1744741214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PoejkGtla7rNIRcspLHMJSGSLDEw8Wtri8GFV/hvZek=;
 b=e1LUgJdFiDIZ9N13Q5wcqRqqm6IYz7bu1yroml0nPSARJrFKqfDOLNWl
 uplT9w0JAsKXjeXzzdmP8zfSz2hWinQvti/zV4IpN7gkHJ56BcLLBt220
 Jscxq+jhrp/QNWUStna7Wgb7xn/Fui1q/vRn8ngffy/286xXgln07tBxV
 grgdDEc4Os9V8JfjJVq9A91ETB4nRGRpPyvfXr+hf675n7it9fWy/Ma/9
 3Nuy+VPpIXgNYnYmkSuu2WwzMQ8k0Q0uPlp+pEBoED19G6JINLFaVf12R
 Uv8XjMQRR52Co+VFRdlAryP9k0bpETjQERDtcWn56bn6WJ3UzFMPXTLni w==;
X-CSE-ConnectionGUID: MHMKrghWQbezKiuexpdf5Q==
X-CSE-MsgGUID: 1N/o7pnuTvqzQNPJYsQaUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8472439"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8472439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 11:20:13 -0700
X-CSE-ConnectionGUID: lu/t5p/LT6iWq/dN309o/w==
X-CSE-MsgGUID: d8PEq2hKTimA3sCeV2Fdgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22417719"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 11:20:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 11:20:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 11:20:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 11:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neZpdLk7Lf2ol430n59R6N7o2Sw81DqZdSZ1tKaVwzTkqoeRmVls0cpURGLjmlPV3FhwniGJ/D51g1xu86YIjIds0iAPGidQjYCSH5jFnBACJ99Bfdpga5eF5dEKrin48jDDDdSOq7k40JYOI6rMBjPELvbyliLmZuUPye4IQGQ+u206jJxQyEeTajk3S6MZSOpRj7LJgATTcP8pCOlE3/R/WPc479MZbXyYqLpWsnBe5CsA4VH/BBN0m3Zsn+M7wqTY2m7V+DuTu51es/vfPfsesf50aLN5gKNQJomU0uM0K/E/OxTPxcr+DXQtsEymoHNOmpNh9ztVE5ei2sYN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoejkGtla7rNIRcspLHMJSGSLDEw8Wtri8GFV/hvZek=;
 b=A2aumyMUj5txlwAYawK/aK5up8K3YTR9+JBFErLNSEL01OeoJ3FXCdC3Kg7i/wEGwpbAyLXPEan/oC7bu80+PkUGHRubbp01mDQj48m7ROfcI6WkbfiNM+SJiXCoBoof8fE+RAwK4UlXFB0JifM+YP7Ppy/TCXDPRa/YJouC6fnZvU4UnN+W+cJkiafpRxcfJzQMW3NXnchC/hJgWZ0V3n1Pe/SLovMDbYZVGK6tIb+C7yARgy0aJnvFN7ZGDOtIzmgZbq1ozE731chhFQhXrSYGwaTfWuf2+OqgBSgUgNDfBtdlwpGc12fzxIaPRTrzfYJ4rqsv+vk7RZRAs7kU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.49; Mon, 15 Apr 2024 18:20:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 18:20:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Topic: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Index: AQHah4SWdD3tYr+Qm0eJPANiOK1YpbFlJpQAgAACsICAAC62AIAEXBQA
Date: Mon, 15 Apr 2024 18:20:09 +0000
Message-ID: <6d5adf8e5cc3954303e5e026324add0ec7afb117.camel@intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
 <20240405175505.1161756-2-jonathan.cavitt@intel.com>
 <682a2bc1206df21d50611442ff2bced0aef71e27.camel@intel.com>
 <BL1PR11MB544510DC6F6F4F2644E2DA0DE5042@BL1PR11MB5445.namprd11.prod.outlook.com>
 <ZhnHnMO8gsppdwg4@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhnHnMO8gsppdwg4@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7947:EE_
x-ms-office365-filtering-correlation-id: 60044401-6bbc-42e5-305c-08dc5d78af0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q7xkE7JEAgZpPA6VzrFnlQgcGzt92rp9SiCw3soeBXvEXkYqdYh6OOv1c2brORX8qNlxItTP1JDwFVPFm3dx+Jz2lcf9JbnvX0EVQTXeo1zc89Agfm9rG24jki4QEhZCUj9+6NspHoUoceuZyiEi8eTQASH4xHaHbgzHQw8DBEevVD5lT3119+kdn0g9QYfoTDEyYww8FXY4NgMxrsBs+MDpd/20UWuSSmXWuhtSQUPQAoxuCWQIHGfsCT3kxQkXefuEAE0FGN3xTMRSYjMCdejdORFz59SLg6g1WDYGxgjF65vSGfABOecP/g4gG/uPeDPewx1VLDcHkmkhY4lREsFlKs1oMDG6oOLx/skPCZQvHLRUGrGKEaojBcmfyDr1B4DNOXaWZsBXnnWphWmWtBhxd5Qp/wSkk1rHr4YvxNs+scoqViSaxT3iisrrDOKpbU0xdJGF9Tr0rDOEJQpEsRaxMFHQZmsQtNatycofZQCUXwy6qp44/T7XbLxgS1roiascVSqv9TagkxGdLDOAmXCxpLBvG8ijqhdBwROuVou/HkRJbJ1f/pZHbHf+7YlOfccVh1USSNv1H1+rkAqEtF+gygTRPlsrVLn3p0uEOmuUtRkq9afhuu8DMgzUqV8CjbmmaV/ZoSetsMunuQojtWCvX8BwSDiaMZNFylBfNqRhFw1oS4ItgquR1uMsDfWHQ3dIfN21Ge6lsDBy+N0a8sOV0u/8vf9Xr1k2+0pMVhw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUp1QXhIS3BVeGthMDI5ekphdEVTZTc4QkZlZGRsNCtQTkk1czJ4THBXVWl6?=
 =?utf-8?B?bzJDQzI4cEdzeTN2amxJTW5Ra1o2dWNVbzJzOGxCZXRoSWthZkg3S0xUK1Q2?=
 =?utf-8?B?UVhIazlRYUw1MmUvQzEyMS9kemQxNk5vQmJRRjBqbForbTJmVXdDUkNmeVI2?=
 =?utf-8?B?UUlaRzgvVnc5ajFZYkhEV2txZ1lsL093bHhuVUVBdFUybUNXa0kwUGd0a1Mx?=
 =?utf-8?B?Um1wWHUwUFlxV3NqRTZGTXhQVzFtTlhabEtmWDFnYndFc1h3UnlQWUUxdW5H?=
 =?utf-8?B?QmZ6a1l4cVpOR3VpU0p6YmNxQ3J4Tk9lUGJLWEx6OWtzc3grWXp6UkFCbGZR?=
 =?utf-8?B?ZGJnd2FFUmd6V2JRMVZwNHI5Visrc0FZSGdQbFNyWkFYQVFySWhMV0dURlYy?=
 =?utf-8?B?UVJhRHVuK3R3OU1mdndsK29WMXo2R2FqUFo4Z3ZQeG0xMHNlb0VOQVZiNHdj?=
 =?utf-8?B?SE42NG5ySXJDVU54dHpvUEVzbmZTYUxSUUJ6N085OGZHei90M2lSZ2d3d0Fn?=
 =?utf-8?B?aktpcTdKblU3eVZReVZrZU5iRXVUT0NCRUhkaXpKSm5DV3B6RnlZbFNWQkVZ?=
 =?utf-8?B?SUZqcHFxSnE4aTYzbldTRGJKUEpDOE9nNEhMcjVQaG9CY2VGcTZUU1FpN3ps?=
 =?utf-8?B?QXJLRmpzNlQrYVoyY3UrRCtRTDlaWWY2ZUVsMWpaRjRORitsTkoybGU3N1NG?=
 =?utf-8?B?OUxCUUl5bXBZM2hBd0o1TmtGb0c5TGhnOG8ybnpNclhHNlZ1NWtwZjUyMWpj?=
 =?utf-8?B?Rm95NTd2OFh6MjI4bGVCYkdYcFJtMDFFck9iNzBDY3lmZGVpcXZwWEFHUytP?=
 =?utf-8?B?SmFwd3ZtVnFkMStXRXRTMjVtTm9IR0pwbndUUUJyTzl0czlCQlRkeWc5UGJq?=
 =?utf-8?B?MmZZdExveWtJTWc5R3B1NUYxY28vZjV4SDVleC9aOUZxdVBDK0xjSTFqcnE1?=
 =?utf-8?B?UllDZGtZalZ5ODlvc2JONUtqOGFJejFWdHdqR1NNTFBqMlFjbXVkNUU5S2RO?=
 =?utf-8?B?dndibmY4VWM0STZKb1dUSTNQUzRRRjRpWDFJVXk5UUJaQjlqNmVHS1prVFNE?=
 =?utf-8?B?VG16dm4yNGZST3U4a2dkYXZjSUJjTFRNcmN1RTRYVklCVzh0Y3FqQ3VZd1dw?=
 =?utf-8?B?eTNCOWdsRFNsTlJnSElBWERUSWNadkpWQjNjK2V5c0hsVVlvcWJvcTFlMXBr?=
 =?utf-8?B?emVlUlBFZTgrbTVnaEgzaFFNRzFTVjJkVThrV3lQNzhMY3BObXczZ2hYc3FV?=
 =?utf-8?B?cmV3V2habUJJR0JCdU1OVEJQV1R4Q2lVQmlPM0kxc3JWT2N3eGU0M1gwd0dJ?=
 =?utf-8?B?bkwwY2drcTd0UmwrbmxsbW1ObEFDM25BcnlhSUtDa1hlUnhlOW9wOGhJT0NK?=
 =?utf-8?B?bGprT0FWVFgrcHZLMEV6Z0xmRTNudWlnU0VzMDQ2MWc1aHQrTEhaSjhDUU1C?=
 =?utf-8?B?ZkErZEk1TllLb2FRM3RsWWc0eUFUeFR3bGR5blY5eEFNWHFpSGdnclNGa2Ro?=
 =?utf-8?B?TWU3bjB4bW8wckdnV1UxRjlFbmMwVnpFUGQ0TE56OVZHcDdKOVhvb29iVHdS?=
 =?utf-8?B?YjdzamRCK0JQM3BYQ1hmOUh5UkxKMzlJK2RlZFYvSTkzMGtPMmI3STFSUUYr?=
 =?utf-8?B?TjlKdzdiT1NrVGVmdVZ0V2h1SE5CU2V3amtEY1lReng1T0gwbXJPRkdJangy?=
 =?utf-8?B?em8zdUJPaUJ4SGVYRVkwWERGQmZ4NktiNDBaYzlwR1p1c1owY3Izam1UenA5?=
 =?utf-8?B?eUtqUHlQMjgzMG5sb24vTllBOTl0R3N1Q280U3JDQ0l1TTB4bTBHNWEzZzJ6?=
 =?utf-8?B?c1BSb2FzUnNidEJHZktaTWhsbGhwTFJ3L2xRK3Q2enhnU3R2cnpsVlpoOFhn?=
 =?utf-8?B?NU9FbWJIbGtHZFRGdHlyY0xmVXhQWURpbitjZUtFYllXWDdmUk9aVU9IOU4r?=
 =?utf-8?B?T1ZRSHVxY0pINThOWXl6SGh1aUx6aE5WZTRMT2JKMlZFZWR6eXl6bFBHdHZF?=
 =?utf-8?B?N0FVbGdjUXd1aU9OMDVNWXU4QlB3OW5PWlVlSyszZzQvQzhZREJCVHZWbE8z?=
 =?utf-8?B?Y0lTV0s2R3NHaTgwVU4yNERGZHk0SUl3L1FkeFFtM0d2MURTcXNEbTVGcSt4?=
 =?utf-8?B?Zy8rbmpxTEorWnJTVENwMWhGRW5MWC8yOW1SaVlTYUhLTmhqME9pWmxDdmQ4?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C16C1DAB5DDDA47A9706A8063452E99@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60044401-6bbc-42e5-305c-08dc5d78af0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 18:20:09.3838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIg4brtTA32r/VR576orb45BW9Te5V4vify4igXIqCtlfzWlIfuJnlQ/fppKGSFZwS18pE+XjJc32Gr+Rfx/ykBs4saEnE0/D3VdiejCeGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
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

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDIzOjQ1ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCAwMjo1ODoyMVBNIC0wNjAwLCBDYXZpdHQsIEpvbmF0
aGFuIHdyb3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogU3Vt
bWVycywgU3R1YXJ0IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+IA0KPiA+IFNlbnQ6IEZyaWRh
eSwgQXByaWwgMTIsIDIwMjQgMTo0OSBQTQ0KPiA+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IENhdml0dCwgSm9uYXRoYW4NCj4gPiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT4NCj4gPiBDYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgSGFy
cmlzb24sIEpvaG4gQw0KPiA+IDxqb2huLmMuaGFycmlzb25AaW50ZWwuY29tPjsgR3VwdGEsIHNh
dXJhYmhnDQo+ID4gPHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47IERlIE1hcmNoaSwgTHVjYXMN
Cj4gPiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMi8zXSBkcm0veGUveGVfZ3VjX3N1Ym1pdDogQWxsb3cgbHIgZXhlYw0KPiA+IHF1ZXVlcyB0
byBiZSBiYW5uZWQNCj4gPiA+IA0KPiA+ID4gT24gRnJpLCAyMDI0LTA0LTA1IGF0IDEwOjU1IC0w
NzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4gPiA+IExSIHF1ZXVlcyBjdXJyZW50bHkg
ZG9uJ3QgZ2V0IGJhbm5lZCBkdXJpbmcgYSBHVC9HdUMgcmVzZXQNCj4gPiA+ID4gYmVjYXVzZQ0K
PiA+ID4gPiB0aGV5DQo+ID4gPiA+IGxhY2sgYSBqb2IuwqAgVGhvdWdoIHRoZXkgZG9uJ3QgaGF2
ZSBhIGpvYiB0byBkZXRlY3QgdGhlIHJlc2V0DQo+ID4gPiA+IHN0YXR1cw0KPiA+ID4gPiBvZiwN
Cj4gPiA+ID4gaXQncyBzdGlsbCBwb3NzaWJsZSB0byB0ZWxsIHdoZW4gdGhleSBzaG91bGQgYmUg
YmFubmVkIGJ5DQo+ID4gPiA+IGxvb2tpbmcgYXQNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IExSQzog
aWYgdGhlIExSQyBoZWFkIGFuZCB0YWlsIGRvbid0IG1hdGNoLCB0aGVuIHRoZSBleGVjIHF1ZXVl
DQo+ID4gPiA+IHNob3VsZA0KPiA+ID4gPiBiZQ0KPiA+ID4gPiBiYW5uZWQgYW5kIGNsZWFuZWQg
dXAuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGFsc28gcmVxdWlyZXMgc3dhcHBpbmcgdGhlIHVz
YWdlIG9mIHhlX3NjaGVkX3Rkcl9xdWV1ZV9pbW0NCj4gPiA+ID4gd2l0aA0KPiA+ID4gPiB4ZV9n
dWNfZXhlY19xdWV1ZV90cmlnZ2VyX2NsZWFudXAsIGFzIHRoZSBmb3JtZXIgaXMgc3BlY2lmaWMg
dG8NCj4gPiA+ID4gbm9uLQ0KPiA+ID4gPiBscg0KPiA+ID4gPiBleGVjIHF1ZXVlcy4NCj4gPiA+
ID4gDQo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBp
bnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRo
YW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3Qg
PG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gDQo+ID4gPiA+
IHYyOg0KPiA+ID4gPiAtIEZpeCBTdWJqZWN0IGxpbmUNCj4gPiA+ID4gLSBNb2RpZnkgY2hhbmdl
IHNsaWdodGx5IHRvIHJlbW92ZSBuZWVkIGZvciAiYmFuIiBib29sZWFuDQo+ID4gPiA+IA0KPiA+
ID4gPiB2MzogUmV2ZXJ0IGNoYW5nZSBpbnZvbHZpbmcgImJhbiIgYm9vbGVhbiB0byB2ZXJzaW9u
IDENCj4gPiA+ID4gDQo+ID4gPiA+IHY0OiBBZGQgbWlzc2luZyBzZW1pY29sb24gYW5kIHJlbW92
ZSB3aGl0ZXNwYWNlDQo+ID4gPiA+IA0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMgfCAxMiArKysrKysrKysrLS0NCj4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiBpbmRleCAxYTZhYmIxMGE5
NjBlLi5lNzJmMmE2Y2FkNjBhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfc3VibWl0LmMNCj4gPiA+ID4gQEAgLTE0MjQsMTUgKzE0MjQsMjMgQEAgc3RhdGljIHZvaWQg
Z3VjX2V4ZWNfcXVldWVfc3RvcChzdHJ1Y3QNCj4gPiA+ID4geGVfZ3VjDQo+ID4gPiA+ICpndWMs
IHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIShxLT5mbGFncyAmIChFWEVDX1FVRVVFX0ZMQUdf
S0VSTkVMIHwNCj4gPiA+ID4gRVhFQ19RVUVVRV9GTEFHX1ZNKSkpIHsNCj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc2NoZWRfam9iICpqb2IgPQ0KPiA+
ID4gPiB4ZV9zY2hlZF9maXJzdF9wZW5kaW5nX2pvYihzY2hlZCk7DQo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBib29sIGJhbiA9IGZhbHNlOw0KPiA+ID4gPiDCoA0KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChqb2IpIHsNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCh4ZV9z
Y2hlZF9qb2Jfc3RhcnRlZChqb2IpICYmDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAheGVfc2NoZWRfam9iX2NvbXBsZXRlZChq
b2IpKSB8fA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfaW52YWxpZGF0ZV9qb2Ioam9iLCAyKSkgew0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgdHJhY2VfeGVfc2NoZWRfam9iX2Jhbihqb2IpOw0KPiA+ID4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXRf
ZXhlY19xdWV1ZV9iYW5uZWQocSk7DQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NjaGVkX3Rkcl9xdWV1ZV9p
bW0oJnEtPmd1Yy0NCj4gPiA+ID4gPiBzY2hlZCk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJhbiA9IHRydWU7
DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oH0NCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAoeGVf
ZXhlY19xdWV1ZV9pc19scihxKSAmJg0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHhlX2xyY19yaW5nX2hlYWQocS0+bHJjKSAhPSBx
LT5scmMtDQo+ID4gPiA+ID4gcmluZy50YWlsKSkgew0KPiA+ID4gDQo+ID4gPiBXaHkgZG8geW91
IHJlYWQgdGhlIGhlYWQgb3V0IG9mIHRoZSBscmMgYnV0IHRoZSB0YWlsIGZyb20gb3VyDQo+ID4g
PiBpbnRlcm5hbA0KPiA+ID4gdmFyaWFibGU/IElzbid0IHRoZXJlIGEgc21hbGwgY2hhbmNlIGhl
cmUgdGhhdCB5b3UgY291bGQgZ2V0DQo+ID4gPiBzb21ldGhpbmcNCj4gPiA+IHJlYWR5IHRvIHNl
bmQgYnV0IG5vdCBxdWl0ZSBzdWJtaXR0ZWQgdG8gR3VDIGFuZCBpbiB3aGljaCBjYXNlDQo+ID4g
PiB0aGVzZQ0KPiA+ID4gd291bGQgbm90IGJlIGVxdWFsIGJ1dCBub3QgbmVjZXNzYXJpbHkgbmVl
ZCB0aGUgYmFuPyBJIGd1ZXNzIHRoZQ0KPiA+ID4gZmxpcA0KPiA+ID4gc2lkZSBpcyBtYXliZSB0
aGF0IGRvZXNuJ3QgYWN0dWFsbHkgaGF2ZSBhbnkgcmVhbCBmdW5jdGlvbmFsDQo+ID4gPiBpbXBh
Y3QuLi4NCj4gPiANCj4gDQo+IExSIGpvYnMgZG9uJ3QgaGF2ZSBpbiBkZXBzLCBpLmUuIHRoZXkg
cnVuIGltbWVkaWF0ZWx5LiBJIGd1ZXNzIHRoZXJlDQo+IGlzDQo+IHZlcnkgc21hbGwgd2luZG93
IGJldHdlZW4gZXhlYyBJT0NUTCBtb3ZpbmcgdGhlIHRhaWwgYW5kIGFjdHVhbGx5DQo+IGhpdHRp
bmcgdGhlIGhhcmR3YXJlLiANCj4gDQo+ID4gDQo+ID4gSUlSQyBpdCdzIGJlY2F1c2Ugbm8gZXF1
aXZhbGVudCB4ZV9scmNfcmluZ19oZWFkIGZ1bmN0aW9uIGV4aXN0cyB0bw0KPiA+IHJlYWQgdGhl
IGxyYyByaW5nIHRhaWwuwqAgSXQncyBsaWtlbHkgdGhhdCBJIGp1c3QgbWlzc2VkIHRoZQ0KPiA+
IGZ1bmN0aW9uIHRvIHJlYWQNCj4gPiB0aGUgdGFpbCwgc28gaWYgeW91IGtub3cgd2hhdCB0aGUg
ZnVuY3Rpb24gaXMsIEknbGwgcmVwbGFjZSB0aGUNCj4gPiBpbnRlcm5hbA0KPiA+IGNhbGwgd2l0
aCB0aGUgcHJvcGVyIGZ1bmN0aW9uYWwgY2FsbCBmb3IgdGhlIG5leHQgcmV2aXNpb24uDQo+ID4g
DQo+ID4gQWx0ZXJuYXRpdmVseSwgc2hvdWxkIEkgdXNlIHRoZSBpbnRlcm5hbCB2YXJpYWJsZSBm
b3IgYm90aCBoYWx2ZXMNCj4gPiBvZg0KPiA+IHRoZSBjb21wYXJpc29uPw0KPiANCj4gTm8sIGlm
IGFueXRoaW5nIGNoZWNrIGJvdGggdmFsdWVzIGluIG1lbW9yeS4NCj4gDQo+IFRoYXQgYmVpbmcg
c2FpZCwgSSB0aGluayB0aGlzIGlzIGZpbmUgYXMgaXMgZHVlIHRoZSBuYXR1cmUgb2YgTFJDDQo+
IGpvYnMgYnV0IEkgZ3Vlc3MgaXQgd291bGQgbm90IGh1cnQgdG8gcmVhZCB0YWlsIGZyb20gbWVt
b3J5Lg0KPiANCj4gSWYgU3R1YXJ0IGluc2lzdHMsIHdlIGNoYW5nZSB0aGlzLg0KDQpTbyBob25l
c3RseSwgSSBkb24ndCB0aGluayBpdCdzIGdvaW5nIHRvIG1hdHRlciBtdWNoIGZ1bmN0aW9uYWxs
eSBsaWtlDQpJIGhhZCBtZW50aW9uZWQuIFRoYXQgc2FpZCwgZnJvbSBhIGNvZGUgaW5zcGVjdGlv
biBzdGFuZHBvaW50IGl0IGRvZXMNCmxvb2sgYSBsaXR0bGUgd2VpcmQuIElNTyB3ZSBzaG91bGQg
ZWl0aGVyIHJlYWQgYm90aCBvdXQgb2YgbWVtb3J5IG9yDQphZGQgYSBxdWljayBjb21tZW50IGxp
a2Ugd2hhdCBNYXR0IHNhaWQgLSB0aGF0IHRoZSB0aW1lIG9mIHJlYWRpbmcgb3V0DQpvZiB0aGUg
TFJDIGFuZCB0aGUgZHJpdmVycyBtZW1vcnkgaXMgc21hbGwgZW5vdWdoIHRoYXQgZm9yIHRoZSBM
Ug0Kd29ya2xvYWQgaGVyZSB3ZSB3aWxsIG5ldmVyIHJlYWxseSBmdW5jdGlvbmFsbHkgc2VlIGFu
eSBkaWZmZXJlbmNlLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiAt
Sm9uYXRoYW4gQ2F2aXR0DQo+ID4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+
IFN0dWFydA0KPiA+ID4gDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYmFuID0gdHJ1ZTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGJhbikgew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNldF9leGVjX3F1ZXVlX2Jhbm5lZChxKTsNCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfZXhlY19xdWV1
ZV90cmlnZ2VyX2NsZWFudXAocSk7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiDCoH0NCj4gPiA+IA0K
PiA+ID4gDQoNCg==
