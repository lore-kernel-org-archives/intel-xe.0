Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AA3CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 19:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EE010E8D2;
	Thu, 14 Aug 2025 19:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezYI+oFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3C10E8D1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755198593; x=1786734593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QFAJt796lxzitzfU9SuK+QeDGL0QGaYEtG8HIWQjFgc=;
 b=ezYI+oFTwOMdREpSvBDVsNQItjbyXAr7yl7xUKSw4XviI2PDJTUx2cG/
 6EzGXYZYl9pPBBvK7WERbxl+LdOeTGRPvJE3y/P9Bjn4GEi8oOse31oRW
 iHGKulYHDEITg7ZzMomcRRMLQ6OUpjZ2oCDsCd/+uv3IRDoPO+OZCz32x
 DY5opNb6EDD7UdBoNP/T2qT6YIfv21itOOdeY2vaJTUKFkFaKS9elmDkD
 +WbW57dnVc2YwMBT9UI9NTE2kCMwFkv5qEW0Zd8T0++uLpTXHYE4kQ+bb
 9LAdTYJdTxkJnJ/lsSLKMh8RJQKj08Y0USzfH30lOlUW4eE+77hkAmegW w==;
X-CSE-ConnectionGUID: OvmA6rrsT5CYXqigule5Ww==
X-CSE-MsgGUID: hGRRxh9JR+evTaRpvzIa3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57434287"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57434287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:09:53 -0700
X-CSE-ConnectionGUID: i8TITlcORwe5Gn3pR9Wv0w==
X-CSE-MsgGUID: YG+RxV2ARAuhNS/e5ntbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167645797"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:09:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:09:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 12:09:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3dWs5EZwugyO6sNg95sy22ct8XYjYKinb00ZpNS/VZF/WdJY9F+0gypdGCrzWj6GhJtGu8Yb5a0fF23j9IKymwh5KlLHcgLrLjSJfNwqKtSv+LLj6RO2/yzrTlwW0XQduC3uR9ZKr+aZqfbd5CgQUxUy9WT3d6F0SBrOEz1HfZTsB7XrPwpSfkMdSrfQcj8+xCb6N46Jobg3mZsVeM0BOmQOAUBmR3HBEdAHyFweChBgvZFabActkDAlQzSRrHa/N+Z591BfJteG2HVv+vF1v8k6XwDNCubuXS0BEEXlcAe6Ql4cht6+yP7nxqssubFPpl0vhhveqXu8jQQzcZQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ+10f7gdDOBL6qv44E/sxlE98z/YfU9TFy4If9jDrI=;
 b=ViTD0qUgG0AyHWJInixgFmiGXFpFnPSL9LWJwVrqwd092P8KGUus+5d5UlFUdE1j469ki3vjce3GFXPuZp/olU/su3wolZxvxhOrHr8qEN431VQ2qj6ZlTb7we6uK1W0LaP40QO83/YPUM9GMdNutyia57njTiQohC8Ei4oM2c9XSO8NkILwwRQxDf1qpM3iwDyM7bsivVa6oxWGWnWVabVhtixJAH/3q09Ah1lxnpFmpGoMPgysw4N70dZeWj84MWglApNtGZ3P3YsHiNRG3s6DAddfvAL+S2oyQ0TXXTh9UjmbriuRtJ2a6KNiIQxJ/DycIpRCU44Q/Sbicqp6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 19:09:48 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:09:48 +0000
