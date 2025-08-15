Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E9DCA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 05:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF64A10E1AB;
	Fri, 15 Aug 2025 05:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5Z8w94x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E6010E1AB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 05:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755236127; x=1786772127;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Sk0u3ma/XzVGYam0QhLAytHIpx//CPQLg5iYiVKB9yA=;
 b=X5Z8w94x/Yg2NaRRZ4Nx8hoeEXB+3rX0PggRtBcVQ1VXN2KfEtw+Zrv0
 eTZLOtRGQrVjIVL+ODKc5Oi587roKB3qeGzxL9P2GzUr4FeTf+fA7pKpg
 RgIhi3Wl9GlxqBmIDnmw25YdT0E/81xe95YoQ/hR/v50HAd1sL1L2D/n3
 BOLPgVPxKlUIZi41zokzmVWWddUM74x2y8qkuR+XFUwTWywvSQQA64pCT
 6jHQ+UpU1T8ooDZNMlo8wKFCoMPdDvWKw/lMGMfaoV9uooUtaxg4DdW40
 wc7ry0OFXuHZ9hDyNT4TYfHxkNtqIHwVjp/kl0pnS9U6oAlxkMKYnzTdW A==;
X-CSE-ConnectionGUID: kuOaLSNMT7aun2JBFlI1sg==
X-CSE-MsgGUID: QD4W+B+GQ365RBur/P2aig==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68936399"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68936399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 22:35:26 -0700
X-CSE-ConnectionGUID: gX+rFLd6TEGBSFsh+i02MA==
X-CSE-MsgGUID: 8R5qQ6smRVm81vuCcZHGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="204124480"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 22:35:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 22:35:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 22:35:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 22:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo7Ch66wJYMsT1oGzW4RlxycfX0YDmuOQMLhyGm+tdSch7GpYlggmg0KVHLQHFII0YQY+99AHf+s4rSE4meaKs+908ZA26XjgX2/I39/wKPM+1KWX55hqEhCE9tAkJJ5LXyhryOFBYom9KNuOAftlIrRE0iT6NLWvuA8coxnp/hlMl+fBzaT0eFE3bV2vXdNJ4wCOH379sZvpHo+HXtpMMi8Dd7iXTS3/SEBwt0nyICMHk9xbnlBHbJEheqegBL3SEz8OmLqlhHhoP/Xh341/cse2HrSl5qTSEsYwCIGQFUGsNoLUF5xvLd8Maiux70ugFSin1Gj9QLn2dzCuX4O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ778Yp6dnqVfpQ1B2aE4lreDJeYP8ORE8FQiOHqNuA=;
 b=V8vMclmFEHqHnG6MvCksnHPygNxbDPTqXo5JqnmQaw6y+RWw4T44XGA1x8PTmbe0MjWraVIFfMv0mS5oGeGRO3orxXFzne0v/rnaym12AYjMo6Ax9cmJuyn7QypeYJ8trLrQ01ikAvvd1Eqtw7ALi8/RT1y1grKtT/As6RakwYbYr1QBMdGZTept04lpuP24PMzB3oZ8yGjCn+OiL/r76cqQXRGHo6LUU/MHVb6CvyQha2hXV/0grtgc6MyhOnT90esRkUikVR5EdGiITVomRYHrJqQ/zuA95HMO9+iF2j01K5ywselK5NFhZk7P5tt5wSHoT7rR+CbGlpOzXK0Pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 05:35:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 05:35:22 +0000
