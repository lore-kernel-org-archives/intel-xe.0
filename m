Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48931C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 15:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AC110E612;
	Tue, 23 Jul 2024 15:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbPd8WOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F36C10E604
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721748188; x=1753284188;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=v3G1vAtph9cpmbrF36sF7pXlxJMzswAaqBcYm74HdCs=;
 b=SbPd8WOSMsW3Dahopyt8iziPZWF/gho53N0yeEYbgn/7bkV9s36U+YP9
 ma09+r5oXQlwcG9QKOogeeA2IkHmAc7MExw41PHQQg0yw0v6lfkmvRpUT
 IGPF3WPg/RWGvA2SWMAG224fTVL8qz7KHTH7qT8aKP9QY66zP5DjHVH1k
 2x2kgxzoOjQ+jVvoAOWq+CrPTWQ8yUt7jY7Ke1GyLDjSfREgJxslwFigM
 hNX9tQzKWpqrvS0e85gGPcEwsnwlKfqseHoFIn+cs1JT9AyhFIDoNwPVc
 SgNt09bZLhP+nLNvCPHWO0D7oxzykX/rPgH0R8XxqIWz5tUs/5twYmtD9 Q==;
X-CSE-ConnectionGUID: fndMmFiNQqmEbsTXUF4YsQ==
X-CSE-MsgGUID: Eor3GVY6TPy4E4iHDdbupw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="36823564"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="36823564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:23:08 -0700
X-CSE-ConnectionGUID: 1pzT8IuXQduc8FARfQoxLg==
X-CSE-MsgGUID: INMphU6sTzqMzal8IsZh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52490735"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 08:23:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:23:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:23:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 08:23:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 08:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWCpsl2f3GAjxQokZ7tr1K8ofY+pQx0tDdLMxze01wrm6RnzYmF3HBqADR4EB/hnS9fJuzbQ9cza2tyoyqarkaRBHCdWo17qUE4RsWImvvae8i2FfUfrjbBah4h/RZDadRpyq413LKQ9TceTOuYfSFU2BhtRVBtw6xIw9ceM6RcCs2bSipZI0RrS7PudvA3UqHcBo0urcl/zYiTCCc2Rja9EjpRqL2QXWBJpYvwgAmjF7RYIqedYMuuLyWjyLzfV9juaroscY0c/C5JEv2dRe9PKsb1K5B0yLb+WMcwEGRzJcJiggI1KGZvL4sR0/9N7E6O0fB6CGnwUHNbeSNdJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fky/RoEg6xCC0TaA9igHqg5jZmNjENM5OcdCx2jEmIE=;
 b=IxUexd7AzD8g8iRh73UVKROqpDk9uMxqmmUGUHiw2RAJeYHYzJEvucbd0FQdZC1WxUW/jDWmwM6ye7qOrMYvQOttuug9UR+I15RrDqEjveDp/0uI+9OZ/eCQPuieeSIFKk7xnwF86Fl35AbUpV7H7NvAJUHvXBi7BQgn6gD0KqoXPe+QemiTUiWCGnuK2HiZW+SYX4NaUhdM5CpY0HgRiq/EjA0MjE7AswTa6DMJzlHddbDIsJ+BOSOJ2dJbYoM8FAE7gSMNToK5KOe4H1hkickEasjChIY9yzYF645eXeSMvRA7UPTEYPZwuI/MpIuKmzlMcgraXTa/oAL/UyCPcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 15:23:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 15:23:04 +0000
