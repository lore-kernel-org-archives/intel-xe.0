Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7EFC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6A210E449;
	Tue, 18 Aug 2026 08:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MUUxs1Ng";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B679610E449;
 Tue, 18 Aug 2026 08:58:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BC0F1601E0;
 Tue, 18 Aug 2026 08:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC881F000E9;
 Tue, 18 Aug 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787043531;
 bh=KYMkRJMWZgapcErCImGJwmi+0c5ck5fW1CbcMOtjFuA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MUUxs1NgdONNAshMi6T32aMR6FqgEfuyoxFOw4Gw++KjXRbUPKB5l+scsRNq7goBU
 Okej83h2zRG+KFMF5X7ssPLjPdSFXrt6iDhghv7c2G9v1U8IazApLboROFYGBJV6Jr
 Q6sTrC6rnPbESfM84Hzjw0CTwFz6ZTg4pWdouQqC9IxFsk+1eopu5rpID6lhWBieku
 vaAi2HALAcVkfVwJG1XIN98eBMkr9R0varmCmXGtWfGDGkn/a5iJU9mOzqCZ6+/30H
 qEPa/Yjy4dOZHXc/Ol3l5qdalw0fxUGgZ5GzsNN3hQjPvT6x8pqBY4PkYxruL/VjF+
 e1D7bPHlwNW9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260818084236.2168580-4-nemesa.garg@intel.com>
References: <20260818084236.2168580-1-nemesa.garg@intel.com>
 <20260818084236.2168580-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 08:58:50 +0000
Message-Id: <20260818085851.3AC881F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The fast path cursor update fails to iterate over all joined pipes=
 when unpinning their old framebuffers, leaking VMA pins and triggering use=
-after-free.
- [High] The fast path cursor update fails to write the new plane state to =
the hardware registers of secondary joined cursors.
- [Medium] The secondary cursor plane's uapi.crtc is incorrectly assigned t=
o the secondary CRTC, breaking bigjoiner atomic state invariants.
--

--- Patch [3]: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state -=
--
commit 98f6f039bea454d797d8103020e7553cf275702d
Author: Nemesa Garg <nemesa.garg@intel.com>

drm/i915/cursor: Handle secondary cursor state

This commit modifies the fast path cursor update to handle secondary pipes
in joiner mode. It iterates over all joined pipes to duplicate and prepare
the plane states, tracking them in a joined_pipe_state array.

> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/dr=
m/i915/display/intel_cursor.c
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
[ ... ]
> @@ -928,38 +938,70 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
[ ... ]
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_cursor_joiner_state *j =3D &joined_pipe_state[num_pipes];
> +
> +		j->plane =3D intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
[ ... ]
> +		j->new_plane_state->uapi.crtc =3D &pipe_crtc->base;

[Severity: Medium]
Does this assignment break the bigjoiner atomic state invariants?

The DRM framework requires that for joined pipes, a secondary plane's
uapi.crtc must point to the primary CRTC. This represents the single
logical CRTC to userspace, while only its hw.crtc points to the
secondary CRTC.

Assigning the secondary CRTC to the uapi.crtc field of secondary planes
could corrupt the atomic state tracker and lead to failures during
subsequent atomic commits.

Should this point to the primary CRTC instead?

> +
> +		intel_cursor_fastpath_update_plane_state(j->new_plane_state, fb,
[ ... ]
>  	/*
>  	 * We cannot swap crtc_state as it may be in use by an atomic commit or
>  	 * page flip that's running simultaneously. If we swap crtc_state and
>  	 * destroy the old state, we will cause a use-after-free there.
>  	 *
>  	 * Only update active_planes, which is needed for our internal
>  	 * bookkeeping. Either value will do the right thing when updating
>  	 * planes atomically. If the cursor was part of the atomic update then
>  	 * we would have taken the slowpath.
>  	 */
> -	crtc_state->active_planes =3D new_crtc_state->active_planes;
> =20
>  	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
> =20
>  	intel_psr_lock(crtc_state);

[Severity: High]
Are the hardware updates properly applied to the secondary cursor planes?

The unpatched hardware update block immediately following this code only ca=
lls
update functions for the primary plane:

    if (new_plane_state->uapi.visible) {
        intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
        intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
    } else {
        intel_plane_disable_arm(NULL, plane, crtc_state);
    }

Because the fast path now handles joined pipes and populates the
joined_pipe_state array, failing to write the new plane state to the
hardware registers of the secondary joined cursors means the cursor will
not visually update on the secondary half of the display.

Could this block be updated to iterate over all pipes in joined_pipe_state?

> @@ -1004,6 +1045,10 @@ intel_legacy_cursor_update(struct drm_plane *_plan=
e,
> =20
>  	intel_psr_unlock(crtc_state);
> =20
> +	/*
> +	 * Schedule or immediately unpin old framebuffers.
> +	 * Protect against concurrent access.
> +	 */
>  	if (old_plane_state->ggtt_vma !=3D new_plane_state->ggtt_vma) {
>  		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
>  				     intel_cursor_unpin_work);
> @@ -1012,18 +1057,24 @@ intel_legacy_cursor_update(struct drm_plane *_pla=
ne,
>  					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
>  					 false);
> =20
> -		old_plane_state =3D NULL;
> +		joined_pipe_state[0].old_plane_state =3D NULL;
>  	} else {
>  		intel_plane_unpin_fb(old_plane_state);
>  	}

[Severity: High]
Can this unpin path leak VMA pins and trigger a use-after-free for
secondary framebuffers?

This code explicitly unpins only the primary pipe's old state
(old_plane_state). However, in the out_free block below:

    for (int i =3D 0; i < num_pipes; i++)
        if (joined_pipe_state[i].old_plane_state)
            intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
                                      &joined_pipe_state[i].old_plane_state=
->uapi);

The secondary pipes' old states are destroyed without being unpinned first.
This frees the state and drops the active framebuffer reference while the
secondary display hardware may still be actively scanning out the old
framebuffer.

Would it make sense to update the unpinning logic to iterate over all joined
pipes?

> =20
>  out_free:
> -	if (new_crtc_state)
> -		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
> -	if (ret)
> -		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
> -	else if (old_plane_state)
> -		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
> +	if (ret) {
> +		for (int i =3D 0; i < num_pipes; i++) {
> +			intel_plane_unpin_fb(joined_pipe_state[i].new_plane_state);
> +			intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
> +						  &joined_pipe_state[i].new_plane_state->uapi);
> +		}
> +	} else {
> +		for (int i =3D 0; i < num_pipes; i++)
> +			if (joined_pipe_state[i].old_plane_state)
> +				intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
> +							  &joined_pipe_state[i].old_plane_state->uapi);
> +	}
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818084236.2168=
580-1-nemesa.garg@intel.com?part=3D3
