Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A9606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKHR6GeT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531310E206;
	Fri, 30 Oct 2026 18:24:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553B10E040;
 Fri, 30 Oct 2026 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793384641; x=1824920641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GymjuedmgJLKOHNYZxEWNc+4BHzoSrfxEVXprBRVUXs=;
 b=eKHR6GeTldJsWQspuRov5sqqZeEHC/m7NNZ2NMcRwWQfHUchlAxELL6w
 iI96sdHrgabx49L6bXtNW2GWyI7upJYRbPkHqn/MNhIw939bHQD/5Oi/B
 dJ1moiNhkYvbN4OBKe9GpQCMuhxf+09zrBs4vyya/rkT2SJaiOyMCapik
 qIR6b6l3DR9Z80J1GWvbeKtbPuQ8B/IPZuXZvgBNCgVy6WlcY0l6JC6WC
 KbwnUJTGyJcUkLPB8paaOdexwYH9WzL6ksziTa5DCmcj6HGi0wD7XwdM+
 5cmfbDOn7JvsPbL1yMNtPbYhVr5DeFH6Jf5CnU+FJoCbDAZ5y3TfReZp5 g==;
X-CSE-ConnectionGUID: UnkoG3NkSJKfCZYZfaQyLg==
X-CSE-MsgGUID: 0hh0Ow08Qwq2CjvZvSb1nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2039498"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2039498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 11:24:01 -0700
X-CSE-ConnectionGUID: EPry4q3/TPmJWnEb/v5x5g==
X-CSE-MsgGUID: j4GXRvV+SWa8yORUx0svxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5841358"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 11:23:59 -0700
Date: Fri, 30 Oct 2026 20:23:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/10] drm/i915: Allow joiner with port sync
Message-ID: <auTgvDNCV8npWtiq@intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-11-ville.syrjala@linux.intel.com>
 <sashiko-outbox-191352@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-191352@kernel.org>
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

On Fri, Oct 30, 2026 at 05:38:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/i915: port sync dropped when joiner secondary CRTC triggers modeset
> --
> 
> commit e8591be1b66ac026c8025978e792560a0337567b
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915: Allow joiner with port sync
> 
> This commit removes the check preventing pipes using joiner from entering
> port sync mode now that modeset enable and disable sequences iterate in
> pipe/transcoder order.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index 2e7f278a1b6c6..3be5b429ac876 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -4675,14 +4675,8 @@ static bool m_n_equal(const struct intel_link_m_n *m_n_1,
> >  static bool crtcs_port_sync_compatible(const struct intel_crtc_state *crtc_state1,
> >  				       const struct intel_crtc_state *crtc_state2)
> >  {
> > -	/*
> > -	 * FIXME the modeset sequence is currently wrong and
> > -	 * can't deal with joiner + port sync at the same time.
> > -	 *
> > -	 * TODO VRR + port sync needs special handling
> > -	 */
> > +	/* TODO VRR + port sync needs special handling */
> >  	return crtc_state1->hw.active && crtc_state2->hw.active &&
> > -		!crtc_state1->joiner_pipes && !crtc_state2->joiner_pipes &&
> 
> [Severity: High]
> Can allowing joiner with port sync here cause port sync to be dropped when an
> atomic commit triggers a modeset via a joiner secondary CRTC?
> 
> In drivers/gpu/drm/i915/display/intel_display.c:intel_atomic_check(),
> drm_atomic_helper_check_modeset() runs connector atomic_check callbacks
> before intel_atomic_check_config_and_link() pulls in joined CRTCs:
> 
> 	ret = drm_atomic_helper_check_modeset(dev, &state->base);
> 	if (ret)
> 		goto fail;
> 	...
> 	ret = intel_atomic_check_config_and_link(state);
> 
> Suppose a joined CRTC pair (primary Pipe A and secondary Pipe B) is active in
> port sync mode with a peer CRTC (Pipe C). If userspace submits an atomic
> commit targeting the joiner secondary CRTC (Pipe B, which has uapi.enable ==
> false and no uapi connectors) that sets uapi.mode_changed = true in
> intel_atomic_check() (for example by changing scaling_filter,
> sharpness_strength, or vrr_enabled, or clearing inherited on the first
> userspace commit), drm_atomic_helper_check_modeset() runs while neither Pipe
> A nor its connector is in the atomic state.
> 
> Later, intel_atomic_check_config_and_link() -> intel_atomic_check_config() ->
> intel_joiner_add_affected_crtcs() adds Pipe A, sets Pipe A's
> uapi.mode_changed = true, and adds Pipe A's connector:
> 
> 	for_each_intel_crtc_in_pipe_mask(display, crtc, modeset_pipes) {
> 		int ret;
> 
> 		crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
> 
> 		crtc_state->uapi.mode_changed = true;
> 
> 		ret = drm_atomic_add_affected_connectors(&state->base, &crtc->base);
> 
> Because drm_atomic_helper_check_modeset() has already finished,
> intel_dp_connector_atomic_check() -> intel_modeset_tile_group() and
> intel_modeset_synced_crtcs() never run for Pipe A's connector, so Pipe C and
> its connector are never added to the atomic state.
> 
> When intel_modeset_pipe_config_late() -> intel_ddi_compute_config_late() ->
> intel_ddi_port_sync_transcoders() subsequently iterates over connectors in
> the atomic state:
> 
> 	for_each_new_connector_in_state(&state->base, connector, conn_state, i) {
> 		struct intel_crtc *crtc = to_intel_crtc(conn_state->crtc);
> 		const struct intel_crtc_state *crtc_state;
> 
> it only sees Pipe A's connector, leaving master_transcoder =
> INVALID_TRANSCODER and sync_mode_slaves_mask = 0 on Pipe A.
> 
> In intel_crtc_check_fastset(), intel_pipe_config_compare() then sees the
> mismatch in master_transcoder or sync_mode_slaves_mask against old_crtc_state
> and forces a full modeset on Pipe A and Pipe B without Pipe C in the commit.
> If Pipe A was the port sync master, Pipe C's hardware transcoder remains
> active and enslaved to TRANSCODER_A while TRANSCODER_A is disabled and
> re-enabled, and bdw_get_trans_port_sync_config() during
> intel_modeset_verify_crtc() reads back a non-zero sync_mode_slaves_mask,
> triggering INTEL_DISPLAY_STATE_WARN in verify_crtc_state().

Hmm, I think this could even happen without joiner, if the
connectors' tile groups have somehow changed so that they
no longer match.

I suppose what we actually need is a port_sync_add_affected_crtcs().
Need to think if I can do that without causing extra fastsets on
all the synced crtcs when one of them needs a fastset...

-- 
Ville Syrjälä
Intel
