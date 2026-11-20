Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8E606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fnkBb/wx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B97810E8C6;
	Fri, 20 Nov 2026 12:24:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111C1129C3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 12:23:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 519E443C15;
 Fri, 20 Nov 2026 12:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D31F000CA;
 Fri, 20 Nov 2026 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795177391;
 bh=dTgAGLrrCZx3i4Tr/6ey9Dm3ZtLVF+nxy7GysGjSngY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=fnkBb/wxtDOtLNgKu/JQac9WpOzEUsabgTLCfAgbJHT1gbxxfMmLvqOkj5Qf+HgCf
 j/yS4LgRho+Fff0A+mUJGiPMVT3VzxWw7ArtLknp4vjuC08YLhnVpgTbIxKeMP1XLd
 Bzc2aichP42vQhLtFb58SVBqasRYE0aut+aq9iNiuIZIAFYza69YU6r5Vc3EueB0oE
 u7SITK38YQj3a3k0DHcxDXlcP8xkqznrs/oErXqqgQF5/i3P0ckqpI8dP6hCjp8v1e
 Zl9WTM/6GiyLBVgzm10OJaJpMLwDdrKU4ax3lR7mtEnQgpPLCkX5VO64kqRCTJ9O2q
 T0ANSO0skt7kw==
Message-ID: <sashiko-outbox-225139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120120231.748267-2-tilak.tirumalesh.tangudu@intel.com>
References: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
 <20261120120231.748267-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 12:23:10 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe: missing has_sem64 in graphics_xe3p_xpc disables sem64
  on 35.11/35.03
--

commit a3b281833b67c5a6ce1acdb4fe1005d2dea0dadd
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add has_sem64 bit to graphics/media IP descriptors

This commit adds a has_sem64 capability flag to the graphics and media IP
descriptors for Xe3p platforms and resolves gt->info.has_sem64 during GT
initialization, clearing it on both GTs if the primary and media GTs
disagree.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3bd68ed9daa81..a7ceb570d89af 100644
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
Should graphics_xe3p_xpc (Graphics IP 35.11) also set .has_sem64 =3D 1?

In alloc_primary_gt(), the stepping check is scoped to
GRAPHICS_VERx100(xe) =3D=3D 3510, matching MEDIA_VERx100(xe) =3D=3D 3500 in
alloc_media_gt().  Because graphics_xe3p_xpc omits .has_sem64 =3D 1,
tile->primary_gt->info.has_sem64 is always false on Graphics IP 35.11, and
the cross-GT check in xe_info_init() then clears
tile->media_gt->info.has_sem64 back to false on the paired Media IP 35.03
(media_xe3p_hpm) GT as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120120231.7482=
67-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
