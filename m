Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061AFC624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB24D10E6F0;
	Mon, 31 Aug 2026 08:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DrbPjyi8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B510E6EC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:08:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A72AD6013A;
 Mon, 31 Aug 2026 08:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F171F000E9;
 Mon, 31 Aug 2026 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788163728;
 bh=Rsx/OxzAn/7xKCT1o2FWMoN5ThKEiJc4Szan4qEaPyk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DrbPjyi8XupvB8YPoKjR7eiXHv/9OrC38TG8PdobR5ygz7F92bM8AAYwR2tiM4B39
 FS0Jb1aVUOZsYHFmzPCw2Vg6j2CQDuhrk9wWmvhRB7Tv2CvYS3TEBl/1DY5M768lG1
 cqYsodKZ7JpIiAs9pQt1K5dlY+R4HEg1aYvmNo9mYEirRlcOt0rcySkAbhjbxU5V8C
 SOec9X9An/CIAqXE9eR3nl1eiLPUs/3ESl+lICbUBpGXO/QAe6QeyU2IepHO0FpliX
 xOvNAjZBU5MSPOisxkgLbBxOW/0aSxIQKiUTFfeFt5Wcku2OjjiDy3X72x7oArFT+i
 nLIo+FIqIDNlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 07/15] drm/xe/vram: Extract buddy alloc and free
 helpers
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-24-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-24-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:08:47 +0000
Message-Id: <20260831080848.30F171F000E9@smtp.kernel.org>
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
- [Medium] Uninitialized output parameter `used_visible` in `xe_ttm_vram_bu=
ddy_alloc()`.
--

commit 9483caeb9aea9c04580bdd071e565c0158f680fa
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: Extract buddy alloc and free helpers

This commit factors out block allocation and freeing into reusable helpers
xe_ttm_vram_buddy_alloc() and xe_ttm_vram_buddy_free(). These helpers
consolidate block allocation with visible-size tracking for upcoming VRAM
page offline reservation paths.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 51e983ee3bad4..16ecea4977809 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> +static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 star=
t,
> +				   u64 end, u64 size, u64 min_page_size,
> +				   struct list_head *blocks, unsigned long flags,
> +				   void *priv, u64 *used_visible)
> +{
[ ... ]
> +	if (end <=3D mgr->visible_size) {
> +		*used_visible =3D size;
> +	} else {
> +		list_for_each_entry(block, blocks, link) {
> +			u64 blk_start =3D gpu_buddy_block_offset(block);
> +
> +			if (blk_start < mgr->visible_size) {
> +				u64 blk_end =3D blk_start + gpu_buddy_block_size(mm, block);
> +
> +				*used_visible +=3D min(blk_end, mgr->visible_size) - blk_start;

[Severity: Medium]
Does this accumulate into an uninitialized variable?

In this else branch, *used_visible is incremented via +=3D without being
explicitly zeroed first. If a caller does not explicitly initialize the
memory pointed to by used_visible before calling xe_ttm_vram_buddy_alloc(),
this will accumulate garbage values and corrupt the VRAM visible memory
accounting in mgr->visible_avail.

While current callers seem to pass pointers to zero-allocated memory,
could *used_visible be explicitly initialized to 0 before the loop to
prevent a trap for future callers?

> +			}
> +		}
> +	}
> +
> +	mgr->visible_avail -=3D *used_visible;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D7
