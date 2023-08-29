Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0389AC83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 09:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E7210E1D7;
	Tue, 29 Aug 2023 09:49:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4CB10E1D7
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693302559; x=1724838559;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xo/0kVokUK3RFeSpPeeh1oXbYXDWLxLcMWP5P/1kM3k=;
 b=AsnRRLls9uRLckkNIBlJTi/e0/OMw13r6p3D+380WCBQCRpTVz6kUbfe
 8KSkAg1Cc5O8hFBKzlxeo4x+2x1FWkkjpesE0GAVzMhh40mnuEGhMH8ZL
 kuDT0qHaFxGkYS4EgowrRM5NE0Qn1cQAauoJRRYUPHVrS3zvPV6ri7AlS
 penzEOpTLYZCtyO1qljXT4BelBRWdPZKGEl0SxL9z2dp/XVlJmcMY1ZaG
 ycQ4VRYI0nZZ2NDBcqX4J5boac504X/MZBsfiFyOqs14Q3Xc1sVlp4OCU
 qgR88oX9tGrCDnSc8CYiGv18QDO6g8LXV0pFTzipE7KoOBr45KaazuaQr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365532176"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="365532176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 02:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="768011243"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="768011243"
Received: from mnefedov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 02:49:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230526164358.86393-13-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
 <20230526164358.86393-13-lucas.demarchi@intel.com>
Date: Tue, 29 Aug 2023 12:49:14 +0300
Message-ID: <874jki2n6t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v5 12/21] drm/xe: Add support for OOB
 workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 26 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d703dc0f7b21..d9906f326d38 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -9,6 +9,7 @@
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
>  
> +#include "generated/xe_wa_oob.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> @@ -73,8 +74,8 @@
>   *      engine registers are restored in a context restore sequence. This is
>   *      currently not used in the driver.
>   *
> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
> - *   central place. Those are peppered around the rest of the code, as needed.
> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
> + *   a central place. Those are peppered around the rest of the code, as needed.
>   *   Workarounds related to the display IP are the main example.
>   *
>   * .. [1] Technically, some registers are powercontext saved & restored, so they
> @@ -579,8 +580,31 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	{}
>  };
>  
> +static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> +#include <generated/xe_wa_oob.c>

This should use "generated/xe_wa_oob.c" i.e. not system header
inclusion.

I might even have used some other subdir name to avoid the conflict with
include/generated.


BR,
Jani.


> +	{}
> +};
> +
> +static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
> +
>  __diag_pop();
>  
> +/**
> + * xe_wa_process_oob - process OOB workaround table
> + * @gt: GT instance to process workarounds for
> + *
> + * Process OOB workaround table for this platform, marking in @gt the
> + * workarounds that are active.
> + */
> +void xe_wa_process_oob(struct xe_gt *gt)
> +{
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> +
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
> +						  ARRAY_SIZE(oob_was));
> +	xe_rtp_process(&ctx, oob_was);
> +}
> +
>  /**
>   * xe_wa_process_gt - process GT workaround table
>   * @gt: GT instance to process workarounds for
> @@ -641,13 +665,14 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  int xe_wa_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	size_t n_lrc, n_engine, n_gt, total;
> +	size_t n_oob, n_lrc, n_engine, n_gt, total;
>  	unsigned long *p;
>  
>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>  	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
> -	total = n_gt + n_engine + n_lrc;
> +	n_oob = BITS_TO_LONGS(ARRAY_SIZE(oob_was));
> +	total = n_gt + n_engine + n_lrc + n_oob;
>  
>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>  	if (!p)
> @@ -658,6 +683,8 @@ int xe_wa_init(struct xe_gt *gt)
>  	gt->wa_active.engine = p;
>  	p += n_engine;
>  	gt->wa_active.lrc = p;
> +	p += n_lrc;
> +	gt->wa_active.oob = p;
>  
>  	return 0;
>  }
> @@ -677,4 +704,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "\nLRC Workarounds\n");
>  	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
>  		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
> +
> +	drm_printf(p, "\nOOB Workarounds\n");
> +	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
> +		if (oob_was[idx].name)
> +			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index defefa5d9611..cfe685989524 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -11,6 +11,7 @@ struct xe_gt;
>  struct xe_hw_engine;
>  
>  int xe_wa_init(struct xe_gt *gt);
> +void xe_wa_process_oob(struct xe_gt *gt);
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> @@ -18,4 +19,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> +/**
> + * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
> + *         other more specific type
> + * @gt__: gt instance
> + * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> + */
> +#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> new file mode 100644
> index 000000000000..e69de29bb2d1

-- 
Jani Nikula, Intel Open Source Graphics Center
