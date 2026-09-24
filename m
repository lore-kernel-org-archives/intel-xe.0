Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EDBC98311
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 09:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A310F404;
	Thu, 24 Sep 2026 09:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nghDZfKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D2210F3E6;
 Thu, 24 Sep 2026 09:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790243158; x=1821779158;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dgaFMbXDHy1eY6E7hF83EsbBLl3kRnzAmXUv8iQLojs=;
 b=nghDZfKzWPiVGCFNjfgFIXiJ+SG8+SG10PbUJ7o/ts6LLna8zhBkHP7r
 rjVVG/0FprOslPcdzhscnbUQoFkrqUtFCgk0omH2ekotCVBLI675iUzPK
 AVoWEhTgK7LZdmyiEaVvnY5VE8hY6/l3xcmalOa8nJcJBfaKEM5X0gEpF
 i9tfblno2cZ2Q0ErBM+0iJCKbd9UjqA36yjM3uc5yeqA7ze5G7ZuoQy8A
 N2ge7RxnUDwaX88viKnF1Be86iJo0qgemjaMtuQrmqBSh4NvVpqTwWNll
 mv4ZuKY0lnkEatGfn88cpra851rpoXltjRHZjt9IYCLpEV+eD8SINQWEL w==;
X-CSE-ConnectionGUID: LNgxmJVkQ/aVF/u3kVYFLw==
X-CSE-MsgGUID: Xj3Ql31HSfqW7UvlBlRfOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90048181"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90048181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 02:45:58 -0700
X-CSE-ConnectionGUID: PW7ktlWPQKO5AMUV1cIO1w==
X-CSE-MsgGUID: 5tHKf/wISHuklagVHuZWOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311879608"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 02:45:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 02:45:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 02:45:57 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 02:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK1jh3pY+jULZA3XVNMSSm/3wmcb628tvOornW5wXCsRzHef3DEymlnioM4Q6pOTUVBFLs48RmXGNXyjd5dgjZRNQEM273WXwVBngFWDTqdmL7Rb74ABz33wFGCCE0WFMGh5yxXf/LlOrw8VlNh7iz/QppdGTK9D+vWv7j7qW4smmjfSDBzUQLSKHhMdSb7dRbxxqCqvgDjnxV1GOI72evHmnEvOzVLFfhMjG385qx8QZl1n/FOg3KH67YnRUfZnQoKfhkWHQzkxdX40P+GzNYyp/BucV5YFEceNSe9AKCi4MA+W0/bF6zNdwpqIpFsxF42D0np+f2L21vR7Zyj8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgaFMbXDHy1eY6E7hF83EsbBLl3kRnzAmXUv8iQLojs=;
 b=JiJm7W99ygth1Vb3ZTdXrZyXUrgtsUFlypP7RB347hRm9isgLDLYR+NDRTaaEgW4Lo99rrcAAQFsBETjsECTty5uTa3pIi0uinEcx3gIUtDjYag3fRRp6vacGCStGNt9Gvx+IsVsDOZzJHP+ZPOZpkByGqH1m3hGhxPHF2joOJRvFhqpsFmyBqhs+88ieI0CKiNe/oooBzj838mGKt/8a9c54hN54Ky0ipyipi7nk3zPt8slYzwOsofFSZ3/SyMVfuJHh9CllEzEP0od+ZoW3XAFuuoDlUJ/EZ7fbFNy1FLmmCvdKGHXJYqmgu5S3MzI1AjjuFH5reiyMikYqba+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Thu, 24 Sep 2026 09:45:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:45:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: Take the selective fetch area from pipe_src