Date: Thu, 14 Aug 2025 22:35:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Core Xe changes preparing for VF resume
Message-ID: <aJ7HFiuI8/DTqseK@lstrano-desk.jf.intel.com>
References: <20250815025605.2387080-1-matthew.brost@intel.com>
 <175523527041.238346.12332912242285707462@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175523527041.238346.12332912242285707462@1538d3639d33>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b4520e-ce33-4291-14f7-08dddbbd870e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZeykwRZT/Th4jZWlgJvwiVZQ8iseC4uxeSrJfrdr6bJZ62EOf9htHlzSK1av?=
 =?us-ascii?Q?NPvkAnUPf5Jq5YY2ZWx4kuQUKCEzRfUc85gUuYrFOF1PIKZGeVVWge7tAizf?=
 =?us-ascii?Q?sTYvS8KUhVPAMa8KjL6bEh5ee1q5V3WSh4gd6HItYH68G+3oD+3X6nwqcOXZ?=
 =?us-ascii?Q?zo0/95bcCOV7elnGRkuwkhuVglB7xYeX6WKWyU2AHTe1ygbcqqQS/kSxIQj0?=
 =?us-ascii?Q?HguZW9bR4ROCX7F5BAVnLMF3GA6QmGXNJljpaHZvwRduQH0des2d6JVm/guM?=
 =?us-ascii?Q?b91YrMjJcU1iskDyyVzH7xzyh7aM9KfZZuZrO1yqmn8+LMCnkXyB7ZfT0tRO?=
 =?us-ascii?Q?icX7pXIE1U9RExqtwJ6ITP2yRehVaxeEzafAOiomsv3Oce3ou5MgorextF6Q?=
 =?us-ascii?Q?mdQdLK7DRM5d5YcfTEV14rjDxOzmlrk7cvv1VTIVWEkcZvL577ItDVZT6UUm?=
 =?us-ascii?Q?JEyipdPri9GNNWTRczs1BpTlsJLod0f0z3F7P2xmj7ILquHTuQFNfKEGD1gZ?=
 =?us-ascii?Q?UUzSRzJFiSo3udVZPgONa/V8vN9hUHMfLfTcTN+EnLVG9atnBrP36MU5YPRr?=
 =?us-ascii?Q?5cpob+mfbY/0pvJGmrwfOPjN7+RH7KdAjUsU9KGOP6cTbqFsvCVWS1rHt/pY?=
 =?us-ascii?Q?oK7N3riJjpIUFbmP1G5ZahRboANl3EDLdSQ5JMeIfu8v9JdTqvu8ksyaUsGF?=
 =?us-ascii?Q?v/3y3B1ZF49I9jiTUsPeB8vUV565KALtps9OG/msVuDx7yeepzzBFVFpNE6X?=
 =?us-ascii?Q?tkKuAV0qanghMx4sIagfVr3TtV3B5OJH/6HgKZgVBa1hDjGRdcD3/RSSCzlX?=
 =?us-ascii?Q?se9KsSJuMywpVBhhnouTovv96aT4wSK7vf+CLYqb3bps8PJWr6TMrwPrGTdN?=
 =?us-ascii?Q?uT4sNsLWPYA3Br6AIS2/8ifOrqgrN8LhtnQYCi9cCsiN3RsLyQJohnl72+s+?=
 =?us-ascii?Q?qEJUtESNbQ/9n5mQnw1j6R8NNzQ30jGmRHxcHfxBIMwiNYoXxiwDzOb+jnFf?=
 =?us-ascii?Q?EDDsX4kknUB+zKsxQDKIFC38zVINNj5Ksy/R8EiBPXLIW8Tt2jhm7MaRArvb?=
 =?us-ascii?Q?FenhuJM+FvhYztH0d7vwidInf4/DLGsTU3MMim6uUfAydTNnqxO1ONdK3NLT?=
 =?us-ascii?Q?EP7mgonzBSoUaQrjo7+S/1dtVgraCfVMZW9PXSsoVSREmlIzuYUMkmFaLjc4?=
 =?us-ascii?Q?PVNBUBsDMRKHR8Mp9Qh21xy/Z2kfm9wiBuc7jT55IcYzSPobhT8B1uDFdtk2?=
 =?us-ascii?Q?06hlgg/wGdFkMbWvelmP826AmCmbSLi1XECAQc4EVYWACj2lpN1r//h1DISq?=
 =?us-ascii?Q?KdF9UKKQflD6S01twCEH2YvRsc9ShjXWv3+YVcgwQswiTTefTRbTw+sUm9TC?=
 =?us-ascii?Q?ywmXaKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJrINbmWoMy0EpyKGSZ+P+LiRFbFiPBsvePg5rMcjYFuXIMYZ1LlcOQhvzEE?=
 =?us-ascii?Q?F7lAb+OUqICpYi8HK6QK+dyFdBlkGFKe1d12LAy4C67tPaJCU0BWHpQQx3ag?=
 =?us-ascii?Q?qdDlkVaOuiVMzOqmD3R4EQ+KS6t/PMGOV3wo279nxRiKCMhtSLJr75BHfdqY?=
 =?us-ascii?Q?iBMSd2cdUPBXV0pPu8a1VBMpbR+CugRng8D3iTqN26FyI/P4MOsb3IbD29RI?=
 =?us-ascii?Q?2t2GmMm3GPkMRjazuk2oaWCtDPIo37Cg/B6APi/AshwWdfD0EZDAa0YFKLc6?=
 =?us-ascii?Q?sEAdGsgPQ2ZbcfIIIp+lDw6WO0fqn9EdhRFoEjKvhYVwAkvTk1cdhc9oLjuf?=
 =?us-ascii?Q?kvVW5NZLLyxwzGHAznPQoJ4HGjhofDi77thNB53bH1kvR1aZH6ugOsbFtpjP?=
 =?us-ascii?Q?jshRQnY6dR9gXCZQuBkMdTNfZFoB7RB8nlTyM6cL5QLGykpI/SaLoAHBJLD6?=
 =?us-ascii?Q?IjK74BvQcoXpdLYxzSHccRyc6vsl6b/1+56Xeg9nafagGQlQy2EoyJDaZrtB?=
 =?us-ascii?Q?ISTzU3s2x1EWuBlMtlApvGpGkzbRs9gKojfS3bqkHar2yr9s4Gosf/GXLejR?=
 =?us-ascii?Q?/fJO6wlw9g2qz8AEv2TH5fFX5RmtfcC0E6s+7/Sxok33Ov0fr9by4Zo5+yCX?=
 =?us-ascii?Q?ONrk7jZLJZ680SV6Mq0WWO1AxNH60mTpz9lHCTZVuSFJu7WwzNmCcBnidPDb?=
 =?us-ascii?Q?6mvRrXgg02evRLMj4rTBVtMDDmNR3K+UcKzEUhB2LT9Ts6kYy8H5mtkfx19+?=
 =?us-ascii?Q?JL89qQyrKEkreMOo330YS95gqKnAX9J6w9Ggb5E4T+2dpN1FdVJ0SBq2TK3E?=
 =?us-ascii?Q?EVtu67+fwXxhaJLEqKh10Xm2Dde2zfl6dadYJ5uRNVKxETxCSnuvi85blzce?=
 =?us-ascii?Q?Qx0W/4uKCq+nYNpkWWP/+DyNN+Rxpsacxk5IQ+WBRzn3DoffgUSvb60w1ZlZ?=
 =?us-ascii?Q?tpgQxvR9l8HMxkU6/GImNXLY5fke/56PyES8uISXz5pSpH3wXtdSbJLCBJeJ?=
 =?us-ascii?Q?D541UDdlH46zSNEvUfCCjexv+5aDep9RfAAyR5h5LnRQQ08y+YZg7vho+mTM?=
 =?us-ascii?Q?vCLdscfvO4ShzVs0PXE0Yy//ap0D0S4b9CL7u6WszoGo+zpnahBQCj5NTxbt?=
 =?us-ascii?Q?Ce04sy6S1a2TfxfINcqHTzLa1RoF7C2M7Z9SCb7w/p1pDYpFjeFHtMo/HfXx?=
 =?us-ascii?Q?VB5toUZo1hj9nUZ26oqy0OEpLid1WBTDE3oBU8R8KBllnB2IwIvmemYdzuax?=
 =?us-ascii?Q?dnh3zjg6HVDSPdUQYWdA81uXLzYMkjbvt3TtSOCounEVAMjh8sqxDwLeMSFT?=
 =?us-ascii?Q?cdcX3pZc/FYWLqmkblTDOwDN5T4ZxFsA/jH/SwTb/28HLYz+x8ypPvb7Q0ZD?=
 =?us-ascii?Q?2rqG6EWwe9qIWmb8s9ghGfC3hKZP3s0a5eHVzgX7NuPOoqobbRtN0wTXhlGv?=
 =?us-ascii?Q?PC0WtGkAJw7/V/f4uPfwVdA/+HKfPim6MxsYDamgwm5IUdUxvq/YtfdWRZiw?=
 =?us-ascii?Q?Sxxvo8CYK841Sa6PgAEw/3XhXKhHzZ/fFDnPmp8yR0N/mUoqb2pi3LHq7C9C?=
 =?us-ascii?Q?fxHM/3d/Zc6y4Mw0nMnVpa6uWi4VzoIx7Xs//R7J7qT9G/Lm0S26x86AGSbt?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b4520e-ce33-4291-14f7-08dddbbd870e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 05:35:21.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czoQE56QTw3plm6Ke1YlJWasNWnesL9Motf3yEw5xGyeiuPQFbBWCbmup/sGK3yuKSRUSC1fFzwP0+oBZAc/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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

