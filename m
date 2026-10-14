Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B50CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6DF10FEAE;
	Wed, 14 Oct 2026 13:58:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73E310FEA2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:58:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5ADEB43E23;
 Wed, 14 Oct 2026 13:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143851F00A2F;
 Wed, 14 Oct 2026 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791986331;
 bh=NrJ+X1yMWtZ37F6VbA93/ZmRJZDH9dXMX2bcv7x2HwI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PKVMEnposb8WR9D2u9yYOiMCYOBfXHrmrAZ2MrO6gMfjmVgzQ1nO04APt2tfQj1Au
 HXxfHBAiMVSPilHHKExMKnEMne7s6d7LLI5PGMs+RAGVq1ppUwP/Sz59eCqQDiMEf/
 IbqEQLgBIagD03szbQ4mc7pjV23rhVJgr8K2wuvrIaieLDLgbMzHEy/kNRs0xT5R5l
 0LvIx0f1mwBS/mUgN7uqGtEdd+cUX5Ng3uyepzDtC/YOBH6aH8PmFfNu+INP2EdFx0
 PBJs0+ala4yM8ObZZDQGqIry2wGMH+IorZpFm6yMuuiUYcyrCnc62I5W9Yb8uFOJIo
 p5OfQ2MXPpGfQ==
Message-ID: <sashiko-outbox-171390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014134634.582314-3-jan.maslak@intel.com>
References: <20261014134634.582314-1-jan.maslak@intel.com>
 <20261014134634.582314-3-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:58:50 +0000
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
- [Medium] drm/xe: integer overflow and assertion failure with 64K pages
--

commit c393bea53ab90ffca1212c4a87ea68cccbab7104
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe/xe_migrate: Align MEM_COPY pitch with destination address

MEM_COPY_CMD can corrupt memory when MATRIX_COPY mode uses a pitch that
is not aligned to the destination address. This commit fixes it by
incorporating the destination address into the pitch selection so the
chosen pitch is aligned to both the copy length and the destination address.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 3711d4542ad3d..4b995c93fcea9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2187,17 +2187,18 @@ static bool xe_migrate_vram_use_pde(struct drm_pa=
gemap_addr *sram_addr,
>  #define XE_CACHELINE_BYTES	64ull
>  #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
> =20
> -static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len)
> +static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len, u64 dst_=
addr)
>  {
> +	u64 align_check =3D len | dst_addr;
>  	u32 pitch;
> =20
> -	if (IS_ALIGNED(len, PAGE_SIZE))
> +	if (IS_ALIGNED(align_check, PAGE_SIZE))
>  		pitch =3D PAGE_SIZE;

[Severity: Medium]
Could returning PAGE_SIZE here exceed the hardware's U16_MAX limit when=20
the kernel is built with 64K pages, such as on ARM64 under COMPILE_TEST?

If PAGE_SIZE evaluates to 65536, this pitch will be greater than 65535,=20
which would trigger the xe_gt_assert(gt, pitch <=3D U16_MAX) inside=20
emit_mem_copy().

[ ... ]

> @@ -2535,7 +2540,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, =
struct xe_bo *bo,
>  		else
>  			current_bytes =3D min_t(int, bytes_left, cursor.size);
> =20
> -		pitch =3D xe_migrate_copy_pitch(xe, current_bytes);
> +		pitch =3D xe_migrate_copy_pitch(xe, current_bytes,
> +					      write ? vram_addr :
> +					      (unsigned long)buf & ~PAGE_MASK);
>  		if (xe->info.has_mem_copy_instr)
>  			current_bytes =3D min_t(int, current_bytes, U16_MAX * pitch);

[Severity: Medium]
When pitch is 65536 due to 64K pages, does U16_MAX * pitch overflow here?

U16_MAX * 65536 evaluates to 4294901760. The min_t(int, ...) macro casts
this value to a signed 32-bit int, resulting in -65536.=20

Since current_bytes becomes negative, and is later passed to xe_migrate_vra=
m()=20
as an unsigned long len, could this result in a massive length that trigger=
s=20
memory corruption or OOM panics during KUnit tests or CI systems?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014134634.5823=
14-1-jan.maslak@intel.com?part=3D2
