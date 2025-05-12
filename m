Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F79C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FE510E1B0;
	Mon, 12 May 2025 22:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWvhzzGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4F10E1B0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747090408; x=1778626408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gQTwk+5ZWFHpy9ttY4v0ChLWhlstOlevT5Zjn8vY8X0=;
 b=KWvhzzGiksRyuxIPe2eCrZAWrHIYvLlizv0dGoM+z+qjFqRlOrBJUuqD
 Cdg8PaOApiN5aOMzdDdnqeN0bJRJKQpYS+1whIrK+GS3IqWC27vG0nG+5
 RW4GNCl+xXr1Sl8lV1z5rsCDFu72qYp1EthIOFxnr7ElSMt3wPxjkojgq
 IQ9nx3ombS4HfK/bm4lJeqeQY1AwUJ2s6/ayMM6BCCBECCP1WCmOKpwO7
 Z2/tjXLTVuDKMtvpD75FPdGAQsSdNyqXi129f6P4mQD++rspDnf9WhhSW
 eNd9epN17CqBzAavIYnn+IyeY5PdnGPIHJhRwa1zaU6nTuHpN0w18l+hd w==;
X-CSE-ConnectionGUID: 7G/uYWTLQLO7obaDrLFyZw==
X-CSE-MsgGUID: 5J4zDIkySe2xpz2JMXA8vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48160887"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48160887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:53:21 -0700
X-CSE-ConnectionGUID: dGGsRAPzTSWDMOVfVXfW/w==
X-CSE-MsgGUID: P/6r63TRQfGI/f54jHhZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="138028694"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:53:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 15:53:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 15:53:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 15:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr1sAx3f68GLIxsMGsuv3XpgiuW5i51e0QA3ND9kPl5GzfX5StW74+HFsyhfS0uHbtddFDa9kXOyLrIa2W466Umy4p8Qec4ax5sRI+7B9uyaE00S/xpJY8dGgJuZ10HCXfye+KIgxUxb0DBvuDA2QVHI0OT52ABvwZLU9jMJvXp2+EkQvLDfWUmvVJV58pv7uzfjxh/ABocTHnmyJj8hxljrVkzSP1BH8ihWqbcT4c91UAamE5UJcOJkbb/HaRIm5oymgYFEfNVO8+u7cLNfaBJaedCS8ax6feP1XtcLE9EFUAXydbRNiTHUuSgw2K8U8Z4R+3pVfAfvwqUzytVy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQTwk+5ZWFHpy9ttY4v0ChLWhlstOlevT5Zjn8vY8X0=;
 b=Z2S6hVsHjPLlzKCVpbjbZJgtAqEogA1bVi0l1sKL4TK+sqUh/X+hLbQka62f95l37HgFULB7d6wZPjhONIh2Hlyj2S6PMaiA/lTebCnl72cznKvQd4E4epoeO5BeyIGcTnL5IFloqBkszAcN/nEFQHGLM6vy+waIKB7ZBEW4hP2cxR/QzSrIX+rKv2wCD0i2aPUdewDkjXliHX1RzixCkrsbiENQSpwkatReaEc97NpcJEKV9y4zcF5GzsKb+WjnWSP87RH9IkX9On3GRKSDcOmufdCU8C21kJ74aNlYF5ml1rUrLPTvceZfGdy8m+TDFHD5bS34dqFnLRMftZpNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 22:53:16 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8722.024; Mon, 12 May 2025
 22:53:15 +0000
