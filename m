Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7311CC79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1562410EEDD;
	Wed,  9 Sep 2026 06:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FoJHBpC+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D6B10EEDD
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:32:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C534560207;
 Wed,  9 Sep 2026 06:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5008B1F00AC4;
 Wed,  9 Sep 2026 06:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788935546;
 bh=1Q/UkauQji1oU/fT3pTOwKcum8WlRFuA2oWiU1wUTc0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FoJHBpC+BIBZUuf11hRMS2sjGI85W0JeJz3o1AhLmKlrZq7Z7lfiDL4VGdmS+TJDH
 QCUUKEzq9Gd4fCwb02VF5q8QWmaWp1A+KA4afy6TFF3BStaydX4ZciBxqNxTuLPE6g
 sBpEzTIUICBXgxvpTKeGc7yh3spMBtGYtHYKatG8xwYLVfPsG/uD34EGSu9HGrnQHX
 L1g+tPprCMxBiPw1M25mPX2La16QXOw9wUdj1cjWr7xqMHL1xtde8QqBvVLclz9sSv
 Ra4tJgvmdRM8n0TbHHXmPe2ns52UapZHMsVcBQomeTRTmlaYeKs4//wvWcHaYsmi4E
 eHL1rcuKMsHRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909061845.4048047-2-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
 <20260909061845.4048047-2-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:32:25 +0000
Message-Id: <20260909063226.5008B1F00AC4@smtp.kernel.org>
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

New issues:
- [Medium] Memory leak of struct xe_bb in xe_migrate_vram when copying with=
 unsupported alignment.

Pre-existing issues:
- [High] The bounce buffer allocation uses kmalloc(64) which is not guarant=
eed to return a 64-byte aligned pointer when SLUB debugging (redzoning) or =
KASAN is enabled. If it returns an unaligned pointer, the recursive call to=
 xe_migrate_access_memory will fail the alignment check again, leading to i=
nfinite recursion and a kernel stack overflow.
--

commit 750ad7c695067571d7f0d70322bbf7d762b30994
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe/xe_migrate: Align MEM_COPY pitch with destination address

This commit fixes memory corruption in MATRIX_COPY mode when the pitch
is not aligned to the destination address. It updates the pitch selection
to ensure it is aligned to both the copy length and the destination address.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 75b83687f1b5d..7da57dc522896 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -2225,16 +2226,11 @@ static struct dma_fence *xe_migrate_vram(struct x=
e_migrate *m,
[ ... ]
>  	}
> =20
> +	pitch =3D xe_migrate_copy_pitch(xe, len, dst_L0_ofs);
> +	if (!xe->info.has_mem_copy_instr &&
> +	    drm_WARN_ON(&xe->drm,
> +			(!IS_ALIGNED(len, pitch)) ||
> +			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +		return ERR_PTR(-EOPNOTSUPP);
> +

[Severity: Medium]
Does this code leak the batch buffer?

Looking at xe_migrate_vram(), bb is allocated earlier with xe_bb_new().
If this alignment check fails, we return ERR_PTR(-EOPNOTSUPP) directly. Sho=
uld
we jump to the err label to free bb using xe_bb_free(bb, NULL) instead?

>  	bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>  	update_idx =3D bb->len;
[ ... ]
> @@ -2538,7 +2541,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, =
struct xe_bo *bo,
>  		else
>  			current_bytes =3D min_t(int, bytes_left, cursor.size);
> =20
> -		pitch =3D xe_migrate_copy_pitch(xe, current_bytes);
> +		pitch =3D xe_migrate_copy_pitch(xe, current_bytes,
> +					      write ? vram_addr :
> +					      (unsigned long)buf & ~PAGE_MASK);

[Severity: High]
This is a pre-existing issue, but can the bounce buffer allocation earlier =
in
this function cause an infinite recursion?

When an unaligned memory access triggers the bounce buffer path in
xe_migrate_access_memory(), it calls:

    bounce =3D kmalloc(XE_CACHELINE_BYTES, GFP_KERNEL);

If SLUB debugging (redzoning) or KASAN is enabled, kmalloc() might not retu=
rn
a 64-byte aligned pointer. If it returns an unaligned pointer, the recursive
call to xe_migrate_access_memory() checks
!IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) where page_offset is derived
from the unaligned bounce buffer address.

Since the bounce buffer is unaligned, this check fails again, triggering
another allocation and recursion until the kernel stack overflows.

Should this use a mechanism that guarantees natural alignment?

>  		if (xe->info.has_mem_copy_instr)
>  			current_bytes =3D min_t(int, current_bytes, U16_MAX * pitch);
>  		else

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909061845.4048=
047-1-jan.maslak@intel.com?part=3D1
