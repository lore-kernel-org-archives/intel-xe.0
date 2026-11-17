Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4BA606A323
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M+PeLoV1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AwcL1x0V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6B10E00C;
	Tue, 17 Nov 2026 06:44:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3303810E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 06:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794897839; x=1826433839;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=YMAaKW0kL0XNAEoDHdXxF/aDK3G8PCY6e/YNh9AbUVg=;
 b=M+PeLoV1vuRspz1z8IfgGef3hHOrqH7W5NhGS7DmO2kkFzA/d1kt/lG7
 vYRTm2NlXuqwGI4/SC49EkvsVHdIUGlbgXwKfOTqqXoqH0bembVxPfqdb
 q7XLhj2cfnQ04gTW9bULcLv4H8DcRB0wkSeejZbGmx4harZhWTa6wvJdm
 yFcbgA5k8Gg3VCMVAUuiQs2JC8bmtiBiCEQqO4nSNqqWSOIQ/TQ5PO+so
 VYTghjVKczjsLLKbT50DYWAh21s/YvEZDEZHz1m4h/DliNS85zXe61+I8
 28k7Ni1YJv1NurCwa+5NJQ0lmfpK+PH3+D53Gs1QJiO4kQSG1V4ouYLle g==;
X-CSE-ConnectionGUID: pw1L/XZBTmW94Bjr1CEUNw==
X-CSE-MsgGUID: 8+CY+wmqRhOrV0dpIvKNsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3664028"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208,217";a="3664028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 22:38:35 -0800
X-CSE-ConnectionGUID: Z37QUFtNSoKilie+SZo9gA==
X-CSE-MsgGUID: 5vp6jWZtRP+uouKnDkTpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208,217";a="9922448"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 22:38:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 22:38:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 22:38:28 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 22:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMNm3RlDLet4hc/AHi/1Xj40G3ZgrgS/JIXX/w03oSPZYPxW1ZS3TU6uA7QN+M9DkMSkahDE/HDVX6F5kgXWXkXpsJ+hvfu8jeqfPh4Hy6MEe8l3uM9NZetHINsLLitiNOufQyJZKpQgRoeh77mIt+BzNJ8d1shx+sM+MHK+aq1g+jdaz8i+yS14OrA8dw9fuRSj85uKorGaxcpv3TE+l6KYZARKU0VUydlS8jcIb8bR3QoFqciPPsvWlmh4PFOm43I7GRVFaPpXzIXWNp5oAMNY5HZA1Nd9T7X/XvFbpPNu5ZFDKngTvcOt/8kHlNOIedVK29t8TR5cAgrGkW2CzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAOFHkpxfQ+zKOS3D3WQjVjhQQ+iBe4wT0lGad077OE=;
 b=l/F6bT4UwBbxUkjjRmEfoQ1ElLGRtLCIEb7kZaGm5xNBOGDctDgqL1tOu5I3cgpFkK5CF3EMidlQ7HhhCCUfua7Gf/2yqFfGmSYSGj6YW7hrinFZPmpA3l+kS+Lhq6cMs97VI8FkLXTFKTMDhaeJ/ZVcF7C1/P8n4MsTdieEA3LJKs53k1AG7tlRH6irguowZZTpGFr/ZOf4/y03rl+XNaX6mq443irtsLdKiBvqzv04VWvz6BPizZdA6aWAO3miV1P9Xm36Uc5V/0KEtiJoX7w5ohtnLDJ1hXZmruZzU9O/VNFFBMj5z+JGoZMA8HuBK9JuCOgOZDS+WcxPrqgetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAOFHkpxfQ+zKOS3D3WQjVjhQQ+iBe4wT0lGad077OE=;
 b=AwcL1x0VBem9NvsqVp/E3M1UCrw3LFzQlK6UZMekHQVbzc1L9Xe5gI5llbWnBlQV4A7T8oQbLSstOzjSZ3/aod12/YekbqxMQVg43YAwC197RRWdF8xA5thg4h9MZbXLR4SOw/J350PvtMrvLsWIDnY3SAk/x3oPo5/aFErt0mA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:38:20 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 06:38:20 +0000
Content-Type: multipart/alternative;
 boundary="------------70X9lz8d4U0tVSHZFhVM5lob"
