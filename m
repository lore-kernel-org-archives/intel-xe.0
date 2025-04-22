Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698F8C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E86D10E5D1;
	Tue, 22 Apr 2025 15:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDilUSW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F77610E5D1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745336846; x=1776872846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PBVERMHFwYVGtynSxyza6dXE3GJs2MzWlz7fdpXR2fg=;
 b=SDilUSW+c2L4Y2Ije/jafmjoEYONhxvHoUqlFMHf8XOOdIXaa8OhORZY
 7Yn7LWwy3l5hda/+BMkojoUmqcH/9lBVlaC5QLg5t/fV4jAJBVzMlYtUu
 4tBkY8mNljqbRVdfBa2sQulDrUsvaPMo5/Hj1+LwqdlaXgkpOD/aiTvD6
 l+dYqetv99hPJBIzX4VzGhg896HxwHTrV+KWB3PDiJqOQitrzK9JmEKyP
 WEPNEAEpezeIeQZnNsBs9L5MHfmDucT58/6W1cKc0mWsomYdNo+0jtwFh
 ksCou+euJfC+0S5IHR9r9DQr1TOhDWq297icKS4caWA6foby/rHh1MIQ0 A==;
X-CSE-ConnectionGUID: D06nWoO5SyOoCNhdMYLL9Q==
X-CSE-MsgGUID: NdSL3QbXTr+99MSKqdIgxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69393524"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="69393524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:47:26 -0700
X-CSE-ConnectionGUID: qz8tFGm+SMC3FzOd8AXctA==
X-CSE-MsgGUID: Gx79dawRQnCwOCm7zVXbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="132371236"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:47:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:47:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:47:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNkt2mZubZ5Gxo8o0iRce1tIJXORCV0BLxLMK7W/jti78h0Ozyje9e9l+xIRCtYWSlt3GsJ/4VA8zVe5Ep4n2Kk+bVr3a6USJ0edSeTl7nC3GxrKzjza70Ey/C1eSJWqb9Swsx7K80FCg6vAumW0Sq/xkZRTzvBz2aUtiteB4iAQ9frEBvT9A4Nwt96ir+/GmvRORAlL5FK0Gko/F4Grz1SBL11856NrYN/AIwQQH+DgTZkU/tNgI5adf+uxn1vhHfcNUZ4Rpqj3AZbbYF2Vd8jFvrnxEADsnAl6191lb065xbLNQG8Q88j7p7SKY/3Xoi9n/hhrdDWQ96h/k967Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57zZxP+YZd7LfG2eIJsfjpFbnKUYU8IggllZYpUt+DU=;
 b=OvfW/FG3/LRUFLwYWc8AhF+lIRVZcbYJhgnDMzLvr3OQ24fywLFgMYWXNgUNNV0/gHVU/wWTB2rE0GwuhiaRlySAvjVoglKxiafcR6bMvIQEMVMcOoSIh8Ua+bN+alynl1hO4kXaLS+uy0Tf6ZPJWrbzcMawXFnsIT98YadSWH2NrY27/4ayVK2xmaZtgWHAYtwsa584vW3OKEOrQRqFzfoCjNfRYCuM3NMLlT4lYhMOJPWwPV9GVh7OBJFuyi3wtdTxxthP3FciG+5bHiU4uYPp85VCuPLUu+FR31L1Km66ES7EDlpOSJEfzcJezxt9R97yOvK5Fx9t8JXolvd+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 15:46:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:46:42 +0000
Date: Tue, 22 Apr 2025 08:48:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/pm: Wait for vram ready in resume
Message-ID: <aAe6My3TaRIrfSdM@lstrano-desk.jf.intel.com>
References: <20250421135029.3489950-1-karthik.poosa@intel.com>
 <20250421135029.3489950-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250421135029.3489950-3-karthik.poosa@intel.com>
