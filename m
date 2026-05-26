Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B6ECD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4D410E73D;
	Tue, 26 May 2026 19:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8LzCLyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736FB10E54A;
 Tue, 26 May 2026 19:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823620; x=1811359620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XUlm4NrneVC0y0C2zaPfYIoy6URHchuBZBiAqmm9Mtw=;
 b=l8LzCLybOPhForX29QuPbKlR5dgdW8TnN80On75GQUssRuTHpTc6KvYL
 quMwridwUSl8cp4BhBM6U/ZSAKpK6bQH7LWs2QVFZPPXzxfOXFfXmqOaw
 OSc/0WFHwcV+SVe/iin9aCvko4lXc1BmY767lh7QKbUl+SbTu0rgGukaQ
 Qgt9ApQS8jUwOJlwBT8nVaozXutQHefDJMF4PUG8xMDWmeIQGnfFCvwdQ
 q+i7RvQbN2KKvst+zY0GszRDZwhL0LKk3xmdLOmIuIoUbrol59nyggz/w
 sXyvLKaFRq08wy6WgDIpwn2rb551uiH0m0gcSal3iExou90B/aym+PIOm Q==;
X-CSE-ConnectionGUID: t9i+EV0mTP+qRMomrkR4RA==
X-CSE-MsgGUID: PxfSkJG2TxuGdRpNMUpW+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91218974"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="91218974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:27:00 -0700
X-CSE-ConnectionGUID: otcDxWbUS1qr1hxlWJ2khw==
X-CSE-MsgGUID: Xy8XTRCcQROTVKafYqOzZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="235654051"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:26:59 -0700
Date: Tue, 26 May 2026 22:26:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/{i915,xe}: move xe_display_flush_cleanup_work()
 to i915 display
Message-ID: <ahXz_-57PY4HMymt@intel.com>
References: <7aecde385b66dbf7d0e61759528c6cd643581a3d.1778659089.git.jani.nikula@intel.com>
 <20260525110553.651208-1-jani.nikula@intel.com>
 <ahXaTZD-L-koRduP@intel.com>
 <75b8149df41c3d4f0665eec68d42829e44279230@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75b8149df41c3d4f0665eec68d42829e44279230@intel.com>
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

