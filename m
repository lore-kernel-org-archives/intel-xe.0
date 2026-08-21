Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19856C5DF94
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 16:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25E810F337;
	Fri, 21 Aug 2026 16:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0M67l1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C55710F334;
 Fri, 21 Aug 2026 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787328243; x=1818864243;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=dPMgY3+TWOc6YlilrSJedAtR5uxvDJl6VQf1dddZbyI=;
 b=Q0M67l1ewDPjzEjt7QMIalbHfMcf0C+AgrUSBVOzIhd65Ow007UxokIt
 XaTces1/88KUa/UQ+cg6ra5DWcNfsgO2VN3Ddm7eot8/qCujpt3nR4EU5
 UB490LiikXwc1+pcvNTQwVqlqPpnub9/DmgLtNuTNX+24JhLNIuPAuBnE
 AYF9xjpu14cg+oWcPuSgzY8Hzh1L41/BpksthH6NoXYWqik0vJKEfDH0M
 UyuFeB3Pum4Znkk6krAvyQy/3h2DQjg3M5avxUQgdCI4lz67FIQDn5zrY
 fRKWLPraYyIigU2S5xvtzwqsXoz5fVf9fsobvgi6RQIVN7YwkYzf+ifzn g==;
X-CSE-ConnectionGUID: sad92IwJQiCKbUzKSCGnGA==
X-CSE-MsgGUID: HJfW1gdPQPCsSoCoQHY0/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87647955"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208,217";a="87647955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 09:03:42 -0700
X-CSE-ConnectionGUID: 5VrKY0T9Sh+8s3lrW6SLtQ==
X-CSE-MsgGUID: YfteyOxcQ9aigbDUJwtaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
 d="scan'208,217";a="291237168"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.36])
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 09:03:40 -0700
Content-Type: multipart/alternative;
 boundary="------------ydJZXCfM3JhEFNELFlYbXJ7U"
Message-ID: <859cb981-4039-4f0e-801f-c9f8cd630ded@intel.com>
Date: Fri, 21 Aug 2026 18:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/i915/display: use fixed 10 second timeout for
 fence wait
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com
References: <cover.1787148235.git.jani.nikula@intel.com>
 <f61a3a828b0c0159d63d132f8f557a546a6f9ced.1787148235.git.jani.nikula@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <f61a3a828b0c0159d63d132f8f557a546a6f9ced.1787148235.git.jani.nikula@intel.com>
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

