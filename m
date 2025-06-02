Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F8AC5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBBB10E199;
	Mon,  2 Jun 2025 23:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEefA3lL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982610E186
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748907187; x=1780443187;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=E4/E+kgUsRElMa3wL52QtuRPQo3wsAtVvoghJVwkGcY=;
 b=DEefA3lLopZ9HaKwgT3uHaxgUWmyIo5y6CtxmqbUoFYr2HlB3tAca+eP
 GP9uYvjhY6AH4sH5DpHpOQCSVIzGqg6+BbQMmV69c2H9RoGvu1X3rZDiC
 ChKZ+gb2eJyhean614IyEb+s8UB+iP813EqARR3tw7/Yq60xZGQFlGZ2C
 S4LQKpYV8LdTf5Rk0CznZbQTIc9I5KRhg9yemxFnOplXNh3Ozea2ZeMlB
 svSZtrj6144XTqeZzK8MpGiSPyXAJrstni3j3a/Rw0uH3az6i4DK2p+c9
 nPZ13JQhetoB0BoM+FH9AxznD5uSn1puL6Ub2PVy06UvTkoZvrVE6GaY0 Q==;
X-CSE-ConnectionGUID: ErsPMJdiSSON9Kc7p02cMQ==
X-CSE-MsgGUID: LCkaZaPoR5mSWXLalZWOBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50845130"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208,217";a="50845130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:33:05 -0700
X-CSE-ConnectionGUID: iANkkdirQWGwVLPVDG70Jw==
X-CSE-MsgGUID: BgWzbdIORDOpRZ88ZVonTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
 d="scan'208,217";a="145608946"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:33:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 16:33:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 16:33:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.82)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 16:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLl76OsBtjET/UF56H/EG6D/NXEgl+cYSJHzjEBQhHUqrlSrqFsNK4I8qftl5XwGlRWx30nCXCX4KTLhteEpl8bTpAnsahF+wWC9yUF3iGeTOk5DH/+/RMMXckZxuJKPQZp24mlSsJFJ+hKMnAEPqYapZige7rAA60L55OBxZYkA0507kC+W0qKMbMC7atu5uVsSUuDHCkrRswM9ycbFapCEsMQskSzxi+rRWJbH6QBHa226duOQ/nL3drpSQ4MghC3PoqYW2+vXiVV2nXIY5VGAlcP/BdwjPFlWmgmaHdxAf9UDbRr42FWBzQIppyje8980R3eHA8Nk6OsufKRKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0gB1vIuFXZGxp1h8z1OpoAJgxBYqXg/aO10ecsnkaU=;
 b=rElrLHfdC+tztJsVz7Sev7Z58Gg0eAnW4pXOYUSzpVgLtE427CrZ3mb1arvwLlX9pgNY0v2DhDrJEYuORZSBfHflhvT7dzlv1Dnz96R1itbqtSzH/Lxzlb5jiDiGq5ldHng0GdADThE8N3tH3SgrALdNoRKGrtD678YYnsdgRvvi4VM3EUwM0qH/0yug68XX/4imI7UAz6P+fyHgL/esNo7Pfv4Gca6+lO++BfZoYGGUQPizL30FyyvFIt+1v9yRT3lfbkrlYJkIbnrH0BhPZPlUIJ20YV1JDqwjgegiYnTP7c3c48Weo4Vr1apFiZPkA/3YNrOVzinDyluAVhCL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 2 Jun
 2025 23:32:34 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 23:32:34 +0000
Content-Type: multipart/alternative;
 boundary="------------p52UlwQW2s4QEzjP2jLs5s2l"
