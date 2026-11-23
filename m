Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4662606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuGvDukY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5489110E800;
	Mon, 23 Nov 2026 15:45:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6835410E800;
 Mon, 23 Nov 2026 15:45:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5071843D4E;
 Mon, 23 Nov 2026 15:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF32D1F000C4;
 Mon, 23 Nov 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795448747;
 bh=LOYnWkn7AHS00ZvRSqVZZhkIKGxyKSc8eYfs8segn9s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IuGvDukYuuH4l7LckqEbfqO4MdlRcGlg2FIz4A4kPjTckO6O17bAG0JnKCM3TTSWp
 XnqlHaj47/s/cZNQESQ/YIma9wYfI7HgEK0cRRw5+cxuD7SjIAtYwNs3ZZOujsHOsP
 FHaWNFszO1bRNNAZtrUCfZhHGhJsUD2AMEn23HGjlyhCM6zEYzUiYDDijRseufN7AK
 enVPjljr/0/k52geoE5rT5JROiBSe5fPPVxvzr8zdys7TXoZLJR/H3dblpSKqRfbW7
 lAI7w6WjkjqZcJj+s0v/sf5cqFZfHSlGmNe5hxN2JE3N5Q5LtEOsQszQZmzZZqvwyc
 4qb+tx48ot5Fg==
Message-ID: <sashiko-outbox-229600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
To: "Jake Steinman" <j@metarealtyinc.ca>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <ada2073fc66fa74685b73ac085513c5299b1526f.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
 <ada2073fc66fa74685b73ac085513c5299b1526f.1795263689.git.j@metarealtyinc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:45:46 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/psr: stale psr.disable_as_sdp_when_pr_active on
  seamless VRR toggle
--

commit 80915725d9b9cf87d3b5497256fb042ac9a0cf2a
Author: Jake Steinman <j@metarealtyinc.ca>

drm/i915/psr: Send the AS SDP in PR Active while frames are updating

This commit enables Adaptive Sync SDP transmission in Panel Replay Active on
frontbuffer flushes and suspends it again via delayed work after 6 idle
frames.  It also refines disable_as_sdp_when_pr_active so that it is disabl=
ed
when periodic AS SDP skip frames is enabled.

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index bd16563603249..8407b34f23934 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1704,10 +1704,38 @@ static inline bool compute_link_off_after_as_sdp_=
when_pr_active(struct intel_con
>  		DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP);
>  }
> =20
> -static inline bool compute_disable_as_sdp_when_pr_active(struct intel_co=
nnector *connector)
> +static bool compute_disable_as_sdp_when_pr_active(struct intel_dp *intel=
_dp,
> +						  const struct intel_crtc_state *crtc_state)
>  {
> -	return !(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PA=
NEL_REPLAY_CAP_CAPABILITY)] &
> -		 DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	const u8 *pr_dpcd =3D connector->dp.panel_replay_caps.dpcd;
> +
> +	if (pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
> +	    DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR)
> +		return false;
> +
> +	/* AS SDP skip frames needs the AS SDP to keep flowing in PR Active */
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		return false;

[ ... ]

> @@ -2211,6 +2280,9 @@ static void intel_psr_enable_locked(struct intel_dp=
 *intel_dp,
>  	intel_dp->psr.io_wake_lines =3D crtc_state->alpm_state.io_wake_lines;
>  	intel_dp->psr.fast_wake_lines =3D crtc_state->alpm_state.fast_wake_line=
s;
>  	intel_dp->psr.entry_setup_frames =3D crtc_state->entry_setup_frames;
> +	intel_dp->psr.disable_as_sdp_when_pr_active =3D
> +		crtc_state->disable_as_sdp_when_pr_active;
> +	intel_dp->psr.as_sdp_in_active =3D false;

[Severity: Medium]
Can intel_dp->psr.disable_as_sdp_when_pr_active become stale across a
seamless VRR fastset?

Because intel_alpm_pr_as_sdp_skip_frames_enabled() is gated on
!crtc_state->vrr.enable, toggling VRR when periodic AS SDP skip frames is
configured flips crtc_state->disable_as_sdp_when_pr_active between true (VRR
on) and false (VRR off).  During a seamless VRR transition, Panel Replay
stays enabled and intel_psr_post_plane_update() does not call
intel_psr_enable_locked(), so intel_dp->psr.disable_as_sdp_when_pr_active,
intel_dp->psr.as_sdp_in_active, and intel_dp->psr.as_sdp_work are not
updated to match the new crtc_state.

Even with the follow-up commit "drm/i915/alpm: Leave AS SDP Transmission in
Active Disable to PSR code" preserving
PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE in
intel_alpm_configure_pr_as_sdp() when skip_frames is 0, toggling VRR off
leaves intel_dp->psr.disable_as_sdp_when_pr_active set to true, so
intel_psr_pr_as_sdp_suspend_work() will set
PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE after 6 idle frames while
mutually exclusive PR_ALPM_CTL_AS_SDP_SKIP_FRAMES is enabled.  Conversely,
toggling VRR on leaves intel_dp->psr.disable_as_sdp_when_pr_active set to
false, so intel_psr_pr_as_sdp_flush_locked() never schedules as_sdp_work and
AS SDP transmission in PR Active remains permanently enabled when idle,
blocking DC5/DC6.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795263689.gi=
t.j@metarealtyinc.ca?part=3D2
