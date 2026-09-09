Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE9C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10110E180;
	Wed,  9 Sep 2026 11:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCXhzGUI";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A65F10E180;
 Wed,  9 Sep 2026 11:32:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E987601FE;
 Wed,  9 Sep 2026 11:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55FA1F00A3D;
 Wed,  9 Sep 2026 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788953525;
 bh=eFJa860GvnBozrd0sqEAbEYmQ77r2EsMgoFYpeQNNxU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nCXhzGUIdF3Je9wjFusAssx5E2CZuISsdtKyPWDlQq81HUctwV84B9vIQehpk2MWw
 dcSAco7WxmUUBMDRiOvd30WHn9nP6h++JSaKOg3FN3971LSDyhIBCmlyUXcTlRnLfX
 PKugzAsbhegC9PCxA3CLuDQPMc7F49ARGHOe+n1z2w8vEMgbYEu7GVQia2OLbFsBb9
 6d4TtNe02WEKdXxRlbW0XaOfktDdQaSMGlLPhdQnb2EcDgYVP7ESANjsCp7O3DK3Cn
 kpYv9/asG13kMq1ClHwua3+R4kc6QqTb1h+69g3gdbkbEgV/Ca7kq6ohtwbmUMyWRH
 HHjPox4W4LTAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909110332.3528029-3-nemesa.garg@intel.com>
References: <20260909110332.3528029-1-nemesa.garg@intel.com>
 <20260909110332.3528029-3-nemesa.garg@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 11:32:05 +0000
Message-Id: <20260909113205.B55FA1F00A3D@smtp.kernel.org>
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
- [High] The patch introduces `clear_psr2_sel_fetch` to clear stale hardwar=
e bits when selective fetch is disabled, but immediately returns early, ski=
pping the addition of planes to the atomic state. This causes the fix to fa=
il during non-modeset transitions.
--

commit 6d95f584528dbe05e1cd976db461a45c72fb5319
Author: Nemesa Garg <nemesa.garg@intel.com>
drm/i915/psr: Clear stale sel fetch enable bits on sel fetch disable

This commit attempts to clear stale selective fetch enable bits by tracking
the transition in clear_psr2_sel_fetch and having the plane/cursor arm paths
write 0 to the registers. It updates intel_psr2_sel_fetch_update() to record
when selective fetch is turned off.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739

[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index f490beb66629e..872e253db1786 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
[ ... ]
> @@ -2901,6 +2903,19 @@ int intel_psr2_sel_fetch_update(struct intel_atomi=
c_state *state,
>  	bool full_update =3D false, su_area_changed;
>  	int i, ret;
> =20
> +	/*
> +	 * Selective fetch is not always usable, for instance it is dropped
> +	 * while pipe CRC is active. The planes keep their selective fetch
> +	 * enable bit set in hardware over that, and a plane disabled while
> +	 * selective fetch is off never gets the bit cleared. Once selective
> +	 * fetch comes back the hardware would resume fetching for a plane that
> +	 * is no longer enabled and keep its DDB range reserved, so have the
> +	 * plane update drop the bit for every plane of the pipe as selective
> +	 * fetch is turned off.
> +	 */
> +	crtc_state->clear_psr2_sel_fetch =3D old_crtc_state->enable_psr2_sel_fe=
tch &&
> +		!crtc_state->enable_psr2_sel_fetch;
> +
>  	if (!crtc_state->enable_psr2_sel_fetch)
>  		return 0;

[Severity: High]
Will this early return skip adding unmodified planes to the atomic state
during non-modeset transitions?

During a non-modeset atomic commit (like a fastset triggered by color
management or CDCLK updates) that disables PSR2 selective fetch, the core
drm_atomic_helper_check_modeset() function does not automatically add all
planes to the state.

When intel_psr2_sel_fetch_update() detects this transition, it sets
clear_psr2_sel_fetch to true, but then immediately returns 0 here because
enable_psr2_sel_fetch is false.

Because the function returns before reaching the
drm_atomic_add_affected_planes() call further down, unmodified planes are
not added to the atomic state. Could this cause their plane arm callbacks to
be skipped entirely, leaving the hardware bits active and potentially causi=
ng
the display corruption this patch was intended to fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909110332.3528=
029-1-nemesa.garg@intel.com?part=3D2
