Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D41FE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 15:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4A610E32C;
	Wed, 18 Dec 2024 15:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCy8e2OI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877010E32C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734536379; x=1766072379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fDb0YyLkPAFq7n89bncoH/V0gCho9Eq7nIeOHnVg9z0=;
 b=UCy8e2OI3/gOBCAC7vuJfQV2bIi1VpnniGC8/r1VHN9APQRWre7Hmw20
 8YioYnJhPxCWC/PETKZm9BMNKJgsPMAAgw9N4bw1cQntLZgHrVw4n0PTR
 hZrPuflIXlxPaBbPEcFifrw9SSLo2ptP28U1FsxFILC0Xqk8GMdTHJ6xi
 rSPWoWxnKXnkbmY0XhP1OgDHw34Jl8mhQ6U12JwARcdNn8NQonAKEwJxC
 4N5VJ5FfaKaUn76ka1zFG9V8KXLu2aLL/DO4VhN2MR/NYWuCuUowuLy0u
 t/ED3E91ATzMXSAbgp1BNSxpuzpB8zVnjPgATwj94JRI8HsVXQp7todZx g==;
X-CSE-ConnectionGUID: L6HG9IzrRWiEQQXPlR25cw==
X-CSE-MsgGUID: FsHJsVBPSGexSc9cWxEoMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46437214"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46437214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:39:39 -0800
X-CSE-ConnectionGUID: XguIgztQRRusOUv+ckoDTQ==
X-CSE-MsgGUID: 2U5FAGSoS6iDu60bBGjtUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98716014"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 07:39:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 07:39:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 07:39:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 07:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVT9w0WIEez7kRk5xUlgoQAL7ryGkfh34r2qiJsFQnkTlo7TVkTZET7Z4zLrb2/43nxzw4PMFgt+T1ZEJaJPO7XhGKs1+o99XL0rorcJqlmv5EGBU5Q7z22Bb2AwaUg57zrgvssVnurI3zMbMpx1+Qt8Y1jt2Nm4VB9gvufCkRg1cbQ2sZyeF/+ALhCVLuhk8Ki0Sf2IGoGzo8qChz8o78MW1A9JvI9LbTMpvlUSC7FNaZYOXDVnoDiVH0s7pO5ZBOUE2JgcnrO0LIN+s7xSnU/YpKw1Bh1W+rlPqYc1NGzN5NBCDGvE/Nu6RINfgAFjP7zSDFiFopvPqQUpGrcOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDb0YyLkPAFq7n89bncoH/V0gCho9Eq7nIeOHnVg9z0=;
 b=E/s3G6acqT/5Tohj7hfcLp0sJ+zWXiI98vceC1t81VwBdBJcp5pYiz6ABbpfz4nCT6zLxuKejp3IF1nu/US0dodobHvr5+x1ox4pG/YYCv6Ec7idGV6GqU0XQxC7oJPeN93NdJNyxbjt9YSvDOgmZwW5DFtlAb06hlmDHDnHbpht69APuubYkwYu2DLARDa0CFPUMRzQXJFZv/YPiK5cw2jE4Wz9vX/aCbUP221aSPrlWYEJV8ZXncYx8xXEWPSjka/l+m4Sfqlym97YzWme0+FrWb5ASGV1I7j+PGkQZi1aL77weYLTByMtJBTDD8F/lj82gbczebv+PCE2d66kWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 15:38:49 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 15:38:49 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Thread-Topic: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Thread-Index: AQHbUJ3YMHh4/aZOLEyCN/bDzf7Xc7LrGKgAgAEL9gA=
Date: Wed, 18 Dec 2024 15:38:49 +0000
Message-ID: <3ebdd73cecef119cbfb7fc902909c8c2adc5b0fc.camel@intel.com>
References: <20241217160732.46280-1-jose.souza@intel.com>
 <Z2ILvmX9y87iFvZP@lstrano-desk.jf.intel.com>