Date: Tue, 23 Jul 2024 15:22:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Kill exec queues synchronously
Message-ID: <Zp/KpzAZJdr7L35I@DUT025-TGLU.fm.intel.com>
References: <20240723151454.1730498-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240723151454.1730498-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c917db7-12c4-48be-4c81-08dcab2b58f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VuVDqhI+/OfEi5Wa+YqmDBn9nLz0fapVO6ujVLqY0eeRDhlIK0iH+rJCf+Oe?=
 =?us-ascii?Q?gMB4CGFs4FkhdxR6DOnIdpnieTNGAKH7m4SHdbYtR1/S9krKtWN4JYkJ4M08?=
 =?us-ascii?Q?Jdg5HOfcot8bPYO8T5wvL5RSnQC9XfUygF8X4zSOZ0axYn84Cu7MNArin6Ne?=
 =?us-ascii?Q?P38KI9/0YHWY0FUYfbhtBejVDJ/E6Cr6RthRLFU5ug9MvH7fGlrmAbZ+6G4E?=
 =?us-ascii?Q?Tf6+q2UHrOUpcho5Xs6sf8T4Z81nRsT2mkK8LMdmYG67tXLoVodypSGLzNS/?=
 =?us-ascii?Q?eHOG0wfVeVB92+43F7zrh4T8Jx6IfyoWR9pmDhCou5Qa8cALPYKwuQY2L+FX?=
 =?us-ascii?Q?ReHR4CG9N2YTnh01Ztx0coBoSL3aBJpMENbO2O/FM1Qs+/WMuG8g6bI0a4gX?=
 =?us-ascii?Q?b4pVMRl0OOLLR8MID6ILt3kvtQfKxq5DXAWPXIkSs13nSWdA379HDt6KnOoU?=
 =?us-ascii?Q?3Tr4Ytm8EKEzMZeLUdTg9QiwMNVjQ8Mv5S8P3z9JlmJRBruFRohtqY0C85u7?=
 =?us-ascii?Q?7vBBpqM2kHydg6ovYa/Nez8dvIBGLXs6u4JUBMyl/aHeyYh3akxr+6rm4K2w?=
 =?us-ascii?Q?7ou9rqSptpP97XDq0uZQKVsK1SYFgZr7dGmTfwWsda0F+cXuk8iY8ccC46o4?=
 =?us-ascii?Q?JkM0C+V0VBtf9f/9i/0pxgY8qUtqMGYveyuKeK9oulDXbOMbPHjJlfgHfSMg?=
 =?us-ascii?Q?wxxiszQvwDX2mz6QDeBSdH7mWSbNI5wR5Kobbob0+F0YKBSiDXoapxlmrhpj?=
 =?us-ascii?Q?nEH/13Zwt2ls2ySfzf+Dgwj+KuTtR2C51osk45BqEA4pL8xZJs0Swh2ylU9X?=
 =?us-ascii?Q?4Iljk7yCXqmiYmLnP7K5lrxkLpgPK4LcuP+XgONWcS65EBANj265cUhiQK0I?=
 =?us-ascii?Q?QsAFGZZ8eN2K8ObR1/383EobxNpu/uhIyi0jtB81DFwZw38GBN4bbA//3Sm5?=
 =?us-ascii?Q?s1+lPMyEhcOXX30utyTpOltIHJNfTwUbSJPlcAzXhGVERxyazeoc4+mMFMjh?=
 =?us-ascii?Q?+6PwyGcp2mklezH3ELC+0IRswVrOF/zUd+7dtSfxO8S6qOja7M/MawmVlPQg?=
 =?us-ascii?Q?loyNa/OcP4CmFfVwM+zs6TRYoDySJE0EfwzhxtztC/fl3cOPQoJH8z5NW/lh?=
 =?us-ascii?Q?1Qs39T1EHkJlxO0+p2/DPUoH+Q0nfngycIbFAWUy/vxi5eLuQ21cgDVWBtkG?=
 =?us-ascii?Q?QGsQivV1G2CQnXaoebp25BhFJl9Ta1MhTzhnqHsYhi+Sid0Yhs0GHGqpBXTY?=
 =?us-ascii?Q?RKaVKSgOxk5IKrRHS8/LW75BBAfkBnMRsBcn9scyKkN4i/PhvLf96cMXPOfl?=
 =?us-ascii?Q?qkSmyckIS39UiUmzubedqKwRuRUdydX6dwq2X0o0WCc6FQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?72m0Y1kzTG48NrWqOT3rPEKP7FpfzxjM5rDzDD3bs6vmnx+WtZ86bo+SQnqJ?=
 =?us-ascii?Q?spveap216yu9vTql4JYfO96kEi8qTX5aahpYZ5pjwDePn2DG3QI7LXzmSBta?=
 =?us-ascii?Q?8XkwfFUYy0/rX7So9WSfJvKKloGASCFtCkpL/u3/qWk9vMjE1mgDBVRYIYHZ?=
 =?us-ascii?Q?bOSykZm4Tc6twbRI62LMWoT1G5rKk7koEexm8f4wSuO0U/MBnxVZVDMr5Jop?=
 =?us-ascii?Q?Vs23tH2EKos72tvTL9b/xFB0MBmzKwVGHI1vNWwmMresuArieapoar3iCgx4?=
 =?us-ascii?Q?wJGoislT5skICZ5xj5V5tv/nWa4UgVm6X/lWerOfxYKduPYhwOlS5GKpi5vq?=
 =?us-ascii?Q?S0YI4wcoOjvMxSMCFpTSkw7CDJbeOExYHT7swPFlEWijD47BhqZgNfSd7Yr4?=
 =?us-ascii?Q?IX/aX2vkEV5RRaKIiF/UDkwvTuMBkynLyXIJ8AtPfdDGz7g91XseTnGGhEFW?=
 =?us-ascii?Q?8QZpwx+/xBtwjKNl9cJAon1vsK25LvClbmMKyNXDpwuFd99Bz+r3aZANACkB?=
 =?us-ascii?Q?uEEN0bjrPE83t0AZ2jz5ce2ODRjl415R2tyao4XiEmcCyBEpnvgMOxNdRCcf?=
 =?us-ascii?Q?Jo2GPC1Ry0ZHYwsf2AS+1onIdnIEZTJ9AtI5j9QEJHzwWENVuhO1u3r/wvJh?=
 =?us-ascii?Q?woKOpO3Uz1cP+wIa7bdG9W8o4R1LxdYrtnXknwRKCPFp0AzT4X8ON13mEclM?=
 =?us-ascii?Q?TVBa2dw8nufz4YnVV0zjT7kQMatGzYyChe3Ub3bRjSybov8LYxZRG/+2iQMX?=
 =?us-ascii?Q?ISJulJBCtKyYTatnH7I0UeGMR153tG1WkAIE+uA37KCqnxy89MycQGvoq1C3?=
 =?us-ascii?Q?JR5Q++bGMFnz/i3ihZruD4t8bgy78/yBbumVhzPqXI2mt5pwQk8aNPifsf6l?=
 =?us-ascii?Q?CZKCsqO/Mr8UrZpYRBhfSA3FbEYXmiqrh3zZJA1Fb97ksP9gxImrwddFbTLS?=
 =?us-ascii?Q?8PQmtLa6CvpH02RECunyDtTDxHZU4tPlCeaBCX+ZYDVz+2F+UECk9FqJU0mS?=
 =?us-ascii?Q?fA+Hth/zhS4/3s28ydbacW8ViDNlOm4dZ7V84/Ly9pwj3uJkd0HW5OEdQJz9?=
 =?us-ascii?Q?W4aejTyyTMIhPA5zTe6Ppwv8wnxuAj9rzpaX3PZHbwTn/MtkPgBon5F/fFvC?=
 =?us-ascii?Q?BXPZuoxzmPEFZAiIXrnsquA8BdglJCLwxfdUtlXWY1oyDAk61LK9ywEAv12y?=
 =?us-ascii?Q?tRHEYQSUJWoeYnNFYC+jYiQPMwsQ1sozJqt2zbbpqa6VcrgZ9mR9EoDAURmM?=
 =?us-ascii?Q?6DFcwzIpnDz9GnqpUHmp/Hbihhgyf2aC17APeaW/o9mffPielAfQoASQoIlP?=
 =?us-ascii?Q?yhv4rXFD93MgzGazFfR3SqLtlYg00FO0MWtQ0jebwyaiTfr9oKGKQV/xciFo?=
 =?us-ascii?Q?XBjC+d7tb15kipAqiBuERXXSBn+G5bUewgidxV7+JLnA+44PYvd8vOVWed7o?=
 =?us-ascii?Q?8d1gcmB6N0GO3k0C32nsZdsE422s4AEjjM2nBeYnPFYV0JaGwBwyf2D8706D?=
 =?us-ascii?Q?7/F+T0M/5doRv8immjL5u0HmQ68+SQUczROnG/+k1aHUFdlVwK78PhlwDqC3?=
 =?us-ascii?Q?zoyLfr5m0XAt8CUhoW54YHYaIkZLQQFhUfdvgnyxh0rhvstNOTCvy92jY89B?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c917db7-12c4-48be-4c81-08dcab2b58f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 15:23:04.5089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWpAwf5r6S2T0WaBSjPS4w2fnvFf4eAfG5WCY592XQzxG4bEcH65LF26pavsxAZjBgfRNJPoDzZSgGHgNydg/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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

