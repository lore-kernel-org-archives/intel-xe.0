Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3CBC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC85110EA65;
	Tue, 18 Aug 2026 08:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h1cWMudS";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7620610EA65;
 Tue, 18 Aug 2026 08:59:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 06BBC400AA;
 Tue, 18 Aug 2026 08:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B697E1F000E9;
 Tue, 18 Aug 2026 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787043592;
 bh=TyIfhWFUX/L/Vtqhqa0fvxCMqHFwhJJjGmVZ0rL8/fs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=h1cWMudSdCo9VxWkt+S28Z2SGG2RkfyyIUpnN8XcIf8n+DTTgg9qAQNPb9xFo8W12
 Sg90RSfJCGHMqnf7vNP0PjHsMr9bDaY9vFvEkFigoo7BvUlYuUi31uChEZRqHKiNlu
 0d220g1l+6ezutKXsCSpPktuuUcO3rwpTd+pXMy1k09YTeg6ubpu4N9Nr7LZJ6SjIZ
 VWVutD/+QPKwSyrTfZMwPFsKwDiPxoy/RBdGC1YU0dNhoS7dNVMDyBgIUfHKBH5obZ
 qGo2LAEBbgPcMltpjUT5fq2CpwV6EwFdQAki7dNbTrBhml9Q5AGT9dN7SrWCyWokmx
 qn6jEMicYRpKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit status
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260818084236.2168580-2-nemesa.garg@intel.com>
References: <20260818084236.2168580-1-nemesa.garg@intel.com>
 <20260818084236.2168580-2-nemesa.garg@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 08:59:52 +0000
Message-Id: <20260818085952.B697E1F000E9@smtp.kernel.org>
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
- [Medium] The newly added fast path logic for joined cursor planes is unre=
achable due to an unremoved fallback, and lacks secondary plane hardware up=
date logic.
--

--- Patch [1]: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit stat=
us ---
commit 217b50906b0ee44f4341de677a7c7eeba08394c6
Author: Nemesa Garg <nemesa.garg@intel.com>

drm/i915/cursor: Check joiner cursor commit status

In joiner mode, secondary cursor commits may still be running
even when the primary cursor commit is done. Walking the secondary
pipes also requires holding the secondary planes modeset locks.
Add intel_cursor_lock_joined_planes() to acquire modeset locks
for all secondary cursor planes. Check all joined cursor commit
status before taking the fast path. If any commit is still pending,
fallback to slow path.

> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/dr=
m/i915/display/intel_cursor.c
> index 0673f16f6fd0d..bc1e58d5c4c5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
[ ... ]
> @@ -833,15 +877,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>  	    crtc_state->joiner_pipes)
>  		goto slow;

[Severity: Medium]
Since this existing check unconditionally sends joiner configurations to
the slow path, doesn't it make the newly added fast path logic below
unreachable for joiner pipes?

[ ... ]
> @@ -855,6 +890,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>  	    !old_plane_state->uapi.fb !=3D !fb)
>  		goto slow;
> =20
> +	ret =3D intel_cursor_lock_joined_planes(display, crtc_state, ctx);
> +	if (ret =3D=3D -EDEADLK)
> +		return ret;
> +	if (ret)
> +		goto slow;
> +
> +	/*
> +	 * Don't do an async update if there is an outstanding commit modifying
> +	 * any of the joined cursor planes. This prevents our async update's
> +	 * changes from getting overridden by a previous synchronous update's
> +	 * state.
> +	 */
> +	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
> +		goto slow;
> +

[Severity: Medium]
If the earlier fallback were removed, would the hardware update logic at the
end of intel_legacy_cursor_update() also need to be updated?

Currently, it only updates the primary plane:

	if (new_plane_state->uapi.visible) {
		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
	} else {
		intel_plane_disable_arm(NULL, plane, crtc_state);
	}

It looks like the secondary joined planes won't receive hardware updates if
the fast path is actually taken.

>  	new_plane_state =3D to_intel_plane_state(intel_plane_duplicate_state(&p=
lane->base));
>  	if (!new_plane_state)
>  		return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818084236.2168=
580-1-nemesa.garg@intel.com?part=3D1
