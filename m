Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D930606A326
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7b2Kr0+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3848010F023;
	Thu, 19 Nov 2026 17:36:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A75B10F023;
 Thu, 19 Nov 2026 17:36:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 441FE62C8F;
 Thu, 19 Nov 2026 17:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED6B1F000C5;
 Thu, 19 Nov 2026 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795109776;
 bh=qh1unZr9WbB5J1MODOI5ggH37S5F9v5je3uXvGjbIfo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=M7b2Kr0++LYYhrEBYguCOismPctbGWZSKH9ahMspncXtsGZg9nGPS4pzyaMRm7A/i
 8UNSUhs840rNO1DprFu5+l5kEb+IMzgJgxLFyjb2rpqLv30vEl+Hk1jCCQf4dd9kbd
 f4x4GCI+0bskkvmK3EsVdZmdlJmgyOCx6GBOi44hNtbyWNfJUUGvHUCOowpDLEGr9n
 7E58T/BRIEi9LB7pPTmM0HC4TrMrLQ5b8/LF0DWEffPVibI9kdB2AHb3GcPUA+IIlo
 t+tUtsMYnAfBzy7HhPho5s9Pv/rG0NUgu3xhTQikj/+y3vS64FUCtEtJxKc9QOlZIO
 PLpGMyqIiP5tg==
Message-ID: <sashiko-outbox-223707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/color: Program the 3D LUT on the plane's own
 pipe with joiner
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
References: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:36:15 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/i915/color: intel_color_plane_commit_arm() disables 3D LUT
  on non-PLANE_1
- [Low] drm/i915/color: inaccurate commit message on joiner secondary
  plane uapi.crtc
--

commit fb7959aa23c8ae58895c1901c0ab349857f2f45e
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

drm/i915/color: Program the 3D LUT on the plane's own pipe with joiner

This commit switches intel_color_plane_commit_arm() and
intel_color_load_3dlut() from plane_state->uapi.crtc to
plane_state->hw.crtc so 3D LUT registers are programmed on the plane's own
hardware pipe when joiner is active.

> With joiner, a secondary pipe plane's uapi.crtc points at the primary
> CRTC. intel_color_load_3dlut() and intel_color_plane_commit_arm() use
> it, so the 3D LUT is loaded and enabled twice on the primary pipe and
> never on the secondary, leaving the secondary pipe's part of the screen
> without it.

[Severity: Low]
Is this description of a joiner secondary plane's uapi.crtc accurate?

In intel_plane_copy_uapi_to_hw_state(), from_plane_state->uapi.crtc points
at the primary CRTC while the secondary plane's own plane_state->uapi.crtc
remains NULL, so to_intel_crtc(plane_state->uapi.crtc) evaluated to NULL
and skipped programming the secondary pipe rather than loading the 3D LUT
twice on the primary pipe.

> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm=
/i915/display/intel_color.c
> index f1df0f9ba7624..31958bee4717d 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4275,7 +4275,7 @@ void intel_color_plane_commit_arm(struct intel_dsb =
*dsb,
>  				  const struct intel_plane_state *plane_state)
>  {
>  	struct intel_display *display =3D to_intel_display(plane_state);
> -	struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crtc);
> +	struct intel_crtc *crtc =3D to_intel_crtc(plane_state->hw.crtc);
> =20
>  	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>  		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);

[Severity: High]
Can this disable PLANE_1's active 3D LUT when a linked planar YUV Y-plane
or an overlay plane is committed on the same pipe?

glk_lut_3d_commit() writes the per-pipe LUT_3D_CTL(pipe) register bound to
PLANE_1, and only DRM_PLANE_TYPE_PRIMARY exposes the 3D LUT property, so
plane_state->hw.lut_3d is always NULL on other planes.
icl_plane_update_arm() calls intel_color_plane_commit_arm() for every
visible universal plane and linked Y-plane on the pipe.

For a linked Y-plane during planar YUV scanout on PLANE_1,
intel_plane_y_copy_hw_state() sets y_plane_state->hw.crtc to the CRTC
while leaving uapi.crtc and hw.lut_3d as NULL.  Switching to
plane_state->hw.crtc causes the linked Y-plane update (as well as any
visible overlay plane update) to call glk_lut_3d_commit(dsb, crtc, false),
clearing LUT_3D_CTL(pipe) to 0 on DSB commits or failing the LUT_3D_READY
check with drm_err() on MMIO commits.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119165925.6836=
91-1-chaitanya.kumar.borah@intel.com?part=3D1
