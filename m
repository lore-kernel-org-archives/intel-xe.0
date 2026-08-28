Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C352C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 18:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470F310E4B4;
	Fri, 28 Aug 2026 18:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rg5tVBxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8C210E47E;
 Fri, 28 Aug 2026 18:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787942266; x=1819478266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=utxp1Ma/kLUzAjxo/pQG41ONwJZA5bnfOJvjpoqha7s=;
 b=Rg5tVBxr3DxFZcKWNen+2FZQBQ9g5qyiectPxsbUjU9wQeis2tKn1mbh
 2OvCnGsRUUQG3CNgRGpALilv/aSlc7oKRlit9cfpMwuu2aOuOy//mL/qQ
 +7cv9EYBXg/QvQkn8gp+tbrUw7LLtQYNAVYTD70u/hcF3kTyhsTyPhKuX
 CRnyJxmGOL5yneeEkuAE+dESI4vSpe1EYxqj/BXfDD69JoJD4daKwPU4j
 M0bEboumYcdTEJTQ7WbIcW+Xe2U+b/KY90GsGsifCu11sc0BIBns/Zwo9
 hNfvQClZVuvC3xKdvqh+j9bYSm3H1bp6bfF5ld1O4YriAs2BHIWK5vgXz g==;
X-CSE-ConnectionGUID: DtZPiFKcTjS1v6pgMKCPaQ==
X-CSE-MsgGUID: DUBjCmUaSCOddj/CTHfhuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="90967755"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="90967755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:37:45 -0700
X-CSE-ConnectionGUID: L46A7WsRQaCfQiZWsvNvUA==
X-CSE-MsgGUID: HvorVwHSTsqHLb65DacJTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="273492159"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.161])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:37:44 -0700
Date: Fri, 28 Aug 2026 21:37:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915/display: Flush frontbuffer tracking on
 flipq completion
Message-ID: <apHVdiWPxaDwPQR3@intel.com>
References: <20260807121540.2032283-1-mika.kahola@intel.com>
 <20260807121540.2032283-2-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807121540.2032283-2-mika.kahola@intel.com>
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

On Fri, Aug 07, 2026 at 12:15:38PM +0000, Mika Kahola wrote:
> Flipq commits execute asynchronously via the pipe DMC, but we don't
> notify frontbuffer tracking when they actually complete. A CRC grabbed
> right after can therefore observe stale state (kms_cursor_crc's
> cursor-alpha-opaque hits this).

There's nothing special about flipq vs. commit completion. The interrupt
is supposed to fire on the delayed vblank after the flip has executed.

