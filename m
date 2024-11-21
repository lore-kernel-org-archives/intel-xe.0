Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C84E65D00
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 23:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04AA10E422;
	Thu, 21 Nov 2024 23:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9KNlZVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BC610E422
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 23:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732232636; x=1763768636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2/jyZtYTbwRzgPlD/L1EJQZy/bqKtad36Z7rHoqutrk=;
 b=k9KNlZViIjkrtTUarqPV4U9eH2/dcsjXfg7BiRVjxx0YQ9F0wbig+7Vl
 ItYblPkhv7oe3AveFIKw2Dr7NHf2T7Wg9zcMfRy2fR8ACHfOCVBMiU1/f
 glkaTUrlXxYjW6uzRkxfIrd9QtbwZmoCoFsV5jzcjeCHHQy96tSX6OZHx
 z1sPMkR1NSUyEzEGnHrPfizVp1a0bvyJO7zdP0znmBeEOgYcymfKfBYG8
 ODVoyFTWJDAWv//QRQub50F7UMHwxbzrmAcvjs8J921qv0DgXLLMoDlO3
 HAGEuMR/ovmJweZub3Ea5uE0JICSJXn5rqSmKYZBcY4gPqU0WWOcGL9tQ A==;
X-CSE-ConnectionGUID: wzFrc8gRSG+v0HZCrJX4/Q==
X-CSE-MsgGUID: yysKQWjzScagFYciiG2gog==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49793536"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="49793536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 15:43:55 -0800
X-CSE-ConnectionGUID: WeKExlTCQdSUkJQVtWyv6A==
X-CSE-MsgGUID: 5oyGzZ6OTMOeTDg2p0jrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="94849760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 15:43:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 15:43:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 15:43:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 15:43:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEmfNEgUQazW2qEm8ufjlv0wlys2y0b38hNfxVeWf9wEz6iiKh3pviHP0m+L3D6ML3fp4dGLhZ3jNJk/rWogM/7ra0DM+JAQtov3oFqFViQC/zJg1+6Lum09LGAR9HruLtH/adhbGpg0Xb00RRUzetlEIfQfvOCk2/k/YRZemeYoc+UdApiOdGItMekZ/7jGlNXf97ca2NJIxWx6QfzM6BcW7MgVqmLKrYJrOrvExfbqwmMlzDWo546AFQ8/LGDuOndgpkEYZ1P8kbTi8VGAKreq0M271KbGAFWGDkJjoesU1Dfq1rD9hTPbrNkURFqEYJ4kgBo0jBew0HcADUz/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoFLJL7WN6V9FB5Al/oOxTXNvi8ZjUjs4fOJK6rJPEE=;
 b=B5hXswLXk4GyySJhW5XdvQfm0XYZQ9ZTSZ0fLrB0UsuFqnPopqDJ2LBk6ok0uCEC2lUR+blaNZg01AtCTwhrptR3zSA/t5HKrVToCA/7ha+pLyvVgK03afBQm4oiMk70+iR4KYUDcgZGhOySGBxX3bIjNmFF0WrLk5M7nGZnpFRcmyuD0wOxvYFYh6zlQAWnKhj9RWR4b77CCgRybp0KGWK9v/AKCw8fIozIUGW7c10h/tFkI7lB7dJjirNVSs+wwGCxC/qrntmg8uOz4ahEGO3D62sv88kowU7+1cEi2T97l4hBkG3Qyt11z6oRi8OFYXPJsnTApNjEkUSLJlOC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 23:43:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 23:43:52 +0000
