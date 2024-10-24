Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB99CE8E92
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 16:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668910E3A2;
	Thu, 24 Oct 2024 16:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQsFItGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BF710E3A2
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729787539; x=1761323539;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=31SkW4UGqNeu16QJZFTs55fKmKktLyiXhi2tlhNzqhk=;
 b=AQsFItGglKuElZVtxMyj9Pe5bRVh7LuW4ZjG2e/VPoSCsvSCYH4NlE9y
 IeecBrXXxNZGt6tgVF58je3IiVx+3v8LHr27zEIumOZeDB5MU/2Bb4fwj
 ScYRPKYF51s/CjczA/TSXbTfBG/gzvQmo8Km/RsfTuefyxtVbZ+9uMd+k
 9lROibizdAVGkXMSgyTG55Yki7APN/+UClwcSqm09kP8KJB9NWwiN5ldO
 L+Y1zQK5TKAK7RYaZtnU4HC+iPfM/TenONJIvCZ9zvXhVNeRGvkoIU1gM
 tp6e7Dau3qZr/cSkr5X0sLAi895ExTvdzLVESA+W2olpxXeQfY0HJxAu9 w==;
X-CSE-ConnectionGUID: KwKswUxSQnqH1T9se31FxQ==
X-CSE-MsgGUID: t1ol21LLSx+y0C6YL6Twiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29293930"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29293930"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:32:18 -0700
X-CSE-ConnectionGUID: kkF1WIg1TI+L5RRmEl0G2w==
X-CSE-MsgGUID: qQijrgUOQMqB0iMVMHeYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="85434820"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:32:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Matthew Auld <matthew.auld@intel.com>, John
 Harrison <John.C.Harrison@Intel.com>, Himal
 Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, stable@vger.kernel.org, Matthew Brost
 <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
In-Reply-To: <20241024151815.929142-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241024151815.929142-1-nirmoy.das@intel.com>
Date: Thu, 24 Oct 2024 19:32:11 +0300
Message-ID: <87bjz9sbqs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 24 Oct 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points to the recent scheduling issue with E-cores.
>
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
>
> v2: Add platform check(Himal)
>     s/__flush_workqueue/flush_workqueue(Jani)
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f5deb81eba01..78a0ad3c78fe 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "compat-i915-headers/i915_drv.h"

Sorry, you just can't use this in xe core. At all. Not even a little
bit. It's purely for i915 display compat code.

If you need it for the LNL platform check, you need to use:

	xe->info.platform == XE_LUNARLAKE

Although platform checks in xe code are generally discouraged.

BR,
Jani.



>  #include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
> @@ -155,6 +156,19 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		if (!timeout) {
> +			if (IS_LUNARLAKE(xe)) {
> +				/*
> +				 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h
> +				 * worker in case of g2h response timeout")
> +				 *
> +				 * TODO: Drop this change once workqueue scheduling delay issue is
> +				 * fixed on LNL Hybrid CPU.
> +				 */
> +				flush_workqueue(xe->ordered_wq);
> +				err = do_compare(addr, args->value, args->mask, args->op);
> +				if (err <= 0)
> +					break;
> +			}
>  			err = -ETIME;
>  			break;
>  		}

-- 
Jani Nikula, Intel
