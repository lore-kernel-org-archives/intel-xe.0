Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C81C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 14:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE79510E84B;
	Mon,  7 Sep 2026 14:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fVdyHPff";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F155F10E4A5;
 Mon,  7 Sep 2026 14:06:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F4005601F9;
 Mon,  7 Sep 2026 14:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7449E1F00A3A;
 Mon,  7 Sep 2026 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788790013;
 bh=XftCkt0rru1BjiLFvXRM4UQUlwpigrSKtv6vIPwLo9I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fVdyHPff/uQ5j/aUh6P9oCMSauAi96f66srVsWRsmrfNupdG8irlwd5t6AEAuPefm
 cYhwukj+KcNqMZFSZU1LGGEnW/Js5V/byO4jrAqWLntf7ZjTSUDqXjECpQWzEJ82c6
 pOQ2az3qwdEVAsJIqNPAqgPDr4IrDHAEO5F8VmANBJa6bxBOcJ2zl0jbL2wHqYjjK2
 PlnyK+em1u6PTLAYmANwaD6ZcfDRQry/j5WZugpEFIvg1GfPUXtLKEOvrumg+mraSs
 yJEZKVD+9Dn48r7eZHIuaQewqwURy1IFEf7ImPafSz7uiTfiDJgCHPd+F3rXqkElEW
 y5NJjfUltc0nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/i915/dmc: Harden DMC firmware payload parsing
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260907135048.1403587-6-dibin.moolakadan.subrahmanian@intel.com>
References: <20260907135048.1403587-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907135048.1403587-6-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 14:06:52 +0000
Message-Id: <20260907140653.7449E1F00A3A@smtp.kernel.org>
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
- [High] Partial initialization of `dmc_info` on payload allocation failure=
 leaves a stale `mmio_count`, leading to unintended hardware MMIO programmi=
ng for missing firmwares.
--

commit bbb6b21d216798e993d4045cdf8b46c4ba305c9b
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/dmc: Harden DMC firmware payload parsing

This commit validates the DMC firmware size conversion using
check_mul_overflow() to prevent integer overflow. It also rejects zero-leng=
th
payloads and zero MMIO counts, and delays setting dmc_fw_size until after t=
he
payload allocation succeeds.

> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c

[ ... ]

> @@ -1237,12 +1247,12 @@ static u32 parse_dmc_fw_header(struct intel_dmc *=
dmc,
>  	dmc_info->mmio_count =3D mmio_count;
>  	dmc_info->start_mmioaddr =3D start_mmioaddr;
> =20
> -	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
> -
>  	dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL);
>  	if (!dmc_info->payload)
>  		return 0;

[Severity: High]
This is a pre-existing issue, but partial initialization of dmc_info here
leaves a stale mmio_count on allocation failure.

Since this patch already moves the dmc_fw_size assignment below the kmalloc
check to avoid leaving stale state, should mmio_count and start_mmioaddr be
moved down as well?

If kmalloc() fails, parse_dmc_fw_header() returns 0 but leaves
dmc_info->mmio_count set to a non-zero value. Later in the firmware loading
sequence, intel_dmc_load_program() will proceed to call dmc_load_program()
for the failed secondary DMC, where it calls:

drivers/gpu/drm/i915/display/intel_dmc.c:dmc_load_program() {
    ...
    dmc_load_mmio(display, dmc_id);
    ...
}

Does this cause dmc_load_mmio() to iterate up to the stale mmio_count and
write the partially initialized mmiodata to hardware registers for a
firmware payload that was never loaded?

> +	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
> +
>  	payload =3D (u8 *)(dmc_header) + header_len_bytes;
>  	memcpy(dmc_info->payload, payload, payload_size);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907135048.1403=
587-4-dibin.moolakadan.subrahmanian@intel.com?part=3D2
