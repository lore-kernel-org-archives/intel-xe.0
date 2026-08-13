Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2688C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6E610F43F;
	Thu, 13 Aug 2026 16:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K04JyL34";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5710F3FC;
 Thu, 13 Aug 2026 16:20:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D9CC40161;
 Thu, 13 Aug 2026 16:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359871F000E9;
 Thu, 13 Aug 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786638021;
 bh=wH2pY0ou+GcKxFiHVDzm6ao5CtB1B8jnL2LnzxOEsWg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=K04JyL34A9m1conTFBYlf2TSs5qEqzCXzI2ghCTfDmvacHOKLBOjGcI+Wo6oBDROa
 HWdcTJNARWNpSGax641MBSZfJf3Kl0+CBm8PXC/q5vbooI3mPlop7aCjfIB1P+AE/b
 Z8I2elvhXFISeLGPUopqhjb1Fo9BUHTLiZU4lG/5kesX9ZA4bhrNVZte17yHJj74bm
 uSrgxYZ9sSCeC+kU0LKerjWY8l/vxbGThYbkiJAUa/8dqEVrVKNfv55Lv8BySfT/0T
 AHdBVxc7a9ZxQ9YrtR9egijnkXjtQrXbOMUaz8nI9b9FRDDZIgiBy+5mttjT2H8Pz3
 BDp8F85oBWcew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/8] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260813160918.918857-3-michal.grzelak@intel.com>
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-3-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:20:20 +0000
Message-Id: <20260813162021.359871F000E9@smtp.kernel.org>
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
- [High] Out-of-bounds Read due to Missing VBT Block Size Validation and Ha=
rdware Assumptions
- [High] Undefined Behavior from Unaligned Pointer Cast of Packed Struct Me=
mber
--

--- Patch [2]: [PATCH v11 2/8] drm/i915/bios: store VBT #57's metadata in i=
ntel_vbt_data ---
commit ecc48f16388bfb4ef7b96b15e355044be1dd9fb7
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915/bios: store VBT #57's metadata in intel_vbt_data

This commit stores VBT #57 (VS/PE-O) metadata inside a new vspeo struct
in intel_vbt_data. It also introduces a helper to calculate the number of
rows based on the display version, assigning 16 rows to MTL+ and 10 rows
to older platforms.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index ece4df4a9d62a..06a8dd7581bb8 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -2205,6 +2205,11 @@ parse_compression_parameters(struct intel_display =
*display)
>  	}
>  }
> =20
> +static int vswing_preemph_num_rows(struct intel_display *display)
> +{
> +	return DISPLAY_VER(display) >=3D 14 ? 16 : 10;
> +}
> +
>  static void
>  parse_vswing_preemph_override(struct intel_display *display)
>  {
> @@ -2218,6 +2223,11 @@ parse_vswing_preemph_override(struct intel_display=
 *display)
>  	/* pre-ICL GOPs don't have VBT #57 */
>  	if (!block)
>  		return;
> +
> +	display->vbt.vspeo.tables =3D block->tables;
> +	display->vbt.vspeo.num_tables =3D block->num_tables;
> +	display->vbt.vspeo.num_columns =3D block->num_columns;
> +	display->vbt.vspeo.num_rows =3D vswing_preemph_num_rows(display);

[Severity: High]
Does this code perform an out-of-bounds read if the VBT block is smaller
than expected?

The parser reads num_tables and num_columns from the untrusted VBT block,
and hardcodes num_rows to 16 for DISPLAY_VER >=3D 14 via
vswing_preemph_num_rows().

However, it doesn't validate whether get_blocksize(block) is large enough
to contain num_tables * num_columns * num_rows * sizeof(u32) bytes.

Additionally, if a platform with DISPLAY_VER >=3D 14 lacks a C20 PHY and
legitimately provides a smaller 10-row VBT block, this hardcoded 16-row
assumption will cause the driver to read past the end of the block.

>  }
> =20
>  static u8 translate_iboost(struct intel_display *display, u8 val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index 7e988b7b1fe7a..c80b4a2f74f9e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -244,6 +244,13 @@ struct intel_vbt_data {
>  	struct list_head display_devices;
>  	struct list_head bdb_blocks;
> =20
> +	struct {
> +		const u32 *tables;

[Severity: High]
Will assigning the packed array to this pointer cause undefined behavior?

In struct bdb_vswing_preemph, the tables array is part of a __packed
structure, meaning it can be unaligned. When block->tables is assigned
to this standard const u32 * pointer in parse_vswing_preemph_override(),
the compiler's __packed annotations are dropped.

Any subsequent array accesses through vspeo.tables will assume standard
alignment, which can cause unaligned memory reads and UBSAN alignment fault=
s.

> +		int num_tables;
> +		int num_columns;
> +		int num_rows;
> +	} vspeo;
> +
>  	struct sdvo_device_mapping {
>  		u8 initialized;
>  		u8 dvo_port;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813160918.9188=
57-1-michal.grzelak@intel.com?part=3D2
