Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F616C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142A210E159;
	Fri,  4 Sep 2026 12:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g6UHY+x9";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5B10E159;
 Fri,  4 Sep 2026 12:59:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 121AB41A83;
 Fri,  4 Sep 2026 12:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBA31F00A3D;
 Fri,  4 Sep 2026 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788526752;
 bh=0q2YAw8Zv+6c7uMBVpTMKsasX4WhDIEU4iWCBRLXX1U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=g6UHY+x98KTlUQ36ZRJEEgY1rve7OA/wEKcOB+Sh7z1pQjnnkjRAXyFjvlNkpm2iQ
 mHU8B0qxAGwJdfNQvud+v68TuJBEDmEn6FNeBjy/j6lNEiSeyi3ywQwAYSmfyPUW2L
 QNne5gIVvMCSUcmf87AIKk4SNd1IXme+9bdS0gU91sPtatboghqDzpWfHX3wzuvRHU
 Xy8Vu5VZV0T65iGC36OsinRVVhwHvkjFMV0/BDMgPgLB3XlqCjKHmPViwCyARztE0y
 7w9ZYGlh2JVGxQzt3ltcTbqkDhdaRCNea2KphwHjRmrXO5pi3IRTC77eJEfrZ3/mtZ
 +Q6vgloJKh1bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 7/8] drm/i915: override Combo's VS/PE when requested
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260904123148.2165596-8-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
 <20260904123148.2165596-8-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:59:11 +0000
Message-Id: <20260904125911.BBBA31F00A3D@smtp.kernel.org>
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
- [High] Missing array bounds checks when reading Voltage Swing/Pre-emphasi=
s (VS/PE) override tables from the untrusted Video BIOS Table (VBT) firmwar=
e.
- [Medium] Incorrect VBT table selection for Elkhart Lake (EHL) eDP without=
 low vswing, conflicting with the commit message specification.

Pre-existing issues:
- [High] Missing validation for empty VBT `BDB_VSWING_PREEMPH` block allows=
 zero-sized override tables to break downstream DP link training with out-o=
f-bounds array access.
--

commit ab4a3b4de7f1dea34bc921ed9cb14b8ea9e4b8f3
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

drm/i915: override Combo's VS/PE when requested

Add accessor function for Combo to read requested table from VBT #57.
Parse the requested table and transform data into port's buffer.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index be7554c483ad2..11d2cbb78eabf 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -3971,6 +3971,99 @@ intel_bios_get_c10_vspeo(const struct intel_bios_e=
ncoder_data *devdata,
> [ ... ]
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool low_vswing_edp)
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

[Severity: High]
This isn't a bug introduced by this patch, but does validate_vspeo() proper=
ly
validate the VS/PE override block?

If the VBT sets use_vbt_vswing =3D 1 but omits the BDB_VSWING_PREEMPH block,
parse_vswing_preemph_override() leaves num_rows =3D 0. This results in
vspeo->num_entries being 0.

Because validate_vspeo() only checks if the table struct was allocated and
ignores num_rows =3D=3D 0, it returns true:

static bool
validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_dp)
{
        struct intel_ddi_buf_trans *vspeo;

        vspeo =3D devdata->vspeo;
        if (!vspeo)
                return false;
...

Later, downstream callers like icl_mg_phy_set_signal_levels() compute
level =3D n_entries - 1 (which becomes -1) and perform an out-of-bounds arr=
ay
access on trans->entries[-1]. Could we add a check for
vspeo->num_entries > 0?

> +
> +	if (low_vswing_edp)
> +		idx =3D port_clock > 540000 ? 2 : 1;
> +	else
> +		idx =3D port_clock > 270000 ? 1 : 0;

[Severity: Medium]
Could this table selection logic conflict with the commit message?

The commit message specifies: "Otherwise use 3rd table for eDP not using
low vswing."

When eDP does not use low vswing, low_vswing_edp is false, and this logic
assigns idx =3D 0 (1st table) for port_clock <=3D 270000, instead of idx =
=3D 2
(3rd table) as specified. This correctly applies the 1st table for
external DP, but incorrectly applies the 1st table for eDP panels without
low vswing.

> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 dw2_swing_sel =3D tables[offset];
> +		u32 dw7_n_scalar =3D tables[offset + 1];
> +		u32 dw4_cursor_coeff =3D tables[offset + 2];
> +		u32 dw4_post_cursor_2 =3D tables[offset + 3];
> +		u32 dw4_post_cursor_1 =3D tables[offset + 4];

[Severity: High]
Can this sequence lead to an out-of-bounds read from the VBT firmware data?

This unconditionally accesses up to tables[offset + 4] without checking if
the VBT block's num_columns is at least 5, or if the overall block contains
sufficient bounds.

Because VBT data is untrusted firmware input, if num_columns is less than
5, or if idx relies on a num_tables value smaller than the hardcoded logic
assumes, this can read past the bounds of the dynamically sized
bdb_vswing_preemph block.

> [ ... ]
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool low_vswing_edp)
> +{
> [ ... ]
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 dw2_swing_sel =3D tables[offset];
> +		u32 dw7_n_scalar =3D tables[offset + 1];
> +		u32 dw4_cursor_coeff =3D tables[offset + 2];
> +		u32 dw4_post_cursor_2 =3D tables[offset + 3];
> +		u32 dw4_post_cursor_1 =3D tables[offset + 4];

[Severity: High]
Does this have the same out-of-bounds read risk for the JSL combo PHY
tables as noted above? We should ensure num_columns >=3D 5 and the offset is
within valid bounds.

> [ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers=
/gpu/drm/i915/display/intel_ddi_buf_trans.c
> index 92c0d0f933ab4..5ad8ad2d0b8e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> @@ -1784,6 +1784,40 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *enc=
oder,
> [ ... ]
> +static const struct intel_ddi_buf_trans *
> +ehl_get_combo_buf_trans_override(struct intel_encoder *encoder,
> +				 const struct intel_crtc_state *crtc_state,
> +				 int *n_entries)
> +{
> +	const struct intel_bios_encoder_data *devdata =3D encoder->devdata;
> +	bool has_edp, has_dp;
> +	int port_clock;
> +
> +	has_edp =3D intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
> +	has_dp =3D intel_crtc_has_dp_encoder(crtc_state);
> +	port_clock =3D crtc_state->port_clock;
> +
> +	return intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock,
> +					      has_edp && use_edp_low_vswing(encoder));

[Severity: Medium]
Does this discard the has_edp distinction for non-low-vswing eDP?

Passing has_edp && use_edp_low_vswing(encoder) conflates external DP and
eDP without low vswing into a single low_vswing_edp boolean parameter.

This causes intel_bios_get_ehl_combo_vspeo() to treat eDP panels without
low vswing exactly like external DP, leading to the incorrect table
selection pointed out earlier.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904123148.2165=
596-1-michal.grzelak@intel.com?part=3D7
