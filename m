Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AACC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 10:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EA910E0B4;
	Thu,  7 Aug 2025 10:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJVj31q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE3210E0B4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754562833; x=1786098833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Dne9vFkkxbI/62XfgWaeVov217Ldq8eBgJCveUDLEc=;
 b=gJVj31q9zxHBfJkgBWXnVPUvJ4t0S4p+9p20HxSJZF2GK0CRf9+7b/my
 Vz+VCZXih67IU4uUIqF2Zs42tI+J+GJM5AwZ61aV+K1V/Mc1bzS1tzvv1
 LWo81yCG8IcMos/rS0HrpJf6+KnNG4V0/Tb6TsltP+nFetCjTnk0OaEob
 B8SlK+CUNiywAlSA0qbXFglsoLAy9F1ACSZGBO/0sS2xqW2AaZb6VpGFf
 vHfgisVYYNN2HD7bFFj0F3RFeu6mdXqSKnuYzQ0VMiHgdYG66mWrUVOEG
 oNi5J3L5OYjv0Lj1riCCMF9a7uOzZNRL5eFXdsFzdq3RYNxlveb8eDPH/ A==;
X-CSE-ConnectionGUID: zNuiy9XASOO1yWlCUan23A==
X-CSE-MsgGUID: 5+uyZDeWTkmz8HzYPAm6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60734352"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="60734352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 03:33:52 -0700
X-CSE-ConnectionGUID: QQN+SdnVS7Sy5PRQqzxjkg==
X-CSE-MsgGUID: 6lNtD+cvRmS06FA75KRvcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169281758"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 03:33:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 03:33:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 03:33:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.76) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 03:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+BrexEVHbX4OAmhuWyF+ytjxpzBb+rZlAnV8/DK9X15X/RjQlnS8Xw5F/r6JxpDH7Qh+3Ykb9+O9sM87rMTAcSuX1mTF6gEunIgr8j5lousIatBvBiUGynLF1CQZR0I6XWnDQeKF9pTDYoljjbEJxHVjkB4MGpj9Pm40418JWuy5mp18bKXlAHFL6vMPvYooYsBi2BdYtMmcpREpIYlmvH9jK3/jdwALueuw1BRRAeKn/jzVNSt9QoX2N68m6ZueliU4SAgvBe9UhG21V9m0wd/n2hbMp/zAg/NlMU75sWtGbkD2WBOwJIHOMuyLTBKb1MW14a0yWE7Tb1g0BxzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0M6PiCU8YEYrY5E6GYB3EyuAwchbvyWsF4g147o8qo=;
 b=GqwPqUgeLHIZz+vQuI5OlqdLO+DL1bk2F0Tm4u65k7KIZM69LMFU4bvKT8CNMk9BWaeOwW/GTgLjXZ3vhRp63bruHxWN6X6vipQpxgEn8f/VO1NQ0ieJt7IQLiqEStOJUWUN5orC78YPihutwycHaBSca3y0Y3H84N7zQp0xcAQbaqxIlgyroqGFfuQ02krwz7lgeIREEPWO48qY9TjyxLiJGoN7jAprLbDEP7UqOZ2Eg45sRorWQeEINoGkuGAE8kZoe21CPlWPr7pNx6CQhVY/uwuq5hCV55SirFckPatssZKFwvB3JZjL7g1C94GnQU6Q59aM17vofT8I1BX8PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 10:33:50 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 10:33:49 +0000
