Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99A7C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 17:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D64F10E3AF;
	Fri, 11 Jul 2025 17:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azYyBCU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC3910E3AF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752255755; x=1783791755;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dmfRZ3TPOw7KYzmjCQN6AnNcKT07lwngS5XCbjZqSgI=;
 b=azYyBCU+qIMByZA5xtpe5KB7Zcmlr2NNrDKzJbLRV/ezVV3wRSZAl5Bi
 wKgMm1lkhpwrllSxxSwqEzgeUvgHKgls+gfmCm4YP4HoA9ruH+iu2jTKD
 kyvCz/kvJxfNJcltIZCKuxDJPNl0E0hL9ogu8CJA2FrSSoqnMHRp3pYMf
 Xr4gjVGW5r0+A+dVGKRtWmmtHlZJzoqJIoxsWySqzwnRhEoELZJHAjAGR
 4rDmHsNEttbqqpf9LLpfY4PnpK1GYDOX/uhbs6WaXjI2iNMSDwpiGJhGb
 akV+AhESL1ruWOVKmGz2ezDndaz4BOcpqhxYIWIDuXe6rgSdlmvZxiGt5 Q==;
X-CSE-ConnectionGUID: 4nekeA4HStWtnEYpnORH3Q==
X-CSE-MsgGUID: 88sUkdcRQI64XUK+QeAZ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54644323"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54644323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:41:46 -0700
X-CSE-ConnectionGUID: IEH5QlokQFibfhP/v/pJWg==
X-CSE-MsgGUID: Gzbi1Dk0Sbmf3KKsGpYRKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160973393"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:41:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:41:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 10:41:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 10:41:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz5XviDVoQA7w5UX2iyaCaHI65El1G+0iJwH3qh2nvrOaYX4fpFqXmkI5NTvqIRWN+KKeT34uU89fei6ffwmMtUIdDZlXSxqyryjgvXa1h06m1AGZVFPVY5cKTch1McIeENvZeiSYn9suY9iiucPYwDY2tNowzLBdRvKusdA9UGpGw+zUvI4yr/JbbrVOBLMogWlJaGMQRaJw4W4TH5/3kyrnyaOn+DrtBgty8/ywYMKXXjHLtAOvyHdEXPVMPphBbBUGzVl+YtoppHv99agWJbZNQW9JA80mjJ0RN+HaWN4FLUFGBzOE69I81MNGWb/WqFtBL9+uEG4LM9kuc314Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQh/21PVbF9iiNqPZmK7KAOi12HBxb6skmhAOjVQiL4=;
 b=iRhBJANbK68Y6F+3E3oO/NEcST2AAu7t9bN+aQ4UOSkItBpEZwiSySBTKQS4sOEm44psrA8KtVtbMsIc4YDilnCkUuwShII4KVKCE+vSQy0sVlNZLA48O8vmxvyQLRN5rn3paHm8zJOooxyX6SUextOF5L4yf+x7EvpKymvS9e9oZgO+BcQVWY1IJSTpyFUmaE+GUxpoczTRwVV41ploBUv9mPkRzVUfYqOopxT22YdMWekuLOD86DOn7PgleRjgE3BVtuhGStWNnO1pg8i2vC6eU3rWCR15dt++k5UKSnDC0QbRGh5skpPkrGyQUWyxNtIdSsTAFfT/WBKmLh+Xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 17:41:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 17:41:42 +0000
Date: Fri, 11 Jul 2025 10:41:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v4 9/9] drm/xe/xe_hw_error: Add fault injection to
 trigger csc error handler
