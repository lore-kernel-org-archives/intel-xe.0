Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A870CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EF310E470;
	Thu, 12 Oct 2023 09:06:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DCE10E470
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697101612; x=1728637612;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/EfioxkuIj7JYaoaUMobUIhJNq50f/1xVaGq1mRTEO0=;
 b=R7aHO2YWrw4V4C/uVoLtoEkV+x9fszEQcJMtohBeBwiNfZVYSk8xDQlJ
 kxGDQhbyTRqsd9QRbZeeH+Q/7FDxSJcPR3n/96FxKYmkfY/ChNPE2/Zfb
 60BiNjUb5qdgFn3wCyckbuoCZdx+uNE5f0agh1H0KZhBIRzJUqEketWEf
 cnvIoUbJPozSENjry4iDWKCdEZg/aLJ6EtFgifdQ1mzfYnoIZrYwiwMWu
 FV0YsPnLvQatWziOGpTlHJT0G/YtyZehbfum6bE0F3sMSm1EbxIiQnuiW
 /hp2tcHREqi33rgyMyJoaQdRrImvXvvGkuw/SdtxPbFck6Bqjainj4X40 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="365146315"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="365146315"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747812509"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="747812509"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:06:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 uma.shankar@intel.com
In-Reply-To: <20231012084707.1254386-1-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20231012084707.1254386-1-arun.r.murthy@intel.com>
Date: Thu, 12 Oct 2023 12:06:44 +0300
Message-ID: <87ttqw2orf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] drm/i915: Remove the module parameter
 'fastboot'
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 12 Oct 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> By default fastboot is enabled on all Display 9+ platforms and disabled
> on older platforms. Its not necessary to retain this as a module
> parameter.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230926091157.635438-1-arun.r.murthy@intel.com
> (cherry picked from commit 58883680a8416661b48a800e5530e2efcea64a4a
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 ---
>  drivers/gpu/drm/i915/i915_params.c           | 5 -----
>  drivers/gpu/drm/i915/i915_params.h           | 1 -
>  3 files changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 4b73db93d23d..748e9a42e94f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4989,9 +4989,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
>  static bool fastboot_enabled(struct drm_i915_private *dev_priv)
>  {
>  #ifdef I915
> -	if (dev_priv->params.fastboot != -1)
> -		return dev_priv->params.fastboot;
> -

Sorry, you've got the patch order wrong. You've had to modify the
backport which is evident from the context.

The revert goes first and the backport next. When the original patch and
its revert get rebased away, the backport will still be intact. With
this order, you get conflicts every step of the way, and have to be
fixed, and still risk deviating from the upstream commit.

Also, please post new revisions of patch series as new threads. The
replies to threads gets confusing to both humans and CI.

BR,
Jani.


>  	/* Enable fastboot by default on Skylake and newer */
>  	if (DISPLAY_VER(dev_priv) >= 9)
>  		return true;
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 0a171b57fd8f..036c4c3ed6ed 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -137,11 +137,6 @@ i915_param_named_unsafe(enable_ips, int, 0400, "Enable IPS (default: true)");
>  i915_param_named_unsafe(enable_dpt, bool, 0400,
>  	"Enable display page table (DPT) (default: true)");
>  
> -i915_param_named(fastboot, int, 0400,
> -	"Try to skip unnecessary mode sets at boot time "
> -	"(0=disabled, 1=enabled) "
> -	"Default: -1 (use per-chip default)");
> -
>  i915_param_named_unsafe(load_detect_test, bool, 0400,
>  	"Force-enable the VGA load detect code for testing (default:false). "
>  	"For developers only.");
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 68abf0ad6c00..d5194b039aab 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -72,7 +72,6 @@ struct drm_printer;
>  	param(int, edp_vswing, 0, 0400) \
>  	param(unsigned int, reset, 3, 0600) \
>  	param(unsigned int, inject_probe_failure, 0, 0) \
> -	param(int, fastboot, -1, 0600) \
>  	param(int, enable_dpcd_backlight, -1, 0600) \
>  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
>  	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \

-- 
Jani Nikula, Intel
