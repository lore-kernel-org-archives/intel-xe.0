Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F92CC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3617710E480;
	Thu, 13 Aug 2026 00:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="azHH6Iip";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43C410E480
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:21:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D59E40A2F;
 Thu, 13 Aug 2026 00:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EC51F000E9;
 Thu, 13 Aug 2026 00:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786580507;
 bh=oYoHHH0LSxuRROanO5q/rnj4Fy0FSxGKSFMnhFRmpgc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=azHH6IipndWHJkoflcmTQdG5F73q1yC2T8KCkvJJJUyXusdeTTvKtSuA8VdNpzCSU
 qOizvEmdwACp6LkdvLT4AlmxB1Oie7ol7YgVCcia3qDeQlEAE0JyPAdBqcVcXdelzE
 ul3IObNHzA4YC4Fh9yD75GV2x0mQpQPrOJntv5dMQJpvkt/dpNayxqfP/kT7zShfyh
 yFBvWVhLsstvrGJDDqdXHQqMtV6S8cVfAvoDW6eMfAmDWUDgBAOs9M4BzQJoSD4fyR
 zHxdC8LtkaIdjcpmku6IhpElaBCY4+t5AZkb9GsXu5biKqJ/5MqGrH3rY1kDVVVWfD
 zcBmaNDZFON5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle
 access with unplug
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813000654.2712317-2-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-2-zongyao.bai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 00:21:46 +0000
Message-Id: <20260813002147.04EC51F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete device unplug synchronization in query ioctls leading t=
o potential MMIO access after unplug.
- [Medium] Missing array_index_nospec() on user-provided indices creates Sp=
ectre v1 gadgets.
--

--- Patch [1]: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle ac=
cess with unplug ---
commit cd6f1d67df5ef0b65b3a0c38b2fc6c7bd6e42c60
Author: Zongyao Bai <zongyao.bai@intel.com>

drm/xe/forcewake: synchronize engine-cycle access with unplug

This patch adds drm_dev_enter() and drm_dev_exit() to query_engine_cycles()
to protect forcewake and MMIO accesses against device unplug operations. It
also updates the probe failure path to use drm_dev_unplug() to ensure proper
synchronization.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 71111ad324658..81b31325e5817 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c

[ ... ]

> @@ -1166,7 +1166,7 @@ int xe_device_probe(struct xe_device *xe)
> =20
>  err_unregister_display:
>  	xe_display_unregister(xe);
> -	drm_dev_unregister(&xe->drm);
> +	drm_dev_unplug(&xe->drm);
> =20
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dc975f5953683..3c356bc48e2ab 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c

[ ... ]

> @@ -143,28 +145,44 @@ query_engine_cycles(struct xe_device *xe,
>  		return -EINVAL;
> =20
>  	eci =3D &resp.eci;
> +	if (!drm_dev_enter(&xe->drm, &dev_idx))
> +		return -ENODEV;
> +

[Severity: High]
This is a pre-existing issue, but since this patch introduces device unplug
synchronization for query_engine_cycles(), should similar protection be add=
ed
to other queries like query_pxp_status() and query_oa_units()?

In xe_query.c, query_pxp_status() accesses hardware status without SRCU
protection:

query_pxp_status()
    xe_pxp_get_readiness_status(xe->pxp);

Similarly, query_oa_units() reads MMIO indirectly:

query_oa_units()
    xe_oa_timestamp_frequency()
        xe_mmio_read32()

Without drm_dev_enter() protection, can these queries cause page faults if a
userspace process calls DRM_IOCTL_XE_DEVICE_QUERY concurrently with a device
unplug event?

>  	gt =3D xe_device_get_gt(xe, eci->gt_id);
> -	if (!gt)
> -		return -EINVAL;
> +	if (!gt) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> =20
> -	if (eci->engine_class >=3D ARRAY_SIZE(user_to_xe_engine_class))
> -		return -EINVAL;
> +	if (eci->engine_class >=3D ARRAY_SIZE(user_to_xe_engine_class)) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> =20
>  	hwe =3D xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>  			      eci->engine_instance, true);

[Severity: Medium]
This is a pre-existing issue, but does the engine_class array access need
mitigation against speculative execution?

The eci->engine_class index comes directly from userspace and is used
to access the user_to_xe_engine_class array after a bounds check.
Could this be used to bypass bounds checks speculatively and leak
information via cache side channels?

Additionally, earlier in this function xe_device_get_gt() is called with
eci->gt_id, which also originates from userspace:

xe_device_get_gt()
    if (gt_id >=3D xe->info.tile_count * xe->info.max_gt_per_tile)
        return NULL;
    tile =3D &xe->tiles[gt_id / xe->info.max_gt_per_tile];

Should array_index_nospec() be used for these userspace-provided indices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813000654.2712=
317-1-zongyao.bai@intel.com?part=3D1
