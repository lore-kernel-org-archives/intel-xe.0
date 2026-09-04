Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E4CC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D90510E1C7;
	Fri,  4 Sep 2026 12:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dhCVS3ve";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E5F10E1AB;
 Fri,  4 Sep 2026 12:43:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D77F641530;
 Fri,  4 Sep 2026 12:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9D61F00A3D;
 Fri,  4 Sep 2026 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788525804;
 bh=BB9ZKxwWO65MgGfZM3MXm0bRSheUTWWKX7ryfSIH74c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dhCVS3veO+X1hhuqdCaTHzqwFfW5NN3sgqOjDqZ96MyxF7mnYBsFojppkyby6A++R
 1/dwd4yRuhj9JGOLySLGHkbnrZjHiHvXld1u2EsfxQi8c570IZtexB5NfDOTOMzDwt
 /RGGKEk5j5Mp0db0rmcB3eathp2IxMO917JdBkvD+13akEcdCsL0PY/L1hJVd3Kbze
 sxEUTTJVl+HD+ZzjMx0CZWd46j68y3oedkD0m+BRPn8han/GL2sN9j4wHmZu6sDBEY
 6zrwLRnrEeeBIXolasY0ABlOkLXG4B8sOXrsqmZn9VLqg3XEzLoyXRU5w2wbFkeyP7
 TFnIcEWH9B3AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/8] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260904123148.2165596-3-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
 <20260904123148.2165596-3-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:43:24 +0000
Message-Id: <20260904124324.8D9D61F00A3D@smtp.kernel.org>
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
- [High] Missing bounds validation for VBT block 57 dimensions leading to o=
ut-of-bounds read
- [High] Unaligned pointer assignment drops __packed attribute, causing und=
efined behavior
- [Medium] Hardware assumption violation by proxying C20 PHY presence with =
DISPLAY_VER >=3D 14
--

commit ab5a1ab3ad655d1164dc5ca45a58ad0f45df01fb
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915/bios: store VBT #57's metadata in intel_vbt_data
   =20
Store tables, number of tables, number of rows and number of columns in
intel_vbt_data when search for the VBT #57 has succeeded. Structurize
all VS/PE-O relevant metadata inside anonymous struct named as vspeo.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index ece4df4a9d62a..06a8dd7581bb8 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
[ ... ]
> +static int vswing_preemph_num_rows(struct intel_display *display)
> +{
> +	return DISPLAY_VER(display) >=3D 14 ? 16 : 10;

[Severity: Medium]
Does this heuristic correctly identify C20 PHY presence across all variants?

The commit message states that the presence of C20 or newer PHY causes each
table to contain 16 rows, and proxies this check with DISPLAY_VER >=3D 14.
However, platform families can encompass multiple variants (for instance,
Meteor Lake can have both C10 and C20 PHYs).

If a hardware variant covered by DISPLAY_VER >=3D 14 does not contain a C20=
 PHY,
could the VBT provide a 10-row table instead, causing the 16-row assumption
to misinterpret the data?

> +}
> +
>  static void
>  parse_vswing_preemph_override(struct intel_display *display)
>  {
[ ... ]
> @@ -2218,6 +2223,11 @@ parse_vswing_preemph_override(struct intel_display=
 *display)
>  	/* pre-ICL GOPs don't have VBT #57 */
>  	if (!block)
>  		return;
> +
> +	display->vbt.vspeo.tables =3D block->tables;

[Severity: High]
Does this assignment drop the __packed attribute and cause unaligned pointer
dereferences?

Since struct bdb_vswing_preemph is marked __packed, its tables flexible arr=
ay
can be at an unaligned offset. Assigning block->tables to const u32 *tables
(which assumes a standard 4-byte alignment) drops the packed attribute.
Could this lead to alignment faults or undefined behavior when elements of
vspeo.tables are accessed?

[Severity: High]
Is it possible for a malformed VBT to cause an out-of-bounds read here?

The fields num_tables and num_columns are accepted directly from the untrus=
ted
VBT block and stored without validating that the actual block size (via
get_blocksize(block)) is large enough to contain the calculated number of
elements in the flexible tables array.

Could this lead to reading past the end of the heap allocation when the dri=
ver
later indexes into vspeo.tables?

> +	display->vbt.vspeo.num_tables =3D block->num_tables;
> +	display->vbt.vspeo.num_columns =3D block->num_columns;
> +	display->vbt.vspeo.num_rows =3D vswing_preemph_num_rows(display);
>  }
> =20
>  static u8 translate_iboost(struct intel_display *display, u8 val)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index 7e988b7b1fe7a..c80b4a2f74f9e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
[ ... ]
> @@ -244,6 +244,13 @@ struct intel_vbt_data {
>  	struct list_head display_devices;
>  	struct list_head bdb_blocks;
> =20
> +	struct {
> +		const u32 *tables;
> +		int num_tables;
> +		int num_columns;
> +		int num_rows;
> +	} vspeo;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904123148.2165=
596-1-michal.grzelak@intel.com?part=3D2
