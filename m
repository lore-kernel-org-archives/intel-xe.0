Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF2FC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 08:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124010E08E;
	Wed, 29 Nov 2023 08:31:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A742F10E08E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701246676; x=1732782676;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ilmow7S3DOKg1HZ3ozPb6K0hE7Utj9P5q/XW5LaBr20=;
 b=l+WQPBe0wN9Mk3yttAuzxypLLZ99GMeqiTXbJE40x6B49REWX78Yf9JN
 8JAALCiixyZqVe+8pxCzaaDBYIgTQKcvqmHy0L2Ry30ksCWIT5gqFOLyx
 muq4TMZnFK9BtzHQytyoOK7EMu/OrjPvH5BIXJY+cYDftsCkbYbH2IoFz
 r9cdyuSQhd1LsqYbEWRmbkJKh60FtetMlCthKi8MxG3L37PQ4l5XuZAmc
 VU68vohcOsAxDAb6Bx+FkBOjAd1i5H61tdy72SEgxANSHUFHM8DiXyb63
 YvmiXokWjJ3FkJL1B1O7VAl/w25mEVkmLLeB74yOoNlQJhkGrYPXvqcr6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373308528"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="373308528"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 00:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859733405"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="859733405"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 00:31:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231128203203.1147-3-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
 <20231128203203.1147-3-michal.wajdeczko@intel.com>
Date: Wed, 29 Nov 2023 10:31:12 +0200
Message-ID: <87a5qx6jvz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/guc: Include only required GuC
 ABI headers
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

On Tue, 28 Nov 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On i915 we were adding new GuC ABI headers directly to guc_fwif.h
> file since we were replacing old definitions from that file.
>
> On xe driver we could do more and better by including ABI headers
> only in files that need those definitions.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/741
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Yes, please!

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        | 1 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 +
>  drivers/gpu/drm/xe/xe_guc.c                 | 2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 2 ++
>  drivers/gpu/drm/xe/xe_guc_fwif.h            | 6 ------
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 2 ++
>  8 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 03c1ab0ab0ca..a33f4a37bf2d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_tlb_invalidation.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a28f31c05b1b..7eef23a00d77 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_gt_tlb_invalidation.h"
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 08142d8ee052..e6f680efb29e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -7,6 +7,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_errors_abi.h"
>  #include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c44e75074695..6295d916e39f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -11,6 +11,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_klvs_abi.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4216a6d9e478..4dd5a88a7826 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -8,13 +8,7 @@
>  
>  #include <linux/bits.h>
>  
> -#include "abi/guc_actions_abi.h"
> -#include "abi/guc_actions_slpc_abi.h"
> -#include "abi/guc_communication_ctb_abi.h"
> -#include "abi/guc_communication_mmio_abi.h"
> -#include "abi/guc_errors_abi.h"
>  #include "abi/guc_klvs_abi.h"
> -#include "abi/guc_messages_abi.h"
>  
>  #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 57d325ec8ce3..98bb9bb30705 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -7,6 +7,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e9dd6c3d750b..2919c6aea403 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -9,6 +9,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 97e87c701af5..46b132ee1d3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -13,6 +13,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_klvs_abi.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_assert.h"
>  #include "xe_devcoredump.h"

-- 
Jani Nikula, Intel
