Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58306CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F8810FE70;
	Wed, 14 Oct 2026 13:57:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F96210FFB7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:57:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7FC5860218;
 Wed, 14 Oct 2026 13:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169361F00A2F;
 Wed, 14 Oct 2026 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791986230;
 bh=wzgVwk3fD6/8jqVGyQdSsNHqGHIikfP53iGkSmr8MSE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=D/08iTTJ4gJuD0KTCuxdClBIOwN3kmB6sZHTW5zEzwZqsW0HPWrGpPVWLUx2sllHP
 5B2jDn8lt2ZwyoPGbeY3SrSMIdK4EWeHvLlu2H6I2UtrpW5vzGyueNGZUdH3cXfm2v
 t3VUTc/8tFAkvblaqioHkctkNuTXlGM6hN7pcpDsQsgG87RGNM9m/NxB2gWW7NyE7U
 Ql8q536AzzMOfTbKZKDbl0Cz3LXpZ/3YAGmuKx4oZBtP3vzCUI5+qF7hVSIFp7nWVH
 J3zp/lneKdEPidNfb2QBpnalTbwGFT2/rOGKO7ADac6WHSuF5UkLu6uozuGT6KdrOM
 FOOCEkQHULetA==
Message-ID: <sashiko-outbox-171388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] drm/xe/xe_migrate: Optimize unaligned
 access_memory copies
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014134634.582314-4-jan.maslak@intel.com>
References: <20261014134634.582314-1-jan.maslak@intel.com>
 <20261014134634.582314-4-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:57:09 +0000
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
- [High] xe_migrate: Integer overflow in max_bytes calculation with 64K pag=
es
- [Low] drm/xe: unused variable 'pitch' in xe_migrate_access_memory()
--

commit 1cfd0248d15da5743e2e644789c02a8f2508bbb8
Author: Jan Maslak <jan.maslak@intel.com>
Date:   Wed Oct 14 13:46:33 2026 +0000

    drm/xe/xe_migrate: Optimize unaligned access_memory copies

This commit modifies xe_migrate_access_memory() to optimize memory copies
by splitting transfers into an alignment phase, a matrix copy phase, and a
tail phase. It calculates the largest supported alignment pitch and
restricts copy lengths accordingly.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 4b995c93fcea9..5609f29b28fea 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -2540,15 +2620,66 @@ int xe_migrate_access_memory(struct xe_migrate *m=
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
> +			u32 best_align =3D xe_migrate_best_alignment(dst_addr, max_linear);
> +			u32 bytes_to_align =3D best_align ?
> +					     xe_migrate_bytes_to_align(dst_addr, best_align) : 0;
> +
> +			if (bytes_to_align > 0 && bytes_to_align <=3D (u32)current_bytes) {
> +				/*
> +				 * Phase 1: Linear copy to reach best alignment.
> +				 * Copy just enough bytes to align dst_addr.
> +				 */
> +				pitch =3D 1;

[Severity: Low]
Is the pitch variable used anywhere after being assigned?

It looks like it is assigned multiple times across these branches but is ne=
ver
read or passed to xe_migrate_vram() later in the loop. Could this unused
variable trigger compiler warnings with CONFIG_WERROR?

> +				current_bytes =3D min_t(int, bytes_to_align, max_linear);
> +			} else if (IS_ALIGNED(dst_addr, 4)) {
> +				/*
> +				 * Phase 2: Matrix copy for aligned bulk data.
> +				 * Use the best pitch that dst alignment supports,
> +				 * then round down len to that pitch.
> +				 */
> +				u32 dst_pitch =3D xe_migrate_dst_pitch(dst_addr);
> +				u32 aligned_len =3D xe_migrate_aligned_copy_len(current_bytes,
> +								      dst_pitch);
> +
> +				if (aligned_len >=3D dst_pitch) {
> +					u32 max_bytes =3D xe->info.has_mem_copy_instr ?
> +							U16_MAX * dst_pitch :
> +							round_down(S16_MAX * dst_pitch,
> +								   XE_CACHELINE_BYTES);
> +
> +					pitch =3D dst_pitch;
> +					current_bytes =3D min_t(int, aligned_len, max_bytes);

[Severity: High]
Can max_bytes overflow and become negative here when cast by min_t()?

On architectures supporting 64K pages (where PAGE_SIZE is 65536), max_bytes
would be evaluated as U16_MAX * dst_pitch (65535 * 65536 =3D 4294901760, or
0xFFFE0000).

Because min_t(int, ...) forces a cast to a signed 32-bit int, 0xFFFE0000
evaluates to -131072. Since -131072 is less than aligned_len, current_bytes
would become negative. This negative value would then be passed to
xe_migrate_vram() where it is implicitly cast to an unsigned long, wrapping
around to an enormous positive value and triggering out-of-bounds page table
indexing.

> +				} else {
> +					/*
> +					 * Phase 3: Linear copy for remainder.
> +					 * Not enough for matrix copy - do single linear copy.
> +					 */
> +					pitch =3D 1;
> +					current_bytes =3D min_t(int, current_bytes, max_linear);
> +				}
> +			} else {
> +				/*
> +				 * Phase 3: Linear copy for remainder.
> +				 * dst not 4-aligned and can't reach alignment - linear copy.
> +				 */
> +				pitch =3D 1;
> +				current_bytes =3D min_t(int, current_bytes, max_linear);
> +			}
> +		}
> =20
>  		__fence =3D xe_migrate_vram(m, current_bytes,
>  					  (unsigned long)buf & ~PAGE_MASK,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014134634.5823=
14-1-jan.maslak@intel.com?part=3D3
