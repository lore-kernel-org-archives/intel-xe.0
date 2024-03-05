Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC05FC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C36C10E4BC;
	Tue,  5 Mar 2024 17:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFHqUQ6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E138210E4BC
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709658427; x=1741194427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5DjKOJ1KxNvBTurRRQHSUfNtTHbbfA+mucRJXhubz6g=;
 b=oFHqUQ6IQv3OiLv7rdXkyO8Y5ZAFDJntyvOuq7oS6B6AO3k+MIVbR4z2
 Vo69+x/9LUXnPz23abUOjpiwLT/CX9E5wWyZaDrNaYqIo5bn/1HODdWGt
 ZVoafG9tYgaY1IovhKnp8heWBD9gghVeIr4QTkCHVls+x9RYURCEZZe6q
 1BEdvRZfPI/ziB0YG4QOIN8ulMen6uTpX5JttACKLIC2q6HUWp/3Y5c4f
 30vln0SmMKQKgIkL5yy2YTorTV3r1GxoNcTmbyUafL+ppNbvHAPaysz7Y
 vHny+apc8X4dnkA82yzLxzAhzjWpGUqPOCSYatqv8aqJwJ6QdDoKX64TA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7169520"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7169520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14138573"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 09:06:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:06:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:06:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 09:06:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 09:06:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oROZHh1rD2vAHUOXFgM4dlzuxkS2kcnDO/XHUjRcg++/soWQlHaARTmo81WqEHDuUSIjKMomhlis9TAtfpxXAKpIXZ+ELStGInrcNLXwntXmiJ3MeUaiJqFJyScmR52SBV2u4Mvwn9CkrG9fsj7PsbkamvfacxBoXn4GrIeyfFmLH3F1eiRHEoGUICCQ39KHG7VyQW8e7vfmWcv96J6BKlZhDTN0VfiY52Yh/LGsSzEyavf3nL+fRhMb4DwEmiUHPkQkJDTGh8w/yU8XjGxQSEftI32BsEElI4ZzTY7oZcIg8Ft0pAISzTv831hZD/bV+4CbTpHnCelBRel8b+Ec8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzVn/OEY9QQklPfFvjKV6VYP+irS3Tn3irxwemfCOEg=;
 b=LB9zBmxkecNQZRqi//MPcwZAlYF3GSqgup5n8V1dhJbq9XTkOCqJETau9mI8HRmsl3yjbO2wwnmRik2TnWZNyxNzM3X1JUaavWPK2PK5S7B4IwOhLbcBN5mb70SQZKQ8FUbw3ej7koWfq4HdwtvyAM88Sz60bvYvio5c5n2D9zrql72+d3LqTbJjC8hoLFGMYwnvX/Jy1kIhe0jM1qqJsUGI8E8fuuJU6fs+OWO6Wu4/J1PeE1eJEFLna8ggQ4MrZ9scP9xXezOLwsPfGz0zj9sK2snkWa3/sIsf1jytl1JQtFwpOBmNToPiXShSRejs/hmitCTjMAj+3n67y+bb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 17:06:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 17:06:37 +0000
