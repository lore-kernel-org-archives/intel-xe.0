Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E47C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 13:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE210E822;
	Fri, 21 Feb 2025 13:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C18Eg9PP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E859F10E822;
 Fri, 21 Feb 2025 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740143840; x=1771679840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TQ6Vb8yi646f2MnJcqx5GEwSdYNGUi6A6kDdSWCkSBY=;
 b=C18Eg9PPghhQ084ITgCei0KpJskMJs8QVAzxAFWCRJG9UA+EP+3Y7CcG
 sACVQpZ73LtCFMTbOzjiACU3wLLkX4coeUXm0KFdKc9c8QjS5dp4eF8Sk
 P67rdTMl3n68ScXxbQALeibmpjYhCyi+wz+wDHb6kN3A4emJngeiB3ntB
 SePSec1dqUa3Jx8PVnvwIiYOM5oQzDPzWjsmqmLSmUwUpCq4UqSEJIOOd
 mr0ug+65yJWTRhPpZ/h2a32zQQ2Ee4IJ/0b2FdTW1CwPx9+1fCWzwiZVu
 PgQhnKo2k/mvrQaO8JH/AKELi5Okl3zMIQ15WrZI4s7Neg1mP6+4YoEop Q==;
X-CSE-ConnectionGUID: pH54+7+5QXGNyqzbFVhMbQ==
X-CSE-MsgGUID: 86RdqLKgQmC/EBtXMvExOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40976700"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40976700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:17:19 -0800
X-CSE-ConnectionGUID: ZQ+4JTGeRhSRCOOcb49A2A==
X-CSE-MsgGUID: 3igzqQhjSku2SfxXvnn1Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="146229318"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 05:17:18 -0800
Date: Fri, 21 Feb 2025 14:17:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/xe: Make running under Valgrind quiet
Message-ID: <20250221131703.nikwwxfgfrvkopct@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250204173933.95751-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204173933.95751-1-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,
On 2025-02-04 at 17:39:33 +0000, Tvrtko Ursulin wrote:
> Let Valgrind know which memory is initialised by ioctls so running tests
> under it becomes less noisy.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  lib/igt_syncobj.c |  4 +---
>  lib/xe/xe_query.c | 21 +++++++++++++++++++++

Please split this into two separate patches, you can add
then my r-b to both.

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
> index a53393bd7245..4a62890b4bbf 100644
> --- a/lib/igt_syncobj.c
> +++ b/lib/igt_syncobj.c
> @@ -197,14 +197,12 @@ int
>  syncobj_wait_err(int fd, uint32_t *handles, uint32_t count,
>  		 uint64_t abs_timeout_nsec, uint32_t flags)
>  {
> -	struct drm_syncobj_wait wait;
> +	struct drm_syncobj_wait wait = { };
>  
>  	wait.handles = to_user_pointer(handles);
>  	wait.timeout_nsec = abs_timeout_nsec;
>  	wait.count_handles = count;
>  	wait.flags = flags;
> -	wait.first_signaled = 0;
> -	wait.pad = 0;
>  
>  	return __syncobj_wait(fd, &wait);
>  }
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index ec2b127b7e87..0d2e4805c8ee 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -9,6 +9,15 @@
>  #include <stdlib.h>
>  #include <pthread.h>
>  
> +#ifdef HAVE_VALGRIND
> +#include <valgrind/valgrind.h>
> +#include <valgrind/memcheck.h>
> +
> +#define VG(x) x
> +#else
> +#define VG(x) do {} while (0)
> +#endif
> +
>  #include "drmtest.h"
>  #include "ioctl_wrappers.h"
>  #include "igt_map.h"
> @@ -34,6 +43,8 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
>  	query.data = to_user_pointer(config);
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> +	VG(VALGRIND_MAKE_MEM_DEFINED(config, query.size));
> +
>  	igt_assert(config->num_params > 0);
>  
>  	return config;
> @@ -62,6 +73,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
>  	/* Perform the query to get the actual data */
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> +	VG(VALGRIND_MAKE_MEM_DEFINED(hwconfig, query.size));
> +
>  	*hwconfig_size = query.size;
>  	return hwconfig;
>  }
> @@ -84,6 +97,8 @@ static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
>  	query.data = to_user_pointer(gt_list);
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> +	VG(VALGRIND_MAKE_MEM_DEFINED(gt_list, query.size));
> +
>  	return gt_list;
>  }
>  
> @@ -117,6 +132,8 @@ static struct drm_xe_query_engines *xe_query_engines(int fd)
>  	query.data = to_user_pointer(engines);
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> +	VG(VALGRIND_MAKE_MEM_DEFINED(engines, query.size));
> +
>  	return engines;
>  }
>  
> @@ -138,6 +155,8 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
>  	query.data = to_user_pointer(mem_regions);
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> +	VG(VALGRIND_MAKE_MEM_DEFINED(mem_regions, query.size));
> +
>  	return mem_regions;
>  }
>  
> @@ -161,6 +180,8 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
>  	query.data = to_user_pointer(oa_units);
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> +	VG(VALGRIND_MAKE_MEM_DEFINED(oa_units, query.size));
> +
>  	return oa_units;
>  }
>  
> -- 
> 2.48.0
> 
