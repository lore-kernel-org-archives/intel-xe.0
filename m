Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5272BC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546B10E748;
	Mon,  7 Sep 2026 10:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+WYfiHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B768710E748;
 Mon,  7 Sep 2026 10:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788775822; x=1820311822;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mK2iLrRR1JDJSUMRvuwpqVMSnzBz7/A6dymxWxGRdzk=;
 b=I+WYfiHNKcHJ0Fb0Kao3Y7DVmBBEaqr+FrbdfCqR5NG1rkTA+aGCCRrt
 AOM2zXmevShaXg1r5spG7iGKJen1PblhBgddqGjmDBwJ/kl7hA4Jn/JDh
 C97s7cfI94fU7NFTILH8B5pEt5ioV4OIqoESzugxz4g4fzv1tffhmNyJ+
 WoWdb499/DxgWetYY0yKpNqjs0Lx9+KtBXrucMt91B+nef9MbD8xodbQ1
 pneif4+piZE44CIZfZdgN3u45C1RVO4thln/t4tVTcanfrvg7kocDw+t1
 As+cHScW+Q/ma6gKAoFK7rV1lEzHQwXhZYAbnC04LjppEcFTMLKJDW29C g==;
X-CSE-ConnectionGUID: bsZBhr9tT7aEgPGeq4UFGQ==
X-CSE-MsgGUID: yFZ4SOVrR8We/0O3ZgGHbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88937979"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88937979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:10:22 -0700
X-CSE-ConnectionGUID: y1xcBEz8S7CnccO7s8/gYw==
X-CSE-MsgGUID: e6ZPse/uThCQuVY2zAqH2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268939056"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:10:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: Re: [PATCH] drm/i915/debugfs: Add HDR status to i915_display_info
In-Reply-To: <20260907035831.718916-1-pranay.samala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260907035831.718916-1-pranay.samala@intel.com>
Date: Mon, 07 Sep 2026 13:10:17 +0300
Message-ID: <4223f91e8a308713ca916a1bba3147321e9b901d@intel.com>
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

On Mon, 07 Sep 2026, Pranay Samala <pranay.samala@intel.com> wrote:
> i915_display_info currently shows per-connector state but not HDR status,
> making HDR bringup hard to debug without correlating EDID, userspace,
> and driver state.
>
> Print the sink=E2=80=99s HDR capability from the EDID static metadata blo=
ck,
> whether userspace has set the HDR_OUTPUT_METADATA property, and whether
> the driver is actually transmitting HDR metadata in the CRTC state. This
> distinguishes between a sink advertising HDR support, a property being
> set by userspace, and the actual HDR infoframe being sent on the wire.
>
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drive=
rs/gpu/drm/i915/display/intel_display_debugfs.c
> index 3e302f23f247..a24c947c23de 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -243,6 +243,86 @@ static void intel_hdmi_info(struct seq_file *m,
>  	seq_printf(m, "\taudio support: %s\n", str_yes_no(has_audio));
>  }
>=20=20
> +static const char *intel_hdr_eotf_name(enum hdmi_eotf eotf)
> +{
> +	switch (eotf) {
> +	case HDMI_EOTF_TRADITIONAL_GAMMA_SDR:
> +		return "SDR";
> +	case HDMI_EOTF_TRADITIONAL_GAMMA_HDR:
> +		return "HDR-gamma";
> +	case HDMI_EOTF_SMPTE_ST2084:
> +		return "SMPTE_ST2084";
> +	case HDMI_EOTF_BT_2100_HLG:
> +		return "HLG";
> +	default:
> +		return "unknown";
> +	}
> +}

Maybe add that to hdmi.[ch] instead of a local copy? There's nothing
Intel or i915 specific about this.