> Stash the fb_bits on the crtc when arming the commit, and flush
> frontbuffer/FBC from a worker once intel_dsb_irq_handler() sees the
> completion interrupt. Can't call these directly from there, it's
> hardirq context and they may sleep.
> 
> Also flush (rather than drop) any pending completion when the crtc
> gets disabled out from under it.
> 
> Assisted-by: Copilot:claude-sonnet-5
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crtc.c     |  3 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +
>  .../drm/i915/display/intel_display_types.h    |  9 +++
>  drivers/gpu/drm/i915/display/intel_dsb.c      | 65 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dsb.h      |  2 +
>  drivers/gpu/drm/i915/display/intel_fbc.c      | 21 ++++++
>  drivers/gpu/drm/i915/display/intel_fbc.h      |  1 +
>  7 files changed, 104 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 10ed9bdfee76..71559f86fa63 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -25,6 +25,7 @@
>  #include "intel_display_trace.h"
>  #include "intel_display_types.h"
>  #include "intel_drrs.h"
> +#include "intel_dsb.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_parent.h"
> @@ -341,6 +342,8 @@ static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
>  	crtc->pipe = pipe;
>  	crtc->num_scalers = DISPLAY_RUNTIME_INFO(display)->num_scalers[pipe];
>  
> +	intel_dsb_crtc_init(crtc);
> +
>  	if (DISPLAY_VER(display) >= 9)
>  		primary = skl_universal_plane_create(display, pipe, PLANE_1);
>  	else
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 829d7a411dcc..5cdaa59f005e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6889,6 +6889,8 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>  	if (new_crtc_state->use_flipq) {
>  		intel_flipq_enable(new_crtc_state);
>  
> +		crtc->flipq_fb_bits = new_crtc_state->fb_bits;
> +
>  		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
>  
>  		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
> @@ -6969,6 +6971,7 @@ static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
>  			intel_atomic_get_new_crtc_state(state, pipe_crtc);
>  
>  		pipe_crtc->active = false;
> +		intel_dsb_crtc_disable(pipe_crtc);
>  		intel_fbc_disable(pipe_crtc);
>  
>  		if (!new_pipe_crtc_state->hw.active)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 20a07ea06b5e..c644ca0fe9b8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1522,6 +1522,15 @@ struct intel_crtc {
>  	struct drm_pending_vblank_event *dsb_event;
>  	/* armed event for flip queue based updates */
>  	struct drm_pending_vblank_event *flipq_event;
> +	/*
> +	 * Frontbuffer bits for a pending flipq/DSB-driven visible update.
> +	 */
> +	unsigned int flipq_fb_bits;
> +	/*
> +	 * intel_dsb_irq_handler() runs in hardirq context, so the
> +	 * frontbuffer/FBC flush for flipq_fb_bits is deferred to this worker.
> +	 */
> +	struct work_struct flipq_fb_bits_work;
>  
>  	/* Access to these should be protected by display->irq.lock. */
>  	bool cpu_fifo_underrun_disabled;
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index d9a270362a82..66f107493f93 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -17,6 +17,8 @@
>  #include "intel_display_types.h"
>  #include "intel_dsb.h"
>  #include "intel_dsb_regs.h"
> +#include "intel_fbc.h"
> +#include "intel_frontbuffer.h"
>  #include "intel_psr.h"
>  #include "intel_vblank.h"
>  #include "intel_vrr.h"
> @@ -1106,6 +1108,59 @@ void intel_dsb_cleanup(struct intel_dsb *dsb)
>  	kfree(dsb);
>  }
>  
> +/*
> + * Frontbuffer/FBC bookkeeping for a completed flipq commit may sleep (takes
> + * mutexes), but intel_dsb_irq_handler() runs in hardirq context, so do it
> + * here instead, on display->wq.unordered.
> + */
> +static void intel_dsb_flipq_fb_bits_work(struct work_struct *work)
> +{
> +	struct intel_crtc *crtc =
> +		container_of(work, typeof(*crtc), flipq_fb_bits_work);
> +	struct intel_display *display = to_intel_display(crtc);
> +	unsigned int flipq_fb_bits;
> +
> +	spin_lock_irq(&display->drm->event_lock);
> +	flipq_fb_bits = crtc->flipq_fb_bits;
> +	crtc->flipq_fb_bits = 0;
> +	spin_unlock_irq(&display->drm->event_lock);
> +
> +	if (!flipq_fb_bits)
> +		return;
> +
> +	intel_frontbuffer_flip(display, flipq_fb_bits);
> +	intel_fbc_flipq_post_update(display, crtc->pipe);
> +}
> +
> +/**
> + * intel_dsb_crtc_init - Initialize the per-CRTC DSB/flipq worker state.
> + * @crtc: the CRTC
> + */
> +void intel_dsb_crtc_init(struct intel_crtc *crtc)
> +{
> +	INIT_WORK(&crtc->flipq_fb_bits_work, intel_dsb_flipq_fb_bits_work);
> +}
> +
> +/**
> + * intel_dsb_crtc_disable - Drop any stale pending flipq FBC completion.
> + * @crtc: the CRTC
> + *
> + * A flipq commit's completion (and hence its deferred frontbuffer/FBC
> + * flush) can still be outstanding when @crtc gets disabled, eg. across a
> + * modeset. Cancel and discard it so it can't run later against whatever
> + * @crtc is reconfigured to next.
> + */
> +void intel_dsb_crtc_disable(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +
> +	cancel_work_sync(&crtc->flipq_fb_bits_work);
> +
> +	spin_lock_irq(&display->drm->event_lock);
> +	crtc->flipq_fb_bits = 0;
> +	spin_unlock_irq(&display->drm->event_lock);
> +}
> +
>  void intel_dsb_irq_handler(struct intel_display *display,
>  			   enum pipe pipe, enum intel_dsb_id dsb_id)
>  {
> @@ -1130,6 +1185,16 @@ void intel_dsb_irq_handler(struct intel_display *display,
>  		}
>  
>  		spin_unlock(&display->drm->event_lock);
> +
> +		/*
> +		 * Flipq-driven commits complete asynchronously via DSB/DMC.
> +		 * Notify frontbuffer/FBC tracking only once the queued update
> +		 * has actually completed. The unlocked peek is just to avoid
> +		 * pointlessly queueing work; intel_dsb_flipq_fb_bits_work()
> +		 * re-checks flipq_fb_bits under event_lock.
> +		 */
> +		if (READ_ONCE(crtc->flipq_fb_bits))
> +			queue_work(display->wq.unordered, &crtc->flipq_fb_bits_work);
>  	}
>  
>  	errors = tmp & dsb_error_int_status(display);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
> index 3dcca9ed5371..86d4111c1850 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.h
> @@ -73,5 +73,7 @@ void intel_dsb_wait(struct intel_dsb *dsb);
>  
>  void intel_dsb_irq_handler(struct intel_display *display,
>  			   enum pipe pipe, enum intel_dsb_id dsb_id);
> +void intel_dsb_crtc_init(struct intel_crtc *crtc);
> +void intel_dsb_crtc_disable(struct intel_crtc *crtc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index f61b4a218d6e..05a26d991cd2 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1930,6 +1930,27 @@ void intel_fbc_post_update(struct intel_atomic_state *state,
>  	}
>  }
>  
> +/*
> + * Flipq commits complete asynchronously, well after intel_fbc_post_update()
> + * already ran against the not-yet-latched surface. Re-run the post-update
> + * step for @pipe's FBC once the queued commit has actually completed, so any
> + * flip nuke recompresses the surface that is really being scanned out.
> + */
> +void intel_fbc_flipq_post_update(struct intel_display *display, enum pipe pipe)
> +{
> +	struct intel_fbc *fbc = intel_fbc_for_pipe(display, pipe);
> +
> +	if (!fbc)
> +		return;
> +
> +	mutex_lock(&fbc->lock);
> +
> +	if (fbc->state.plane && fbc->state.plane->pipe == pipe)
> +		__intel_fbc_post_update(fbc);
> +
> +	mutex_unlock(&fbc->lock);
> +}
> +
>  static unsigned int intel_fbc_get_frontbuffer_bit(struct intel_fbc *fbc)
>  {
>  	if (fbc->state.plane)
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
> index 6c96d690a2f5..ba7b93eb1424 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.h
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.h
> @@ -34,6 +34,7 @@ bool intel_fbc_pre_update(struct intel_atomic_state *state,
>  			  struct intel_crtc *crtc);
>  void intel_fbc_post_update(struct intel_atomic_state *state,
>  			   struct intel_crtc *crtc);
> +void intel_fbc_flipq_post_update(struct intel_display *display, enum pipe pipe);
>  void intel_fbc_init(struct intel_display *display);
>  void intel_fbc_cleanup(struct intel_display *display);
>  void intel_fbc_sanitize(struct intel_display *display);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