Message-ID: <1d47f02d-2824-485a-ab4d-002cbfb06f1d@intel.com>
Date: Thu, 7 Aug 2025 16:03:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Add SW clamp for power limits writes
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250806172626.3226676-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250806172626.3226676-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 862b21a6-0c62-48bc-6a3a-08ddd59de584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEFiUHdHSS9Ob2VTNlBKRk5HbWxKZVI5M3ZmbkZtNEZnc2F2U0JJNGlzN2ZY?=
 =?utf-8?B?M2hLdU42QVBlcGpxai9jOGR3ZmZZU1NjN2Y1KzNEb2VJS1NaMWczSzdMNjZT?=
 =?utf-8?B?UVk4NlUvblFtQzViNzlNZzZyMkdLVHpTV3NDVktuWllEYVY2aitXR0dsOURV?=
 =?utf-8?B?RlkxYlZ3VW9sVFp2dTl4dGdhb0poUnZubytJeFF6UFJiSmlEK2szWEFxcHkv?=
 =?utf-8?B?RU9YbmU5R0dqSVlqS0xsWVViWlkzSWtXeFV6RmpPcDF5M2pJbm5ibWFoV1B5?=
 =?utf-8?B?eUFOMWJMcGZockU1UDd2b3htc2xEUlAxMXFjdHhHc2U2bmk3b2sxb2VrTk5u?=
 =?utf-8?B?VEVVU1poK3Y3K1UzY0FiYWY5bDBVZ2Z2UmxvV2xqTkhWV2lHcXBZNUdUTEdn?=
 =?utf-8?B?N2JkdmpwMFFNeUhVREFOcEdPdkpzTVhqOWdoZEZLamt3MzNLV3FNSXU0Sndy?=
 =?utf-8?B?MjdPSFBPY2VxcXIzRTRLNnkrejk4cy9pancyZDl4bmJIWGpFNk4wYm92MDdx?=
 =?utf-8?B?aVFwZndHNHVVQ1gyNXZhbEh1MDViV1VQSjU0Y0c3WEQ2eXBIQnIramRyL2Mz?=
 =?utf-8?B?RURmdkJNWTRKN0FQSFRiYWl2N2VCV0NyUnk5TUNhR0NEMVBVMEl1bHUzUlNW?=
 =?utf-8?B?QStkL0oyS3BKdFJCTzdacElZZmdjY3owVnZ2NUtsYzRRWGNuQzNwakNKcVJC?=
 =?utf-8?B?M1JWYTc4S2czM29iOHRLbDRjZ0lZMzIvTldFcldXYjdPU1QydEFFekd6dUJ4?=
 =?utf-8?B?VHNVK2hmRUl3RXF6bWFsb2ROeEFiM2FtZkI1SWZMRVE4dkphYTVQcm1Raldv?=
 =?utf-8?B?ZE1Vem9KREZaaFQvSmRXNGVNOEYwZ2c1c0p5TlJRaXNqaGVYRllsN2NrMGIr?=
 =?utf-8?B?WTgyL3FFdFgxanhyZHQwSTFUTVlzQTdKbXVKRVdEcmdwK1dMVnk2QnhlSnE1?=
 =?utf-8?B?RTROK2ZscVoza2dYWUdrY2tnVTBxWElvZ1Q4NE1SVzJxN0gydUQzQzM5a3dF?=
 =?utf-8?B?cFJZd0wra3lnN3BobEk1QURmb3Z3SGF0M08zcno5dDlONU9MampMeDhKZi9T?=
 =?utf-8?B?RDJVb1lOVlZkVDQ0Y1cza2srQmVSSUU0M0tCU1p0NituZlR0bTdOS2FadVh6?=
 =?utf-8?B?QjB0SmZvWVQ5bXdCazZ5SUpsU3UxaFZGSy9rcjR5NllGbXErUHhrMGJ3VzIx?=
 =?utf-8?B?TnM4VWJmalFnTkZjdmJlOWZwNW5sczk3Zk9KK2s2WUdMTVFqWmlVa0d4QlRV?=
 =?utf-8?B?TGxJVHpJc2I2VUp4RUJKYUN2cHAzbnJLWThiTFE1bDhNcDYrUEFRTVA3eFpT?=
 =?utf-8?B?b3dleFRoVHk4bHZwZC9hMU1KOFd0ZjdwdnowTDREVWhaTkQ5T0FJenZIcE9D?=
 =?utf-8?B?R2c2S0xCNFZ3ejhXa0RkS2RHc0YxZVBvZFpzRzgzcHFvWklkazF0bkFUaTVS?=
 =?utf-8?B?bTJPTmNGU3NybThYclpVYkVONTE3Nlg4L0FKMmhMNVlKOGNlZjR4ajQ5SjBu?=
 =?utf-8?B?c2MrRHFYb0Z5OHVicWk2clJ3MWlaR2p6MVNWbTgxbUdBSmlJR3RzOGN5bjkz?=
 =?utf-8?B?R3NDVXlmTzB2RVhKMlRydTBUUlFzVzJYbWN6QjhQN0pLUTdWWENCLzV5cE1I?=
 =?utf-8?B?bG5nRjE2T0h1bmtnQVNpYWZHR3VxVmFya0tmR3YwNHdOSmo4Q1Z1Z2tJSmp3?=
 =?utf-8?B?OFhBbVZIc3VUUitIOStMOUR1YW1heUhRRnBaQmdIOGxmd1BYbDNNd0o2d2Zp?=
 =?utf-8?B?OHh4UVdHaGZ1SytQakIxUm1hNC9JV0tGd1JBaCtmbit3a0tFdXluNlZXVDN2?=
 =?utf-8?B?Q3k3aUNORFBpVDgwcmU2elJLald5N0JpQUJydUxveFBtZTVLS3BxSEQ0MW9w?=
 =?utf-8?B?cTUvRjJWcmlSdjlRVEIwRjZ3c0JVZ1ZjejRNaUVUbUVHWTNLYXd4OHFJSTRy?=
 =?utf-8?Q?lKMxM8y9CQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBKditmMllYTmhCQSt5L25WZWhpbXB3UEJXb2lzUER5SXFNcDdkUlR3UUR3?=
 =?utf-8?B?b2RBSERReHZ5YjJuQTQ5cEZJcU05SU41alNuMGdWWTVYRFl6NWRVNE5uelIw?=
 =?utf-8?B?WGo4M05INndlVUxhbXZBRG1acEJCRUdEYkNSREZJWXVIdk5veXp6WlZMRGhY?=
 =?utf-8?B?QVQ2SmYvU2l0OGNaYTkxWUJkTk1HSHp5TklWZjU3Wk9UUklXTVRvdm9oa3FU?=
 =?utf-8?B?NWhLVGtCVTIrTFJNOTB6YVpGaC9JWEdVanJKMUhmL3dzRG0xUzkvaWdnRGNr?=
 =?utf-8?B?T3RNalVqOFFOL0RHVzVGdTduUmxzNjdJZ0djMDlJMUliaVhLS21TT1Zab3Zl?=
 =?utf-8?B?a0JnRlFhaHRoOVlZakIvRVRPVittdTlvN1JqSzcrTzlnUkVIbzNYekg2bGc2?=
 =?utf-8?B?c1A5TVBNazJ3T3RrbWJOa0NKbUVya3BDTFdKWjdsMzRtZmhTd0xVZ05UUnQw?=
 =?utf-8?B?RGMwZWxOOHJjY2dINDBTUFBvczN2aVh0R0p2THNpUTlqYllzb09QWGlEZ3gx?=
 =?utf-8?B?Y1dnOVBZWmFZNGZHQzhiU29pRjdFeDA0U1dNR3BJRzRKQTZnRHVMSDBRTmsw?=
 =?utf-8?B?U3hUMVNIdXZxbStuUUlzRWthMHBOdXdVcC9PMHExalpVbVpzTXJzN0pFNVQ1?=
 =?utf-8?B?aG1HKzYzUk5aQXNiK0RXa1F4WVJUV0lSMHVNemVjZFl3SlFZdGd5dEU2WDNy?=
 =?utf-8?B?ME1qNGh4bnQxZC90WHI1NHlPQXFKL3daMHBIUEJpbUpQRXc2aml0cS9GT0Ri?=
 =?utf-8?B?RU5mTWRYYTJidUx6emhXeEJZdlZGMDIrRkg2blY5UGhGM2tCQ1QrUk1CNmRv?=
 =?utf-8?B?L1ZGblNyZnduZjY5MFVEM0FaWXJYdFREaVRERk1kRVdVYm1lY2phQTRFRmVE?=
 =?utf-8?B?KzcvT3NpTG9Nb0V3dlpvVVl0bXZBcEd4cDBoWFVxSkJudGtFWkl0TmRlRDRw?=
 =?utf-8?B?eU4wS0VBemZmbjlBL0MzUWo4OTBVdTFXbUlxeGFHRUN2RjRxVm1rb2NuTzdZ?=
 =?utf-8?B?SWsvRkhUT0dBT0VxUStySFYyQVBPekxZVkJvRU5TSjdRSVZwaUNIRHRWNXRY?=
 =?utf-8?B?ZklBZWcwUjl6M25HeGR5a1hJU3Vnd2V2NDBFNE5mbVgyZU1WNXljKytqSzQw?=
 =?utf-8?B?cTJXZjF0dlFjVUlNTEc0RVVabm84TTZubTRkb0JQZ1pLVmMwUkxkcjV5NjJm?=
 =?utf-8?B?VGZEY3J1K2tjNU50T1ZzS3RGYVpycGJxYnRsRldJUjZEQ1I0TVY2OVoyTUZS?=
 =?utf-8?B?SHV3R1pmSWVmQXpQc0Z1Sm41SCtDaVpwV25HWHMzcUUwRWFRSlc4UTQ3VjZB?=
 =?utf-8?B?c1dSVGtYQnpFelN4L3FTZzBsOUJmTHBkbzdYUUhNVXVrMm44bkI1TXFLQmg4?=
 =?utf-8?B?cERKZGhUNjNRZ29vZmx2VE0wS05raGI0NEJBWHF6Sy90cTVLdVVuOU8xbExI?=
 =?utf-8?B?b0RJQUFaT1N1T242QWhSVkQxWHhjYXZQRmtvQnV0Tm5ickJSNWRtN0JJc2ZP?=
 =?utf-8?B?ei9yUjI2QndBYzMzTVRvZ2p0UFE2eDA3ZjY4aU5VZEtmR2g3Tk5RSUozSW50?=
 =?utf-8?B?dHY4bUpxWmxTNzIrTnc0Rmh6TFNMck8zMUhMS21JdDRQVFlNZm1FZ25KS09U?=
 =?utf-8?B?ZmZlS2ZZK3g3Rk9WOXJmOU9VSjlKWFk4UHl5eEhGem8rMjkrWmVDQzREaUdq?=
 =?utf-8?B?OFBudU54OVdMa1VCSFJ6em1kZkRDNGtLSHNCRDRqOE1WUXVaYTd4cjRkU08y?=
 =?utf-8?B?bko1TTlKaEowTGxUeHhycGlLUWV1Q2hSSS9jMVMzS1dIbHZzckFoSzZVcW5o?=
 =?utf-8?B?NjFqR2VtSnJtaWhwdld0NUpUMytDaEFWR1BETXFnaHNBUmpGUG0reHA2WEpC?=
 =?utf-8?B?R1BkMktqOVlmZlBIa2pQZjJ4dDU5b3RuSnRMMnZZQlNBbG1wV2NBRWxLSUJt?=
 =?utf-8?B?Q2ZtTVFKMVd4QmVqZS95RWFWaWxZcWNhK2l2TUcyOE9sUGFobGRKMER5Q3hD?=
 =?utf-8?B?M2dUTytJMXF4dEdDN21KMWhidzBuRjdxdG0ya3pLVDdEM0dpOFlDR3dXT1p0?=
 =?utf-8?B?LzJxbWNTVVliMnNkdzdQMEl3OUwwVDdZMmJDY2VvaC9RSzJZMmlhbUtmWkJ3?=
 =?utf-8?B?NmJOTnI2c2ZGa2haTXNPZDh3SStUaDBXYXRKNkFIdTZDTm1sTTc1eHFRTDN1?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 862b21a6-0c62-48bc-6a3a-08ddd59de584
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 10:33:49.7382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EsOEqkM+aOT7/jAho9lAB/YTsT73kEhZop+TdgxOnm38WNRjpo91j4d1C3rV08RQZovpZ2mYtvLZhDcL2uyUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
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