Date: Mon, 12 May 2025 15:53:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v5 3/3] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <aCJ72qcon198B8p3@unerlige-desk.amr.corp.intel.com>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
 <20250509161159.2173069-8-umesh.nerlige.ramappa@intel.com>
 <o7fgtld3rfkiyrg53mrqtucbp7gbjvr2hyqeilpeftj3q7thvm@ctq3uipu3tgd>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <o7fgtld3rfkiyrg53mrqtucbp7gbjvr2hyqeilpeftj3q7thvm@ctq3uipu3tgd>
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fceef78-d91d-4cf9-6bcb-08dd91a7c801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWd4VXRFWmgyQzhYVjVvUXRJMkRtWVdsOFpKaGkrbU1hMkFWVjR1V1pNTjRr?=
 =?utf-8?B?TVR1bGVRUjlNdWw1dkoyazRUWEE5OERhNHZjRktvV0thVTJ2SlVDbFE5KzN4?=
 =?utf-8?B?dGQreVhsbEQxbmRtQ3JRSVY4dHlqa1dhRDF6UnBtWkI2dCs5OVRqVlplM01y?=
 =?utf-8?B?RnN2K0FON2ZYTjRxaWNkRkRqRzV5L3g0UE5FZHVxaG1FazhTTmcxWStrbnlM?=
 =?utf-8?B?VWRGK0toUXI1VURObElobjEyck9HMm1JSkFnaFIzUDBwWkM5RzNNeTBDajBw?=
 =?utf-8?B?Vks3emJOeTdENnBBWUVBQ3g2WVN1U1NkYytONis4RDdLU2JEak9VRzFNdWJT?=
 =?utf-8?B?cG1sdFBVWWVTSE5tUWtGdDFhbHkxUGFxRkxDeGRyWlpYRng1V0NQRXNqbHdC?=
 =?utf-8?B?TS95bWN6djJZdHVkWTNQbFZUM1QzZUFCbFJRZUJUU3R1bGNZTHB4clVFeUhl?=
 =?utf-8?B?b2ZidUFTSUhkQWxBLzBjNjJGdGNtTkVzQ3pkRm5IRE0rOGIxd2F1YXUvbE41?=
 =?utf-8?B?MURGb2ZucnVDejVuaFVIYW5vNlRxS2YrNVNZcFVkK1dOYXh0dnl3dUJyUTFO?=
 =?utf-8?B?eWJzSDcxcVpSa2x5VXJBSnlWVjFUMWVSZ3o0ZHBxdEZmY0U5UFpLUTZBaThJ?=
 =?utf-8?B?em9CV0dCNldMY0w0bDRXYlg3UzlVQjlTL2kwSllGNVZrOXlWMlQrd1lweEZ3?=
 =?utf-8?B?SSs5YkNORzlXRGtoeTBlTUFMWlFuMjVicHZCS2VzZjJtcVFwOWkrZjRiWFZE?=
 =?utf-8?B?cnZST2FpNzhzTVo0K2xENlhQTkpTejlTY2xzQmM2TStiM0hHMkcrZkJyV0dN?=
 =?utf-8?B?UkY0bmJ0SUszbFo0RFRhT0NEYTMralZCU2NnNFN6STRwdnJOYm1KWWlwZ3g2?=
 =?utf-8?B?TTBYUXljUEVIellSRmx5cHVONWloVVh6M0EwbllzejVjS01OMEFJZG1ncDhP?=
 =?utf-8?B?cmY1QVNrbExENGRSUHV4UFQ5cWZwQUE3ZUdmMWlVUUMzRXpRc2hlMTN6TUxn?=
 =?utf-8?B?T0tZbjgwdWNpRmRsRVZLbEdiZGUxVCtGWnBWazNGZVNINjAyUHA1OWd4NmYr?=
 =?utf-8?B?ZGIzSy9ORjBrWVFVVDJSQWlzT0RjSVdVd3ExRmtlRjVZV29xekMvalA3MVV2?=
 =?utf-8?B?dmkrRHFPc3ZQdnN6ZEFTQnZidGZqaEh6WHRuWTB6UXlNZmd6YXNCTUVvbUlU?=
 =?utf-8?B?OWZBR21zQ3hNMUJGWG5RSzJqeExsR2hTZWtEWWpYOVp4dk1CMGpRSGtLb29O?=
 =?utf-8?B?aGpCWFlwQWVjVkg2dFNLUW8xZG5zd0dRdW02VXVkbXVPLzlqVlJNQjJod2Ur?=
 =?utf-8?B?aS9VaWFxSjhneEdrM3p1aEdOQ2J0Z21IYWhEYTlleVI1c2RTeEV4N2wrclpB?=
 =?utf-8?B?V2MzSHhLR3hKVVo0MjdKaWhXU3VHTkVxQkVadnNYSjJndWdEUUJSeVlnVkZa?=
 =?utf-8?B?emR1RU9IS01kbDA2ZHRiZDU4TWhnWU9HYTlnWTJjSkdjNFllN0s5VE4zcUJu?=
 =?utf-8?B?WkNoSG5VaGFiN053UkRNemUyTjMyQ2hBTHFnRS9GSEpRSzY1Sm9HMmJ2S1U4?=
 =?utf-8?B?M00zbSsxSFVIbTYvSi9DZ0kxZGhJWlZBS2JINGZxdFRoeHRXRkhHZTBLVnpw?=
 =?utf-8?B?MUFWSjByNk93aXBVRkkyRjZWUGNIajVHaG1adERNempHdEg2eUZ6TVcvRm5r?=
 =?utf-8?B?d1R6MlFPTTMzb0NtdHQyaWFCSnl2Yk1zVGpoOEhwSVUwL3BodzVIT2JZMkJL?=
 =?utf-8?B?c01veHpZdDZRd3o2SVlJeDNSVlExQkpGV3l6MHFETjZMRzVVT0pMY0JxU0lL?=
 =?utf-8?Q?RGi6SBO6VyNWG3DSPSRDYqGW6JzKWaIGSbFoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFY5T3V2ZnRoSGF3Sk1nZGxyajIvVkFHbWl2VUIvbHlLbXBMQSsvc2trL2ZN?=
 =?utf-8?B?T0dNNVd0SlliZVVPdUw4Q3pwdHR3QWxXaFo0TFFCdHhKdUpCK1lXT2ljNzFE?=
 =?utf-8?B?bDB5VVBxNGxMMzRoZStFa2ltbjN0NCt3U1hyNlZzbG9XVHZxQlNRdnowc1Ra?=
 =?utf-8?B?dTA4cjlLaUNmaTFHaW9halhFeUp2cmRnL09wQnRkdCtJY3JBVndxbmc0TWhO?=
 =?utf-8?B?TWFDTW5ya1ltZERCYWNoTWt2V1ozOEJoU3hCeTFqQ0t6eUNUWjNPSnJuT1la?=
 =?utf-8?B?ZGNMOXVpbXRaWFNsM2JwS3V0WDhQbFRJcUZHR1pZK1JKMVdoWjVRSE1xeHhh?=
 =?utf-8?B?TE0wT2xwMG52MUcrb29nSEw1RzFMWmc1cFhZMlRIUFpQNW1jTnZWck03dTcv?=
 =?utf-8?B?K2JJYWxuUktYZWw4bVNzemJRL3FMYkJLQmVBZHZMN29LcUdRTk0yM1hFQldF?=
 =?utf-8?B?dEVJdHIxdEJXTmZKR2dzZWU5OXBLOGNkbTVvUGQwWHNDNHRTLzFUQ3E1NGxR?=
 =?utf-8?B?cEFVUldzcXE1TEtwd24vWlYxbSt3eHFaT2Q5VWF4aHhoR0hIbmpTc3ArWXdM?=
 =?utf-8?B?d0lvNnY0S056VGNrUWVQaFJGRFlXdnpzV1pmYUg0WHpDemhES1FuQ3pxaE5a?=
 =?utf-8?B?Rlk0WloyQnl1akZML1BiT3lLS3RSQ0xlZFA0T3A1YUt1czdzRTBER3JCTFJ1?=
 =?utf-8?B?R0l1c0FGbUhRaUlSNk9abm9KMFJVbTlENW1LZFdTb1krZnEzTno1MWh4YmQ1?=
 =?utf-8?B?NEpKakZjaWxaYUdhZHFDdE5PT3NWM2JQYUdhRWI4eVZnOUtDNnlmcEJscW1Y?=
 =?utf-8?B?Zng5WWsxbXpBeDZTWEVGVFNlM2dzV0Vta3JnTHVscXIwL25kRlJOaDhLQVU5?=
 =?utf-8?B?SjFpcUllM3d2amlQWUxpeUgvQVRkRnhqSitIRVZxbFRHQUxEK0tnb0Z5d0Y2?=
 =?utf-8?B?YU1TTmhRK0hkOUlzd01PL0ZQNlJONDlkYWFyWTNtemVrVUcwbjU2S29nR0d3?=
 =?utf-8?B?SDZaVHBwMFU0MHlKNlBhbEU0R3FXd01nMmRZTFlSV3FUZjhmL1RTR3FRTTlY?=
 =?utf-8?B?M3VhRGUzOUUyZGlOdWIvL0xJbE1hQW1sYkNoaXJDZ2gzcHU2WHFZT3I0bUtR?=
 =?utf-8?B?cnVHaEdqdWdTUW5WUnJlcDFVRnptbU4ra0p5bmhGNi9PTVl1OHZxK0hPZ016?=
 =?utf-8?B?YWVJa0F3V1dTNkFZUDFBbkd4VmtGMzIvOVNYSzUrcTZVQkgrTVRWMktZdjdi?=
 =?utf-8?B?UHR2Y2FuTnZrcG1mMDZ3ZVZLY0NpU3l3NTg3QmJXUmV6RVVzcnVrc3hzejh0?=
 =?utf-8?B?Y21Ca1FXbnBENGd6Q1UwRkM2djh2WC8rOEQ1WTZ0cDN4V3h3T250eHR6NUpI?=
 =?utf-8?B?eTFSUGZDQWdXZTRXcjRUbXNKT094L2RxTGhKTmk0d2lrY1pUL1FFVU9hTE9M?=
 =?utf-8?B?K0tkNjJMVVF5NmFvZVdST3FPOW9BMFNVTHl1azhONG15cWkvNW0yYWRrQk5J?=
 =?utf-8?B?Rk9uY3owNjYvUHdtQUJPOE8wUHhuczRzN0JXS2xkRDdhMG12UXlpMjBhQnEv?=
 =?utf-8?B?bHBKR1I3YkpqVzNqN0J4TmZjZ01RZ0crdk9RVTVCNmtMUktiN0REaWtCSS9O?=
 =?utf-8?B?L0RlRVlSQlJZZTNFU3BzWEVPUEVoVWtyM1FxUVMxdW1LVU05NkR0YTFkV2ow?=
 =?utf-8?B?LzVpSkh5SWp4d0tScm9YU2YxclNJWENoT3QwdU9wa2hoQXFnWHZ0RTA1NW5j?=
 =?utf-8?B?RmlCcDVTMUhyR0tEbjU3RHEyTEtaYUM1Q1hPN3Z6UWlVbmJQOWlBUGcwR05I?=
 =?utf-8?B?ZFMxMTRKK05ta3MzQko1Nm8zV01hUU9CWTNpUmZQcFBBTFVaSXFSeWMzb2RZ?=
 =?utf-8?B?NkRYRkNUNTVHVnpwNGxQcW9DcE5LT0N4WUxhWFM5MzR6Z3lRd3l0MkhXL1hP?=
 =?utf-8?B?aW1qRjhUTDE0RDFhQnZxVjg1Q1MzbGpxTnFjdEhQa3EvQ2tpVUdVb29aRUh1?=
 =?utf-8?B?STlGYS90S1V2WlBMbS9lcHlHWjFZRU1KelJXdkpqK0JRTEg4RnhKV2ZJUmNn?=
 =?utf-8?B?cWw5NGhOdnlLckVxNXptSEhlTExnRCt5WEZVc0ZuWGRSVU9LRHd3Qzc2Q05O?=
 =?utf-8?B?cG82RFJWcHBmVmxzYnQ4NnppUWF2UWlhU1lkUk5GcjVPeUlpVTM0VHp0R0Ns?=
 =?utf-8?Q?Nv5UDl8kg4nHVX0oI6ZIfT0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fceef78-d91d-4cf9-6bcb-08dd91a7c801
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:53:15.9020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tennQUF7I9GU80wcU1wuB5ebihj5thh4gxYxDmuhOus84yfvQLlTcuQYGSMTupdPnduvOU/DeRHpJXaT2z6OZRchRS/tYOqv+S7x0ppBjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
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

