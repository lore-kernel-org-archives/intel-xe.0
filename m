Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD1CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12E10E32B;
	Wed, 14 Oct 2026 14:36:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DD510E32B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:36:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EE15A60219;
 Wed, 14 Oct 2026 14:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904211F000C4;
 Wed, 14 Oct 2026 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791988594;
 bh=w6FcUKwwlWqOekyz+tgS8fXID02EQnekn6308oJfQy0=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CVla3YNspOCLHQB2LiQWsAEgLPQ0m0gkqYqbhECWscB67+rOctAIaHquWFlvVMzl2
 KSSpcHbqLAot9H9sTr+RoLQu8RvPwzyBJ+JG/uNB7OE7ltRaxT+wMkRCy2bsP+tPmN
 084JF6wVg8NBHNxeOoReOHoiVIZhxlbdNFXM3r4X92PzLLNYxOWINsVgnOPSjOIhRR
 /f5RV9OOuGYr6VCvvGe77cpVA0wGpM9SsPhsp69SsnfWisFSHPO6nTs0otfjPEfo/V
 Nbo3xT1Ez4XQili90x9KFKXCUTVTF6yZiEl2LiC+pEU8ZAmjnSfuGmgEH9ca/2q4u/
 9RvZxufau91Hg==
Message-ID: <sashiko-outbox-171436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] drm/xe/xe_migrate: Optimize unaligned
 access_memory copies
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014142706.598490-4-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
 <20261014142706.598490-4-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 14:36:34 +0000
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
- [Medium] drm/xe: Greedy alignment strategy forces pitch 1 fallback for sm=
all chunks
--

commit 1f0d5ea5449a5c28cc6017cccf01d783b8426763
Author: Jan Maslak <jan.maslak@intel.com>
drm/xe/xe_migrate: Optimize unaligned access_memory copies

This commit introduces a multi-phase copy strategy in xe_migrate_access_mem=
ory()
to reduce the number of copy jobs. It attempts a short linear copy to reach=
 a
favorable destination alignment, uses a matrix copy for the bulk of the dat=
a,
and falls back to a linear copy for remaining tail bytes.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -2532,7 +2612,6 @@ int xe_migrate_access_memory(struct xe_migrate *m, =
struct xe_bo *bo,
>  		u64 vram_addr =3D vram_region_gpu_offset(bo->ttm.resource) +
>  			cursor.start;
>  		int current_bytes;
> -		u32 pitch;
> =20
>  		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
>  			current_bytes =3D min_t(int, bytes_left,
> @@ -2540,15 +2619,62 @@ int xe_migrate_access_memory(struct xe_migrate *m=
, struct xe_bo *bo,
>  		else
>  			current_bytes =3D min_t(int, bytes_left, cursor.size);
> =20
> -		pitch =3D xe_migrate_copy_pitch(xe, current_bytes,
> -					      write ? vram_addr :
> -					      (unsigned long)buf & ~PAGE_MASK);
> -		if (xe->info.has_mem_copy_instr)
> -			current_bytes =3D min_t(int, current_bytes, U16_MAX * pitch);
> -		else
> -			current_bytes =3D min_t(int, current_bytes,
> -					      round_down(S16_MAX * pitch,
> -							 XE_CACHELINE_BYTES));
> +		{
> +			/*
> +			 * Optimized copy strategy to minimize number of jobs:
> +			 * 1. Linear copy to align dst to best reachable alignment
> +			 * 2. Matrix copy for bulk data copy
> +			 * 3. Single linear copy for remaining bytes
> +			 *
> +			 * The phase logic controls transfer chunking; emit_copy() selects
> +			 * MEM_COPY_CMD or XY_FAST_COPY_BLT based on hardware support.
> +			 */
> +			u64 dst_addr =3D write ? vram_addr :
> +					       (unsigned long)buf & ~PAGE_MASK;
> +			u32 max_linear =3D xe->info.has_mem_copy_instr ? U16_MAX :
> +					 round_down(S16_MAX, XE_CACHELINE_BYTES);

[Severity: Medium]
Does using max_linear instead of current_bytes here cause small unaligned
chunks to fall back to a less efficient pitch 1 copy?

If current_bytes is small (e.g., a fragmented 1000-byte chunk),
xe_migrate_best_alignment() might return PAGE_SIZE because the distance to =
the
next page boundary is less than max_linear.=20

However, since that distance is greater than current_bytes, the Phase 1=20
condition below (bytes_to_align <=3D current_bytes) will fail. The code then
skips Phase 2 and falls back to a linear copy for the entire 1000 bytes.

Passing current_bytes instead of max_linear would scale the target alignmen=
t,
allowing it to reach intermediate boundaries (like SZ_256 or 4) and use a
matrix copy for the bulk of the chunk.

> +			u32 best_align =3D xe_migrate_best_alignment(dst_addr, max_linear);
> +			u32 bytes_to_align =3D best_align ?
> +					     xe_migrate_bytes_to_align(dst_addr, best_align) : 0;
> +
> +			if (bytes_to_align > 0 && bytes_to_align <=3D (u32)current_bytes) {
> +				/*
> +				 * Phase 1: Linear copy to reach best alignment.
> +				 * Copy just enough bytes to align dst_addr.
> +				 */
> +				current_bytes =3D min_t(int, bytes_to_align, max_linear);
> +			} else if (IS_ALIGNED(dst_addr, 4)) {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014142706.5984=
90-1-jan.maslak@intel.com?part=3D3
