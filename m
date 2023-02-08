Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B66CC636CC
	for <intel-xe@archiver.kernel.org>; Wed,  8 Feb 2023 17:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888810E7F9;
	Wed,  8 Feb 2023 17:28:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB7010E7FE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Feb 2023 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675877278; x=1707413278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qUno5FgHTfp81lx//WaXA8OvryRcOfZUxOE5i0NxdoM=;
 b=Wwl8qPbBGxCnVdmQ/ZiCSAFZizmmtrIxSdeGDi4dXBkwCtyBqAzYLvZ8
 QUrh7rT8eluSLl9gbDH6wsuUaA0FaTJn9ndl5J/oSHAu8ypn+/m5fFYbh
 9Jk3sfZGVOcnMjGOa+cq90+obx3ttCO6dmBVkbwumafU3RlrOhNxY0TcH
 VV4SzSH2RC2d9QKASTLenGM2fFaGJi1JRGAC5oVqtWSbmN/k9xyMGZwHr
 Z3qUgZszqI2N89KnTtirr+5URzuY//NSOZzoLuzIef6X3qLQ5LVeD5I+O
 BlVO9tr5cnB9p3syp2ydYViL/Hq2qK+xRr7nx+YbhGGRDJrzdtuf1fC7k A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416088845"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="416088845"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 09:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="730960118"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="730960118"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2023 09:27:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 09:27:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 09:27:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 09:27:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 09:27:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXYtkHdV8WF8ndvZmIx8qA6YazgWkjOMLjaP66LfKe8BCgdwcdFKzcaKCCAPPqOhHUHjYT2K+mZVD9Tq+0TmDjnFmMudoC/7eniJdTQb4Tr1Cp1XhNPaNusMVTeirMANIb91/pJFwgZtEAe19xZdVSBqQ0rR8wxSOZBR68pHSZq72vPM3y6hTQUJ/fFFj3BVeoxn9IBdLvO+ZxaiHU4UGkl9nXjmJkYByc/3iUtBuNt7scNyQuX1ZUnAxyJdTwfBAedDIbitBhQ+FZbV10tBBrWckt3q/jQBOj6a12MRK/66h/Mr/F2tMinth92o4iiOmTLh38iu80RmiXtOXR2d8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5limkV4k2weLkmW1/s0TuHCqQtniaCRAj4rVdOgr7tI=;
 b=WZ9nReAOYxJKe66KPEAR9p4gc6a9i9GLNH5JuCNu5wIAZIqGypI7nMJdusAeG8T8O+AhZHNnrpEulOCp/yg96tBBepHVuB8f7KwuvJk7h5cPKlHwRby7XQIr1hha+MOWURauoZSwK3JDGzr2Ud2IRZEsJjc19rERTMnq/00cKmKS7Wqw/HQjH5t+VDWJS/3ylshkH9/SgyPCWA+KMIAx8JbQ5TsbZBzxIjk+9I6L+S9XthXHWNMVNs7QhdiXNe8EMW/9hJoJXTMHgLOFJ4eI6ZM9XgBuNALTYxWkMbVypwwZwj3Psutp5Iw7oujf9XrXQXS7++s0MgunOGyx+D9R5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 17:27:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6064.031; Wed, 8 Feb 2023
 17:27:06 +0000
