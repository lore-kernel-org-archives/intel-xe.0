Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0E606A32F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TslZw20p;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=E1g06n6W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CC310E9B4;
	Fri, 27 Nov 2026 05:56:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B20A10E9B4;
 Fri, 27 Nov 2026 05:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795758986; x=1827294986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBGTAZvWurYuYwYxTAi+BXsfJTzVdtf6mMIzeDbBm2A=;
 b=TslZw20pcFOX1UHaqbwAov+3GTMQtQG6BbdekFQZX0Is9ea/UVSVOgO4
 /q7osKLUgqz6dGaU3wPJMgXltzRoTPsRwAJXmik9U7sYI4KCYc2ENA66x
 XUpGTmWrVn/VE4q9waj+eG2cbfWKLu0vW/sc6y2BFjin0SXtQTZKWlBvT
 KkUW3ccGfLGBRuTEVKuDymGHytuVzay8QOEYRgNSrJasEZXWXZmcbRh38
 qouPcNo8aBxmbBG07p6IroMdB5fvT3SpUnNnC3M9OacU16ejcscZh05/m
 eKOCmqmyLqJM0br05Qsz3CtgOAGfXjy1C+U/jqTjrl7Wf0Any2ceObNMi Q==;
X-CSE-ConnectionGUID: e33RcyA+SamE4K/poGnnNQ==
X-CSE-MsgGUID: JcPOh/FCTgCMMnRAhiiPCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4571829"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4571829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:56:26 -0800
X-CSE-ConnectionGUID: kV3cXNR/RiKkXZIDMPKFuw==
X-CSE-MsgGUID: Lvxo1PQnS4iFNZtnKqJCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12472145"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:56:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:56:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:56:24 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:56:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3eb3WWLqwjAAzwIKhprip6SKJzIJiVf5/H+enmlcuvWsNATLya1/nVuF2a7kANanJlKVZnUoT7eY4rbkGfehq/fqDGMmlaQy5fV3nSE1F6ZTJhg10CnExPVUgOKgpU5dSqiGNvXIXg6ae2dvgxd81cV4ALZiArVGhiB+WEqEiFdC6Ev1R9MF7IMM3TQ/UeG/vyhAyV9NKwY4tF0U8ao9VjcHMBEkfAT0b5aNgTwJ0gDd3zdlxfaBP6NKYOwUCXgqQ5TvLJb3swBR/l53W5fNy6TBs5Z7jkH4pE8x0vIWzZW4d7eCFzQDr3KOGqxfrOHLKegRHZG3E6f9lPFuVFmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN5ghuwZ23aKgk2OLuKrHJObOqWsM6ssHzBuG4s+AkE=;
 b=YF3jAsC5jUJhy90sMYaxsrDL7DPTSKGQe002t33kOgyGF5g7q807stREEGf0CVQAjCtdXRPdohHzj3z93RPFNgDBTHKhPfq1ljzPVH1BEYpmFzPr1+m7qOTlSZI74tUaNLaGNnddCZscIxRTX+a4DCzgnkWCII56PlYUoBRGny/u6NDGd0ZhnBaNAVfzz0CVwF8iBw0t2jsebi2Q/fnawb4pDEXV9Ee0GQWo/YtX+CNnUlX3JBoxIB+X1FlerRG5f65dKlKDgGYPupw1ycATjwXTyQ6hrDA+RYf/nkRJRLMbsMhliMWRnZITFGtAE4wTnNfAGWfww2oBSkTL1lvWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN5ghuwZ23aKgk2OLuKrHJObOqWsM6ssHzBuG4s+AkE=;
 b=E1g06n6WnsxvmbXtAsMNBaE96Q2zCMcwrrm3nzX90ltM0bBerp1cmjg2FExI/WAUoPgwLd4L2n4nvEjoWbNy7QxTBUdrEGPe/tRgii6D6ZD0/0IZBpR7DVcVJdbKHt3XeeYZ7zSyc3qXiw/TrLXMhJ7lGMI+uk0V9qTXyJc7kEo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:56:17 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:56:16 +0000