In-Reply-To: <Z2ILvmX9y87iFvZP@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6146:EE_
x-ms-office365-filtering-correlation-id: 3b8c87f7-e8a9-40ab-b5a5-08dd1f7a1161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eW1pQTVhZWNEQnRhckpCMGxZY2N5ZlBLbVFhK2I4QzRNRzJGYUNJZjg2WHJ6?=
 =?utf-8?B?bzFMZXBqKzVLS0ZoMXJLM0dzQ2J5WWVtVmpKVG5PRXk4K3hZV2ZEejhiNHBp?=
 =?utf-8?B?KzVmRnJsWVI3M2lWR0F1NllOSmRPSWRYRXhnbnQwRG9LMDVObGhwcDlNV2xF?=
 =?utf-8?B?T0xna3dTNEUweGluemYwa2QvMU5UR3lNSFZhRnJRN2pKT0FpZXNDd3Q4ME02?=
 =?utf-8?B?NWZwek1YYXBKTkR5SCtuL0RsalhzQk5xTHcxR1dBa2pFUnZ3aElOL1JaUnl5?=
 =?utf-8?B?RXZadUlsdS9BbXZramYvQUpCMjBEMXBWbmJHOUlMTzlMeVhIR2ZKY0N3K1Zq?=
 =?utf-8?B?K2Z3cXAvOHJhWGQ5VUlPVFRZOTVRTDV4UUhyYktxdWc0U1hIcUkwQmZWTVRR?=
 =?utf-8?B?NVY3OEs0dUl3ZHBFYUhYTmZRc0M4S0Y1VFpySmp3YlZjVmpueENiM1lhdHBv?=
 =?utf-8?B?REc0NTR1a3JHamJDOElQVEx6TS95UjBiK1RNeHp3ejgxUms2SWV2UUhidGdV?=
 =?utf-8?B?a0x1OGlGbUtlN0FzRzVOZm4yRzJHVytIZzdKSHNJV3RQMktmMThGOTVhR0lI?=
 =?utf-8?B?WDFRVmVxeVRFZ0RoN3NLZkY3T2JKNDBScnc3TTlMRThsT0RRczV3d0tyS0J6?=
 =?utf-8?B?cUF5YmtsMHRBY0lDRmNRTlJlcU1rYi9rUlJDWTZPYUkxdTJobWN2czZhZjlJ?=
 =?utf-8?B?ZUxubmRMV3VrdXgzUEdJL2hudVN3Ty96SnVZY0Y1WFRiem45bXZsMlU2SWtT?=
 =?utf-8?B?b0Jvd29DNlc3MU5mM0lURS9DMGd5ZHl2d1BDUmMzQ1VxaDFBMnYrNVUwdEU3?=
 =?utf-8?B?dFNKckRqSWxydWxadlNjNGQyMys3bG1MNXBYZ0xCa3pDMFlMTUdlUG54aHdS?=
 =?utf-8?B?emU1cWVUVUE0aWNEb1RkYzVhTXh2bXRneVZsQTZ2b2hoWGZTK2tIRWliN1V6?=
 =?utf-8?B?UTNMYWYzM3NaNWZLeUN0Q0dmd0R0NVcvQU5YNGZMSit3QWVoM1o5S0VzQTFT?=
 =?utf-8?B?anBJYjNSL3RPdmNsNnRReC9vYWRoZURmd3BtQWpDOEYySk91TFJnZXpValhB?=
 =?utf-8?B?QUlWVnJWa2loZGdvWGxRL0E2RFJ3aDgzUFpiaGJhWjg1V0hmRTdFWEFHNnI5?=
 =?utf-8?B?aTVpcHkyUU0yZ1dNVVBwSDhwZ0x3dzVuVjJFTTNDYTJUWmE0TDBaUTJkOFht?=
 =?utf-8?B?enpGY3YrNFhsRlZEeFN6N3lJOWNKamlIbnVsOGE2UjdIc21sajZOSlR2Q2VO?=
 =?utf-8?B?OTJtOTg5N0FtZTFBaXcrZ2pmRkpNNWMyVE5HT2lhTE1kK1NmS0d2QlJsSDBr?=
 =?utf-8?B?R0ZQa0p2bTlIQkJJcDF5d01NY0VYM0dlQWkxb0RiR2VBa29jWGd5d2NnNjdE?=
 =?utf-8?B?UEdHeThyV1VIdG9USk1aNUhFUkIzQkVyYk1lUVBOa3V0RExLY1pPZ2F4Z0l1?=
 =?utf-8?B?RXNpNXlITGplUmxZWFdlTTdkZU9zSDNIMC9XQ0Zvd3gvVXFZWXZ6OUpVVHB0?=
 =?utf-8?B?Z3BTNUhUVzBnenI3RU8vbjQ4aCs5MnV2NFpjVUtGZHcyMS84ODdoZ1A2d1Zn?=
 =?utf-8?B?KzFjV0sxUUdKLy9mZXkybnhwc2ZsN2h5QmVyb20wRGZ6YWwrckVmZk94eDBs?=
 =?utf-8?B?R0p6V0ZnaENyRmJlRWZUN1lqQllBR2MyZ2NEbVVMcWNvUm8ySHVzOFBXTHds?=
 =?utf-8?B?SS9DNGNIOEppblNxbjMrcmZKTlpzTmpxZDZ3L3NlUE9odXN0WXJwQXV6WlFk?=
 =?utf-8?B?RGQvdUtzQTZtWHJFeUVwSXM5L1piZ3NWT3FxNzNOL2RnQjZEcjVGWlpKZ0xI?=
 =?utf-8?B?bDdoQzNUd2NQUmxOWUEzanRpMFg5R2czSlQ0elRhM285b24yRHBPeGFFYWhz?=
 =?utf-8?B?K0ZhUUdtOEhzVWt2SGY3ZDU1VC91My95a2VqeXRUWnpVVHkzbjhZU3k2Rk1o?=
 =?utf-8?Q?JZyIqm02OHYqsZQxg+5vCU1lf9eF/h9K?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1JPZysyWXFyZ0JNWkZtZ1M0V0JGVFkvSExxRWtmR1hrdFY3eitnSmxSTFZG?=
 =?utf-8?B?MjhFT3NPdHYrdmcwWUhDMVJ1VVJteUg5STJxS09pSGtmTGRUZkhMMlNMUHp3?=
 =?utf-8?B?TGFjaDdIdGF3Y1Vib0hMWXhQZnVoRFA0UmxDTWR6dlB5ME9UZmVQeWZoNjlo?=
 =?utf-8?B?aGJtd0FLc2ZJUmtlT2NqTEc0eWJOdTBTc2J0cVM3ckVLdi9GQUNZdzVMRTlx?=
 =?utf-8?B?VjZDM3RGZVd4bXdvN3dlWUFLUmJNeE1nWGpSdC9LSldrZGMzWmg1YzR0OE5G?=
 =?utf-8?B?d0lDT1JvYjI4dGdWUU5YT2l3eHQvZ1R2Q3dmSWFWSmtwWjJ5WEZHUU4zTE1v?=
 =?utf-8?B?UHMxTyt5WWM1UnBYdGl1dEdDRCswRlFldFFUVjU0SWZhRTc0aEEzZ1JLNWNz?=
 =?utf-8?B?T0NrSGpKRmhFSkx3czJ5eFZlTXUybTRhMDB4b2JxUGNPMjZWTmNBNGJ5Qk5C?=
 =?utf-8?B?Mnd4RWRNSnRxdW9HYVJaMm5FdUJzWDFKTy9MRDdEemJDMWVyVEVBQkVBbkRF?=
 =?utf-8?B?My9oMmhKTUMxMmJ6RXI0L3lhS3hGNnNsUmwydEU5ZHBLd2RvSng0RDgxeG55?=
 =?utf-8?B?SGI3Z2N0Sy9VL3ZBejFVN2xRbG42MU5SYWN2VDhwNDdjbFhETnlUb0w5Ym5X?=
 =?utf-8?B?OVBaNmVIdDhLN09BRDFmMGxzMldWR2hYeWRmMmlScngyVVllT1ROS3haS2FD?=
 =?utf-8?B?SzF6RGx1aGU5NDdvUDVLaEFLbXNJQjZiZU8rQmtEUTc4bGM0LzRRMTN6WDF2?=
 =?utf-8?B?VkI3SkhsTHdCdUZHbnQzVkp2dzlJNjE1WjRXdEJkZVNWdk1RZjFLS2VnZWVS?=
 =?utf-8?B?OGVRN214SUhNbGliZDN0Umc2amh3MUZVNjNoczIrUm1PWFdudWcxaWY3aG9h?=
 =?utf-8?B?eUFqcW1BS3RwN1RCQWFzaTNMT0ZiVWNwRC9rcEFxS3V6blg2NnQvTmo0STEy?=
 =?utf-8?B?STI3bjRTaGpGSW9tUjFkWGVLWDZpK1VmMnp4UDdlOEtOc2cxT3RuNzVkZDI2?=
 =?utf-8?B?S1VmNFpBOHVGVEl0UkE0aDN0VHVnM2pGdVNpK05IVTNaZGZwajBjaXV4MDl6?=
 =?utf-8?B?eFN2ODloOW5CdVJsbHdna0lFOGtkUDZaU0Q2WUo4V1JjTXhkeUl1M2JXYVhW?=
 =?utf-8?B?NkdzMHhyM2tsUDlkSk1aSUpxSUFxVWkvbEFHRW1pai9meWYrY3ZHb2RCak45?=
 =?utf-8?B?dUNLODZ1c0x0b3dxMFRmL29JUnYvcE9FMUJrTVVveUQwNlZ2U1ErTG5JUWRY?=
 =?utf-8?B?T2k0R1pXT2QzU2pMcUVCcm9GaTZDL1dHVGd5WUhFMHNGdkpHKzR4VisrOFcr?=
 =?utf-8?B?RXZSZGxKWW1Ed1FCT3NaMzFVcUNmSWdYdHo4ckw1dTlZRllyWGpwVitySmtJ?=
 =?utf-8?B?ZnE0Lzk0bVFlZjRiaitja3c0M0hiOHVwdWxpUGtRWE5PcHg1em4yZ05nRlVz?=
 =?utf-8?B?YXRvY1dmcnZJR3hvdU9qQnVuR1JQaXJjZ01WOXJWTUJ5ZExwczdMa0tVR2tN?=
 =?utf-8?B?MWRYN2htcm1uV0I1WGtibG9FRmMvN09YaXFiYWYrZ3NHUHdBWkt6RkpXWDNv?=
 =?utf-8?B?bGVLMXhhQTl6L2pTNVo2WVN0UTNZRUllYjdwWEpmZmxhVjVMejJUa0t5aFRx?=
 =?utf-8?B?cGZMS3NTaVNPOEt4KzR6ejNHWHhyVlBSeHZGVWxWUm5mOCtNaHg4MGw0YzhH?=
 =?utf-8?B?bTY4SE14b0hiRDJ0cmJMUWpCY1lCUlRoRzFCbG1tY0laTWZZTjhhZXlDeGkr?=
 =?utf-8?B?WVJOaXlsVXR4SGVTY3k0REV2NVBCOEFGS0labDJ2bEdIc2pydzZMTkptZmJj?=
 =?utf-8?B?WXFGZ1BadkVxWDJPNU5UbkhRQjRuK0dqb3ZPdG9lWWJqb293WXVaSlh6Y09D?=
 =?utf-8?B?UVJKd2JxaEFWbHFkRCtHNXI0NHNoa1FjN1lKY3YvWjhHRy9yNkxNMy82a2RF?=
 =?utf-8?B?UDBpK0F3SmRmc2UrM1dINjJCSVE1cVhaZ0MyOTFxRGVpOWlKUnBoUElRbFB6?=
 =?utf-8?B?Rkdpd2pURXV4V240KzQxTCsvZTBvMjVQRnpEU214S2YzaWlxU01mcmNDZnF4?=
 =?utf-8?B?T0JXUzlvMW5XNVNuM2t5OUE0bndTNEE1M3VQeXFMZDNKcE1kN1RXVThGL0Iy?=
 =?utf-8?B?ZjI3R0JkcldWQ1pxYlIwbkFxSlh4eEVydHBRdjBheG1vTFlqQ0c1cm8zNDhW?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F75F49A52F38F040AA6140975BC9FAFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8c87f7-e8a9-40ab-b5a5-08dd1f7a1161
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 15:38:49.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmobukXq6wjn/cI/N3y5xpAOfwzfoga+q3O+zzoUFrNUaaymWuS5haouEoB/xu/JPqXrw4yVlOXCpdxJCgmfdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
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

