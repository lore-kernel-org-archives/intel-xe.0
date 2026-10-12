Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD6BCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DCB10F05F;
	Mon, 12 Oct 2026 12:56:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A0410F05F;
 Mon, 12 Oct 2026 12:56:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4035D408BF;
 Mon, 12 Oct 2026 12:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38E31F0089C;
 Mon, 12 Oct 2026 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791809771;
 bh=ddnlHTpOTotmew6pLNGvebORTj9UxNDWk+sJYWexd88=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=c9VEOpJwElDGczNct83p5YOiB9wXm+urNfJe2//rshXap6MNQUL0OSDNOOQJXJPB1
 nYNNDEbRxyjL6gWe1qYK1KZbLC6Ua8Njm13sHCYOb46WfEkYDqd3RhCvl0Air9DzZH
 MPyGYIsCV/eEeJyQNPW0O4VSr13NunEhBLiJtJh29q630xQCTArVVAhqTU5CHkV0Nk
 TRCGltBzkAyHuCMkF9tAPUVqogbJok6bYuUtsgCAS1kXjCwOHRY5VQHZywOQQW5E4E
 jXq1uAcu5nqsrsK8Abjf2OrX+krHRuCURXm2QCshcw1Wmw+Z7OSRu6//8sNQ+REIJ8
 T1nhzbz5z7QJA==
Message-ID: <sashiko-outbox-168133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] drm/i915/psr: Merge the selective fetch area
 across joined pipes
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261012124145.1960050-5-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
 <20261012124145.1960050-5-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:56:10 +0000
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
- [Low] drm/i915/psr: Dead code in psr2_sel_fetch_align_su_area for cursor_=
in_su_area
--

commit 7a64006c52d0dd79eca20d987ffe7b3c8f8b6c66
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Mon Oct 12 12:41:43 2026 +0000

    drm/i915/psr: Merge the selective fetch area across joined pipes

This commit updates PSR2 selective fetch to handle joined pipes by merging
the selective fetch area across the pipes. It ensures only the primary pipe
programs the transcoder register, and falls back to a full update if a join=
ed
pipe fails area calculation or if no joined pipe has damage.

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index 0483dad5bdd82..9a57339c004a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
[ ... ]
> +static void psr2_sel_fetch_align_su_area(struct intel_atomic_state *stat=
e,
> +					 u8 joined_pipes)
> +{
> +	struct intel_display *display =3D to_intel_display(state);
> +	struct intel_crtc *crtc;
> +	bool su_area_changed;
> +
> +	do {
> +		su_area_changed =3D false;
> +
> +		for_each_intel_crtc_in_pipe_mask(display, crtc, joined_pipes) {
> +			struct intel_crtc_state *crtc_state =3D
> +				intel_atomic_get_new_crtc_state(state, crtc);
> +			struct drm_rect display_area =3D {
> +				.x1 =3D 0,
> +				.y1 =3D 0,
> +				.x2 =3D crtc_state->hw.pipe_mode.crtc_hdisplay,
> +				.y2 =3D crtc_state->hw.pipe_mode.crtc_vdisplay,
> +			};
> +			struct drm_rect old_su_area =3D crtc_state->psr2_su_area;
> +			bool cursor_in_su_area =3D false;
> +
> +			/* Needs the planes already pulled into the state. */
> +			intel_psr2_sel_fetch_et_alignment(state, crtc, &display_area,
> +							  &cursor_in_su_area);
> +

[Severity: Low]
Could the cursor_in_su_area variable and its corresponding parameter in
intel_psr2_sel_fetch_et_alignment() be removed?

The previous implementation used cursor_in_su_area to conditionally break o=
ut
of the alignment loop early. Since this patch removes that break condition,
the variable is initialized and populated by intel_psr2_sel_fetch_et_alignm=
ent()
but its value is never checked, making it dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012124145.1960=
050-1-mika.kahola@intel.com?part=3D4
