Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BAB606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DI3SawJ5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA04112C16;
	Fri, 27 Nov 2026 16:21:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FAE112C14;
 Fri, 27 Nov 2026 16:21:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CBCD845281;
 Fri, 27 Nov 2026 16:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C981F00893;
 Fri, 27 Nov 2026 16:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795796488;
 bh=rbhjF7s9SiPPxTQYjum8/zTvmtTo+GVaH70WORQCObw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DI3SawJ5jMzAJRRWqcQgTNAMr8W/6eGOlz6F9UHqb195qen+NBAb7iodZ4X8KvKUo
 XcYG2RKZegPXwby82hJ9sFUOylJzJ+G7UNFJEGzSnxhdwZPlwps5wz2VT9ATMLu8Q0
 doOEcfQjeFK1plcZARdwxBJozd5JjWzmPQ1aub9ZMU9AqRKMZBRQX5ArBrfIW1GeI/
 UURHnR/ULQDpKxPyHTeAzOainF1FIDb1aTvwUokMDBbc14rIOPUu9w+vCel9YlqD7+
 1O1KXTf41HAOf+Wi/DAQ4m8sZiPVZ0uMzfOs3phOWWrL4WKP4kNSeaCTT/Uw3qkOTW
 oglwudZCx5nrQ==
Message-ID: <sashiko-outbox-237871@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: Leave the PSR frame change to the
 joiner primary
To: "Mika Kahola" <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261127160235.3208777-1-mika.kahola@intel.com>
References: <20261127160235.3208777-1-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:21:27 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/display: unguarded intel_vrr_send_push() on joiner
  secondary
--

commit 05528a5f86f8437e1527e9f06b9d3d7e6f314404
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/display: Leave the PSR frame change to the joiner primary

This commit skips intel_vrr_send_push() and intel_psr_wait_for_idle_dsb()
on a joiner secondary CRTC in intel_atomic_dsb_finish() when the joiner
primary CRTC is part of the same atomic commit.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 19caae633d29f..f9d0a5972feb4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7649,6 +7649,11 @@ static void intel_atomic_dsb_finish(struct intel_a=
tomic_state *state,
> =20
>  	if (new_crtc_state->commit_type =3D=3D INTEL_COMMIT_DSB &&
>  	    !intel_color_uses_chained_dsb(new_crtc_state)) {
> +		struct intel_crtc *primary_crtc =3D intel_primary_crtc(new_crtc_state);
> +		/* One transcoder: the joiner primary pushes and waits for PSR */
> +		bool via_primary =3D primary_crtc !=3D crtc &&
> +			intel_atomic_get_new_crtc_state(state, primary_crtc);
> +
>  		/*
>  		 * Dsb wait vblank may or may not skip. Let's remove it for PSR
>  		 * trans push case to ensure we are not waiting two vblanks
> @@ -7656,7 +7661,8 @@ static void intel_atomic_dsb_finish(struct intel_at=
omic_state *state,
>  		if (!intel_psr_use_trans_push(new_crtc_state))
>  			intel_dsb_wait_vblanks(new_crtc_state->dsb_commit, 1);
> =20
> -		intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
> +		if (!via_primary)
> +			intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
> =20
>  		/*
>  		 * Wait for idle is needed for corner case where PSR HW
> @@ -7665,8 +7671,9 @@ static void intel_atomic_dsb_finish(struct intel_at=
omic_state *state,
>  		 * here for both Frame Change mechanism (trans push
>  		 * and register write).
>  		 */
> -		intel_psr_wait_for_idle_dsb(new_crtc_state->dsb_commit,
> -					    new_crtc_state);
> +		if (!via_primary)
> +			intel_psr_wait_for_idle_dsb(new_crtc_state->dsb_commit,
> +						    new_crtc_state);

[Severity: Medium]
Should intel_crtc_is_joiner_secondary() be checked directly inside
intel_vrr_send_push() and intel_psr_wait_for_idle_dsb() (similar to
intel_psr2_program_trans_man_trk_ctl())?

Guarding the calls only in this branch leaves two other commit paths
calling intel_vrr_send_push() on the joiner secondary:

1. When intel_color_uses_chained_dsb() is true (such as LUT updates on
   DISPLAY_VER =3D=3D 20), intel_color_prepare_commit() still calls
   intel_vrr_send_push(crtc_state->dsb_color, crtc_state) on the
   secondary's color DSB.
2. On INTEL_COMMIT_MMIO commits, skl_commit_modeset_enables() commits
   pipes in reverse order, so intel_pipe_update_end() on the joiner
   secondary calls intel_vrr_send_push(NULL, new_crtc_state) and
   triggers the PSR frame change on the shared primary transcoder before
   the primary CRTC has programmed PSR2_MAN_TRK_CTL or armed its planes.

Since intel_joiner_add_affected_crtcs() always adds all joined pipes to
the atomic state, bailing out on intel_crtc_is_joiner_secondary() inside
intel_vrr_send_push() and intel_psr_wait_for_idle_dsb() would cover all
commit paths.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127160235.3208=
777-1-mika.kahola@intel.com?part=3D1
