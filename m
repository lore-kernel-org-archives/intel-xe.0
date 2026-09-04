Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A999CC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371B10F916;
	Fri,  4 Sep 2026 12:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eqkkLWd/";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC1A10FA44;
 Fri,  4 Sep 2026 12:54:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0FFAE43A21;
 Fri,  4 Sep 2026 12:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B930D1F00A3D;
 Fri,  4 Sep 2026 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788526439;
 bh=AaRfHO7jo3nPDKPO5lFeAS1ngKbRpCGUECJlA4QVeTk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eqkkLWd/IddHfBl5aqW6VQz5BJ8BuzwV0DBkqHGbWenc8uxGhY40t3vO33LE5+Mum
 BI+Ta61hWSL937/D1RFUCwF9r3Hras3Uae80mQ6wsykfwWByN+6LD/hgiS/9IdYeL9
 fojklfWXdCBAXMh+VXuGHPe4aPz84RL2ByX09hnMrOCyRkHdlJIB1Hrg4YO4i8bRqL
 f6Dnm9cYRgAjABN8ZkGUbCPQB2cD7vs+16amCEuXYsWxypIAYbofh3Bg/Hvoht+v5q
 A8cZOA7X/cQn5vQOGeGrdjw6Mtsw69u2VQq3A/E2/5rwSwczUu0t7lByTb5X4nuKfM
 buy7Aljg/ldCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/8] drm/i915: override Snps's VS/PE when requested
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260904123148.2165596-7-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
 <20260904123148.2165596-7-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:53:59 +0000
Message-Id: <20260904125359.B930D1F00A3D@smtp.kernel.org>
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
- [High] Missing bounds checks on VBT-provided 'num_tables' and 'num_column=
s' when calculating array offsets leads to out-of-bounds read vulnerabiliti=
es when parsing VS/PE override tables.
- [High] Returning an empty buffer translation table when the VBT block is =
missing causes callers to access negative array indices (e.g., `entries[-1]=
`).
--

commit 4a1fde509366b85ca4550f56196259dc3545219c
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915: override Snps's VS/PE when requested

This commit adds accessor functions to read the requested Snps VS/PE
table from VBT block 57. It parses the requested table and transforms
the data into the port's buffer for C10 and C20 PHYs.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 1a09f7933e491..be7554c483ad2 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -3880,6 +3880,97 @@ bool intel_bios_encoder_supports_tbt(const struct =
intel_bios_encoder_data *devda
>  	return devdata->display->vbt.version >=3D 209 && devdata->child.tbt;
>  }
> =20
> +static bool
> +validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_d=
p)
> +{
> +	struct intel_ddi_buf_trans *vspeo;
> +
> +	vspeo =3D devdata->vspeo;
> +	if (!vspeo)
> +		return false;

[Severity: High]
Does this validation need to ensure the VBT block data was actually parsed?

If VBT block 57 is absent, vspeo might be allocated with num_entries
set to 0, which would pass this check. If intel_bios_get_c20_vspeo returns
this empty vspeo, downstream callers like intel_ddi_buf_trans_get will
return n_entries =3D 0.

When n_entries =3D 0 reaches intel_ddi_level(), could it result in level
becoming -1:

drivers/gpu/drm/i915/display/intel_ddi.c:intel_ddi_level() {
    ...
    if (drm_WARN_ON_ONCE(display->drm, level >=3D n_entries))
        level =3D n_entries - 1;

    return level;
}

This would cause callers to access a negative array index on the entries
pointer, leading to a potential crash.

> +
> +	if (!has_dp)
> +		return false;
> +
> +	return true;
> +}
> +
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
> +			 bool has_dp, bool is_uhbr)
> +{
> +	struct intel_display *display =3D devdata->display;
> +	union intel_ddi_buf_trans_entry *entries =3D devdata->entries;
> +	struct intel_ddi_buf_trans *vspeo =3D devdata->vspeo;
> +	const u32 *tables =3D display->vbt.vspeo.tables;
> +	int num_columns =3D display->vbt.vspeo.num_columns;
> +	int num_rows =3D display->vbt.vspeo.num_rows;
> +	int idx =3D is_uhbr ? 5 : 4;
> +	size_t offset =3D 0;
> +	int level;
> +
> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;
> +
> +	offset +=3D idx * num_rows * num_columns;

[Severity: High]
Should there be bounds checking on idx and num_columns here?

Since idx is computed dynamically (up to 5 for C20, and up to 3 for C10)
and multiplied by num_rows and num_columns, the resulting offset
could potentially exceed the size of the VBT block 57 data if num_columns
is unexpectedly large or the block is truncated.

Could this lead to an out-of-bounds read when accessing tables[offset + 2]
below, potentially reading unmapped memory?

> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 vswing =3D tables[offset];
> +		u32 pre_cursor =3D tables[offset + 1];
> +		u32 post_cursor =3D tables[offset + 2];

[ ... ]

> +const struct intel_ddi_buf_trans *
> +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
> +			 bool has_dp, int port_clock, bool has_edp)
> +{
> +	struct intel_display *display =3D devdata->display;
> +	union intel_ddi_buf_trans_entry *entries =3D devdata->entries;
> +	struct intel_ddi_buf_trans *vspeo =3D devdata->vspeo;
> +	const u32 *tables =3D display->vbt.vspeo.tables;
> +	int num_columns =3D display->vbt.vspeo.num_columns;
> +	int num_rows =3D display->vbt.vspeo.num_rows;
> +	size_t offset =3D 0;
> +	int level, idx;
> +
> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;
> +
> +	if (has_edp)
> +		idx =3D port_clock > 540000 ? 3 : 2;
> +	else
> +		idx =3D port_clock > 270000 ? 1 : 0;
> +
> +	offset +=3D idx * num_rows * num_columns;

[Severity: High]
Similar to the C20 function above, is it possible for this computed
offset to fall outside the bounds of the tables array if num_columns
or the selected idx is too large for the provided VBT data?

> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 vswing =3D tables[offset];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904123148.2165=
596-1-michal.grzelak@intel.com?part=3D6