Date: Wed, 8 Feb 2023 12:27:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <Y+PbZbxvrCV0I0hv@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <Y+GBpdMmLUNZ52Ss@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y+GBpdMmLUNZ52Ss@nvishwa1-DESK>
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 10397a92-df64-4102-6eb0-08db09f9b2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1nwbKMiooDfJc6xtn8IBgt/R/4gFVsi9k9K/X5yA+XkJJIt5Thw4Gu01XXejssdYABJHXkpztnynx2W/DzNbqV0Dmsm2STzufG5tU3TBphq15EfcUWEvD4ApmgW0FXOaXeY0VSF+D3dtG930IdfpoDJP11ZlllBwQ1ivOdTGR4yBgq/yCJ21+HZTGr1jv4UxolrVExXjv00S5nfbDgYb8UGLDXXGSByoeDCslvgpiYW46StwmECkVcq5q0SDMN3RcAd1TEaRhem3qGNfn1cVAQW0/+i3YzDXA8loSWeFVj0MRSOtcQtODNohNDD0/YhfI4yAs6x8Fr/ktaSRGYNdqXoHghu+7MSwf+wsqrusKdW/QVOBqehn2l8QxPX/TQP1mzFigDmzAUozxOaCtkvBISU7z1wM8tHQmbTR+zBtv1r+0iroQ+KqU13JbZIFM33xQoozAkPJkjxJGSrqgGjhD6mKku1iRpPcprVDoS7uAship73W2EeRcIgRCMcTW6tz3B3rxxgRoBvTKBOA27L9gkSxIou6qtFuQc4wHmZtMYv6as/J2GqJa+OLKdTb1Av+MDKTFjZoP5rIeYSd3P72jQVfbJ/8YHdGS/8ZaCds6seWq5KUff9SQCQasae8Q8y54SkpfMI+sh1OVratYOWeCgigdtxXCY6nrCK5+Z+1v0WIt4XbhASeLgJJQJ9cwMP+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199018)(6666004)(83380400001)(86362001)(2616005)(66946007)(4326008)(6486002)(8676002)(41300700001)(44832011)(66556008)(66476007)(478600001)(36756003)(37006003)(2906002)(316002)(38100700002)(6862004)(8936002)(26005)(6512007)(186003)(6636002)(6506007)(82960400001)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LvZebgVir7XD0Sh/nZ5obMp2Rgu+SevC/wbxsosMd+axJXc8qUU474Ogn8qR?=
 =?us-ascii?Q?v7Zs7K8BaE4sq7GGGx2tudXvyXrFpUDOzUqXP9WZWJPiAHWZEa1fGdKjLg0H?=
 =?us-ascii?Q?QgsohUHfLc2zJCFGkbvbK92Fb+MvRtBZ7qUKgbNDx5prPA+rlhaUe0U/tJm2?=
 =?us-ascii?Q?xF+hBBTG3oXOPIWBzQ2sBYhu95VqGDBnP9qKyqmfVyPsN8ZhYyoAsemUWngI?=
 =?us-ascii?Q?CZnaIc28/wlEPhBPn/kMFBDCGQxefIrath30Zz+16LOs+Ov0eVA9INR50DEe?=
 =?us-ascii?Q?rKDIgOUcU0WBSRMWXpM/N/s74BbIgzOjA3wCWHbYQR+5RS2mmfrDzOQLuHKh?=
 =?us-ascii?Q?AHWSM545TOlPQWM5W9I+MQgdvUJHRuKmIgPSa333vvDUlXvUQLtUF2GGHzpd?=
 =?us-ascii?Q?g7dLmINdQE3+QDmPy1E2YlfkLabanRyK5CSORkUr7Ow13rA2og0aM9gclEWh?=
 =?us-ascii?Q?k3ZkPoDYZHaFuUPfbakmTUwjPJbNPnCmZryhwulcv7sVCX1dT36NUq4I8Nuu?=
 =?us-ascii?Q?3xvKBKu5eG9wrLmVxAgoSEubc9HZgWrywAEfOZSSqYLzA7TGSapzhx5aI6YY?=
 =?us-ascii?Q?4rLdQXy1m73C8AQy3/pelXKw6QFcw4KLbIIBqqfQt90VE0ZNoh6DPludzPaZ?=
 =?us-ascii?Q?1wrZkO4rpxpIrLliCm2VSWxUw0npQlO0h02scpfgGV6xURKVKHf49l+2Elbj?=
 =?us-ascii?Q?Ew4d7qGLKCO4OfrZRjPzBxm6d0UQFqj8Yg8u+6iyh9SXTdgxIPGVAwMkKUkN?=
 =?us-ascii?Q?s0fnVQPni3w7SYQv08mj3y/IrfMHtmp+AEA4L1jY85qeeY/08EyvsZhjQnZ1?=
 =?us-ascii?Q?sxVYFJmTfrd5LV7eS147aRSAnxEMOUDyoAipBWcor2onm5Q+hMxraWREB1Mu?=
 =?us-ascii?Q?qx0iAPFaKbD8rvJRbwFRoA5W58TTvBsYu1bnbuAsxlVlI/XBjePUEy9tLp1Z?=
 =?us-ascii?Q?fML+uHNeA41aEIgGI+qTkUm6k80zw9LS7C4tGFE+0cDuhQl4rLdfkHbBcNYJ?=
 =?us-ascii?Q?TCTsEpJDrGqQcCPLM2ipKW+3hKFhPEh6wZWM9M1NjBJ8wZJVfOrXqaLmR2bl?=
 =?us-ascii?Q?bj0vs5NsgTJtsCZQWUITIEoYbnw32VqRaYPmLcxsoo/Y17RImGvi6ZkIfHwf?=
 =?us-ascii?Q?AoLvTPVL97wg6tptffhq7m1sNpHn47ATuo3FteSTof5ZGB4jKIDcz3HTCoLb?=
 =?us-ascii?Q?ZrygTAYscghC1HhIbSmZ+IDl2Lo7FHZweHl24RDNbfDqvr03VXAqZclfX6zF?=
 =?us-ascii?Q?xOryGEkQ6ju75gY4fsOU25ZCO0wp2YP6eonv3HZ8fNf6dMf4qPborYXwq/q8?=
 =?us-ascii?Q?Ttj8/W1Ulklcihsf3GoATXMlvJ52YGDaiXzVK6aGHTLdaqtyI/2qN4lVSSOV?=
 =?us-ascii?Q?yHFlnj4GzA2vBYxdpU6bpylbmBSstEtkTDhtRJOLvz3j7IbZkNy6OKGLzF4A?=
 =?us-ascii?Q?uCTriDoB1SKhlULDm0d2fZgktDQ7bpbVGM6RtKrIMS6rxkS7b47cOcAjUQz7?=
 =?us-ascii?Q?fdFFFKdsPD30iEEuh9065VDcIMg4P5RvT19IscPDw6QULGWjAYHYPb1Enkhj?=
 =?us-ascii?Q?jUMN6Xpd9zOHvm7lowZXOoiP7D9gpG8Gq8ydamle9cbX+NyKr+KQfKNKmy7I?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10397a92-df64-4102-6eb0-08db09f9b2ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 17:27:06.0036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTv7CegGTbQL4pVSyRcjo0V3A6NDR/spvFeZxd6us0yv/3Z1RtgHIshSy4s8UEZ0f9Xe2ybI6YWo0xWrGXh/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/22] TLB Invalidation
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 02:39:33PM -0800, Niranjana Vishwanathapura wrote:
> On Fri, Feb 03, 2023 at 03:23:47PM -0500, Rodrigo Vivi wrote:
> > Let's just confirm the reviews on this patch and get them
> > merged to drm-xe-next.
> > 
> > Matthew Brost (22):
> >  drm/xe: Don't process TLB invalidation done in CT fast-path
> >  drm/xe: Break of TLB invalidation into its own file
> >  drm/xe: Move TLB invalidation variable to own sub-structure in GT
> >  drm/xe: Add TLB invalidation fence
> >  drm/xe: Invalidate TLB after unbind is complete
> >  drm/xe: Kernel doc GT TLB invalidations
> >  drm/xe: Add TLB invalidation fence ftrace
> >  drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
> >  drm/xe: Add TDR for invalidation fence timeout cleanup
> >  drm/xe: Only set VM->asid for platforms that support a ASID
> >  drm/xe: Delete debugfs entry to issue TLB invalidation
> >  drm/xe: Add has_range_tlb_invalidation device attribute
> >  drm/xe: Add range based TLB invalidations
> >  drm/xe: Propagate error from bind operations to async fence
> >  drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
> >  drm/xe: Coalesce GGTT invalidations
> >  drm/xe: Lock GGTT on when restoring kernel BOs
> >  drm/xe: Propagate VM unbind error to invalidation fence
> >  drm/xe: Signal invalidation fence immediately if CT send fails
> >  drm/xe: Add has_asid to device info
> >  drm/xe: Add TLB invalidation fence after rebinds issued from execs
> >  drm/xe: Drop TLB invalidation from ring operations
> > 
> 
> Looks good to me.
> Some minor comments on patch ordering.
> Patch #8 can be merged with #10

