Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CBDFD45EC
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800510E82A;
	Wed, 25 Feb 2026 20:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuZ9Qbjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E2A10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772052160; x=1803588160;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/1HsyoHRhBTuWjUrbdLYsOProPmcf+5B7tX7Bdm/srY=;
 b=JuZ9QbjdOaEdvzhqH14TpIBi1DE9s8r1Rzr4+uLR2Q9or44zcoqhDVoQ
 QYVvq1f+GP9azk9NRw7wyQtuDKZtMvp6CJPa0Jm9vyrTFi7qDN7Gc+Hq3
 nCIp8do+kloZ0FpTvIMpOTgDVCYG9DvSQ0FWIawW274XoFC+XTIOpnVE5
 GmDRcFYD28+5JpMAEPER3Lr8WfczI6nr/sfgSFPdTtAzlfhtiZ9AUykHS
 pyDdVni7ViJoSdvUXRGwxcmMTOzrrGj5pcPWCOWFTE9pldOtb63storQI
 dTyazf9QvsCIg5jRhMIFTmbjngMOl+HXiJuZ9bPzm1inrU8bMPzILKtwO g==;
X-CSE-ConnectionGUID: 7RtKy43cTS68oyVm+WJDoQ==
X-CSE-MsgGUID: aRXLOQtaTjmsLyV6JOs9Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73281266"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73281266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:42:40 -0800
X-CSE-ConnectionGUID: o/ALNIG+S4qQM5s2kqq1cA==
X-CSE-MsgGUID: Obib6B8zT6e9Lz1T6u2k0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="214611615"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:42:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 12:42:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 12:42:38 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 12:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNFSAHsaKpbeDPAA7Oit0w94wxvcL/9/y2n6bBygXDJaovtb1pjZom5HSnOl4I1afRRibP87MdekQPUEvHsYwn2kr0TCmKObrpEQgOm7bXSHp2lWWeJoPnhmbLEjDlt1zibsare180/IShEpJXE68/X3JHxVYPPjWGyHjxoa6d/FamGQx0KmJCbvSuMG6GZll4yOr2Bz8XcXsG1KDZWPPUx1K8CWxO771AmtRrJsGBncf1HwCpoGoR4toPFfEUnbz7UF4Zu/wBDJt5fdpNW7cdZuvKiR/ZYP8RUGufvLezrE55m6ixYUkZUzWHDrQ+eXIo7oNRVyrOigHNaHfh+OuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqKOHVf16ay+ChQOfe7xMSmbkZJTO3qwGjgPc7tBM9Y=;
 b=KGaV0GIcx83MH4MdQv88o+xOPfDQCQPkYmXQPE9AkRJTwdqrnjpDjsB4Z3fPGtAYWR1Xs3kJUHahG4jFsZeNGjAxcL6VcNaH1LyLFhuTypCWbh2EUjCalq85ZHbQbTYxHghqUchYxZZR5klcX9oJ33lCoZykoBy3/c3HCbaqMtnrTxRye18zspqxWSNEEtV1dfO7Fu87RBIoR7Ou5s3pRKIBGNUHE+Vo+RDWs6KTIQF0j6kF6Za/5fkGnwddCJFDOVOJe6z+v3GtlLwGc8pVZeW3UYhEDgMjM5pGCFhM9UTpHJ4qszjjL09WONke2eyrFIf16NJg6cUiJgXaln1bcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:42:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:42:34 +0000
