Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC97CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0210E830;
	Thu,  8 Oct 2026 12:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ap9lItnI";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CDF10E830
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:44:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 215AD409F1;
 Thu,  8 Oct 2026 12:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0141F000FF;
 Thu,  8 Oct 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791463444;
 bh=bFbQKMa1t7nT1DtjDe0CTaHMcQXkxG3DwHW/cpAew9Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ap9lItnIvc1WE85oJGdGtTqsOg9WFhtxf7sJtQuSkq7QwPpAwt2qRMnJbNF5b58dk
 E9l2qXR1enMh3SjC5jAeDyo1mYaolFYRuGB9+aPSzNYUQs5VFa8rvIM5tUsjoNKpjH
 VjUeC34/neGJiTEJdYI3z7f0EnDaPU5TBU1+C5goiZ7faXPQ9XCFDKzmYQS1UU4kR5
 /bNpE6UBI3oUR/zuTNBi6KDs9V9LOJJGc8NxyexkjCKM8ZoVOzYIIMD279uNwYjNod
 Cb1eMtq7kCsZ/ZmaMia8OPYMR450sWVBx+G0X4iCELgFljrIj7OPqhk8Vt1GMvXCX2
 1VW6PTrryVrNw==
Message-ID: <sashiko-outbox-164170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] drm/xe: Track number of populated ttm_tts in the
 shrinker
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261008123024.38522-2-thomas.hellstrom@linux.intel.com>
References: <20261008123024.38522-1-thomas.hellstrom@linux.intel.com>
 <20261008123024.38522-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 12:44:03 +0000
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
- [High] drm/xe: shrinker accounting underflow on madvise of pinned BOs
--

commit 0b5d1dd0e073a31ff71e38b6052b00140aecc46a
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Track number of populated ttm_tts in the shrinker

This commit adds a populated_tts counter to struct xe_shrinker to track
the number of ttm_tts that are populated and on the LRU. It also extends
xe_shrinker_mod_pages() to atomically update both page and object accountin=
g.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c

[ ... ]

> @@ -975,11 +975,11 @@ static void xe_bo_set_purgeable_shrinker(struct xe_=
bo *bo,
>  	if (!xe_tt->purgeable && new_state =3D=3D XE_MADV_PURGEABLE_DONTNEED) {
>  		xe_tt->purgeable =3D true;
>  		/* Transfer pages from shrinkable to purgeable count */
> -		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages, tt_pages, 0);
>  	} else if (xe_tt->purgeable && new_state =3D=3D XE_MADV_PURGEABLE_WILLN=
EED) {
>  		xe_tt->purgeable =3D false;
>  		/* Transfer pages from purgeable to shrinkable count */
> -		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -tt_pages, 0);

[Severity: High]
Does this logic cause an underflow in the shrinker page accounting when a
buffer object is pinned?

When a BO is pinned (e.g., used as a scanout framebuffer which calls
xe_bo_pin()), its pages are explicitly excluded from shrinker tracking.
However, if userspace subsequently calls the DRM_XE_VM_MADVISE ioctl on
the VMA to transition its state to DONTNEED or WILLNEED,
xe_bo_willneed_put_locked() invokes xe_bo_set_purgeable_shrinker().

Because xe_bo_set_purgeable_shrinker() unconditionally transfers pages
between the shrinkable and purgeable buckets without checking if the BO
is pinned (bo->ttm.pin_count > 0), this can lead to an integer underflow
on shrinkable_pages or purgeable_pages.

When evaluated by xe_shrinker_count(), a negative signed value casts to a
large positive unsigned long, creating excessive reclaim pressure.
Furthermore, when the BO is eventually unpinned, its pages will be added
back to the shrinker accounting based on its new state, resulting in a
permanent double-counting of pages that triggers an xe_assert() during
xe_shrinker_fini().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008123024.3852=
2-1-thomas.hellstrom@linux.intel.com?part=3D1
