Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72775606A330
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfrdAEPR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB2C1126AF;
	Fri, 13 Nov 2026 16:20:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A3F1126AF
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 16:20:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A0C341335;
 Fri, 13 Nov 2026 16:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5528B1F000C4;
 Fri, 13 Nov 2026 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794586820;
 bh=38xcnl3oQULXVYfrKGDJ473zylrTtjuEl5gtQWkUI5s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hfrdAEPRyddzmt0L6QD9smx2g6I7wp0CZzO6sTpRX6W0O3m/6jMuvBtqts/5gjgt7
 L36H+3SwYvruSEarm7hmAg6yTre5gJGqSbB35YlHW8taX2T4Si37eHVjupdqAlx88j
 st0xKylWF3uz6M72TqjT+dWzghxxj9SHT9g2xPceUgSEHqJNn3Xp9kfRuei5EUEJ3z
 dpfEzWky9XKYV4Rx6ONPEEDIrr12ccUs0+weshgTzNaLf8EXfI+TMSn1fKLknV7l04
 QdzgOT1BVcEac0dLB/D3c55TNReZT+PwPGpyopLfhhp8v0tZqlLMcJDd179ZtwiZ8u
 JoLs+L+yPh8fw==
Message-ID: <sashiko-outbox-213185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261113155734.4164230-2-tilak.tirumalesh.tangudu@intel.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:20:19 +0000
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
- [Medium] drm/xe: missing has_sem64 in graphics_xe3p_xpc disables sem64
  on 35.11 and 35.03
- [Low] drm/xe: commit message mismatch with has_sem64 resolution in
  xe_info_init()
--

commit aa9a045209e3c606e5aa5ffac66c1d9a9153a146
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add has_sem64 bit to graphics/media IP descriptors

This commit adds a has_sem64 capability bit to the graphics and media IP
descriptors and populates gt->info.has_sem64 for Xe3p platforms.

>     The bit indicates whether the GT's command streamer supports the
>     MI_SEMAPHORE_WAIT_64 instruction. A platform's CS must not mix
>     MI_SEMAPHORE_WAIT and MI_SEMAPHORE_WAIT_64 within a context or across
>     context submissions, so both the primary and media GT must agree befo=
re
>     either one enables sem64; resolve has_sem64 once in xe_info_init() and
>     hand the single value to both GT allocators.

[Severity: Low]
Does the commit message match how has_sem64 is resolved?
alloc_primary_gt() and alloc_media_gt() each compute gt->info.has_sem64
independently from their IP descriptor and stepping, and xe_info_init()
afterwards clears both fields if either GT does not support it, rather
than resolving a single value in xe_info_init() and passing it to the GT
allocators.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7fba5295c33e6..5a147a577a098 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -127,6 +127,7 @@ static const struct xe_graphics_desc graphics_xe3p_lp=
g =3D {
>  	.multi_queue_engine_class_mask =3D BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_E=
NGINE_CLASS_COMPUTE),
>  	.num_geometry_xecore_fuse_regs =3D 3,
>  	.num_compute_xecore_fuse_regs =3D 3,
> +	.has_sem64 =3D 1,
>  };
> =20
>  static const struct xe_graphics_desc graphics_xe3p_xpc =3D {
> @@ -153,11 +154,20 @@ static const struct xe_media_desc media_xelpmp =3D {
>  	.hw_engine_mask =3D
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> -		BIT(XE_HW_ENGINE_GSCCS0)
> +		BIT(XE_HW_ENGINE_GSCCS0),
> +};
> +
> +static const struct xe_media_desc media_xe3p_lpm =3D {
> +	.hw_engine_mask =3D
> +		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> +		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> +		BIT(XE_HW_ENGINE_GSCCS0),
> +	.has_sem64 =3D 1,
>  };
> =20
>  static const struct xe_media_desc media_xe3p_hpm =3D {
>  	.has_uncorrectable_error_reporting =3D 1,
> +	.has_sem64 =3D 1,

[Severity: Medium]
Should graphics_xe3p_xpc also set .has_sem64 =3D 1?

alloc_primary_gt() scopes the stepping B0 check to GRAPHICS_VERx100(xe) =3D=
=3D
3510 (graphics_xe3p_lpg), and media_xe3p_hpm (35.03) enables has_sem64.
Because graphics_xe3p_xpc (35.11) omits .has_sem64 =3D 1,
tile->primary_gt->info.has_sem64 is false on Xe3p_XPC platforms, and the
cross-GT check in xe_info_init() then clears
tile->media_gt->info.has_sem64 on the paired Xe3p_HPM media GT as well,
leaving sem64 disabled on both GTs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113155734.4164=
230-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