On Tue, Jul 23, 2024 at 08:14:54AM -0700, Matthew Brost wrote:
> Upon kill of exec queue ensure said exec queue is not running on the GPU
> for overall safety by waiting for kill to complete. This includes
> possibly waiting for a GT reset to complete.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Ignore this patch, idea is right but implementation is wrong. Need to
rethink this.

Matt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..147e9407ce9b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -152,7 +152,11 @@ struct xe_exec_queue {
>  struct xe_exec_queue_ops {
>  	/** @init: Initialize exec queue for submission backend */
>  	int (*init)(struct xe_exec_queue *q);
> -	/** @kill: Kill inflight submissions for backend */
> +	/**
> +	 * @kill: Kill inflight submissions for backend, wait synchronously for
> +	 * kill. For safety, should never be called while holding any locks as a
> +	 * device reset may be last resort for kill.
> +	 */
>  	void (*kill)(struct xe_exec_queue *q);
>  	/** @fini: Fini exec queue for submission backend */
>  	void (*fini)(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index da2ead86b9ae..df03fdb83dbd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1496,10 +1496,23 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	__suspend_fence_signal(q);
>  	xe_guc_exec_queue_trigger_cleanup(q);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_disable(q) ||
> +				 guc_read_stopped(guc), HZ * 5);
> +	if (!ret) {
> +		drm_warn(&xe->drm, "Schedule disable failed to respond upon kill");
> +		xe_gt_reset_async(q->gt);
> +	}
> +	xe_guc_submit_reset_wait(guc);
>  }
>  
>  static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
> -- 
> 2.34.1
> 
