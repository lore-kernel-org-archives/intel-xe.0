Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A9D33987
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 16:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FC810E0F4;
	Fri,  5 Dec 2025 16:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cg1xBNAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2B510E0F4
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764951583; x=1796487583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xg+9/Pbk/m8EoD7YJUM1f+vlOOcL84BEoxt21SACL7A=;
 b=cg1xBNAFN2VRd9ktNfYLvPAzHTBjEj2M1TZ+PjScLZFhUGX73a8PGzop
 JuCOkTNDAFYQocxlhoQrX7s8kpHz+JXkd+7YLNJPvUW0JOSS7q6C3koIz
 K83qWaG9UL15a4qjvz9QEi5XpCqhJFX5Fs71P1YPTIBz1EURCnv+1A3DI
 qHfj3xEj8jGYwe0k3/OaA0pfnhsGTuMxEKw+R7qM/cXrHgpIXjugMsceC
 2l/tkfPztGL4GKDUBbvYAFFMs5yd0la5h6uXlXDUBdCOyh9HC75ec2soq
 mH1WrvVTQaD8UHSpbHIXmVwFFV8t867I/TUMU0dLgFSOv9n7tbT7TC0T+ A==;
X-CSE-ConnectionGUID: 2JHNvl9/Q3+/xR1IOSAijw==
X-CSE-MsgGUID: yNEnlhv6Tq+iHcYcmOirMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67023570"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67023570"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:19:42 -0800
X-CSE-ConnectionGUID: 284B13Q2TBy5h3NVLcs9Ug==
X-CSE-MsgGUID: gSwsDcEcRsKwUEq+jMeP1A==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:19:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:19:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:19:41 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:19:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFeX2xVnFd4yIBi4Ltt0m5tugHReXenzImNw51tkQJ1Ui7RUW5z8neVxvuDkZd2n2IjASUoPgGlmfGgQvHxqMlJCb5uyn6u/QrhI/8+4fR8Wiltcb99pjo4wxkncGYlSfoMfnST/zssBUnRqexflwwP2BXvCAvBN959IkFZwWsti1OKNdb9/yNxBTiLBeLlaYAyyGpWf6GyhOvAj7IKACuzBQ8BlGv3R6Iu6xpTtc5iRAbApqrz90725Las4wFgCMfzYs2uPdtpSRej1fQph6i29KIUzz3ZmCKvxA1kx9VmtGDjPpKZIAuF3V/CQK6zGEgp6SGHfe4LDJuD/8GGTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1pifquejafLfOJlz8KGsmWUBh2RWn6qx+3Qvwn6Bbg=;
 b=e2ewumie+EenlLQkLspHMoedV7Ea6U4cXufFcNewjSEgUmAdAqZXpirz1s4ym8EBiQqEHRq4xh0JjqKZqpglvTnDMXZfPAyeFuUEFCYZiV9i0N70u8S1U9tbr5X09mm+h1L8yLwbqODO3B8iMwJdLvc1ep9+zX4vdVuDI4m6R/Y9Y6LwqehioE6ZW9wN2zRlogWRhx0/WiExcxdtfNCLK3LDuXlkIE6MKCTBJoIB17qWy2WUPm+alac7xFOh3ttPhPfvIgv1rTFDtuV2ebnms46oRSJ5OoWte4+u0w69NYfFVNQSxlue3kHBQRCGCpL8Cs/QwASeyhKunspxqxVsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 16:19:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 16:19:33 +0000
Date: Fri, 5 Dec 2025 08:19:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for
 contiguous allocations