This is a multi-part message in MIME format.
--------------ydJZXCfM3JhEFNELFlYbXJ7U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 8/19/26 16:05, Jani Nikula wrote:
> i915 has a configurable fence wait timeout, defaulting to 10 seconds,
> and xe uses MAX_SCHEDULE_TIMEOUT i.e. it has no timeout.
>
> Use a fixed 10 second timeout for both drivers instead of having them do
> different things. Ditch the now unused compat header from xe.
>
> i915 actually needs the timeout to deal with CI reset tests, but there
> shouldn't be any harm in having a 10 second timeout in xe either.
>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> There have been a number of stabs at this in the past (see links below),
> and all of them have been rejected with one reason or another.
>
> My primary goal here is just to remove the annoying i915_fence_timeout()
> usage and i915 vs. xe difference. Further cleanup can come later (or
> never, as it usually is).
>
> https://lore.kernel.org/r/20251112155612.8320-1-jani.nikula@intel.com
> https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com
> https://lore.kernel.org/r/8cde57236982fc3ca1a5608332943d3b9274a45a.1775661609.git.jani.nikula@intel.com
> https://lore.kernel.org/r/20260408233458.22666-6-ville.syrjala@linux.intel.com
> ---
>  drivers/gpu/drm/i915/display/intel_display.c     |  4 +---
>  .../gpu/drm/xe/compat-i915-headers/i915_config.h | 16 ----------------
>  2 files changed, 1 insertion(+), 19 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index aa5d41dac8a9..c3a11e9e69e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -50,7 +50,6 @@
>  #include "g4x_dp.h"
>  #include "g4x_hdmi.h"
>  #include "hsw_ips.h"
> -#include "i915_config.h"
>  #include "i9xx_plane.h"
>  #include "i9xx_plane_regs.h"
>  #include "i9xx_wm.h"
> @@ -7284,8 +7283,7 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
>  		if (!new_plane_state->fence)
>  			continue;
>  
> -		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
> -					     i915_fence_timeout());
> +		ret = dma_fence_wait_timeout(new_plane_state->fence, false, 10 * HZ);
>  		if (!ret)
>  			ret = -ETIMEDOUT;
>  		if (ret < 0) {
>
Not waiting on fences until they're signaled is an existing issue in i915, and was added as a workaround for a deadlock when GPU reset has to reset display as well on old platforms. This requires a modeset to disable everything, which may hang since it could wait on a fence that may only be signaled after gpu reset completes.

Can you test if gpu_reset_clobbers_display and force_reset_modeset_test are set, and if not set the timeout to infinity on i915 as well?

Kind regards,
~Maarten Lankhorst
--------------ydJZXCfM3JhEFNELFlYbXJ7U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Hello,</font><br>
    <br>
    <div class="moz-cite-prefix">On 8/19/26 16:05, Jani Nikula wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:f61a3a828b0c0159d63d132f8f557a546a6f9ced.1787148235.git.jani.nikula@intel.com">
      <pre wrap="" class="moz-quote-pre">i915 has a configurable fence wait timeout, defaulting to 10 seconds,
and xe uses MAX_SCHEDULE_TIMEOUT i.e. it has no timeout.

Use a fixed 10 second timeout for both drivers instead of having them do
different things. Ditch the now unused compat header from xe.

i915 actually needs the timeout to deal with CI reset tests, but there
shouldn't be any harm in having a 10 second timeout in xe either.

Cc: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
Cc: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@intel.com">&lt;maarten.lankhorst@intel.com&gt;</a>
Signed-off-by: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>

---

There have been a number of stabs at this in the past (see links below),
and all of them have been rejected with one reason or another.

My primary goal here is just to remove the annoying i915_fence_timeout()
usage and i915 vs. xe difference. Further cleanup can come later (or
never, as it usually is).

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/20251112155612.8320-1-jani.nikula@intel.com">https://lore.kernel.org/r/20251112155612.8320-1-jani.nikula@intel.com</a>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com">https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com</a>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/8cde57236982fc3ca1a5608332943d3b9274a45a.1775661609.git.jani.nikula@intel.com">https://lore.kernel.org/r/8cde57236982fc3ca1a5608332943d3b9274a45a.1775661609.git.jani.nikula@intel.com</a>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/20260408233458.22666-6-ville.syrjala@linux.intel.com">https://lore.kernel.org/r/20260408233458.22666-6-ville.syrjala@linux.intel.com</a>
---
 drivers/gpu/drm/i915/display/intel_display.c     |  4 +---
 .../gpu/drm/xe/compat-i915-headers/i915_config.h | 16 ----------------
 2 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aa5d41dac8a9..c3a11e9e69e2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -50,7 +50,6 @@
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
 #include "hsw_ips.h"
-#include "i915_config.h"
 #include "i9xx_plane.h"
 #include "i9xx_plane_regs.h"
 #include "i9xx_wm.h"
@@ -7284,8 +7283,7 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 		if (!new_plane_state-&gt;fence)
 			continue;
 
-		ret = dma_fence_wait_timeout(new_plane_state-&gt;fence, false,
-					     i915_fence_timeout());
+		ret = dma_fence_wait_timeout(new_plane_state-&gt;fence, false, 10 * HZ);
 		if (!ret)
 			ret = -ETIMEDOUT;
 		if (ret &lt; 0) {

</pre>
    </blockquote>
    Not waiting on fences until they're signaled is an existing issue in
    i915, and was added as a workaround for a deadlock when GPU reset
    has to reset display as well on old platforms. This requires a
    modeset to disable everything, which may hang since it could wait on
    a fence that may only be signaled after gpu reset completes.<br>
    <br>
    Can you test if gpu_reset_clobbers_display and
    force_reset_modeset_test are set, and if not set the timeout to
    infinity on i915 as well?<br>
    <br>
    Kind regards,<br>
    ~Maarten Lankhorst
  </body>
</html>

--------------ydJZXCfM3JhEFNELFlYbXJ7U--