On Fri, Aug 15, 2025 at 05:21:10AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Core Xe changes preparing for VF resume
> URL   : https://patchwork.freedesktop.org/series/152965/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20_FULL -> xe-pw-152965v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-152965v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-152965v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-152965v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@non-blocking:
>     - shard-bmg:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-7/igt@xe_exec_compute_mode@non-blocking.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-8/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-dg2-set2:     [PASS][3] -> [TIMEOUT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-432/igt@xe_exec_compute_mode@non-blocking.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-lnl:          [PASS][5] -> [TIMEOUT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-lnl-4/igt@xe_exec_compute_mode@non-blocking.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-lnl-5/igt@xe_exec_compute_mode@non-blocking.html
> 

Expected - see commit message and [1].

[1] https://patchwork.freedesktop.org/series/152967/

>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro:
>     - shard-bmg:          NOTRUN -> [FAIL][7] +15 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap:
>     - shard-bmg:          [PASS][8] -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset:
>     - shard-bmg:          [PASS][10] -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-bo-unmap-nomemset.html
> 
>   * igt@xe_vm@large-userptr-misaligned-binds-1073741824:
>     - shard-adlp:         [PASS][12] -> [FAIL][13] +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-4/igt@xe_vm@large-userptr-misaligned-binds-1073741824.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-4/igt@xe_vm@large-userptr-misaligned-binds-1073741824.html
> 
>   

Will look into above failures.

Matt

> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-152965v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#619])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#4543])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#367])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-9/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3862]) +1 other test incomplete
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#3442])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +153 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2724])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2325])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#306])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178]) +2 other tests fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#3304])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#308])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#308])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-bo:
>     - shard-bmg:          NOTRUN -> [ABORT][52] ([Intel XE#5826]) +1 other test abort
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_cursor_legacy@forked-bo.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-adlp:         NOTRUN -> [ABORT][53] ([Intel XE#5826]) +3 other tests abort
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-9/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4494] / [i915#3804])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4354])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2244])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#301])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible:
>     - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#5208])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
>     - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#4543]) +1 other test dmesg-warn
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2049] / [Intel XE#2597])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +5 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#651]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +13 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#656])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#5390]) +5 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#651]) +13 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +10 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#5672])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +12 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#653])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2393])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#4596])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2499])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1489] / [Intel XE#5899]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1489] / [Intel XE#5899]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2387] / [Intel XE#5899])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@kms_psr@fbc-psr-sprite-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929]) +4 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#3414] / [Intel XE#3904])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2413])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1126])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4837]) +4 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4837]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2322]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#1392]) +4 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1392]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#288] / [Intel XE#5561]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288]) +11 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4943]) +4 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#4915]) +67 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_exec_system_allocator@many-large-mmap-free-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#4915]) +12 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@xe_exec_system_allocator@process-many-large-malloc-multi-fault.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][107] ([Intel XE#3876]) +2 other tests dmesg-fail
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_oa@invalid-oa-metric-set-id:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3573])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@xe_oa@invalid-oa-metric-set-id.html
> 
>   * igt@xe_oa@syncs-userptr-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#3573]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][110] ([Intel XE#1173])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2427])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2284])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-bmg:          [PASS][113] -> [DMESG-FAIL][114] ([Intel XE#5545])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-2/igt@xe_pm@s3-mocs.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-3/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4733]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-optout:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4733])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@xe_pxp@pxp-optout.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#944]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#944]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#944])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_render_copy@render-stress-1-copies:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4814])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@xe_render_copy@render-stress-1-copies.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#4130])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4351])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   * igt@xe_vm@bind-array-enobufs:
>     - shard-bmg:          NOTRUN -> [TIMEOUT][123] ([Intel XE#3876])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@xe_vm@bind-array-enobufs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-adlp:         [ABORT][124] ([Intel XE#5826]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-3/igt@core_hotunplug@hotreplug.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-9/igt@core_hotunplug@hotreplug.html
> 
>   * igt@kms_atomic_transition@modeset-transition-fencing:
>     - shard-adlp:         [DMESG-WARN][126] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][127] +3 other tests pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-1/igt@kms_atomic_transition@modeset-transition-fencing.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-9/igt@kms_atomic_transition@modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][128] ([Intel XE#4543]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][134] ([Intel XE#2291]) -> [PASS][135] +1 other test pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][136] ([Intel XE#1340]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2373]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-bmg:          [SKIP][140] ([Intel XE#2316]) -> [PASS][141] +3 other tests pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-bmg:          [ABORT][142] ([Intel XE#5826]) -> [PASS][143] +1 other test pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-4/igt@kms_flip@bo-too-big-interruptible.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-5/igt@kms_flip@bo-too-big-interruptible.html
>     - shard-dg2-set2:     [ABORT][144] ([Intel XE#5826]) -> [PASS][145] +1 other test pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-464/igt@kms_flip@bo-too-big-interruptible.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-463/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][146] ([Intel XE#4543]) -> [PASS][147] +3 other tests pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-3/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-1/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][148] ([Intel XE#301]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [SKIP][150] ([Intel XE#1503]) -> [PASS][151] +1 other test pass
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][152] ([Intel XE#4459]) -> [PASS][153] +1 other test pass
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1392]) -> [PASS][155] +6 other tests pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_reset@cm-close-fd:
>     - shard-adlp:         [DMESG-WARN][156] ([Intel XE#3868]) -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-bmg:          [FAIL][158] ([Intel XE#5507]) -> [PASS][159] +1 other test pass
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@xe_pat@pat-index-xe2.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-7/igt@xe_pat@pat-index-xe2.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-adlp:         [DMESG-WARN][160] ([Intel XE#4543]) -> [DMESG-WARN][161] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][162] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][163] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [SKIP][164] ([Intel XE#2341]) -> [FAIL][165] ([Intel XE#1178])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_content_protection@srm.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-7/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [SKIP][166] ([Intel XE#2291]) -> [ABORT][167] ([Intel XE#5826]) +1 other test abort
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][168] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][169] ([Intel XE#301])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#2311]) +9 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][172] ([Intel XE#2311]) -> [SKIP][173] ([Intel XE#2312]) +7 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][174] ([Intel XE#2312]) -> [SKIP][175] ([Intel XE#5390]) +4 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][176] ([Intel XE#5390]) -> [SKIP][177] ([Intel XE#2312]) +4 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][178] ([Intel XE#2312]) -> [SKIP][179] ([Intel XE#2313]) +7 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][180] ([Intel XE#2313]) -> [SKIP][181] ([Intel XE#2312]) +10 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][182] ([Intel XE#4596]) -> [SKIP][183] ([Intel XE#5021])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][184] ([Intel XE#5021]) -> [SKIP][185] ([Intel XE#4596])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][186] ([Intel XE#2509]) -> [SKIP][187] ([Intel XE#2426])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][188] ([Intel XE#3868]) -> [DMESG-WARN][189] ([Intel XE#3868])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1061]) -> [FAIL][191] ([Intel XE#1173])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20/shard-dg2-432/igt@xe_peer2peer@read.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/shard-dg2-433/igt@xe_peer2peer@read.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
>   [Intel XE#5826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5826
>   [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20 -> xe-pw-152965v1
> 
>   IGT_8494: 8494
>   xe-3548-915a96ac57901b60657509dfe5bfb3477e2ede20: 915a96ac57901b60657509dfe5bfb3477e2ede20
>   xe-pw-152965v1: 152965v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152965v1/index.html
