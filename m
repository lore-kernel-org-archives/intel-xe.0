Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF8606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mQA27X0U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC30E10EDAF;
	Mon,  2 Nov 2026 13:12:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A711610E29F;
 Mon,  2 Nov 2026 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793625166; x=1825161166;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QG4eN9IXzBScnQnZOC1ouVSGeruX5PMf+/CiBmKHJo4=;
 b=mQA27X0UHan3VBzm2ucF7SYLMMjzt9+2i6kU0z93G4ryLXLkd/gTQBEp
 0NaohYoTnNmfTtjfDE686fYn4sUMLN6S/uvzotEy3fjIJyK3p3tAJKz90
 BrbepnO/3lvx6ptxzQFL4lDSGMCyVXEqxUOk+1JhMvfPEW8uDUmqn1Qvg
 p4MJY3/NcsBK1kuZc41XFTge4vP2f9NOvg/If8MvWXiFV+2r0KxTfQfdH
 c4Lc2tyR//Jz//2h2830fqda8Tn2hDwDKVoh5CJDajF1vA1IjRJ7fRdgU
 TE14YgBFcYW2cXoQCppBJXlK62BzNNrtzYGAXPHWc1bUUFvANgbwAQhK4 Q==;
X-CSE-ConnectionGUID: 81eKeB6rQmOp6J/OrpS1Rg==
X-CSE-MsgGUID: eIxBpRDjTOCVKYZA8e2GqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2330643"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2330643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 05:12:46 -0800
X-CSE-ConnectionGUID: UATh0qTZSQGFAfYoRnKinA==
X-CSE-MsgGUID: g1ZYvPJORyi25r9lIDtlEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5970099"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 05:12:44 -0800
Date: Mon, 2 Nov 2026 15:12:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/10] drm/i915: Fix FEC wait with port sync on pre-LNL
Message-ID: <auiMSZWL3hqPDMdp@intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-10-ville.syrjala@linux.intel.com>
 <sashiko-outbox-191346@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-191346@kernel.org>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 05:29:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915/ddi: LNL vs PTL version mismatch in FEC status wait comment and check
> --
> 
> commit c0a68d9ab06674ed868f492b35dc93f1dc05b1bf
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915: Fix FEC wait with port sync on pre-LNL
> 
> This commit defers waiting for FEC status in intel_ddi_enable() until after
> the timing generators have started, and adds a helper to wait for FEC status
> across all synced transcoders when port sync is enabled.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index 9939fa43e8f73..2e7f278a1b6c6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> 
> [ ... ]
> 
> > @@ -3623,6 +3654,16 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
> >  	else
> >  		intel_crtc_vblank_on(state, crtc_state);
> >  
> > +	/*
> > +	 * On pre-LNL FEC_DECODE_EN will only be sent when the timing
> > +	 * generator starts. Also note that FEC_DECODE_EN cannot be
> > +	 * re-sent without restarting the timing generator.
> > +	 */
> > +	if (is_trans_port_sync_mode(crtc_state))
> > +		trans_port_sync_wait_for_fec_status(state, encoder, crtc_state, true);
> > +	else
> > +		intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
> 
> [Severity: Medium]
> Should the comment here (and the commit message) refer to pre-PTL and PTL+
> rather than pre-LNL and LNL+, or should the version check in
> intel_ddi_enable_fec() be updated?

PTL+ is actually where this changed. I misread the check in
intel_ddi_enable_fec(). And that also explains why I was still seeing
the timing generator dependency on LNL. After further testing, on PTL
the dependency is truly gone.

> 
> The commit message and the comment in intel_ddi_enable() state that on LNL+
> FEC_DECODE_EN is sent immediately when enabling FEC in DP_TP_CTL, and that
> LNL+ therefore checks FEC status immediately in intel_ddi_enable_fec() and
> then a second time here in intel_ddi_enable().
> 
> However, intel_ddi_enable_fec() skips the immediate check and retry loop on
> DISPLAY_VER < 30:
> 
> drivers/gpu/drm/i915/display/intel_ddi.c:intel_ddi_enable_fec() {
> 	...
> 	intel_de_rmw(display, dp_tp_ctl_reg(encoder, crtc_state),
> 		     0, DP_TP_CTL_FEC_ENABLE);
> 
> 	if (DISPLAY_VER(display) < 30)
> 		return;
> 
> 	ret = intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
> 	...
> }
> 
> Since LNL is DISPLAY_VER 20 and PTL is DISPLAY_VER 30, LNL returns early in
> intel_ddi_enable_fec() without waiting for FEC status, and port sync is also
> enabled up through DISPLAY_VER 20 in intel_ddi_port_sync_transcoders():
> 
> drivers/gpu/drm/i915/display/intel_ddi.c:intel_ddi_port_sync_transcoders() {
> 	/*
> 	 * We don't enable port sync on BDW due to missing w/as and
> 	 * due to not having adjusted the modeset sequence appropriately.
> 	 */
> 	if (!IS_DISPLAY_VER(display, 9, 20))
> 		return 0;
> 	...
> }
> 
> Is intel_ddi_enable_fec() supposed to check DISPLAY_VER(display) < 20 for
> LNL+, or was the description intended to say pre-PTL / PTL+?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030171327.29829-1-ville.syrjala@linux.intel.com?part=9

-- 
Ville Syrjälä
Intel
