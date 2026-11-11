Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F4606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PX6bIc+s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAB610FB25;
	Wed, 11 Nov 2026 11:31:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D011010FB25;
 Wed, 11 Nov 2026 11:31:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 43C6363AAC;
 Wed, 11 Nov 2026 11:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9451F00A0C;
 Wed, 11 Nov 2026 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794396667;
 bh=0BpYr2HaG+XIQswyWaeo7nT3gnPdQqXfUG5VEQ9030M=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PX6bIc+sMo9EwGj1lmQuwbTCRfj8V0SfkrNaWwrrBXR5+DQo/wzo+l8+54GzdGiN5
 sSnrPHFMvvr7rOw0f5Bq/W3ZgEpcGDVWLDX7w2yK3Th/gxNMZm4gm2BJXLkfeLhZUS
 9ahlyJVPU8XRPE0uM6WrTEoPPkyezVQn2KdbpmNyjFlsPABLcaBnkPp1eBtQMi9iwv
 zKhvP2j4PvXQNT6ImEBU/7tekEeCcZpfX9pmArErsPdHXI9pwOFWYq9d9lkiJslh+D
 qh+QCGfD1q8CqY2cx7OXMCtle3RTQi4oq7PW1AjZ/fgfkYnrigiFnMrA83a1cZF7EP
 B++PToCOcMs9Q==
Message-ID: <sashiko-outbox-208882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/13] drm/i915/dpt: Compute DPT size in the DPT code
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261111112007.16790-7-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
 <20261111112007.16790-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:31:06 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] drm/xe/display: double BO unpin on __intel_fbdev_fb_alloc()
  error path [1]
--

commit ae1435739339ed58396679163558aae13db1d253
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/dpt: Compute DPT size in the DPT code

This commit passes the GTT view instead of a precomputed size to
intel_parent_dpt_create() so that the DPT code computes the DPT size for
both normal and remapped views.

> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index b3344e3f187fb..35f1d5dd31d7d 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2275,13 +2275,15 @@ int intel_framebuffer_init(struct intel_framebuff=
er *intel_fb,
> =20
>  	if (intel_fb_uses_dpt(fb)) {
>  		struct drm_gem_object *obj =3D intel_fb_bo(&intel_fb->base);
> +		const struct intel_gtt_view *view;
>  		struct intel_dpt *dpt;
> -		size_t size =3D 0;
> =20
>  		if (intel_fb_needs_pot_stride_remap(intel_fb))
> -			size =3D intel_remapped_info_size(&intel_fb->remapped_view.gtt.remapp=
ed);
> +			view =3D &intel_fb->remapped_view.gtt;
> +		else
> +			view =3D &intel_fb->normal_view.gtt;
> =20
> -		dpt =3D intel_parent_dpt_create(display, obj, size);
> +		dpt =3D intel_parent_dpt_create(display, obj, view);
>  		if (IS_ERR(dpt)) {
>  			drm_dbg_kms(display->drm, "failed to create DPT\n");
>  			ret =3D PTR_ERR(dpt);

[Severity: High]
This problem wasn't introduced by this patch, but can failing in
intel_framebuffer_init() after intel_bo_framebuffer_init() cause a double
BO unpin on Xe when called from __intel_fbdev_fb_alloc() [1]?

In __intel_fbdev_fb_alloc(), intel_bo_fbdev_create() allocates the BO via
xe_bo_create_pin_map_novm() with XE_BO_FLAG_PINNED set and a pin count of
1, and xe_display_bo_framebuffer_init() only takes a reference without
pinning it again.  If a later step in intel_framebuffer_init() fails and
jumps to err_bo_framebuffer_fini, xe_display_bo_framebuffer_fini() sees
XE_BO_FLAG_PINNED and unpins the BO:

drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_framebuffer_fini()=
 {
	struct xe_bo *bo =3D gem_to_xe_bo(obj);

	if (bo->flags & XE_BO_FLAG_PINNED) {
		/* Unpin our kernel fb first */
		xe_bo_lock(bo, false);
		xe_bo_unpin(bo);
		xe_bo_unlock(bo);
	}
	xe_bo_put(bo);
}

When control returns to __intel_fbdev_fb_alloc(), error handling calls
intel_bo_fbdev_destroy() -> xe_display_bo_fbdev_destroy() ->
xe_bo_unpin_map_no_vm(), which unpins the BO a second time, triggering
assertions in xe_bo_unpin() and underflowing bo->pin_count in
ttm_bo_unpin().

[1] https://sashiko.dev/#/bug/linux-227b0044-5f2a-4c7c-81e6-93b67cb4f477

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111112007.1679=
0-1-ville.syrjala@linux.intel.com?part=3D6
