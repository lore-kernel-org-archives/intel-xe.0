Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB39ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906289654;
	Tue, 10 Sep 2024 14:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN6V2SLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8433389654
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725980194; x=1757516194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HaJPUP/8UdQLf8VleoHnHqJFyE1qIdkZLLuQfKdvVwk=;
 b=XN6V2SLjCyd2hDIhyZL5Gcd5hgi07sXUg7Wn8xaRGuVct+E25E7+2HdC
 Ewwi50YXiFFPBcWz4B9O3cI+H5NVapSMpfA5YxbphXJ5YG73NukHPFONv
 p2ZJtMSdDOcaluL5Nt084X/v7DWmvCK0jt7ClYfrvCLxuPKVQGGyxPD3+
 Ur/0p7WJS+Z9A2tcR44fD+UDThfgVkjrD4hvYih3FgyfPP7o8ghVTGz5K
 ZIIaryGHmFS+QxDMhmMb3EifgQCK3qPPQC42Rx1mGDfSJ5BSXfetW7RI3
 I6oWt6ze8NJ5WPMD5LsUQRUu3rxOzNMuvilBYk0nA5+wawdyNvy3/fFzV g==;
X-CSE-ConnectionGUID: Xiy2/g3TSlWYNuypP6IheQ==
X-CSE-MsgGUID: e+TuKq3RQ9CnxdoiGuWziQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24890015"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24890015"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:56:33 -0700
X-CSE-ConnectionGUID: hJ9DzZp1QueanNk0AJkUWQ==
X-CSE-MsgGUID: x8KIuSXARX643v1rAnsfSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67068958"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 07:56:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:56:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:56:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfJyPC45btxWNE5hqciehm+Msrk+HJnKMn3tO4NuErxZlvP1SvB9/XwRAFnMVet37nX4AXET8aMnyv6Sj4y62OEPjKKLeJImkBeZY7AQzk/sBiY25VdTmUE6X2y6evIKKAXF3prcxQjGkau/iRqD7R/6gXnM5myGgQkAw5Y9DEa6ynU6CUAgCRZEQTC0wrkJyTX+86i37wn51W+/x3G8d/Omzr44MnSLSXU3/O48BfO9D7JeqotcDAOgytE34ARaaE8DzBfdIxH4JjCqJHQS1AvFJ3khofdXE4N/LnKh+BOpANSfkuOYTYVyNZu5s5iW7U9HmSicOaVj7DQ5lHXQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnmQ+ZsogWdVPztJZNqM9ceNnKj1sKfNRgcdkOWwNZM=;
 b=B/G+NwsMZm+3P+or65nz+2kgp7vHowOvtrtWSsO8yV2tPuFpPBMqDGGtgxtrfnJvd0ofj8JKdkLAXldJLKS1d+r7/CJfcL3EuRZNxkpKS1qayw2HaUdvGBbP6h15Xl0MYDOk7t8QMzkH1U6mPC6bAgfqKWjprfuHo29AqstvASrBwZzwGOkuAGu003zTUgT84R1/+aOgwv/eQDEuuTtR3E9FnQNe95UNVhBylSkdYzuJVaT6G3c1jmuqhNWm+YB+ja/mfGzJH7cYJqQHddm8CfuYvhvKkD3cV/iuPfqwM9rH4ge4TKzYwFHhIr1thNQxnW1LegComkEMBa3tyjh3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 14:56:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 14:56:29 +0000
