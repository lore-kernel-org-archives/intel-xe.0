Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D59C5B572
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 15:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BD610ECAD;
	Tue, 11 Aug 2026 15:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GteRP4bH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5A10ECAC;
 Tue, 11 Aug 2026 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786463487; x=1817999487;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YVW2jr4ve/k/uIAOMZkT3Eq2FDiHhubEaa8ZT5Wpb0Q=;
 b=GteRP4bH3JwL/nKNjC/5qeVAY/0KABSsm1RAdD5wY1C+3CBF0A+Tp8TL
 S7MF5yvYFVvvcVT8N3WezqSzGDDy7gPnwlkxzKT32yDXq+Y8/2gQw7vBx
 /hUMsxA8XdwAlqHPpzpWSjkphmucXBha8gO1K3XQWPicpDMSxeKMmEHte
 iPbpCMvwm8W9yssRpDc8G9AF2wuef857LjaU+qhoohY47sUILAvBbm+P3
 CBf+50uzYI4/EQWh/jCQns8r68mLimmOuwUIHH9ElxKxZL+ll0r3B1LIo
 otOdxuBKjK0fvyoqgnrpAnkctq6IqGvgl0hsa8q13ecKso0w/knTgr1Pd w==;
X-CSE-ConnectionGUID: FftQRPxDSReaV7SS+1FL5g==
X-CSE-MsgGUID: gH9fg98uRGmmR3IuRUgePg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="112545335"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="112545335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 08:51:27 -0700
X-CSE-ConnectionGUID: Am4PL6ekT4200++roCfxsw==
X-CSE-MsgGUID: COhPDIIhQauWOEOccodDdQ==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.254])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 08:51:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH v10 7/8] drm/i915: override Combo's VS/PE when requested
In-Reply-To: <20260702185839.4042397-8-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260702185839.4042397-1-michal.grzelak@intel.com>
 <20260702185839.4042397-8-michal.grzelak@intel.com>