Date: Thu, 21 Nov 2024 15:44:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Add mutex locking to devcoredump
Message-ID: <Zz/F29WgIzFmAH3V@lstrano-desk.jf.intel.com>
References: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
 <20241121225542.1336796-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241121225542.1336796-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ae773a-7667-4fee-b416-08dd0a865aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S7E5jIS1nyssaYl39w7/XVDW7giTKxOwrR8fxnS50fWxKpDS3HHFUIO7S5SQ?=
 =?us-ascii?Q?5WBUenjlsWSFV6ro3kk8mIvs/ZhLkM5dM25HS7ZkubEyNfIuRAFJ89vSkv04?=
 =?us-ascii?Q?FS2wU7WtgW+tnfQRdiiC6I+8WD1nRjhsy+gMDxXxRB6i2tiVvBGMINPUsuvy?=
 =?us-ascii?Q?B+IAEnIRhzWkZLd7M9KylyMK505uWZhOxO8a2KgvIsp6DIZXetoyPu4ETVMP?=
 =?us-ascii?Q?+SriQYjOCHe+VdNho+4cyD+12l8D3wyXEv/1St2Ayy7dlf1EfcpafDBxHBoy?=
 =?us-ascii?Q?uuNw/0F1zUETpLd0FUAdXBrftSKwxwpvfqVQE4fl/4+iU4Y6K3zZesg/gYAv?=
 =?us-ascii?Q?XAwc1Ly9/beJfNjhDT2ECIvDftBBovg8v64hl1HC9G0nqTjvBKLG+VFR2DSS?=
 =?us-ascii?Q?003E91DsrmYFE8S3899YA8l94NwSsZA50mOdmZoQg1dp4UHxefqb5iV1VO+1?=
 =?us-ascii?Q?tkSvo94AwE3Za8AOU2Ifby7mhVt9UBSVOraf7FVdGdxy5cpRWXTUh4CkGgAI?=
 =?us-ascii?Q?OxMXeHrueN/RD/+G3q/IA4LE9sOTL2dWnDspxvV9MVgMl7HnTBO0RITIcRRP?=
 =?us-ascii?Q?dmOrMrr+rajnkksZJalCTMOuz6EXrDhPLZznCzKWF2kejV9VA0U05bjvxR77?=
 =?us-ascii?Q?BzJ5UvHiI/GGSsJo2H69ARnPuOdM4owTqT7WfSj7blmlN1N7MhlOclEQfM0p?=
 =?us-ascii?Q?tv0xUFfscg5Bs2qqPEySpcoUztQXhffUcmgijNe22i2zrCdTCH87uW6dB6I7?=
 =?us-ascii?Q?1wSnT8eoteEBYYVLTWVsxIb1zax6YTOxYNhrl3Gk4yezy2SaQcYdxdtxNY8u?=
 =?us-ascii?Q?OqkvE8uC24dfdhUTeCf/7nvkn3rSV+2GY9i1tf7gySnZpE0+5BNobIPtvxUj?=
 =?us-ascii?Q?kWvZm+d4YWboH5tAXhqJy9boRukYSB8AUaG2ZD0h1/TfCGB0Biksn+SeomI2?=
 =?us-ascii?Q?OoxV6PRBwth/tDCXFwjA8q6StN2bPSfsahSC+Ij+csqkyQwCdUQiciA+DhKD?=
 =?us-ascii?Q?eRxuynHqieEY+2SJ9aMDpITbwoY9G7IbjwthVos70/fCFMBZ1ttSSNaOCJE0?=
 =?us-ascii?Q?RO6pvcZR7v4m7hNac0DEtyggNblnQLWWrOJn903bVm/KCj42UGw4uxAqzg8W?=
 =?us-ascii?Q?AG6MyMr3d526YRgHzrM/f7iJdeV9LiHe2vFLHtba/9CpCj8O3lji8vMTmKvW?=
 =?us-ascii?Q?R2xyEcPtt+71IdtHffFRIXfi/3ci1ttOcEuiMGX2AuK/1QCo6yk7G15fanob?=
 =?us-ascii?Q?Sj1DBZBG067o8GCFqfPBrxGLBKMYcSevSQIdrSS2Amcwq3eBtu8IzFB0tqCN?=
 =?us-ascii?Q?BSJDSTKoyofuHtkLmwyjc12I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOkuKpdPzkP7ZvTUShDLIBrseUDxm0pIBilroaMU1k8Zyqf4sVjW5p/GYk+k?=
 =?us-ascii?Q?k3Ny5RiceN6AJiKYYndedlRmoI7DX8EDuM3vm+zfu/yMVWITmrH3S94s9g//?=
 =?us-ascii?Q?QZpArRQX/v8OtGs4Yps9CoxBWaSzC3ULCjXZy4HnKFdO8Y07bLJ8g7i/q31+?=
 =?us-ascii?Q?xu9RCvamOspISJrZjJz5zVS6Bl4IUCwlcgVzbtJkjtYIm4KhEe5q8TMQzq7O?=
 =?us-ascii?Q?PUg0Y1dodovll7SX3W9F7LGgtnFN6hNvmPeU8O/HAJbX3x6R9oLc9ra/j9/5?=
 =?us-ascii?Q?1CcdG1qxIXhqG10gaKKtCeLelFe1xQltsq05k2nIJwlWIMm0QgD07meCGD9Q?=
 =?us-ascii?Q?T1QekG2PeWPRDYvI58f/fePpt0FXQ+xzUE9mn+Wt4YNk0l/rxD0NJvABdnaN?=
 =?us-ascii?Q?0F5UkJ597PrQhNq3GvNMogBIhXpHM/aUWG1ctMq2lw9IF0fzqxYAXi83++pR?=
 =?us-ascii?Q?dQij4Th+E57zcmP6R6wCFryQ0XT+lNzkKojMJTiC5GXU6ulUpQhRM7NL/p8B?=
 =?us-ascii?Q?8//+Dr8mQ7ZkREWnLVxPke2IJIf9bDxg+N3+YM+NDzGf6FPvFENjUncyX7BE?=
 =?us-ascii?Q?MoYfCjwq13O0mdtrcbW9xYhXuUjOo6LX/HioNokXGExEMLYc2fTwWbu6VLO7?=
 =?us-ascii?Q?l6Mc4aKve/XPHuQRtXkvhZr0qwtl+/lfCykedo+efL68TRwfbKnOwM/keK5C?=
 =?us-ascii?Q?hCZlFzdUhT0jJ5TdVGD67jqomgGcxs5GKCDDSpDvJcGkTXHjdfs/mkTQRXre?=
 =?us-ascii?Q?6MromHFEw8d5zQdNhtT/6ZEM2g2llx3Gg6iaypAB0ibfgm5yrJJDuwLWXTfs?=
 =?us-ascii?Q?1wqtiNjiVvFIRI8/loRZQ7RHOva7ybS/ghVSv+n3fe8jonSgfnYClM4JEDyb?=
 =?us-ascii?Q?ZP7odbno4nucsDQWPdOvtx9L+VzKnkGp+oBc6gLBCDbMZzzm0NBNuMhJF59W?=
 =?us-ascii?Q?k//PmyvKgWiNMW4i9urOYSW1GCd9E4rAXTe8v8VdWoEU8X94ygAzgzWI3vqa?=
 =?us-ascii?Q?BsQM5B9zS9kEN38CoSFMr7xT5Za7iXNNfaY5O+0CIhCVFEUG7hKLf9LeA6nG?=
 =?us-ascii?Q?fyjz/7CIQk9IBkhyoMhdjXwbyNF4AUQNkYrnxamFUznpDvXY79/0VXeZ+AN+?=
 =?us-ascii?Q?Hvu90hPWWDz74N8p/41v4Y2yPXVuA7t+BbI8i/iPn8oMtIj6qrUE6IPysdgv?=
 =?us-ascii?Q?MXdWNkX2ctRMrOAqojozyhy1bFU7eFrgpnnPy6OSSi/KuvIgAREprDMiN20+?=
 =?us-ascii?Q?SPQRbvT5X9wfWuoKQbJ/dLnqvjQS3BTcuIjgtujh1Z4l9c9ap6INdmaWSWF7?=
 =?us-ascii?Q?OgcENd04DGhKZ1mNU9fgQ1e5ApZ/ioQofrFs0Z3spZZnh92k185UsblBlB72?=
 =?us-ascii?Q?GKYvi7Mc02xxqpsZcLEAaiJKcxJok6ghXU+3YVsaStQRVmUSZ2+yXkpNUkTZ?=
 =?us-ascii?Q?UMGwa0q/26CXdnmgRX2GlH15VHjoXl3cLmbY2DLaQIga9Q0ZnLuyCAYjMTbC?=
 =?us-ascii?Q?pv/bJNxed1oF94a0s8LfbQSwvUwurkbbmwiJldFY/VPuwM+10HjXA8NL8tNc?=
 =?us-ascii?Q?Z4ElspvZxUmQ2OGya4lxeCSuDp/C++BYtikvOKJ5pu57XI+INJX2rMkQzyf9?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ae773a-7667-4fee-b416-08dd0a865aa2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 23:43:52.1272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6pWl+wu2RGarPpwMzxW7QDyirKt7j0AunVTEoTQcDV4mlKd3/rep7imlvgJR8CVpkDwZ3syKt6mDDDZoPoG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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

