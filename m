Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC6CA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 10:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF1610F5EC;
	Thu,  1 Oct 2026 10:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kqaNDHzr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4A10F5EC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 10:01:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EC31E60234;
 Thu,  1 Oct 2026 10:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D1E1F00898;
 Thu,  1 Oct 2026 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790848876;
 bh=Eihb6oYLKV1WAHLXPZ7peh+qI3bixDbJZGQ/VpKzAK0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kqaNDHzr43YIOrvdqH4hwed3dEwbB6rNGDRb1dPelvVBLI+eOSOySvrQrv+zAlud3
 MX94Cjz+ErrG3aKB4JF04ZVyVF4w7KNwRj7JV7+lDgakcY0/KatNCla4oDEpx+xIPI
 RkW5yjy/z/Nzr5/JgKbwVxOBYg70/+BE8BLzR9Hu4D/tS3MHXkwwW+epLc5Zmz510f
 i8DRr7jqy4pwxewbqFvD6HeAm2GCWWIlkHtmlbvaVE4/kn1zyDg8XB4xwHe+6i0scp
 lqW6ABRN5Cv3HTkrORC7RT3xeDb3KXZRtsJcso1DvSWk5jRNg8sQ5TwuTfBcO64Uzo
 PGb8SXogCLYXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] drm/xe: Keep VRAM fault injection within the usable
 range
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001094518.1493651-10-tejas.upadhyay@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
 <20261001094518.1493651-10-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 10:01:16 +0000
Message-Id: <20261001100116.82D1E1F00898@smtp.kernel.org>
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
- [Medium] xe: unaligned VRAM fault injection address on PAGE_SIZE > 4K
--

commit ec0c39c567f41b1c9847a4f7270a2e926f7a5f9b
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe: Keep VRAM fault injection within the usable range

This commit changes the fault injection probe in xe_ttm_vram_inject_fault()
to start at vr->usable_size rather than vr->actual_physical_size. This keeps
the injected faults within the buddy-managed VRAM range instead of hitting
the CCS/GSM/DSM infrastructure zone.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 7211ab5f66e9b..ec15eab1a2edb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -988,11 +988,12 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
>  	struct gpu_buddy *mm =3D &vram_mgr->mm;
>  	u64 addr;
> =20
> -	if (vr->actual_physical_size < PAGE_SIZE)
> +	/* Stay within the buddy-managed range; CCS/GSM/DSM sit beyond usable_s=
ize */
> +	if (vr->usable_size < PAGE_SIZE)
>  		return -ENOSPC;
> =20
> -	addr =3D vr->actual_physical_size - PAGE_SIZE;
> -	while (addr < vr->actual_physical_size) {
> +	addr =3D vr->usable_size - PAGE_SIZE;

[Severity: Medium]
Will this result in an unaligned VRAM fault injection address on systems wh=
ere
PAGE_SIZE > 4K (e.g., ARM64)?

Since vr->usable_size is only guaranteed to be 4K aligned (via=20
round_down(offset, SZ_4K) in get_flat_ccs_offset()), subtracting a larger=20
PAGE_SIZE here would produce an address that is not PAGE_SIZE aligned.

If this unaligned address is subsequently passed to=20
xe_ttm_vram_handle_addr_fault(), will it trigger a WARN_ON_ONCE and fail=20
the fault injection test with -EINVAL, effectively breaking the debugfs=20
interface on these architectures?

> +	while (addr < vr->usable_size) {
>  		struct gpu_buddy_block *block;
>  		bool found =3D false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001094518.1493=
651-6-tejas.upadhyay@intel.com?part=3D4