Date: Thu, 14 Aug 2025 12:09:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 04/15] drm/xe: Pass down drm_exec context to validation
Message-ID: <aJ40eE17yUe0eX3y@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-5-thomas.hellstrom@linux.intel.com>
 <aJzAhDRi9W+iKl0b@lstrano-desk.jf.intel.com>
 <0a49981498b54d10aabbe9995975f88616c8810b.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a49981498b54d10aabbe9995975f88616c8810b.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ac63d9-78e1-4d89-38d9-08dddb66230c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9EWTMzYU9QK1lmaE9HNDJYekdRaWFkZmRDTjc5bUY3ZExtK0YxMDB5algz?=
 =?utf-8?B?SjFJbURmTVRhWGZ3bWRLbFQ5TzNpaG5Hc0ZsWWNjRDJOT1Jiak01d1NoUCtV?=
 =?utf-8?B?MkZXc3pSdU56aEMxbm1FWlVBRzE2Rk9qZHB4SDFJWXBBZjZBUTVUQ3lSQWNS?=
 =?utf-8?B?TXo2WXdzeXVHNTRVUUZZdlM3TmlmMXVRR1FWS2ptNmVKcnNhTXNkRHVPZGVL?=
 =?utf-8?B?UU1tdE9pdm5UMnAzMjZiSWd6YS9DZFdadkU2TUVQU3RLSU9rck1peWZxVmE0?=
 =?utf-8?B?WEJGQzI4b2xqQy9hQ0lCS0dqcTZUSW02RDA4cHJYdFhINDRCYkROSUdwcDR2?=
 =?utf-8?B?d0JuNkY5K0srOExpcnZWeHN4KzdUKzZLbTZ2UjJMNkI5WW9MUmVZaGQvai9x?=
 =?utf-8?B?YTErZkNWdU5DaFlKVVlOM3NWbmVkOWJlVDQwLzJWU2FHVytraWd1em5tN202?=
 =?utf-8?B?UDRwZW5zQWdyY3pKOGxMb1R3dFpXUXpsVVNWNFdjMU5oOXRhMjJyTkVRTFdN?=
 =?utf-8?B?a0t2dnhXUGNRdTFJT21ZYnNXdjczZzdtdWk0RmY1b2xiYXVXcmVvMHBadEl6?=
 =?utf-8?B?TU9GM2FmeWozcWVpMDltc3h4VnJweXRNWWtVVWFadjIxU3JzZTc0b0k2TExM?=
 =?utf-8?B?dHU3aS9qeW90VEhqeWRKUjUrQ2ttSXZ2enJWRWhQamVlbWs4UlNjWHdRUWxG?=
 =?utf-8?B?aU9oZ2diNzk2OHpOSGFmU3pIaUJoWHZPR2w4M2pDRUNBd21hRDhzOUU5alR5?=
 =?utf-8?B?djRxSVRYUkx2Z1F2bkQrK29XM1diM1dKckNabFFkeCtIeG05VmNHbXgrdytF?=
 =?utf-8?B?Q0s4b2VsM0JId201cDBLdnROYU5tTHhGa2NUY1MrL0FTNUFUYkxHZ3p0MFhW?=
 =?utf-8?B?WmlLVTh3U2ZyQlRJdUFYbXJPV1lsSFJPMU5rQzgyWFNmd0d2WCswVjZQSG5p?=
 =?utf-8?B?ZXhySkZVcnZaMWp0cEs3L090ZXRuS2RnQU9CL1l3ZHdxUlVjcW5qK3lyTWIw?=
 =?utf-8?B?amxEdzVKS2t6eUJyNFhBQjNWK0Z2eHA1YXQrcGpmakZESVVlWUNWSEFBSHFE?=
 =?utf-8?B?cGlsWk9lajRlT2VWSCtVK3JsVWloODJUemJFNjJuRW43d3BIcElxbnlpVDVU?=
 =?utf-8?B?eGJzanJWV01vQWZTeld0OSt4TE45ZEdFcGZ5VE5PNis0V295Ky81SXBFdkQr?=
 =?utf-8?B?aXJWTDlqMzZscXhOKzhEVm1yUWhGN2RUa3FselQ2TDgwYWZYMm92SlBubFN5?=
 =?utf-8?B?dWcxQ3FRU1VsdUZRVTZqMWcxOWVXamtBUThFL3h5QUswdzF0aUx1ZnR0Wmpy?=
 =?utf-8?B?Vnp2KzAxb2pWZDJRYStSVDdSRlNPNDNTWVZkSEowZGVldTlvemROVDFLNDhI?=
 =?utf-8?B?YzRyOFIySnlKaU5xemhLUm82SzFCVXVRL3RpcFlBSHRML3p2eC84RjB2Q3h3?=
 =?utf-8?B?TWpkWi9UdG5kbXFtUjBoK2gxSVFNc25WK3o3dVNVempmZXJZQ2llU3pJK1Zo?=
 =?utf-8?B?N0ZYMlNSd3luekFqa3lodU9FZytjU2ZFa0ljbWxrblNWUWNsNjVuamV1alor?=
 =?utf-8?B?aHZSM0RxOVBSQ0lDWi9zOEY4SnhBenRtdDEya2xtQk9tN3FmNkdhR2FVbHJx?=
 =?utf-8?B?ZFNRd1h0QnAyUmZQYlIxTmprTG1WV2Vub0xvZlJFWHU5elhtaE9LQS9Kd3hq?=
 =?utf-8?B?WjZQTzNJRWlBeGVBUy9wMkxiNnlIT01tMUhHNkFUaHNITFFvK1pFRnVUUERx?=
 =?utf-8?B?U0VpYTc0Qi9FNEZPQUk3MU1uWTRPNVRteGpsUnlNVkYvay9vRWdSbG1DMlhi?=
 =?utf-8?B?UGY4dHNHK2kzUWhsRmdnYmZlb09tZXpFVm54UmxacUJreDZLdWVKc0lUMlJM?=
 =?utf-8?B?bXlWbWdHbVBLVEJNRVBZaW5HWjBSalQ4ekwxY0tYSnY5MkNkWmp4V3RUcTF0?=
 =?utf-8?Q?04dwkvxm7XI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkxMNUhYS0svNC9PZkN4UU83Wnk3YXVGUkh4bmZmeS9TclNTbXJNNTZYNnRq?=
 =?utf-8?B?Vk9ZcGhheHp2Uncrbi8wZ25ObXJZZ0FFV3FldkFXNklkQUFoVmRZVElzT0ph?=
 =?utf-8?B?c2NNQzFRczUxRU1lVCtUS0tFR3p6OXFxc2JPV2NUWjVYUW9aWW5JSlJBTGl6?=
 =?utf-8?B?RkJYSjRUNmlocXcyemFaWW91NmV4UUZnazMyZGdTT3F5bHplWVkzemFNb1VR?=
 =?utf-8?B?emxuQWx3bVM5MDdBTFdiaGo0Tk1mWnAxWGdBOUdvSnkzOFhzNGJPcnloK2Vr?=
 =?utf-8?B?bVJ2NVMxdS9DRTdQNmxyYWlrRTUzanp1NEZXY3JHTFZLTVd1R2JMM24wQm9x?=
 =?utf-8?B?dnJVRGJEeW1LWlBtV3lncERJMmZmZlN5cnd0cEMyaVYwWjVVaWJmUjhJbjVj?=
 =?utf-8?B?eEE0Yk5lYnlnMlFuN2o5SjZqS2JnZVE4by9aSXh1VHpIUHJaVTN6TE1uNzQx?=
 =?utf-8?B?U0VNNzV2R0VtdDVjM3FIZzFZMVZLbVkrSk1rTnZqUkRJaE5TTk9hb3c0RHEw?=
 =?utf-8?B?Y2VXZzgvWkQvdHJ0TkM4YzRIN3JvZnhLc2t2ZFc3V1VhaWU3aW1PaEpPWDNX?=
 =?utf-8?B?VTNFN3pxL2hwVzNXSkJlQmdOWFlqMWt3clRWWElmR1RBSUozeDhHbHhDbU0y?=
 =?utf-8?B?N3lPTG5PaXpaU2RkY0hrZ1dFVEcrZDZpZjJWYm5HR01QQm4wQ3pWSFBRcEJn?=
 =?utf-8?B?ZmJmMEdvTkdxR1hmM2NQbnpnWDc4Q09Xb1h1eTdNaWVTbW9wNW5JMHNVVjV1?=
 =?utf-8?B?d2d6WU5lSk1uTXhUNEdWZVA2M0hYbWtIOGs1aFNaUkRZS3cxdElxZXZjQkNh?=
 =?utf-8?B?NDNsWlBBcmJvUE11SmVteXZNQjVtRmd1b25XbXZWN2tiUzhqTzZVVlZDcWNB?=
 =?utf-8?B?WE1UeUorZ1c0MkVTd3FQUjBVSXAvaXNvYzZGOGZkazd1TVRYbEhwSkZuOVFT?=
 =?utf-8?B?cktzRHZPbTBQS1Bmc1RTckZwVkNMZGJsZCtMdU1tcnI4YkY1RC9zN3kxdFYy?=
 =?utf-8?B?RlpoSWdIeHVUUHJOckxwVGh3REJWSXhacitZbDBrNWIyTXBLcUJSdkVEVjhC?=
 =?utf-8?B?a3ZINzRlVzFWQTJWWjlUaVYzYTZVdnRnNEhjK3VxdEg3NnRIWElGTGd0eEps?=
 =?utf-8?B?emNybkl1dUg0VnlBOVk5clVhYXdtUmwrSXB0SU4zQ2xLWldRSDVsSGxVMXJa?=
 =?utf-8?B?R24xNTBXK09rWmpBb0NCVmZLTmhsb0l6MmFqTkJhTDQyVld6VnhaU1RMSXZZ?=
 =?utf-8?B?TjFUVklGbCt2ZWc1Lzc2SjdaRzJRQ3BSQ0VjZG1QN1hKZHNrd1Axa3Z4eTNQ?=
 =?utf-8?B?dUlwU3NwTUNQWUdiejREZ1NGYjhJb2ZlMzVIY0RFd3NWdDBIR1h2dW5qSXZn?=
 =?utf-8?B?dk1rNkhKWExtdnFzcyt0WHhqOVFTckx2YTQ0eHF3SFZhNHYxcGR5SWYzTng4?=
 =?utf-8?B?RVVSbVRYTlV2RjlLVkVkQXVuWTFSUVdvRjVQWGRBUnI1UU9KU0JUaU5Xbmp0?=
 =?utf-8?B?OFoxSGdBUHMxMDBaYW43QzFTN2llMTJoenBhYjNpRWxMY0RydWQyUWhzaHhs?=
 =?utf-8?B?WmUwZjJ4R2x1c01ITVNBOTZPbVYyUHprVzAvcmtLUzJaU21XVmtXalR6OXF2?=
 =?utf-8?B?NXZ1WnRsWXRHSXF6RDNLaThLNFNSdGJkOENUbVBDSkRzVUpmSXpyWHBTOEFk?=
 =?utf-8?B?NHUrMEdkSVlZT3NaMVorSFJKQWliVW5pLzIzb3ZQSExoRnFhQ1hpZDR1WkVX?=
 =?utf-8?B?QWx3TE12UzJML0RpZENJdTc4cTgyMGlXMGx0ZEhJV3NkSk9pRmdFK0libXlK?=
 =?utf-8?B?VEpUb3c0RmlCTndMY3ZWZ253cjI5VjZCbUQyc2dzSXRUN1pzN2JmUW9OeTN6?=
 =?utf-8?B?MDRSRVY1cVFERW85aER4Y0l0dUlCSVNUTzV0a1hnWlZDMnlQUUNjR1ltY1g1?=
 =?utf-8?B?ZmJ1Y0FEOFlnamhhSWtVaU1nTU9LeXpZdHpLaVduaHZoNFpHbFZYL1k0Lzd2?=
 =?utf-8?B?U1lxVEZOUWZTWENTQUVRNEVaODJuY0k0UkZDZHVGUVFRMG90NStGaG85WS9j?=
 =?utf-8?B?LzNlWmMvQnp5QVZOcXNycnFxNVkyYW1lcXlJR1ZuZVY5aDZNVFpzT0lwYXVj?=
 =?utf-8?B?MzNhSWQ5Z3U3YThYdGtwS3dyNExTd2FFbmE0NThDM3Q5UXRTTjlZNTlXOU5Q?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ac63d9-78e1-4d89-38d9-08dddb66230c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:09:48.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ep4iVbIaInMKqNaSnFiTxzVJBtaTUMagsp7Oo4E7J28dFG+t4WiG3XXMnHudHCkSv7QE8/4rKVTetnH+RdaXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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

On Thu, Aug 14, 2025 at 09:49:59AM +0200, Thomas Hellström wrote:
> On Wed, 2025-08-13 at 09:42 -0700, Matthew Brost wrote:
> 
> > On Wed, Aug 13, 2025 at 12:51:10PM +0200, Thomas Hellström wrote:
> > 
> > > We want all validation (potential backing store allocation) to be part
> > > of a drm_exec transaction. Therefore add a drm_exec pointer argument
> > > to xe_bo_validate() and ___xe_bo_create_locked(). Upcoming patches
> > > will deal with making all (or nearly all) calls to these functions
> > > part of a drm_exec transaction. In the meantime, define special values
> > > of the drm_exec pointer:
> > > 
> > 
> > 
> > Would the eventual idea be pass the exec further down to TTM?
> 
> 
> Yes. The original series did this, and required multiple changes both to drm_exec and to TTM. Christian had some other ideas, though although the final goal was the same. So it's a task for us and AMD to agree on something here. The TTM object refcount removal series from Christian is a step on the way there.
> 

Ok, I thought that was the idea and wanted to confirm.

Let me look at Christian's series now too.

> 
> >  
> > 
> > > XE_VALIDATION_UNIMPLEMENTED: Implementation of the drm_exec transaction
> > > has not been done yet.
> > > XE_VALIDATION_UNSUPPORTED: Some Middle-layers (dma-buf) doesn't allow
> > > the drm_exec context to be passed down to map_attachment where
> > > validation takes place.
> > 
> > 
> > What is the expected longterm implictation of paths that are
> > UNIMPLEMENTED and UNSUPPORTED?
> 
> 
> IMO Unimplemented should not be allowed moving forward other than for debugging. UNIMPLEMENTED requires a new dma-buf mapping interface with an exec argument. I don't think all peers will support that, though and those won't participate fully in the scheme.
> 

That was my thinking too—once the dma-buf mapping is fixed up, disallow this.

Matt

