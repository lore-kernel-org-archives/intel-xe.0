Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA590C5DF64
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0490C10F0C1;
	Wed, 12 Aug 2026 17:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CqCX9bwL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D985C10E413
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:55:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B454404F6;
 Wed, 12 Aug 2026 12:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9CC1F00ACA;
 Wed, 12 Aug 2026 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786539316;
 bh=Ibh87rvCZyYheY0JdqGLILoYbCGHyL0KmLKcqou7qCg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CqCX9bwLETmOpNi8i+DF/b2v3lld0cd4DPapBy1/gIlQ7gkbbwvCoEuFx1ebLAmwq
 rRsn4PVSL/+rfJzHqji6R1jKT+mZvCLO55adm9us7tIK6iIK4SLa++bAVnovHQZ/x3
 uL27FU7nsvrvZmRGRY6aPd1D87IApTvNMPK2S3HPxM3aUK5zolHRqdpIERC2rkvlOe
 2BKiBf+ch2J2c+WuSj8yKAKdEtoIi4XRSNNijXV/ifJOljTnMpX177GFWXr48lP6uz
 7KWyQawdtWoj5HY3ZPXuZi/NHKT2Zx+KG/GonWxkON8OwT/Ua6dBytJTiRIB0TB/LZ
 I65x12yCf50fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] drm/xe: Introduce helpers for xe_vram size
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812124313.1377582-13-satyanarayana.k.v.p@intel.com>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-13-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 12:55:15 +0000
Message-Id: <20260812125516.1C9CC1F00ACA@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:21 +0000
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
- [High] `query_mem_regions()` now reports VRAM `min_page_size` as `SZ_4K` =
instead of `PAGE_SIZE` on architectures with `PAGE_SIZE > 4K`, leading to u=
serspace allocation failures.
--

--- Patch [4]: [PATCH v6 4/7] drm/xe: Introduce helpers for xe_vram size ---
commit 8d2aa91dbef321fc3453eaed963150727bdc7dd0
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe: Introduce helpers for xe_vram size

This commit introduces xe_vram_alignment() and xe_vram_needs_64k() helpers.
It updates various files in the xe driver to use these new helpers instead =
of
directly checking the XE_VRAM_FLAGS_NEED64K flag.

> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dc975f5953683..9af98f08b0e59 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -289,8 +289,7 @@ static int query_mem_regions(struct xe_device *xe,
>  			mem_regions->mem_regions[mem_regions->num_mem_regions].instance =3D
>  				mem_regions->num_mem_regions;
>  			mem_regions->mem_regions[mem_regions->num_mem_regions].min_page_size =
=3D
> -				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
> -				SZ_64K : PAGE_SIZE;
> +				xe_vram_alignment(xe);

[Severity: High]
Does this code report the minimum page size correctly on architectures where
PAGE_SIZE is greater than 4K?

The previous code returned PAGE_SIZE when 64K alignment was not needed, but
xe_vram_alignment() now always returns SZ_4K in that case.

If userspace uses this 4K value to size its allocations, could those
allocations be rejected in xe_gem_create_ioctl()?

drivers/gpu/drm/xe/xe_bo.c:xe_gem_create_ioctl() {
        ...
        if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
                return -EINVAL;
        ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812124313.1377=
582-9-satyanarayana.k.v.p@intel.com?part=3D4