Message-ID: <bfe4ccca-f1d8-4901-a209-801ef0095574@intel.com>
Date: Tue, 17 Nov 2026 12:08:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] drm/xe/cper: Prepare CPER headers for software
 errors
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
 <20261112134636.1860446-10-mallesh.koujalagi@intel.com>
 <15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com>
X-ClientProxiedBy: MA5PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::9) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7504d360-2252-4fdf-5968-08df44755eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261009221227099003|18002099003|22082099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: kJLUrTRzzR3wV+tAEqWLC123ZxEpiCX8VdfmvVIbL4WP0F3xdNDCeqB8BHlU2HOUqfbZSYpsjTpnqcyY3V3mGZS0RkvRTnrfX/hzbKH8+t6abBH/jBRIsw62QrX+Z/6zBqFd5LhQj85xAk66GYnnTArQaj2wEFdHj7uS0a6gBUY9VUtWkVae24babGVcXJ/TIQjGZ5YDMJ6qvtGsMEUiw/sust3YWi1hmh7HQfJmkBUzmyw0orn0tP7E21CINyWeXNd2uCJKjoAn3HdrqH7rtsB+5ob1Co4JYieUjnVfbzuGegIycC3I8EbUJFtDGDvfguQdw3uhWMIFGy53ONI7ri+XysNcZcU+LMuY3zWWTJbGNkM5+NQu840lKGOar6upt3Rx5ZUMni0XQYTq48sEqGV/RM+8B10qznBb1OD7QBGvfUru3bqvsxjRMcZTDPWeOzPBWHC0/CH13QKefrwwbv6O6PisnE0MY1EYa8q2J2LE7k0DOulSWTmMgKF9VvyJxozBw//VQRUanW8lnfhcYsfyW0SM5Xx/L31jdwYxLPAOam3NzcBjBmE75ceGTEow+fqyuE99MA091dkHhPYetd2fTNmSfEIlMNuLeQIrFCbq9vWQdaJLgwhEoswM5w6UgClVSbW2LOi7BKo1AUzpSIVFlcJJXgNSDaZ3rCnAIHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2tVQVp1aCtNczRLcitIVkhzSkFxM1RKaVJ5T2daWHFOejlHN2hvRnYvMU9i?=
 =?utf-8?B?bEh1S2J2NkIzUkdSODlYSDV3M2hWVFMxb2FVZkNBa09HNFErSTJ3VDhEb0hw?=
 =?utf-8?B?OU9PTkt5ZzBQRkVUSzZ0VDBTL1NiaVF1OFBjL0dxSVVrU3BJNmJRdGNTd0h1?=
 =?utf-8?B?bnRwZ2NrSXlQdFQ5RHVCMms3WC92Qk5RRmpIN2dreFhzWFMyY05LZlMvRHFW?=
 =?utf-8?B?K1lJeUhkcWwwdU1yYTcvWWZxK2orakdNY0I4a1JoTmMxYXp6N2F6K0tJQ0U2?=
 =?utf-8?B?TWx1ZjJpckdMV0phTTRTcWVwQ0sydVYvZnh5MXZNRy95WlRxaXFBbjhvNWtZ?=
 =?utf-8?B?TmxvMVh3UzQ5dnpXYjhjSDZndXRnWWtBbFdSb1lnaE8ySFV3Vjczc1M0eUZL?=
 =?utf-8?B?ZmFuNmV6K0VKSkZEa3JYS1pNRDhvK0UwRmt1SEN3aGdIcXRDV3ZFaUpUa0tu?=
 =?utf-8?B?NldSN0tTSWhidVlOUFUrZVI5TG10Y25KclpXSE9JWmR0bUp5djUwRStWcmRy?=
 =?utf-8?B?d1ZYOHA3TXF4bzI1dlNoTjVvNlNZMWhoUVQxNHJ6Um03emN2aElqWGFacnly?=
 =?utf-8?B?ZXZUWXNaR3ZPcm9QWTcrNi9wR2RPUTM4eEFPc050YmNzd280S0dSU1JOZFFi?=
 =?utf-8?B?MlNaaDhMSnEreW9MUHdiQm05cWdoL3pDS3lZV0x2NnJKUTMyUWkvb2cxWmVB?=
 =?utf-8?B?SFBEK3Nvb2ltM0FhWEVtMzY5QkY3N1RPRkFqUURCWkthOWNYbHRHcFY2ZS9p?=
 =?utf-8?B?aGRCZHlidXh6VU1jTnpGcFNEU3daNXFGR0FYSTNRNnlyR3BydUhtVnp0NnBJ?=
 =?utf-8?B?TkxhdE45b3c4alVFenZsd3NJdmVwMm9tYmtNWGh1bkhIcXpXZDVSOGFiR1Rk?=
 =?utf-8?B?T1JnbVNTK095emhrVXlRRGFyaUoxYm5QdGk5TVJhWGU3R0VTWVNTSXI2WEJS?=
 =?utf-8?B?ZXJoNlZXL1hMaEYzbUI2UXgxTVY2bTJBZzJKaTdtTjF3MTI2QmxOUHlucllt?=
 =?utf-8?B?L1JVcjBEOXFuR2J2M1VPdTkzVUlyMHV4QnlwNVFWUTBVT1dpeUlwRlRsc1RJ?=
 =?utf-8?B?amRPZjdVN0U0b1RjNnNzSXJRT1NHL3M0M00xVlZkRE53aDVVanNyZEFTQW0x?=
 =?utf-8?B?bzJtUytXNlZoZmNYNFhYK0JpZ3BHeWFUcVVnRExOenZiYjIzMkZ4a0VhRjJJ?=
 =?utf-8?B?dEF2ZmVieSszb2dva1JsREpQdDFlWHQwY0UwTWpTSXkxLzR1bkM3R1N1WGlW?=
 =?utf-8?B?aGNkb2VWWEhsK2hjK3prU2tMdFdJNGlkOUIyL2tKcjNKTlMrbmRSU0Z0T29E?=
 =?utf-8?B?ZFBjUlM5K041Q29ybEZnUGMzRmVRSCs5VC9PeWxoekxLeU1ER3J5U004cjVK?=
 =?utf-8?B?dXREMEJSTmZtU1ZZeVdMa2kwQWJkU3RIYXZqaU15VlVPNzl1WjM3OXFLQmM0?=
 =?utf-8?B?NUs4bURNb1JVUkZPTkpJakppS1JKWnM1M05wWnFOb1ZZZWpnUllQeW44VUpq?=
 =?utf-8?B?ZEh2V0kyYjVqYjNneVk5b3U4Ykc0Y0Zra0IwKy9Ib20rWUlvVm9icGVNUnFE?=
 =?utf-8?B?dXN3Nk9TSlhKS1NkbUtyL0ozWEtFS1dGM2xyZzJmQm05S1JvRVRPb0FjcHRR?=
 =?utf-8?B?Nmd3UnNSWkx0OHQ0aWgrSE9Ub3N4K1VyWTM1SERudTJPcUdUakVOS0JKU2k0?=
 =?utf-8?B?OGduTy9TZjJUZnNXRFMxR045NkdvQ2dCd1RuMjV0aExhdWhuTUhRM2ptaDZy?=
 =?utf-8?B?cU54aTNpaTBPZ2VyUTIyS3ZaaGVJYlVxeTNsQ0JTRng0Tk9UeVJJZTZpTEVF?=
 =?utf-8?B?TlMyYTBQbTNoZjZHcTUwd1FlN1R3UHhZUUxPSklqa1RicVpyRDkrQ09EUEtD?=
 =?utf-8?B?OTZWcFlXWVlFaW8wbHV6aVBENzZ0UnJxa0tBNGdFd3E0ME9FV29VVWdneFBy?=
 =?utf-8?B?a281OW5keUdyek5OeVU3VWd6YUhnblJzMWJoSDQ4Z1ZhSXZWYUIxcmpkRy9B?=
 =?utf-8?B?WkRFeEY2THZZdU9zQksySmw2SmpYKzlvZk8ySzBIc3YrWGtON1ZTcmxHcFll?=
 =?utf-8?B?cW42VVFYNlVXUFhMQVdxcmQ3Q3V5cjhGaWg1U2JTdmdJdm5JU2JzVldQSGpG?=
 =?utf-8?B?ZzJscDFFZWlESlRqd0liaVAvQ3FiQmFOL3JtQTExR29VU1hPa1h0dkV1NnlB?=
 =?utf-8?B?VWRibXFvYko2eEdVcDYxcnRPL0ZDY3VlU0NyOWVobkhoOXBHOHJ6d0tNWHMz?=
 =?utf-8?B?WXJ6VHJ5aGtYa2d2aitibjhWOFRLd2g0VE55ZC9lMUVnLzFrVXFwZmgwSlFv?=
 =?utf-8?B?b1dFajZaaklueVZuYWpVdkxHOXNIWlJWYUpvYlp1RWQybzZGN1RRUUZoVEx0?=
 =?utf-8?Q?JLRc63WazrDPtBB8=3D?=
