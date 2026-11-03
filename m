Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9E606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HeKENjF4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEAE10E153;
	Tue,  3 Nov 2026 12:55:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4710F576
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 12:55:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6346D40908;
 Tue,  3 Nov 2026 12:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279871F000C1;
 Tue,  3 Nov 2026 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793710515;
 bh=aMHK8n7gfM0Vh7p+P9YnDA8zLhFAqiErZ0gM8ncONaQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HeKENjF4sCUaPmJXSTcf4h7k0TAUUXMM/5zmdElONm4ZfZsYDhVxx/OX1lJ6833BP
 ujxJxVMmRTdDf3OE9vU7FOcfLVlygr8XJ4xe3qdOwuib7JVpO8PNC2i29ujWlKlCpg
 tVtFpVKf71bE4UecczA6qgCwc6mL9x/IReTA4gyYZR7+P+C92AdGnxGnIRNiwiQ7jv
 /R9w8tP9drSzK6PDwCcAV52y86PEHYHXyGBmm0TLizcydM632XCqy8vvygQY31ySOa
 6DJ4WD7VTGDZG5icXiP4ZxfdGtUz/5+P9sZEPO1yCKWiKBiv8Eo6BBZwfZJEOeBBvM
 oeXNZZY6HKT3w==
Message-ID: <sashiko-outbox-195296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/3] drm/xe: Add has_sem64 bit for
 MI_SEMAPHORE_WAIT_64 support
To: tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
In-Reply-To: <20261103123727.2465599-2-tilak.tirumalesh.tangudu@intel.com>
References: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
 <20261103123727.2465599-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 12:55:14 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: missing has_sem64 flag in graphics_xe3p_xpc for Graphics=
 IP 35.11
--

commit e1d30e55c4a283d0df58dcd8db0d23543f7de13c
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

drm/xe: Add has_sem64 bit for MI_SEMAPHORE_WAIT_64 support

This commit adds the MI_SEMAPHORE_WAIT_64 instruction definition and a
has_sem64 flag to the graphics and media IP descriptors for Xe3p platforms
as part of Wa_16029281913. It also filters out steppings prior to B0 on
Graphics version 35.10 and Media version 35.00 when resolving
gt->info.has_sem64.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5da35d36526fe..ee561ce93835f 100644
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
> @@ -198,7 +208,7 @@ static const struct xe_ip media_ips[] =3D {
>  	{ 2000, "Xe2_LPM", &media_xelpmp },
>  	{ 3000, "Xe3_LPM", &media_xelpmp },
>  	{ 3002, "Xe3_LPM", &media_xelpmp },
> -	{ 3500, "Xe3p_LPM", &media_xelpmp },
> +	{ 3500, "Xe3p_LPM", &media_xe3p_lpm },
>  	{ 3503, "Xe3p_HPM", &media_xe3p_hpm },
>  };
> =20
> @@ -899,6 +909,9 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile =
*tile,
>  	gt->info.has_indirect_ring_state =3D graphics_desc->has_indirect_ring_s=
tate;
>  	gt->info.has_uncorrectable_error_reporting =3D
>  		graphics_desc->has_uncorrectable_error_reporting;
> +	/* excludes configs that don't support sem64 */
> +	gt->info.has_sem64 =3D graphics_desc->has_sem64 &&
> +		!(GRAPHICS_VERx100(xe) =3D=3D 3510 && xe->info.step.graphics < STEP_B0=
);

[Severity: Medium]
Should graphics_xe3p_xpc (Graphics IP 35.11, Xe3p_XPC) also have
.has_sem64 =3D 1 set in drivers/gpu/drm/xe/xe_pci.c?

On the media side, both Xe3p media descriptors (media_xe3p_lpm for 35.00
and media_xe3p_hpm for 35.03) set .has_sem64 =3D 1, and alloc_media_gt()
scopes the stepping B0 check to MEDIA_VERx100(xe) =3D=3D 3500 so that 35.03
enables has_sem64 on all steppings.

In alloc_primary_gt(), the stepping B0 check is similarly scoped to
GRAPHICS_VERx100(xe) =3D=3D 3510, which suggests other Xe3p graphics versio=
ns
are expected to have graphics_desc->has_sem64 set without the stepping
restriction. However, in graphics_ips[]:

drivers/gpu/drm/xe/xe_pci.c:
	{ 3510, "Xe3p_LPG", &graphics_xe3p_lpg },
	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },

only graphics_xe3p_lpg (used exclusively by 3510) sets .has_sem64 =3D 1,
while graphics_xe3p_xpc omits it. As a result, when xe_info_init() calls
alloc_primary_gt() on Graphics IP 35.11, gt->info.has_sem64 remains 0 on
the primary GT even though its paired media GT (35.03, media_xe3p_hpm) sets
gt->info.has_sem64 =3D 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103123727.2465=
599-1-tilak.tirumalesh.tangudu@intel.com?part=3D1