Date: Tue, 10 Sep 2024 14:54:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuBdM3qnzcZM_uNK@intel.com>
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: cdec0379-2e2b-491d-4f09-08dcd1a8c04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UDIubP7K1ncWTk02rulvHrsWNxzDf4B5gFg7SU4RBJzHWAFiXhmi18HVDXWC?=
 =?us-ascii?Q?SQTqq4SdOMMDfum6j5imgRm7HmRuPw6GtG59ooMSe79PAbc4Fdn7mLhJflFW?=
 =?us-ascii?Q?VdtHuvkUtC9wfpQ2IfkaTEqJn1Un18sr0eG51T67SDeJYJFtfxlZRuSN/MAx?=
 =?us-ascii?Q?bzNrH+zSycJ7ZrWP8kEPqsr+ypLU6UtAyDi1vkvhNiNQhIh5oFx3Md5CJZPy?=
 =?us-ascii?Q?K7Y2Vpv0Df5pidYYkUFluDjQ4S3H0TRJ3uaKdxCzPxU1Dx9lvsZFlajCRbjG?=
 =?us-ascii?Q?DMaAn6U+//C0XiozZf3nG6I7wKurGPca9viyGzPBVR2de/NDbQBuCSXEsKno?=
 =?us-ascii?Q?bKIfM8UNrepKOAs2N2fFdv66WPIMudn+yqIMCMwMKCIEDKYR9kjPYS+cGGbF?=
 =?us-ascii?Q?0r878ydeqWIZqiUEILvmPuGJ9QykX1dtK0t6ALJEopPym70urGOOhBz0i5HU?=
 =?us-ascii?Q?VJgd8IPiC2Yd8ajzElzj0hTFU9ZKqRbKlBFJVHd72c962aIin+qdNNki+7xx?=
 =?us-ascii?Q?TMI00EUxp45EGbNY4OPe0lWkI0s7W6TKkganqWQb9yocJuFGwr2ELzjgEU6k?=
 =?us-ascii?Q?3jvN7ZBv8zPRU9PMeqqzwPizYVgssptTCULtCScabmzieH+Zamv358y1GWQO?=
 =?us-ascii?Q?+bhcUff+mm5ZPbrNbRKVF4HPfkjRqemkMVqK45ZipN40blzGBxZyrHMTz4JX?=
 =?us-ascii?Q?vGpQILfa3AKIIWu8Tf2PwulZWvDcgWxi+f3/ILnT2/8Uyb35aeCkqz6APEWf?=
 =?us-ascii?Q?kiHJbi2uChV3yppZtjbPGVeihNPnhmjwloz6hi/mXf+VsQv+YvXrfnPNIxLL?=
 =?us-ascii?Q?Pxpp50j6pAuVMwosXK6XB/G3zTuOZvd4wKSZ0zHfnR1Wn6Emy0iQftU1SXAc?=
 =?us-ascii?Q?OUyVmkLTf/bK7SWef5VL790PH3rL8uVjIY+/9ydApwhh14SGpvZ/e0EZQLof?=
 =?us-ascii?Q?Vc6rb9vx1/40l2VOBhl9l/YOs7vwtTyLXzZmDJthaX2wYMPM3nBVgQUHjiGy?=
 =?us-ascii?Q?O+2akTOGcdQP8QEN4ctSj270g8+D3YCcDDd3hbJT6TZM6N5uSihk/xDsE9Nw?=
 =?us-ascii?Q?gsilhGbYcAa0yFC/n7DQfOxB2ek9E5WfU8erfSYMNjn4uuPfrjjxFmN455SS?=
 =?us-ascii?Q?KvcwyfOLlhDuSMx46TEVnZ1VLoYiCiXIl0B7M3pkPLR4gIcBdAjVHd2nDqI0?=
 =?us-ascii?Q?2X2MiCZ6kQprlI+/IWAiNIwE/N4mkZodzgvaqqwlgpozO4oBqMQqKBTB34yV?=
 =?us-ascii?Q?CIV3PoCjP++AuhScMqQuZ24Ht3UnMFVFcSWicwRDCFA3QW6esSa8SmIHHhG+?=
 =?us-ascii?Q?0Ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?II2p2CMZn3HI4KUSELFSvM3mtQZk3xruaiYp6m9bojT1WysCIDATSdLSaOHx?=
 =?us-ascii?Q?nDcMigk4K56sSxcw6EqdjaMlEjD2YD6yH7bD8DLWxGpQw4kvd3mjF3NYmSF8?=
 =?us-ascii?Q?gYgBl+wrqbIP7nZukKMwnlHFGPcBTnWXEqBUNRk8cCWJEIif5kpscpEElreq?=
 =?us-ascii?Q?YYJHNxNpd+hv5mdo1sJJN1u8ESL2WUjilbd4CjeGmJpYGyeIHIc3x6Ad905s?=
 =?us-ascii?Q?BoZ/EKmj2zAUWyGnWeEaqGcBQZCJmLOiYerya+zyg0E0EGvbIGY8JBMaL1nq?=
 =?us-ascii?Q?zc4CvpCghnv0cHtAkTgPwI9IK9JRauAJbVuaJHxgpV/wZv2V5KcCUWTBe72G?=
 =?us-ascii?Q?cWoqBGdveOxLoIBm7dw8tfQw2qdfSP8IhsX9UmOy9uaQDuDR4fmVKbh96DU6?=
 =?us-ascii?Q?80IT9Cpyh+ocLuR7aqtaSjctYVHJNNwG2wcIi5+WrKyKcy08f0TDQLybENuE?=
 =?us-ascii?Q?IXuTAVEuCQtiHUUxUOoN0tY3f9Bmc5iKycB89pIRsFA7Q1nRAY+e2QKT86Ev?=
 =?us-ascii?Q?rFPIoViBF3uOVYx9m4fijxr+4nefsY3Qphx9A/kmc2CorHjqqN+UB1SkdHQC?=
 =?us-ascii?Q?bbau8RItOFuzjxBd5JH0i6n+pvUzCQ6wpU5kZ6DGP7DpRBTbgHnT/JcNI8jH?=
 =?us-ascii?Q?bN2ch9afpN/EO0/LFjZALXthtfHz1rce0n1VF+mCbpNDGqO2uObJzWqojUZr?=
 =?us-ascii?Q?uo9qbtOZ+8xlESWS472FA+QnaXNAwPHM+xiPIWB1v9rct4sgdsNv+4eiPomb?=
 =?us-ascii?Q?m334WiUvidOLgVBSSxZ/qhWqjec2GDX+i7EwL14Ybu1XTP33BFYe6hgZMWai?=
 =?us-ascii?Q?RI3dw1j330AuPhK0j+kBVqvhKfoIYBaGK1j7uxcB4NwDQpLpqSh/CsiiqUjy?=
 =?us-ascii?Q?Ly0H4w/6Z0B6oqd1OSsVNNHM0YMlRFqwDmIkF30XSIUjzjxqX7Bc1nGV/Ghz?=
 =?us-ascii?Q?jIKjGVxOU6vBRB5pJNHj7IAe9PDRcATwMI/1YKNq/p/e9NNIH3R7J8KThcsm?=
 =?us-ascii?Q?RMw1cxeH1XFfNULpFyNDEhTHpPPIrx/uZ8vZpcEkXzZCLbBGimH5pj5tvUaX?=
 =?us-ascii?Q?kQ4EaIc1BZQ/6SbOohh7ESHsOkNr69ccfPqopB3e5s0ZWyraIwHJa6juyo85?=
 =?us-ascii?Q?qorPXtYFyrhCkpPLMdsqYcOhfRKy2mKNo1xQdx3S8CHNXDAkaFD9sEHlB1Qy?=
 =?us-ascii?Q?1vb2Fytsoj1Aopo82UvSGl4TsLmuuxRw3EodrHUJfHS9VZcZgNceKWKDEY9v?=
 =?us-ascii?Q?cH8SOnLBOFC9FSrmvwTfFXjbiJpeR/9klqzskO4jwwxkUicU0rvfXjxlvE02?=
 =?us-ascii?Q?2tKqShvtLR6mUtLOt20d2WtnMGFhfIETpS3ygCEh+MM/YaI8K5VtO1oppkEL?=
 =?us-ascii?Q?QAVZ1bUuc6laeQEOYqEy+Arr8UaxpyY+N+pC5qTk0MXVX/c/0jgQ8JHXvUPu?=
 =?us-ascii?Q?NMc1fMQ/lyYaeA8mod4eLQjelQB4dAHu0G2J8SvLCejpwdyBHZglkYoh1VEp?=
 =?us-ascii?Q?PJeE5BPKRhhe3dBkPxsh5jlxIdnyhG9RCbnWFZ6Sm5UpnTngPltAy2t5i4FG?=
 =?us-ascii?Q?uGqzwh5CX1ahFeCDyD8MVkhmYSksywqV6knxx5JbTKYzSt7mrMs3ZExMDh1o?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdec0379-2e2b-491d-4f09-08dcd1a8c04f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:56:29.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eORjJ5rQ57YQiNTZeL58EtQQAeK+nW6y7vMzdZtHt8Rrv6xU6ihIMQs5+laCdgBdUSoCUYOwvs6/KVv84avKVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
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