On Fri, May 09, 2025 at 11:40:12AM -0500, Lucas De Marchi wrote:
>On Fri, May 09, 2025 at 09:12:03AM -0700, Umesh Nerlige Ramappa wrote:
>>Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks
>>of the context, but only gets updated when the context switches out. In
>>order to check how long a context has been active before it switches
>>out, two things are required:
>>
>>(1) Determine if the context is running:
>>
>>To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP
>>in the LRC. The value chosen is 1 since 0 is the initial value when the
>>LRC is initialized. During a query, we just check for this value to
>>determine if the context is active. If the context switched out, it
>>would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>>Note that WA BB runs as the last part of the context restore, so reusing
>>this LRC location will not clobber anything.
>>
>>(2) Calculate the time that the context has been active for:
>>
>>The CTX_TIMESTAMP ticks only when the context is active. If a context is
>>active, we just use the CTX_TIMESTAMP MMIO as the new value of
>>utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>>for the specific engine instance. Since we do not know which instance
>>the context is running on until it is scheduled, we also read the
>>ENGINE_ID MMIO in the WA BB and store it in the PPHSWP.
>>
>>Using the above 2 instructions in a WA BB, capture active context
>>utilization.
>>
>>v2: (Matt Brost)
>>- This breaks TDR, fix it by saving the CTX_TIMESTAMP register
>> "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
>>- Drop tile from LRC if using gt
>> "drm/xe: Save the gt pointer in LRC and drop the tile"
>>
>>v3:
>>- Remove helpers for bb_per_ctx_ptr (Matt)
>>- Add define for context active value (Matt)
>>- Use 64 bit CTX TIMESTAMP for platforms that support it. For platforms
>> that don't, live with the rare race. (Matt, Lucas)
>>- Convert engine id to hwe and get the MMIO value (Lucas)
>>- Correct commit message on when WA BB runs (Lucas)
>>
>>v4:
>>- s/GRAPHICS_VER(...)/xe->info.has_64bit_timestamp/ (Matt)
>>- Drop support for active utilization on a VF (CI failure)
>>- In xe_lrc_init ensure the lrc value is 0 to begin with (CI regression)
>>
>>v5:
>>- Minor checkpatch fix
>>- Squash into previous commit and make TDR use 32-bit time
>>- Update code comment to match commit msg
>>
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
>>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Series is pushed. Thanks Matt and Lucas for the inputs.

Umesh
>
>thanks
>Lucas De Marchi