Thread-Topic: [PATCH] drm/i915/psr: Take the selective fetch area from pipe_src
Thread-Index: AQHdS1MRIUjBdTy3GkC5ProZd3siUrbdfFSA
Date: Thu, 24 Sep 2026 09:45:55 +0000
Message-ID: <3004b9170f6165076cf9b2b024d6ad32853db56d.camel@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-3-mika.kahola@intel.com>
In-Reply-To: <20260923115941.746934-3-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS0PR11MB7288:EE_
x-ms-office365-filtering-correlation-id: 38bc15a3-2f0f-4887-dbf5-08df1a20a10b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|38070700021|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: tCzHJ//ApF0NeX1pnRTUiBz20Es/fgM/q/JShm0Vl38pQio8VmYsL/yx2SBsUQ6zkkTP35EroJL/D91AZDgWOYXIw3PRELcf7LpiS0Bz4RPlXGpX3dDfaQVyl0X0bhywqqtHpI3G1nleJbIzmsPfKvQYZNN7ilR+6suGoUSjhCHWIOdGrksiuxStF6w69KBrlMcKXgqZUW3/7MzpBfCoTsVVCjfmeMp+n976YcfDCcAtI5UYilUXxf1YDgc7C0hJnrpaRBsN/pGgCOU2wb9Sy+ziJSr2RYll4iYfoqwEbvYPWavQ4nr7wspd3LrsLquT2dedyxQ78hbu94U/8v1Fuu65PtT+BMA+gx+GJ23MEXN9GuahiSVGT4l0Rs/VK4k41LUL25d/A00pkRK2zoJNEtixbUVVMe2OVDnTMc6ABEreFuBSWbEi4q98mnvnYCXqlAXxumk1UJ5iYwqcS/lxG7mGiOc1OzVv2/bnfGzkuEyTs0p2RVFmTyRXbTtMyabCkNNYM6Hizoc+SjHP6J6ILzBvr7lTWEPXhb7b8OBWZn6LtRZAyFipbgz9GkX9Ew6xDIaMbGWUjchK3YAlI/zpJ0oF3xQLRMRb6tjR6VbqgV6h7h+7xhchCnspXU26ijY+c7qtgc9lHC8347kaqad1UFuR5xNqn13QvDfAOFPQJ4j0Vqst5tHAM058ZKa9cW2zrVfP0hzzFYiZF9eZRjkNFJpY0Xj4pKyLzcwE0Sq28Z8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3Mzc0ZQb3UzQTNiT0JVeWJpbWFhcTQvT0J5ZHpyYXI2R1ZISFJJNGRSc1Bx?=
 =?utf-8?B?cVhGVWw3YjdGNGdyTXBDdGFQR1QwTzliR3cyMWoyb2Y3Mmp5VkZGWm1FZG1I?=
 =?utf-8?B?K0JzUjJNdUFRV293b0pnN2J6VnBiWU4xT2Z3SGQwV1pNUkhGSGVUcHh5a296?=
 =?utf-8?B?QlpucDJJQU93RmV5QmdvSGQ5dk1FdlRVTjlMSlk4VHNPYytkTDdjNzFHMjZ0?=
 =?utf-8?B?V1ptMXQzeCsraE9POUNJVDF2anBZUXFMYWdGUHB3ZVRUdnZKTlVqMkJ5Nm5n?=
 =?utf-8?B?Y2c2bkt6VmtYWG9lY1dhSEtJZDB6ZTFDNFJyVVBjN0pPTEk3bjk0U0phUE5k?=
 =?utf-8?B?Y2NRNUtoTnJQRzZ5TmVlNWoxMjcrYXlmbk5NUStRL0dVcEYzRUpYV3ZtM3F3?=
 =?utf-8?B?N2hUVStwV2FiSUtTTmZxZ0R5VkE3Nm1FcW43RUVMMjBrUVd3L0hvQXhiK2RW?=
 =?utf-8?B?aGpGaTlKWlhjV05zUWRGNXk5bXhLWFRRZ2h0SEpOMkI3d2lXQjdGV29NaDNH?=
 =?utf-8?B?aUN3K2I4amVBc1YxN2JiMmtqdHZ0T21adHU4bHRiY2pmSzUzL0dnaVY1MmZO?=
 =?utf-8?B?SkNTSXpGU20rK1dqUGNJNVgwV0EyTFd6Y0VrOEF1K2FHTktINCtMNm1WSDFQ?=
 =?utf-8?B?K20xd2J1Ui9xUG9nMGlpUHNENTRGd2RWQ2VvZFlJbVVnNFJpR1ByUG9jaXl6?=
 =?utf-8?B?UllocU5lWmNXaGtnZ1BJT1NJN2p6YW80Y0FwVUZxdEpmVHlpaU14cElUd2l1?=
 =?utf-8?B?OHh4MFNPY0w4K1N6SG5kMmdJZXNrbVFkaXV0L0k4RTJReTRBS1lVTys0czZ4?=
 =?utf-8?B?aS9HejlnaXI3K0JaTnJUYnZYQm90bUIxU2h5bjJPUnBpM2VTK0RWaGNyOGJX?=
 =?utf-8?B?VHNHcEVVMG4zcGN1VnFTMWszV21iM01WeFpNSXd5QkU2TmVMVHJIajUramlh?=
 =?utf-8?B?MEJoUXNRRStOYXB6RWsyOTNWZzdhbGhHZWo1WVUvQVpVTWhYVEhzZ29hYTNR?=
 =?utf-8?B?UFpPanhscDlXUUY1eXg1QzluaitjMzZFZGZuUFFERXpFSkF1bERWOU9WTEJo?=
 =?utf-8?B?MWl6enYrb0d4VXpyVlFkZ3FNTjZMT3VVS3M5YTFWQWxOZkdhUlRFOUt0T0Jo?=
 =?utf-8?B?MjFxQWxkbkEyZHNtbSszYUxJbHJkTGJNZnIwakpWZk9Ca0pCTVJlT0tpWkNF?=
 =?utf-8?B?N09hSWJ6MTZkcElZbGZaRFprenF3aU80Z2xaRVB2TldhZVkwd0tKWXR4b1pu?=
 =?utf-8?B?RUdpNTgxSFZRMjRGUDVpWU5zSEFLSEN6SVkxWU03ZXdMbzhTeGxweklqRHpD?=
 =?utf-8?B?YXp1bS9ZaVpOek8waXRaZjRNTkVpS0JWaHlHQkRWekJldEJ6aExrZTQ3SGpo?=
 =?utf-8?B?TERUbkhwWFo4RlNFK0RQQXM2RS9kNUxNRnYzT015eU1LeDdHT0trT045ZXB3?=
 =?utf-8?B?ZTJPZ1dNSHl6TlkvU0pqYUNmRnJyUGswdUowaVNIczdHa3MzSEM5M3lFOWNo?=
 =?utf-8?B?UlJodG1mcHlMVmNwT1pCZks3c1crNUhZWEREelZpc1NJbkZldE53ZUwzT0E0?=
 =?utf-8?B?T05oZ3dleVdhVGE0eFNpa25HdUlJek5HNDVqNEtlT1lsMkZnd0lJNnBCZVVG?=
 =?utf-8?B?M3hNWVhmSG1Fd0lKZk1ldFp4dmhFNTdHenJMUG1UV21YVWM4bVB4TmpUL3N0?=
 =?utf-8?B?WmJyMGJ5R3Iyak9aNEYyZmZ1UmZpNmh4M08yLy8xUGU5QldUMmNzdGJHMjlH?=
 =?utf-8?B?NWN1TXZFSGlRMGpZMDE3MnVDZUdrRWhHNloxcmxMTkp4enc4VGFRb2pIVVFC?=
 =?utf-8?B?cUZiU1oyT3R5U0xZd0czbm1iZit4STdmZ3RFaG54RldMZWNGN1g0d3cwSW1K?=
 =?utf-8?B?czZkeWtxdDB5RzY4TFNKRVA3MTNFNHBjOWlycjlJTkU5anBxTGFhYjUraG5m?=
 =?utf-8?B?YTdmVG1aRFhFUGROQjViQ1RxY1VzT2ZuNVEzR1JNbzdBVHVaTGJJSm1YOCtN?=
 =?utf-8?B?Z1B1ZkpqcElXdjMyRXEwNnI1M1RYYnJBY01KWWt5WmV1WGozNUVTY3pZWk5K?=
 =?utf-8?B?cGVxdGYySXdUL0lrenVhTjR1NlpwWFk3a0F5TWF1M1Q2MkRZMElrTnRwUXA5?=
 =?utf-8?B?YkVheTVEQnRnY1ZGd0UvOXNkbzVqRXdhcFdtMzMvNEZ1bE52eWZ2emNWMVNU?=
 =?utf-8?B?aFM0QTlUNjUrL0s2WFNoYmdSMkhVWHNMZTc5SFI2MitCT1dheUhiL1FkUDFr?=
 =?utf-8?B?L1g4b1BjWEF0NTNHejR2eDgvR3FOdW1IL3BIUGF6SWpjZS9UWDRxQlhsRmRP?=
 =?utf-8?B?WDNteUdnREprQXFtdHRkT0s3ZkpOOWJLQU54MjlXTTgvcUVMZ0JVUkhhamkv?=
 =?utf-8?Q?DuDGyOe/bQIML9eE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAEB44FC5ECCDB47AB80A5A664B7EB36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sOPyK6cYA4pjy/SPBigQEOs3Ano+ySyPrQ1RpnqcYuDxVUWQz6JSrllKMjUtKLjJFBH8sfxOpORIrSkJ6zqPPIIjlqmUrATKtH45Mr0QNDwJGcCHk+5awX1qOB5NWIg0uitcdRlZOx+d+MgJCnKieAB2VPNsmOY7KnxCCQEKHXJdl5gzyynwBCJuPWVEjl97aMN43ht+M3iigCmMT9kulCFer4B+fA6nEgpeTLfEGpEUkpZrzM6WQ/M8Dr/J5ONOkppmyRkUZQo+luqkmjCMGNPEUSZjpcYfY722GcBNuoAXkonkC6rf+qUfmDsgXrWjnZIQ2A8L2bw1dIEJHC4GJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bc15a3-2f0f-4887-dbf5-08df1a20a10b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 09:45:55.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5u2PFzHhplpbUdFPyt8DfnS0eKRb/e5n8KtYPb6WI1gJSK+tlA9TGfeskE3j6JTXuoCGx/HwKlbeK3RaDDchDZYrIzNDiShPxI5h9lQWf+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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

