Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA22C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C110E028;
	Thu, 13 Aug 2026 10:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JTadOp9V";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65B510E028
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:37:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 297274363D;
 Thu, 13 Aug 2026 10:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27BC1F000E9;
 Thu, 13 Aug 2026 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786617440;
 bh=PXxCY9SJaqdXbhePTgoR5KOnJBv1NKrPc8VfhNSeSqA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JTadOp9Vyq0rjxIJcEHZOuZp2J3x4bpHBLn/7v1rM0CrDEVhAQxhNGM14EYTRqPcS
 wCG1iUnnzEnmx9V4f4+wt+yOzaI2Tdo1G9MmzFdRsi/OsH6uZIs7RPDB88bFMSFQ6I
 b9Bj8ryJGcZM5ic4e4Y6NgVWMLVTL+TIR6jBDNBiRrzlkeAgi7qVdRlzl0N39dHuJq
 Liqr4Xcs1PME3m1tyXv5VkSaTtUY2KEZsrBE4T4fayjYTmqzsIwBeFfn2vLcBPqiH4
 zehfO4PA982EtIaQuiY4fZ4TvZYOGYxkRuXYnzZKmksfga/UTvhUG8rzmXG3QwdJr3
 JiYMEvY+pWOhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] drm/xe/kunit: Add tests for PF-mem regions
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813102511.200690-5-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
 <20260813102511.200690-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:37:19 +0000
Message-Id: <20260813103719.E27BC1F000E9@smtp.kernel.org>
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
- [High] If `devm_ioremap_wc()` fails, `vram->mapping` is incorrectly initi=
alized to an invalid non-NULL pointer when `offset > 0`, leading to downstr=
eam kernel panics.
--

--- Patch [4]: [PATCH v1 4/4] drm/xe/kunit: Add tests for PF-mem regions ---
commit e9c2a7426069b7396e0ca724779e07a5d5cec440
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/kunit: Add tests for PF-mem regions
   =20
Add coverage for PF-mem VRAM region metadata, bounds checking, and
full, partial, and missing CPU visibility.

> diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/test=
s/xe_vram.c
> new file mode 100644
> index 0000000000000..36a49fbef2206
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_vram.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */

[ ... ]

> +static void pfmem_create(struct kunit *test)
> +{
> +	struct xe_device *xe =3D test->priv;
> +	struct xe_vram_region parent =3D pfmem_parent(xe, SZ_64M);
> +	struct xe_vram_region *vram;
> +
> +	vram =3D xe_vram_region_alloc_pfmem(xe, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, vram);
> +	KUNIT_ASSERT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M, S=
Z_16M), 0);

[Severity: High]
This is a pre-existing issue, but does the underlying initialization logic
have an unchecked mapping issue?

If devm_ioremap_wc() fails in determine_lmem_bar_size(), it returns NULL,
but determine_lmem_bar_size() doesn't check for this and returns 0 (success=
).

Later, vram_region_init() executes:

    vram->mapping =3D lmem_bar->mapping + offset;

If lmem_bar->mapping is NULL, this pointer arithmetic creates a non-NULL
invalid pointer when offset > 0 (which happens for non-zero tiles or when
initializing a PF-mem region via xe_vram_region_init_pfmem() called here).

Because vram->mapping is no longer NULL, subsequent checks like
if (vram->mapping) evaluate to true, leading to a kernel panic when the
invalid pointer is dereferenced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813102511.2006=
90-1-piotr.piorkowski@intel.com?part=3D4