> +
> +static void intel_hdr_sink_info(struct seq_file *m,
> +				struct drm_connector *connector)
> +{

If you did

	struct drm_printer p =3D drm_seq_file_printer(m);

in the caller, and passed struct drm_printer *p here, you could use
drm_printf_indent() and avoid doing that \t stuff everywhere.

Side note, I've got a branch converting the entire file to drm_printer,
but never got around to sending it.


BR,
Jani.


> +	const struct hdr_static_metadata *hdr =3D
> +		&connector->display_info.hdr_sink_metadata.hdmi_type1;
> +	int i;
> +
> +	seq_printf(m, "\tHDR sink capable: %s\n",
> +		   str_yes_no(hdr->eotf & (BIT(HDMI_EOTF_SMPTE_ST2084) |
> +					   BIT(HDMI_EOTF_BT_2100_HLG))));
> +	if (!hdr->eotf)
> +		return;
> +
> +	seq_puts(m, "\t\tsupported EOTF:");
> +	for (i =3D HDMI_EOTF_TRADITIONAL_GAMMA_SDR; i <=3D HDMI_EOTF_BT_2100_HL=
G; i++)
> +		if (hdr->eotf & BIT(i))
> +			seq_printf(m, " %s", intel_hdr_eotf_name(i));
> +	seq_puts(m, "\n");
> +
> +	seq_printf(m, "\t\tstatic metadata type1: %s\n",
> +		   str_yes_no(hdr->metadata_type & BIT(HDMI_STATIC_METADATA_TYPE1)));
> +	seq_printf(m, "\t\tmax_cll: %u, max_fall: %u, min_cll: %u (EDID coded)\=
n",
> +		   hdr->max_cll, hdr->max_fall, hdr->min_cll);
> +}
> +
> +static void intel_hdr_output_info(struct seq_file *m,
> +				  struct drm_connector *connector)
> +{
> +	const struct drm_connector_state *conn_state =3D connector->state;
> +	const struct intel_crtc_state *crtc_state;
> +	const struct hdmi_drm_infoframe *frame;
> +
> +	if (!conn_state || !conn_state->crtc)
> +		return;
> +
> +	crtc_state =3D to_intel_crtc_state(conn_state->crtc->state);
> +
> +	seq_printf(m, "\tHDR output metadata blob: %s\n",
> +		   str_yes_no(conn_state->hdr_output_metadata));
> +
> +	/* HDMI signals HDR via a DRM InfoFrame, DP via a gamut metadata SDP */
> +	if (!(crtc_state->infoframes.enable &
> +	      (intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM) |
> +	       intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA)))) {
> +		seq_puts(m, "\tHDR output: off\n");
> +		return;
> +	}
> +
> +	frame =3D &crtc_state->infoframes.drm.drm;
> +
> +	seq_printf(m, "\tHDR output: on, EOTF: %s, metadata type: %d\n",
> +		   intel_hdr_eotf_name(frame->eotf), frame->metadata_type);
> +	seq_printf(m, "\t\tprimaries: r(%u,%u) g(%u,%u) b(%u,%u) wp(%u,%u)\n",
> +		   frame->display_primaries[0].x, frame->display_primaries[0].y,
> +		   frame->display_primaries[1].x, frame->display_primaries[1].y,
> +		   frame->display_primaries[2].x, frame->display_primaries[2].y,
> +		   frame->white_point.x, frame->white_point.y);
> +	seq_printf(m, "\t\tmastering luminance: max %u, min %u\n",
> +		   frame->max_display_mastering_luminance,
> +		   frame->min_display_mastering_luminance);
> +	seq_printf(m, "\t\tmax_cll: %u, max_fall: %u\n",
> +		   frame->max_cll, frame->max_fall);
> +}
> +
>  static void intel_connector_info(struct seq_file *m,
>  				 struct drm_connector *connector)
>  {
> @@ -264,6 +344,7 @@ static void intel_connector_info(struct seq_file *m,
>  	seq_printf(m, "\tsubpixel order: %s\n",
>  		   drm_get_subpixel_order_name(connector->display_info.subpixel_order)=
);
>  	seq_printf(m, "\tCEA rev: %d\n", connector->display_info.cea_rev);
> +	intel_hdr_sink_info(m, connector);
>=20=20
>  	switch (connector->connector_type) {
>  	case DRM_MODE_CONNECTOR_DisplayPort:
> @@ -288,6 +369,7 @@ static void intel_connector_info(struct seq_file *m,
>  	intel_hdcp_info(m, intel_connector);
>=20=20
>  	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
> +	intel_hdr_output_info(m, connector);
>=20=20
>  	intel_panel_info(m, intel_connector);

--=20
Jani Nikula, Intel