On 06-08-2025 22:56, Karthik Poosa wrote:
> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
> powerX_max, to the maximum supported by the pcode mailbox
> when sysfs-provided values exceed this limit.
> Although the pcode already performs clamping, values beyond the pcode
> mailbox's supported range get truncated, leading to incorrect
> critical power settings.
> This patch ensures proper clamping to prevent such truncation.
>
> v2:
>   - Address below review comments. (Riana)
>   - Split comments into multiple sentences.
>   - Use local variables for readability.
>   - Add a debug log.
>   - Use u64 instead of unsigned long.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..768a942ab0e7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   	int ret = 0;
>   	u32 reg_val, max;
>   	struct xe_reg rapl_limit;
> +	u64 max_mbx_power_limit = 0;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>   		goto unlock;
>   	}
>   
> +	/*
> +	 * If the sysfs value exceeds the pcode mailbox cmd WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
> +	 * max supported value, clamp it to the command's max (U12.3 format).
> +	 * This is to avoid truncation during reg_val calculation below and ensure the valid
> +	 * power limit is sent for pcode which would clamp it to card-supported value.
> +	 */
> +	max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER;
> +	if (value > max_mbx_power_limit) {
> +		value = max_mbx_power_limit;
> +		drm_dbg(&hwmon->xe->drm,
> +			"Sysfs value for ch %d %s exceeds limit; clamped to supported maximum\n",
> +			channel, PWR_ATTR_TO_STR(attr));
Is this debug message still needed?
> +	}
> +
>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>   
> @@ -739,9 +754,23 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>   {
>   	int ret;
>   	u32 uval;
> +	u64 max_crit_power_curr = 0;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> +	/*
> +	 * If the sysfs value exceeds the pcode mailbox cmd POWER_SETUP_SUBCOMMAND_WRITE_I1
> +	 * max supported value, clamp it to the command's max (U10.6 format).
> +	 * This is to avoid truncation during uval calculation below and ensure the valid power
> +	 * limit is sent for pcode which would clamp it to card-supported value.
> +	 */
> +	max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> POWER_SETUP_I1_SHIFT) * scale_factor;
> +	if (value > max_crit_power_curr) {
> +		value = max_crit_power_curr;
> +		drm_dbg(&hwmon->xe->drm,
> +			"Sysfs value for ch %d exceeds limit; clamped to supported maximum\n",
> +			channel);

Same question here?

Regards,
Badal

> +	}
>   	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
>   	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
>   