Message-ID: <aHFM1MSvgrn4U1iF@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709112024.1053710-10-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:303:8c::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 07919239-30c0-4084-f097-08ddc0a2328e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzBpZWRpMXh0QzhnMFh5UHFvUHBaUDhJQzhNM3o0UE5GdUlIM1FDL25Fem5a?=
 =?utf-8?B?TFdOTmlsSVhDQ3RNeTdnZmZDdzN6WThWMnRGRzVIT2cyYUJ2TTBUd2lvMG1a?=
 =?utf-8?B?eC9ORExIc3FLOUdTY1VPaDAwMEN4QjBBZzA4WmpIcTJ6aHVKS0ZkRnJBVDZH?=
 =?utf-8?B?N3pBblhONlhKSU8yTW9uam1wWVU3MWJBMlErNS82ejB1VldlVktXU1ZDMFhR?=
 =?utf-8?B?MGNhVVlZRG0zRHMxSHJadk43SmsrcXV4ckwvN3NIcHpFMHhhTFVFNXJ4Qml6?=
 =?utf-8?B?Y1dlOGU5UnJHREdUalFwTm1ZaitkaW14dTVDdGV4cnlCTWUwTWhrMldYNFZs?=
 =?utf-8?B?Vk1FZmV2eUIrV21UTVp1dzZYOW5jRDJtOGYrL1RjRytpUjh5b2tDT2NHZHFu?=
 =?utf-8?B?VG9NZlJXblZLOGpLOXdjOHIxdnVBQ1VGc1RNU3lMc04vWW1ETm90SzZkZ3NW?=
 =?utf-8?B?RytkYUZndXUrd2R2NS85S0Q0YkdaUSttNjkzY3FRUFg4Nm5PMTBta1RYMitN?=
 =?utf-8?B?L2J1SWRqcVFHbGUxSmhZNXlLOGZCODZnL0Y4SzB0OEo2ZUpERmJNYUdzT3Jz?=
 =?utf-8?B?aWk4RzgyRVRYNVZibDRyMVhaMitwcWJ3clVxTlQzUkRiSjhveVRiVzBkcEFt?=
 =?utf-8?B?WHVSSW05S0l4ZmVKOGJ2RVY4eERGQjBNdWdiUG1Ga2pMRmt1VUpBcmN6Nlc4?=
 =?utf-8?B?b1Jpb215QlVqTm00SXdEdGU4RjRyRjZnc1MyZzVmSXRqR2M3RnhmUWhsSnpo?=
 =?utf-8?B?UXV4RDBrN0JIUUhZREtQUnJSalcvMEdFUnNLMUZlQ2FwSFNlVGZtYWVsaHdl?=
 =?utf-8?B?L1A5Q1V6cGNWaktoTGVQSG1OU1FCdGw2Qk9FQ3FIK1Y2MGtsNVZYTkRicjkr?=
 =?utf-8?B?dWFoWUdCR3YxZ2VlZjV6c2pSdXpVUTdvcEJycUUxRzV1akxlU1VBN1loUGtq?=
 =?utf-8?B?bmUrTVMvTy9WdVdkS2IwLzUrNnJ6dlZSNitIb1pVYUFaL3VOZnpMcFd5K2xO?=
 =?utf-8?B?dkZabnNiejBVV1Y5T2pVWUNUOXVjZTFpeFUrdkxEcm1ERHNsbmI1SjVoUGpR?=
 =?utf-8?B?bmlVdi93WHc0NHkvRUk0YnhacmdQRXZESE0xdzJTK2dMRE1qWDJpd2VoVGhn?=
 =?utf-8?B?Q0h1c1Z1d0dzV0NnS29rV3VheTRzd0dXVnJ6YURQY3pIWStRZ3FuNThLRUg0?=
 =?utf-8?B?d1F3cHhWaHRMY3V6WGFsSTJPK2Y3VkFteExJek0rS2NYbU5mc1JPUUZsMVVn?=
 =?utf-8?B?aDNwQmdBemVpd3l3cXpFWmJQSUUwdEtrMjIvTGtqOHI2KzQzOGJyRXV4T0Rj?=
 =?utf-8?B?cFNqQ2xOTWQrYjhLWUlDU2I3VTROOXhyZFlrNDFTQ2RiL3pPQUFSZ0N1YU42?=
 =?utf-8?B?SW5rVHFMMGJXcXljM2JQakhua0JEUWwvbHpseVNhcHZIS29Wdzh0K0RkYUFy?=
 =?utf-8?B?dWtzQWxpdDFWV2FhT3JSdDk1aTl1ajlRUW9iVXdzZEZZdjlkOGNBUGNUTjZn?=
 =?utf-8?B?YTR0bkplU1dBTG1PYmkyelQ5RzcxcEh5dDZuRVlkYUxtUVZGTllHODZTa05m?=
 =?utf-8?B?eTFzRFMvek1VYWh2SUJqTityd0VvS2Y5dnZYWVVhUUU3bHRPUzhxbjhGR3B6?=
 =?utf-8?B?bXFhVEEzMTdXRXdxWTFCQ2NQL3BwY3JXWHhqZkpxUUYvUzMrTjhjMVNzVHdr?=
 =?utf-8?B?SnFhOHZJb28vTnZFZjNSMkdIdFQrcmpKOTE0Vk5KOE5aVENTYlBUY0tkWHQr?=
 =?utf-8?B?M2htTit3UkR4NExMUDZsMW8rUVRhcCtHSjltZXNlaHRkVEFIZVQ4MFllU3hS?=
 =?utf-8?B?RVg0WStHZVBGN3IrOUpKcFo0dXVKOG5QT0tvdWFiUU9EQkxFeDJMME8yZ3Vw?=
 =?utf-8?B?ckZHNXVjMlhTRmJiRk5hNU1DZ29XVEsvcjFHQVpyaFg1dmxyL0J5WHZRS1hx?=
 =?utf-8?Q?0Y3BdXzYXOg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDFLSHAwZ01xYU5RdjBWeldCOXVTUlo0aWdCT3VyNytlMFY0Z0JXSW44VUVE?=
 =?utf-8?B?K3NBN1kweW5vd055VTJJM01pbW9VOVE4WE5nSFFlb05vR216Q2Z2eVFqM0dR?=
 =?utf-8?B?bXhCZlp3T3ZDUDFQS1RoZ2t4NWtUYU5tNmNCbHQrR0xoUm81eGJaRGEwZW45?=
 =?utf-8?B?R0pyTDlUSU1WSFpubDZXeTlCMENyYUhibXBOTzk2WkI2U1NxaGJqODR3VlhN?=
 =?utf-8?B?VGFKMWhiaUhaOXc5bjQzeXRjcjRaM2djS05EM21WWDFtRmlnRFR1N2JzYU9R?=
 =?utf-8?B?dTB6TENzUWZjdmJhaUFwQUdKNVhodW1oeFZBKzFXLzl2amlHYk80OUV1U21T?=
 =?utf-8?B?SkFxMHpIaXpjc3VvLzFra3oxeGxGRWRuM3o1UU9RWTZJT01aOHhocUdVajBn?=
 =?utf-8?B?TmZaK0NUdXVheGRSNUVvUHI1M1k1QWl4NHVaV3BZV2NHMjJhN2NDWE9TcVRu?=
 =?utf-8?B?QjRnSUhsc3Nxc1dyUmFpUFhnb1ArdHhoK0ZXMExrU2dKZnhEcUZld2RrVzh4?=
 =?utf-8?B?WXpucVZWVHlQcE83RTU3MnFra2hJbTVRcHc5N1A4WC95VFdLQXcxOERDREp6?=
 =?utf-8?B?N3M1T0F2aU42YVFKR0pJaWpTWGM2UzlZYUJHNnRYckh0NEllNHgxVnlDd1M1?=
 =?utf-8?B?blF1bXpaVGU2V3J3enY3R0ROa0lCZmtmZWFGV1NUYWpuWHNUZkxzYnRxNDdW?=
 =?utf-8?B?aXVtRDgzTVJBb2ltL0lBMnJXQmYvM2wyRkF3dFlNblIzK0JVcGtiS1V3RTcv?=
 =?utf-8?B?b3M3cFNEZGp4dFp3SUdOK1dTN0VNUllNWHZRaS9FZS81aE45Mmo2LytZY0x6?=
 =?utf-8?B?cXZEV3JMQUgvcFZ1LzBkU2QzMksrQ3F1b0dKMUVYYUF0STBMN3grZFU3V2w5?=
 =?utf-8?B?QWppQUFkWDlIYUY0QXgrOVlNZmhVYWRac0NLSFhRQ3g4SXJVNnE1N0hzQUZx?=
 =?utf-8?B?NEtvRXJRakJoY3EvSVhQK3RpcFZjK1hJZmpDUkhnV1RONVFMdjN4TmFZTHFo?=
 =?utf-8?B?TVV5N2YzWDJMZ0pFK3prdGZoOFYxdnZJVTBua0ZYVE9nR1NyTTQvdHljb0xu?=
 =?utf-8?B?b0JVdmxBQTQxZUw5bytyb1lmSElmY0xVTFByYnVBbGxlbUxlWm1KZUtpU0xX?=
 =?utf-8?B?dmdxT3p2YW1vUkQ3VS9JYzd0YU1BazBDOWtIb3lWWlpBOWtoeDU4TC9ocTVD?=
 =?utf-8?B?OE52L0tQVm9zeXowS3ZhaWFDTFpOL3ZheFpPR2duSHJBYWF0N0NUUEJYRTU3?=
 =?utf-8?B?ZE1tN0xvZDZrZmRmNEk5ODJ0SExrcDhGblo1Zlg4Z1o1T2pXWjlURHNZU1Nu?=
 =?utf-8?B?c3Y1bEtScCs3VHhteXd0NlYyelRaUmlLbzlEQ1owZ0paVGpLZTl3cURwNGQ1?=
 =?utf-8?B?bHljSmxBWHBqTG5sYUpCeG4wWlNvelQzVlY2aDRBZ3pSalhTMnFPVlpyRUpC?=
 =?utf-8?B?S2h4dlR1aWZmYlVQSE16LzRrMExOQUxZY01CdW56dEZDYlVHdGZuNzlHVThu?=
 =?utf-8?B?QmtZd1E0aTlJRUZsSkFSTE9laVA3Q1pCUGVneHpJeXdEYzlIakRsTEZFTDY4?=
 =?utf-8?B?VnJ6N29rV3J5S1NYU0xxL25QVFVTSG5YZkJjMVl5cEZnelBXRERBR28vUnZ3?=
 =?utf-8?B?emFqKzNHbkljMFZWTlMxL1lMN050dlhmWVJlTHhhRlNDOUxYTVVqZEJQYWE3?=
 =?utf-8?B?dFBPYlUwZy9lRWtPbU92Z3VGS0tndTc0QnBpV2RuVVVZdGxFTkdzT0d3dklP?=
 =?utf-8?B?OU5RR1BMWG5IZmVsUVF6enpIUnV5OGFPUmh3OVdxdFhyaGdHUlVvM0xYRjJS?=
 =?utf-8?B?TU9raDBDZzgvVXlkV3BLZGdQbDFEVHRNU0JiUTJuK1hLSnovMkFiSDE4ejJ0?=
 =?utf-8?B?V2Y0QXA0M05JWGtvZFE2UDhpMFFUZk1UbHY1ZUNrUm9pQllNK1YwMW12NlhO?=
 =?utf-8?B?Z2s5cjQ4U0dnUWZtcHlsK2ppVFdxMXh5MFJDRFdUd1lrcnNoZjhsUS9tUWdz?=
 =?utf-8?B?V2dJeEhxdmxPRkVqWUZCbjk0cldXNnJSVXhOMjY3UXVwZVhoaFREc0J1cVBh?=
 =?utf-8?B?RzBQSjBGMmQ2MDZJelV6SmdsY3I5WmlWb1NHZk5mTXdwRVBXSFJWdThSTkVs?=
 =?utf-8?B?NStKRTJRbTNsNVpHSThwajhzQmlReFhSQ3E0OXp6Ums4c3JzQzhVWGRNY0VX?=
 =?utf-8?Q?XVVXewv3eAy6pY9tr/XEyk4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07919239-30c0-4084-f097-08ddc0a2328e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:41:42.3524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vr7u58aajJYoWQfjdm9HI1erHVUnJymGSZjk+QAc7XyBclcFNcV+nEK2bZ+VAQXw9XirKzB9oiLqxMDnw5r57XB4j4lo6TJjQTbI9pl6cTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
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

