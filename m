Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF0CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24F910FEA1;
	Wed, 14 Oct 2026 13:59:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE6B10FEA1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:58:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 050A443E23;
 Wed, 14 Oct 2026 13:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE621F00A2F;
 Wed, 14 Oct 2026 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791986336;
 bh=3GbS5LxxMAuPpRzmq5nhhGQKyGKRO6hlrb6v3bNqlTU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Jbh1XNZOUKzk5ocnZ7NoFKjMgjd99ktYGJKyjZF+SyZ47U9tqdBKDrU7iAVQktocQ
 3G3CDeFF5mGtXEDN1H6eRO/bPs9lUdA3j+clBQ3Bp+jlVN8QbBJvIuRkhL1FzjAd1n
 oBjt7yIlVuKdO/XeK+6M3IeqZY46dgvhHa+Onzqn6tkYwYCK+5B1baGt05nVFWCAQN
 qSIcvOyB1R2D+6hjESfy2u/2u4FtyJr4DFkzY/IyGiEZzE1U3liBj8h1KN43HFSqPm
 OSbrxFx672+ObEO2CD4jhABCpYsd501D9stFtDxwc36YL1dviXhCGDCBwwGQDyshZH
 dW2AgO2GFWE1A==
Message-ID: <sashiko-outbox-171392@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe/tests: Add xe_migrate_access_memory subtest
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014134634.582314-5-jan.maslak@intel.com>
References: <20261014134634.582314-1-jan.maslak@intel.com>
 <20261014134634.582314-5-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:58:56 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] xe: infinite recursion in xe_migrate_access_memory() due to unalig=
ned kmalloc
- [Medium] drm/xe: test failure on big-endian architectures due to little-e=
ndian assumption
- [Low] drm/xe/tests: dead code in random offset generation
--

commit 123f5e095a34197f112fb5cb560c6b8a8cf51802
Author: Jan Maslak <jan.maslak@intel.com>

drm/xe/tests: Add xe_migrate_access_memory subtest

This commit adds a new xe_migrate subtest to verify VRAM to SRAM migration.
It explicitly tests migration when the destination address, migration size,
or source BO offset is not 4-byte aligned.

> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c

[ ... ]

> +static bool verify_access_memory_read(struct kunit *test, u8 *buf,
> +				      u32 buf_start, u32 bo_start,
> +				      u32 size, const char *scenario)
> +{
> +	u32 j;
> +
> +	for (j =3D 0; j < size; j++) {
> +		u32 bo_byte_offset =3D bo_start + j;
> +		u32 byte_in_cell =3D bo_byte_offset % sizeof(u32);
> +		u32 cell_idx =3D bo_byte_offset / sizeof(u32);
> +		u32 cell_value =3D cell_idx;
> +		u8 expected_byte =3D (cell_value >> (byte_in_cell * 8)) & 0xFF;

[Severity: Medium]
Will this test falsely fail on big-endian architectures?=20

Buffer generation in access_memory_test_run_tile() primes the test buffer
using native host endianness:

    ((u32 *)buf)[j] =3D j;

However, the bit shift here fundamentally assumes a little-endian memory
layout where the least significant byte is stored at the lowest address. On
a big-endian CPU, the most significant byte sits at the lowest address,
resulting in a mismatch. Should the code use explicit cpu_to_le32 and
le32_to_cpu macros to remain architecture-agnostic?

[ ... ]

> +static void access_memory_test_run_tile(struct xe_device *xe,
> +					struct xe_tile *tile,
> +					struct kunit *test,
> +					bool use_random_offset)
> +{
> +	struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
> +	unsigned int bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile);
> +	struct xe_migrate *m =3D tile->migrate;
> +	u32 j, unaligned_offset;
> +	struct xe_bo *bo;
> +	long timeout;
> +	u8 *buf;
> +	int ret;
> +
> +	if (use_random_offset) {
> +		unaligned_offset =3D get_random_u32() % (ACCESS_MEM_BO_SIZE / 2);
> +		/* Ensure the offset is not 4-byte aligned */
> +		if (IS_ALIGNED(unaligned_offset, 4))
> +			unaligned_offset |=3D 2;
> +		if (!unaligned_offset)
> +			unaligned_offset =3D 3;

[Severity: Low]
Is the zero-check fallback logic unreachable?=20

Any initial zero value from get_random_u32() is transformed to 2 by the
preceding alignment enforcement, so unaligned_offset cannot be 0 at this
point. This appears to be unnecessary dead code.

[ ... ]

> +	access_memory_test_unaligned_bo_offset(test, m, bo, buf, unaligned_offs=
et);

[Severity: High]
Could this unaligned testing trigger an infinite recursion and stack overfl=
ow
in xe_migrate_access_memory() when memory debugging is enabled?=20

When xe->info.has_mem_copy_instr is false, xe_migrate_access_memory()
handles unaligned offsets by allocating a bounce buffer and then recursively
calling itself:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_access_memory() {
    ...
    bounce =3D kmalloc(XE_CACHELINE_BYTES, GFP_KERNEL);
    ...
    err =3D xe_migrate_access_memory(m, bo,
                                   offset & ~XE_CACHELINE_MASK,
                                   bounce,
                                   XE_CACHELINE_BYTES, 0);
    ...
}

Under configurations like CONFIG_SLUB_DEBUG or CONFIG_KASAN, kmalloc()
for 64 bytes does not guarantee 64-byte alignment due to redzoning and
padding. If the returned bounce buffer is not cacheline aligned, the
recursive call's page_offset will be unaligned, causing the alignment check
to evaluate to true again and leading to unbounded recursion.

> +	access_memory_test_unaligned_dst(test, m, bo, buf, unaligned_offset);
> +	access_memory_test_unaligned_dst_aligned_size(test, m, bo, buf, unalign=
ed_offset);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014134634.5823=
14-1-jan.maslak@intel.com?part=3D4
