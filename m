Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E83C61DBE
	for <intel-xe@archiver.kernel.org>; Sat, 29 Aug 2026 08:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5F210E0DC;
	Sat, 29 Aug 2026 08:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHH4Pxdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BDA10E0B9;
 Sat, 29 Aug 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787993373; x=1819529373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ve5emK5YIYfKRJXF4xIBHYdAbXRxw0Y0Fjq9iPIMMbo=;
 b=BHH4PxduAZn4z4l1Zo6nC6sgy+0snbivmxok1cduYMQ1S19cD9P1ffBl
 eoNPvCDQhRs4Cc0q5BZZ3NM+VNmvQJ3TLAA/jO2LHMZoJ9nPl6ydpktsT
 2nUioaqDpUkXHPSrMK4b0WGZCN2IXjX76LMxKl9opcaNveJzGA7WYPg9e
 jRsOmEDeBbvRvF6/XP+WJkXNCVWIlgCWeWSR90ObRT9UE6Qvhx/dW0hQJ
 xaXkdCydCyOeKhut/js2MgNnJvK5PbvatnAmy/SneYSAyUIrQHoPkEn5K
 zfN5q2EjUkxA4hq4OK9Nc/A6D9VslX0Pj3HqPg8RjFZ4gPp6tZZY3Nduy Q==;
X-CSE-ConnectionGUID: i+qGGe0+RLOXPFJTfRbRCg==
X-CSE-MsgGUID: xiIaQ7zeSvigbW6NxgP75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88247233"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; d="scan'208";a="88247233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 01:49:32 -0700
X-CSE-ConnectionGUID: OwoIS45WTvi/6XDDzsSfhw==
X-CSE-MsgGUID: FFcdVKRjR/+GyevCIsIKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; d="scan'208";a="265797758"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.218])
 ([10.245.245.218])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 01:49:30 -0700
Message-ID: <3ad607d2-98b4-4f8d-8cf4-ac4e5fb738b8@intel.com>
Date: Sat, 29 Aug 2026 10:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/i915: only timeout on fence waits for display
 reset
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com
References: <cover.1787833879.git.jani.nikula@intel.com>
 <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
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

For whole series:

Acked-by: Maarten Lankhorst <maarten.lankhorst@intel.com>

On 8/27/26 14:34, Jani Nikula wrote:
> As written by Maarten: Not waiting on fences until they're signaled is
> an existing issue in i915, and was added as a workaround for a deadlock
> when GPU reset has to reset display as well on old platforms. This
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