On Tue, Sep 10, 2024 at 10:52:35AM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 10, 2024 at 07:58:37PM +0530, Riana Tauro wrote:
> > Remove local copy of str_up_down to fix name conflict.
> 
> what conflict?
> 
> I don't see any conflict caused by this. But well, nothing
> against this change itself.
> 

I don't see one either:
https://elixir.bootlin.com/linux/v6.11-rc7/A/ident/str_up_down

> perhaps s/to fix/to avoid/g in the commit message?!
> 

What about s/str_up_down/__str_up_down rather than remove the helper.

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > 
> > Fixes: 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
> >  drivers/gpu/drm/xe/xe_gt_idle.c    | 9 ++-------
> >  2 files changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index cbc43973ff7e..8f850b9e1947 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -14,8 +14,8 @@
> >  #include "xe_force_wake.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> > -#include "xe_gt_mcr.h"
> >  #include "xe_gt_idle.h"
> > +#include "xe_gt_mcr.h"
> >  #include "xe_gt_sriov_pf_debugfs.h"
> >  #include "xe_gt_sriov_vf_debugfs.h"
> >  #include "xe_gt_stats.h"
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > index 85a35ed153a3..a8ce8b484561 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > @@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
> >  	return gt_to_xe(gt);
> >  }
> >  
> > -static inline const char *str_up_down(bool v)

Also if this is kept, drop the inline as we don't use inline in *.c in Xe.

Matt

> > -{
> > -	return v ? "up" : "down";
> > -}
> > -
> >  static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
> >  {
> >  	switch (state) {
> > @@ -227,7 +222,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> >  			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> >  
> >  		drm_printf(p, "Render Power Gate Status: %s\n",
> > -			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> > +			  (pg_status & RENDER_AWAKE_STATUS) ? "up" : "down");
> >  	}
> >  
> >  	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> > @@ -241,7 +236,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> >  		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> >  			if (gt->info.engine_mask & media_slices[n].engines)
> >  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> > -					   str_up_down(pg_status & media_slices[n].status_bit));
> > +					  (pg_status & media_slices[n].status_bit) ? "up" : "down");
> >  	}
> >  	return 0;
> >  }
> > -- 
> > 2.40.0
> > 