> 
> 
> > 
> > > XE_VALIDATION_OPT_OUT: May be used only for kunit tests where exhaustive
> > > eviction isn't crucial and the ROI of converting those is very
> > > small.
> > > 
> > > For XE_VALIDATION_UNIMPLEMENTED and XE_VALIDATION_OPT_OUT there is also
> > > a lockdep check that a drm_exec transaction can indeed start at the
> > > location where the macro is expanded. This is to encourage
> > > developers to take this into consideration early in the code
> > > development process.
> > > 
> > > Signed-off-by: Thomas Hellström <[thomas.hellstrom@linux.intel.com](mailto:thomas.hellstrom@linux.intel.com)>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile                   |   1 +
> > >  .../compat-i915-headers/gem/i915_gem_stolen.h |   6 +-
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +-
> > >  drivers/gpu/drm/xe/tests/xe_bo.c              |  20 +--
> > >  drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  12 +-
> > >  drivers/gpu/drm/xe/tests/xe_migrate.c         |  45 +++---
> > >  drivers/gpu/drm/xe/xe_bo.c                    | 129 +++++++++++++++---
> > >  drivers/gpu/drm/xe/xe_bo.h                    |  20 +--
> > >  drivers/gpu/drm/xe/xe_dma_buf.c               |  19 ++-
> > >  drivers/gpu/drm/xe/xe_exec.c                  |   6 +-
> > >  drivers/gpu/drm/xe/xe_ggtt.c                  |  15 +-
> > >  drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c          |   4 +-
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   6 +-
> > >  drivers/gpu/drm/xe/xe_svm.c                   |   4 +-
> > >  drivers/gpu/drm/xe/xe_validation.c            |  49 +++++++
> > >  drivers/gpu/drm/xe/xe_validation.h            |  69 ++++++++++
> > >  drivers/gpu/drm/xe/xe_vm.c                    |  26 +++-
> > >  drivers/gpu/drm/xe/xe_vm.h                    |  33 ++++-
> > >  drivers/gpu/drm/xe/xe_vm_types.h              |  32 +++--
> > >  20 files changed, 401 insertions(+), 105 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_validation.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_validation.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 8e0c3412a757..8ee7d275128d 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -127,6 +127,7 @@ xe-y += xe_bb.o \
> > >  	xe_tuning.o \
> > >  	xe_uc.o \
> > >  	xe_uc_fw.o \
> > > +	xe_validation.o \
> > >  	xe_vm.o \
> > >  	xe_vram.o \
> > >  	xe_vram_freq.o \
> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > > index 41d39d67817a..1ce1e9da975b 100644
> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > > @@ -8,6 +8,7 @@
> > >  
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_res_cursor.h"
> > > +#include "xe_validation.h"
> > >  
> > >  struct xe_bo;
> > >  
> > > @@ -20,6 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> > >  						       u32 size, u32 align,
> > >  						       u32 start, u32 end)
> > >  {
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_bo *bo;
> > >  	int err;
> > >  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
> > > @@ -34,13 +36,13 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> > >  
> > >  	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
> > >  				       NULL, size, start, end,
> > > -				       ttm_bo_type_kernel, flags, 0);
> > > +				       ttm_bo_type_kernel, flags, 0, exec);
> > >  	if (IS_ERR(bo)) {
> > >  		err = PTR_ERR(bo);
> > >  		bo = NULL;
> > >  		return err;
> > >  	}
> > > -	err = xe_bo_pin(bo);
> > > +	err = xe_bo_pin(bo, exec);
> > >  	xe_bo_unlock_vm_held(bo);
> > >  
> > >  	if (err) {
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index f1f8b5ab53ef..4b0748e6fdd6 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -281,6 +281,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> > >  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> > >  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
> > >  	struct xe_bo *bo = gem_to_xe_bo(obj);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	int ret;
> > >  
> > >  	if (!vma)
> > > @@ -313,9 +314,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> > >  		goto err;
> > >  
> > >  	if (IS_DGFX(xe))
> > > -		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
> > > +		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> > >  	else
> > > -		ret = xe_bo_validate(bo, NULL, true);
> > > +		ret = xe_bo_validate(bo, NULL, true, exec);
> > >  	if (!ret)
> > >  		ttm_bo_pin(&bo->ttm);
> > >  	ttm_bo_unreserve(&bo->ttm);
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > index bb469096d072..06ceba6c3c25 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > @@ -23,7 +23,7 @@
> > >  
> > >  static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
> > >  			    bool clear, u64 get_val, u64 assign_val,
> > > -			    struct kunit *test)
> > > +			    struct kunit *test, struct drm_exec *exec)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct ttm_tt *ttm;
> > > @@ -35,7 +35,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
> > >  	u32 offset;
> > >  
> > >  	/* Move bo to VRAM if not already there. */
> > > -	ret = xe_bo_validate(bo, NULL, false);
> > > +	ret = xe_bo_validate(bo, NULL, false, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to validate bo.\n");
> > >  		return ret;
> > > @@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
> > >  	}
> > >  
> > >  	/* Evict to system. CCS data should be copied. */
> > > -	ret = xe_bo_evict(bo);
> > > +	ret = xe_bo_evict(bo, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to evict bo.\n");
> > >  		return ret;
> > > @@ -132,6 +132,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
> > >  
> > >  	/* TODO: Sanity check */
> > >  	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> > > +	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
> > >  
> > >  	if (IS_DGFX(xe))
> > >  		kunit_info(test, "Testing vram id %u\n", tile->id);
> > > @@ -149,18 +150,18 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
> > >  
> > >  	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
> > >  	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
> > > -			       test);
> > > +			       test, exec);
> > >  	if (ret)
> > >  		goto out_unlock;
> > >  
> > >  	kunit_info(test, "Verifying that CCS data survives migration.\n");
> > >  	ret = ccs_test_migrate(tile, bo, false, 0xdeadbeefdeadbeefULL,
> > > -			       0xdeadbeefdeadbeefULL, test);
> > > +			       0xdeadbeefdeadbeefULL, test, exec);
> > >  	if (ret)
> > >  		goto out_unlock;
> > >  
> > >  	kunit_info(test, "Verifying that CCS data can be properly cleared.\n");
> > > -	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test);
> > > +	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test, exec);
> > >  
> > >  out_unlock:
> > >  	xe_bo_unlock(bo);
> > > @@ -210,6 +211,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
> > >  	struct xe_bo *bo, *external;
> > >  	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> > >  	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
> > > +	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
> > >  	struct xe_gt *__gt;
> > >  	int err, i, id;
> > >  
> > > @@ -236,7 +238,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
> > >  		}
> > >  
> > >  		xe_bo_lock(external, false);
> > > -		err = xe_bo_pin_external(external);
> > > +		err = xe_bo_pin_external(external, exec);
> > >  		xe_bo_unlock(external);
> > >  		if (err) {
> > >  			KUNIT_FAIL(test, "external bo pin err=%pe\n",
> > > @@ -294,7 +296,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
> > >  		if (i) {
> > >  			down_read(&vm->lock);
> > >  			xe_vm_lock(vm, false);
> > > -			err = xe_bo_validate(bo, bo->vm, false);
> > > +			err = xe_bo_validate(bo, bo->vm, false, exec);
> > >  			xe_vm_unlock(vm);
> > >  			up_read(&vm->lock);
> > >  			if (err) {
> > > @@ -303,7 +305,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
> > >  				goto cleanup_all;
> > >  			}
> > >  			xe_bo_lock(external, false);
> > > -			err = xe_bo_validate(external, NULL, false);
> > > +			err = xe_bo_validate(external, NULL, false, exec);
> > >  			xe_bo_unlock(external);
> > >  			if (err) {
> > >  				KUNIT_FAIL(test, "external bo valid err=%pe\n",
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > index cde9530bef8c..965dd3280468 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > @@ -27,7 +27,8 @@ static bool is_dynamic(struct dma_buf_test_params *params)
> > >  }
> > >  
> > >  static void check_residency(struct kunit *test, struct xe_bo *exported,
> > > -			    struct xe_bo *imported, struct dma_buf *dmabuf)
> > > +			    struct xe_bo *imported, struct dma_buf *dmabuf,
> > > +			    struct drm_exec *exec)
> > >  {
> > >  	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
> > >  	u32 mem_type;
> > > @@ -62,7 +63,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
> > >  	 * importer is on a different device. If they're on the same device,
> > >  	 * the exporter and the importer should be the same bo.
> > >  	 */
> > > -	ret = xe_bo_evict(exported);
> > > +	ret = xe_bo_evict(exported, exec);
> > >  	if (ret) {
> > >  		if (ret != -EINTR && ret != -ERESTARTSYS)
> > >  			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
> > > @@ -77,7 +78,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
> > >  	}
> > >  
> > >  	/* Re-validate the importer. This should move also exporter in. */
> > > -	ret = xe_bo_validate(imported, NULL, false);
> > > +	ret = xe_bo_validate(imported, NULL, false, exec);
> > >  	if (ret) {
> > >  		if (ret != -EINTR && ret != -ERESTARTSYS)
> > >  			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
> > > @@ -150,11 +151,12 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
> > >  			KUNIT_FAIL(test,
> > >  				   "xe_gem_prime_import() succeeded when it shouldn't have\n");
> > >  		} else {
> > > +			struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
> > >  			int err;
> > >  
> > >  			/* Is everything where we expect it to be? */
> > >  			xe_bo_lock(import_bo, false);
> > > -			err = xe_bo_validate(import_bo, NULL, false);
> > > +			err = xe_bo_validate(import_bo, NULL, false, exec);
> > >  
> > >  			/* Pinning in VRAM is not allowed. */
> > >  			if (!is_dynamic(params) &&
> > > @@ -167,7 +169,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
> > >  						  err == -ERESTARTSYS);
> > >  
> > >  			if (!err)
> > > -				check_residency(test, bo, import_bo, dmabuf);
> > > +				check_residency(test, bo, import_bo, dmabuf, exec);
> > >  			xe_bo_unlock(import_bo);
> > >  		}
> > >  		drm_gem_object_put(import);
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > index edd1e701aa1c..dfb445d09759 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > @@ -70,7 +70,7 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
> > >  		} } while (0)
> > >  
> > >  static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> > > -		      struct kunit *test, u32 region)
> > > +		      struct kunit *test, u32 region, struct drm_exec *exec)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(m->tile);
> > >  	u64 retval, expected = 0;
> > > @@ -84,14 +84,15 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> > >  						   ttm_bo_type_kernel,
> > >  						   region |
> > >  						   XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > > -						   XE_BO_FLAG_PINNED);
> > > +						   XE_BO_FLAG_PINNED,
> > > +						   exec);
> > >  	if (IS_ERR(remote)) {
> > >  		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
> > >  			   str, remote);
> > >  		return;
> > >  	}
> > >  
> > > -	err = xe_bo_validate(remote, NULL, false);
> > > +	err = xe_bo_validate(remote, NULL, false, exec);
> > >  	if (err) {
> > >  		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
> > >  			   str, err);
> > > @@ -161,13 +162,13 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> > >  }
> > >  
> > >  static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
> > > -			     struct kunit *test)
> > > +			     struct drm_exec *exec, struct kunit *test)
> > >  {
> > > -	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM);
> > > +	test_copy(m, bo, test, XE_BO_FLAG_SYSTEM, exec);
> > >  }
> > >  
> > >  static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
> > > -			   struct kunit *test)
> > > +			   struct drm_exec *exec, struct kunit *test)
> > >  {
> > >  	u32 region;
> > >  
> > > @@ -178,10 +179,11 @@ static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
> > >  		region = XE_BO_FLAG_VRAM1;
> > >  	else
> > >  		region = XE_BO_FLAG_VRAM0;
> > > -	test_copy(m, bo, test, region);
> > > +	test_copy(m, bo, test, region, exec);
> > >  }
> > >  
> > > -static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> > > +static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
> > > +				   struct drm_exec *exec)
> > >  {
> > >  	struct xe_tile *tile = m->tile;
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > > @@ -290,10 +292,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> > >  	check(retval, expected, "Command clear small last value", test);
> > >  
> > >  	kunit_info(test, "Copying small buffer object to system\n");
> > > -	test_copy_sysmem(m, tiny, test);
> > > +	test_copy_sysmem(m, tiny, exec, test);
> > >  	if (xe->info.tile_count > 1) {
> > >  		kunit_info(test, "Copying small buffer object to other vram\n");
> > > -		test_copy_vram(m, tiny, test);
> > > +		test_copy_vram(m, tiny, exec, test);
> > >  	}
> > >  
> > >  	/* Clear a big bo */
> > > @@ -312,10 +314,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> > >  	check(retval, expected, "Command clear big last value", test);
> > >  
> > >  	kunit_info(test, "Copying big buffer object to system\n");
> > > -	test_copy_sysmem(m, big, test);
> > > +	test_copy_sysmem(m, big, exec, test);
> > >  	if (xe->info.tile_count > 1) {
> > >  		kunit_info(test, "Copying big buffer object to other vram\n");
> > > -		test_copy_vram(m, big, test);
> > > +		test_copy_vram(m, big, exec, test);
> > >  	}
> > >  
> > >  out:
> > > @@ -343,10 +345,11 @@ static int migrate_test_run_device(struct xe_device *xe)
> > >  
> > >  	for_each_tile(tile, xe, id) {
> > >  		struct xe_migrate *m = tile->migrate;
> > > +		struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
> > >  
> > >  		kunit_info(test, "Testing tile id %d.\n", id);
> > >  		xe_vm_lock(m->q->vm, false);
> > > -		xe_migrate_sanity_test(m, test);
> > > +		xe_migrate_sanity_test(m, test, exec);
> > >  		xe_vm_unlock(m->q->vm);
> > >  	}
> > >  
> > > @@ -490,7 +493,7 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
> > >  
> > >  static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
> > >  			 struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *ccs_bo,
> > > -			 struct kunit *test)
> > > +			 struct drm_exec *exec, struct kunit *test)
> > >  {
> > >  	struct dma_fence *fence;
> > >  	u64 expected, retval;
> > > @@ -509,7 +512,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
> > >  	dma_fence_put(fence);
> > >  
> > >  	kunit_info(test, "Evict vram buffer object\n");
> > > -	ret = xe_bo_evict(vram_bo);
> > > +	ret = xe_bo_evict(vram_bo, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to evict bo.\n");
> > >  		return;
> > > @@ -538,7 +541,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
> > >  	dma_fence_put(fence);
> > >  
> > >  	kunit_info(test, "Restore vram buffer object\n");
> > > -	ret = xe_bo_validate(vram_bo, NULL, false);
> > > +	ret = xe_bo_validate(vram_bo, NULL, false, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> > >  		return;
> > > @@ -636,6 +639,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
> > >  {
> > >  	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
> > >  	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> > > +	struct drm_exec *exec;
> > >  	long ret;
> > >  
> > >  	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> > > @@ -650,8 +654,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
> > >  		return;
> > >  	}
> > >  
> > > +	exec = XE_VALIDATION_OPT_OUT;
> > >  	xe_bo_lock(sys_bo, false);
> > > -	ret = xe_bo_validate(sys_bo, NULL, false);
> > > +	ret = xe_bo_validate(sys_bo, NULL, false, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
> > >  		goto free_sysbo;
> > > @@ -676,7 +681,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
> > >  	}
> > >  
> > >  	xe_bo_lock(ccs_bo, false);
> > > -	ret = xe_bo_validate(ccs_bo, NULL, false);
> > > +	ret = xe_bo_validate(ccs_bo, NULL, false, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
> > >  		goto free_ccsbo;
> > > @@ -700,7 +705,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
> > >  	}
> > >  
> > >  	xe_bo_lock(vram_bo, false);
> > > -	ret = xe_bo_validate(vram_bo, NULL, false);
> > > +	ret = xe_bo_validate(vram_bo, NULL, false, exec);
> > >  	if (ret) {
> > >  		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> > >  		goto free_vrambo;
> > > @@ -713,7 +718,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
> > >  	}
> > >  
> > >  	test_clear(xe, tile, sys_bo, vram_bo, test);
> > > -	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
> > > +	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, exec, test);
> > >  	xe_bo_unlock(vram_bo);
> > >  
> > >  	xe_bo_lock(vram_bo, false);
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 11eaf3b06766..e71addf51ed0 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1139,6 +1139,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> > >  int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
> > >  {
> > >  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_bo *backup;
> > >  	int ret = 0;
> > >  
> > > @@ -1163,7 +1164,7 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
> > >  	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> > >  					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > >  					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > > -					XE_BO_FLAG_PINNED);
> > > +					XE_BO_FLAG_PINNED, exec);
> > >  	if (IS_ERR(backup)) {
> > >  		ret = PTR_ERR(backup);
> > >  		goto out_unlock_bo;
> > > @@ -1214,6 +1215,7 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
> > >  int xe_bo_evict_pinned(struct xe_bo *bo)
> > >  {
> > >  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_bo *backup = bo->backup_obj;
> > >  	bool backup_created = false;
> > >  	bool unmap = false;
> > > @@ -1242,7 +1244,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > >  						NULL, xe_bo_size(bo),
> > >  						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> > >  						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> > > -						XE_BO_FLAG_PINNED);
> > > +						XE_BO_FLAG_PINNED, exec);
> > >  		if (IS_ERR(backup)) {
> > >  			ret = PTR_ERR(backup);
> > >  			goto out_unlock_bo;
> > > @@ -1718,12 +1720,14 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > >  	struct xe_device *xe = to_xe_device(ddev);
> > >  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > >  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> > > +	struct drm_exec *exec;
> > >  	vm_fault_t ret;
> > >  	int idx;
> > >  
> > >  	if (needs_rpm)
> > >  		xe_pm_runtime_get(xe);
> > >  
> > > +	exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	ret = ttm_bo_vm_reserve(tbo, vmf);
> > >  	if (ret)
> > >  		goto out;
> > > @@ -1731,6 +1735,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > >  	if (drm_dev_enter(ddev, &idx)) {
> > >  		trace_xe_bo_cpu_fault(bo);
> > >  
> > > +		xe_validation_assert_exec(xe, exec, &tbo->base);
> > >  		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> > >  					       TTM_BO_VM_NUM_PREFAULT);
> > >  		drm_dev_exit(idx);
> > > @@ -1850,11 +1855,32 @@ void xe_bo_free(struct xe_bo *bo)
> > >  	kfree(bo);
> > >  }
> > >  
> > > +/**
> > > + * ___xe_bo_create_locked() - Initialize or create an xe_bo.
> > > + * @xe: The xe device.
> > > + * @bo: An already allocated buffer object or NULL
> > > + * if the function should allocate a new one.
> > > + * @tile: The tile to select for migration of this bo, and the tile used for
> > > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> > > + * @resv: Pointer to a locked shared reservation object to use fo this bo,
> > > + * or NULL for the xe_bo to use its own.
> > > + * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
> > > + * @size: The storage size to use for the bo.
> > > + * @cpu_caching: The cpu caching used for system memory backing store.
> > > + * @type: The TTM buffer object type.
> > > + * @flags: XE_BO_FLAG_ flags.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > > + *
> > > + * Initialize or create an xe buffer object. On failure, any allocated buffer
> > > + * object passed in @bo will have been unreferenced.
> > > + *
> > > + * Return: The buffer object on success. Negative error pointer on failure.
> > > + */
> > >  struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >  				     struct xe_tile *tile, struct dma_resv *resv,
> > >  				     struct ttm_lru_bulk_move *bulk, size_t size,
> > >  				     u16 cpu_caching, enum ttm_bo_type type,
> > > -				     u32 flags)
> > > +				     u32 flags, struct drm_exec *exec)
> > >  {
> > >  	struct ttm_operation_ctx ctx = {
> > >  		.interruptible = true,
> > > @@ -1923,6 +1949,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >  		ctx.resv = resv;
> > >  	}
> > >  
> > > +	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
> > >  	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
> > >  		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
> > >  		if (WARN_ON(err)) {
> > > @@ -2024,7 +2051,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> > >  		      struct xe_tile *tile, struct xe_vm *vm,
> > >  		      size_t size, u64 start, u64 end,
> > >  		      u16 cpu_caching, enum ttm_bo_type type, u32 flags,
> > > -		      u64 alignment)
> > > +		      u64 alignment, struct drm_exec *exec)
> > >  {
> > >  	struct xe_bo *bo = NULL;
> > >  	int err;
> > > @@ -2049,7 +2076,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> > >  				    vm && !xe_vm_in_fault_mode(vm) &&
> > >  				    flags & XE_BO_FLAG_USER ?
> > >  				    &vm->lru_bulk_move : NULL, size,
> > > -				    cpu_caching, type, flags);
> > > +				    cpu_caching, type, flags, exec);
> > >  	if (IS_ERR(bo))
> > >  		return bo;
> > >  
> > > @@ -2083,9 +2110,10 @@ __xe_bo_create_locked(struct xe_device *xe,
> > >  
> > >  			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
> > >  				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
> > > -							   start + xe_bo_size(bo), U64_MAX);
> > > +							   start + xe_bo_size(bo), U64_MAX,
> > > +							   exec);
> > >  			} else {
> > > -				err = xe_ggtt_insert_bo(t->mem.ggtt, bo);
> > > +				err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
> > >  			}
> > >  			if (err)
> > >  				goto err_unlock_put_bo;
> > > @@ -2102,22 +2130,59 @@ __xe_bo_create_locked(struct xe_device *xe,
> > >  	return ERR_PTR(err);
> > >  }
> > >  
> > > +/**
> > > + * xe_bo_create_locked_range() - Create a BO with range- and alignment options
> > > + * @xe: The xe device.
> > > + * @tile: The tile to select for migration of this bo, and the tile used for
> > > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> > > + * @vm: The local vm or NULL for external objects.
> > > + * @size: The storage size to use for the bo.
> > > + * @start: Start of fixed VRAM range or 0.
> > > + * @end: End of fixed VRAM range or ~0ULL.
> > > + * @type: The TTM buffer object type.
> > > + * @flags: XE_BO_FLAG_ flags.
> > > + * @alignment: For GGTT buffer objects, the minimum GGTT alignment.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > > + *
> > > + * Create an Xe BO with range- and alignment options. If @start and @end indicate
> > > + * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM placement
> > > + * only. The @alignment parameter can be used for GGTT alignment.
> > > + *
> > > + * Return: The buffer object on success. Negative error pointer on failure.
> > > + */
> > >  struct xe_bo *
> > >  xe_bo_create_locked_range(struct xe_device *xe,
> > >  			  struct xe_tile *tile, struct xe_vm *vm,
> > >  			  size_t size, u64 start, u64 end,
> > > -			  enum ttm_bo_type type, u32 flags, u64 alignment)
> > > +			  enum ttm_bo_type type, u32 flags, u64 alignment,
> > > +			  struct drm_exec *exec)
> > >  {
> > >  	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type,
> > > -				     flags, alignment);
> > > +				     flags, alignment, exec);
> > >  }
> > >  
> > > +/**
> > > + * xe_bo_create_locked() - Create a BO
> > > + * @xe: The xe device.
> > > + * @tile: The tile to select for migration of this bo, and the tile used for
> > > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> > > + * @vm: The local vm or NULL for external objects.
> > > + * @size: The storage size to use for the bo.
> > > + * @type: The TTM buffer object type.
> > > + * @flags: XE_BO_FLAG_ flags.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > > + *
> > > + * Create a locked xe BO with no range- nor alignment restrictions.
> > > + *
> > > + * Return: The buffer object on success. Negative error pointer on failure.
> > > + */
> > >  struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
> > >  				  struct xe_vm *vm, size_t size,
> > > -				  enum ttm_bo_type type, u32 flags)
> > > +				  enum ttm_bo_type type, u32 flags,
> > > +				  struct drm_exec *exec)
> > >  {
> > >  	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type,
> > > -				     flags, 0);
> > > +				     flags, 0, exec);
> > >  }
> > >  
> > >  struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
> > > @@ -2125,9 +2190,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
> > >  				u16 cpu_caching,
> > >  				u32 flags)
> > >  {
> > > +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
> > >  						 cpu_caching, ttm_bo_type_device,
> > > -						 flags | XE_BO_FLAG_USER, 0);
> > > +						 flags | XE_BO_FLAG_USER, 0, exec);
> > >  	if (!IS_ERR(bo))
> > >  		xe_bo_unlock_vm_held(bo);
> > >  
> > > @@ -2138,7 +2204,8 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> > >  			   struct xe_vm *vm, size_t size,
> > >  			   enum ttm_bo_type type, u32 flags)
> > >  {
> > > -	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags);
> > > +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> > > +	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags, exec);
> > >  
> > >  	if (!IS_ERR(bo))
> > >  		xe_bo_unlock_vm_held(bo);
> > > @@ -2166,6 +2233,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> > >  	int err;
> > >  	u64 start = offset == ~0ull ? 0 : offset;
> > >  	u64 end = offset == ~0ull ? offset : start + size;
> > > +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> > >  
> > >  	if (flags & XE_BO_FLAG_STOLEN &&
> > >  	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> > > @@ -2173,11 +2241,11 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> > >  
> > >  	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
> > >  				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
> > > -				       alignment);
> > > +				       alignment, exec);
> > >  	if (IS_ERR(bo))
> > >  		return bo;
> > >  
> > > -	err = xe_bo_pin(bo);
> > > +	err = xe_bo_pin(bo, exec);
> > >  	if (err)
> > >  		goto err_put;
> > >  
> > > @@ -2299,6 +2367,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
> > >  /**
> > >   * xe_bo_pin_external - pin an external BO
> > >   * @bo: buffer object to be pinned
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > >   *
> > >   * Pin an external (not tied to a VM, can be exported via dma-buf / prime FD)
> > >   * BO. Unique call compared to xe_bo_pin as this function has it own set of
> > > @@ -2306,7 +2375,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
> > >   *
> > >   * Returns 0 for success, negative error code otherwise.
> > >   */
> > > -int xe_bo_pin_external(struct xe_bo *bo)
> > > +int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec)
> > >  {
> > >  	struct xe_device *xe = xe_bo_device(bo);
> > >  	int err;
> > > @@ -2315,7 +2384,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > >  	xe_assert(xe, xe_bo_is_user(bo));
> > >  
> > >  	if (!xe_bo_is_pinned(bo)) {
> > > -		err = xe_bo_validate(bo, NULL, false);
> > > +		err = xe_bo_validate(bo, NULL, false, exec);
> > >  		if (err)
> > >  			return err;
> > >  
> > > @@ -2337,7 +2406,17 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > >  	return 0;
> > >  }
> > >  
> > > -int xe_bo_pin(struct xe_bo *bo)
> > > +/**
> > > + * xe_bo_pin() - Pin a kernel bo after potentially migrating it
> > > + * @bo: The kernel bo to pin.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > > + *
> > > + * Attempts to migrate a bo to @bo->placement. If that succeeds,
> > > + * pins the bo.
> > > + *
> > > + * Return: %0 on success, negative error code on migration failure.
> > > + */
> > > +int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
> > >  {
> > >  	struct ttm_place *place = &bo->placements[0];
> > >  	struct xe_device *xe = xe_bo_device(bo);
> > > @@ -2359,7 +2438,7 @@ int xe_bo_pin(struct xe_bo *bo)
> > >  	/* We only expect at most 1 pin */
> > >  	xe_assert(xe, !xe_bo_is_pinned(bo));
> > >  
> > > -	err = xe_bo_validate(bo, NULL, false);
> > > +	err = xe_bo_validate(bo, NULL, false, exec);
> > >  	if (err)
> > >  		return err;
> > >  
> > > @@ -2452,6 +2531,7 @@ void xe_bo_unpin(struct xe_bo *bo)
> > >   *      NULL. Used together with @allow_res_evict.
> > >   * @allow_res_evict: Whether it's allowed to evict bos sharing @vm's
> > >   *                   reservation object.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > >   *
> > >   * Make sure the bo is in allowed placement, migrating it if necessary. If
> > >   * needed, other bos will be evicted. If bos selected for eviction shares
> > > @@ -2461,7 +2541,8 @@ void xe_bo_unpin(struct xe_bo *bo)
> > >   * Return: 0 on success, negative error code on failure. May return
> > >   * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
> > >   */
> > > -int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
> > > +int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
> > > +		   struct drm_exec *exec)
> > >  {
> > >  	struct ttm_operation_ctx ctx = {
> > >  		.interruptible = true,
> > > @@ -2480,6 +2561,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
> > >  
> > >  	xe_vm_set_validating(vm, allow_res_evict);
> > >  	trace_xe_bo_validate(bo);
> > > +	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> > >  	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > >  	xe_vm_clear_validating(vm, allow_res_evict);
> > >  
> > > @@ -2917,6 +2999,7 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
> > >   * xe_bo_migrate - Migrate an object to the desired region id
> > >   * @bo: The buffer object to migrate.
> > >   * @mem_type: The TTM region type to migrate to.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > >   *
> > >   * Attempt to migrate the buffer object to the desired memory region. The
> > >   * buffer object may not be pinned, and must be locked.
> > > @@ -2928,7 +3011,7 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
> > >   * Return: 0 on success. Negative error code on failure. In particular may
> > >   * return -EINTR or -ERESTARTSYS if signal pending.
> > >   */
> > > -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
> > > +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
> > >  {
> > >  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> > >  	struct ttm_operation_ctx ctx = {
> > > @@ -2966,19 +3049,21 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
> > >  		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
> > >  	}
> > >  
> > > +	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> > >  	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
> > >  }
> > >  
> > >  /**
> > >   * xe_bo_evict - Evict an object to evict placement
> > >   * @bo: The buffer object to migrate.
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > >   *
> > >   * On successful completion, the object memory will be moved to evict
> > >   * placement. This function blocks until the object has been fully moved.
> > >   *
> > >   * Return: 0 on success. Negative error code on failure.
> > >   */
> > > -int xe_bo_evict(struct xe_bo *bo)
> > > +int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec)
> > >  {
> > >  	struct ttm_operation_ctx ctx = {
> > >  		.interruptible = false,
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index 8cce413b5235..b1b6cb622d71 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -10,6 +10,7 @@
> > >  
> > >  #include "xe_bo_types.h"
> > >  #include "xe_macros.h"
> > > +#include "xe_validation.h"
> > >  #include "xe_vm_types.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_vram_types.h"
> > > @@ -92,15 +93,17 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >  				     struct xe_tile *tile, struct dma_resv *resv,
> > >  				     struct ttm_lru_bulk_move *bulk, size_t size,
> > >  				     u16 cpu_caching, enum ttm_bo_type type,
> > > -				     u32 flags);
> > > +				     u32 flags, struct drm_exec *exec);
> > >  struct xe_bo *
> > >  xe_bo_create_locked_range(struct xe_device *xe,
> > >  			  struct xe_tile *tile, struct xe_vm *vm,
> > >  			  size_t size, u64 start, u64 end,
> > > -			  enum ttm_bo_type type, u32 flags, u64 alignment);
> > > +			  enum ttm_bo_type type, u32 flags, u64 alignment,
> > > +			  struct drm_exec *exec);
> > >  struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
> > >  				  struct xe_vm *vm, size_t size,
> > > -				  enum ttm_bo_type type, u32 flags);
> > > +				  enum ttm_bo_type type, u32 flags,
> > > +				  struct drm_exec *exec);
> > >  struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> > >  			   struct xe_vm *vm, size_t size,
> > >  			   enum ttm_bo_type type, u32 flags);
> > > @@ -200,11 +203,12 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
> > >  	}
> > >  }
> > >  
> > > -int xe_bo_pin_external(struct xe_bo *bo);
> > > -int xe_bo_pin(struct xe_bo *bo);
> > > +int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec);
> > > +int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec);
> > >  void xe_bo_unpin_external(struct xe_bo *bo);
> > >  void xe_bo_unpin(struct xe_bo *bo);
> > > -int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict);
> > > +int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
> > > +		   struct drm_exec *exec);
> > >  
> > >  static inline bool xe_bo_is_pinned(struct xe_bo *bo)
> > >  {
> > > @@ -285,8 +289,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
> > >  
> > >  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
> > >  
> > > -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
> > > -int xe_bo_evict(struct xe_bo *bo);
> > > +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
> > > +int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
> > >  
> > >  int xe_bo_evict_pinned(struct xe_bo *bo);
> > >  int xe_bo_notifier_prepare_pinned(struct xe_bo *bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index 346f857f3837..78a827d4e726 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -51,6 +51,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> > >  	struct drm_gem_object *obj = attach->dmabuf->priv;
> > >  	struct xe_bo *bo = gem_to_xe_bo(obj);
> > >  	struct xe_device *xe = xe_bo_device(bo);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> > >  	int ret;
> > >  
> > >  	/*
> > > @@ -63,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	ret = xe_bo_migrate(bo, XE_PL_TT);
> > > +	ret = xe_bo_migrate(bo, XE_PL_TT, exec);
> > >  	if (ret) {
> > >  		if (ret != -EINTR && ret != -ERESTARTSYS)
> > >  			drm_dbg(&xe->drm,
> > > @@ -72,7 +73,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> > >  		return ret;
> > >  	}
> > >  
> > > -	ret = xe_bo_pin_external(bo);
> > > +	ret = xe_bo_pin_external(bo, exec);
> > >  	xe_assert(xe, !ret);
> > >  
> > >  	return 0;
> > > @@ -92,6 +93,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
> > >  	struct dma_buf *dma_buf = attach->dmabuf;
> > >  	struct drm_gem_object *obj = dma_buf->priv;
> > >  	struct xe_bo *bo = gem_to_xe_bo(obj);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> > >  	struct sg_table *sgt;
> > >  	int r = 0;
> > >  
> > > @@ -100,9 +102,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
> > >  
> > >  	if (!xe_bo_is_pinned(bo)) {
> > >  		if (!attach->peer2peer)
> > > -			r = xe_bo_migrate(bo, XE_PL_TT);
> > > +			r = xe_bo_migrate(bo, XE_PL_TT, exec);
> > >  		else
> > > -			r = xe_bo_validate(bo, NULL, false);
> > > +			r = xe_bo_validate(bo, NULL, false, exec);
> > >  		if (r)
> > >  			return ERR_PTR(r);
> > >  	}
> > > @@ -161,13 +163,14 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
> > >  	struct xe_bo *bo = gem_to_xe_bo(obj);
> > >  	bool reads =  (direction == DMA_BIDIRECTIONAL ||
> > >  		       direction == DMA_FROM_DEVICE);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  
> > >  	if (!reads)
> > >  		return 0;
> > >  
> > >  	/* Can we do interruptible lock here? */
> > >  	xe_bo_lock(bo, false);
> > > -	(void)xe_bo_migrate(bo, XE_PL_TT);
> > > +	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> > >  	xe_bo_unlock(bo);
> > >  
> > >  	return 0;
> > > @@ -208,13 +211,14 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> > >  {
> > >  	struct dma_resv *resv = dma_buf->resv;
> > >  	struct xe_device *xe = to_xe_device(dev);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_bo *bo;
> > >  	int ret;
> > >  
> > >  	dma_resv_lock(resv, NULL);
> > >  	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> > >  				    0, /* Will require 1way or 2way for vm_bind */
> > > -				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM);
> > > +				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, exec);
> > >  	if (IS_ERR(bo)) {
> > >  		ret = PTR_ERR(bo);
> > >  		goto error;
> > > @@ -232,8 +236,9 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
> > >  {
> > >  	struct drm_gem_object *obj = attach->importer_priv;
> > >  	struct xe_bo *bo = gem_to_xe_bo(obj);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> > >  
> > > -	XE_WARN_ON(xe_bo_evict(bo));
> > > +	XE_WARN_ON(xe_bo_evict(bo, exec));
> > >  }
> > >  
> > >  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index 44364c042ad7..0bcb4fb9a10e 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -97,9 +97,13 @@
> > >  static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
> > >  {
> > >  	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
> > > +	int ret;
> > >  
> > >  	/* The fence slot added here is intended for the exec sched job. */
> > > -	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
> > > +	xe_vm_set_validation_exec(vm, &vm_exec->exec);
> > > +	ret = xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
> > > +	xe_vm_set_validation_exec(vm, NULL);
> > > +	return ret;
> > >  }
> > >  
> > >  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index e03222f5ac5a..a47c0131956b 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -731,7 +731,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > >  }
> > >  
> > >  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > > -				  u64 start, u64 end)
> > > +				  u64 start, u64 end, struct drm_exec *exec)
> > >  {
> > >  	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
> > >  	u8 tile_id = ggtt->tile->id;
> > > @@ -746,7 +746,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > >  		return 0;
> > >  	}
> > >  
> > > -	err = xe_bo_validate(bo, NULL, false);
> > > +	err = xe_bo_validate(bo, NULL, false, exec);
> > >  	if (err)
> > >  		return err;
> > >  
> > > @@ -788,25 +788,28 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > >   * @bo: the &xe_bo to be inserted
> > >   * @start: address where it will be inserted
> > >   * @end: end of the range where it will be inserted
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > >   *
> > >   * Return: 0 on success or a negative error code on failure.
> > >   */
> > >  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > > -			 u64 start, u64 end)
> > > +			 u64 start, u64 end, struct drm_exec *exec)
> > >  {
> > > -	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
> > > +	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
> > >  }
> > >  
> > >  /**
> > >   * xe_ggtt_insert_bo - Insert BO into GGTT
> > >   * @ggtt: the &xe_ggtt where bo will be inserted
> > >   * @bo: the &xe_bo to be inserted
> > > + * @exec: The drm_exec transaction to use for exhaustive eviction.
> > >   *
> > >   * Return: 0 on success or a negative error code on failure.
> > >   */
> > > -int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > > +int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > > +		      struct drm_exec *exec)
> > >  {
> > > -	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> > > +	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX, exec);
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > > index fbe1e397d05d..75fc7a1efea7 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > > @@ -10,6 +10,7 @@
> > >  
> > >  struct drm_printer;
> > >  struct xe_tile;
> > > +struct drm_exec;
> > >  
> > >  struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
> > >  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> > > @@ -31,9 +32,9 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
> > >  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> > >  		    struct xe_bo *bo, u16 pat_index);
> > >  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > > -int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > > +int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
> > >  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > > -			 u64 start, u64 end);
> > > +			 u64 start, u64 end, struct drm_exec *exec);
> > >  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > >  u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index ab43dec52776..2c7f10cc423f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -94,12 +94,12 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> > >  		}
> > >  
> > >  		/* Migrate to VRAM, move should invalidate the VMA first */
> > > -		err = xe_bo_migrate(bo, vram->placement);
> > > +		err = xe_bo_migrate(bo, vram->placement, exec);
> > >  		if (err)
> > >  			return err;
> > >  	} else if (bo) {
> > >  		/* Create backing store if needed */
> > > -		err = xe_bo_validate(bo, vm, true);
> > > +		err = xe_bo_validate(bo, vm, true, exec);
> > >  		if (err)
> > >  			return err;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > index c8f0320d032f..906011671b60 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > @@ -1452,6 +1452,7 @@ static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
> > >  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> > >  {
> > >  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_bo *bo;
> > > @@ -1484,11 +1485,12 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> > >  				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > >  				 XE_BO_FLAG_NEEDS_2M |
> > >  				 XE_BO_FLAG_PINNED |
> > > -				 XE_BO_FLAG_PINNED_LATE_RESTORE);
> > > +				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> > > +				 exec);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > >  
> > > -	err = xe_bo_pin(bo);
> > > +	err = xe_bo_pin(bo, exec);
> > >  	xe_bo_unlock(bo);
> > >  	if (unlikely(err)) {
> > >  		xe_bo_put(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index e35c6d4def20..39e3aa6df25a 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -700,6 +700,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> > >  	struct device *dev = xe->drm.dev;
> > >  	struct drm_buddy_block *block;
> > >  	struct list_head *blocks;
> > > +	struct drm_exec *exec;
> > >  	struct xe_bo *bo;
> > >  	ktime_t time_end = 0;
> > >  	int err, idx;
> > > @@ -708,12 +709,13 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> > >  		return -ENODEV;
> > >  
> > >  	xe_pm_runtime_get(xe);
> > > +	exec = XE_VALIDATION_UNIMPLEMENTED;
> > >  
> > >   retry:
> > >  	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
> > >  				 ttm_bo_type_device,
> > >  				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> > > -				 XE_BO_FLAG_CPU_ADDR_MIRROR);
> > > +				 XE_BO_FLAG_CPU_ADDR_MIRROR, exec);
> > >  	if (IS_ERR(bo)) {
> > >  		err = PTR_ERR(bo);
> > >  		if (xe_vm_validate_should_retry(NULL, err, &time_end))
> > > diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> > > new file mode 100644
> > > index 000000000000..cc0684d24e02
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > > @@ -0,0 +1,49 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +#include "xe_bo.h"
> > > +#include <drm/drm_exec.h>
> > > +#include <drm/drm_gem.h>
> > > +
> > > +#include "xe_assert.h"
> > > +#include "xe_validation.h"
> > > +
> > > +#ifdef CONFIG_DRM_XE_DEBUG
> > > +/**
> > > + * xe_validation_assert_exec() - Assert that the drm_exec pointer is suitable
> > > + * for validation.
> > > + * @xe: Pointer to the xe device.
> > > + * @exec: The drm_exec pointer to check.
> > > + * @obj: Pointer to the object subject to validation.
> > > + *
> > > + * NULL exec pointers are not allowed.
> > > + * For XE_VALIDATION_UNIMPLEMENTED, no checking.
> > > + * For XE_VLIDATION_OPT_OUT, check that the caller is a kunit test
> > > + * For XE_VALIDATION_UNSUPPORTED, check that the object subject to
> > > + * validation is a dma-buf, for which support for ww locking is
> > > + * not in place in the dma-buf layer.
> > > + */
> > > +void xe_validation_assert_exec(const struct xe_device *xe,
> > > +			       const struct drm_exec *exec,
> > > +			       const struct drm_gem_object *obj)
> > > +{
> > > +	xe_assert(xe, exec);
> > > +	if (IS_ERR(exec)) {
> > > +		switch (PTR_ERR(exec)) {
> > > +		case __XE_VAL_UNIMPLEMENTED:
> > > +			break;
> > > +		case __XE_VAL_UNSUPPORTED:
> > > +			xe_assert(xe, !!obj->dma_buf);
> > > +			break;
> > > +#if IS_ENABLED(CONFIG_KUNIT)
> > > +		case __XE_VAL_OPT_OUT:
> > > +			xe_assert(xe, current->kunit_test);
> > > +			break;
> > > +#endif
> > > +		default:
> > > +			xe_assert(xe, false);
> > > +		}
> > > +	}
> > > +}
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> > > new file mode 100644
> > > index 000000000000..db50feacad7a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_validation.h
> > > @@ -0,0 +1,69 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +#ifndef _XE_VALIDATION_H_
> > > +#define _XE_VALIDATION_H_
> > > +
> > > +#include <linux/dma-resv.h>
> > > +#include <linux/types.h>
> > > +
> > > +struct drm_exec;
> > > +struct drm_gem_object;
> > > +struct xe_device;
> > > +
> > > +#ifdef CONFIG_PROVE_LOCKING
> > > +/**
> > > + * xe_validation_lockdep() - Assert that a drm_exec locking transaction can
> > > + * be initialized at this point.
> > > + */
> > > +static inline void xe_validation_lockdep(void)
> > > +{
> > > +	struct ww_acquire_ctx ticket;
> > > +
> > > +	ww_acquire_init(&ticket, &reservation_ww_class);
> > > +	ww_acquire_fini(&ticket);
> > > +}
> > > +#else
> > > +static inline void xe_validation_lockdep(void)
> > > +{
> > > +}
> > > +#endif
> > > +
> > > +/*
> > > + * Various values of the drm_exec pointer where we've not (yet)
> > > + * implemented full ww locking.
> > > + *
> > > + * XE_VALIDATION_UNIMPLEMENTED means implementation is pending.
> > > + * A lockdep check is made to assure that a drm_exec locking
> > > + * transaction can actually take place where the macro is
> > > + * used. If this asserts, the exec pointer needs to be assigned
> > > + * higher up in the callchain and passed down.
> > > + *
> > > + * XE_VALIDATION_UNSUPPORTED is for dma-buf code only where
> > > + * the dma-buf layer doesn't support WW locking.
> > > + *
> > > + * XE_VALIDATION_OPT_OUT is for simplification of kunit tests where
> > > + * exhaustive eviction isn't necessary.
> > > + */
> > > +#define __XE_VAL_UNIMPLEMENTED -EINVAL
> > > +#define XE_VALIDATION_UNIMPLEMENTED (xe_validation_lockdep(),		\
> > > +				     (struct drm_exec *)ERR_PTR(__XE_VAL_UNIMPLEMENTED))
> > > +
> > > +#define __XE_VAL_UNSUPPORTED -EOPNOTSUPP
> > > +#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *)ERR_PTR(__XE_VAL_UNSUPPORTED))
> > > +
> > > +#define __XE_VAL_OPT_OUT -ENOMEM
> > > +#define XE_VALIDATION_OPT_OUT (xe_validation_lockdep(), \
> > > +			       (struct drm_exec *)ERR_PTR(__XE_VAL_OPT_OUT))
> > > +#ifdef CONFIG_DRM_XE_DEBUG
> > > +void xe_validation_assert_exec(const struct xe_device *xe, const struct drm_exec *exec,
> > > +			       const struct drm_gem_object *obj);
> > > +#else
> > > +#define xe_validation_assert_exec(_xe, _exec, _obj)	\
> > > +	do {						\
> > > +		(void)_xe; (void)_exec; (void)_obj;	\
> > > +	} while (0)
> > > +#endif
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 12e661960244..600aaadb4bee 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -393,7 +393,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
> > >  		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
> > >  			       &vm->rebind_list);
> > >  
> > > -	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> > > +	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > @@ -451,6 +451,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
> > >  	if (err)
> > >  		return err;
> > >  
> > > +	xe_vm_set_validation_exec(vm, exec);
> > >  	if (xe_vm_is_idle(vm)) {
> > >  		vm->preempt.rebind_deactivated = true;
> > >  		*done = true;
> > > @@ -516,6 +517,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >  		err = xe_preempt_work_begin(&exec, vm, &done);
> > >  		drm_exec_retry_on_contention(&exec);
> > >  		if (err || done) {
> > > +			xe_vm_set_validation_exec(vm, NULL);
> > >  			drm_exec_fini(&exec);
> > >  			if (err && xe_vm_validate_should_retry(&exec, err, &end))
> > >  				err = -EAGAIN;
> > > @@ -565,6 +567,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >  	up_read(&vm->userptr.notifier_lock);
> > >  
> > >  out_unlock:
> > > +	xe_vm_set_validation_exec(vm, NULL);
> > >  	drm_exec_fini(&exec);
> > >  out_unlock_outer:
> > >  	if (err == -EAGAIN) {
> > > @@ -1375,6 +1378,8 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
> > >  	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> > >  	if (!err && bo && !bo->vm)
> > >  		err = drm_exec_lock_obj(exec, &bo->ttm.base);
> > > +	if (!err)
> > > +		xe_vm_set_validation_exec(vm, exec);
> > 
> > 
> > Do you have imbalance here? I see this function called in xe_pf_begin
> > and xe_vma_destroy_unlocked but I don't see
> > xe_vm_set_validation_exec(vm, NULL) called.
> > 
> > 
> > >  
> > >  	return err;
> > >  }
> > > @@ -2889,7 +2894,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> > >  			err = drm_exec_lock_obj(exec, &bo->ttm.base);
> > >  		if (!err && validate)
> > >  			err = xe_bo_validate(bo, vm,
> > > -					     !xe_vm_in_preempt_fence_mode(vm));
> > > +					     !xe_vm_in_preempt_fence_mode(vm), exec);
> > >  	}
> > >  
> > >  	return err;
> > > @@ -3012,7 +3017,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > >  					    false);
> > >  		if (!err && !xe_vma_has_no_bo(vma))
> > >  			err = xe_bo_migrate(xe_vma_bo(vma),
> > > -					    region_to_mem_type[region]);
> > > +					    region_to_mem_type[region],
> > > +					    exec);
> > >  		break;
> > >  	}
> > >  	default:
> > > @@ -3052,6 +3058,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > >  	if (err)
> > >  		return err;
> > >  
> > > +	xe_vm_set_validation_exec(vm, exec);
> > >  	list_for_each_entry(op, &vops->list, link) {
> > >  		err = op_lock_and_prep(exec, vm, op);
> > >  		if (err)
> > > @@ -3850,10 +3857,18 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> > >   */
> > >  int xe_vm_lock(struct xe_vm *vm, bool intr)
> > >  {
> > > +	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> > > +	int ret;
> > > +
> > >  	if (intr)
> > > -		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> > > +		ret = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> > > +	else
> > > +		ret = dma_resv_lock(xe_vm_resv(vm), NULL);
> > > +
> > > +	if (!ret)
> > > +		xe_vm_set_validation_exec(vm, exec);
> > >  
> > > -	return dma_resv_lock(xe_vm_resv(vm), NULL);
> > > +	return ret;
> > >  }
> > >  
> > >  /**
> > > @@ -3864,6 +3879,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
> > >   */
> > >  void xe_vm_unlock(struct xe_vm *vm)
> > >  {
> > > +	xe_vm_set_validation_exec(vm, NULL);
> > >  	dma_resv_unlock(xe_vm_resv(vm));
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 2ecb417c19a2..4ba26eed7e96 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -321,7 +321,7 @@ static inline void xe_vm_set_validating(struct xe_vm *vm, bool allow_res_evict)
> > >  	if (vm && !allow_res_evict) {
> > >  		xe_vm_assert_held(vm);
> > >  		/* Pairs with READ_ONCE in xe_vm_is_validating() */
> > > -		WRITE_ONCE(vm->validating, current);
> > > +		WRITE_ONCE(vm->validation.validating, current);
> > >  	}
> > >  }
> > >  
> > > @@ -339,7 +339,7 @@ static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict
> > >  {
> > >  	if (vm && !allow_res_evict) {
> > >  		/* Pairs with READ_ONCE in xe_vm_is_validating() */
> > > -		WRITE_ONCE(vm->validating, NULL);
> > > +		WRITE_ONCE(vm->validation.validating, NULL);
> > >  	}
> > >  }
> > >  
> > > @@ -357,13 +357,40 @@ static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict
> > >  static inline bool xe_vm_is_validating(struct xe_vm *vm)
> > >  {
> > >  	/* Pairs with WRITE_ONCE in xe_vm_is_validating() */
> > > -	if (READ_ONCE(vm->validating) == current) {
> > > +	if (READ_ONCE(vm->validation.validating) == current) {
> > >  		xe_vm_assert_held(vm);
> > >  		return true;
> > >  	}
> > >  	return false;
> > >  }
> > >  
> > > +/**
> > > + * xe_vm_set_validation_exec() - Accessor to set the drm_exec object
> > > + * @vm: The vm we want to register a drm_exec object with.
> > > + * @exec: The exec object we want to register.
> > > + *
> > > + * Set the drm_exec object used to lock the vm's resv.
> > > + */
> > > +static inline void xe_vm_set_validation_exec(struct xe_vm *vm, struct drm_exec *exec)
> > > +{
> > > +	xe_vm_assert_held(vm);
> > > +	vm->validation._exec = exec;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_set_validation_exec() - Accessor to read the drm_exec object
> > > + * @vm: The vm we want to register a drm_exec object with.
> > > + *
> > > + * Return: The drm_exec object used to lock the vm's resv. The value
> > > + * is a valid pointer, %NULL, or one of the special values defined in
> > > + * xe_validation.h.
> > > + */
> > > +static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
> > > +{
> > > +	xe_vm_assert_held(vm);
> > > +	return vm->validation._exec;
> > > +}
> > > +
> > >  /**
> > >   * xe_vm_has_valid_gpu_mapping() - Advisory helper to check if VMA or SVM range has
> > >   * a valid GPU mapping
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 8a07feef503b..2f88808e36bb 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -312,19 +312,35 @@ struct xe_vm {
> > >  		bool capture_once;
> > >  	} error_capture;
> > >  
> > > +	/**
> > > +	 * @validation: Validation data only valid with the vm resv held.
> > > +	 * Note: This is really task state of the task holding the vm resv,
> > > +	 * and moving forward we should
> > > +	 * come up with a better way of passing this down the call-
> > > +	 * chain.
> > 
> > 
> > I've already mentioned this, attaching the _exec xe_vma_ops might be
> > good option as xe_vma_ops has lifetime of only existing for the bind
> > (i.e., it is stack variable) so you'd only need to set it (i.e., no
> > clear required).
> > 
> > I think patch largely makes sense.
> > 
> > Matt 
> > 
> > 
> > > +	 */
> > > +	struct {
> > > +		/**
> > > +		 * @validation.validating: The task that is currently making bos resident.
> > > +		 * for this vm.
> > > +		 * Protected by the VM's resv for writing. Opportunistic reading can be done
> > > +		 * using READ_ONCE. Note: This is a workaround for the
> > > +		 * TTM eviction_valuable() callback not being passed a struct
> > > +		 * ttm_operation_context(). Future work might want to address this.
> > > +		 */
> > > +		struct task_struct *validating;
> > > +		/**
> > > +		 *  @validation.exec The drm_exec context used when locking the vm resv.
> > > +		 *  Protected by the vm's resv.
> > > +		 */
> > > +		struct drm_exec *_exec;
> > > +	} validation;
> > > +
> > >  	/**
> > >  	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
> > >  	 * protected by the vm resv.
> > >  	 */
> > >  	u64 tlb_flush_seqno;
> > > -	/**
> > > -	 * @validating: The task that is currently making bos resident for this vm.
> > > -	 * Protected by the VM's resv for writing. Opportunistic reading can be done
> > > -	 * using READ_ONCE. Note: This is a workaround for the
> > > -	 * TTM eviction_valuable() callback not being passed a struct
> > > -	 * ttm_operation_context(). Future work might want to address this.
> > > -	 */
> > > -	struct task_struct *validating;
> > >  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
> > >  	bool batch_invalidate_tlb;
> > >  	/** @xef: XE file handle for tracking this VM's drm client */
> > > -- 
> > > 2.50.1
> > > 
> >
> 
> 
> 