did you mean squashed together?
but why 8 and 10? 8 is a build fix, so I'd assume the issue
happened in a previous patch, not in patch 10.

08 - drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
10 - drm/xe: Only set VM->asid for platforms that support a ASID

> Patch #10 can be simplified if we move #20 before patch #10

indeed, but at this point I prefer to not touch them...

> Patch #17 should probably put ahead of #16

maybe a squash? but I will probably just leave it as is...

> 
> In any case,
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Thanks you so much

> 
> 
> > drivers/gpu/drm/xe/Makefile                   |   1 +
> > drivers/gpu/drm/xe/xe_bo_evict.c              |   5 +-
> > drivers/gpu/drm/xe/xe_device.c                |  14 +
> > drivers/gpu/drm/xe/xe_device_types.h          |   4 +
> > drivers/gpu/drm/xe/xe_ggtt.c                  |  23 +-
> > drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
> > drivers/gpu/drm/xe/xe_gt.c                    |  19 +
> > drivers/gpu/drm/xe/xe_gt.h                    |   1 +
> > drivers/gpu/drm/xe/xe_gt_debugfs.c            |  21 --
> > drivers/gpu/drm/xe/xe_gt_pagefault.c          | 104 +-----
> > drivers/gpu/drm/xe/xe_gt_pagefault.h          |   3 -
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 342 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 ++
> > .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  28 ++
> > drivers/gpu/drm/xe/xe_gt_types.h              |  41 ++-
> > drivers/gpu/drm/xe/xe_guc.c                   |   2 +
> > drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
> > drivers/gpu/drm/xe/xe_guc_types.h             |   2 +
> > drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
> > drivers/gpu/drm/xe/xe_pci.c                   |   7 +
> > drivers/gpu/drm/xe/xe_pt.c                    | 130 +++++++
> > drivers/gpu/drm/xe/xe_ring_ops.c              |  40 +-
> > drivers/gpu/drm/xe/xe_trace.h                 |  55 +++
> > drivers/gpu/drm/xe/xe_uc.c                    |   9 +-
> > drivers/gpu/drm/xe/xe_uc.h                    |   1 +
> > drivers/gpu/drm/xe/xe_vm.c                    |  42 ++-
> > 26 files changed, 736 insertions(+), 200 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> > 
> > -- 
> > 2.39.1
> > 
