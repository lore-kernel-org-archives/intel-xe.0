Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85F6C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823BF10EED8;
	Wed,  9 Sep 2026 06:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e5xKctds";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E66410EECC
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:30:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 63A80601FD;
 Wed,  9 Sep 2026 06:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27331F00A3A;
 Wed,  9 Sep 2026 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788935415;
 bh=4YP5pjpSdF32q2B3UGjRSm7HMCO5ikokQNp1ltuHk0E=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=e5xKctdsfoyJMZJFxoBRx+XId76Bkx3k5IvdpeA6DG3cF1zAIsc0bRMMOnGxTxFxe
 ITRr/FzXVSFUiaSA0341spgeNYHBNNrtJgU5ZGCIjjullr3+kN4AglSCuOJyoki1X7
 VAZ0W+MH4oNAJTs+N4uZ9EsCtlzsHHLrIM+WtzTKZh8qikFj5h+3YTSJSo2XQYDNpW
 xZF10bvLpmiftUdux/FtTMtHz1O8JyN2f00wL+Oi6tv7BvJE4cXTcgM56zGmUlPGbf
 vOyQ+K55Z1yt0rH1m3PtxMi2ana3s550jsBv4jRnzHKlgY8Q7OrJOARFkyt/JmzyGq
 HYbQ6cDZLINcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] drm/xe/xe_migrate: Fix page tracking in
 access_memory
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909061845.4048047-3-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
 <20260909061845.4048047-3-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:30:14 +0000
Message-Id: <20260909063014.E27331F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [High] Infinite recursion leading to kernel stack overflow in the unalign=
ed bounce-buffer path when `kmalloc` does not return a cacheline-aligned ad=
dress.
--

commit 3d0f83e8f2ae774cef204374c69860cdf0e2e7c3
Author: Christoph Manszewski <c.manszewski@gmail.com>

drm/xe/xe_migrate: Fix page tracking in access_memory

This commit updates xe_migrate_access_memory() to include the initial page
offset when recalculating current_page. This ensures that subsequent loop
iterations continue to index the mapped pages correctly.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 7da57dc522896..7b8148930738d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -2571,7 +2571,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, =
struct xe_bo *bo,

[Severity: High]
This isn't a bug introduced by this patch, but is there a risk of an
infinite recursion in the bounce-buffer path of xe_migrate_access_memory()
when memory debugging is enabled?

If xe->info.has_mem_copy_instr is false and the access is unaligned, the
code allocates a bounce buffer:

    bounce =3D kmalloc(XE_CACHELINE_BYTES, GFP_KERNEL);

If KASAN or SLUB_DEBUG is enabled, kmalloc() may return a buffer that is
not cacheline-aligned due to redzones. The function then recursively
calls itself:

    err =3D xe_migrate_access_memory(m, bo,
                                   offset & ~XE_CACHELINE_MASK,
                                   bounce,
                                   XE_CACHELINE_BYTES, 0);

Because the bounce buffer is still unaligned, could the recursion base case
fail? This would cause it to allocate another bounce buffer and recurse
infinitely, potentially leading to a kernel stack overflow if an
unprivileged context triggers an unaligned memory access.

> =20
>  		buf +=3D current_bytes;
>  		offset +=3D current_bytes;
> -		current_page =3D (int)(buf - orig_buf) / PAGE_SIZE;
> +		current_page =3D (int)(buf - orig_buf + page_offset) / PAGE_SIZE;
>  		bytes_left -=3D current_bytes;
>  		if (bytes_left)
>  			xe_res_next(&cursor, current_bytes);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909061845.4048=
047-1-jan.maslak@intel.com?part=3D2
