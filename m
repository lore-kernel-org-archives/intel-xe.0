Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2947606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLgLOMeK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E63112B06;
	Fri, 23 Oct 2026 12:25:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30773112BC6;
 Fri, 23 Oct 2026 12:25:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CF83F4161B;
 Fri, 23 Oct 2026 12:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB461F01825;
 Fri, 23 Oct 2026 12:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792758328;
 bh=UwGOUSP2RL5JuKxUSl0s5dOCDZ7du5e0sX+X4V8N2A0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PLgLOMeKq1ZA92uSejD7saU9m85BtnkJInBrEF+T93FOSeqO5HLQNiCDG2IXWLUmT
 u/7dBctiqBcW692Gu4adnyyWk3H9qjdZp1ue06KAjK1Fr5o61a6TH3iKZNAXf3jR6r
 +dPDORjsD6ejGh4Gsz5HPnUosRRYRdeDNjXb7MvsklgYz24cQYEzbkYbFvEQe+jhjf
 BetRtBIwo6LTt0kllzcJMO9FsaDgQYmFy100QSZPPRxJCR4leDQ/V458QZz3VnORFG
 I984fv2HOPlj/Fi43WSpqiiQtJoYFPwQ/57CWPHBErKJCZ17bZAnnhiAvbxyl1t/QL
 H9Qg5bahDzgVw==
Message-ID: <sashiko-outbox-182763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/fbc: Apply Wa_14028723391
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261023120653.194313-1-vinod.govindapillai@intel.com>
References: <20261023120653.194313-1-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:25:28 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/fbc: Wa_14028723391 in intel_fbc_check_plane() disables=
 all FP16 FBC
--

commit 49c7819cacd48f3049b96afafb389df864ddc4bd
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>

drm/i915/fbc: Apply Wa_14028723391

This commit applies Wa_14028723391 to disable FBC on Xe3p_LPD (DISPLAY_VER =
35)
for FP16 formats with alpha.

> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index 5694d20773f83..80a7ae671179a 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1687,6 +1687,18 @@ static int intel_fbc_check_plane(struct intel_atom=
ic_state *state,
>  		return 0;
>  	}
> =20
> +	/*
> +	 * Wa_14028723391:
> +	 * Fixes: Screen corruption with FBC enabled on a plane with the FP16
> +	 * Workaround: Disable FBC for FP16+Alpha in xe3p_lpd
> +	 */
> +	if (intel_display_wa(display, INTEL_DISPLAY_WA_14028723391) &&
> +	    xe3p_lpd_fbc_fp16_format_is_valid(plane_state) &&
> +	    fb->format->has_alpha) {
> +		plane_state->no_fbc_reason =3D "Wa_14028723391";
> +		return 0;
> +	}

[Severity: Medium]
Does this check in intel_fbc_check_plane() end up disabling FBC for all FP16
formats on Xe3p_LPD rather than only FP16 formats with alpha, while leaving
the plane pixel normalizer enabled?

Looking at xe3p_lpd_fbc_fp16_format_is_valid() in
drivers/gpu/drm/i915/display/intel_fbc.c:

static bool
xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state *plane_sta=
te)
{
	const struct drm_framebuffer *fb =3D plane_state->hw.fb;

	switch (fb->format->format) {
	case DRM_FORMAT_ARGB16161616F:
	case DRM_FORMAT_ABGR16161616F:
		return true;
	default:
		return false;
	}
}

Only DRM_FORMAT_ARGB16161616F and DRM_FORMAT_ABGR16161616F are matched, both
of which unconditionally have fb->format->has_alpha =3D=3D true, while the
non-alpha FP16 formats (DRM_FORMAT_XRGB16161616F and DRM_FORMAT_XBGR1616161=
6F,
which are exposed on HDR planes in icl_hdr_plane_formats[]) return false and
are rejected earlier by pixel_format_is_valid().

As a result, whenever xe3p_lpd_fbc_fp16_format_is_valid(plane_state) is tru=
e,
fb->format->has_alpha is always true, so every FP16 format is rejected for =
FBC
on DISPLAY_VER(display) =3D=3D 35. In addition, unlike the per-pixel alpha =
check
immediately following this block:

	if (DISPLAY_VER(display) < 20 &&
	    plane_state->hw.pixel_blend_mode !=3D DRM_MODE_BLEND_PIXEL_NONE &&
	    fb->format->has_alpha)

this check does not inspect plane_state->hw.pixel_blend_mode even when alpha
blending is disabled via DRM_MODE_BLEND_PIXEL_NONE.

At the same time, icl_plane_update_arm() -> pixel_normalizer_value() ->
intel_fbc_need_pixel_normalizer() checks:

bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_=
state)
{
	struct intel_display *display =3D to_intel_display(plane_state);

	if (HAS_PIXEL_NORMALIZER(display) &&
	    xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
		return true;

	return false;
}

Should xe3p_lpd_fbc_fp16_format_is_valid() and
intel_fbc_need_pixel_normalizer() also account for non-alpha FP16 formats a=
nd
Wa_14028723391 so that FBC can still be used with non-alpha FP16 formats (or
when pixel_blend_mode is DRM_MODE_BLEND_PIXEL_NONE) and
PLANE_PIXEL_NORMALIZE_ENABLE is not programmed when FBC is disabled by this
workaround?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023120653.1943=
13-1-vinod.govindapillai@intel.com?part=3D1
