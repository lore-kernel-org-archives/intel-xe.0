Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F12D49205
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 10:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C00210E0D4;
	Mon, 18 Nov 2024 10:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnDyaMvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FB610E0D4;
 Mon, 18 Nov 2024 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731926544; x=1763462544;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cms0B5fr+bvvgq+Zj9cQMgG+KumWuTpTaOOipBeOk6w=;
 b=YnDyaMvqmH2Ldy1CdTDlpE9KMNr5sXRnqenLA5jQFhFIoJlWnCqygQXy
 a00dp4GMgu51/n1hY7aH2UPoPBd4j4lIGl6scMfWDeL+/fUaiAj7LNmWG
 7JcpJ1HPu7zeQUfgE14Dx/mKctbug2QuZgtaxSabwvra4oNRSlVBdc1TR
 Opkw5PNEYGsuWui3JDdwBepKTKCIiJyVtk9z2D90vGdixi8pLLsuhaQfV
 ybfqgwB+AH6mQgshGy/qbv2mKHowE/r6N+0+mJBDu9FPUzDjY81lZz7Mz
 /a8JRhWRfz8XmuyWwlBbn4KNVCkn2cu9mdJv5qJVCv5R5oR9ijZn1LtJy Q==;
X-CSE-ConnectionGUID: s4A7LZ+zT8yCAfvc3SoIHA==
X-CSE-MsgGUID: PRb0DhxdRXmF23QDrPHqrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49415135"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="49415135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:42:23 -0800
X-CSE-ConnectionGUID: yAkMXJNaQh2EiRl1ytzxdg==
X-CSE-MsgGUID: FlOwRG1+QSiiJecEKXqPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94243870"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.170])
 ([10.245.245.170])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:42:22 -0800
Message-ID: <91e2f419-035e-4414-8a5f-f60eebb00403@intel.com>
Date: Mon, 18 Nov 2024 10:42:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2 2/4] include/drm-uapi-experimental: Move
 i915_drm_local.h to drm-uapi-experimental
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20241118070211.1474372-1-tejas.upadhyay@intel.com>
 <20241118070211.1474372-3-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241118070211.1474372-3-tejas.upadhyay@intel.com>
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

On 18/11/2024 07:02, Tejas Upadhyay wrote:
> i915_drm_local.h is for temporary local addition of defines before KMD is
> merged upstream and defines replaced with it. We have similar local defines
> requirement for xe as well for some cases. So for common use move
> i915_drm_local.h to drm-uapi-experimental/ and rename it to intel_drm_local.h
> 
> V2(MattA)
>    - Remove include as it is empty now
>    - Add details in commit message
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   .../drm-uapi-experimental/intel_drm_local.h   | 27 +++++++++++++++++++
>   lib/i915/gem_scheduler.c                      |  1 -
>   lib/i915/intel_memory_region.h                |  1 -
>   lib/igt_gt.h                                  |  2 +-
>   tools/i915-perf/i915_perf_recorder.c          |  2 --
>   5 files changed, 28 insertions(+), 5 deletions(-)
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

Could bump this?

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
> index 0087df902..e80c775af 100644
> --- a/lib/i915/gem_scheduler.c
> +++ b/lib/i915/gem_scheduler.c
> @@ -28,7 +28,6 @@
>   #include "igt_core.h"
>   #include "ioctl_wrappers.h"
>   
> -#include "i915/i915_drm_local.h"
>   #include "i915/gem_scheduler.h"
>   #include "i915/gem_submission.h"
>   
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 9e24bd8fb..4641b18c1 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -22,7 +22,6 @@
>    */
>   #include "i915_drm.h"
>   #include "igt_collection.h"
> -#include "i915_drm_local.h"
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

Could also drop this until needed and include the header only in the 
test file for now?

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   #include "igt_debugfs.h"
>   #include "igt_dummyload.h"
>   #include "igt_core.h"
>   
> -#include "i915/i915_drm_local.h"
>   #include "i915_drm.h"
>   
>   struct pci_device;
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index ca4354832..3f3692dc8 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -44,8 +44,6 @@
>   
>   #include <i915_drm.h>
>   
> -#include "i915/i915_drm_local.h"
> -
>   #include "igt_core.h"
>   #include "intel_chipset.h"
>   #include "i915/perf.h"

