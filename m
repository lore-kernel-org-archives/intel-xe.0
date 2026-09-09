Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FF5C79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 08:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EB910EFA4;
	Wed,  9 Sep 2026 08:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AFLrbGbU";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D46010EFA4;
 Wed,  9 Sep 2026 08:02:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CB344344A;
 Wed,  9 Sep 2026 08:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE1B1F00A3A;
 Wed,  9 Sep 2026 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788940923;
 bh=84ZCRp5wXloqtwrHyXi6K7wziJqyGPc6kschY7fQDmg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=AFLrbGbUOVsxcuOWXww1dYjaq+6frWVfSM7Ua0uwWTIut6xk53nDw0itrUFI7WcJM
 c+67j263tVFZPQcslCDfwePJ4YOnjtaq14wNoUDfARVK3QqMPgmadLsvThtA1AFixz
 0lEH2EEpSXbmdx7u2CIoOZTp2Ra7XaAg7lNHGiLhBKof1YZcFCc6/1dkNQAFrHPFpr
 a81101cAxO2FnmgqU4QCXnnaxCDRtUL+Eq4gJT5SUz/A+m0Byj/WLCMa5utFri7D4d
 Yf9kl9vuJ9MwFIjG0BuvKrx0MQXjDiQPStF+Yh4vBdCvm8VFIRkKsTEtr7ePcODsGi
 R1W+G+Qi48Wgg==
From: sashiko-bot@kernel.org
Subject: Re: [v5 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260909080810.2202879-3-uma.shankar@intel.com>
References: <20260909080810.2202879-1-uma.shankar@intel.com>
 <20260909080810.2202879-3-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:02:03 +0000
Message-Id: <20260909080203.AFE1B1F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless access to `crtc->base.state` in `intel_display_power_dc3c=
o_compute()` for CRTCs not in the current atomic state can lead to Use-Afte=
r-Free.
--

commit 8c209591fdca806eaeb08fb945c1a557f13cd189
Author: Uma Shankar <uma.shankar@intel.com>

    drm/i915/display: Force disable DC3co when AS SDP skip frames is enabled
   =20
    Periodic AS SDP (skip frames) relies on the AS SDP still being
    transmitted while Panel Replay is active. DC3co uses the idle protocol
    which suppresses AS SDP transmission entirely, so the two are mutually
    exclusive: leaving DC3co enabled while skip frames is programmed breaks
    the periodic AS SDP and the panel never sees the slower refresh.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers=
/gpu/drm/i915/display/intel_display_power.c
> index 0ebec6e0c2400..1b60ce2dd00c4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
[ ... ]
> @@ -488,6 +489,14 @@ void intel_display_power_dc3co_compute(struct intel_=
atomic_state *state)
>  	if (crtc_state->has_sel_update)
>  		trigger |=3D DC3CO_TRIGGER_PSR2;
> =20
> +	/*
> +	 * Periodic AS SDP (skip frames) needs the AS SDP to keep flowing during
> +	 * PR active, which is incompatible with DC3co. Keep DC3co disabled whi=
le
> +	 * skip frames is enabled.
> +	 */
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))

[Severity: High]
This is a pre-existing issue, but this patch exacerbates it by adding more =
reads
to the locklessly accessed state.

Can this lockless access to crtc_state lead to a use-after-free?

Looking at intel_display_power_dc3co_compute(), it retrieves the state of a
CRTC without locking it:

    pipe =3D ffs(active_pipes) - 1;
    crtc =3D intel_crtc_for_pipe(display, pipe);
    crtc_state =3D to_intel_crtc_state(crtc->base.state);

If a system has multiple active CRTCs (e.g., A and B) and a non-blocking
atomic commit is issued to disable CRTC A, intel_display_power_dc3co_comput=
e()
runs in the commit tail. It calculates that exactly one pipe (CRTC B) will
remain active and retrieves its state.

Because CRTC B is not part of the current atomic commit, no locks are held =
for
it. A concurrent non-blocking atomic commit on CRTC B can swap and free its
state while the first commit is reading fields like crtc_state->has_panel_r=
eplay
or crtc_state->vrr.enable (via intel_alpm_pr_as_sdp_skip_frames_enabled()),
potentially causing memory corruption or crashes.

> +		trigger =3D DC3CO_TRIGGER_NONE;
> +
>  done:
>  	intel_display_power_dc3co_update(display, trigger);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909080810.2202=
879-1-uma.shankar@intel.com?part=3D2
