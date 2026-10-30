Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36DB606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2yK/csM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8E510E7FA;
	Fri, 30 Oct 2026 17:29:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ABE10E790;
 Fri, 30 Oct 2026 17:29:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 92278405C2;
 Fri, 30 Oct 2026 17:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4521A1F00A02;
 Fri, 30 Oct 2026 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793381365;
 bh=lVxtQ9qhuh2LwdxblOOYbZQ4DbLAlSGNIHwTV6SCG2k=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=W2yK/csMldsGtzqS73B2Pyx4EhOY9Gs3FBwcGlVgMDv0WzCMz4qd6AwFfqvI4HwAW
 XJRh0lSy9kJKKERiWknYbJNjtrcsl+yu7f4aToGhjqgSy0RRinNxaP5Zh4WW179gJY
 DOTTnx4vinXdncAuLvFXG7tg8xQ9xGY1ubbyScQ9Qs3DRlDD6qyKoWDVhT1dexOe08
 CwftmkxSwEMoYmGt50+Xv81BIm67NmL+6ceYbMmVvOB/CpypLVmxvPWtXsWTl4p6vH
 9jsE6Z0xJc5N2iFkkuBfbapN2kyMnCTGjSG45lkn7nGqAvYpuLFACOaFmjrgj4V1MP
 +7vtCzMwEtfVA==
Message-ID: <sashiko-outbox-191346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] drm/i915: Fix FEC wait with port sync on pre-LNL
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261030171327.29829-10-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:29:24 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/ddi: LNL vs PTL version mismatch in FEC status wait com=
ment and check
--

commit c0a68d9ab06674ed868f492b35dc93f1dc05b1bf
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915: Fix FEC wait with port sync on pre-LNL

This commit defers waiting for FEC status in intel_ddi_enable() until after
the timing generators have started, and adds a helper to wait for FEC status
across all synced transcoders when port sync is enabled.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 9939fa43e8f73..2e7f278a1b6c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c

[ ... ]

> @@ -3623,6 +3654,16 @@ static void intel_ddi_enable(struct intel_atomic_s=
tate *state,
>  	else
>  		intel_crtc_vblank_on(state, crtc_state);
> =20
> +	/*
> +	 * On pre-LNL FEC_DECODE_EN will only be sent when the timing
> +	 * generator starts. Also note that FEC_DECODE_EN cannot be
> +	 * re-sent without restarting the timing generator.
> +	 */
> +	if (is_trans_port_sync_mode(crtc_state))
> +		trans_port_sync_wait_for_fec_status(state, encoder, crtc_state, true);
> +	else
> +		intel_ddi_wait_for_fec_status(encoder, crtc_state, true);

[Severity: Medium]
Should the comment here (and the commit message) refer to pre-PTL and PTL+
rather than pre-LNL and LNL+, or should the version check in
intel_ddi_enable_fec() be updated?

The commit message and the comment in intel_ddi_enable() state that on LNL+
FEC_DECODE_EN is sent immediately when enabling FEC in DP_TP_CTL, and that
LNL+ therefore checks FEC status immediately in intel_ddi_enable_fec() and
then a second time here in intel_ddi_enable().

However, intel_ddi_enable_fec() skips the immediate check and retry loop on
DISPLAY_VER < 30:

drivers/gpu/drm/i915/display/intel_ddi.c:intel_ddi_enable_fec() {
	...
	intel_de_rmw(display, dp_tp_ctl_reg(encoder, crtc_state),
		     0, DP_TP_CTL_FEC_ENABLE);

	if (DISPLAY_VER(display) < 30)
		return;

	ret =3D intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
	...
}

Since LNL is DISPLAY_VER 20 and PTL is DISPLAY_VER 30, LNL returns early in
intel_ddi_enable_fec() without waiting for FEC status, and port sync is also
enabled up through DISPLAY_VER 20 in intel_ddi_port_sync_transcoders():

drivers/gpu/drm/i915/display/intel_ddi.c:intel_ddi_port_sync_transcoders() {
	/*
	 * We don't enable port sync on BDW due to missing w/as and
	 * due to not having adjusted the modeset sequence appropriately.
	 */
	if (!IS_DISPLAY_VER(display, 9, 20))
		return 0;
	...
}

Is intel_ddi_enable_fec() supposed to check DISPLAY_VER(display) < 20 for
LNL+, or was the description intended to say pre-PTL / PTL+?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030171327.2982=
9-1-ville.syrjala@linux.intel.com?part=3D9