Date: Wed, 25 Feb 2026 15:42:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aZ9etVe07ZvkXQoL@intel.com>
References: <20260220055519.2485681-5-satyanarayana.k.v.p@intel.com>
 <20260220055519.2485681-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220055519.2485681-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b9e360-8cdf-4464-e0ce-08de74ae6779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: q+jpOd7kovavJUQj5YMgTnDexY56XBZWcOddxLr1aNqixYQbjuCmmuFZU2S2wn+dkY2tR+hX3nTEPvBYZhNp+10kJ5oKmGoi8ObY6vqcfbFIkrmdcuAOB+6WVojWJb6NFOl1iXn3w6DLuiDXbnkFEr21QQPCNegFX9SzXtOKQjb4ipi71aQW7QQViOZ8VbayEhbMn9qpVXc+QmHrEdn/yJqKLtkrCOyT1Nu11hTGOIjcN0k48UHvbJDlVAwtehnYR054UbxuTPZzqvg4I762MlaJBo1/+p7cszDa5YMZbGpfI0GLbk1F4HpRoRiH7813mNl3ybxW3KxLJe7n+57iTJyVkAM+FfW0cdE1d94L61MZMXLRu7vrFfbHpe2Mz8/FZPQVcZ174tKuzwQthdWzLiK7XsITaMU9iZVaZyGOilEsLHTGau7nAoPCLJdkVh1RHOsHcY66i8r6Mlc16l8Ut6czWZW2U0BFrcrCcuVfWzJbO534obwUKHPpLcEHRjAC9Ns69s7Nrf8RchlMRco/q3iT2avprnGOIFEJVIGnwayrz0NJr/iqMgfg49lQoJi+Q5HxjkueFnOHTX8w9aqsN17dy/bR93P3hYEp+I9WRduvzGC4Uq6Nok2mDFtJaiFapEoYHY0sgwBE0R3SNDda6vd6g9Nt6evDsKgKKx1kIkcnbgLGguP24G0ELqlYvYMaoTXiR8idgUr8MGF014vCSVCOikg8xNBwJCdxpHS0RpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YzOlJCOM3wDsGInMrngNggQ83pDfQiax80+Uk4BgDiPjx8FK33BHCd2JUb?=
 =?iso-8859-1?Q?o+DAk3XTWbgmFNEH5gKTDqX+Flgm+dJd5Nj65lK43b0kEMInIC3fGtBwk3?=
 =?iso-8859-1?Q?XZVfJmlgpMCNID6i7SBXQIJuKWAer+TUQU5+CNXY64yxrDFzBMLoYIunb5?=
 =?iso-8859-1?Q?sj2R3IP/+Bzs26UhPZPE0RCe+V3yb11lxSfFqA/mosYwScaW3LVQYsCX2K?=
 =?iso-8859-1?Q?AIu771+4gfW4nlRAVAHxPxHLioqRlGdV9K9QZ4EACx89505MlFMboLlx8v?=
 =?iso-8859-1?Q?EAN7vQog4ScynJDibuhNP3cXzk/69JJ5CrxUryrW/UXUhoVlneHAQze93w?=
 =?iso-8859-1?Q?ybvmRRAYnniOKnROsJ8nUjvWlILBr4Ip6kyQH2GEYXdJrPE7LOpZ5iEo4R?=
 =?iso-8859-1?Q?sQc1HYUaydAkG2PaLZP8Fvjen/8R68rcvaxhE9o+6UB+FZlNpZVxjjNUzR?=
 =?iso-8859-1?Q?6bZlhv2YahQJO00DlN7kHKf3/CVyNuCp0GlA/OspwmyJVHfFXKrZSJS25U?=
 =?iso-8859-1?Q?EYmie1uQ2B2vWcZgJfnFnt2CtBhGDAiEFRnVKgoh1MCIyib8eyvSDeo0Km?=
 =?iso-8859-1?Q?1NqQkSHIgUAYrhNgP6spHaILYAuhwK9YMKqyJdjujYzYOPB3G+qyvoepKJ?=
 =?iso-8859-1?Q?wd/I+8zUuGxh/PD96oDOTU87/LyTbdTlt82GDBbM14asV4vywUAGKktbNk?=
 =?iso-8859-1?Q?GguLHUva3S4Hsxs2IOLx0ZuvzJOdFNmWPiJeocYsvjHMzuW6frYA8qFBN3?=
 =?iso-8859-1?Q?pkU3/buRr9KSw7TO3EghR6UETla47NQSNZsTvYuGuFfZO0nsL/hBaR6f2W?=
 =?iso-8859-1?Q?8X68RPISSVmzopS8uJD93WsRwQqAP/LxCs21Uxii14FpEy8zoGGWrCDxnu?=
 =?iso-8859-1?Q?7qLqNYeJkku5T0+588eYdEEEteVU6dYitSewlA4eJMsk/XJ+Q/kqSRonmR?=
 =?iso-8859-1?Q?CDupY5EfFypc6Bb4lyZn/kt1BKzFeu73krrQniRvA0DWdCHwRlDGAhJRWx?=
 =?iso-8859-1?Q?oO6uCUPf155T18fF9HBSAs12Ee8xKF2/E8KhAePzXT9uF6CSHR3BoASuRW?=
 =?iso-8859-1?Q?dHoPwnl+bN/RDtcS4QMw9THMwVwXqR06mjy5Jb/rksOm8kjUwQNZKkx3dj?=
 =?iso-8859-1?Q?kMUWk4UkvwE2lZMRnpkvUOpw5KTQuOMAYNca13cMzZQsBv2L/VeLtE6ycg?=
 =?iso-8859-1?Q?KfXhESZ5VK+GHiV8ZnpHHfpR0dmhNjnKKl3nOgeSDzSQpB6IkJZw2goXET?=
 =?iso-8859-1?Q?Dit3YbWoaAzKUNqFJsQls2XxcqiOMXNTMZh7/LEkFSjFpI6nGITqqzJDKX?=
 =?iso-8859-1?Q?HZ7t+7/tJM6ctWOc6tJqFsAaYxYej5vaYnDTHsWlxV25BNje9zw3VfmWaR?=
 =?iso-8859-1?Q?q6/O1wRQm9oQddB7TBR/qcg9VOO4eyLwAWFhXmKUaXG24LXtNACKY/3rbt?=
 =?iso-8859-1?Q?DeQ2XMQ14FipXerTirPS82jNZv5ePeIBHkudu9oPMy0l8pLbHqukTlS2NX?=
 =?iso-8859-1?Q?1N8tXT7IRdIJ523eptMScpk6SxIOTYFjFz2DBGO0Dae+bUykf9IkmioAXF?=
 =?iso-8859-1?Q?On6iRK0QXr0AfcWIqEtyxNW3tabc5v6kphZp5/DeIHCcwyOx4+RqYaEmFF?=
 =?iso-8859-1?Q?dNMcoNEe7ut5KXPfH5zVck5+euRjp0+M7pK1jp1I4X8KExPuXzvpQj1qpl?=
 =?iso-8859-1?Q?F+A5cJPI4cssoX9hbaixK7Ug8SYO6LF91vgd9cOYy7XUWBBnr9LevPTzqQ?=
 =?iso-8859-1?Q?xSwldaEps5TdTIq5rUTmbBTwmRK81COJx+ACNQE4eMRYtHnjQdc7TJG/Tp?=
 =?iso-8859-1?Q?JCxDA3EPLA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b9e360-8cdf-4464-e0ce-08de74ae6779
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:42:34.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+Ner1tC5PbWHNy8aOYuuPyPrmCD/thZGcH3xj/YErDHcxpeW8XsN/0WFNDvdEbW046dERoCoq+WGjlzZPSduA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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

