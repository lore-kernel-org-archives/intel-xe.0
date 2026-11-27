Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F2606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZdC2jM6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6D1112C5F;
	Fri, 27 Nov 2026 17:18:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878410E5FD;
 Fri, 27 Nov 2026 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795799903; x=1827335903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WXuRrbHBShkZE/lOYhlSTAGpvrsA9/uipT2FdNlf5dI=;
 b=nZdC2jM6yAoV1uKkwww7slp1ENeCpt3cdxddK6KayCgc57ynxXiVKDD+
 UxLKB9fpMyoOtXLzCZl8KRBHh5izbC8leqLq72XsSvqaRu3EZrj8uwONU
 TLCYTx7aWTCNixrKxvmPBujS5q0/G7ex0RNhWOWxRBilRbqDo1VzfChhx
 LA8Bh/GNChTmNC2KeSlF0w8RbIHX4L76uJ/rZaxaNSD7J3gP79hrDp6tz
 GFfKDt0/C56RJWOQ5jEfnWk5kqKIZCuGyWI4MbUpxy09enYdzvrQayLOW
 wiqwBubSo6aq6vS9zqD7bxwtdKDKBXAJPV9Ey0wPwPnv6GMdZQFqYlC7r g==;
X-CSE-ConnectionGUID: DExoeD/9QTSQeZ21MJ/toA==
X-CSE-MsgGUID: TVSNySrSQ9qmgyoPRe9aHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4781340"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4781340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 09:18:23 -0800
X-CSE-ConnectionGUID: KOqR/M/KT/amCfklLJu5lQ==
X-CSE-MsgGUID: pL/QeKmTQS+ysGVuBrsLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12788204"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 09:18:20 -0800
Date: Fri, 27 Nov 2026 19:18:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com
Subject: Re: [PATCH] drm/i915/display: Leave the PSR frame change to the
 joiner primary
Message-ID: <awm7WYkMeMlyjkgr@intel.com>
References: <20261127160235.3208777-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261127160235.3208777-1-mika.kahola@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 04:02:35PM +0000, Mika Kahola wrote:
> With PSR2 on joined pipes the secondary's DSB also sends the trans push
> and polls the PSR2 status of the primary's transcoder. The poll gets no
> response and the DSB times out:
> 
>  [CRTC:354:pipe B] DSB 0 response timeout
>  [CRTC:354:pipe B] DSB 0 timed out waiting for idle (current head=0x140, head=0x0, tail=0x180)
> 
> Both are per transcoder and the primary already does them. Skip them
> on the secondary when the primary is in the same commit.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 19caae633d29..f9d0a5972feb 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7649,6 +7649,11 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>  
>  	if (new_crtc_state->commit_type == INTEL_COMMIT_DSB &&
>  	    !intel_color_uses_chained_dsb(new_crtc_state)) {
> +		struct intel_crtc *primary_crtc = intel_primary_crtc(new_crtc_state);
> +		/* One transcoder: the joiner primary pushes and waits for PSR */
> +		bool via_primary = primary_crtc != crtc &&
> +			intel_atomic_get_new_crtc_state(state, primary_crtc);

We have a real function somewhere to check if the crtc is the
primary or not. That should be all you need.

But we really need to rewrite all this joiner+psr stuff to do things
in a proper way. Right now all of this is just a hack that provides 
no guarantees that things get committed in the right order or that
the push is the last thing we do.

> +
>  		/*
>  		 * Dsb wait vblank may or may not skip. Let's remove it for PSR
>  		 * trans push case to ensure we are not waiting two vblanks
> @@ -7656,7 +7661,8 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>  		if (!intel_psr_use_trans_push(new_crtc_state))
>  			intel_dsb_wait_vblanks(new_crtc_state->dsb_commit, 1);
>  
> -		intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
> +		if (!via_primary)
> +			intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
>  
>  		/*
>  		 * Wait for idle is needed for corner case where PSR HW
> @@ -7665,8 +7671,9 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
>  		 * here for both Frame Change mechanism (trans push
>  		 * and register write).
>  		 */
> -		intel_psr_wait_for_idle_dsb(new_crtc_state->dsb_commit,
> -					    new_crtc_state);
> +		if (!via_primary)
> +			intel_psr_wait_for_idle_dsb(new_crtc_state->dsb_commit,
> +						    new_crtc_state);
>  
>  		/*
>  		 * In case PSR uses trans push as a "frame change" event and
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