X-ClientProxiedBy: MW2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:907::30)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: e91fe697-7d05-4cc3-4fcb-08dd81b4e0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+nHctGyVoA5SCZenaNi4YBmkeZc8WYje9Ly3DIQ4PMPyNIBeJV6T3oWF0/w9?=
 =?us-ascii?Q?IktVkkLKcyBmS55aySMMBzacrfjCsmQ0DpP5dkY/G51aA+C8Ujdx2jSgMvQJ?=
 =?us-ascii?Q?QuPaw0fGWfsWqvC7+zBjAOzRJvKECJu4ml/6+XxFg2cjEXziApG2EkbFQY5J?=
 =?us-ascii?Q?cqZkA2EoYLViAlc5a2Y8roaG36w5+eIsrSP3vnSoXsF3f8yACdNbEWuv5PUS?=
 =?us-ascii?Q?mEDboRHaGu2XoQnleSVNPaBMaVaL1kO98Hpwe30ZD5w8O4qiXEP1mM/V/AC9?=
 =?us-ascii?Q?7KoxXZehwdVVqz2BrtTkXSon984pv1I+88sgzxvthGDab9kfKuD0BrT9Q9qe?=
 =?us-ascii?Q?lgNDe6xSBN/QfZMHX01npqGhcbw3HmuHzA4im3sUzdnUaJXEBZlovOvXdzYF?=
 =?us-ascii?Q?DygzhYU4/kQartLvqm0DJ/05H1paOWkkTyagNesu0L+Cvsz9guesYJP+LSig?=
 =?us-ascii?Q?pj5rsGqDyTJ1USpz+/CWMivZWf+tIJiqbHj+VrVNDpDDg2wU5I9soFk4Nm+F?=
 =?us-ascii?Q?6vxnLrp3KmpA9wAY6YI4TPZRUrMQnzjYlpmMlc58uWZtuzXI5/Vtab6wYp4A?=
 =?us-ascii?Q?wVBXkl0JqvEzdJa3/d2i7HSEq0AZXlAJS9sIZkb9wiJu23U9lXU08J7ZPCGA?=
 =?us-ascii?Q?t0jRs6vgtosjpEloyma2GlIMfHqOFVGX3q20wEsEXqlYk+VWx2NxZu9eMn2y?=
 =?us-ascii?Q?RTc3nmwsn33iYNe+n7RmHR0+msva57pEc3rstfj21HXuJQs/FbSvAzD0vXTO?=
 =?us-ascii?Q?zTYwHzC+L8445wqIHD0NY2khpRstWFBTV7W6qnGf1dV8FKAEQwGoUMEyCUnD?=
 =?us-ascii?Q?my1R4BFJhTsbvP9GhgxtLuP/DFqKhjpC1z6WUit3Gkr6iCXRCc97hYOMdpq0?=
 =?us-ascii?Q?NXDrortzHkxq44yifG7+aXR3+F8aHquQaaaGdtRe7+LrT9f+Qc8lVwnZlRyg?=
 =?us-ascii?Q?a4RRTAUqe5M15FosvXjWWCPlOl+XXft9OQoYg2kr5tPGOvn+HeVW4wxzbmkB?=
 =?us-ascii?Q?BGr0hGmIS64jMBbWRijs2uBr+lE1xzBxr4ILjKrqiKsnzbt9EP4bjTYCozax?=
 =?us-ascii?Q?YC4RYGFwZmc8aUFpZVddz+jNdPwnJN6fiMyUTsywvcnopBQXsu2jFBa2B+Qn?=
 =?us-ascii?Q?eBqBvLUBNQsGzyuk0Q+UymRacSmos1Gyho1o3xW5l+EpEVrKGQj+esnpM8rU?=
 =?us-ascii?Q?fHo44PwXhO7fd5ipUaGQmmGpGAFLqmiSaH3uww04be0I07GDTQ/pdGTdG2Iy?=
 =?us-ascii?Q?rLHAv05+lfk7HxLoIGIksxRJ1DuTfYTe/v5HnH+AUo+YQAuX8a6Xbh686pf4?=
 =?us-ascii?Q?5xTB3SioxnZigloqEa1FH0LFsxCCZeVUWrnidZmNCSboiJhiZTUHctBRIiz7?=
 =?us-ascii?Q?l+Ceo+ptBoXy85DUOMnbeqlxNtgzd54JgMu/SVQ52p3CW832pzCuDGHyGUD5?=
 =?us-ascii?Q?b0EgKFi9uk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r1KpG1XmvqEy/QBBuOwb5pTsFkHAGT+RJ2QurwRyFmXblInBuv73S8UQG+Vy?=
 =?us-ascii?Q?f1zCqLRGP0RTfKF/ZxywiqWZE4e4J7AzbtsYSs9XqbAZ75mhI56UK3L6BBCk?=
 =?us-ascii?Q?rByQ9h/u3OkkCddMBYFZuBij2E4+JIYoUvcKolcOZrEGixZn/iB5M8/31EvY?=
 =?us-ascii?Q?2Ig3QQ2l82BxJnCfjBRZoh/CD5EmbxN+3rI7ISrSGuEI5+5ftUYeqv20O2Du?=
 =?us-ascii?Q?wUPaNegmYNlk1GiBuBLGCM+9yfNK9eGuD73RsrXL1lcE8xqE9hWFVSJODQQJ?=
 =?us-ascii?Q?SElgn4Hj/NPLMlzDXRJ2ruIn+atf5cUYOn9iRF3niOKzTSfSySfTeUDK6w9C?=
 =?us-ascii?Q?p18gpUj72vvCeO1Gkma8T2RHE4NE4A56dHDZpoAJuWAtHZx4mEgxG7264WKc?=
 =?us-ascii?Q?hQE+P0gTygVU3wcemj9hGWdRETtrv6/jciGaNUlHsAIknP4MEtTE56SPHtnY?=
 =?us-ascii?Q?p8KRKkvT+t5SFnuCN16Q5udD9Hwzg7yUjh+qI7LHXNGNQoUUbgKOeahIj6k1?=
 =?us-ascii?Q?u0ssU4FZ5penA0T/OqxtgtF7JZEzs70btY5Ge0BiPoYoZep1E0nH9vJKUwgC?=
 =?us-ascii?Q?OSCnOEB2dDi3cXhUP6SGamKkKUsa/AivbqfKDrlLAz4WcR1PMV5+0FS0H0on?=
 =?us-ascii?Q?L4hk5i0xUjapkZNU77KPCF6Yd4lr211v546CvMVyQlK+b8yYW4XVdzrPuDO/?=
 =?us-ascii?Q?S1Yk6azS4TJCjo0aByHTW9VheEXvFvE8FrCHpp/vFLSJm/YXGvCx3AOxvweS?=
 =?us-ascii?Q?nSl7LhLH4lZOU9vARe3xDLRApQl9pigkmCebm+9t2pazb6j3vGI5qYWF8eXv?=
 =?us-ascii?Q?pJOjV73pwIAf0XDUWcGdpxod1dNkC23VM7+4/Bmpq7hg0gnSt3jDVDlunVvX?=
 =?us-ascii?Q?8gcNZ8aCEjzbIMdeRi1dqtgrJtCHqYMN3hGAM4FZCQvahM7ACU0iDGBl3ClY?=
 =?us-ascii?Q?OnB3rBZIGBlf1l0qA7HFZi3oXPzzGCKUY+2B5lxuUwTcYD5EOJ5esxW+zEGV?=
 =?us-ascii?Q?d+bbKl8TCZ8HSAVJ7Va6d++OSEcMkmmlfOM3X4nB+hNvRYL+HN020SjvhvAb?=
 =?us-ascii?Q?mE4cduhpiZgi5nDiq0CW8hmvubSzf4u6A6TgB+uFPozccZZM6i9ISuqZanqR?=
 =?us-ascii?Q?SqTB5vGwZB7WSwX9l0PsBe0hEnT5+6sD8a54AF7mliZ9iV/qxk6/qB1u30I+?=
 =?us-ascii?Q?urcr9n7vuNFy+khMuTdHeQJnVyXkTS90VwGis/3aQmx1Yl4Ye+d/+5tsPgDj?=
 =?us-ascii?Q?g9T1w+S2m5tPlVGbVK2wlfTdfasqRl/e+H39sY3TtUd2ZwNfdOMO4Ah3p0Aa?=
 =?us-ascii?Q?fyKLfCGC3s6eSNIr00Nqss7gc/G/aq9m5CISv19u0EF0BxeiZntpDfLTC+3h?=
 =?us-ascii?Q?fKUWxzkilNOCnzvIEOydJq7rUP7eBtW6LrPpbu0zXkIK5jblxsrvzN73Bd/L?=
 =?us-ascii?Q?GDAq16KbY8SXskm271VO9fbkoPktRojFLkgIZOKiH3KHQfEy9M0O2pS4WdWE?=
 =?us-ascii?Q?ZenWPwpB+BamdM4vZK7QyqexA79kO0KxR04cGRG+sG8v45ODlW48Y78fiObz?=
 =?us-ascii?Q?8P+n0y6DF3fFHGDXb0uB8kdKMVt12M/OQX6gKAw8nPSy0CsCGmyBfwiefmAm?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e91fe697-7d05-4cc3-4fcb-08dd81b4e0ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:46:42.5821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZT9TBa+Xjs/TJ9DL3kxc3/lnuubYahprFqrs6RnC+RVsoAQlQ3Do0YNotWT2dtJ/AXxPtl4B44QAyXMCVQGLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
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

On Mon, Apr 21, 2025 at 07:20:29PM +0530, Karthik Poosa wrote:
> Add wait for vram ready during system and runtime resume.
> This wait is there in probe and is missing during resume.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Is this patch fixing anything, if so, we need a fixes tag for backports.

Matt

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4e112fbacada..479cbccf9ed5 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = wait_for_vram_ready(xe);
> +	if (err)
> +		goto err;
> +
>  	xe_display_pm_resume_early(xe);
>  
>  	/*
> @@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
>  
> +		err = wait_for_vram_ready(xe);
> +		if (err)
> +			goto out;
> +
>  		xe_display_pm_resume_early(xe);
>  
>  		/*
> -- 
> 2.25.1
> 
