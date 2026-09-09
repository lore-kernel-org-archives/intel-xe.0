Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C3CC79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE0E10E07C;
	Wed,  9 Sep 2026 06:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KG2qpPJ+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACDC10E07C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:28:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 70BC342ABC;
 Wed,  9 Sep 2026 06:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4010C1F00A3A;
 Wed,  9 Sep 2026 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788935324;
 bh=9u4lriZrYOYyNqlHUwU+QTVj5cdc5qZXi4Ror49PjnU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KG2qpPJ+3SQ33cyeXmXJ6a2cuTm9FwvGxGuy6yvAI8g5eTXlTq5Hvlcyvfr5bZ1vp
 AHmIHiJdm389IOwpQQ9jTWfdrDxGIh4KZbeYcp+algUtIwxJw1erGsrpEatHR5/tRf
 hSgfgfk21QutMpKZVgfiz0Ud7wcfS7IQno8Iy8n/CuxNPjwq0rRgAsUZWCtTXVM/7S
 ygFePeP1vb5n4kxbnGvRqypUPE8zfA6WCXkvfOGO7ryV9ktOJ65P2m6loyFdv/FZ1P
 2aQRy7M0EKFxeYwQnxzCU7BBwCYP0LyS5zTD6DmKJ447ouMESRTuKVExzl49uQKp5v
 FZMn11qsb2t8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] drm/xe/tests: Add xe_migrate_access_memory subtest
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909061845.4048047-5-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
 <20260909061845.4048047-5-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:28:43 +0000
Message-Id: <20260909062844.4010C1F00A3A@smtp.kernel.org>
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

New issues:
- [Medium] The byte-wise verification logic in `verify_access_memory_read` =
assumes a little-endian memory layout, causing the test to fail on big-endi=
an architectures.
- [Low] The fallback condition `if (!unaligned_offset)` is dead code and wi=
ll never evaluate to true.

Pre-existing issues:
- [High] Infinite recursion in `xe_migrate_access_memory` when the allocate=
d bounce buffer is not cacheline aligned.
--

commit bc41ecbf5d587d033724f3736f3ff4ebc8156d3a
Author: Jan Maslak <jan.maslak@intel.com>
Subject: drm/xe/tests: Add xe_migrate_access_memory subtest

This commit adds a new subtest to xe_migrate to verify vram to sram migrati=
on.
It specifically tests scenarios where the destination address, migration si=
ze,
or source BO offset are not 4-byte aligned.

> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> index f10d9513747b4..9e18fcd51e26c 100644
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
Will this test fail spuriously on big-endian architectures?=20

The bit-shift logic here in verify_access_memory_read() explicitly expects=
=20
bytes to be laid out in little-endian order, but the array is primed in the
host's native byte order later in access_memory_test_run_tile().

[ ... ]
> +static void access_memory_test_unaligned_bo_offset(struct kunit *test,
> +						    struct xe_migrate *m,
> +						    struct xe_bo *bo, u8 *buf,
> +						    u32 unaligned_offset)
> +{
> +	u32 partial_size =3D ACCESS_MEM_BO_SIZE - unaligned_offset;
> +	int ret;
> +
> +	memset(buf, 0, ACCESS_MEM_BO_SIZE);
> +
> +	kunit_info(test, "Partial read: bo_offset=3D0x%x bytes=3D0x%x\n",
> +		   unaligned_offset, partial_size);
> +
> +	ret =3D xe_migrate_access_memory(m, bo, unaligned_offset, buf,
> +				       partial_size, false);

[Severity: High]
This is a pre-existing issue, but could these unaligned tests trigger an
infinite recursion loop in xe_migrate_access_memory()?=20

When handling an unaligned vram access on a platform without
has_mem_copy_instr, xe_migrate_access_memory() allocates a bounce buffer:

    bounce =3D kmalloc(XE_CACHELINE_BYTES, GFP_KERNEL);

If debugging options like Kasan or Slub redzoning are enabled, kmalloc is n=
ot
guaranteed to return a cacheline-aligned pointer. The unaligned bounce buff=
er
pointer is then passed to the recursive call where it fails the alignment
check again, leading to another allocation and recursing infinitely.

[ ... ]
> +static void access_memory_test_run_tile(struct xe_device *xe,
> +					struct xe_tile *tile,
> +					struct kunit *test,
> +					bool use_random_offset)
> +{
> +	unsigned int bo_flags =3D XE_BO_FLAG_VRAM_IF_DGFX(tile);
> +	struct xe_migrate *m =3D tile->migrate;
> +	u32 j, unaligned_offset;
> +	struct xe_bo *bo;
> +	u8 *buf;
> +	int ret;
> +
> +	if (use_random_offset) {
> +		unaligned_offset =3D get_random_u32() % (ACCESS_MEM_BO_SIZE / 2);
> +		/* Ensure the offset is not 4-byte aligned */
> +		if (IS_ALIGNED(unaligned_offset, 4))
> +			unaligned_offset |=3D 2;
> +		if (!unaligned_offset)

[Severity: Low]
Is this fallback condition dead code?=20

The value of unaligned_offset can never be 0 at this point. Since 0 is 4-by=
te
aligned, the preceding bitwise OR is guaranteed to execute and change the
value to 2, rendering this subsequent check permanently false.

> +			unaligned_offset =3D 3;
> +	} else {
> +		unaligned_offset =3D ACCESS_MEM_UNALIGNED_OFFSET;
> +	}
[ ... ]
> +	/* Prime the BO */
> +	for (j =3D 0; j < ACCESS_MEM_NUM_CELLS; j++)
> +		((u32 *)buf)[j] =3D j;

[Severity: Medium]
Does this code create a mismatch on big-endian architectures?=20

The array is primed in the host's native byte order here in
access_memory_test_run_tile(), creating a mismatch when verified against the
little-endian assumption in verify_access_memory_read().

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909061845.4048=
047-1-jan.maslak@intel.com?part=3D4
