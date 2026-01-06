Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4108ECD042D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 02:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0118710E050;
	Tue,  6 Jan 2026 02:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajBrd9Yt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0540E10E050
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 02:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767666232; x=1799202232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tgs1eeXF0N93H0xAmZmUQKroFHfKMRVF6GEKQ/uROzc=;
 b=ajBrd9Yt0dtPTvXNJz4dp++r6NJoQiugHiCM0sX/NMCway98Ling8mRP
 cgTP/DZRuTQwSLy/UHRA7PwyBojLJ+Bu3ljpbwwz8y3OvUOjhPdwiBxhW
 FJWvOJscbZKUNkBSBx5tZNQ0F1OxG11Umj320SlOSWmB2HFLFSWK7zXAU
 zdGOBPmoPKscr4epOXut20FHYw1QydIe/cLE5Y5ONbcLoergh1a+CJWwz
 3CEjrkda7pRrC1tuGMIXr9W7EZM+SOcZYJ1lmOOjsiRmANDK98Is2vUua
 ujqVIZce1FB/+XDfyX3YOKZ3mtxoMjksJG0lo//cyLyKh2nF9950MMOBm w==;
X-CSE-ConnectionGUID: UPsN7n+QQdS/Bo46mV2rHQ==
X-CSE-MsgGUID: rGSLx7e+QQu1/AigAOxRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69083213"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69083213"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:23:50 -0800
X-CSE-ConnectionGUID: 3Fm8D9JxSWqGMs0QE78vDw==
X-CSE-MsgGUID: lVGFrGeOT2a+9CQ3KWDvqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202782949"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:23:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:23:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 18:23:40 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:23:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsfQtpmxWU+8aOPAsxpZjSiX2HawgwG1LZJ15pxCo9o07g4imz1LyCZfkh1faKkUxVawzWVCYWcp7um8nnhc2EURtxDaqD/MlltA945VQ4eKkGdC3NvhzJu2ElLQZd8fceUC6ceecuykR+bAGGbB1R9xSZbyEFRogsNnwN/kEaM94G+IMTwsnywpdpnboyMBhDTBLWFI1TmIvAYEjuUkPmnTGcVdalLGOkzoniIFWOnqksIFOp1RCcS03YtlesqK4G5zW2AXZdZgOjVPa3B+cUXQFsZL04r/IGUi6F5jIQOXg1UzKuYlH1ShKh8kn9K5aLyTUgo9ecqPs9f05nP/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpyxOCx+Gir6s0hxDgKt7LuYJTm44wu3bQH10/4kijY=;
 b=c7ueHD8ygRwSl5eOeNAX2ZXQD/xMotmmk91/8HVMW4780+uncqIQPgvqPTCqmcoFsqSx1N/Fr9GqUyvwXVGzXWJvv8xqPPNRj9VU+0lxtfJH4CQicfO+ng5DLnR+79ACXpAYZbsoaX+8AQeo0EpsRR581s1i8hJYhyVYGYe2gntF6XjQqDAicMbWR4Fljc10KSnhcr+jtlXhwRZQSMLyJ27dAfFqyQkfzdQ3vbHqLVXbtUlQ3QZ0sTMo0sOxYmtg54LiqtHAXglY05MBV9lQl99PvIjrTcJVjxmUiscvNZRVue+9ENCmB5a+644Lf6Ub1Luvl/VCVSa7d8V9tWMW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 02:23:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 02:23:38 +0000
