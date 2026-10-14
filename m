Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD187CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5210FDC6;
	Wed, 14 Oct 2026 14:41:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2310E9C0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:41:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D7A224020B;
 Wed, 14 Oct 2026 14:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAA01F000C4;
 Wed, 14 Oct 2026 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791988907;
 bh=TBUk84xgwVt58I8i5YJ+v1oNkSy63xO8bjdS/KegdF8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DtQA/m3HHwG20EaMeG61+0pUWbz4JNQ8XjdeNc6KJzuwRckwCE/7faf4oQCyyaLU7
 q/IbFOzm1fiCY9Vdg0RRsyDWhYjccJeE6CoHXbcbt/gtvkpvYsbXZncoy5An8s7/kQ
 uB2S3g/eIsropjSh1rRMQ9Idq6e1aMzswAr96B3OzCnZOmUKc7kCgD3Nlt13t2qmdd
 6NOoIKK97AO7rWx/8w37dbS2WYmnZ79yJJtHpH8IRXHkUsRUslst6TcFicKysiXV82
 A6bKmpIqbRiemuCOyEfX9KrEXIHUmXUXVGZrnLQ+FOm0T+2z1PJRp1U06Aw4S4w4DZ
 BTNItjf6gcNKQ==
Message-ID: <sashiko-outbox-171439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014142706.598490-3-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
 <20261014142706.598490-3-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 14:41:47 +0000
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
- [High] drm/xe: negative integer overflow in xe_migrate_access_memory leng=
th chunking
--

commit 742737639ebd031db7d22e7a2865500651dcc226
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe/xe_migrate: Align MEM_COPY pitch with destination address

This commit modifies xe_migrate_copy_pitch() to incorporate the destination
address into pitch selection. It ensures the chosen pitch is aligned to both
the copy length and the destination address to prevent memory corruption in
MATRIX_COPY mode.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 3711d4542ad3d..4b995c93fcea9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
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

[Severity: High]
Does this code risk a negative integer overflow?

The min_t macro casts both arguments to a signed int. On systems with a
64KB PAGE_SIZE (e.g. ARM64 or PPC64), if pitch is PAGE_SIZE, U16_MAX * pitch
evaluates to 4294901760 (0xFFFE0000). When cast to int, this becomes the
negative number -131072.

This would cause current_bytes to become negative. When this negative chunk
size is passed down the call chain:

xe_migrate_access_memory()
    ...
    __fence =3D xe_migrate_vram(m, current_bytes, ...)

Inside xe_migrate_vram(), this negative length is implicitly cast to an
unsigned long, becoming a massive value that either triggers a kernel panic
via xe_assert(xe, npages * PAGE_SIZE <=3D MAX_PREEMPTDISABLE_TRANSFER), or
causes the batch buffer allocation xe_bb_new() to fail with -ENOMEM.

Note that follow-up Patch 3 in the series simply moves this broken min_t
logic into a new block, failing to resolve the signed overflow.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014142706.5984=
90-1-jan.maslak@intel.com?part=3D2
