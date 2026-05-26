Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6115ECD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 17:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F01E10E6F9;
	Tue, 26 May 2026 17:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uav5uxE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A4210E6F9;
 Tue, 26 May 2026 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779817044; x=1811353044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1ySu07nIw7e+g2Q8MAGtOiGUrGp2Uds26Q96HdIQSho=;
 b=Uav5uxE22iUY9m8qYrh88mh9Sfm6rmhva2r/+A/w+m4C2kn8rlJvni1m
 +li79pd24qSSlui9o/A1YFGYPTZpwEnj9kYbqX6YCB1kqdIPNaC+8A9FR
 RpeIo0T+h0cvIsoAjjzVn5/TqcJhL2s3szDIHt5t2sjuthR0Lg2XRlOon
 rNhuPBi1swM0b56Aw/0gBjBfXh+iNH+p2A+y9mqKnmZXqYcCjS39hNVIp
 F01XUOC2V7ZF8llKcGGT3KQ8dCVLU6zVpN12HEElQHp8iML4w50eFCE5y
 b0pvCULzjcVUAAO2xPfFcIuvJTACyMO0Ap8tz0SLpWC/yPC50MMSVRUm3 A==;
X-CSE-ConnectionGUID: Leqkyfw6Rt+Qb7bcC4T/cw==
X-CSE-MsgGUID: 9rIu0XBSR5agcc92d1/LJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91331073"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="91331073"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 10:37:23 -0700
X-CSE-ConnectionGUID: 6Hn/WubzQUO8lT5BCWO2UQ==
X-CSE-MsgGUID: gYPbSzVLQrudnaiWNEPdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="280110625"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 10:37:22 -0700
Date: Tue, 26 May 2026 20:37:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/{i915,xe}: move xe_display_flush_cleanup_work()
 to i915 display
Message-ID: <ahXaTZD-L-koRduP@intel.com>
References: <7aecde385b66dbf7d0e61759528c6cd643581a3d.1778659089.git.jani.nikula@intel.com>
 <20260525110553.651208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525110553.651208-1-jani.nikula@intel.com>
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

On Mon, May 25, 2026 at 02:05:53PM +0300, Jani Nikula wrote:
> xe_display_flush_cleanup_work() is a bit of an oddball function in xe
> display code. There shouldn't be anything this specific or xe
> specific. While I'm not sure what the correct refactor for the function
> should be, move it to shared display code for starters, next to the
> eerily similar but slightly different intel_has_pending_fb_unpin() that
> is only called from i915 core.
> 
> The main goal here is to unblock some refactors on
> for_each_intel_crtc().
> 
> v2: Add FIXME comment (Ville)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 22 ++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.h |  1 +
>  drivers/gpu/drm/xe/display/xe_display.c      | 27 +++-----------------
>  3 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 6c8935f69db1..a6cee0f81358 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -737,6 +737,28 @@ bool intel_has_pending_fb_unpin(struct intel_display *display)
>  	return false;
>  }
>  
> +/* FIXME: All callers need to be audited and unified between i915 and xe */

That makes me think we want to keep this. I was more thinking of
something like
/* FIXME remove this and just flush the cleanup wq where appropriate */

> +void intel_display_flush_cleanup_work(struct intel_display *display)
> +{
> +	struct intel_crtc *crtc;
> +
> +	for_each_intel_crtc(display->drm, crtc) {
> +		struct drm_crtc_commit *commit;
> +
> +		spin_lock(&crtc->base.commit_lock);
> +		commit = list_first_entry_or_null(&crtc->base.commit_list,
> +						  struct drm_crtc_commit, commit_entry);
> +		if (commit)
> +			drm_crtc_commit_get(commit);
> +		spin_unlock(&crtc->base.commit_lock);
> +
> +		if (commit) {
> +			wait_for_completion(&commit->cleanup_done);
> +			drm_crtc_commit_put(commit);
> +		}
> +	}
> +}
> +
>  /*
>   * Finds the encoder associated with the given CRTC. This can only be
>   * used when we know that the CRTC isn't feeding multiple encoders!
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 45a90d2fe6ec..72f33113a5a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -402,6 +402,7 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state);
>  void i830_enable_pipe(struct intel_display *display, enum pipe pipe);
>  void i830_disable_pipe(struct intel_display *display, enum pipe pipe);
>  bool intel_has_pending_fb_unpin(struct intel_display *display);
> +void intel_display_flush_cleanup_work(struct intel_display *display);
>  void intel_encoder_destroy(struct drm_encoder *encoder);
>  struct drm_display_mode *
>  intel_encoder_current_mode(struct intel_encoder *encoder);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 8d08da60336d..a5066de3d789 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -244,27 +244,6 @@ static bool suspend_to_idle(void)
>  	return false;
>  }
>  
> -static void xe_display_flush_cleanup_work(struct xe_device *xe)
> -{
> -	struct intel_crtc *crtc;
> -
> -	for_each_intel_crtc(&xe->drm, crtc) {
> -		struct drm_crtc_commit *commit;
> -
> -		spin_lock(&crtc->base.commit_lock);
> -		commit = list_first_entry_or_null(&crtc->base.commit_list,
> -						  struct drm_crtc_commit, commit_entry);
> -		if (commit)
> -			drm_crtc_commit_get(commit);
> -		spin_unlock(&crtc->base.commit_lock);
> -
> -		if (commit) {
> -			wait_for_completion(&commit->cleanup_done);
> -			drm_crtc_commit_put(commit);
> -		}
> -	}
> -}
> -
>  static void xe_display_enable_d3cold(struct xe_device *xe)
>  {
>  	struct intel_display *display = xe->display;
> @@ -278,7 +257,7 @@ static void xe_display_enable_d3cold(struct xe_device *xe)
>  	 */
>  	intel_power_domains_disable(display);
>  
> -	xe_display_flush_cleanup_work(xe);
> +	intel_display_flush_cleanup_work(display);
>  
>  	intel_opregion_suspend(display, PCI_D3cold);
>  
> @@ -333,7 +312,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  		intel_display_driver_suspend(display);
>  	}
>  
> -	xe_display_flush_cleanup_work(xe);
> +	intel_display_flush_cleanup_work(display);
>  
>  	intel_encoder_block_all_hpds(display);
>  
> @@ -365,7 +344,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>  		intel_display_driver_suspend(display);
>  	}
>  
> -	xe_display_flush_cleanup_work(xe);
> +	intel_display_flush_cleanup_work(display);
>  	intel_dp_mst_suspend(display);
>  	intel_encoder_block_all_hpds(display);
>  	intel_hpd_cancel_work(display);
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
