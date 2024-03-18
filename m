Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F0C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 20:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F610112084;
	Mon, 18 Mar 2024 20:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWFUtjND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4A112084
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 20:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710794506; x=1742330506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=le1fs/s1wIBR93Og7h4NX2wlNe2leOwcpBVFDJybXtY=;
 b=PWFUtjNDAuY3EnaSLiSLOU36lBOjrQ8ID9cxmfuR7eY/Gx0G3+mVcgEg
 IIqRWunXQfllLgE46UyZkLRSwvD/h7/mlP2QqyctNCFBZjY4E3tRQJc5A
 D4IOVeIRytkqfbQtavYvzQRkCd79cxW/WGdLDuBitq/SRi/oAKbATBOeL
 coHARKCovMqSSkNQA3uTivmza7XAInutzWNFqwR5USmBjWiSnNMoiR1Er
 MSeRn/K/rGUpi2BtR8gtIRhYZQoAcBADz6IAQ1nIIen/sbtDJIuNivlnS
 4ZAuVqwdfovmQHR0BWFWNIRS8/vqx4Kclufu6U8HFuG5ZF8/QFvrOlwp5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8578473"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8578473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18060760"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 13:41:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:41:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 13:41:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 13:41:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRyVJbPd3UAJnqPlz43hbSkOp7mIfA66E/JXgS2h51ljHT0E2NNx0YcFMqhg3ZuqgprGBJfovMw9M60LAdGQ60CozTRzV/IfIxBdVMZIkC1pRWeW2yeDsjsE3msKyFmtRm2VNR26WR+Eei6o7VetapLlNy95eUEVM6ctVpiO5kp5BmxB1sHfPOjXJlJO/xDIz4HzbOtLPAg3erE6Vr6rDYidxQn3BN5+GEM8313Jtrulkjs/Cj8V73oORqkuCZQSvRn11Yne5Z31g2g3Oph8KL5ATSscVLKkRAHzM6s/OYsou3N1Q3cGVIyYzj9q6J5o/4BwavU0vkSiL8LwTse72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RtVSierZSH5T9dPfNLmMv1zYAbfu3acRsgWW3NT2OY=;
 b=QbCduU88OT7KvGuJubYGOszHyn1cUdGrfi5gKoZZS1lRcoiUw6+RciL23i9qD/BpzwGYB1zZ+XizhRaLMo3KCjoizzGTk0UL8wlLDz+2wqHeuM09oSIeazx0fQiSmFgoOAQ7VjroC0kudWGKobq+RjE8Cx2MBgB75lY+m5/lKCzGCjtBiPSOibSawsJ7Y3y+MJrPzjJdLniWOCCMaKwbbXfeCqnOXs27NkMe4fr63yrEHryWZRVA0m/hr+bqJVb5hyl7XH49MTytC5IDraUFWVckQc6RtR2zK7ABVW6i9qp90RFG+kVRpaCM6Im3PxQP7B2q/jZagnXZGBZ75dOWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 20:41:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 20:41:40 +0000
Date: Mon, 18 Mar 2024 16:41:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pt: Warn on 0 level before going to next lower
 level