Message-ID: <2b1d0d87-bd97-466b-b55b-33461c4a7f98@intel.com>
Date: Fri, 27 Nov 2026 11:26:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] drm/i915/vrr: Add a local 'adjusted_mode' variable
 to intel_vrr_get_config()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-6-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::8) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: a86dfc2f-ef45-46b4-bc68-08df4c4b26bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Zuy6ZNobeLyai4jFT7f2OnHLThimHK/jX2oN1EOYgYNZ+Q7Xh+Q9vlMJrj2IGPgbn/8Eyf9/WfsXTjwGLS9vdUCasgH/tT+BPlSF9+Da7S8gfpJUa5YG57zIFgRmZTeAK2w+3aOMQaINorg7XHZcFvqV3wD6jTPx0V+d8DJE5p4w6zh8M55um8np971+ecklNR0onP688TnTdIXi65EfUnbXD2aBVSzzBPeFlQVGl/Zzt+m6AHIdnAQNz9EOTuSY8WWkSzny0Z0eBpyZEeVzFDuRfSM3aopIiHtqD05tV1RgshmrfhfiHA0Lsb1OjHhIiSH0m80WSq/ERXtdKUqagJbkkp6LkxzgLZSZG1py818dHeDXDlewjfRUx1IwO/LItHwbFiu5LxfbEtp2f5W2mHgxVY/dnd6e+/zQtsiZrcoz6OeOH0G1bPzxFvyDR1tIkOFAX5EfR1UcSQSLTJMZxSq0xcDXpesapD71/2hXhJayB7pWUX+tuQ122IkaYW/LaEs8whfXNa+OXq7TE4ol0POZ3XV53jPZiHpESvigFKXyWzvbfplV4BW07NMX2IAgsPSwjThbDGee6ubTU76/UlBkAN6Ee/TbtzXdCYwo1j0d0aFnpmJX/yhPNPoistxbE8dZzpEOhQV/V5QfBGJsj898lDRBrOymjL1Obo9+yCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022075727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGtuUEczM1hnN1U3emNFNGNmR2s4UzZBSGc5NWpIV2pJSFVBeFdzeXhwZ0JH?=
 =?utf-8?B?dU0yWEtTNUZKOTR5Mkk2OXhQTTN0R25aSUVLOU44czBKdWpYeDZlNjdjcm1o?=
 =?utf-8?B?azF4VmprYW10VDJudVFKMFp1aDhvbThONHJOanRtQVZ3cXRMSzUxNFpBckY5?=
 =?utf-8?B?K3VDTGVaYTlOZ2NBbkFOczZGTTRWWXJyUFZPeGJyZWZyRDZVRU1kYW1mRnpE?=
 =?utf-8?B?UzJhSzhNUDVqWmxiSkNoV3JHZkY1WERNV291dWlmNFhWY1grV0R2T0U5bGFm?=
 =?utf-8?B?eWZSWHpQaUhoazVINEtlcEcyaVE0L08reWRKdk44YmlLOUtzc1lZdWFHNHZy?=
 =?utf-8?B?Wk1kSmgvN3B2WFhmdERZUk5NRE1KRlVTYS9id25IV1ZyU2hFUHZlN1Y1dVFJ?=
 =?utf-8?B?c2dva0QxT0pwdGpwZC9rMHBoMXk3VHVrcmc1WklvWnduZFFRT2RNTm4rNi95?=
 =?utf-8?B?UzZSMHpJTnVvV2NzVjdpdStXMGZ5SmFHbHIraWhiRE5NWVdIY0I4bm1FcVlj?=
 =?utf-8?B?Zm9rTlhMRDNHTXd1RnhIV01EV1kxbCs3MEh6MmZ1cVlma3BZaTN1dVMyTlZE?=
 =?utf-8?B?ZHRjUVVNejQxeTNZQzFVYUd0cWJlTEVtdkhtbGxMMDBxTFplMkFGWTFtOWs3?=
 =?utf-8?B?MEFaWEwzYWVJa0tGd0NCSHorTEVoRk1kbHhnY0V0VHI4MlpydHVxQThRUTd6?=
 =?utf-8?B?TkFCY3RZMW9uQ2t4MC82VmVnL3hFdnN2cGlsamVkczl0U3dxSWpRNmFJYm8r?=
 =?utf-8?B?SlYxZzl5R2Mxby92U29yL1VUNnN1RnVkRW1OSkVVV1o3NTZrU2EzNmVJU3ZF?=
 =?utf-8?B?STYzVlU5b2xGSElya0ZLNHREdkZuUVRyT1l1Nm45L0xuMUFGYXppb3FWd1c2?=
 =?utf-8?B?dU1rbFlmNDZCcnhiSnl2SUw4d2lzem1CelhkRGhOdk1OUk51d1I4akdsRS82?=
 =?utf-8?B?THlYVGZKeVR3b2IzL0tnOG9YMFBOd29aeFBWN2RKTjZkQ2p1RXJhK1BFSEhh?=
 =?utf-8?B?M3lLeDd4RDFWb3BoVWUyNnpQMFpEZjF2Y3Q3TmxYTTU4Snp0Qk9LdFhUdTQz?=
 =?utf-8?B?dnU4L3QwR3Y1VGRYTDIvSXJYSW5HSVV3TzJzNXM2VmwvUjNhNldNS0x4NU1X?=
 =?utf-8?B?cGFqdGdiVDJKTG5oUlRQUFE2ejd4Sm5FeHpIQ2Z0K3dZaWdnOEdydnlUaGx5?=
 =?utf-8?B?VVdkOHhubEV5SmNheUNDenZISnRYcElsV3FncW1CR0RidFlGQjU0NjdJSTVD?=
 =?utf-8?B?c0o5dTJkckxJQTZsTnRVYUtWekxqL2dxZld3RjVQL0s1YVlna0pCVUV0ejBp?=
 =?utf-8?B?c1hCS0RqWThuUnRDSHVsaFhyalVGYVJiZzlJVktTN0h2N2RwcW1LcEpheGlP?=
 =?utf-8?B?dGxvclgzZWR2MWtJL2liSnhCbmxLaWFYcnNUWDBJeTY4OEV5bnV3b2pYeVg2?=
 =?utf-8?B?V3ozV3QzdU4vVFBGK3ZpbTh0Vk4yTkU3WjlPNWhXRys5alVmYkFmaW9sYUda?=
 =?utf-8?B?SllFd1Jqd0MyQ1dXRmZadzkyb3lFM3hCMnlkbWlMU3VHUjVsd1g4b2FnSHVw?=
 =?utf-8?B?MGtLMTlyME0wZmVIcnNmQkFpNXg2ZVh2eis5T2FlKzFOOURJTUtXVjNLTDUr?=
 =?utf-8?B?dVZ6dEVWRzZjd0hGbE40Njh1OFcrWWNkSGpZbFk5UWYwUVFmTEVUUFNoWUYw?=
 =?utf-8?B?anZDb1dZR3B2UFBiWmJnaUprRkQrbSsvc1luWUhQNUJpbjRkMUYvNUx4TmNt?=
 =?utf-8?B?WE5YcFo5amQ3dndlMXpoVXE4bUxNUlJFbDM1ZWt2Nnc5ejdCYmVkSGJDUTd0?=
 =?utf-8?B?M0YrMktxK00yTXpxalZXMENVNWhsNHJFbVpLRmhsc3FJRklXaFdYY3FqYUd0?=
 =?utf-8?B?QzRNR0RaY0VmR1hVSkt0cFhVRU1PUm5LY2pPWjRIaVhqUzNKbkhTcFpSaXRp?=
 =?utf-8?B?OHFSTjV3UUUxTHFBU0FuNkZpcXdkVkdrcW5ocWJydlA5VG9yNStsOXNaVmlu?=
 =?utf-8?B?clJxQm1mRUx3YTNGWU1zMXFPWGcvU080Qmh1RXlRdVgwbTZUTlBhTVdiak9F?=
 =?utf-8?B?QzRqRlBWc1NXR3RUZTBDcTd3TlJGcGdUYlMxNW5lM3dJSklZb1ZLZmxWNFFR?=
 =?utf-8?B?VzgyaVFMa1lQTEcrNlpXazBOMFNwSFRoZnJkZ3FEWjUxL3NZcEJ3UG9FVFNO?=
 =?utf-8?B?QjdOVXBpbW9uNm5lNVRDdVdOWXhHaUVKR2h0VUpzTzYvSU9zY3dOTUNVNDRH?=
 =?utf-8?B?cWxuenlVU2lGL05DQnJJNVMycUZjbVd2RlFhZFowTy9OMUg3VllGZlQ4MHNo?=
 =?utf-8?B?M0RIdkhTalRlM1N1ZFRPQmJYei9hOGl0SVhRQm1vNTYzTnpUK1FUOCtWbkhC?=
 =?utf-8?Q?9LFQ6zyX0LmOOP3c=3D?=