T24gV2VkLCAyMDI2LTA5LTIzIGF0IDExOjU5ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
VGhlIGFkanVzdGVkIG1vZGUgc3BhbnMgYWxsIHRoZSBqb2luZWQgcGlwZXMsIHNvIGl0IGlzIHRo
ZSB3cm9uZw0KPiByZWZlcmVuY2UgZm9yIGEgcGVyLXBpcGUgYXJlYS4gcGlwZV9zcmMgaXMgdGhp
cyBwaXBlJ3Mgb3duIHNoYXJlLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UsIHRoZSB0d28g
YXJlIHRoZSBzYW1lIHdpdGhvdXQgYSBqb2luZXIuDQo+IA0KPiBBc3Npc3RlZC1ieTogQ29waWxv
dDpjbGF1ZGUtb3B1cy01DQo+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9s
YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcHNyLmMgfCA0ICsrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcHNyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jDQo+IGluZGV4IDc2MjYwY2ViNDljYi4uYzE5OTRkYTM4NTY3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTI5MTIsOCArMjkxMiw4
IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21p
Y19zdGF0ZSAqc3RhdGUsDQo+IMKgCXN0cnVjdCBkcm1fcmVjdCBkaXNwbGF5X2FyZWEgPSB7DQo+
IMKgCQkueDEgPSAwLA0KPiDCoAkJLnkxID0gMCwNCj4gLQkJLngyID0gY3J0Y19zdGF0ZS0+aHcu
YWRqdXN0ZWRfbW9kZS5jcnRjX2hkaXNwbGF5LA0KPiAtCQkueTIgPSBjcnRjX3N0YXRlLT5ody5h
ZGp1c3RlZF9tb2RlLmNydGNfdmRpc3BsYXksDQo+ICsJCS54MiA9IGRybV9yZWN0X3dpZHRoKCZj
cnRjX3N0YXRlLT5waXBlX3NyYyksDQo+ICsJCS55MiA9IGRybV9yZWN0X2hlaWdodCgmY3J0Y19z
dGF0ZS0+cGlwZV9zcmMpLA0KDQpJIHRoaW5rIHlvdSBzaG91bGQgcmF0aGVyIHVzZSBjcnRjX3N0
YXRlLT5ody5waXBlX21vZGU/IEFsdG91Z2h0DQpzZWxlY3RpdmUgdXBkYXRlIGlzIG5vdCBzdXBw
b3J0ZWQgd2l0aCBwaXBlIHNjYWxpbmcuDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gwqAJ
fTsNCj4gwqAJYm9vbCBmdWxsX3VwZGF0ZSA9IGZhbHNlLCBzdV9hcmVhX2NoYW5nZWQ7DQo+IMKg
CWludCBpLCByZXQ7DQoNCg==