On Fri, Feb 20, 2026 at 05:55:22AM +0000, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(), which is
> used for both allocation and deletion paths.
> 
> When BO allocation and shrinking occur concurrently, a circular locking
> dependency involving fs_reclaim and swap_guard can occur, leading to a
> deadlock such as:
> 
> *===============================================================*
> *    WARNING: possible circular locking dependency detected	*
> *---------------------------------------------------------------*
> *								*
> *      CPU0                    CPU1				*
> *      ----                    ----				*
> * lock(fs_reclaim);						*
> *                              lock(&sa_manager->swap_guard);	*
> *                              lock(fs_reclaim);		*
> * lock(&sa_manager->swap_guard);				*
> *								*
> * *** DEADLOCK ***						*
> *===============================================================*
> 
> To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
> before taking lock and SA is initialized using xe_bb_init() preventing
> reclaim from being invoked in this context.
> 
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")

This patch fails to apply on drm-xe-fixes.

I also tried to apply the first one in this series as the dependency, but
that also fails. It would be good to get a smaller fix before a refactor.

If we need this fix in 7.0 and older, please consider providing a
ported version on top of drm-xe-fixes.

Thanks,
Rodrigo.

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> ---
> V7 -> V8:
> - None.
> 
> V6 -> V7:
> - Dropped R-B as some release sequence is changed.
> - Dropped xe_bb_release() and used existing xe_bb_free().
> 
> V5 -> V6:
> - Updated drm_suballoc_init() to drm_suballoc_insert(). (Maarten).
> 
> V4 -> V5:
> - Removed enum xe_sriov_vf_ccs_rw_ctxs from xe_bb.h as it is not used
>   any more (Michal).
> 
> V3 -> V4:
> - Fixed some nits (Michal).
> 
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas &
> Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/xe/xe_bb.c      | 59 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_bb.h      |  6 +-
>  drivers/gpu/drm/xe/xe_migrate.c | 99 ++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_sa.c      | 30 ++++++++++
>  drivers/gpu/drm/xe/xe_sa.h      |  2 +
>  5 files changed, 132 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..b0aceaec2685 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -59,16 +59,51 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +/**
> + * xe_bb_alloc() - Allocate a new batch buffer structure
> + * @gt: the &xe_gt
> + *
> + * Allocates and initializes a new xe_bb structure with an associated
> + * uninitialized suballoc object.
> + *
> + * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
>  {
>  	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_sa_manager *bb_pool;
>  	int err;
>  
>  	if (!bb)
>  		return ERR_PTR(-ENOMEM);
> +
> +	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	return bb;
> +
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_bb_init() - Initialize a batch buffer with memory from a sub-allocator pool
> + * @bb: Batch buffer structure to initialize
> + * @bb_pool: Suballoc memory pool to allocate from
> + * @dwords: Number of dwords to be allocated
> + *
> + * Initializes the batch buffer by allocating memory from the specified
> + * suballoc pool.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords)
> +{
> +	int err;
> +
>  	/*
>  	 * We need to allocate space for the requested number of dwords &
>  	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> @@ -76,22 +111,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>  	 * is not over written when the last chunk of SA is allocated for BB.
>  	 * So, this extra DW acts as a guard here.
>  	 */
> -
> -	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> -
> -	if (IS_ERR(bb->bo)) {
> -		err = PTR_ERR(bb->bo);
> -		goto err;
> -	}
> +	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> +	if (err)
> +		return err;
>  
>  	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
>  	bb->len = 0;
>  
> -	return bb;
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> +	return 0;
>  }
>  
>  static struct xe_sched_job *
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 2a8adc9a6dee..231870b24c2f 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -12,12 +12,12 @@ struct dma_fence;
>  
>  struct xe_gt;
>  struct xe_exec_queue;
> +struct xe_sa_manager;
>  struct xe_sched_job;
> -enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> +int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..333af7b57ae9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -25,6 +25,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -1148,65 +1149,73 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> +	bb = xe_bb_alloc(gt);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
>  	bb_pool = ctx->mem.ccs_bb_pool;
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> +		xe_sa_bo_swap_shadow(bb_pool);
>  
> -	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> -	if (IS_ERR(bb)) {
> -		drm_err(&xe->drm, "BB allocation failed.\n");
> -		err = PTR_ERR(bb);
> -		return err;
> -	}
> +		err = xe_bb_init(bb, bb_pool, batch_size);
> +		if (err) {
> +			xe_gt_err(gt, "BB allocation failed.\n");
> +			xe_bb_free(bb, NULL);
> +			return err;
> +		}
>  
> -	batch_size_allocated = batch_size;
> -	size = xe_bo_size(src_bo);
> -	batch_size = 0;
> +		batch_size_allocated = batch_size;
> +		size = xe_bo_size(src_bo);
> +		batch_size = 0;
>  
> -	/*
> -	 * Emit PTE and copy commands here.
> -	 * The CCS copy command can only support limited size. If the size to be
> -	 * copied is more than the limit, divide copy into chunks. So, calculate
> -	 * sizes here again before copy command is emitted.
> -	 */
> -	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> -		u32 flush_flags = 0;
> -		u64 ccs_ofs, ccs_size;
> -		u32 ccs_pt;
> +		/*
> +		 * Emit PTE and copy commands here.
> +		 * The CCS copy command can only support limited size. If the size to be
> +		 * copied is more than the limit, divide copy into chunks. So, calculate
> +		 * sizes here again before copy command is emitted.
> +		 */
>  
> -		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +		while (size) {
> +			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +			u32 flush_flags = 0;
> +			u64 ccs_ofs, ccs_size;
> +			u32 ccs_pt;
>  
> -		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +			u32 avail_pts = max_mem_transfer_per_pass(xe) /
> +					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>  
> -		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> -					      &src_L0_ofs, &src_L0_pt, 0, 0,
> -					      avail_pts);
> +			src_L0 = xe_migrate_res_sizes(m, &src_it);
>  
> -		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> -		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> -					      &ccs_pt, 0, avail_pts, avail_pts);
> -		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> -		batch_size += EMIT_COPY_CCS_DW;
> +			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +						      &src_L0_ofs, &src_L0_pt, 0, 0,
> +						      avail_pts);
>  
> -		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +						      &ccs_pt, 0, avail_pts, avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +			batch_size += EMIT_COPY_CCS_DW;
>  
> -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> -						  src_L0_ofs, dst_is_pltt,
> -						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		size -= src_L0;
> -	}
> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +							  src_L0_ofs, dst_is_pltt,
> +							  src_L0, ccs_ofs, true);
> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +
> +			size -= src_L0;
> +		}
>  
> -	xe_assert(xe, (batch_size_allocated == bb->len));
> -	src_bo->bb_ccs[read_write] = bb;
> +		xe_assert(xe, (batch_size_allocated == bb->len));
> +		src_bo->bb_ccs[read_write] = bb;
> +
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +		xe_sa_bo_sync_shadow(bb->bo);
> +	}
>  
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -	xe_sa_bo_sync_shadow(bb->bo);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b738102575d4..c7ee952e8914 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -175,6 +175,36 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
> +/**
> + * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> +{
> +	return drm_suballoc_alloc(gfp);
> +}
> +
> +/**
> + * xe_sa_bo_init() - Initialize a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
> + * @size: number of bytes we want to suballocate.
> + *
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size)
> +{
> +	return drm_suballoc_insert(&sa_manager->base, sa, size, true, 0);
> +}
> +
>  /**
>   * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
>   * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 05e9a4e00e78..50218b0d1404 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -38,6 +38,8 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
>  }
>  
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, size_t size);
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
> -- 
> 2.43.0
> 