Message-ID: <c37bdcfa-f5a1-4493-8f83-037e7895bc1d@intel.com>
Date: Tue, 3 Jun 2025 01:32:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/vf: Introduce helpers to access GGTT
 configuration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <20250602103325.549-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250602103325.549-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH3PR11MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 48afebcd-8a85-4c5f-f312-08dda22dc09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0plVVN2UVJIbXY2cHZMNXhjOUpFL1NMbm10ZFgyZkRiWmphSFhUdDJFa0JT?=
 =?utf-8?B?Rks4ZS9nTDE4ZUNRRGFDMDcrV3JmZTlLNVVUMnJpU1puWGVXaE1vWm1vQnNo?=
 =?utf-8?B?UjVGUUF0dWhkeFZKelhvakh3L1NZUVRSS2xEbXAwT3ZVZFRHMkE3ckpsdHZp?=
 =?utf-8?B?L0hMZ2lXMzdGa2MvMG4wbC9WaDB2MGZXRExkT1dWUHF0RlBOSk5wem1yNXZV?=
 =?utf-8?B?U2ZTYXBpQ0NlcW5NTjFlbmNnc1ExTjJHVWFaQU16cWNsT0ZNOXRGYkNqc0pp?=
 =?utf-8?B?cGhJbUU4cGlVQlpMVVI2eDFGa09qdGZHTVNGMU8zd0N6bURPdzBBVGM1REFE?=
 =?utf-8?B?eU4xWFIxU2V6clh0MmJWd3hDd0s0NXdSd0cxRVJSWXVObjRQamFFRmd6ZVhx?=
 =?utf-8?B?RGxPcy9kOVNaMDJxNlYzY25kMnlTbkdHRElENWpRczc1Z3NBRFRyK1YrZG1F?=
 =?utf-8?B?RkRNc1FJOG52QjFrNjNFK25UNVJxN1BXNzJ5RUZkZG8wUmptVmNBMUwrZElo?=
 =?utf-8?B?c3N2MWMwZWZHZjB3WVNwZGRTekVhSDljRXdkMSt2elgxU21GQ25TMSsxb2xH?=
 =?utf-8?B?WTJGTlFrMFZIR2hmZkdsaE9scU5OSnBUVGVQei9DTlJEWm80cXdzRVdtQWl0?=
 =?utf-8?B?UWI0L0lkUjRyUmNld3d1SGNGdlpPTlhtcm9nMWN1aWtEVHU5d014eExlTG53?=
 =?utf-8?B?Tm91bFZIMzJ3YlZkRGgzcmx6Nk40Vm5jQW9hN1FwanRMV2cvejJFVzgyZUdE?=
 =?utf-8?B?aEgvZ0ZhYkVqbTN0WTNRa1NZa3Vna2l2UWNtSTZlanJFclQyVXRoaVZWSzdM?=
 =?utf-8?B?WG9ZK0FPd1ZmOWNhMGoyb0RvN2ZhUGxuOXJkZXljajV2ZExxMGowWVhJeDVW?=
 =?utf-8?B?T0NZaTNFRlNQQ2V0NFZvS084bWhOM2toL3B3QnRBU2JyREVQYmcxL3VCQjRz?=
 =?utf-8?B?TGFkMjBkbkFJeVM4cjEzUzgza2s5d0tTY0lMdUwySStkWEhueUh6cU9BK0U3?=
 =?utf-8?B?MFBWUkxsUDk1NzF2UG9FNU8wRVZreDduZldLdDB5REExLzhQYjk4VkV4bWdT?=
 =?utf-8?B?MjZJRG5qVjg4RENGY21aOC9POUNiNm9lTFN2cjFsVnRIUFdYRTdsdXBRd0hS?=
 =?utf-8?B?NWZkc0phZVVWYitST1ZIS2sycGh1M0ovNS9jM0FkZXNScUFZL2VWZnRKM1Yx?=
 =?utf-8?B?TjNHa0FhZ3ZsRFk0YnNFdllJamlHOWJ3UnpWRHRoSFBEOVpKUHJtSngwbjk2?=
 =?utf-8?B?R2dITDBoVEZBRjA3R2JidnNsRmtGdmVFR0QxWGNRNGRxT3V0Mm9GcmsyKzJy?=
 =?utf-8?B?b1kxNjJqRHpCRysyS3I1NndzRjVCZERVQ05jcWg0Q0w1dWVIODZjUko1bCtt?=
 =?utf-8?B?WkFHODNQbzNjMm9rdDAyWnl3RDdLN09Hd0dFQkRmeFZJdURxTG9FOSt1bzY2?=
 =?utf-8?B?NVlNUm0xSWhWa3dkdW9OTHJaVkFQbjdZOXRjSW5Za0lLdVdPcDAvSCs3QWdQ?=
 =?utf-8?B?ZnVvWXd4TkhNaXdIcGl5bzhON3Npa3QyblhnbHVsRm5Fb004Q0M1MENRRjRQ?=
 =?utf-8?B?bnhqQUNPcndrZGdVbWNmR1c5K1dXRmxvMjNGQmF4TUV3ZTBFMVRVWGsxUUZu?=
 =?utf-8?B?Smx1OUJpZzBFa0ZheUM2QXZXZUF3Z0FlZDdsSEtwOUprNi9uQzFkVTdVaS92?=
 =?utf-8?B?ZG1obEFnOFBwMmR2REFudW16UkEzVDQyY3k1SEtobVhSM3lpNXEvUm1KNXZD?=
 =?utf-8?B?UEpQcVpZRFA0REN3dUo5bWpBcDhlb2UzWENVQ1lzaXY0R3BtRWNLUmxncW82?=
 =?utf-8?B?MXNyV1IxK2Y5cncyRU0reGVyOUN6cnowMTR5dXN3L1o5NXVFQll2bCtoSnBa?=
 =?utf-8?B?U01MeFJha3ZpRTVGa25UUkFWckFVUzlRalZsckJxWnh1MmZzQllmUUZhZWhq?=
 =?utf-8?Q?Vl0SQK0yHoM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVHSWRJUG9ISWxibUFoQ3BMWi9ZR2QyUVEyOUE0S1VBUWhYM2J1OW5saktV?=
 =?utf-8?B?ZWZuWmRHS0lZMFBZZHk0dGM3dVVueFhGbHdlOCtmRk1MMWlSWEJtVE5nYmhE?=
 =?utf-8?B?ZHkwTlQ2c3h4REJUVFMvWTZaeGdobkJFT0pYZ0NOcmpLY2NUakZSMFFwS21o?=
 =?utf-8?B?WFFXWVpsOTkraFo4RXhRQ1l0VnhnSDRVR2MzMmhmWld5eGYrdFdobDNycTNx?=
 =?utf-8?B?UW80UnBJUFc0R1F4bDcrZ2d1cWtGS1h0UG9yWjJZaG5HNWo1MUVMdnV6RDBn?=
 =?utf-8?B?WmFLSFhhOGo5TC9MREJDUmNkSGF4Y3MydWNLaHo2TFRjVFBuNUhKYTM0RTZ2?=
 =?utf-8?B?WGNoclgrNTdoTGhsQ293ZHJFT1hIMVVSVjBMaTM0SGFOSlhJRnJZbDIrOXNy?=
 =?utf-8?B?UjFTN2ZHNTFLbUFaK2k3VTBVWE5WTE5kQzBFRHlyTmdPQTY1dlVZOGREODly?=
 =?utf-8?B?VkJNUkUyaVo1bFhLN1VxcVZkVytPaXNZaXRvNGtoRFMxck9oZGlSN2hMdUhM?=
 =?utf-8?B?bHdOOS9ZQ21OT0JMK1NUWFZZMitXblVXd0pOZlpxZ0JNRnA4OFhBWGdVWm1z?=
 =?utf-8?B?YmRpTTVrOXk3TlQ2Y08vR3VwQk1CL0IzQy9hTUtxSWZHbUdwK3JzUklCR1FF?=
 =?utf-8?B?M3NRa1ByZjB5TzA2Y1JXTktOVmNNcDlOeTBmQ0twaVdWZVBMYTJtTFhRRFdy?=
 =?utf-8?B?L3J6M0tha2tqVzdFbDY5WndQd2JvSlJJZGJOMktJQUVPZFRxamRtREovMXlM?=
 =?utf-8?B?Rjd4amRiQkFvZWZtTlc4N3NCVXBvdFdaYms2L2JoeUhtbzUzY0RsWUpHOGNW?=
 =?utf-8?B?V0RtRnhYOWxGVDNMcmlPNHo0M0tPWlJkNTVvUjQxcVpLRFRqbWNVRytJK3hF?=
 =?utf-8?B?YWdYMDhnWDFSWFVhUDFpMGQ5cXZ6WGhlZy9SOFhHVDEwY3JLU3FrRkNlWERF?=
 =?utf-8?B?cytEb3ZRYkZoeGpJVkZFR1VvcjJqVHZ0Y3ZOelhLSUlZNGJwY2Z6eXNiSzJE?=
 =?utf-8?B?MHg2S0JmVUR6Nm5wckd4NktYK2dxQ29FZlRWQ0ppUWdLMDVTdkFaa05PY0Ev?=
 =?utf-8?B?b0w5TEJSbmxBckFvc2wxRkw0VFZwVU13Y3Y4ZlU1RXlqcnBwT1drcWxnNXFj?=
 =?utf-8?B?ZG92RlRORWptODdNV05vRzFxUHI0VnNld3hWbjE4V0RHSzJvVVZGYzlzT2xh?=
 =?utf-8?B?MTA2TmdlbDFoT2lsd2JiZUlsbEpJRHNiWGl4cmtoNmk0YmFKdGdtQXJGTTdS?=
 =?utf-8?B?UjdOZmtlWW5pZ0o1Y1d0RE9acVlBSWhsNHplSjRGTExIWmRNVDE2SzRVcUMy?=
 =?utf-8?B?U2IxQ1ZaaDZzbDk2M01qMDFQRFRzYm12OGNjVy9kZEdVMDEzWWRwK2d0bGZv?=
 =?utf-8?B?TnF5TVZXM3NEeW1rR3NobGZvcUY2SytLZVB0RkUwQlhVZVBlQmhKc3JjK3hC?=
 =?utf-8?B?Zk1YNGI0WWdRaUV3aU1lTVZjSEtSUUpEd3pPMjdSRTJhTjVWT3k4QVpXODVU?=
 =?utf-8?B?M09vQzBCbFdUbjNxb081eU5rOWlRZVcvTHR0VXgwbkZTZzkyTDliUUNUa3pC?=
 =?utf-8?B?VU1nZTdUQ2dmWFNHb1ZtL01uTjZBTTJoRXBDdytBOEx1VUgvVlgzOFhHRVhY?=
 =?utf-8?B?aG4vYTFHY0lQRjQyTnc4RkpDdjA5TlNiVW5wVnNER09rcDBmZXBpNy9hY2o3?=
 =?utf-8?B?WWpDYUdPUWNtbEtDUjJYMXFobVMwZy92MGR4Sk9vWnN6WjJPOW91ejVKZElr?=
 =?utf-8?B?TzdaemU0RjZJajRpNlBya29hSnBqQUxJTllrbFJmYTcrcmhkR01oR1V6NDlx?=
 =?utf-8?B?SStRWFlHc1d2OFcrOGF3ZTczWmFtTkdrcExaR0Zwc3dLVlAxZDNSSmZoYVNL?=
 =?utf-8?B?RUZ1dVFBaHNrNEdZdEdzclA2d0F0bE1uQmMyZEVFVVRVZlZRTSs3dC9xKzln?=
 =?utf-8?B?L3YvbHk2NW5ZdVpHRzZHRWJmNitOc2NVbkFjTTVIUlNrVnoyLzhmd0JGWnNC?=
 =?utf-8?B?ajdJSzdXTGNLZzlEL0x2MmhyOEtRd3V6VUtneWJWYzM2OGlQbms5VFpXU1Iw?=
 =?utf-8?B?YVQ4eTdESVZTOHdWck9BK3Z3U1hvK3FaRy9yL2Z4b3RPamhjMGgxMFpLSW5o?=
 =?utf-8?Q?MOaaf84D6piGkZ3XD0QWhlIyO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48afebcd-8a85-4c5f-f312-08dda22dc09b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:32:34.8337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSCVMmqcPAab0C57aiMRqOa2/zHlI/mBvaENcUE96f8XF/zv67yS9O3AFeWpKmlZpjCj0misZ7MgJKHFwmeWrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
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