Message-ID: <ZfinAR6OlL7OzrbU@intel.com>
References: <20240318173744.6301-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318173744.6301-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8481:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TTuHXlZ56tG8FSXHUagdtDZgm8SuBgibNEyydzT+kMZvgHrJiNoCO6V8bmZGURLZdJSS+cB7mZTyTBZITQ7pcDfaBcNmbwCOeULFpLoL8n+bCsjSR/YouzFDNZ+G2Umv+NOURYBSNSyd2Va0vXqDyN+VFxEzTqhyUhmXsq1R0N8hAg0gD2KpwLkVRJKPw2agoJDyDQcGvyqOPAfaRHBQEXQB42Ve7XJe1kITshyACZlbGxHjGCXesD4FDdBpFoW511iKio4MDpmpNjSeZUUrtMJ405fSg4zT8EWVh4eM5IYHoKEQMZhIYRE1fkPgy/J5bU2w/N15MvJnybSH8IhQL1PSY1LKjCxCsZgS6z4cMYGM/NurxNJRdlJxBIWjfgEJHTam37Fqc/oOpgsNqAKzBJJijq8nkRZpaRTgjBnV8Ac6BGYZKmuDwIpRTMcr+NGZldyMczXqwwwH5lL8BiibMQ1qjyrbKnFnoFARlGWYJTWJTsQ+RPd58zkEq/mCHV1smf4+GRSEV/TF1E2LRHELzJzhfS5341vDccrO8wyvkjxEBVrG/ggmSRDVVlgLatQHgR9HYHsctwVQ/CU5RuIVQ7xpEFUQh+yY44dYZVeUaDsBvpe5NdnMMMPEUurRsZS7RZBru+42+WbSEPZts68+VXfC27Kresy4IUTvCrAIwII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBytfMzeKn5Xw9y8VtOJBMm0XTMEv5hu/DfLr3ch0HFzb5cxfCv49zLe9P3f?=
 =?us-ascii?Q?cG1a4z14/IgKiPJCej0zLcWIejtE/xC8w7abfjDPgnMkK5c24FDhpZoem6fj?=
 =?us-ascii?Q?D6Wb15kWgq0FVitgNKyB9c+C1DUHVyfUKLM+Js5AEpEeZiaSFSMlgJURng0l?=
 =?us-ascii?Q?VBklvOUlkM3GLLkRz1E3XphJc6X4INbAWv/fj8yVNuHzSVqnVo3yGBr3gdO6?=
 =?us-ascii?Q?p0QgvhdZA1U389cj5su/Qo9lxjVrGHi/walLiG32QiBknaFmHcw6R0D0Orne?=
 =?us-ascii?Q?MGSPz15BXUY7WaLHGgG7xczlbiTlPwwQougVMBkkbYV2lqwga/b3ypYb1MXI?=
 =?us-ascii?Q?8zuChs4X4ZHvy/3JY4RodOkIMSChvDARbb9JG87jdBUi0GmCpSU5quNf91cV?=
 =?us-ascii?Q?E2T09v8czPkxiOVf1luRXgXlB0gqXH75CZzBiD25Nyrn5aAVPaXhY6D5b7R+?=
 =?us-ascii?Q?iJvS+URWMZWcOzLp8nAUgsx7x5R+k0YCx7SUV8yjYl/1IMZz6N/Nl8x8QGPR?=
 =?us-ascii?Q?Dd8fOrkbH+7auZFtVrWaZMSlNBDf3tsuUX9w5z6LPrqXKrnJAC4MG6sWwBqk?=
 =?us-ascii?Q?3LIXlq+gLDPOl5jDDGpMRgbSyPSTfmfblcY6h26pLQUbpHiLBEU40xOANIiT?=
 =?us-ascii?Q?crqkGvgzk2HAuL4RrWQdYZa6FCTB5YjX4zCFYd3RqSjmsCaSVCeHw3Gf433a?=
 =?us-ascii?Q?C5bJKpkIE+Ph+yFrCnhWeXxAvdbtyUvC/PZSOELn2eCo3OQ5pc+oY3Lgw9Oo?=
 =?us-ascii?Q?nlOwvf3y5HPvBSxlYIreSXqrXqOIXFkSJym21PNZueMeMyCFcoeCafcN6ygu?=
 =?us-ascii?Q?cRlc7RYQB9bSHz5LR2HhlHrK3VAn0HWk6PewJPpNbXzf1fy66KfccpBSnaGK?=
 =?us-ascii?Q?51W0uPLhvZE4FO+mxnfcCWuwrg1hL0+DuHTOg7IX9A8bG+96jpW9min9dE5v?=
 =?us-ascii?Q?VtqQ4d94DzvPEWmSq2jecHHuQSffFjKVpVBUU9BqxnD1yv3xUMgMkhuLWX2v?=
 =?us-ascii?Q?JowAIvdplWdjLx3CaU38t2iN0AZ3/1DcKQ/3qsz2N1D4J8F4wQ6V6AlwBvzV?=
 =?us-ascii?Q?vSA+D8tdTJG1p1NS6l7URNEX2JT7wrCcgdsA7OtSIAuVe+ZyQP9UH844lCsq?=
 =?us-ascii?Q?Pd3zcKx0D4F1wbXP85NNNSb0aBNlkH5ShXIwJeoqXwHjH8SHb6hwLymO4SvE?=
 =?us-ascii?Q?gfxUZ9tYAqRhmRiR8MQLMQbBDBeb6Egp6k7QWvgwNpDBcss9fdxl9SAtbJ1u?=
 =?us-ascii?Q?Qn1hMgpRG8NreL3doajAwDoJCLWHGN6aCPePgHE4HQpEBvpdRlWItLT+1WcX?=
 =?us-ascii?Q?Ht13UK0zGlej4f0SRjXAAVbJl5AVhS0TI9frGw9c87wzG/GXVqTpSWhKLfkU?=
 =?us-ascii?Q?pf57Q6PyS1EJagBekoL+o5p4T7zPpOynnS89cd9p9dZviopOxKFE/NZ8JJbj?=
 =?us-ascii?Q?CJ+q1+kvZPBax0JoNhZnlaO/3hGzVzGPU2RElBmnwk1wTou976BZ7VUasGg9?=
 =?us-ascii?Q?PoQEaX6evpHI/0ZwrJIe7hZBVCqCwanIi/Fhmv0HriobpkfLuaM1T+8vTcxG?=
 =?us-ascii?Q?9U4ObbRCokXySPjwDRPQj4Vz4VNZPHSLQpytYma46RfNHbGeOt+o0hosae+f?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1732870c-6837-4425-ecc1-08dc478bd09c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 20:41:40.9210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoM0xuvxUk+HX+7MpKvtaee3IBf1cHa7rWSpBlRbeD6kd7S57dk7ohDB9EI5isdpBwOBH6NW+iUW3fu3PD1Q/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
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

On Mon, Mar 18, 2024 at 06:37:44PM +0100, Nirmoy Das wrote:
> This should happen so add a warn_on to be more paranoid.

should or should not?

> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7f54bc3e389d..d6794f65d6c1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -731,6 +731,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>  	pgoff_t end_offset;
>  
>  	XE_WARN_ON(!*child);
> +	XE_WARN_ON(!level);
>  	XE_WARN_ON(!level && xe_child->is_compact);
>  
>  	/*
> @@ -1396,6 +1397,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
>  
>  	XE_WARN_ON(!*child);
> +	XE_WARN_ON(!level);
>  	XE_WARN_ON(!level && xe_child->is_compact);
>  
>  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> -- 
> 2.42.0
> 