On Wed, Jul 09, 2025 at 04:50:21PM +0530, Riana Tauro wrote:
>Add a debugfs fault handler to trigger csc error handler that
>wedges the device and sends drm uevent
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c  |  2 ++
> drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
> 2 files changed, 13 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index d83cd6ed3fa8..134610437aea 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -29,6 +29,7 @@
> #endif
>
> DECLARE_FAULT_ATTR(gt_reset_failure);
>+DECLARE_FAULT_ATTR(inject_csc_hw_error);
>
> static struct xe_device *node_to_xe(struct drm_info_node *node)
> {
>@@ -273,4 +274,5 @@ void xe_debugfs_register(struct xe_device *xe)
> 	xe_pxp_debugfs_register(xe->pxp);
>
> 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>+	fault_create_debugfs_attr("inject_csc_hw_error", root, &inject_csc_hw_error);

Maybe create this attribute only for BMG since it will bail out anyways 
with an error when the worker runs? OR are you expecting to see that log 
message which says "runtime survivability not supported".

The absence of this attribute in debugfs can also be sufficient to 
indicate that it's not supported.

Thanks,
Umesh

> }
>diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>index 7cc9b8a7fa1a..2d56a93b3a71 100644
>--- a/drivers/gpu/drm/xe/xe_hw_error.c
>+++ b/drivers/gpu/drm/xe/xe_hw_error.c
>@@ -3,6 +3,8 @@
>  * Copyright © 2025 Intel Corporation
>  */
>
>+#include <linux/fault-inject.h>
>+
> #include "regs/xe_gsc_regs.h"
> #include "regs/xe_hw_error_regs.h"
> #include "regs/xe_irq_regs.h"
>@@ -13,6 +15,7 @@
> #include "xe_survivability_mode.h"
>
> #define  HEC_UNCORR_FW_ERR_BITS 4
>+extern struct fault_attr inject_csc_hw_error;
>
> /* Error categories reported by hardware */
> enum hardware_error {
>@@ -43,6 +46,11 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
> 	}
> }
>
>+static bool fault_inject_csc_hw_error(void)
>+{
>+	return should_fail(&inject_csc_hw_error, 1);
>+}
>+
> static void csc_hw_error_work(struct work_struct *work)
> {
> 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
>@@ -134,6 +142,9 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> {
> 	enum hardware_error hw_err;
>
>+	if (fault_inject_csc_hw_error())
>+		schedule_work(&tile->csc_hw_error_work);
>+
> 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
> 		if (master_ctl & ERROR_IRQ(hw_err))
> 			hw_error_source_handler(tile, hw_err);
>-- 
>2.47.1
>