On Tue, May 26, 2026 at 09:09:28PM +0300, Jani Nikula wrote:
> On Tue, 26 May 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Mon, May 25, 2026 at 02:05:53PM +0300, Jani Nikula wrote:
> >> xe_display_flush_cleanup_work() is a bit of an oddball function in xe
> >> display code. There shouldn't be anything this specific or xe
> >> specific. While I'm not sure what the correct refactor for the function
> >> should be, move it to shared display code for starters, next to the
> >> eerily similar but slightly different intel_has_pending_fb_unpin() that
> >> is only called from i915 core.
> >> 
> >> The main goal here is to unblock some refactors on
> >> for_each_intel_crtc().
> >> 
> >> v2: Add FIXME comment (Ville)
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_display.c | 22 ++++++++++++++++
> >>  drivers/gpu/drm/i915/display/intel_display.h |  1 +
> >>  drivers/gpu/drm/xe/display/xe_display.c      | 27 +++-----------------
> >>  3 files changed, 26 insertions(+), 24 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> >> index 6c8935f69db1..a6cee0f81358 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >> @@ -737,6 +737,28 @@ bool intel_has_pending_fb_unpin(struct intel_display *display)
> >>  	return false;
> >>  }
> >>  
> >> +/* FIXME: All callers need to be audited and unified between i915 and xe */
> >
> > That makes me think we want to keep this. I was more thinking of
> > something like
> > /* FIXME remove this and just flush the cleanup wq where appropriate */
> 
> Fair enough. Can I push with that?

Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> >
> >> +void intel_display_flush_cleanup_work(struct intel_display *display)
> >> +{
> >> +	struct intel_crtc *crtc;
> >> +
> >> +	for_each_intel_crtc(display->drm, crtc) {
> >> +		struct drm_crtc_commit *commit;
> >> +
> >> +		spin_lock(&crtc->base.commit_lock);
> >> +		commit = list_first_entry_or_null(&crtc->base.commit_list,
> >> +						  struct drm_crtc_commit, commit_entry);
> >> +		if (commit)
> >> +			drm_crtc_commit_get(commit);
> >> +		spin_unlock(&crtc->base.commit_lock);
> >> +
> >> +		if (commit) {
> >> +			wait_for_completion(&commit->cleanup_done);
> >> +			drm_crtc_commit_put(commit);
> >> +		}
> >> +	}
> >> +}
> >> +
> >>  /*
> >>   * Finds the encoder associated with the given CRTC. This can only be
> >>   * used when we know that the CRTC isn't feeding multiple encoders!
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> >> index 45a90d2fe6ec..72f33113a5a3 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.h
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> >> @@ -402,6 +402,7 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state);
> >>  void i830_enable_pipe(struct intel_display *display, enum pipe pipe);
> >>  void i830_disable_pipe(struct intel_display *display, enum pipe pipe);
> >>  bool intel_has_pending_fb_unpin(struct intel_display *display);
> >> +void intel_display_flush_cleanup_work(struct intel_display *display);
> >>  void intel_encoder_destroy(struct drm_encoder *encoder);
> >>  struct drm_display_mode *
> >>  intel_encoder_current_mode(struct intel_encoder *encoder);
> >> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> >> index 8d08da60336d..a5066de3d789 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> @@ -244,27 +244,6 @@ static bool suspend_to_idle(void)
> >>  	return false;
> >>  }
> >>  
> >> -static void xe_display_flush_cleanup_work(struct xe_device *xe)
> >> -{
> >> -	struct intel_crtc *crtc;
> >> -
> >> -	for_each_intel_crtc(&xe->drm, crtc) {
> >> -		struct drm_crtc_commit *commit;
> >> -
> >> -		spin_lock(&crtc->base.commit_lock);
> >> -		commit = list_first_entry_or_null(&crtc->base.commit_list,
> >> -						  struct drm_crtc_commit, commit_entry);
> >> -		if (commit)
> >> -			drm_crtc_commit_get(commit);
> >> -		spin_unlock(&crtc->base.commit_lock);
> >> -
> >> -		if (commit) {
> >> -			wait_for_completion(&commit->cleanup_done);
> >> -			drm_crtc_commit_put(commit);
> >> -		}
> >> -	}
> >> -}
> >> -
> >>  static void xe_display_enable_d3cold(struct xe_device *xe)
> >>  {
> >>  	struct intel_display *display = xe->display;
> >> @@ -278,7 +257,7 @@ static void xe_display_enable_d3cold(struct xe_device *xe)
> >>  	 */
> >>  	intel_power_domains_disable(display);
> >>  
> >> -	xe_display_flush_cleanup_work(xe);
> >> +	intel_display_flush_cleanup_work(display);
> >>  
> >>  	intel_opregion_suspend(display, PCI_D3cold);
> >>  
> >> @@ -333,7 +312,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
> >>  		intel_display_driver_suspend(display);
> >>  	}
> >>  
> >> -	xe_display_flush_cleanup_work(xe);
> >> +	intel_display_flush_cleanup_work(display);
> >>  
> >>  	intel_encoder_block_all_hpds(display);
> >>  
> >> @@ -365,7 +344,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
> >>  		intel_display_driver_suspend(display);
> >>  	}
> >>  
> >> -	xe_display_flush_cleanup_work(xe);
> >> +	intel_display_flush_cleanup_work(display);
> >>  	intel_dp_mst_suspend(display);
> >>  	intel_encoder_block_all_hpds(display);
> >>  	intel_hpd_cancel_work(display);
> >> -- 
> >> 2.47.3
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
