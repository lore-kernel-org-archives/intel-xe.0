Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E9C606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hz/zRWhY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A0E10ED74;
	Mon, 19 Oct 2026 17:04:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7815F10EA87;
 Mon, 19 Oct 2026 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792429477; x=1823965477;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OYsqiTy1as36e8iuNKY9sJNL1zVrZRWtl7inaT9JZc8=;
 b=hz/zRWhYtU0yM7N6Gq/sXTULMtlHbbVmz5p4ltE4WnRIRDEyuqVDWN7k
 zqOjl7scfWBSfiwmE2gegFPUd22mvUIIeB+iMEldaLvN9WWHIvwFmirJS
 2MtnGnmn4buupq0CmDe26bP6yHWaRhZyorETRMQENaYHKzlCu+Wmm2N+0
 AfIkAkXke3mWXcM34Tn9hZwjRS1rC3DuL8SHiLfFWTcykrUOAcuwggLzo
 muukrptlKEh1z49dMlJAklJAmsvJmBY/YhmLqtumenlN97uFoJhyRyLTU
 sCvGopi0W/XDE9IaAIvXG5vgXgUqMDi/ZFaOcLUvTrMlboULmzOUZB2z4 Q==;
X-CSE-ConnectionGUID: ZbWTH5SXR8uce95rzsBuhQ==
X-CSE-MsgGUID: XtFCdDDWTtuVaht/EotjUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1129796"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1129796"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:04:36 -0700
X-CSE-ConnectionGUID: MdNNotMgSZmt7ndpfRsjUA==
X-CSE-MsgGUID: nwQB9BIqQDan06GPFePCVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4419742"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:04:35 -0700
Date: Mon, 19 Oct 2026 20:04:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/15] drm/i915/pfit: Extract i965_pfit_get_config()
Message-ID: <atZNoEQhMGCAT544@intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-7-ville.syrjala@linux.intel.com>
 <46d5472ad05b1bffc3580dc5cb3194aa0e966446@intel.com>
 <664fe508a0ee588da0b936660fb1136b61ce2541@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <664fe508a0ee588da0b936660fb1136b61ce2541@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 07:05:05PM +0300, Jani Nikula wrote:
> On Mon, 19 Oct 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>
> >> Split i965_pfit_get_config() out from i9xx_pfit_get_config() to
> >> unconfuse things a bit.
> >>
> >> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_pfit.c | 66 ++++++++++++++---------
> >>  1 file changed, 42 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> >> index 972218346362..82804159d0a1 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> >> @@ -720,39 +720,52 @@ void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
> >>  	intel_de_write(display, PFIT_CONTROL(display), 0);
> >>  }
> >>  
> >> -static bool i9xx_has_pfit(struct intel_display *display)
> >> -{
> >> -	if (display->platform.i830)
> >> -		return false;
> >> -
> >> -	return DISPLAY_VER(display) >= 4 ||
> >> -		display->platform.pineview || display->platform.mobile;
> >> -}
> >> -
> >> -static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
> >> +static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
> >>  {
> >>  	struct intel_display *display = to_intel_display(crtc_state);
> >>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> >>  	enum pipe pipe;
> >>  	u32 tmp;
> >>  
> >> -	if (!i9xx_has_pfit(display))
> >> -		return;
> >> -
> >>  	tmp = intel_de_read(display, PFIT_CONTROL(display));
> >>  	if (!(tmp & PFIT_ENABLE))
> >>  		return;
> >>  
> >>  	/* Check whether the pfit is attached to our pipe. */
> >> -	if (DISPLAY_VER(display) >= 4)
> >> -		pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> >> -	else
> >> -		pipe = PIPE_B;
> >> -
> >> +	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> >>  	if (pipe != crtc->pipe)
> >>  		return;
> >>  
> >>  	crtc_state->gmch_pfit.control = tmp;
> >
> > This drops PFIT_PGM_RATIOS read.
> 
> Judging by the next patch, this is intentional. Should be mentioned in
> the commit message, and why it's okay we're still writing the register
> also for i965.

Yeah, we don't use programmed scale factors on i965+ and reading
the register just gives back the automagic ratios that the hardware
calculated (and some of which is garbage in the letterbox/pillabox
modes).

-- 
Ville Syrjälä
Intel
