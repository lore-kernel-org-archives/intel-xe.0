Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC8C61DE0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED0410F007;
	Thu, 27 Aug 2026 12:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PXCNE/iO";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B9010F017;
 Thu, 27 Aug 2026 12:49:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F37B5600D2;
 Thu, 27 Aug 2026 12:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CC91F00ADB;
 Thu, 27 Aug 2026 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787834961;
 bh=662b656BEV5NF/IRStRGT2KNuHIApY3qWMfShlJ4PtA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PXCNE/iO03lrta54v3rJYgSs9S+CU/ffwSHa9TF3IPLEN+sy5eIyzZMFAEbGW4YzS
 rUdSUt0xHEX5NzAMI/cnxZ+b1c/5vozEwmgwAN6/P4VrOZ5wIZ3WvJsFd6/++z8NmB
 qbtQMad7p7QWJzHDe4SyENdxMp5ZyP/YzKg6gp/+WnSnrIUim4UqenbZzipHs002Id
 uTMTTz0xYPLocTktDa4hdMFAyQ4w7SRPGV4eFJv+vJ4Mnt+jBkIyPtM3JMh3gOMoTA
 H7NXE+KjJI5V6WKDi5+ox5Nw/dcVP2wDDwmcyOXcihpbpC4X/2U7PN+ZfOYt8QcaGV
 ozXKQ6UiWUZXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] drm/i915: only timeout on fence waits for
 display reset
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
 <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 12:49:20 +0000
Message-Id: <20260827124921.73CC91F00ADB@smtp.kernel.org>
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
- [High] Calling a sleeping function (dma_fence_wait_timeout) from an atomi=
c context path (intel_atomic_commit_tail).
--

commit 70671f62d3480e316b53a7ec34d9d047347fa4af
Author: Jani Nikula <jani.nikula@intel.com>

drm/i915: only timeout on fence waits for display reset

This commit restricts the timeout on fence waits to older platforms where
a GPU reset clobbers the display, or when running forced display reset
tests. For other platforms, it switches the timeout to MAX_SCHEDULE_TIMEOUT.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 64fa582a64102..42222b930943d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c

[ ... ]

> @@ -7228,15 +7229,20 @@ static void intel_atomic_commit_fence_wait(struct=
 intel_atomic_state *state)
>  	struct intel_display *display =3D to_intel_display(state);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *new_plane_state;
> -	long ret;
> +	long timeout, ret;
>  	int i;
> =20
> +	if (intel_display_reset_needed_after_gpu_reset(display) ||
> +	    intel_display_reset_test(display))
> +		timeout =3D i915_fence_timeout();
> +	else
> +		timeout =3D MAX_SCHEDULE_TIMEOUT;
> +
>  	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
>  		if (!new_plane_state->fence)
>  			continue;
> =20
> -		ret =3D dma_fence_wait_timeout(new_plane_state->fence, false,
> -					     i915_fence_timeout());
> +		ret =3D dma_fence_wait_timeout(new_plane_state->fence, false, timeout);

[Severity: High]
This isn't a bug introduced by this patch, but does this result in calling a
sleeping function from an atomic context?

The DRM subsystem guidelines explicitly define intel_atomic_commit_tail() a=
nd
its variants as atomic context paths where sleeping is forbidden. This code
is reached during an atomic display commit via:

intel_atomic_commit_tail()
   intel_atomic_commit_fence_wait()
      dma_fence_wait_timeout() -> might_sleep()

While this patch only modifies the timeout value (which doesn't introduce t=
he
bug), the underlying call to a sleeping function from a forbidden atomic
context remains. Can this cause kernel warnings or potential deadlocks duri=
ng
userspace modeset or pageflip requests?

>  		if (!ret)
>  			ret =3D -ETIMEDOUT;
>  		if (ret < 0) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787833879.gi=
t.jani.nikula@intel.com?part=3D6