Date: Tue, 5 Mar 2024 17:05:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
Message-ID: <ZedQ4LTQh/myRnoJ@DUT025-TGLU.fm.intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-5-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240305131250.5330-5-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4759a97b-dfaa-417e-3c33-08dc3d369e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vhLxQDSLlUOAx8GADMdmhAkCUNf6pmTD8kUPFjPx1tiFDs0Btz1mXhgjJJmk1Q7qggXreyOyCQESti1IOdUpee5DciFoa4bxBPf+SbFM7WedTctotXjudL+9q9aB7GDdtjsi/ZQt2/I0Ek4Pkc8Fg2jcItx4OXfHtYmjx8MQ1nkHfbzevGieabJdGjeel8wT0qeK0s4wOWNOETUekOEQugfIYtlEhGzECSE8PMC/eKV2G/2MpIKF7DJctxeYe97rWonjf/xGFnX2wGRCzlrDAhMC+YwcgV1JSBMpBrxqjUJExCGulonovMCUk1LqBRB1qOXUJ31KrMcovMpa+C/uFmMNWkP7pNx2PGts1LSMJrCNznLZLU+I9YAnlKJaGfXKCRDMtgiVuOCEXMuzQjTjMgug64NPWS1qgUgyVlSVKEbrogr6wOuikhEFGZSr3lMaiAd+lC0Ijrdfi51UXuPIkb/m3ouDfvJMrNY13XoktJ8tLBVO1dGYBaKVMAEOT5rDEsciawFS3/N74cfxGhFNHuJ2hhHRjSygtNcodDvT6MrmFv59MHjRNimsYg+W7o5gDxiCBxtt4ODiZCe671+cQz6QI3wtQjLJco4++UCVGjv2ETRjWHxC1ZRNoIVtROz5aTHjJquz3ML2aJ7lp7aZC2xmc9mm994LDgM9MxIQiFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zCXjlc0zq96pwR9aEz8CsyQFHUImtJUBNvvRJD2zWFiF/mJErahbyXAuF7y+?=
 =?us-ascii?Q?V3KSaOcbytcddEcQ7jv2oM5NPJ0MhbjohH4UW3QSuK70c9HJ8xAqeeo5ARze?=
 =?us-ascii?Q?qMO4U0VbLKXlZ910OI2McIfPPQE6ZU6qJjbStwUyMGXYOdQqsfcBLq4eNNqc?=
 =?us-ascii?Q?clNqxI/Q1APPkOvf6PXAjc2nCLF2jNEysUvzuMdqpp+Huoz3ILocHbiImKXl?=
 =?us-ascii?Q?9iaAsDHM9cLBU1T6hHtyki1rVcrRGBi3QvQ5+Y+hipB7mSCctGBAVD1YJrXQ?=
 =?us-ascii?Q?MEN2BZ/fksjT26OSD0dNBFWnHt3YCrpwVwM0tC0zCcN3uVePI29i84/cf65S?=
 =?us-ascii?Q?A11Vf9k4aOD8jAkq5uOVScLZdJYp0sBXtF2EBBO6HSfz1uQgL4FLEXKoOyxq?=
 =?us-ascii?Q?zk/IifAqy3WWg4gnUVVp7qWu1gm1807YAvp/iQ5mWW/4qdLcMkwqbDEnYptQ?=
 =?us-ascii?Q?trqjyQ47YP2DNlWNGFG+zms8mJTjD56l8CDNZqRruDcbCpRNEztHKq9O6FZD?=
 =?us-ascii?Q?EVlaVU6elmdShGTPM9lyEHJUJFwKn5FzRRGvTFZkR2Km5P5mg4FuJDDRzMHe?=
 =?us-ascii?Q?7Y2l5ouYIEy8CVVuWp4ywf9dZI6VJOk0qaspltHHx2z2m2YYRoo/3cd/fNFC?=
 =?us-ascii?Q?ZaLioyX81X8IM62OThOop+PwiJS8QMsT4uIUJ1cR3xyB057HoiVCgIY42p5Z?=
 =?us-ascii?Q?q/X6k4Oq7c1ggi35CCgAt+wVchJgSOd0WTIE3F9mNYc+I0UxRLCBkC7pie4q?=
 =?us-ascii?Q?vnSjKmBDWBmc/X3VIpd8kYZtTaLZQ+VCiZBBKqyuLeyoEqgBBgMjPu6PyCyy?=
 =?us-ascii?Q?Uq/lPEBZ93NUxhP1CxfI+NXLy3L9IBvOhjPbJ0Ip4dt4CTBBFNZvp0C4Tb3D?=
 =?us-ascii?Q?JGl2atlAPRSX7Iy9Q52Srx6WmkBprS86rwjZ9xCFiOM+4JkxBBFGAHgxAgVD?=
 =?us-ascii?Q?CC2BDF6Z5mTQ9vQR0npNzfREnYlOCF7up8Kc7VAq211H90Rd2hGVQWYLXFCG?=
 =?us-ascii?Q?xLBeJ0CYoWzX8qidg+y7KSMb1wYmbyCIaIH6I9i4wxU+4wqhq0cPu95HgEgA?=
 =?us-ascii?Q?hr+yLP+YVnesU/3h/k/bCHEn2p02ZVOnnV75W5uJ4+FqMMEQrojf5kjBkrkW?=
 =?us-ascii?Q?sYY6eZuJOJiohkS4SFONaZv2gRkSCETXmJL/cnPoPZslfwC88fE/1HskO2/r?=
 =?us-ascii?Q?iUNWMqHu973Frcbu8C7GgSYNKDGEVEXKK0x9sXENbxd/X6mjV3gy1UMGNKMV?=
 =?us-ascii?Q?0zYx98P9WjpdHRsQlG4FfXu705VJfHHNoa2t6IitkIyz/Bm/9WRcHXhbuAz9?=
 =?us-ascii?Q?WZHZwoKqzXcOjLvRJ2WhgygOBz5FiRbTDGKImND17lGPwjRsn29iNFeYFTXa?=
 =?us-ascii?Q?0v8EeQcuBR205fDneBCquKEAUETn1RJ52DRVSuWbq6zU3N005xXnDJfG4mOt?=
 =?us-ascii?Q?EOwDEUbgQqCo3ZVf0hVjE/q4o1ZS5YOPaSz686lzONBYJWF26mARMMwBmCt9?=
 =?us-ascii?Q?4aWIpvV5j6Dut24fgQlt0tAtW4UfzVkoVYR3fNfF56NnZHFFCh8EFutGA4mB?=
 =?us-ascii?Q?D8pgGpNyxcNfU3VFw4hdtw3CtGEBB42RM8XzfMb8gXgXKOXHjwFm4kXn98Ck?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4759a97b-dfaa-417e-3c33-08dc3d369e47
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:06:37.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17k+an37Al9xhyOTDezPYW/MedYQaIbKKGNOlvK41PGrgrrhJleNkifbKe5L222IGUhHaDxoFgoH6OhiGwJMXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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