--------------p52UlwQW2s4QEzjP2jLs5s2l
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 02.06.2025 12:33, Michal Wajdeczko wrote:
> In upcoming patch we want to separate tile-oriented VF functions
> from GT-oriented functions and to allow the former access a GGTT
> configuration stored at GT level we need to provide some helpers.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>

We're not changing `xe_gt_sriov_vf_balloon_ggtt_locked()` to use the new 
getters,

instead we're making the change when moving the function to 
`xe_tile_sriov_vf_balloon_ggtt_locked()`

in the next patch. No problem with that. So:

Reviewed-by: Tomasz Lis<tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 34 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  5 ++++-
>   2 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ff7ae1a5f16..acfb3b1b0832 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -561,6 +561,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>   	return gt->sriov.vf.self_config.lmem_size;
>   }
>   
> +/**
> + * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the GGTT assigned to VF.
> + */
> +u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> +
> +	return gt->sriov.vf.self_config.ggtt_size;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: base offset of the GGTT assigned to VF.
> + */
> +u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> +
> +	return gt->sriov.vf.self_config.ggtt_base;
> +}
> +
>   /**
>    * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
>    * @gt: the &xe_gt struct instance
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 9db41afddd5a..2f96ac0c5dca 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -20,7 +20,6 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>   int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>   void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>   void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> @@ -28,6 +27,10 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> +u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> +u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> +
>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>   
--------------p52UlwQW2s4QEzjP2jLs5s2l
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.06.2025 12:33, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250602103325.549-2-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">In upcoming patch we want to separate tile-oriented VF functions
from GT-oriented functions and to allow the former access a GGTT
configuration stored at GT level we need to provide some helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a></pre>
    </blockquote>
    <p>We're not changing `<span style="white-space: pre-wrap">xe_gt_sriov_vf_balloon_ggtt_locked()` to use the new getters,</span></p>
    <p><span style="white-space: pre-wrap">instead we're making the change when moving the function to `</span><span style="white-space: pre-wrap">xe_tile_sriov_vf_balloon_ggtt_locked()`</span></p>
    <p><span style="white-space: pre-wrap">in the next patch. No problem with that. So:</span></p>
    <pre wrap="" class="moz-quote-pre">Reviewed-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>

-Tomasz
</pre>
    <p></p>
    <blockquote type="cite" cite="mid:20250602103325.549-2-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 34 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  5 ++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4ff7ae1a5f16..acfb3b1b0832 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -561,6 +561,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt-&gt;sriov.vf.self_config.lmem_size;
 }
 
+/**
+ * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
+ * @gt: the &amp;xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: size of the GGTT assigned to VF.
+ */
+u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.ggtt_size);
+
+	return gt-&gt;sriov.vf.self_config.ggtt_size;
+}
+
+/**
+ * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
+ * @gt: the &amp;xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: base offset of the GGTT assigned to VF.
+ */
+u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt-&gt;sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt-&gt;sriov.vf.self_config.ggtt_size);
+
+	return gt-&gt;sriov.vf.self_config.ggtt_base;
+}
+
 /**
  * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
  * @gt: the &amp;xe_gt struct instance
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9db41afddd5a..2f96ac0c5dca 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,7 +20,6 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
 void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
-s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
@@ -28,6 +27,10 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
+u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
+
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
 
</pre>
    </blockquote>
  </body>
</html>

--------------p52UlwQW2s4QEzjP2jLs5s2l--
