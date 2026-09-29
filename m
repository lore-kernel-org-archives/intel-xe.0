Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B2CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92C10F00C;
	Tue, 29 Sep 2026 18:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D1ywm1o4";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E77D10F00C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:27:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C2C06022B;
 Tue, 29 Sep 2026 18:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0AA1F000FF;
 Tue, 29 Sep 2026 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790706439;
 bh=PJ//9fPYYgZTjnrYNhXUXICAL2lbylnP2iuwk1Hhu5A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=D1ywm1o4MPmks+9Escy8WSGnRPRzHxJtkI14GaoIcJQYO3FsFgk5OCFgarKsjZdfn
 taUO1KJP3qH/y+6r/cWVJIKW2PELg+FOxjRdqruCZV64ZLsc3XIF0YpyxW1F2oTWC+
 7G+aH8NCTF7VQWfCYya8c/FKFMVlE0HZl5U9Av0RYz9iBObyQxUFCWPBNqJYchMz0t
 RwRVyMh/ffshhnX+eEGNJhjeRNsuxF1QBKkccuyCqWcBp9MY8B0q/8iRgrD3afIeIc
 9oCU4uxFjOYZJJQjTn204puQxl/6u8TLev6esDgpLTtowfKQRVlGhyfia5MrVmswtx
 mXjNVlbicxL6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] drm/xe: Do not clear SVM device memory allocations
 up front
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260929181024.2743854-4-matthew.brost@intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
 <20260929181024.2743854-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 18:27:18 +0000
Message-Id: <20260929182718.CA0AA1F000FF@smtp.kernel.org>
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
- [High] xe/svm: oversized chunk lengths in migration cause kernel panic
--

commit ed6428a65926a64520b6fe556921289286c9c71f
Author: Matthew Brost <matthew.brost@intel.com>

    drm/xe: Do not clear SVM device memory allocations up front

The patch updates SVM device memory allocations to skip initial clearing
by using XE_BO_FLAG_SKIP_CLEAR. Instead, only sparse areas without CPU
source data are cleared explicitly during migration using the new
xe_svm_clear_vram() function.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f39e647512ad9..1b4d1222fbb7e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -586,6 +586,124 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt =
*gt,
[ ... ]
> +static int xe_svm_clear_vram(struct page **pages, unsigned long npages,
> +			     struct dma_fence **fence,
> +			     struct dma_fence **deps)
> +{
[ ... ]
> +		/* Not contiguous with the pending clear, or chunk is full */
> +		if (count && (addr !=3D vram_addr + count * PAGE_SIZE ||
> +			      count + nr > XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE)) {
> +			err =3D xe_svm_clear_vram_chunk(vr, vram_addr, count,
> +						      fence, deps);
> +			if (err)
> +				return err;
> +			count =3D 0;
> +		}
> +
> +		if (!count)
> +			vram_addr =3D addr;
> +		count +=3D nr;
> +		i +=3D nr;

[Severity: High]
Does this logic allow oversized chunks to bypass the chunk size limit?

If a single device folio exceeds the 8MB limit (e.g., THP or 1GB huge pages)
and is the first page processed in a chunk (where count =3D=3D 0), the check
is skipped.

This would cause the oversized nr to be added to count directly, which later
gets passed to xe_svm_clear_vram_chunk() and xe_migrate_clear_vram().

Could this trigger a kernel panic via an xe_assert() or cause hardware
corruption by emitting oversized memory copy commands that exceed max
parameters?

[ ... ]
> @@ -617,7 +746,6 @@ static int xe_svm_copy(struct page **pages,
>  		u64 __vram_addr;
>  		bool match =3D false, chunk, last;
> =20
> -#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
>  		chunk =3D (i - pos) =3D=3D (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
>  		last =3D (i + 1) =3D=3D npages;

[Severity: High]
Can i - pos entirely overshoot the exact equality check here and later
in the function?

Further down in xe_svm_copy(), the chunk flag is updated for large orders:

			if (pagemap_addr[i].order) {
				i +=3D NR_PAGES(pagemap_addr[i].order) - 1;
				chunk =3D (i - pos) =3D=3D (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
				last =3D (i + 1) =3D=3D npages;
			}

If a large system folio's NR_PAGES (such as a 1GB huge page) is added to i,
could i - pos jump completely over the exact XE_MIGRATE_CHUNK_SIZE boundary,
causing chunk to evaluate to false?

This would bypass the chunk splitting, resulting in an oversized transfer l=
ength
passed to xe_migrate_to_vram() or xe_migrate_from_vram(), which could lead =
to
hardware command corruption and a GPU hang.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929181024.2743=
854-1-matthew.brost@intel.com?part=3D3