On Tue, Mar 05, 2024 at 02:12:50PM +0100, Maarten Lankhorst wrote:
> Considering the caller of the GGTT functions should keep the
> backing storage alive before the function completes, it's not
> necessary to invalidate with the GGTT lock held. This just adds
> latency for every user of the GGTT.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +--
>  drivers/gpu/drm/xe/xe_bo_evict.c       | 5 +++++
>  drivers/gpu/drm/xe/xe_ggtt.c           | 7 +++----
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 95595d2cf1dc..79501efd6871 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -205,7 +205,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  
>  	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
>  		vma->node = bo->ggtt_node;
> -		goto out_unlock;
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> @@ -243,9 +242,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  					   rot_info->plane[i].dst_stride);
>  	}
>  
> -	xe_ggtt_invalidate(ggtt, true);
>  out_unlock:
>  	mutex_unlock(&ggtt->lock);
> +	xe_ggtt_invalidate(ggtt, true);
>  out:
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 7a264a9ca06e..134be2abdf65 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -122,8 +122,10 @@ int xe_bo_evict_all(struct xe_device *xe)
>   */
>  int xe_bo_restore_kernel(struct xe_device *xe)
>  {
> +	struct xe_tile *tile;
>  	struct xe_bo *bo;
>  	int ret;
> +	u8 id;
>  
>  	if (!IS_DGFX(xe))
>  		return 0;
> @@ -167,6 +169,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  	}
>  	spin_unlock(&xe->pinned.lock);
>  
> +	/* XXX: Need invalidation so soon after resume? */

For safety reasons I think it is good idea to issue an invalidate on
resume even if it may not be required. Also a single invalidation for an
entire restore is a pretty low cost. Maybe adjust the comment and drop
the XXX?

The rest of the patch LGTM.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	for_each_tile(tile, xe, id)
> +		xe_ggtt_invalidate(tile->mem.ggtt, false);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index bda5055a2a18..56bc20586127 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -391,8 +391,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
> -
> -	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
>  }
>  
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> @@ -421,6 +419,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (!err)
>  		xe_ggtt_map_bo(ggtt, bo);
>  	mutex_unlock(&ggtt->lock);
> +
> +	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>  
>  	return err;
> @@ -445,10 +445,9 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool di
>  	xe_ggtt_clear(ggtt, node->start, node->size);
>  	drm_mm_remove_node(node);
>  	node->size = 0;
> +	mutex_unlock(&ggtt->lock);
>  
>  	xe_ggtt_invalidate(ggtt, display);
> -
> -	mutex_unlock(&ggtt->lock);
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>  }
>  
> -- 
> 2.43.0
> 
