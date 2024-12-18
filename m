Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0D4E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 14:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1110E34E;
	Wed, 18 Dec 2024 14:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kv+AoY/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8421A10E34E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734532351; x=1766068351;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=sRDD/VA9u40asWPutk6Sn/g7VDoAEI69Zd/a326sZtA=;
 b=kv+AoY/839TFM9Cy1D/Z+Mg3qai8qe8LdrjSG74dD3HF6W2Wn49y5qn7
 Sxw39W/lydaYaG2fsHQ+eK31OLcPso5VDtP68O3F0oGFE57qhvUhwE0yi
 5PdEW9rech8OmIlG5ZmojaiUyjJ27sHmkeMmFYvx+xXUojnKLZH/ENH4F
 HX4x/nPntAxjTGnFRNeMJlw1Rbkg3nDKfldLe0OMlsztallvFoBR1Wfyw
 Czi9FYCJSyDL9edwgC5K8TZjVzWYudNg6wkQ2yvMcXnuGCQkWDILh1+pW
 rScSmOrkbbL4Ti6Noy04tDVRfSPB4cDBEHDDHPOoi1ZppAjfYSTQf1k3J Q==;
X-CSE-ConnectionGUID: w38V/7X1Qk2DYVTRwJUPHQ==
X-CSE-MsgGUID: bQlqvDTxStWtrgXTl55yhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46427051"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46427051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:32:31 -0800
X-CSE-ConnectionGUID: TT0l0FAVRvahJJg2Mb3JUQ==
X-CSE-MsgGUID: /9+AXJxsS5Cm+jkBwV+VuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102734954"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:32:30 -0800
Date: Wed, 18 Dec 2024 16:33:09 +0200
From: Imre Deak <imre.deak@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/pm: Also avoid missing outer rpm warning on
 system suspend
Message-ID: <Z2LdJSyhpJoSNQ-Q@ideak-desk.fi.intel.com>
References: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2024 at 06:05:47PM -0500, Rodrigo Vivi wrote:
> We have some cases where display is releasing power domains at
> release_async_put_domains() where intel_runtime_pm_get_noresume()
> is called, but no outer protection. In Xe this will trigger our
> traditional warning.

I suppose by outer protection you mean an RPM reference that is
guaranteed to be held at the point (that is right before)
release_async_put_domains() calls intel_runtime_pm_get_noresume(). This
is guaranteed, i.e. such an RPM reference is held by definition (by the
power domain reference that is being put).

Instead, the actual reason for triggering the warn - IIUC - is that
intel_runtime_pm_get_if_in_use() called from
xe_pm_runtime_get_noresume() (probably for the exact reason to check if
an outer RPM is held) fails if it is called while system suspending /
resuming. This is the same scenario as when
intel_runtime_pm_get_if_in_use() would fail if called during runtime
suspending / resuming and - worked around earlier I assume - by
suppressing the warning in this case using xe_pm_suspending_or_resuming().

So in this fix the above workaround to suppress the warning is just
extended to the system suspend/resume case.

> However, this case should be safe because it is triggered from the
> system suspend path, where we certainly won't be transitioning to rpm
> suspend.
> 
> This wouldn't happen if the display pm sequences, including
> all irq flow was in sync between i915 and xe. So, while we
> don't get there, let's not raise warnings when we are in this
> system suspend path.

I think the issue fixed in this patch is just a consequence of how the
outer RPM check works using xe_pm_suspending_or_resuming() and wouldn't
change even after the IRQ related issues are fixed.

> Suggested-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

With the above understanding:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a6761cb769b2..c6e57af0144c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/suspend.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -607,7 +608,8 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
>  	struct device *dev = xe->drm.dev;
>  
>  	return dev->power.runtime_status == RPM_SUSPENDING ||
> -		dev->power.runtime_status == RPM_RESUMING;
> +		dev->power.runtime_status == RPM_RESUMING ||
> +		pm_suspend_target_state != PM_SUSPEND_ON;
>  #else
>  	return false;
>  #endif
> -- 
> 2.47.1
> 
