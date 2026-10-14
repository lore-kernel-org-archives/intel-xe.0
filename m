Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6333FCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B0C10E152;
	Wed, 14 Oct 2026 14:46:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EBA10E152
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:45:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 229F260219;
 Wed, 14 Oct 2026 14:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28FE1F000C4;
 Wed, 14 Oct 2026 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791989157;
 bh=JG5UsHRH/fBVJSYXCYy/tFHKRdEEZFO8gfqNURF3L28=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=EVdk/IFg26c9rkF/kZqJBLiar5u99DekcnlooOC2aC9yK5Kar4o72zNRwkxPyQ/7V
 YmzgPOVy0varRgnWvbRnNzXf8NrBZv6TOlosvNvOn24NxwOkJHdnUHa8FTPXcaMHCs
 giBoCFm8BQLrVQ/uA94JP8/oDLLVGZ8BZePjLejtrLDmkrnIAsEWeSgvKGgYGRZ3Cb
 y2qMf0pqcyVGQ2RK+lSmYAuNVQFYlVHK3KNqMvItulNJtDAT+ZKQZ9ukke9/NzBCzp
 wWpUKpR3EpAbwRyeCuKzOgaUzd8++jdA31RW3dJ02enU57QvqiPvdaBJTdwsQAcAP0
 8GdjNT/xw9fWQ==
Message-ID: <sashiko-outbox-171443@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] drm/xe/tests: Add xe_migrate_access_memory subtest
To: "Jan Maslak" <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014142706.598490-5-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
 <20261014142706.598490-5-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 14:45:57 +0000
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
- [Low] xe/tests: Endianness assumption in verify_access_memory_read()
- [Low] xe/tests: Unreachable dead code in unaligned_offset generation
--

commit 9484a3b8a65a7889a267c6cc520be578ff0d0b1f
Author: Jan Maslak <jan.maslak@intel.com>

drm/xe/tests: Add xe_migrate_access_memory subtest

This commit adds a new xe_migrate KUnit subtest to verify VRAM to SRAM
migration behavior. It specifically tests scenarios where the destination
address or the source buffer object offset is not 4-byte aligned.

> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
[ ... ]
> @@ -770,9 +773,308 @@ static void xe_validate_ccs_kunit(struct kunit *tes=
t)
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

[Severity: Low]
Will this byte extraction logic fail on big-endian architectures?

The test buffer is primed using a host-endian assignment in
access_memory_test_run_tile():

	for (j =3D 0; j < ACCESS_MEM_NUM_CELLS; j++)
		((u32 *)buf)[j] =3D j;

However, extracting the expected byte using a bitwise right shift
implicitly assumes a little-endian memory layout (where byte 0 is the
least significant byte). On big-endian systems, the physical byte
sequence in memory won't match this extraction, causing spurious
test failures.

Should this either use cpu_to_le32(j) when priming the buffer, or use
an endian-aware extraction here?

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
Is this condition reachable?

If unaligned_offset is initially 0 (which is 4-byte aligned), the
previous check will execute unaligned_offset |=3D 2, making it 2. Since
unaligned_offset is mathematically guaranteed to be strictly greater
than 0 after the alignment check, the zero-check here appears to be
unreachable dead code.

> +	} else {
> +		unaligned_offset =3D ACCESS_MEM_UNALIGNED_OFFSET;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014142706.5984=
90-1-jan.maslak@intel.com?part=3D4
