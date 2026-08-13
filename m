Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE35C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8052B10E4E5;
	Thu, 13 Aug 2026 16:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NGK5/mH0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E02310E4E5;
 Thu, 13 Aug 2026 16:50:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D76843870;
 Thu, 13 Aug 2026 16:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5141F000E9;
 Thu, 13 Aug 2026 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786639817;
 bh=8Ky09McAots0CgJ3ElyGU75R+O91ZYko9YLt8OcgxaI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NGK5/mH0p7nO40WwilHciFjIVghfqy7GZ3a50NJfxbW0T9yIDuwQxDvlzJ/0lwVbB
 KBLb1K6iSovZqajHzmk50DgzjUdLZ9dNva21bazPKPuGb4RObZhXseHR3DV/sG3DnF
 7f9m18m6akQ7DwNGAkhQRgLrwmXSASZ18eG4o8z84AOP3GVTCQZLB3ViD7/ypYrQV2
 aGBJgL5e3wNfrb/TGlaYGhDm63CgCEq1TsXV1bAH9z0L8VhOsh5+bmbWqoxdZA1tRU
 kcmRx3wNAmGuYR8fV2dAFvV2zuq5F3IcE6xxrvxEQ9Ky/IL85gGTxDfVhtS6NgAXhX
 Q70z80OtzceTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 7/8] drm/i915: override Combo's VS/PE when requested
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260813160918.918857-8-michal.grzelak@intel.com>
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-8-michal.grzelak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:50:16 +0000
Message-Id: <20260813165017.4B5141F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] EHL PHY override logic incorrectly applies 'low_vswing' settings t=
o non-low_vswing eDP panels
- [Medium] Potential out-of-bounds read during VBT 'tables' parsing
- [Medium] JSL PHY override logic is reversed for HBR2 vs lower port clocks=
 compared to intended behavior
- [Medium] Memory allocated for `devdata->entries` is leaked on early retur=
n in vspeo retrieval functions
--

--- Patch [7]: [PATCH v11 7/8] drm/i915: override Combo's VS/PE when reques=
ted ---
commit 3f316b5929dec8d0ea8bb76e4cb8983db3b9bf70
Author: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
drm/i915: override Combo's VS/PE when requested

This commit adds accessor functions for the Combo PHY to read requested
VS/PE tables from the VBT. It parses the requested table and transforms
the data to override the port's buffer settings based on platform (EHL/JSL)
and port capabilities.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c

[ ... ]

> +const struct intel_ddi_buf_trans *
> +intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool has_edp)
> +{

[ ... ]

> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;

[Severity: Medium]
Does this early return (and the similar one in intel_bios_get_jsl_combo_vsp=
eo)
cause a memory leak of the devdata->entries buffer?

During teardown in intel_bios_driver_remove(), the driver attempts to free
this memory using kfree(devdata->vspeo->entries). Since vspeo->entries is
assigned much later in this function, returning NULL here leaves
devdata->vspeo->entries uninitialized or NULL. This would cause the teardown
code to skip freeing the memory allocated to devdata->entries.

> +
> +	if (has_edp)
> +		idx =3D port_clock > 540000 ? 2 : 1;
> +	else
> +		idx =3D port_clock > 270000 ? 1 : 0;

[Severity: High]
The commit message indicates that for EHL, eDP configurations using low
vswing should behave differently from eDP configurations not using low
vswing. However, does this logic unconditionally apply the same table index
logic to all eDP configurations?

It seems intel_bios_get_ehl_combo_vspeo() does not receive or check a
low_vswing parameter (like the JSL equivalent does), applying the same
fallback logic to all eDP panels.

> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 dw2_swing_sel =3D tables[offset];
> +		u32 dw7_n_scalar =3D tables[offset + 1];
> +		u32 dw4_cursor_coeff =3D tables[offset + 2];
> +		u32 dw4_post_cursor_2 =3D tables[offset + 3];
> +		u32 dw4_post_cursor_1 =3D tables[offset + 4];

[Severity: Medium]
Can this loop read out of bounds if the VBT is malformed?

The parsing calculation offset =3D idx * num_rows * num_columns followed by
direct accesses up to tables[offset + 4] doesn't appear to validate that
num_columns is at least 5, or that the overall VBT tables buffer is
sized adequately to support the calculated offset and rows.

[ ... ]

> +const struct intel_ddi_buf_trans *
> +intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool low_vswing_edp)
> +{

[ ... ]

> +	if (low_vswing_edp) {
> +		if (port_clock > 540000)
> +			idx =3D 0;
> +		else if (port_clock > 270000)
> +			idx =3D 1;
> +		else
> +			idx =3D 2;
> +	}

[Severity: Medium]
Is this table selection logic reversed compared to the commit message?

The commit message states: "When encoder supports HBR2 choose 3rd table.
When encoder supports modes lower than HBR2 choose 2nd table."

However, the code assigns idx =3D 1 (2nd table) for port_clock > 270000 (HB=
R2)
and idx =3D 2 (3rd table) for lower modes.

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers=
/gpu/drm/i915/display/intel_ddi_buf_trans.c
> --- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c

[ ... ]

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
> +	return intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock, has_=
edp);
> +}

[Severity: High]
Should this override function be checking use_edp_low_vswing(encoder)
similar to how it is checked in jsl_get_combo_buf_trans_override()?

The current implementation omits the low_vswing context entirely, passing
only has_edp down to intel_bios_get_ehl_combo_vspeo(), which prevents the
distinction between low vswing and normal eDP configurations from being mad=
e.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813160918.9188=
57-1-michal.grzelak@intel.com?part=3D7
