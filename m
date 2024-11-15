Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EABD6DDEF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250D310E844;
	Fri, 15 Nov 2024 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKTkY+aU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D818710E845;
 Fri, 15 Nov 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731666159; x=1763202159;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uxG2wZKaFFWWnFFQpIYl1sXHTc2KhcuS3qwKcFlSpC4=;
 b=RKTkY+aUiXOWC6HzLAqyo6JJQwAIFFyuI3x8m3Sr2dhQOz8D87iAIEmj
 Vt4rEH6qgGXzbcV17ulV6mIQQQSO0FOCgkoizKUYgHba43LYdPm2WrJoB
 tICN3DXOpNPrwyhsJl0eMYOESbR97MOzf1e4HKIAAeCOlLL2nc3Uzkxb3
 4xtAdKMs57vYD7dFo9JcWPb6ra84+kAu+PxD5XpNaUUahS050KTJWMhO2
 IQTK7u3BDLs918Q8CVymXSBKB00qA1fYHWoIqvHNZwT3ijGbY3z4VyBvp
 kc4V2R1y0w8u0idhZDO+07WzcqUV753CgYhJh+RGZUhELKE694u6RDSoR w==;
X-CSE-ConnectionGUID: zzvN2YzrRXm00vqGI/QvrQ==
X-CSE-MsgGUID: xKPkIL6TRh2uhQZmbmBtzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31424123"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31424123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:22:38 -0800
X-CSE-ConnectionGUID: 09jII5jUQ5+/lja1AWOGTg==
X-CSE-MsgGUID: mSB7rDbJSKG7d7fJI6Yn3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88921398"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 02:22:37 -0800
Message-ID: <3fecadce-8477-4034-88fd-5f6cf5667c2e@intel.com>
Date: Fri, 15 Nov 2024 10:22:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 2/4] include/drm-uapi-experimental: Move i915_drm_local.h
 to drm-uapi-experimental
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241114050129.1381711-1-tejas.upadhyay@intel.com>
 <20241114050129.1381711-3-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241114050129.1381711-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 14/11/2024 05:01, Tejas Upadhyay wrote:
> Move i915_drm_local.h to drm-uapi-experimental/intel_drm_local.h

Should say why.

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   .../drm-uapi-experimental/intel_drm_local.h   | 27 +++++++++++++++++++
>   lib/i915/gem_scheduler.c                      |  2 +-
>   lib/i915/intel_memory_region.h                |  2 +-
>   lib/igt_gt.h                                  |  2 +-
>   tools/i915-perf/i915_perf_recorder.c          |  2 +-
>   5 files changed, 31 insertions(+), 4 deletions(-)
>   create mode 100644 include/drm-uapi-experimental/intel_drm_local.h
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> new file mode 100644
> index 000000000..1773c649b
> --- /dev/null
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#ifndef _INTEL_DRM_LOCAL_H_
> +#define _INTEL_DRM_LOCAL_H_
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * It is necessary on occasion to add uapi declarations to IGT before they
> + * appear in imported kernel uapi headers. This header is provided for this
> + * purpose.
> +
> + * Early uapi declarations should be added here exactly as they are
> + * expected to appear in the kernel uapi headers, i.e. without the LOCAL_
> + * or local_ prefix and without any #ifndef's. Attempt should be made to
> + * clean these up when kernel uapi headers are sync'd.
> + */
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _INTEL_DRM_LOCAL_H_ */
> diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
> index 0087df902..7c4eea983 100644
> --- a/lib/i915/gem_scheduler.c
> +++ b/lib/i915/gem_scheduler.c
> @@ -25,10 +25,10 @@
>   #include <string.h>
>   #include <sys/ioctl.h>
>   
> +#include "drm-uapi-experimental/intel_drm_local.h"
>   #include "igt_core.h"
>   #include "ioctl_wrappers.h"
>   
> -#include "i915/i915_drm_local.h"
>   #include "i915/gem_scheduler.h"
>   #include "i915/gem_submission.h"
>   
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 9e24bd8fb..ce187f426 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -22,7 +22,7 @@
>    */
>   #include "i915_drm.h"
>   #include "igt_collection.h"
> -#include "i915_drm_local.h"
> +#include "intel_drm_local.h"

Header is now empty, right? Maybe just drop all of these instead?

>   
>   #ifndef INTEL_MEMORY_REGION_H
>   #define INTEL_MEMORY_REGION_H
> diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> index d3213123d..82ed22be7 100644
> --- a/lib/igt_gt.h
> +++ b/lib/igt_gt.h
> @@ -24,11 +24,11 @@
>   #ifndef IGT_GT_H
>   #define IGT_GT_H
>   
> +#include "drm-uapi-experimental/intel_drm_local.h"
>   #include "igt_debugfs.h"
>   #include "igt_dummyload.h"
>   #include "igt_core.h"
>   
> -#include "i915/i915_drm_local.h"
>   #include "i915_drm.h"
>   
>   struct pci_device;
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index ca4354832..5dc5eb65d 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -44,7 +44,7 @@
>   
>   #include <i915_drm.h>
>   
> -#include "i915/i915_drm_local.h"
> +#include "drm-uapi-experimental/intel_drm_local.h"
>   
>   #include "igt_core.h"
>   #include "intel_chipset.h"