X-Exchange-RoutingPolicyChecked: xOJLHQu2eE2a+2xbPEEEhti4fHB3z9hS+tw8RLBfQbeU7ZjLe6rhYe9GIlpv7OCnM/laNrZDeL6ga7x86OAKLR1UK4reFosYKlLWFbePVENUrRRYi+DpAflBzME2AxJ9zhrdPlgXDeUGuf73GHn6zAa9hAuUbjQT7lBxP6UAd1vJJdixIpafSp71FSKDA0FgezSS+fjvHU3WpucLya7shP0x3uWMWlPFj+RIAQnZOpm7KiiTYEs3E66pPWXWQGHIWr644EsBlM9c+l26AoloNEg4qy0o6oVzXtl6Q+S2VxBNOKQOPQEGP3bYr1HGqfYOJRNX6jVeoD87q22WlkPVXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7504d360-2252-4fdf-5968-08df44755eb1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:38:20.4231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeYc/2S5f3YSC8zGCAnaPKPfldljrJfgUqaKdyGnv5HeXZ5qH0Zw6wJKEtJ+ywS9ClFewZ0qeO9o6hp5Z/0ZH5dYuO89vPLSpvCHPaAdWhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------70X9lz8d4U0tVSHZFhVM5lob
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17-11-2026 11:19 am, Nilawar, Badal wrote:
>
> On 12-11-2026 19:16, Mallesh Koujalagi wrote:
>> Add software error classification support and reuse the
>> common CPER header initialization path.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Move union inside xe_cper_intel_hdr structure. (Badal)
>>
>> v3:
>> - Introduce structure where it's used. (Badal)
>> - Move error-class union inside cper_init_intel_hdr. (Badal)
>>
>> v4:
>> - Update commit message. (Badal)
>> - Use ktime_get_real_ns.
>> - Add BUILD_BUG_ON. (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 24 ++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_cper_types.h | 34 ++++++++++++++++++++++++++++--
>>   2 files changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index dd6d4251dd1d..b23f8bc9f993 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -14,6 +14,8 @@
>>   #include <linux/time.h>
>>   #include <linux/timekeeping.h>
>>   +#include "abi/xe_log_abi.h"
>> +
>>   #include "xe_cper.h"
>>   #include "xe_cper_types.h"
>>   #include "xe_device.h"
>> @@ -92,11 +94,14 @@ static u64 cper_timestamp_now(void)
>>       return ts;
>>   }
>>   -static void cper_init_intel_hdr(struct xe_device *xe, const struct 
>> xe_ras_error_class *counter,
>> +static void cper_init_intel_hdr(struct xe_device *xe, const union 
>> xe_cper_error_class *error_class,
>>                   u64 first_timestamp, u32 sig_id, u32 error_count,
>>                   struct xe_cper_intel_hdr *ihdr)
>>   {
>> -    ihdr->counter = *counter;
>> +    BUILD_BUG_ON(sizeof(struct xe_ras_error_class) !=
>> +             sizeof(struct xe_cper_driver_error_class));
>> +
>> +    ihdr->error_class = *error_class;
>>       ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>>       ihdr->sig_id = U32_MAX;
>>   @@ -219,11 +224,12 @@ void xe_cper_emit_counter(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid sigi
>>                 const struct xe_ras_error_class *counter,
>>                 const struct xe_ras_get_counter_response *response)
>>   {
>> +    union xe_cper_error_class error_class = { .counter = *counter };
>>       struct xe_cper_intel_hdr ihdr = {};
>>         xe_assert(xe, is_hw_sigid(sigid));
>>   -    cper_init_intel_hdr(xe, counter, response->timestamp,
>> +    cper_init_intel_hdr(xe, &error_class, response->timestamp,
>>                   sigid, response->value, &ihdr);
>
> This can go in single line.
hmm, ok.
>
>>       cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, 
>> &ihdr, NULL, 0);
>>   }
>> @@ -249,6 +255,18 @@ static void cper_emit_sw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>                    u32 component, u32 location, const void *data,
>>                    struct va_format *vaf)
>>   {
>> +    union xe_cper_error_class error_class = {};
>> +    struct xe_cper_intel_hdr ihdr = {};
>> +    struct xe_cper_driver_error_class *driver = &error_class.driver;
>> +    u64 timestamp = ktime_get_real_ns();
>
> Same as rev3: Initialize timestamp closer to its use. Please do the 
> same for driver and maintain reverse Christmas tree ordering.
>
Sure, I will make ktime_get_real_ns*()* call closer to use.
>> +
>> +    driver->error_type = cper_sev;
>> +    driver->error_component = component;
>> +    driver->tile = location;
>> +    if (IS_ERR(data))
>> +        driver->cause = -PTR_ERR(data);
>> +
>> +    cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h 
>> b/drivers/gpu/drm/xe/xe_cper_types.h
>> index 68e30df0440e..8e90a3220919 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -45,6 +45,29 @@
>>       GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>>             0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>>   +/**
>> + * struct xe_cper_driver_error_class - Intel GPU CPER 
>> driver-detected error classification
>> + */
>> +struct xe_cper_driver_error_class {
>> +    /** @error_type: CPER severity: CPER_SEV_* */
>> +    u8  error_type;
>> +    /** @reserved0: Reserved, must be zero */
>> +    u8  reserved0;
>> +    /** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
>> +    u16 error_component;
>> +    /** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 
>> 'GT' field region) */
>> +    u16 tile;
>> +    /** @reserved1: Reserved, must be zero */
>> +    u16 reserved1;
>> +    /** @cause: errno of the failing operation, or 0 if none */
>> +    u32 cause;
>> +};
>> +
>> +/* Same size as the counter-sourced error_class */
>> +#define XE_CPER_ERROR_CLASS_SIZE    12
>> +
>> +static_assert(sizeof(struct xe_cper_driver_error_class) == 
>> XE_CPER_ERROR_CLASS_SIZE);
>> +
>>   /**
>>    * struct xe_cper_intel_hdr - Intel-specific CPER header
>>    *
>> @@ -52,8 +75,15 @@
>>    * All multi-byte fields are little-endian.
>>    */
>>   struct xe_cper_intel_hdr {
>> -    /** @counter: Error class (severity, component, location, cause) */
>> -    struct xe_ras_error_class counter;
>> +    /** @error_class: Error classification */
>> +    union xe_cper_error_class {
>> +        /** @error_class.counter: Error class (severity, component,
>> +         * location, cause)
>> +         */
>
> Keep this in single line.

Ok,

Thanks,

-/Mallesh

>
> Thanks,
> Badal
>
>> +        struct xe_ras_error_class counter;
>> +        /** @error_class.driver: Driver-detected error 
>> classification */
>> +        struct xe_cper_driver_error_class driver;
>> +    } error_class;
>>       /** @first_timestamp: First occurrence of this error class, in 
>> ticks */
>>       u64 first_timestamp;
>>       /** @sig_id: Aggregated error class SIG ID; set to U32_MAX if 
>> unknown */
--------------70X9lz8d4U0tVSHZFhVM5lob
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-11-2026 11:19 am, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com">
      <br>
      On 12-11-2026 19:16, Mallesh Koujalagi wrote:
      <br>
      <blockquote type="cite">Add software error classification support
        and reuse the
        <br>
        common CPER header initialization path.
        <br>
        <br>
        Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
        <br>
        Signed-off-by: Mallesh Koujalagi
        <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
        <br>
        ---
        <br>
        v2:
        <br>
        - Move union inside xe_cper_intel_hdr structure. (Badal)
        <br>
        <br>
        v3:
        <br>
        - Introduce structure where it's used. (Badal)
        <br>
        - Move error-class union inside cper_init_intel_hdr. (Badal)
        <br>
        <br>
        v4:
        <br>
        - Update commit message. (Badal)
        <br>
        - Use ktime_get_real_ns.
        <br>
        - Add BUILD_BUG_ON. (Raag)
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_cper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 24 ++++++++++++++++++---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_cper_types.h | 34
        ++++++++++++++++++++++++++++--
        <br>
        &nbsp; 2 files changed, 53 insertions(+), 5 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_cper.c
        b/drivers/gpu/drm/xe/xe_cper.c
        <br>
        index dd6d4251dd1d..b23f8bc9f993 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_cper.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_cper.c
        <br>
        @@ -14,6 +14,8 @@
        <br>
        &nbsp; #include &lt;linux/time.h&gt;
        <br>
        &nbsp; #include &lt;linux/timekeeping.h&gt;
        <br>
        &nbsp; +#include &quot;abi/xe_log_abi.h&quot;
        <br>
        +
        <br>
        &nbsp; #include &quot;xe_cper.h&quot;
        <br>
        &nbsp; #include &quot;xe_cper_types.h&quot;
        <br>
        &nbsp; #include &quot;xe_device.h&quot;
        <br>
        @@ -92,11 +94,14 @@ static u64 cper_timestamp_now(void)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ts;
        <br>
        &nbsp; }
        <br>
        &nbsp; -static void cper_init_intel_hdr(struct xe_device *xe, const
        struct xe_ras_error_class *counter,
        <br>
        +static void cper_init_intel_hdr(struct xe_device *xe, const
        union xe_cper_error_class *error_class,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 first_timestamp, u32 sig_id, u32
        error_count,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_cper_intel_hdr *ihdr)
        <br>
        &nbsp; {
        <br>
        -&nbsp;&nbsp;&nbsp; ihdr-&gt;counter = *counter;
        <br>
        +&nbsp;&nbsp;&nbsp; BUILD_BUG_ON(sizeof(struct xe_ras_error_class) !=
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(struct xe_cper_driver_error_class));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ihdr-&gt;error_class = *error_class;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ihdr-&gt;validation_bits |= XE_CPER_VALID_LOCATION;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ihdr-&gt;sig_id = U32_MAX;
        <br>
        &nbsp; @@ -219,11 +224,12 @@ void xe_cper_emit_counter(struct
        xe_device *xe, int cper_sev, enum xe_sigid sigi
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct xe_ras_error_class *counter,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct xe_ras_get_counter_response
        *response)
        <br>
        &nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp; union xe_cper_error_class error_class = { .counter =
        *counter };
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_cper_intel_hdr ihdr = {};
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_assert(xe, is_hw_sigid(sigid));
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; cper_init_intel_hdr(xe, counter, response-&gt;timestamp,
        <br>
        +&nbsp;&nbsp;&nbsp; cper_init_intel_hdr(xe, &amp;error_class,
        response-&gt;timestamp,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sigid, response-&gt;value, &amp;ihdr);
        <br>
      </blockquote>
      <br>
      This can go in single line.
      <br>
    </blockquote>
    hmm, ok.
    <blockquote type="cite" cite="mid:15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com"><br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cper_record_emit(xe, cper_sev,
        &amp;INTEL_CPER_NOTIFY_GPU_ERROR, &amp;ihdr, NULL, 0);
        <br>
        &nbsp; }
        <br>
        @@ -249,6 +255,18 @@ static void cper_emit_sw_err(struct
        xe_device *xe, int cper_sev, enum xe_sigid s
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 component, u32 location, const void
        *data,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct va_format *vaf)
        <br>
        &nbsp; {
        <br>
        +&nbsp;&nbsp;&nbsp; union xe_cper_error_class error_class = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_cper_intel_hdr ihdr = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_cper_driver_error_class *driver =
        &amp;error_class.driver;
        <br>
        +&nbsp;&nbsp;&nbsp; u64 timestamp = ktime_get_real_ns();
        <br>
      </blockquote>
      <br>
      Same as rev3: Initialize timestamp closer to its use. Please do
      the same for driver and maintain reverse Christmas tree ordering.
      <br>
      <br>
    </blockquote>
    Sure, I will make ktime_get_real_ns<b>()</b> call closer to use.
    <blockquote type="cite" cite="mid:15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com">
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; driver-&gt;error_type = cper_sev;
        <br>
        +&nbsp;&nbsp;&nbsp; driver-&gt;error_component = component;
        <br>
        +&nbsp;&nbsp;&nbsp; driver-&gt;tile = location;
        <br>
        +&nbsp;&nbsp;&nbsp; if (IS_ERR(data))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; driver-&gt;cause = -PTR_ERR(data);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid,
        1, &amp;ihdr);
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; /**
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_cper_types.h
        b/drivers/gpu/drm/xe/xe_cper_types.h
        <br>
        index 68e30df0440e..8e90a3220919 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_cper_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_cper_types.h
        <br>
        @@ -45,6 +45,29 @@
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
        <br>
        &nbsp; +/**
        <br>
        + * struct xe_cper_driver_error_class - Intel GPU CPER
        driver-detected error classification
        <br>
        + */
        <br>
        +struct xe_cper_driver_error_class {
        <br>
        +&nbsp;&nbsp;&nbsp; /** @error_type: CPER severity: CPER_SEV_* */
        <br>
        +&nbsp;&nbsp;&nbsp; u8&nbsp; error_type;
        <br>
        +&nbsp;&nbsp;&nbsp; /** @reserved0: Reserved, must be zero */
        <br>
        +&nbsp;&nbsp;&nbsp; u8&nbsp; reserved0;
        <br>
        +&nbsp;&nbsp;&nbsp; /** @error_component: Driver component id:
        CLASS[7:0].TYPE[15:8] */
        <br>
        +&nbsp;&nbsp;&nbsp; u16 error_component;
        <br>
        +&nbsp;&nbsp;&nbsp; /** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile'
        and 'GT' field region) */
        <br>
        +&nbsp;&nbsp;&nbsp; u16 tile;
        <br>
        +&nbsp;&nbsp;&nbsp; /** @reserved1: Reserved, must be zero */
        <br>
        +&nbsp;&nbsp;&nbsp; u16 reserved1;
        <br>
        +&nbsp;&nbsp;&nbsp; /** @cause: errno of the failing operation, or 0 if none */
        <br>
        +&nbsp;&nbsp;&nbsp; u32 cause;
        <br>
        +};
        <br>
        +
        <br>
        +/* Same size as the counter-sourced error_class */
        <br>
        +#define XE_CPER_ERROR_CLASS_SIZE&nbsp;&nbsp;&nbsp; 12
        <br>
        +
        <br>
        +static_assert(sizeof(struct xe_cper_driver_error_class) ==
        XE_CPER_ERROR_CLASS_SIZE);
        <br>
        +
        <br>
        &nbsp; /**
        <br>
        &nbsp;&nbsp; * struct xe_cper_intel_hdr - Intel-specific CPER header
        <br>
        &nbsp;&nbsp; *
        <br>
        @@ -52,8 +75,15 @@
        <br>
        &nbsp;&nbsp; * All multi-byte fields are little-endian.
        <br>
        &nbsp;&nbsp; */
        <br>
        &nbsp; struct xe_cper_intel_hdr {
        <br>
        -&nbsp;&nbsp;&nbsp; /** @counter: Error class (severity, component, location,
        cause) */
        <br>
        -&nbsp;&nbsp;&nbsp; struct xe_ras_error_class counter;
        <br>
        +&nbsp;&nbsp;&nbsp; /** @error_class: Error classification */
        <br>
        +&nbsp;&nbsp;&nbsp; union xe_cper_error_class {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @error_class.counter: Error class (severity,
        component,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * location, cause)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
      </blockquote>
      <br>
      Keep this in single line.
      <br>
    </blockquote>
    <p>Ok,</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:15eee851-2dc4-4ee4-8e7f-12eceb43f54e@intel.com"><br>
      Thanks,
      <br>
      Badal
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_ras_error_class
        counter;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @error_class.driver: Driver-detected error
        classification */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_cper_driver_error_class driver;
        <br>
        +&nbsp;&nbsp;&nbsp; } error_class;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @first_timestamp: First occurrence of this error
        class, in ticks */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 first_timestamp;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @sig_id: Aggregated error class SIG ID; set to U32_MAX
        if unknown */
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------70X9lz8d4U0tVSHZFhVM5lob--