Date: Mon, 5 Jan 2026 18:23:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Add explicit abort page reclaim list
Message-ID: <aVxyKJf2fWBmISqL@lstrano-desk.jf.intel.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
 <20260105233351.3753716-8-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105233351.3753716-8-brian3.nguyen@intel.com>
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e2d71a-7262-4b2c-31a3-08de4cca99ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hzmpW2GCmNjgOrD+P7iQBHNyvl/1vRQpPR5V5K0soeirMcib1EduJjsJ0p1y?=
 =?us-ascii?Q?BHrXI/Ma1u5bWG02F0hCU0fe1TfnkL5iGB/+gjkiy4QmSj8DTrWsbKc2EvWF?=
 =?us-ascii?Q?ykBaODzXPhCMaI8iGe/RWopF7JRH5alZSfbo98YRzdkfCWJ28n/IuMzBI7a5?=
 =?us-ascii?Q?Ju+BtPJ4MXOgumYpZAY6ygvpICfYEQVlNGnfi5ff/QTp/BydzxxAvA5/7yY+?=
 =?us-ascii?Q?qnQXaqTXeDXsG/uCpL8exJJ25MveSlD60sjyfhnnLKSbdsdofuyijf4D3D8h?=
 =?us-ascii?Q?uUscewpNU5AYNsBSIZ6TmE6Z2OLCETpVWkpOx7uNTC6txZ0y1Tf6h/sve1t7?=
 =?us-ascii?Q?DJ3GG1DSROXa+FHSbjnnFGERr7AmVDtRcKUhWETgIiQDF7L9suJh6vUzMJeI?=
 =?us-ascii?Q?JqDgO552cA+fh/tk1PEeediDwu3j6Hb6n8FyNct04td8YLn0ITfrpxRFaa7y?=
 =?us-ascii?Q?d8ih6HwHluD12O04rLPD/kb5auajPm3LMUKEc9U5vS21Iu50saLZdoJ9aJM6?=
 =?us-ascii?Q?LWXilWUj3pY2O0gXMFMktA2DMsW+6+z1R3WsLltkr0dgSNRCWO7psNaj5uhm?=
 =?us-ascii?Q?94qChvns8wUfBh9xM7N7D5PwmeJdrUDeHSrhZ8ijzvqayj1FhgOzeJL/i6XT?=
 =?us-ascii?Q?GKUK9yYQl5m/wUIJqwE7S1hF0H9OqZZEqzhs5recePpBDmTBzE5KD5CkM/vS?=
 =?us-ascii?Q?Cz8zr+uM4El5mDrlpX1MxvzTYzWbNLbYLWxqSoB2b4bcvsAQQ8SIulZy+rYe?=
 =?us-ascii?Q?5VYLCLoKHFsTFkw9lvrSykY56YUMCvhsZnXgLC7iI0dxdVUzux5rmxwXlLWW?=
 =?us-ascii?Q?dKptwV9u2OvnE8SQ/c2dyBh+uyDanL6VgHYpNMP5Q9cvoq9dk46JiAmONCwx?=
 =?us-ascii?Q?5gSg7EwWP+x3opEbzdpyCYOzsCInhNpExgr0le7WrvU3EjYirt/3dd9qs8UR?=
 =?us-ascii?Q?pMHGG9CYBalqVxdJPhEdW8dk5EPzmcdzd7hJMsaPS8IYTTiQ3vw5eIZsbxKX?=
 =?us-ascii?Q?SBEwz50gvXWz6nEZmFXIOMtX8paCLwvOw1paNgW9lKNz23l0CMoFdXrybGGa?=
 =?us-ascii?Q?/WzG5hvuU7UdGBGP7cyHahkla0MpCTE+jlJKxE1snxCJ3OG8aOKI1qaBpn1x?=
 =?us-ascii?Q?ZbfD6HIiByc1bgyKYM2o35r92J1EDV636yD9D7xeUUmZonKI4+IE6ihtpx8m?=
 =?us-ascii?Q?VWhO/GBL3Vw7VHSP1677b7qL03JFqszboSd6U65GZVAh0w8dWwYsURoFMujs?=
 =?us-ascii?Q?iOMO9LfKj9u+0sGHcDMtQtnWUI2FYAzn2mQ2L1cNZ26q2+jZQOQ+NVi9AqYo?=
 =?us-ascii?Q?t1Dr8Oek54qQzJbDnC+B5zyR6Ai645UenOHjdoxDn09Xxnnecfi6rsLMrBf2?=
 =?us-ascii?Q?7h7ZER40kuGhsibbqzqIXgB3t69chPOWPIkb3dCkxekOnT8PR4GLoBboa/rW?=
 =?us-ascii?Q?UEpDnvYfVVCAR5p3tOIkw9nx2m2ZwU/v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PPbloXfim+085LeIrNeboroPfIhbK6glGe0glmZyc4IyKRjrDhCKFPhPLH1I?=
 =?us-ascii?Q?69q9sMc3h6/bjBOzKP3tgHiECRxrgRB6qB7AGSKZ4G/B2mOYEgICMszsP8Kw?=
 =?us-ascii?Q?fLXHLgFP/HfqZ0UKLIXTPKZf5ZtW0vDEgSZaoynUEI/nCToyG6TWM80B5wP2?=
 =?us-ascii?Q?7KwMCINQlgyxn4r7x5iKqwNask2uo6YPdRwSBv6PjGkUXyH4nKkYpumHH+aH?=
 =?us-ascii?Q?vyz3G225Y26RLXof7rgQdTvOmTvH+kXWjM+lr48V3xZtTAPpXlUmv/CQBRTa?=
 =?us-ascii?Q?daA0VudhDsq0EziVg5dgnS39iUR8OqRyTQHyvZXqFqJ1eDTHgYct3uiBqr2D?=
 =?us-ascii?Q?4Rksa4LCS5uBTDS7XVq+IWdptVVXeMlFPcuLPciSpIEaj0CXAGDuqg5ybEDL?=
 =?us-ascii?Q?We2yLyhkn3Lr5bQ0fctsDXbIlFCPj6yCCoCKoTdltXauXLy2m5fJiW9R5c6H?=
 =?us-ascii?Q?lPQ5KxdVwOcIONQll9EI8w1V1AK+G2eoA1V29C21vAdDlNyMvRDQvK6bmGav?=
 =?us-ascii?Q?4lF/9qdedUE3ZE+X7D71FZ189KkXbKLHsgV5pSzz+XCyGqrjEoRUFCjxk3Gp?=
 =?us-ascii?Q?tBnAIlYit/0Jp+giokS5HtsKzdM7/XMdkJplP9wG7nq1XlPKSMkKQGfZdfOa?=
 =?us-ascii?Q?cPdgmEeTsHOBq3ryZhu2sA7c1xwc7AhZ/YZqV7H3ifaqqUPenauFDF64fmJ5?=
 =?us-ascii?Q?H3HSA8c9vhaiKS2pprycAyBPLXKwnM0/5k8RCRZ5jd1h8ZOENzSL7N3QdMHV?=
 =?us-ascii?Q?0+n60YMVmPmHZyzAvrQJmnSFuZahpOHIN47j0zRkYCZ18LDjh16KJFZZHhoL?=
 =?us-ascii?Q?PMVmDanJnjey3eOlFwpTTHOgPOXPO5NQeJDNKcyNHX3hDPzzyNWjTDA0ALxt?=
 =?us-ascii?Q?j0O751vnda0wyblhxi8ZdUfe12YVCG1y2xp6iB5pQeb4O0P+/vjVCZDzkQ6k?=
 =?us-ascii?Q?SbV4gZkRCla72Cjp4j1gvxFnLLYLTLptcY1WBcW/d8429w3grOZHZyIE+Pq/?=
 =?us-ascii?Q?XD43POax3lL8MbhFaBeoIBBnux5qin+7STGkd6h+eEi2VmD5FmBphscEQgyy?=
 =?us-ascii?Q?7LVXTaNQ9eD4OTqD8cBUUAG06KDkyWTNRyb2l+llyQg4g/U1ty8TimDxV6Db?=
 =?us-ascii?Q?1xkUBo2Ji7a3g1IDNRj98ifsLCnD2RwxbH33IDVTrYQQj5RJ0WkUeYAdvE16?=
 =?us-ascii?Q?Lr/VXzqSqQnAz83JwH6dVZopgdqpVBOeleH+jcfe0dO1kcUo6veB8xJZK3TI?=
 =?us-ascii?Q?rHNBVG7+c0CVw1fmXkR48vSYizDyHJF/NAxIyDz+4Kr5Tqi57aI+L4L924Lb?=
 =?us-ascii?Q?U02hiLaV7f+2R7SIqhBMdThaax08InH6xT/r16OhlqzQFYtEisTyRWeUFJZi?=
 =?us-ascii?Q?2T3fQcgr2bTJCTgo5ic32jsVAoay7zcOe8+2mJl8m123U9pX8ZAE7dRT4EfD?=
 =?us-ascii?Q?shOYspLe8ToOJo71ZPBi2tUDMxaciDjOr840Onz0g60QCrb+P/kx0w28PUdq?=
 =?us-ascii?Q?X+vSU7FUz/sLN+luCrh3lp1jk8XXIT2/jX2hfjSBmBt8z0l9ZAp9qmCso9DW?=
 =?us-ascii?Q?OhXbGpwziakaTd+UJgSeYM9A+LXf5VS7+JQJT1LfIFSe3NkechQ2mhIxmUec?=
 =?us-ascii?Q?ifBu6+sEaKovVq+gNlWZBbWv1u3j9u4Qm1EOc0sDFmFVWatrL1V95yfWx608?=
 =?us-ascii?Q?GHlQbbrmQCHkD6y1vkABXV5j3yw/GnDQv77eW7BJT4CCGk2zLUiA06bbOWAU?=
 =?us-ascii?Q?334DNvno9bu7aIqUoV21pwUjEDj4NeY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e2d71a-7262-4b2c-31a3-08de4cca99ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:23:38.3981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ykx3H+EKRcHMkm04g8wgNs7GFFbiJUvbr4rLxrMQlGJmSWefzuHNoq4nhJlkTJRfLM7blHwltfTN0nxG7Zwd7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Tue, Jan 06, 2026 at 07:33:54AM +0800, Brian Nguyen wrote:
> PRLs could be invalidated to indicate its getting dropped from current
> scope but are still valid. So standardize calls and add abort to clearly
> define when an invalidation is a real abort and PRL should fallback.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_page_reclaim.c  | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h  |  3 +++
>  drivers/gpu/drm/xe/xe_pt.c            | 21 +++++++++------------
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c |  2 +-
>  4 files changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index 94d4608ebd74..9f086067a4a1 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -100,6 +100,29 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
>  	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
>  }
>  
> +/**
> + * xe_page_reclaim_list_abort() - Abort a PRL, invalidate it, and log
> + * @gt: GT associated with this PRL
> + * @prl: Page reclaim list to invalidate
> + * @format: printf-style format string for vm_dbg

@fmt

> + *
> + * This is intended for PRL abort paths where we want to track aborted PRLs
> + */
> +void xe_page_reclaim_list_abort(struct xe_gt *gt, struct xe_page_reclaim_list *prl,
> +				const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_page_reclaim_list_invalidate(prl);
> +
> +	va_start(va_args, fmt);

If vm_dbg calls va_start (it does in __drm_dev_dbg) this won't work as
calling va_start start twice is undefined behavior. IIRC, this works on
some compilers but not others so as soon as kernel test robot tries a
certain build we will get bug reports. The W/A here is make make
xe_page_reclaim_list_abort a macro.

> +	vaf.fmt = fmt;
> +	vaf.va = &va_args;
> +	vm_dbg(&gt_to_xe(gt)->drm, "PRL aborted: %pV", &vaf);
> +	va_end(va_args);
> +}
> +
>  /**
>   * xe_page_reclaim_list_init() - Initialize a page reclaim list
>   * @prl: Page reclaim list to initialize
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index a4f58e0ce9b4..2464268dba69 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -19,6 +19,7 @@
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_fence;
>  struct xe_tile;
> +struct xe_gt;
>  struct xe_vma;
>  
>  struct xe_guc_page_reclaim_entry {
> @@ -75,6 +76,8 @@ struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inva
>  						   struct xe_page_reclaim_list *prl,
>  						   struct xe_tlb_inval_fence *fence);
>  void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
> +void xe_page_reclaim_list_abort(struct xe_gt *gt, struct xe_page_reclaim_list *prl,
> +				const char *format, ...);

So I think here, make xe_page_reclaim_list_abort a macro in this header
file.

>  void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
>  int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6cd78bb2b652..2752a5a48a97 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1618,10 +1618,9 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  	} else if (is_2m_pte(xe_child)) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
>  	} else {
> -		xe_page_reclaim_list_invalidate(prl);
> -		vm_dbg(&tile_to_xe(tile)->drm,
> -		       "PRL invalidate: unsupported PTE level=%u pte=%#llx\n",
> -		       xe_child->level, pte);
> +		xe_page_reclaim_list_abort(tile->primary_gt, prl,
> +					   "unsupported PTE level=%u pte=%#llx",
> +					   xe_child->level, pte);
>  		return -EINVAL;
>  	}
>  
> @@ -1670,10 +1669,9 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  					break;
>  			} else {
>  				/* overflow, mark as invalid */
> -				xe_page_reclaim_list_invalidate(xe_walk->prl);
> -				vm_dbg(&xe->drm,
> -				       "PRL invalidate: overflow while adding pte=%#llx",
> -				       pte);
> +				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +							   "overflow while adding pte=%#llx",
> +							   pte);
>  				break;
>  			}
>  		}
> @@ -1682,10 +1680,9 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
>  	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
>  	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> -		xe_page_reclaim_list_invalidate(xe_walk->prl);
> -		vm_dbg(&xe->drm,
> -		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> -		       level, addr, next, xe_child->num_live);
> +		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +					   "kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> +					   level, addr, next, xe_child->num_live);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 6a7bd6315797..b8916552101c 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -182,7 +182,7 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
>  	struct xe_vm *vm = job->vm;
>  
>  	/* BO creation retains a copy (if used), so no longer needed */
> -	xe_page_reclaim_entries_put(job->prl.entries);
> +	xe_page_reclaim_list_invalidate(&job->prl);

This doesn't look right or at minimum is unrelated to this patch.

Matt

>  
>  	if (!job->fence_armed)
>  		kfree(ifence);
> -- 
> 2.52.0
> 
