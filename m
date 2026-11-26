Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FFA606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgZQZeo+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3D610FFED;
	Thu, 26 Nov 2026 06:44:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841BE10FF7B;
 Thu, 26 Nov 2026 06:44:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D34C4075E;
 Thu, 26 Nov 2026 06:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A9D1F000D0;
 Thu, 26 Nov 2026 06:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795675460;
 bh=CQ8yEE9+jKxMjGkx1TQC+oC5Q/Qzj2e6QCy/48/w2K8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=GgZQZeo+AWp1Ho8HrVJMv+moJ9YYwdBwJE8Q/9xq6L/TLb+1ssQwNhHOt+Hf9GBsQ
 cnB2SSNebTawWXTMTq6JQ587JV8BDzy3KpfyQKUpRq2sreRhdRZysCbw+bQP1vHDBa
 AxGULWM/UerzQHfneiWup9toHAVGKiEBdj4uE6D8UwWCdejN8HlneZ/J2A5Ar2AGuK
 3OgrlQIDZ6YmTp+AWTZFJiwEsAjS7lJPXo8DXfD4Fr4BZjjVYwPbiHr8DOZzMejNi6
 rtYh5jff7CUjfi7lEgRBdKJ+DkDetKnKwZ/VB5M6utVX/mxpqJr7ReUrOLaG+ECw/R
 e8okmBNL6BMgA==
Message-ID: <sashiko-outbox-234893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/15] drm/i915/vrr: Split out setting the guardband
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126063459.863698-11-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-11-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:44:19 +0000
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
- [Low] drm/i915/vrr: setter intel_vrr_guardband_val() named like a
  value getter
--

commit db54f00770dd52e82e61cd7ca35d6aebd9822459
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/vrr: Split out setting the guardband

This commit splits setting crtc_state->vrr.guardband and the derived
vblank start and pipeline full values out of intel_vrr_compute_guardband()
into a new intel_vrr_guardband_val() helper.

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 47603c1412989..ad88034c23f89 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -620,22 +620,13 @@ static bool intel_vrr_use_optimized_guardband(const=
 struct intel_crtc_state *crt
>  	return true;
>  }
> =20
> -void intel_vrr_compute_guardband(struct intel_crtc_state *crtc_state)
> +void intel_vrr_guardband_val(struct intel_crtc_state *crtc_state, int gu=
ardband)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct drm_display_mode *adjusted_mode =3D &crtc_state->hw.adjusted_mod=
e;
>  	struct drm_display_mode *pipe_mode =3D &crtc_state->hw.pipe_mode;
> -	int guardband;
> =20
> -	if (!intel_vrr_possible(crtc_state))
> -		return;
> -
> -	if (intel_vrr_use_optimized_guardband(crtc_state))
> -		guardband =3D intel_vrr_compute_optimized_guardband(crtc_state);
> -	else
> -		guardband =3D crtc_state->vrr.vmin - adjusted_mode->crtc_vdisplay;
> -
> -	crtc_state->vrr.guardband =3D min(guardband, intel_vrr_max_guardband(cr=
tc_state));
> +	crtc_state->vrr.guardband =3D guardband;

[Severity: Low]
This isn't a bug, but across i915 display, helpers without a verb or
ending in _val() (such as intel_vrr_vmin_vtotal() or
skl_plane_wm_reg_val()) are side-effect-free getters that return a value,
whereas void helpers that mutate state use a verb.  Since this sets
crtc_state->vrr.guardband and updates derived timing fields in crtc_state,
would a name like intel_vrr_set_guardband() be clearer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126063459.8636=
98-1-suraj.kandpal@intel.com?part=3D10