Date: Tue, 11 Aug 2026 18:51:22 +0300
Message-ID: <7fa2b7fd70bdc17eba3f6a9dcac6be42cb692f8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 02 Jul 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Add accessor function for Combo to read requested table from VBT #57.
> Parse the requested table and transform data into port's buffer.
>
> For EHL, in cases when eDP encoder uses low vswing, choose 3rd table if
> encoder supports HBR3. Otherwise use 2nd table for eDP using low vswing.
>
> In cases when eDP encoder does not use low vswing, choose 2nd table if
> encoder supports mode higher or including HBR2. Otherwise use 3rd table
> for eDP not using low vswing.
>
> For external DP use 2nd table if encoder supports modes higher than or
> including HBR2. Use 1st table if external DP encoder supports modes
> lower than HBR2.
>
> For JSL, always use 1st table for external DP. For eDPs not using low
> vswing use 1st table as well.
>
> In cases when eDP encoder uses low vswing, choose 1st table if encoder
> supports HBR3. When encoder supports HBR2 choose 3rd table. When
> encoder supports modes lower than HBR2 choose 2nd table.
>
> There are no changes to intel_ddi_dp_level() since selection of correct
> row of intel_ddi_buf_trans_entry is same as when no override request has
> been done.
>
> Looking from other OSes, in case when encoder does not support DP we
> could theoretically use 1st table. However, as of now, use default
> tables.
>
> v9->v10
> - call dedicated VS/PE-O vfunc
> - drop deconstifying default tables (Suraj, Jani)
> - cache `entries` into const field after data is overwritten (Jani)
>
> v8->v9
> - deconstify intel_ddi_buf_trans_entry
>
> v6->v7
> - handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
> - remove vspeo's cast to (void *) (Jani)
> - call encoder->get_buf_trans() once (Jani)
> - return NULL from intel_bios_get_* when using default (Jani)
> - validate VS/PE-O in intel_bios.c (Jani)
> - check devdata->vspeo if VS/PE-O was requested
> - inline {jsl,ehl}_combo_get_vspeo_buf_trans()
> - remove temporarily LT
>
> v4->v5
> - blend index computation with table parsing
> - remove enums entirely
> - add spaces around operators (Suraj)
> - remove spaces after type casting (Suraj)
> - remove INTEL_DISPLAY_STATE_WARN (Suraj)
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c     | 104 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_bios.h     |   6 +
>  .../drm/i915/display/intel_ddi_buf_trans.c    |  41 ++++++-
>  3 files changed, 148 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index f897ac067585..b84552527050 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -3985,6 +3985,110 @@ intel_bios_get_c10_vspeo(const struct intel_bios_=
encoder_data *devdata,
>  	return vspeo;
>  }
>=20=20
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool has_edp)
> +{
> +	struct intel_display *display;
> +	union intel_ddi_buf_trans_entry *entries;
> +	int num_columns, num_rows, level, idx;
> +	struct intel_ddi_buf_trans *vspeo;
> +	const u32 *tables;
> +	size_t offset =3D 0;
> +
> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;
> +
> +	display =3D devdata->display;
> +	vspeo =3D devdata->vspeo;
> +	entries =3D devdata->entries;
> +	tables =3D display->vbt.vspeo.tables;
> +	num_columns =3D display->vbt.vspeo.num_columns;
> +	num_rows =3D display->vbt.vspeo.num_rows;

Same thing about initialization as in the preceding patch.


> +
> +	idx =3D port_clock > 270000 ? 1 : 0;
> +	if (has_edp)
> +		idx =3D port_clock > 540000 ? 2 : 1;

Init once, not twice for has_edp.

> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 dw2_swing_sel =3D tables[offset];
> +		u32 dw7_n_scalar =3D tables[offset + 1];
> +		u32 dw4_cursor_coeff =3D tables[offset + 2];
> +		u32 dw4_post_cursor_2 =3D tables[offset + 3];
> +		u32 dw4_post_cursor_1 =3D tables[offset + 4];
> +
> +		entries[level].icl.dw2_swing_sel =3D dw2_swing_sel;
> +		entries[level].icl.dw7_n_scalar =3D dw7_n_scalar;
> +		entries[level].icl.dw4_cursor_coeff =3D dw4_cursor_coeff;
> +		entries[level].icl.dw4_post_cursor_2 =3D dw4_post_cursor_2;
> +		entries[level].icl.dw4_post_cursor_1 =3D dw4_post_cursor_1;

Again, u8 vs. u32.

> +
> +		offset +=3D num_columns;
> +	}
> +
> +	vspeo->entries =3D entries;
> +	vspeo->num_entries =3D num_rows;
> +
> +	return vspeo;
> +}
> +
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool low_vswing_edp)
> +{
> +	struct intel_display *display;
> +	union intel_ddi_buf_trans_entry *entries;
> +	int num_columns, num_rows, level, idx;
> +	struct intel_ddi_buf_trans *vspeo;
> +	const u32 *tables;
> +	size_t offset =3D 0;
> +
> +	if (!validate_vspeo(devdata, has_dp))
> +		return NULL;
> +
> +	display =3D devdata->display;
> +	vspeo =3D devdata->vspeo;
> +	entries =3D devdata->entries;
> +	tables =3D display->vbt.vspeo.tables;
> +	num_columns =3D display->vbt.vspeo.num_columns;
> +	num_rows =3D display->vbt.vspeo.num_rows;

Same.

> +
> +	idx =3D 0;

Again, IMO bad form to do something once, and then override in some
other cases, *unless* you do this kind of "default" init at declaration.

> +	if (low_vswing_edp) {
> +		if (port_clock > 540000)
> +			idx =3D 0;
> +		else if (port_clock > 270000)
> +			idx =3D 1;
> +		else
> +			idx =3D 2;
> +	}
> +
> +	offset +=3D idx * num_rows * num_columns;
> +
> +	for (level =3D 0; level < num_rows; level++) {
> +		u32 dw2_swing_sel =3D tables[offset];
> +		u32 dw7_n_scalar =3D tables[offset + 1];
> +		u32 dw4_cursor_coeff =3D tables[offset + 2];
> +		u32 dw4_post_cursor_2 =3D tables[offset + 3];
> +		u32 dw4_post_cursor_1 =3D tables[offset + 4];
> +
> +		entries[level].icl.dw2_swing_sel =3D dw2_swing_sel;
> +		entries[level].icl.dw7_n_scalar =3D dw7_n_scalar;
> +		entries[level].icl.dw4_cursor_coeff =3D dw4_cursor_coeff;
> +		entries[level].icl.dw4_post_cursor_2 =3D dw4_post_cursor_2;
> +		entries[level].icl.dw4_post_cursor_1 =3D dw4_post_cursor_1;

u32 vs. u8

> +
> +		offset +=3D num_columns;
> +	}
> +
> +	vspeo->entries =3D entries;
> +	vspeo->num_entries =3D num_rows;
> +
> +	return vspeo;
> +}
> +
>  bool intel_bios_encoder_is_dedicated_external(const struct intel_bios_en=
coder_data *devdata)
>  {
>  	return devdata->display->vbt.version >=3D 264 &&
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/=
i915/display/intel_bios.h
> index 49acf8c405e2..c55765a94594 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.h
> +++ b/drivers/gpu/drm/i915/display/intel_bios.h
> @@ -79,6 +79,12 @@ intel_bios_get_c20_vspeo(const struct intel_bios_encod=
er_data *devdata,
>  const struct intel_ddi_buf_trans *
>  intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
>  			 bool has_dp, int port_clock, bool has_edp);
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_ehl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool has_edp);
> +const struct intel_ddi_buf_trans *
> +intel_bios_get_jsl_combo_vspeo(const struct intel_bios_encoder_data *dev=
data,
> +			       bool has_dp, int port_clock, bool low_vswing_edp);
>=20=20
>  bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_d=
ata *devdata);
>  bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_dat=
a *devdata);
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers=
/gpu/drm/i915/display/intel_ddi_buf_trans.c
> index 92c0d0f933ab..0843b3e2bfa6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
> @@ -1784,6 +1784,39 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *enc=
oder,
>  		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
>  }
>=20=20
> +static const struct intel_ddi_buf_trans *
> +jsl_get_combo_buf_trans_override(struct intel_encoder *encoder,
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
> +	return intel_bios_get_jsl_combo_vspeo(devdata, has_dp, port_clock,
> +					      has_edp && use_edp_low_vswing(encoder));
> +}
> +
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
> +
>  static const struct intel_ddi_buf_trans *
>  mtl_get_c10_buf_trans_override(struct intel_encoder *encoder,
>  			       const struct intel_crtc_state *crtc_state,
> @@ -1847,11 +1880,13 @@ void intel_ddi_buf_trans_init(struct intel_encode=
r *encoder)
>  		else
>  			encoder->get_buf_trans =3D tgl_get_dkl_buf_trans;
>  	} else if (DISPLAY_VER(display) =3D=3D 11) {
> -		if (display->platform.jasperlake)
> +		if (display->platform.jasperlake) {
>  			encoder->get_buf_trans =3D jsl_get_combo_buf_trans;
> -		else if (display->platform.elkhartlake)
> +			encoder->get_buf_trans_override =3D jsl_get_combo_buf_trans_override;
> +		} else if (display->platform.elkhartlake) {
>  			encoder->get_buf_trans =3D ehl_get_combo_buf_trans;
> -		else if (intel_encoder_is_combo(encoder))
> +			encoder->get_buf_trans_override =3D ehl_get_combo_buf_trans_override;
> +		} else if (intel_encoder_is_combo(encoder))
>  			encoder->get_buf_trans =3D icl_get_combo_buf_trans;
>  		else
>  			encoder->get_buf_trans =3D icl_get_mg_buf_trans;

--=20
Jani Nikula, Intel
