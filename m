Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE186C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 23:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF96210E057;
	Thu, 13 Aug 2026 23:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PDfH6Cx6";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E1A10E523;
 Thu, 13 Aug 2026 23:12:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A540D43E0B;
 Thu, 13 Aug 2026 23:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D061F000E9;
 Thu, 13 Aug 2026 23:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786662756;
 bh=Vz+3uqBkLg+y9lfmNSRGKvKp6FtbrSGQGq1iqF39N1U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PDfH6Cx6dmPXhyuda1D6FCkhJiNQN02hJeIIYSPApzeSk20XSvwX9bEJqd46HYtci
 rbka87wCa2RuTzGeouGfeloipGFu2533lFfuzvuOKTeJrfxzEEBp1j5OuTP/YPPIA3
 LKN8v5oD6lCEFR7Ge17WnmYg0qg++zmtXgO2PFhESljeCs25Nclc0QrGPx60HB0a3m
 vhT1juQ9/K6saIi/eebvbKCzdgWa2OKL8FIZZjgJ4LsYmrzY3Io/YLYB4BNNKKm2VW
 YwPTSuu8CCL9japOlq/vATzX6ydy/d3J58XucSkzW0cN8IkVKF/ZkTKoiCC6jFXk1a
 uWl1sYebp3u6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 04/16] drm/i915/bios: prepare for parsing VBT #57
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260331183332.1773886-5-michal.grzelak@intel.com>
References: <20260331183332.1773886-5-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:12:35 +0000
Message-Id: <20260813231236.52D061F000E9@smtp.kernel.org>
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
- [High] Missing NULL check on `kzalloc` causing NULL pointer dereference.
- [High] Unconditional memory leak of `bufs_table` and its elements.
--

--- Patch [4]: [PATCH v1 04/16] drm/i915/bios: prepare for parsing VBT #57 =
---
commit a6241aaaf22342914933a8b58de0747a6e01cf2a
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915/bios: prepare for parsing VBT #57

This commit adds parsing code for VBT #57 and a structure for storing VS/PE
data. It also allocates a matrix of intel_ddi_buf_trans_entry to store the
deparsed values and handles its deallocation on driver removal.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index b6fe87c29aa7c..778584c59fc6f 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c

[ ... ]

> @@ -2183,6 +2184,38 @@ parse_compression_parameters(struct intel_display =
*display)
>  	}
>  }
> =20
> +static void
> +parse_vswing_preemph_override(struct intel_display *display)
> +{
> +	union intel_ddi_buf_trans_entry **bufs_table;
> +	const struct bdb_vswing_preemph *block;
> +	u8 num_rows;
> +
> +	if (display->vbt.version < 218)
> +		return;
> +
> +	block =3D bdb_find_section(display, BDB_VSWING_PREEMPH);
> +
> +	/* pre-ICL GOP don't have VBT #57 */
> +	if (!block)
> +		return;
> +
> +	num_rows =3D DISPLAY_VER(display) >=3D 14 ? 16 : 10;
> +
> +	bufs_table =3D kzalloc(block->num_tables * sizeof(*bufs_table), GFP_KER=
NEL);
> +
> +	for (int idx =3D 0; idx < block->num_tables; idx++)
> +		bufs_table[idx] =3D kzalloc(num_rows * sizeof(**bufs_table), GFP_KERNE=
L);

[Severity: High]
Is a NULL check missing here?

If kzalloc() fails to allocate bufs_table, the loop will immediately attempt
to assign to bufs_table[idx] and cause a NULL pointer dereference.

Additionally, if the inner kzalloc() for individual rows fails, it leaves
NULL pointers in the table without any error handling.

> +
> +	drm_dbg_kms(display->drm, "Vswing / Preemph Override not yet supported =
on the platform\n");
> +	bufs_table =3D NULL;

[Severity: High]
Does this cause an unconditional memory leak?

The memory just allocated for bufs_table and its elements is explicitly
overwritten with NULL here.

This causes display->vbt.vswing_preemph.bufs_table to receive NULL, and the
original allocated pointers are completely lost, preventing them from being
freed during intel_bios_driver_remove().

> +
> +	display->vbt.vswing_preemph.bufs_table =3D bufs_table;
> +	display->vbt.vswing_preemph.num_tables =3D block->num_tables;
> +	display->vbt.vswing_preemph.num_rows =3D num_rows;
> +	display->vbt.vswing_preemph.num_cols =3D block->num_columns;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260331183332.1773=
886-1-michal.grzelak@intel.com?part=3D4