Message-ID: <aTMGEVO1mRJXSXrB@lstrano-desk.jf.intel.com>
References: <20251205031112.3590252-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205031112.3590252-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 93931fac-3677-4b77-fa82-08de341a1325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NQJAre6J75de451Du+vRP6dyspyhS8Soj9p6Ru4x4pSNAF/w5VmM8Kzo9TFQ?=
 =?us-ascii?Q?OwqzXRQMrmaVC2lQHWmFAj48ghARuKBtWwUpVRVJ3ntMVuet2qVuSMVoSgpS?=
 =?us-ascii?Q?tGZIBYuGBn79EnJWRN6nFsPSkCui0EL1K+CpyM7KIz2vhC8iGhSNdwokxKwQ?=
 =?us-ascii?Q?R4Gj42YY+EmyCwYpPHbzoNj4mE5co8P2D2szJjrHViJvlBOxLAh+t+KkA8mv?=
 =?us-ascii?Q?cB99BZZGxGxAPefuLFJ5f43oozGrcC3/RYMru1+Lj6OAnWVduXr0iWGfgDzO?=
 =?us-ascii?Q?WqKCyMHHvTrP5N7c2N1ZMtIdKtRD+Jhoz+hSKg5D2n2PbRUVi5glAAbnYa52?=
 =?us-ascii?Q?Cgo9f/UgDwWu3bTSXp8xQu/bBDxD+30PGGLAhEVtyxOeJFL2iczBxPnxkgAW?=
 =?us-ascii?Q?i6nGh67GMfkMkWdVAe8UBMbvyn/KVWInLkFWqaBKmjiMbGFSRo3YZiMnpGED?=
 =?us-ascii?Q?T5KHLIYG16HC2+/Q/RgjQiNLfQUQV6Sd15cLeWxsO0wKpgHMUitYueEV+RII?=
 =?us-ascii?Q?RbLDeqnS16lHIpjew/Kp+derHTB+FDRi5rlTBXPFrayPuSNWwM+T2/aurKII?=
 =?us-ascii?Q?2WwdvUxJ/RtpsTf4oRuRmDTCWrH6Ps607dXK4DMXk7U9NsbenS9/VdALffR2?=
 =?us-ascii?Q?gBt/lZsI9HkKHhjj0SsG6lnvegw4kWuoPTh0rHkmlvVZ5qohEocHz6cyvJcu?=
 =?us-ascii?Q?fxjQk6r2VVxAMBVJV72tFgRTLGHF1t/nweUYI3KnqTvynXZoUvwh/tFVxYlm?=
 =?us-ascii?Q?uUdmXOdLL2ztfPmkl7qsAWcqHNhDJCfK2HCdEQeJuUmX44zGfATKOW7OKReS?=
 =?us-ascii?Q?K2H3ivDiHAOJoUEoXmnUGpzlOYyTtL9IWpf4TrvWXahehlDgb0oIZ+Tj0sRe?=
 =?us-ascii?Q?2UxuEhaPuhwt2XEquzBGhCIJtCtxZdEfN43AeJLpMfckYpaRUqs5v1i8Taer?=
 =?us-ascii?Q?00ACI+ggij2l1pWMbNHwAnAtH6KwwID9lUBbRkEs0ki7xaThTwxdL8NQhgb6?=
 =?us-ascii?Q?YkmYOhhVSxz06MwlDa011O76+RIHH+g83lsHpPpVUtg5zaDuPIeyRwEFOMXK?=
 =?us-ascii?Q?3w2RaZ1Xf20zaZu8r3LArZ2cAnk1S/1ELbMyH5p8EOaDn2FyoDfZPu7EftgR?=
 =?us-ascii?Q?Bu9DaKsYsfAOeR5S1elU0/9lJrlmfy7WO7JIpZwsYIS/QaY4INz1xpa+7IRw?=
 =?us-ascii?Q?mSID2dK2sKSQPH5kAYdkujQEIw3mYoN/BmtJBBidEDUH13kXGvP8RHTo/8vj?=
 =?us-ascii?Q?ei3t2x8NhSL9cro+w72/t2X3uYtKWWTRmn/bgMGD346fcd6Bmzh2vU8ttjic?=
 =?us-ascii?Q?YxfcBsvu6HdM/HnC6T8qq5/QySgYYXCqta0D/7LGsyq+XN61yovCDWngFm65?=
 =?us-ascii?Q?UmRROO8cvOJ/7FLXaqaO+K9bAl9CqOJ7OiEQEklMMwjywW9dRlvO7WxYdhMs?=
 =?us-ascii?Q?ck6I3BK7QhUI1ok88XLCuUbTSU6n941Hlr5wicI+rTvO9CiKGzurEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hyY1YhX8uumtsDGwkFJ5QdB39+Q6os/k/UbBJiO3LJ4Jek2FGMKNbMerE8yC?=
 =?us-ascii?Q?S7e6PCli/XYW32oYZ0AZCeSTQAkqTQafGq5mYLIJfMun9gswgBFCyuG1u5D1?=
 =?us-ascii?Q?A76cFXzU20vLsUNXvVJCVZiMs2ueMP5jUaUFCAN/P5k9rr5hz5RzdO2s5dQu?=
 =?us-ascii?Q?8SuU2OdERaPdAsbzoyXXUnnyx5bNR1PXTnBuWDJMxkw9MUStcBZzwdd+x1dC?=
 =?us-ascii?Q?BnOY+iyatZ+doJMgQDTSbTxIxeFZPNw4fHqhX1VboXsNh5FDx6jLeocfWIut?=
 =?us-ascii?Q?AHYTrQiVnOQisxnt4Xezb/yrVEFaI1U3t27XzvURWlD4B2r2UAfWxJ+7tZJL?=
 =?us-ascii?Q?z0Jc7Wny7bh+jJhIpTAKpBpcd97mM4OJGiQPxmc1YZih0A1AK1JFP4jDYfqU?=
 =?us-ascii?Q?kkdYstZM1OF4dtoKOB998vZmgFiF6hyYJHD1KmCXo0KOQsEgj9euXHntLBfz?=
 =?us-ascii?Q?JguCu8HiP27J8hOpOlt0YImvqSHp+wzYehjVqmugh3PuofQd37XhDGUUk17P?=
 =?us-ascii?Q?TyTshtpbxjsAL6P+/6I9LrZTwtLTQ7FStkTHHwl9mgqYmZSndVJwSVzAQtNB?=
 =?us-ascii?Q?2LOaVC0F42/VBREoGC+Z6blXKv2TrIiGiRtLDMhymo6xH5O4e1GAwcz24aWw?=
 =?us-ascii?Q?Iiav88IGI+qxwKjkwvsAwK6IsYeoz5bsPsQOk1spI3yQpzoNCPLmonq3Y/6W?=
 =?us-ascii?Q?yyzNivY8yGxjyWmpLaWlyIIgueSDkoPzSksRQelFXWsFlQAKP1n+1NNtR6pD?=
 =?us-ascii?Q?7gOPrx6NyXRPTZOyEPFBdXRiSPGdl+NX1KF1OgdDZ4EziU/X8jY/gSM7Beo+?=
 =?us-ascii?Q?aHVB6aDq5yR9xbQK6XJgsMiDCeTW8U8tkEms5luRNVIk2lExghJipNubKng8?=
 =?us-ascii?Q?LeFZhWsWk6IuTCA3ppDpETPpKlu2Vwtxt8pvTTxlpsgfWg2h6K9RVqId7hW9?=
 =?us-ascii?Q?cnd6rB4EaDyyVRloLfw4QtN30S6CNBOkDmuk+cm/pC6ngFpDCa8x//9WMIxs?=
 =?us-ascii?Q?0yf1+uMe0LC94q7i6ZxzNMxkzXPIPGdXidO4rsNQuW8sCce+YSiz5e6EBGaf?=
 =?us-ascii?Q?8ouLXk0f0eKif4G+nuSpnLU919qZldWXuaf4OTIFN0lbhDIznjmmvQjI0J8Y?=
 =?us-ascii?Q?MHm44tPKCRbXtukbiy7Oq1h918ffm8ToM2QXJZ6hUDLdSM3NdEbp/LRZdIzq?=
 =?us-ascii?Q?g7xRsO9Em+WFZmtFmObfDfGvmOjAjDbr3DnYXHui1bNR6WFS/qzLHVSrFKVJ?=
 =?us-ascii?Q?6EZe5H5xyokurS/ESGT5X/RZKMD3OxiqIctRTzH0mG2YtakuuD9bygR6aH9m?=
 =?us-ascii?Q?g9mKnY8u5MTzdQnzp1B2kH6/5ofEEZjBMB/o63MdmiSb/Xm11ZTyXUUYjeJD?=
 =?us-ascii?Q?2dlOZMEUZse6asAPuZz2JcH5RojwuwDsZhfnUtIslQS0L1P2JMHY6IcaJAWm?=
 =?us-ascii?Q?njwN79OLx53MNLsZPHD5Wr3wkMdQyhZSNK83/7Mfr5ti9hRMKvj4pmWlIk6M?=
 =?us-ascii?Q?Epdc6Rpdb30yPNUq1YeP10UKMf3ofVv9CCYhFecuR/vd3iadoDPHCo17VkD6?=
 =?us-ascii?Q?YJ9x32GOP9E75fvykbfOL+q264nYxEHbmBJx1K0eu7hT2/5zhsQmcnj5jTYN?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93931fac-3677-4b77-fa82-08de341a1325
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:19:32.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lj/Tg1rCHqQ+zks3pdhMXl1SX6NDZROTPJx+zQA3wYNag5Ft9BSc3wUSirxFK2MAghpw/fzmrPbhggWpUU6HKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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

On Fri, Dec 05, 2025 at 08:41:13AM +0530, Sanjay Yadav wrote:
> The VRAM/stolen memory managers do not currently set
> DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
> this flag activates the buddy allocator's try_harder path, which helps
> handle fragmented memory scenarios.
> 
> This enables the __alloc_contig_try_harder fallback in the buddy
> allocator, allowing contiguous allocation requests to succeed even when
> memory is fragmented by combining allocations from both(RHS and LHS)
> sides of a large free block.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9f70802fce92..ef6cfb8af0ac 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>  		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>  
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;

If we set this flag can we remove the logic which rounds the allocation
size to a pow2 and trims if TTM_PL_FLAG_CONTIGUOUS is set? From a quick
look it looks we can as drm_buddy has roundup / trim logic if
DRM_BUDDY_CONTIGUOUS_ALLOCATION is set.

Matt

> +
>  	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>  
> -- 
> 2.52.0
> 
