Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6D606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnKgGuIl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56ECC10E142;
	Fri, 20 Nov 2026 19:45:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DE610E070
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 19:45:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8167844746;
 Fri, 20 Nov 2026 19:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81EE1F000C6;
 Fri, 20 Nov 2026 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795203912;
 bh=pfTEDgnSLEtA49IGudjTij+IynewPpzEoWn1dc2TUKI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=MnKgGuIlBZ0ML8mZ5uxJ2DkltX2IhPtc+m/mPVhxzrpfW3PWdeW+U0cwNSC7IHql0
 19hxD+lCpq+wJc217+v5G5o/9FCzky0PTDLBJ5VCmiPyXUwcl6xfL1I1cZZBuBzjhi
 naajEO4j9377cZ9f+LKHl+bjaIOjgZM6l9uz1JZpTyXSFaraAAXKwjSHgssVxdux/U
 azsuJ2rDIv9BGQLf6KBM6dyQpTBezv7t8yKXgye4wToWe3pgZHSSugN2627Xvi2QIc
 XYrNzRrs8tJM8/w+0XxuQ+iaTaYVIrQVDptBSwhFX53POwOd6DPiadYD+YkUR2iAir
 t4ovo9jv+q2hA==
Message-ID: <sashiko-outbox-225952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] drm/xe: Add has_sem64 bit to graphics/media IP
 descriptors
To: "Jesus Narvaez" <jesus.narvaez@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120191111.4097737-5-jesus.narvaez@intel.com>
References: <20261120191111.4097737-4-jesus.narvaez@intel.com>
 <20261120191111.4097737-5-jesus.narvaez@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:45:11 +0000
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
- [Medium] drm/xe: missing has_sem64 flag in graphics_xe3p_xpc
  descriptor
--

commit 6227ca14d3bce991c8f5af40550a547f1e3e27ff
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add has_sem64 bit to graphics/media IP descriptors

This commit adds a has_sem64 capability flag to graphics and media IP
descriptors for Xe3p platforms and clears gt->info.has_sem64 on both GTs in
xe_info_init() if the primary and media GTs do not both support it.

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
>  	.hw_engine_mask =3D
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |

[Severity: Medium]
Should graphics_xe3p_xpc also set .has_sem64 =3D 1?

alloc_primary_gt() scopes the stepping B0 check specifically to graphics IP
35.10, and media_xe3p_hpm (media IP 35.03) enables .has_sem64 =3D 1.  Becau=
se
Xe3p_HPM is paired with Xe3p_XPC (graphics IP 35.11) and xe_info_init()
clears has_sem64 on both GTs unless both set it, leaving .has_sem64 unset on
graphics_xe3p_xpc keeps has_sem64 disabled across the entire device on
Xe3p_XPC and makes media_xe3p_hpm.has_sem64 ineffective.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120191111.4097=
737-4-jesus.narvaez@intel.com?part=3D1