On Thu, Nov 21, 2024 at 02:55:42PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There are now multiple places that can trigger a coredump. Some of
> which can happen in parallel. There is already a check against
> capturing multiple dumps sequentially, but without locking it doesn't
> guarantee to work against concurrent dumps. And if two dumps do happen
> in parallel, they can end up doing Bad Things such as one call stack
> freeing the data the other call stack is still processing. Which leads
> to a crashed kernel.
> 
> Further, it is possible for the DRM timeout to expire and trigger a
> free of the capture while a user is still reading that capture out
> through sysfs. Again leading to dodgy pointer problems.
> 
> So, add a mutext lock around the capture, read and free functions to
> prevent inteference.
> 
> v2: Swap tiny scope spin_lock for larger scope mutex and fix
> kernel-doc comment (review feedback from Matthe Brost)
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++-
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index dd48745a8a46..0621754ddfd2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -202,21 +202,29 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	if (!coredump)
>  		return -ENODEV;
>  
> +	mutex_lock(&coredump->lock);
> +

I'll just explain my reclaim comment in the prior rev here.

'coredump->lock' is the path of reclaim as it can be called from the TDR
which signals dma-fences. This is why most of the devcoredump core uses
GFP_ATOMIC to capture smaller state which could lost quickly. We also
have worker, ss->work, which opportunisticly captures larger VM state /w
GFP_KERNEL. The worker is not in the path reclaim. Thus you cannot flush
the worker under 'coredump->lock' without getting potentail deadlocks.
With proper annotations lockdep complain.

