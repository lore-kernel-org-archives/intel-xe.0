Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DED6C982FB
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 19:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E8F10E91F;
	Fri, 16 Jan 2026 19:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiDShBIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6A610E91F
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768593116; x=1800129116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EkZHCnZk/CqTTpd5QttphP8MdvtHIWHYUDx43R3ZkvI=;
 b=EiDShBIGb4dvJsFTJCaoRz9x+NoW1cU5PVQgu9yOBC0Nyfnn1A+JulUD
 lh5I/PniCVF0pQDdyvgKsSE8N+IR7RUcZsM5r9oU//JJ6zYa4+uC0SFCV
 fpiLuNnK4f5JoMKUJiLR3oexlaTNJ5FZcaudNPUCLWCLxrltyLfZvScAM
 cnADQMDWjEplt8L1XpdG9aFh6xMAHITFEmuvugQSHBEVywOhIaY64m3+5
 E6PhkKW0IPU+FVfjbwH6SCXCdzvi0V81uTFXolSxJgZDQ5STaGA5av7Nl
 YO+H3xyGqTNyCRfoePgfj3qM/QqviJZr0SPseYl2HO5MfIvRfPwDHmw0T Q==;
X-CSE-ConnectionGUID: vsLdcbV5RxOtw3Q89DzqTA==
X-CSE-MsgGUID: 8lehgllXShSvXyHcm69uNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69808394"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69808394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 11:51:55 -0800
X-CSE-ConnectionGUID: DuKHR37CQn2rLeopYa90Qw==
X-CSE-MsgGUID: kEGTHgzUQzyimnPil8vaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="205220225"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 11:51:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 11:51:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 11:51:53 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 11:51:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwsdEQFiKB9YmvGySK4pi99Y9LyD2pC+WT7nGS1qVaEWkouDavfj66aQCzAqfo6soIUSHDF9f0WHAtmSkDKxsNUDqP1nCf8TXqkfNxb6hxcdsgnpiGp5vMFpMJkHYLb/fNXzSckZMFhOCiDKlEXx8StO03C232wYPtEsnCERpmqIadBdu9v4TjVM9Q6PGao93DmeXzj5PpTvXLzNlR3rI21s+wpZfJjHKzxTwVGvxxFmPOQWr0mxyDI2g7XbrqGndP3oeiFIe8u3hJwnhSakr2OB2jKWiarsIm9HZo0ZXKTktR8Gud9wwoJr9tXdgsWHeOUKxcqgjkWSuHwgRsS6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkZHCnZk/CqTTpd5QttphP8MdvtHIWHYUDx43R3ZkvI=;
 b=UZnMJGJVKkjWr+TuuTM13v40Ztmje6ncAabWNNDmNXOCkT2LF1W2cA6vwEaRLfmSfzUhuy3Y6IeK23WLoePM0r1TZaoeDjkxhkdQ/GxM08odQt/7kojpEA5xRzh1XaYl+yXAxSHaNMwWWyNx9LmUsrtyrYY4LO86voGYbLGQUL2OH9ESEiWWQzIVZUPjecDFXcC2fYYRilH8OCX3WzA5LH9XRxryEScozXVKaOFJnLx7Iu3hK+aCg65Lu0pIrHSGN07Avq/GQCBQciBk7Vcr3CD6P5JLXdJo7Jyq2vuOElgeuA6Dx1OxGrn8dQ+vfXA5yD6ydxHbwKHllFUvuosJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8793.namprd11.prod.outlook.com (2603:10b6:806:46b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 19:51:50 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 19:51:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Ceraolo Spurio, 
 Daniele" <daniele.ceraolospurio@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Santa,
 Carlos" <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Thread-Topic: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Thread-Index: AQHchbhao8aAyblFs0mVvuwtOV2/17VUjk2AgAAHoYCAAG0bgIAANJyA
Date: Fri, 16 Jan 2026 19:51:46 +0000
Message-ID: <7379f92d177312e90ff27df2a088897a1da920cc.camel@intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWoPKWxu7zIqZPog@fdugast-desk>
 <c0d127d4-4219-4d92-8398-e971a815822f@intel.com>
In-Reply-To: <c0d127d4-4219-4d92-8398-e971a815822f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8793:EE_
x-ms-office365-filtering-correlation-id: fac6437f-c6ff-487e-1b7b-08de5538aebf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NVFWaU8vM2hqRnhxZHJFUkFVM3IyK2g1OWMyRUhBRktjc1hFSzlTV1JJWUVK?=
 =?utf-8?B?bkkweE54cVNhRlhDWWdHeW83VTZhU1Q4WTBsRnJzVXFXcDJUeG5HOXpxVjR0?=
 =?utf-8?B?ajZ1WlF3c1RjbTNrOW9TQ1BDOGZDaXUyY3loQ0hPN3NpZHZZcnp2R2tMVTA1?=
 =?utf-8?B?ZTgyejh1SnRXS0ZZQU5mWDYxWElsbDVwNE5vd1FMUG5ENFRwNStiaUljSlBw?=
 =?utf-8?B?VG9PaSt0YUF3NG9xZWtOME1oSHBXS1l2clRaVkJKL0N4dGVSVWwwcEM5WTZ0?=
 =?utf-8?B?aXFmTkcvMU5yS0NKS2pZZmtZK1Fwcjh5R3RUajg0bzVOMTVmSWp3SmJRUXZK?=
 =?utf-8?B?NGd0QUVkS2dFVVFOOFYvN0pOSnJtalZnbWd1UTF2YkN0RWY1Ymtlb1FzTmJK?=
 =?utf-8?B?dThnQmUrelVjN21iZEMraWVzYUpnTkpRZStmR2RDT2VhNmZBTFNnTllSbWc1?=
 =?utf-8?B?eHE3aDFDMzIyd1h2SWpKaVVHRGRRdFdSVlh3d1phZFZ6YjRJUW4weWN1Z3lN?=
 =?utf-8?B?emc4bE4rT05CUkpwemZuRmo1amFPQW5aMEtHV1RjKzVwRjZUNmlGTVlvdk5F?=
 =?utf-8?B?dkNYU0QrQTlKNXl6Y1BnSkNqLzV0NU5wVmZkcGhKU0U5dG5NeWdXWmRMcjJq?=
 =?utf-8?B?RFpMblB6QWdSUDlZUDNaY1pFZGJUNzdLNUtHM0grdnpHMkFGS0N4MDI0RVdJ?=
 =?utf-8?B?MFY3SEZiSUpkVDg3UlNQYnh5S0VuVG1SS2FlTXhxM3lPbTc4ViswZ0tMZzBk?=
 =?utf-8?B?Vnk5V3g2RGdEa2dvenJpQ25LR0JCSVJLeWk5MnhPUno1cWdod0ZZMEJIVUdI?=
 =?utf-8?B?cmJEbld3NGtCNW9QdnZ6RGRMZXJCNmtpRUFuaTR1MEE2d0g3OEJHS2d6SGVY?=
 =?utf-8?B?OTJxQVY5TXRiOW0rNVo2Zis2L0lIV2xaeHJZWW52aDIyUXVHN0ZrS3BXK0dp?=
 =?utf-8?B?R212amxHUyt0RElzaVY3TkVyc2YrbElIelZQNGhXUkVjb3BYczdDK1hrK240?=
 =?utf-8?B?Y0k3NGFwaHM5cE1neitZV3pJODY5R2dFNHVacjNUVlB2WTFESWxXWEV6UFFP?=
 =?utf-8?B?VkdYUzJFaTFKQlFOSERsYmRBZm1wSndwczJqcGhTc1VCUmxPQjFQZWd5bE9P?=
 =?utf-8?B?YXVUMGQvdXNhakRTYTZTaWJibEZEWVN3VGc0R1RwdmRVWkQzc1IrZEJaMjY4?=
 =?utf-8?B?UlpCY0VZWU4yY3hMazg5d0ExTDU4bHlTWmEvb0JCaVIwWjR6dFlhRjNSWEJz?=
 =?utf-8?B?Sm0rS3pOK1l6SGNGYXZIZnFXSkY5VndlYzZqUVBEMGNuczF5NW9iL3ZSOXN3?=
 =?utf-8?B?WHFZYjVscXU1MnZYWDlxbW5ET3JaMklEeWR1V21VN3pwZklWZmlIY3Ywc0lV?=
 =?utf-8?B?cTlOcjYwTW0xY1VJditvWHdqcjltbk9UVWVseDhRdGdNbkFINEFCMjhCVHZC?=
 =?utf-8?B?a1laZG9yTWpuU3hoajhrYW1mdyt2Rmx1LzJkdllMM2s5NXNhS2JGL1VpcEdD?=
 =?utf-8?B?UGgwc3VFTStPYkNNVlZTZ0FSbnNHaVlpZ2l0bURUaSs3VFBla2NJRUNKWEF0?=
 =?utf-8?B?aGc5UXIxamdDQ0lYRndzbHZPQ0FFeHFkL3oxdkI0UVNndElYOXBJSHlCMXBu?=
 =?utf-8?B?VzZLVG0zRkYrQStLNVRvaE9VVURCblZwQjRsb0RPUDkwcWJOTWd0VlZrcjVx?=
 =?utf-8?B?Yjl3ck9GaGIxR1dvSzlpWnJSNnJjRURIQjN4VFFRc1ZCL0pDV08zOTNaZnMw?=
 =?utf-8?B?WFBXaWtGRk5tNlRpOE96N3lxY085TjFXYXRmZVp1SDBLNzFzSlN0YXNHYTBF?=
 =?utf-8?B?L0JWT2dLbWpLbmFCc2dWUDdlUjlqRnpBa0ZoaW1GYXliaWZraVVWVGJjZTFN?=
 =?utf-8?B?cVliNk81WFBNekZUMWhkMGdOVG55dGJvZVQ2RlVON2d1VzVOenpTZVVydlpB?=
 =?utf-8?B?VjUvRktZQzIvcmFHRmYxSTNuU1VnQStvVUFpdGRUbUg4NjZYYUE5Yis0dk9s?=
 =?utf-8?B?enVxNTc0UVZSMFAySEh3aHVwcEU4OGpjM1Z3RWJGWlNzUVllSUdVczJqMit0?=
 =?utf-8?B?MjNOTmtObmt3SUlaWkZvcFY3LzdpdENwUGFTNkZDRloxS1A4c1dqNm8zdHlB?=
 =?utf-8?B?SjRuZC9XbUtHRkU5Q0xnL01rbTFSbFM2WHZ0UGdpd09jM3o0Yzl1cFdkcnhN?=
 =?utf-8?Q?cFkbSvVmTfzlPQF+0CeVJt4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEpBTmlVUmpGNklSMGJLcjVRVkFoeWJOMDk0eVppdUo0Y3RIY0VQWGtRU1dZ?=
 =?utf-8?B?djlCak1ldjl6NFUyQ0hlK3Y5OFIvNTlJR0daZjdOWjJvY3dmRnhsK0ttU1lx?=
 =?utf-8?B?TFZlRWVEN0JMSFpaTHBKa2ZTWm5NY0tsemlXdTMrTnQ5ckQxa2Jkc3hjd0Zq?=
 =?utf-8?B?VmFjUHc2cDVkY0xLYkI4dTFESTJWRjBpbG9lMUhzZlhvYjJjTGFldzkzdnV2?=
 =?utf-8?B?cElTekQyRHM0dGFITFFBVGp5VzExaEhrc05WL0ozNGVJMkdWc2NrY29uSlZY?=
 =?utf-8?B?UDVuSXZiU1V3WHNxUlkvT0RTc2ZxVS80TmhaU0xCUTBFTDNkVUc0K2J1RFR5?=
 =?utf-8?B?MFJidlRsbzA5UzRRTnYvQTNrVkFITnBLYXpaYmNLYVJXM2ZSQnZwaE84ZFQ4?=
 =?utf-8?B?R0pUQjR5cGZKbzlGN2NQcDcwcXV1aDJRU0dSR2RTT3Q1SFJaQTdZb2JJYkNW?=
 =?utf-8?B?anpDOWNCYTVIM3UwbE1pTi94VE1Ja05CZnVrZW5TNk42NnNsYWxtMW1vb2pZ?=
 =?utf-8?B?Rk9KZmcxSDNXZDFKVkJHamdBdlZGR0t2UTBXY05uajBSaVlzWTBQVUIvcHhn?=
 =?utf-8?B?VFdncGhVZlBrbWFDUTgxcU04ZTNOdEdJYkJ2QWR5Y2ZFYmMxZzV4dDFKRFNj?=
 =?utf-8?B?a2FGWVJaUzlyOGJOd1ZueWxITXJGR1RqYzI3RnVTQWRXVVo0azdmcCtBejNx?=
 =?utf-8?B?emNvcFBYUkk0WS96OE5FVzM3VVdRaTZOWEZjUDQ2NUZENlFnWlZrRmJWY1ps?=
 =?utf-8?B?dDdIcHR1d3ZUZTRNUTl3eUZHSnFXT1FCazdUUHRCSE81NElWY0dLbU1HRUlI?=
 =?utf-8?B?c0VDRHNJeGhiQTE0RWxyNkFaRDJPU3Z4RlI3Vm9ZSXlXbzdKM2h2T1ZWMUVJ?=
 =?utf-8?B?dVdlQkYrcnNRdDcwdnoyZG9obG9iN2EyK2Q2bGlQNnMyaVJ1SnV3amlveUZp?=
 =?utf-8?B?YmdTcjFqOXRvOFJVdkEzSFZSVi81ejE5cW4rbjg0YnBFUXUvbVV6UDN6Wmwx?=
 =?utf-8?B?UkFhYUkzdlRTbktjNHJqR1lQTmZyY3ZYTHk5eVJiYk5qempEQ2l1aDZ2b3Ux?=
 =?utf-8?B?eVE5N1hVb3YxeEpqSkFrYkQyZmxMVy9mUDJmU3NEL09iL3ZsdG1sRS9POG9h?=
 =?utf-8?B?SDVoWmYwUkpxbnNXbmxVSGpkWnhWM1hCWUFwdkpjSUxpOGxDU3NBamthVUZM?=
 =?utf-8?B?Si9ZNU5aYzZjWDdMY3gwYVoyWmlHNlJiYTIrdUNqWVkzV2p2dE5rcVdpT0F2?=
 =?utf-8?B?UmU3ZFB3ZTYrQTlEQVNoQUsrMDN5Nm1lbzFiRnFqaVplUTNCNUt5R0xlZGc3?=
 =?utf-8?B?TExwa3ZiWnh1VVdyQVE0RVdtenppOWtWc09HMU4vczJPOXdnOXp6RTZ1b1pF?=
 =?utf-8?B?MWg5c2svOWtXMzFOQUVkeXIrWi84SVNVd3dFZTZmUnN6RGk5MG0xK1pYS0pN?=
 =?utf-8?B?QS9UZXI4TCs0VkNjbWVVWkY0RWdTc0FEdW9JUGU3RTd1aWQyQ3Z6TTJBbDZk?=
 =?utf-8?B?ckN6Nm9wSlFTeitnZ3oyTFNUcTgxdlRJdFhsM1k2Y1F6TUUxV3d2UVI4dkNQ?=
 =?utf-8?B?V3hmWXBiZUc0TlhreGJ5SDQxVllQTGtOanhTSk85Zm5mUVBPalB3dDFGYVc2?=
 =?utf-8?B?L1pORWsxbGxYMFJoY2UxaTUyZ2VPOTV3OUFEMVdjTTMrMFVpU3QxTitwU1lk?=
 =?utf-8?B?OWxoeEpXaTVaQ2VXRFZnaVZNTHRIcTBjbWJ2Y1pZbDVXemg2bmxjZ0RrYVAx?=
 =?utf-8?B?bWNqSEdjME1LYURyVWkyWlNuRVVoeXdxU1hwWjFpU3lUYmE1YUZDWVVCeDZl?=
 =?utf-8?B?bDYzMlhhUFZqZ0ZEMUVEVU5oeC9VVTh1NkxwWjUxa2kyTUFTSlJEU1lKK2ov?=
 =?utf-8?B?Q1RQckQrQkFZRnZoRE1OczRyZklaYXMxaFpVSGVydHB4UkxFNGJHN3dQWUM2?=
 =?utf-8?B?NThsUUx5NGpEUlBNYzlLanZaMzdPQjU4Mnc4b0liazNSZ2dEaTFFYVR4anR6?=
 =?utf-8?B?R3BjZis2dC83YldsVWVJaW1ZNTcrUHkzQTNCVk90NkJKQ0Rpdi9KTWRBR0ZG?=
 =?utf-8?B?eUNtVGJFS0NyTVZyanU5VjlzNlVoR1VWYkw1UjN3engrVzZkY3g5dThLT0o3?=
 =?utf-8?B?emhPRDhaaUx2VDdEZ0l2SytBMnBJOG1YMFJvK2RmUDBDdkdybkg1Y3ppY1hh?=
 =?utf-8?B?Z05ENmRVMnp2RGRFdEgxZ2RxUG1yeXBsYzMvM01qb29CQTIyQlE5YXdXY1Jz?=
 =?utf-8?B?bkFwVjkzRSttcERvQTgvbDQzbnFEVXRGRnJBZFFOZ0laMUttZml1UTEwTXNi?=
 =?utf-8?B?Sk54Uk01TGZ6RE5LVG9US243RkZNVEY4TjFHSlg3RlBqWis4TVo0eWZ1dzhV?=
 =?utf-8?Q?YzOVBVZynRn1EGiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89E99623BDDF004A92E1A8B3889D6A84@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac6437f-c6ff-487e-1b7b-08de5538aebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 19:51:47.0378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPVftStLliQIPfcvyVfvV8W5pEk5clHLF3xWfmAXcNkcb297yB0CkOGljFNTK3jig8zwgUfB11knzp3Dei3WFaLblaONvXpnSP80SxyxXtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8793
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

T24gRnJpLCAyMDI2LTAxLTE2IGF0IDA4OjQzIC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiANCj4gDQo+IE9uIDEvMTYvMjAyNiAyOjEyIEFNLCBGcmFuY29pcyBEdWdhc3Qg
d3JvdGU6DQo+ID4gT24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMTA6NDU6MzlBTSArMDEwMCwgWmJp
Z25pZXcgS2VtcGN6ecWEc2tpDQo+ID4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEphbiAxNCwgMjAy
NiBhdCAwNDo0NTo0NlBNIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+ID4gPiBJZiBh
IGJhdGNoIGJ1ZmZlciBpcyBjb21wbGV0ZSwgaXQgbWFrZXMgbGl0dGxlIHNlbnNlIHRvIHByZWVt
cHQNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGZlbmNlIHNpZ25hbGluZyBpbnN0cnVjdGlvbnMgaW4g
dGhlIHJpbmcsIGFzIHRoZSBsYXJnZXN0DQo+ID4gPiA+IHBvcnRpb24gb2YgdGhlDQo+ID4gPiA+
IHdvcmsgKHRoZSBiYXRjaCBidWZmZXIpIGlzIGFscmVhZHkgZG9uZSBhbmQgZmVuY2Ugc2lnbmFs
aW5nDQo+ID4gPiA+IGNvbnNpc3RzIG9mDQo+ID4gPiA+IG9ubHkgYSBmZXcgaW5zdHJ1Y3Rpb25z
LiBJZiB0aGVzZSBpbnN0cnVjdGlvbnMgYXJlIHByZWVtcHRlZCwNCj4gPiA+ID4gdGhlIEd1Qw0K
PiA+ID4gPiB3b3VsZCBuZWVkIHRvIHBlcmZvcm0gYSBjb250ZXh0IHN3aXRjaCBqdXN0IHRvIHNp
Z25hbCB0aGUNCj4gPiA+ID4gZmVuY2UsIHdoaWNoDQo+ID4gPiA+IGlzIGNvc3RseSBhbmQgZGVs
YXlzIGZlbmNlIHNpZ25hbGluZy4gQXZvaWQgdGhpcyBzY2VuYXJpbyBieQ0KPiA+ID4gPiBkaXNh
YmxpbmcNCj4gPiA+ID4gcHJlZW1wdGlvbiBpbW1lZGlhdGVseSBhZnRlciB0aGUgQkIgc3RhcnQg
aW5zdHJ1Y3Rpb24gYW5kIHJlLQ0KPiA+ID4gPiBlbmFibGluZyBpdA0KPiA+ID4gPiBhZnRlciBl
eGVjdXRpbmcgdGhlIGZlbmNlIHNpZ25hbGluZyBpbnN0cnVjdGlvbnMuDQo+ID4gPiA+IA0KPiA+
ID4gPiBGaXhlczogZGQwOGViZjZjMzUyICgiZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGRy
aXZlciBmb3INCj4gPiA+ID4gSW50ZWwgR1BVcyIpDQo+ID4gPiA+IENjOiBEYW5pZWxlIENlcmFv
bG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+ID4gPiBDYzog
Q2FybG9zIFNhbnRhIDxjYXJsb3Muc2FudGFAaW50ZWwuY29tPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jIHwgOSArKysrKysr
KysNCj4gPiA+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+
ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gPiA+ID4gaW5kZXgg
YTFmZDk5ZjJkNTM5Li5jZDY0NWVlNDAwYjkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9yaW5nX29wcy5jDQo+ID4gPiA+IEBAIC0yODIsNiArMjgyLDkgQEAgc3RhdGljIHZvaWQg
X19lbWl0X2pvYl9nZW4xMl9zaW1wbGUoc3RydWN0DQo+ID4gPiA+IHhlX3NjaGVkX2pvYiAqam9i
LCBzdHJ1Y3QgeGVfbHJjICpscmMNCj4gPiA+ID4gwqAgDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBpID0gZW1pdF9iYl9zdGFydChiYXRjaF9hZGRyLCBwcGd0dF9mbGFnLCBkdywgaSk7DQo+ID4g
PiA+IMKgIA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBEb24ndCBwcmVlbXB0IGZlbmNlIHNp
Z25hbGluZyAqLw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBkd1tpKytdID0gTUlfQVJCX09OX09G
RiB8IE1JX0FSQl9ESVNBQkxFOw0KPiA+ID4gPiArDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAoam9iLT51c2VyX2ZlbmNlLnVzZWQpIHsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpID0gZW1pdF9mbHVzaF9kdyhkdywgaSk7DQo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfc3RvcmVfaW1tX3BwZ3R0X3Bvc3RlZChqb2It
DQo+ID4gPiA+ID51c2VyX2ZlbmNlLmFkZHIsDQo+ID4gPiA+IEBAIC0zNDcsNiArMzUwLDkgQEAg
c3RhdGljIHZvaWQgX19lbWl0X2pvYl9nZW4xMl92aWRlbyhzdHJ1Y3QNCj4gPiA+ID4geGVfc2No
ZWRfam9iICpqb2IsIHN0cnVjdCB4ZV9scmMgKmxyYywNCj4gPiA+ID4gwqAgDQo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqBpID0gZW1pdF9iYl9zdGFydChiYXRjaF9hZGRyLCBwcGd0dF9mbGFnLCBk
dywgaSk7DQo+ID4gPiA+IMKgIA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBEb24ndCBwcmVl
bXB0IGZlbmNlIHNpZ25hbGluZyAqLw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBkd1tpKytdID0g
TUlfQVJCX09OX09GRiB8IE1JX0FSQl9ESVNBQkxFOw0KPiA+ID4gPiArDQo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoam9iLT51c2VyX2ZlbmNlLnVzZWQpIHsNCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9mbHVzaF9kdyhkdywgaSk7DQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfc3RvcmVfaW1tX3BwZ3R0
X3Bvc3RlZChqb2ItDQo+ID4gPiA+ID51c2VyX2ZlbmNlLmFkZHIsDQo+ID4gPiA+IEBAIC0zOTks
NiArNDA1LDkgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gX19lbWl0X2pvYl9nZW4xMl9yZW5kZXJf
Y29tcHV0ZShzdHJ1Y3QgeGVfc2NoZWRfam9iICpqb2IsDQo+ID4gPiA+IMKgIA0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfYmJfc3RhcnQoYmF0Y2hfYWRkciwgcHBndHRfZmxhZywg
ZHcsIGkpOw0KPiA+ID4gPiDCoCANCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogRG9uJ3QgcHJl
ZW1wdCBmZW5jZSBzaWduYWxpbmcgKi8NCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZHdbaSsrXSA9
IE1JX0FSQl9PTl9PRkYgfCBNSV9BUkJfRElTQUJMRTsNCj4gPiA+ID4gKw0KPiA+ID4gSUdUIHRl
c3RzIHdoaWNoIGNhbGxzIGNvbXB1dGUtd2Fsa2VyLCB0aGVuIGJiZSBhcmUgYXN5bmNocm9ub3Vz
DQo+ID4gPiAoZG9uJ3QNCj4gPiA+IHdhaXQgZm9yIGNvbXBsZXRpb24sIHBpcGUtY29udHJvbCBp
cyBuZWNlc3NhcnkgdG8gd2FpdCBvbg0KPiA+ID4gY29tcHV0ZS13YWxrZXIpLg0KPiA+ID4gDQo+
ID4gPiBNYXkgeW91IHRyeSB0byBwdXQgYXJiIGRpc2FibGUgYWZ0ZXIgZW1pdF9yZW5kZXJfY2Fj
aGVfZmx1c2g/DQo+ID4gVGhhbmtzIFpiaWduaWV3LCB4ZV9jb21wdXRlX3ByZWVtcHQgdGVzdHMg
ZG8gcGFzcyB3aXRoIHRoaXMgY2hhbmdlOg0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jp
bmdfb3BzLmMNCj4gPiBpbmRleCBjZDY0NWVlNDAwYjkuLmQ4Y2NlYWI5N2ZhOCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4gQEAgLTQwNSwxMSArNDA1LDExIEBAIHN0
YXRpYyB2b2lkDQo+ID4gX19lbWl0X2pvYl9nZW4xMl9yZW5kZXJfY29tcHV0ZShzdHJ1Y3QgeGVf
c2NoZWRfam9iICpqb2IsDQo+ID4gwqAgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBpID0gZW1pdF9i
Yl9zdGFydChiYXRjaF9hZGRyLCBwcGd0dF9mbGFnLCBkdywgaSk7DQo+ID4gwqAgDQo+ID4gK8Kg
wqDCoMKgwqDCoCBpID0gZW1pdF9yZW5kZXJfY2FjaGVfZmx1c2goam9iLCBkdywgaSk7DQo+ID4g
Kw0KPiANCj4gVGhlIHBpcGUgY29udHJvbCBpbiBlbWl0X3JlbmRlcl9jYWNoZV9mbHVzaCBpcyBw
cmVlbXB0YWJsZSwgc28gaGF2aW5nDQo+IHRoYXQgYmVmb3JlIHRoZSBhcmIgb2ZmIHN3aXRjaCBp
bnZhbGlkYXRlcyB3aGF0IHRoZSBwYXRjaCBpcyB0cnlpbmcNCj4gdG8gDQo+IGRvIChpLmUuLCBu
byBwcmVlbXB0aW9uIHBvaW50cyBhZnRlciB0aGUgYmIgY29tcGxldGVzIHVudGlsIHdlIHNpZ25h
bA0KPiB0aGUgZmVuY2UpLg0KPiANCj4gV2h5IGRvZXMgZGlzYWJsaW5nIGFyYml0cmF0aW9uIGNh
dXNlIHRoaXMgc3BlY2lmaWMgcGlwZSBjb250cm9sIHRvDQo+IGhhbmc/DQoNCkFyZSB3ZSBlbmFi
bGluZy9kaXNhYmxpbmcgcHJlZW1wdGlvbiBmcm9tIHRoZSBiYXRjaCB0b28/IEl0IHNlZW1zIGxp
a2UNCnRoZSBiYXRjaCBwcmVlbXB0aW9uIGNvbnRyb2wgc2hvdWxkIGJlIG93bmVkIGJ5IHRoZSB1
c2VyIGFuZCBub3QgcmVseQ0Kb24gdGhlIHJpbmcgY29uZmlndXJhdGlvbiBoZXJlICh3aGljaCBt
aWdodCBoYXZlIG90aGVyIGludGVudGlvbiBhcw0Kc2VlbiBoZXJlKS4NCg0KQWxzbyB3b3VsZCBi
ZSBpbnRlcmVzdGluZyB0byBrbm93IGlmIHRoZSBjb21wdXRlL3JlbmRlciBVTUQgY29tcGxpYW5j
ZQ0KdGVzdHMgYXJlIHBhc3Npbmcgd2l0aCB0aGlzIGNoYW5nZS4NCg0KVGhhbmtzLA0KU3R1YXJ0
DQoNCj4gDQo+IERhbmllbGUNCj4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAvKiBEb24ndCBwcmVl
bXB0IGZlbmNlIHNpZ25hbGluZyAqLw0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgZHdbaSsrXSA9IE1J
X0FSQl9PTl9PRkYgfCBNSV9BUkJfRElTQUJMRTsNCj4gPiDCoCANCj4gPiAtwqDCoMKgwqDCoMKg
IGkgPSBlbWl0X3JlbmRlcl9jYWNoZV9mbHVzaChqb2IsIGR3LCBpKTsNCj4gPiAtDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoCBpZiAoam9iLT51c2VyX2ZlbmNlLnVzZWQpDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaSA9IGVtaXRfc3RvcmVfaW1tX3BwZ3R0X3Bvc3RlZChqb2It
DQo+ID4gPnVzZXJfZmVuY2UuYWRkciwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgam9iLQ0KPiA+ID51c2VyX2ZlbmNlLnZhbHVlLA0KPiA+IA0KPiA+IA0KPiA+
IEZyYW5jb2lzDQo+ID4gDQo+ID4gPiAtLQ0KPiA+ID4gWmJpZ25pZXcNCj4gPiA+IA0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfcmVuZGVyX2NhY2hlX2ZsdXNoKGpvYiwgZHcsIGkp
Ow0KPiA+ID4gPiDCoCANCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChqb2ItPnVzZXJfZmVu
Y2UudXNlZCkNCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIuMzQuMQ0KPiA+ID4gPiANCj4gDQoNCg==