T24gVHVlLCAyMDI0LTEyLTE3IGF0IDE1OjM5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAwODowNzozMkFNIC0wODAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IFdpdGggRm9yY2Ugd3JpdGUgY29tcGxldGlvbiB1bnNldCB0
aGVyZSBpcyBubyBndWFyYW50ZWVzIG9mIHdoZW4gdGhlDQo+ID4gd3JpdGUgd2lsbCBiZSBnbG9i
YWxseSB2aXNpYmxlIHdoYXQgaXMgbm90IHRoZSBiZWhhdmlvciB3YW50ZWQuDQo+ID4gDQo+IA0K
PiBEbyB3ZSB3YW50IHRoaXMgYmFja3BvcnRlZD8gSWYgc28sIG1heWJlIGFkZCBhIGZpeGVzPw0K
DQpOb3Qgc3VyZSwgSSBkb24ndCBoYXZlIGFuIGFjdHVhbCBpc3N1ZSB0aGF0IGlzIGZpeGVkIGJ5
IHRoaXMgYnV0IEkgdGhpbmsgd291bGQgYmUgZ29vZCB0byBoYXZlIGl0IGJhY2twb3J0ZWQuDQpC
dXQgd2hhdCBkbyB5b3Ugc3VnZ2VzdD8gQWRkIGEgZml4ZXMgdGFnIHRvIHRoZSBwYXRjaCByZW1v
dmluZyBmb3JjZSBwcm9iZSBmcm9tIExOTD8NCg0KPiANCj4gTWF0dA0KPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5k
cy5oIHwgMTMgKysrKysrKy0tLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0
ZS5jICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKy0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfb2EuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKystDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jICAgICAgICAgICAgICAgICB8ICA2ICsrKystLQ0K
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hl
X21pX2NvbW1hbmRzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2Nv
bW1hbmRzLmgNCj4gPiBpbmRleCAxMGVjMjkyMGQzMWIzLi5mNGVlOTEwZjA5NDMyIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFu
ZHMuaA0KPiA+IEBAIC0zMywxMiArMzMsMTMgQEANCj4gPiAgI2RlZmluZSBNSV9UT1BPTE9HWV9G
SUxURVIJCV9fTUlfSU5TVFIoMHhEKQ0KPiA+ICAjZGVmaW5lIE1JX0ZPUkNFX1dBS0VVUAkJCV9f
TUlfSU5TVFIoMHgxRCkNCj4gPiAgDQo+ID4gLSNkZWZpbmUgTUlfU1RPUkVfREFUQV9JTU0JCV9f
TUlfSU5TVFIoMHgyMCkNCj4gPiAtI2RlZmluZSAgIE1JX1NESV9HR1RUCQkJUkVHX0JJVCgyMikN
Cj4gPiAtI2RlZmluZSAgIE1JX1NESV9MRU5fRFcJCQlHRU5NQVNLKDksIDApDQo+ID4gLSNkZWZp
bmUgICBNSV9TRElfTlVNX0RXKHgpCQlSRUdfRklFTERfUFJFUChNSV9TRElfTEVOX0RXLCAoeCkg
KyAzIC0gMikNCj4gPiAtI2RlZmluZSAgIE1JX1NESV9OVU1fUVcoeCkJCShSRUdfRklFTERfUFJF
UChNSV9TRElfTEVOX0RXLCAyICogKHgpICsgMyAtIDIpIHwgXA0KPiA+IC0JCQkJCSBSRUdfQklU
KDIxKSkNCj4gPiArI2RlZmluZSBNSV9TVE9SRV9EQVRBX0lNTQkJCV9fTUlfSU5TVFIoMHgyMCkN
Cj4gPiArI2RlZmluZSAgIE1JX1NESV9HR1RUCQkJCVJFR19CSVQoMjIpDQo+ID4gKyNkZWZpbmUg
ICBNSV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NIRUNLCVJFR19CSVQoMTApDQo+ID4gKyNkZWZp
bmUgICBNSV9TRElfTEVOX0RXCQkJCUdFTk1BU0soOSwgMCkNCj4gPiArI2RlZmluZSAgIE1JX1NE
SV9OVU1fRFcoeCkJCQlSRUdfRklFTERfUFJFUChNSV9TRElfTEVOX0RXLCAoeCkgKyAzIC0gMikN
Cj4gPiArI2RlZmluZSAgIE1JX1NESV9OVU1fUVcoeCkJCQkoUkVHX0ZJRUxEX1BSRVAoTUlfU0RJ
X0xFTl9EVywgMiAqICh4KSArIDMgLSAyKSB8IFwNCj4gPiArCQkJCQkJIFJFR19CSVQoMjEpKQ0K
PiA+ICANCj4gPiAgI2RlZmluZSBNSV9MT0FEX1JFR0lTVEVSX0lNTQkJX19NSV9JTlNUUigweDIy
KQ0KPiA+ICAjZGVmaW5lICAgTUlfTFJJX0xSTV9DU19NTUlPCQlSRUdfQklUKDE5KQ0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+IGluZGV4IDFiOTdkOTBhYWRkYWYuLjhiMzJmYWQ2Nzg3
ODIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiBAQCAtNTgxLDcgKzU4
MSw5IEBAIHN0YXRpYyB2b2lkIGVtaXRfcHRlKHN0cnVjdCB4ZV9taWdyYXRlICptLA0KPiA+ICAJ
d2hpbGUgKHB0ZXMpIHsNCj4gPiAgCQl1MzIgY2h1bmsgPSBtaW4oTUFYX1BURV9QRVJfU0RJLCBw
dGVzKTsNCj4gPiAgDQo+ID4gLQkJYmItPmNzW2JiLT5sZW4rK10gPSBNSV9TVE9SRV9EQVRBX0lN
TSB8IE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ICsJCWJiLT5jc1tiYi0+bGVuKytdID0gTUlf
U1RPUkVfREFUQV9JTU0gfA0KPiA+ICsJCQkJICAgIE1JX0ZPUkNFX1dSSVRFX0NPTVBMRVRJT05f
Q0hFQ0sgfA0KPiA+ICsJCQkJICAgIE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ICAJCWJiLT5j
c1tiYi0+bGVuKytdID0gb2ZzOw0KPiA+ICAJCWJiLT5jc1tiYi0+bGVuKytdID0gMDsNCj4gPiAg
DQo+ID4gQEAgLTEyMjMsNyArMTIyNSw5IEBAIHN0YXRpYyB2b2lkIHdyaXRlX3BndGFibGUoc3Ry
dWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV9iYiAqYmIsIHU2NCBwcGd0dF9vZnMsDQo+ID4g
IAkJaWYgKCEoYmItPmxlbiAmIDEpKQ0KPiA+ICAJCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX05P
T1A7DQo+ID4gIA0KPiA+IC0JCWJiLT5jc1tiYi0+bGVuKytdID0gTUlfU1RPUkVfREFUQV9JTU0g
fCBNSV9TRElfTlVNX1FXKGNodW5rKTsNCj4gPiArCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NU
T1JFX0RBVEFfSU1NIHwNCj4gPiArCQkJCSAgICBNSV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NI
RUNLIHwNCj4gPiArCQkJCSAgICBNSV9TRElfTlVNX1FXKGNodW5rKTsNCj4gPiAgCQliYi0+Y3Nb
YmItPmxlbisrXSA9IGxvd2VyXzMyX2JpdHMoYWRkcik7DQo+ID4gIAkJYmItPmNzW2JiLT5sZW4r
K10gPSB1cHBlcl8zMl9iaXRzKGFkZHIpOw0KPiA+ICAJCWlmIChwdF9vcC0+YmluZCkNCj4gPiBA
QCAtMTM4OCw3ICsxMzkyLDggQEAgX194ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhzdHJ1Y3Qg
eGVfbWlncmF0ZSAqbSwNCj4gPiAgCQkJdTMyIGlkeCA9IDA7DQo+ID4gIA0KPiA+ICAJCQliYi0+
Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwNCj4gPiAtCQkJCU1JX1NESV9OVU1f
UVcoY2h1bmspOw0KPiA+ICsJCQkJCSAgICBNSV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NIRUNL
IHwNCj4gPiArCQkJCQkgICAgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gIAkJCWJiLT5jc1ti
Yi0+bGVuKytdID0gb2ZzOw0KPiA+ICAJCQliYi0+Y3NbYmItPmxlbisrXSA9IDA7IC8qIHVwcGVy
XzMyX2JpdHMgKi8NCj4gPiAgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9vYS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmMNCj4gPiBpbmRleCA1NmJmMzc1YTlk
NGJjLi5hZTk0NDkwYjBlYWM4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9vYS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmMNCj4gPiBAQCAtNjkw
LDcgKzY5MCw5IEBAIHN0YXRpYyB2b2lkIHhlX29hX3N0b3JlX2ZsZXgoc3RydWN0IHhlX29hX3N0
cmVhbSAqc3RyZWFtLCBzdHJ1Y3QgeGVfbHJjICpscmMsDQo+ID4gIAl1MzIgb2Zmc2V0ID0geGVf
Ym9fZ2d0dF9hZGRyKGxyYy0+Ym8pOw0KPiA+ICANCj4gPiAgCWRvIHsNCj4gPiAtCQliYi0+Y3Nb
YmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX0dHVFQgfCBNSV9TRElfTlVN
X0RXKDEpOw0KPiA+ICsJCWJiLT5jc1tiYi0+bGVuKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfCBN
SV9TRElfR0dUVCB8DQo+ID4gKwkJCQkgICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVD
SyB8DQo+ID4gKwkJCQkgICAgTUlfU0RJX05VTV9EVygxKTsNCj4gPiAgCQliYi0+Y3NbYmItPmxl
bisrXSA9IG9mZnNldCArIGZsZXgtPm9mZnNldCAqIHNpemVvZih1MzIpOw0KPiA+ICAJCWJiLT5j
c1tiYi0+bGVuKytdID0gMDsNCj4gPiAgCQliYi0+Y3NbYmItPmxlbisrXSA9IGZsZXgtPnZhbHVl
Ow0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4gaW5kZXggMGJlNGY0ODlkM2UxMi4u
M2E3NWEwOGI2YmU5MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmlu
Z19vcHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4g
QEAgLTcyLDcgKzcyLDggQEAgc3RhdGljIGludCBlbWl0X3VzZXJfaW50ZXJydXB0KHUzMiAqZHcs
IGludCBpKQ0KPiA+ICANCj4gPiAgc3RhdGljIGludCBlbWl0X3N0b3JlX2ltbV9nZ3R0KHUzMiBh
ZGRyLCB1MzIgdmFsdWUsIHUzMiAqZHcsIGludCBpKQ0KPiA+ICB7DQo+ID4gLQlkd1tpKytdID0g
TUlfU1RPUkVfREFUQV9JTU0gfCBNSV9TRElfR0dUVCB8IE1JX1NESV9OVU1fRFcoMSk7DQo+ID4g
Kwlkd1tpKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfCBNSV9TRElfR0dUVCB8DQo+ID4gKwkJICBN
SV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NIRUNLIHwgTUlfU0RJX05VTV9EVygxKTsNCj4gPiAg
CWR3W2krK10gPSBhZGRyOw0KPiA+ICAJZHdbaSsrXSA9IDA7DQo+ID4gIAlkd1tpKytdID0gdmFs
dWU7DQo+ID4gQEAgLTE2Miw3ICsxNjMsOCBAQCBzdGF0aWMgaW50IGVtaXRfcGlwZV9pbnZhbGlk
YXRlKHUzMiBtYXNrX2ZsYWdzLCBib29sIGludmFsaWRhdGVfdGxiLCB1MzIgKmR3LA0KPiA+ICBz
dGF0aWMgaW50IGVtaXRfc3RvcmVfaW1tX3BwZ3R0X3Bvc3RlZCh1NjQgYWRkciwgdTY0IHZhbHVl
LA0KPiA+ICAJCQkJICAgICAgIHUzMiAqZHcsIGludCBpKQ0KPiA+ICB7DQo+ID4gLQlkd1tpKytd
ID0gTUlfU1RPUkVfREFUQV9JTU0gfCBNSV9TRElfTlVNX1FXKDEpOw0KPiA+ICsJZHdbaSsrXSA9
IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+
ID4gKwkJICBNSV9TRElfTlVNX1FXKDEpOw0KPiA+ICAJZHdbaSsrXSA9IGxvd2VyXzMyX2JpdHMo
YWRkcik7DQo+ID4gIAlkd1tpKytdID0gdXBwZXJfMzJfYml0cyhhZGRyKTsNCj4gPiAgCWR3W2kr
K10gPSBsb3dlcl8zMl9iaXRzKHZhbHVlKTsNCj4gPiAtLSANCj4gPiAyLjQ3LjENCj4gPiANCg0K
