Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D0CA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 12:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33F410E039;
	Tue,  6 Oct 2026 12:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EM6JzR7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADDC10E039;
 Tue,  6 Oct 2026 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791290747; x=1822826747;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+bRZcjDy5s6h5nBSTgAqfiugY4j3y4nsHnYwwPkw1Z4=;
 b=EM6JzR7qX/DW8WQLKuBqTLHW6XfAZ9R4vHkUJh+t+IKWonIxGd1zIYAh
 LRoqnUFjI4apu4K0tGe/aui1ozQVQLZKa5mNnBb3PR6ZIFAy+KWhqUWy/
 kCkELFJuYFplj8Xit/oTMbdC0XMnZYVckG+tTc6tnBwpdUWJgk81LyOaB
 sHOy405q9cJMtkIY2NAGiBLw5JUkfrYwxP1li3sg21HSLP6q32AqBvqBO
 oIdj9ftEe91YkHBwxR7g2qh1QVPRx2znoga762fd1Ygp7LVgQ1/Os5bJq
 V3w8y44fShNWJlqZDMx7tOUmZabVM9Ic8uern/g4OB4ru6rDjk00YUr1q Q==;
X-CSE-ConnectionGUID: fSM8PsWTR9upAr1ts8y/jg==
X-CSE-MsgGUID: ot66bKXLSaWVCyoRFzRcsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101300220"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="101300220"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:45:46 -0700
X-CSE-ConnectionGUID: 0VrvNdaaRXmSCkHcLtMGQA==
X-CSE-MsgGUID: Dj4/Q4mQQFSswVhr5sLa0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1236218"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.119])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:45:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/dp: only complain about a busy AUX engine
 when it's unexpected
In-Reply-To: <20261005122302.110968-3-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261005122302.110968-1-luciano.coelho@intel.com>
 <20261005122302.110968-3-luciano.coelho@intel.com>
Date: Tue, 06 Oct 2026 15:45:43 +0300
Message-ID: <7310e6ffaae834a2e822bba31c3ef70647ff7d0b@intel.com>
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

On Mon, 05 Oct 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> When intel_dp_aux_xfer() gives up on a transaction because the AUX
> engine is still busy, the DRM helpers retry almost immediately.  If
> the engine still hasn't recovered by then, the pre-transaction busy
> check reports "not started" as an error, even though this is the
> expected outcome of our own earlier decision to leave the engine
> alone.
>
> Remember that we left the engine busy and only log a debug message in
> that case.  Keep the error for the unexpected cases, namely when
> someone else is using the channel or the engine is hung without us
> having given up on it first.  A permanently hung engine is still
> reported by the 100ms timeout error.
>
> Assisted-by: LLM
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        | 14 +++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 0e3083e852d5..1987b2dbd151 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1891,6 +1891,8 @@ struct intel_dp {
>  	struct drm_dp_desc desc;
>  	struct drm_dp_aux aux;
>  	u32 aux_busy_last_status;
> +	/* we left the AUX engine busy and are waiting for it to recover */
> +	bool aux_left_busy;

I don't know whether the series makes sense or not, but at some point I
need to put my foot down, might as well be now, that struct intel_dp has
grown big enough that we can no longer add individual members and there
needs to be more structure. For example sub-struct for aux. This is
getting impossible to maintain.

BR,
Jani.

>  	u8 train_set[4];
>  
>  	struct intel_pps pps;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 2e8261cd641a..d0d37ef7556f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -359,7 +359,16 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	if (try == 3) {
>  		const u32 status = intel_de_read(display, ch_ctl);
>  
> -		if (status != intel_dp->aux_busy_last_status) {
> +		/*
> +		 * If we left the engine busy ourselves, this is expected
> +		 * while it recovers.  Otherwise someone else is using the
> +		 * channel or the engine is hung.
> +		 */
> +		if (intel_dp->aux_left_busy) {
> +			drm_dbg_kms(display->drm,
> +				    "%s: not started, still waiting for the AUX engine to recover (status 0x%08x)\n",
> +				    intel_dp->aux.name, status);
> +		} else if (status != intel_dp->aux_busy_last_status) {
>  			drm_err(display->drm,
>  				"%s: not started (status 0x%08x)\n",
>  				intel_dp->aux.name, status);
> @@ -370,6 +379,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  		goto out;
>  	}
>  
> +	intel_dp->aux_left_busy = false;
> +
>  	/* Only 5 data registers! */
>  	if (drm_WARN_ON(display->drm, send_bytes > 20 || recv_size > 20)) {
>  		ret = -E2BIG;
> @@ -402,6 +413,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  			 * alone, the caller will retry the transaction later.
>  			 */
>  			if (status & DP_AUX_CH_CTL_SEND_BUSY) {
> +				intel_dp->aux_left_busy = true;
>  				ret = -EBUSY;
>  				goto out;
>  			}

-- 
Jani Nikula, Intel
