Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DC0C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 11:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA910F138;
	Wed,  2 Sep 2026 11:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbLt5nYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5E10E008;
 Wed,  2 Sep 2026 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788349371; x=1819885371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tfY6eqQdJgfndYeqc3gfPqste3JtZH0u0fDiciShKDI=;
 b=nbLt5nYmU7Gr++I2bx7AUBBGNitywMQMLe9TylMW4H9kIjRNf3eL2lYl
 sVcVD9JvMe9qdToU7CsBhrw0azWhqxyAKHPco0vfBdmiyedrn93YLaG5V
 ksT/gWxL5OJ4xsHZSXEEb0vHWxabJzmDmPgn0UyTn4tqncBaQpg/omvxN
 XlQQYje6HakJEen69bymGwZrsznycgUFMdemlYC5pIBuL3i55BEVVVUL3
 SU2EcVQMpox2mFCkMxQCbN3T/7t2Pys6aauqGPKCKz534OClfs224RvMO
 JcAZEsICbdk+HplNOgAjkAJ6SKEKY7m1wlMMV+Rz+9PLUicfXFNOCtvBy A==;
X-CSE-ConnectionGUID: rezdQuKMT4GXiGR2EkUQlA==
X-CSE-MsgGUID: jCcwSNmcQyGDGs+577rK5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99138569"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="99138569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:42:51 -0700
X-CSE-ConnectionGUID: 8ngnSo6fSPWQC4SYDDbNbQ==
X-CSE-MsgGUID: TaW8zriBS9mjVm13sp/Xcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="292898157"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.200])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:42:48 -0700
Date: Wed, 2 Sep 2026 14:42:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: Re: [PATCH v2 6/7] drm/i915: only timeout on fence waits for display
 reset
Message-ID: <apgLtqwv7g1gNiAd@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
 <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Aug 27, 2026 at 03:34:56PM +0300, Jani Nikula wrote:
> As written by Maarten: Not waiting on fences until they're signaled is
> an existing issue in i915, and was added as a workaround for a deadlock
> when GPU reset has to reset display as well on old platforms.

IIRC the timeout wasn't added for that. It's there just as a backup to
make sure we never get completely stuck. We had more proper handling for
this stuff (== terminate/skip the fence wait on GPU reset) but lost that
in the conversion to dma_fence.

Since we Christian NAKed my dma_fence equivalent of the previous
approach and I don't feel like attempting to resurrect my old display
reset rw_lock branch right now, the best we can probably do is
basically revert commit 9db529aac938 ("drm/i915: More surgically
unbreak the modeset vs reset deadlock"). The upside of that would be
that the display reset will become fast again, but the downside is
that the full wedge will also kill innocent requests.

> This
> requires a modeset to disable everything, which may hang since it could
> wait on a fence that may only be signaled after GPU reset completes.
> 
> Limit the timeout on fence waits a) to platforms where GPU reset
> clobbers display, and b) when we're running forced display reset tests.
> 
> This change only impacts i915, as xe has MAX_SCHEDULE_TIMEOUT in any
> case.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index aa5d41dac8a9..76ec9161aaa3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -74,6 +74,7 @@
>  #include "intel_display_driver.h"
>  #include "intel_display_power.h"
>  #include "intel_display_regs.h"
> +#include "intel_display_reset.h"
>  #include "intel_display_rpm.h"
>  #include "intel_display_types.h"
>  #include "intel_display_utils.h"
> @@ -7277,15 +7278,20 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
>  	struct intel_display *display = to_intel_display(state);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *new_plane_state;
> -	long ret;
> +	long timeout, ret;
>  	int i;
>  
> +	if (intel_display_reset_needed_after_gpu_reset(display) ||
> +	    intel_display_reset_test(display))
> +		timeout = i915_fence_timeout();
> +	else
> +		timeout = MAX_SCHEDULE_TIMEOUT;
> +
>  	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
>  		if (!new_plane_state->fence)
>  			continue;
>  
> -		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
> -					     i915_fence_timeout());
> +		ret = dma_fence_wait_timeout(new_plane_state->fence, false, timeout);
>  		if (!ret)
>  			ret = -ETIMEDOUT;
>  		if (ret < 0) {
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