e.g.

We should do this on driver load:

fs_reclaim_acquire();
might_lock();
fs_reclaim_recalim();

Our upper layers should also but may have gaps. Reguardless, priming
lockdep is a good practice and self-documenting.

>  	ss = &coredump->snapshot;
>  
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  

So this is where the mutex should be locked.

> -	if (!ss->read.buffer)
> +	if (!ss->read.buffer) {
> +		mutex_unlock(&coredump->lock);
>  		return -ENODEV;
> +	}
>  
> -	if (offset >= ss->read.size)
> +	if (offset >= ss->read.size) {
> +		mutex_unlock(&coredump->lock);
>  		return 0;
> +	}
>  
>  	byte_copied = count < ss->read.size - offset ? count :
>  		ss->read.size - offset;
>  	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>  
> +	mutex_unlock(&coredump->lock);
> +
>  	return byte_copied;
>  }
>  
> @@ -228,6 +236,8 @@ static void xe_devcoredump_free(void *data)
>  	if (!data || !coredump_to_xe(coredump))
>  		return;
>  
> +	mutex_lock(&coredump->lock);
> +
>  	cancel_work_sync(&coredump->snapshot.work);
>  

Likewise, lock the mutex here.

Matt

>  	xe_devcoredump_snapshot_free(&coredump->snapshot);
> @@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
>  	coredump->captured = false;
>  	drm_info(&coredump_to_xe(coredump)->drm,
>  		 "Xe device coredump has been deleted.\n");
> +
> +	mutex_unlock(&coredump->lock);
>  }
>  
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>  	struct xe_devcoredump *coredump = &xe->devcoredump;
>  	va_list varg;
>  
> +	mutex_lock(&coredump->lock);
> +
>  	if (coredump->captured) {
>  		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> +		mutex_unlock(&coredump->lock);
>  		return;
>  	}
>  
> @@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>  	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>  			      xe_devcoredump_read, xe_devcoredump_free,
>  			      XE_COREDUMP_TIMEOUT_JIFFIES);
> +	mutex_unlock(&coredump->lock);
>  }
>  
>  static void xe_driver_devcoredump_fini(void *arg)
> @@ -343,6 +359,12 @@ static void xe_driver_devcoredump_fini(void *arg)
>  
>  int xe_devcoredump_init(struct xe_device *xe)
>  {
> +	int err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
> +	if (err)
> +		return err;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e6234e887102..1a1d16a96b2d 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
>   * for reading the information.
>   */
>  struct xe_devcoredump {
> -	/** @captured: The snapshot of the first hang has already been taken. */
> +	/** @lock: protects access to entire structure */
> +	struct mutex lock;
> +	/** @captured: The snapshot of the first hang has already been taken */
>  	bool captured;
>  	/** @snapshot: Snapshot is captured at time of the first crash */
>  	struct xe_devcoredump_snapshot snapshot;
> -- 
> 2.47.0
> 