X-Exchange-RoutingPolicyChecked: JX6vOYchdXGVcFyzdwQto7L69F649A9GVnEeI6x2lWu1MVGhWmpZxmV9OKd6f3j6B3AqlEO37C4GFhu348+MaqNWYA37/tjop4jTlFwsvPJi+PHFlo/CQcwlN1JCj62bHW7AgMIgj+cTRiatrClwud50EaGvyVgjq+000vc9CUEAesSEjTYto8CWGksR4OFfGcg8hfaZD4Xukblus5+hrknZ/EdZmu4Yl/dEHgKKIaWFqKB1JgCA2BDbzNw7N7rBHDgpow7CdovVvMkGTZBOFXIwzfMv6Z+FjHctu6WI9/mRUiAE1kuQtgfy1YNcfuSRxtecEDIrSS/Kug3rGQao4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a86dfc2f-ef45-46b4-bc68-08df4c4b26bc
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:56:16.8812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7QPOf9gcKhC1+kS9xmjAaWrsCuCaiwhRVv4p9uy+c6227OCx2rzVh2P7MxOTTHefRfpGrdIx7kctsrbbCPA7UFvNCtRYZod2/PD8L4np0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a local 'adjusted_mode' variable to intel_vrr_get_config()
> to reduce the noise a bit. This also makes the vblank_start adjustment
> visually similar to its compute counterpart in
> intel_vrr_compute_guardband() (which already has the local variable).
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM.


Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index b1721b0bedff..9ab62423a1a6 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1099,6 +1099,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   	u32 trans_vrr_ctl, trans_vrr_vsync;
>   	bool vrr_enable;
>   
> @@ -1148,7 +1149,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   
>   		if (display->platform.novalake &&
>   		    IS_DISPLAY_STEP(display, STEP_A0, STEP_B0))
> -			crtc_state->hw.adjusted_mode.crtc_vtotal =
> +			adjusted_mode->crtc_vtotal =
>   				intel_vrr_vmin_vtotal(crtc_state);
>   
>   		if (HAS_AS_SDP(display)) {
> @@ -1183,8 +1184,8 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   	 * paths as needed.
>   	 */
>   	if (intel_vrr_always_use_vrr_tg(display))
> -		crtc_state->hw.adjusted_mode.crtc_vblank_start =
> -			vrr_vblank_start(crtc_state, crtc_state->hw.adjusted_mode.crtc_vtotal);
> +		adjusted_mode->crtc_vblank_start =
> +			vrr_vblank_start(crtc_state, adjusted_mode->crtc_vtotal);
>   }
>   
>   int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
