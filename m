Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EF3C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D894C10E290;
	Fri, 21 Aug 2026 09:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hncVQnvG";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC1F10F2BC
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:54:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C0D4643903;
 Fri, 21 Aug 2026 09:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780921F000E9;
 Fri, 21 Aug 2026 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787306072;
 bh=7UfoxhIHup2BzLyGr7/8u5poKSkNTT6LO9FYmTQElj4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hncVQnvG/W7VRCtGzWoOQXt5qy8ufi3NNjzBEj3Em+JFn7m4v69fA+6Qwl5jyffzO
 ChseHYdcA3xTNRXcI1uy7CdeL2MbKxDH3/V0+KOpKSL+2Z5uSRw5WhR5jqlmhZw6ZY
 AiF0IBAnn3P2yNmf6cUmilKop5hF1jBXcCp2aJ3ENtvLnUYlow4iXJprLBgASOs1o9
 rr3ypzLcvcU5ZJbRVK3l2jSOYcwDVwkkp2C3qkSGkyC4ESpSzViMtmv2jvW8sZ1Pov
 O8hQ1Kef3nq3Prbao4j5bF2W8J0CDTPzT1Qlfkc3GXcvQrqeg1J6ZllxYQgRYkRsh/
 PcAtNP8dyCTDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] drm/xe/kunit: Add tests for PF-mem regions
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821094601.607060-5-piotr.piorkowski@intel.com>
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
 <20260821094601.607060-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:54:32 +0000
Message-Id: <20260821095432.780921F000E9@smtp.kernel.org>
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
- [Medium] The hardcoded mock pointer `SZ_4G` truncates to `NULL` on 32-bit=
 architectures, breaking KUnit tests.
- [Low] The out-of-bounds offset test case is shadowed by a page alignment =
check.
--

--- Patch [4]: [PATCH v2 4/4] drm/xe/kunit: Add tests for PF-mem regions ---
commit def1e04af372e808abcf812a9ee0ac48e736b86c
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

drm/xe/kunit: Add tests for PF-mem regions

Add KUnit tests for PF-mem VRAM regions to provide coverage for region
metadata, bounds checking, and CPU visibility constraints.

> diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/test=
s/xe_vram.c
> new file mode 100644
> index 0000000000000..36a49fbef2206
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_vram.c
> @@ -0,0 +1,115 @@

[ ... ]

> +static struct xe_vram_region pfmem_parent(struct xe_device *xe, u64 io_s=
ize)
> +{
> +	struct xe_vram_region parent =3D {
> +		.xe =3D xe,
> +		.id =3D 0,
> +		.io_start =3D SZ_1G,
> +		.io_size =3D io_size,
> +		.dpa_base =3D SZ_2G,
> +		.mapping =3D (__force void __iomem *)SZ_4G,

[Severity: Medium]
Will this cast truncate to NULL on 32-bit architectures?

If this code is built on 32-bit architectures (for example, via COMPILE_TES=
T),
SZ_4G (0x100000000ULL) won't fit in a 32-bit pointer and truncates to NULL.

When xe_vram_region_init_pfmem() later delegates to vram_region_init(), it
checks if the mapping is NULL and fails with -ENOMEM instead of 0.

Could this cause the KUnit tests to unexpectedly fail on 32-bit builds?

> +		.usable_size =3D SZ_64M,
> +	};
> +
> +	return parent;
> +}

[ ... ]

> +static void pfmem_invalid_range(struct kunit *test)
> +{
> +	struct xe_device *xe =3D test->priv;
> +	struct xe_vram_region parent =3D pfmem_parent(xe, SZ_64M);
> +	struct xe_vram_region *vram;
> +
> +	vram =3D xe_vram_region_alloc_pfmem(xe, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, vram);
> +	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, 0, 0), -=
EINVAL);
> +	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M +=
 1, SZ_4M), -EINVAL);

[Severity: Low]
Does this actually test the bounds check?

Since SZ_64M + 1 is not page-aligned, xe_vram_region_init_pfmem() will
evaluate the alignment check first and short-circuit to return -EINVAL.

It seems the offset > parent->usable_size bounds check would remain
completely untested here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821094601.6070=
60-1-piotr.piorkowski@intel.com?part=3D4
