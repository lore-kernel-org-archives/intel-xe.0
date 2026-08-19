Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D759C5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8410E02D;
	Wed, 19 Aug 2026 19:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emEM4JNv";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7546310E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:29:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A42C44850;
 Wed, 19 Aug 2026 19:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202C21F000E9;
 Wed, 19 Aug 2026 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167768;
 bh=cG5yxwm/MKWXjA2GvKwrf2++AICFrCF4igARLlVxTIA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=emEM4JNvnOaqXetU0sciFNF0KB6XhWIFF5V76UXheFll03BgTgeTNj1/xLFIBewsc
 xrfmF+EsFKiYQgMt0YOyDIulLHoKc0K3vDakPrZh2Ne8G46CirZXP9BeRydUTCAoEY
 +KeKo7cHX+/P/FMQjuWdc3I+Y816/rqdkg0GZ/rVUxyv0Ku4bQ05BLpgpigqu+br8f
 cc8vH+FbhvXadDAH0los3/Y4mbWVYWAKwZIa+vQZmek3gfLYdL+rvx+O+OozogB+Xw
 y5jK2yLY192CjtT/lMNAZhvc4BHx1hxTlJvmq6J4r/1euRqWfPwbskmLIXSgZ3eRIZ
 02pFThd5wLJ0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-13-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:29:27 +0000
Message-Id: <20260819192928.202C21F000E9@smtp.kernel.org>
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
- [Low] Incomplete replacement of drm_info() with xe_log_info() for VRAM re=
porting.
- [Low] Brittle error handling by hardcoding -ENODEV instead of using the r=
eturned error variable.
--

--- Patch [12]: [PATCH 12/12] drm/xe/vram: Report VRAM errors using structu=
red xe_log API ---
commit 0430f39e6a6ab1de29f7a59722a6a22038b4d848
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/vram: Report VRAM errors using structured xe_log API

Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
using the VRAM component tag.

Move the "no CPU visible VRAM" error out of vram_region_init() into its
callers so that tile-based usage logs with the tile as location while
device-level usage logs with the device. This gives better diagnostics
by identifying which tile has no visible VRAM.

> Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
> using the VRAM component tag.

[Severity: Low]
Were the drm_info() calls in print_vram_region_info() intentionally skipped?

The commit message mentions replacing drm_info(), but print_vram_region_inf=
o()
in drivers/gpu/drm/xe/xe_vram.c still uses drm_info(). This leaves the VRAM
logging inconsistent.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 23eb7edbdd572..9fae593b07413 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c

[ ... ]

> @@ -311,14 +311,18 @@ int xe_vram_probe(struct xe_device *xe)
>  		total_size +=3D region_size;
>  		available_size +=3D usable_size;
> =20
> -		err =3D vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, u=
sable_size,
> +		err =3D vram_region_init(xe, tile->mem.vram, &lmem_bar,
> +				       tile_offset, usable_size,
>  				       region_size, remain_io_size);
> -		if (err)
> +		if (err) {
> +			xe_log_err_fatal(tile, VRAM, -ENODEV,
> +					 "without any CPU visible VRAM. Aborting.\n");

[Severity: Low]
Would it be better to pass the 'err' variable here instead of hardcoding
-ENODEV?

If vram_region_init() is modified in the future to return other error
codes (like -ENOMEM), this log message will incorrectly report -ENODEV inst=
ead
of the actual error code.

>  			return err;
> +		}
> =20
>  		if (total_size > lmem_bar.io_size) {
> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &lmem_bar.io_size);
> +			xe_log_info(xe, VRAM, "%pa is larger than resource %pa\n",
> +				    &total_size, &lmem_bar.io_size);
>  		}
> =20
>  		remain_io_size -=3D min_t(u64, tile->mem.vram->actual_physical_size, r=
emain_io_size);
> @@ -326,8 +330,11 @@ int xe_vram_probe(struct xe_device *xe)
> =20
>  	err =3D vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size=
, total_size,
>  			       lmem_bar.io_size);
> -	if (err)
> +	if (err) {
> +		xe_log_err_fatal(xe, VRAM, -ENODEV,
> +				 "without any CPU visible VRAM. Aborting.\n");

[Severity: Low]
Should this also use the 'err' variable instead of hardcoding -ENODEV?

>  		return err;
> +	}
> =20
>  	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D12
