Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425CFC79FB5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D3310EED3;
	Wed,  9 Sep 2026 06:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BwrnMbB3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C13D10EED3
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:31:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FC2E601FD;
 Wed,  9 Sep 2026 06:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7E61F00A3A;
 Wed,  9 Sep 2026 06:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788935470;
 bh=pbgj8l6bcOxtJy2lO1spi/Uwz5OJ3JmTs07kWoUO3zo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BwrnMbB3anPj/J20M37d/qfU8VZAhQ/VnMS8Ysi/4D4aW7FQApN7RQedGPNHE4x3V
 KFvp4EByv7X6lwTJY25fFqnUe1qotOiGJRF64wLMF7O5JzzxXA3AaKJnMmepKvFa2S
 1TpNGkwhYAgD7ZACee2uIzqPAUTj7xhSRO6azvFEDaK4b/CPKGPaWYfOt1YPyNkdJx
 KczsOcqWJAQPjuukE1DFP4ek+WsAesj1dB/+o512LBCnA5DTTigTPFFXOddgG/IDjY
 LVjqUfEQ41FF/zIcJwPa5/+POJ7GJ0bxmb0DDL5UbexDKN+QYmT4Ke7V/3uSw+2LC+
 CrnWL2iTd67Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] drm/xe/xe_migrate: Optimize unaligned
 access_memory copies
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909061845.4048047-4-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
 <20260909061845.4048047-4-jan.maslak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:31:10 +0000
Message-Id: <20260909063110.9B7E61F00A3A@smtp.kernel.org>
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
- [High] Integer overflow in `current_bytes` calculation for large page siz=
es (e.g., 64KB) causes a negative copy size, leading to memory corruption a=
nd out-of-bounds access.
--

commit 183a64d26e1be6a564343aab0ec775c2c2c3bd05
Author: Jan Maslak <jan.maslak@intel.com>

drm/xe/xe_migrate: Optimize unaligned access_memory copies

This commit optimizes unaligned memory accesses by reducing the number of
copy jobs. It introduces a sequence of a short linear copy to reach
alignment, followed by a matrix copy using the best supported pitch, and
a final linear copy for the remaining tail bytes.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 7b8148930738d..c250383940b2b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -2541,15 +2621,68 @@ int xe_migrate_access_memory(struct xe_migrate *m=
, struct xe_bo *bo,

[ ... ]

> +				if (aligned_len >=3D dst_pitch) {
> +					pitch =3D dst_pitch;
> +					if (xe->info.has_mem_copy_instr) {
> +						current_bytes =3D min_t(int, aligned_len,
> +								      U16_MAX * pitch);

[Severity: High]
This is a pre-existing issue, but can this calculation in=20
xe_migrate_access_memory() overflow a signed 32-bit integer on systems=20
with large page sizes?

When executing on a system with a PAGE_SIZE of 64KB (or larger) and a GPU
that supports the memory copy instruction, xe_migrate_dst_pitch() can return
a pitch of 65536.

In this case, U16_MAX * pitch equals 4294901760. The min_t(int, ...) macro
casts this value to a signed 32-bit integer, resulting in -65536.

When current_bytes becomes negative, it is passed as unsigned long len to
xe_migrate_vram(), converting to a very large unsigned value. This causes
an enormous npages calculation, which overflows the 32-bit batch_size during
pte_update_cmd_size().

Because xe_bb_new() then successfully allocates a smaller buffer based on t=
he
overflowed size, the subsequent loop in build_pt_update_batch_sram() will
overflow this batch buffer and corrupt kernel memory.

Additionally, even when has_mem_copy_instr is false, systems with 256KB pag=
es=20
would see a similar int overflow in the S16_MAX * pitch path.

Could these calculations be clamped or evaluated using an unsigned type
to prevent this overflow?

> +					} else {
> +						current_bytes =3D min_t(int, aligned_len,
> +								      round_down(S16_MAX * pitch,
> +										 XE_CACHELINE_BYTES));
> +					}
> +				} else {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909061845.4048=
047-1-jan.maslak@intel.com?part=3D3
