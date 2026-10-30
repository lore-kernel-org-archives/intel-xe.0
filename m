Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A4606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YW9wHdkL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BBB10E8DB;
	Fri, 30 Oct 2026 20:58:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21AF10E3AA;
 Fri, 30 Oct 2026 20:58:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 89BE040ADF;
 Fri, 30 Oct 2026 20:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4675D1F0093A;
 Fri, 30 Oct 2026 20:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793393883;
 bh=wuZPVFF/QC5nZ2boFjig/sWqy5fqSWR/Uaas01NIiRE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=YW9wHdkLy/j9MxPwGGw0nqznhSxUIRkbPB6jU/IkMXOIQYAbZ1FsfbnjQdrLw7AUZ
 UAM9q172QymL4WxVwNB/y0Tk7mtpn9gSeLj351RpBIlkxLs1JWegIop6NYewQrmgho
 ILTYyCmWYhXCNltsibuRC+vqCK7WZFWkI/i69kxkYF75asx4NWXAmMLPLMp+Wrf2wt
 NFFVlGksftE/QbCdcMhfLB6iDYXsluhoFMQ0M7/zqUx1e+szGyuNrUPzxPbrnazqX/
 HStV6r2GX2O0cfjD0k7WyBR4Ri4Fe9etZMrMgTCMH4qc9LgCTfCMwSXGIREWrXXoZ2
 bDdmUmtNFP+LA==
Message-ID: <sashiko-outbox-191504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC v1 3/3] drm/i915/vrr: Allow VRR on HDMI 2.1 sinks
To: "Alan Stead" <alan.stead@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030203314.1085262-4-alan.stead@intel.com>
References: <20261030203314.1085262-1-alan.stead@intel.com>
 <20261030203314.1085262-4-alan.stead@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:58:02 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] drm/i915/dip: emp_as_sdp_tl not computed for HDMI VRR due to DP-on=
ly call
- [Medium] drm/i915/hdmi: stale vrr_capable property on disconnect in intel=
_hdmi_detect()
- [Medium] drm/i915/vrr: fallback to monitor_range.max_vfreq fails when vrr=
_max is 0
- [Medium] drm/i915/vrr: VRR enabled in DVI mode in intel_vrr_compute_confi=
g()
- [Low] drm/i915/dip: undeclared HDMI_EMP_DATA() macro in intel_dip_write_h=
dmi_vtem()
--

commit d2e831520b52e253f435c04bcef565c5c658d639
Author: Alan Stead <alan.stead@intel.com>

drm/i915/vrr: Allow VRR on HDMI 2.1 sinks

This commit enables VRR support on HDMI 2.1 sinks for display version 20+
by using the VRR range from the HDMI Forum VSDB in display_info.hdmi.vrr_cap
and attaching and updating the vrr_capable property on HDMI connectors.

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index b6fa1a1558b82..4854e86c1762a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2490,6 +2490,8 @@ intel_hdmi_unset_edid(struct drm_connector *_connec=
tor)
> =20
>  	drm_edid_free(connector->detect_edid);
>  	connector->detect_edid =3D NULL;
> +
> +	drm_connector_set_vrr_capable_property(&connector->base, false);
>  }

[Severity: Medium]
When an HDMI 2.1 VRR-capable sink is unplugged on display version 20+
platforms, will intel_hdmi_unset_edid() actually be reached to reset the
vrr_capable property to false?

In drivers/gpu/drm/i915/display/intel_hdmi.c, intel_hdmi_detect() checks if
the port is connected before calling intel_hdmi_unset_edid():

	if (DISPLAY_VER(display) >=3D 11 &&
	    !intel_digital_port_connected(encoder))
		goto out;

	intel_hdmi_unset_edid(&connector->base);

	if (intel_hdmi_set_edid(&connector->base))
		status =3D connector_status_connected;

out:
	intel_display_power_put(display, POWER_DOMAIN_GMBUS, wakeref);

	if (status !=3D connector_status_connected)
		cec_notifier_phys_addr_invalidate(intel_hdmi->cec_notifier);

Because DISPLAY_VER(display) >=3D 11 is true for all display version 20+
hardware, unplugging the sink causes intel_hdmi_detect() to jump directly to
out without calling intel_hdmi_unset_edid(), leaving the connector's
vrr_capable property stuck at true while disconnected.

> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 142ba2db52fda..c2774fd690473 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -39,11 +39,33 @@
>  #define DCB_CORRECTION_AGGRESSIVENESS	1000 /* ms =C3=97 100; 10 ms */
>  #define DCB_BLANK_TARGET		50
> =20
> +/*
> + * The refresh rate range the sink supports VRR in. HDMI 2.1 sinks adver=
tise
> + * it in the HDMI Forum VSDB, where VRRmax =3D 0 means "the refresh rate=
 of the
> + * video timing" (fall back to the EDID range descriptor for the maximum=
).
> + */
> +static void intel_vrr_sink_range(struct intel_connector *connector,
> +				 int *min_vfreq, int *max_vfreq)
> +{
> +	const struct drm_display_info *info =3D &connector->base.display_info;
> +	const struct drm_hdmi_vrr_cap *vrr_cap =3D &info->hdmi.vrr_cap;
> +
> +	*min_vfreq =3D info->monitor_range.min_vfreq;
> +	*max_vfreq =3D info->monitor_range.max_vfreq;
> +
> +	if (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA &&
> +	    vrr_cap->supported) {
> +		*min_vfreq =3D vrr_cap->vrr_min;
> +		if (vrr_cap->vrr_max)
> +			*max_vfreq =3D vrr_cap->vrr_max;
> +	}
> +}

[Severity: Medium]
Can falling back to info->monitor_range.max_vfreq when vrr_cap->vrr_max is 0
reject valid HDMI 2.1 VRR sinks?

Per the HDMI 2.1 specification and struct drm_hdmi_vrr_cap, vrr_max =3D=3D 0
indicates that the upper VRR bound is the refresh rate of the active video
timing (and vrr_max =3D=3D 0 is required for any sink whose maximum VRR rat=
e is
below 100 Hz, since HF-VSDB only encodes 0 or values >=3D 100).

However, drm_get_monitor_range() in drivers/gpu/drm/drm_edid.c only populat=
es
info->monitor_range.max_vfreq when the EDID revision is >=3D 4,
DRM_EDID_FEATURE_CONTINUOUS_FREQ is set, and a 0xfd Display Range Limits
descriptor with DRM_EDID_RANGE_LIMITS_ONLY_FLAG is present. On HDMI 2.1 sin=
ks
that advertise vrr_max =3D=3D 0 in the HF-VSDB without a DisplayPort-style
continuous-frequency Range Limits Only descriptor,
info->monitor_range.max_vfreq remains 0, causing intel_vrr_sink_range() to
set *max_vfreq =3D 0 and both intel_vrr_is_capable() and
intel_vrr_is_in_range() to return false.

[ ... ]

> @@ -78,24 +100,36 @@ bool intel_vrr_is_capable(struct intel_connector *co=
nnector)
>  			return false;
> =20
>  		break;
> +	case DRM_MODE_CONNECTOR_HDMIA:
> +		/*
> +		 * HDMI 2.1 VRR is signalled to the sink with the VTEM, which
> +		 * is sent using the EMP hardware of display version 20+.
> +		 */
> +		if (DISPLAY_VER(display) < 20 ||
> +		    !connector->base.display_info.hdmi.vrr_cap.supported)
> +			return false;
> +		break;

[Severity: High]
When VRR is enabled on an HDMI connector, does crtc_state->dip.emp_as_sdp_tl
ever get computed?

In drivers/gpu/drm/i915/display/intel_dip.c,
intel_dip_get_as_sdp_transmission_line() has an HDMI VRR branch:

	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
	    crtc_state->vrr.in_range) {
		const struct drm_display_mode *mode =3D &crtc_state->hw.adjusted_mode;
		int max_tl =3D crtc_state->set_context_latency +
			crtc_state->vrr.guardband - 1;
		int tl =3D mode->crtc_vtotal - mode->crtc_vdisplay - 1;

		if (max_tl > 0)
			tl =3D min(tl, max_tl);

		return tl;
	}

That helper is only called from intel_dip_sdp_tl_compute_config_late(), whi=
ch
in turn is only called via intel_ddi_compute_config_late() ->
intel_dp_compute_config_late() -> intel_dp_sdp_compute_config_late(). In
drivers/gpu/drm/i915/display/intel_ddi.c, intel_ddi_compute_config_late()
guards that call behind intel_crtc_has_dp_encoder():

	if (intel_crtc_has_dp_encoder(crtc_state))
		ret =3D intel_dp_compute_config_late(encoder, crtc_state, conn_state);

For INTEL_OUTPUT_HDMI, intel_dip_sdp_tl_compute_config_late() is never
called, so crtc_state->dip.emp_as_sdp_tl stays 0 and
intel_vrr_set_transcoder_timings() -> intel_dip_write_emp_as_sdp_tl()
programs EMP_AS_SDP_TL to 0 instead of the calculated transmission line.

[Severity: Low]
Also in the HDMI VTEM support enabled by this path, does
intel_dip_write_hdmi_vtem() in drivers/gpu/drm/i915/display/intel_dip.c bui=
ld
when CONFIG_DRM_I915 or CONFIG_DRM_XE is enabled?

intel_dip_write_hdmi_vtem() writes the packet body using HDMI_EMP_DATA():

	for (i =3D 0; i < ARRAY_SIZE(pb); i +=3D 4)
		intel_de_write(display, HDMI_EMP_DATA(display, cpu_transcoder),
			       pb[i] | pb[i + 1] << 8 | pb[i + 2] << 16 |
			       pb[i + 3] << 24);

However, drivers/gpu/drm/i915/display/intel_dip_regs.h only defines
HDMI_EMP_CTL and HDMI_EMP_HEADER:

/* HDMI 2.1 Extended Metadata Packet (EMP) control/header; payload is HDMI_=
EMP_DATA */
#define _HDMI_EMP_CTL_A				0x600d0
#define HDMI_EMP_CTL(display, trans)		_MMIO_TRANS2((display), (trans), _HDM=
I_EMP_CTL_A)
...
#define _HDMI_EMP_HEADER_A			0x600d4
#define HDMI_EMP_HEADER(display, trans)		_MMIO_TRANS2((display), (trans), _=
HDMI_EMP_HEADER_A)

HDMI_EMP_DATA is not defined in intel_dip_regs.h or anywhere else in the
tree, resulting in an implicit declaration build failure in
intel_dip_write_hdmi_vtem().

>  	default:
>  		return false;
>  	}
> =20
> -	if (!info->monitor_range.min_vfreq || !info->monitor_range.max_vfreq ||
> -	    info->monitor_range.min_vfreq > info->monitor_range.max_vfreq)
> +	intel_vrr_sink_range(connector, &min_vfreq, &max_vfreq);
> +
> +	if (!min_vfreq || !max_vfreq || min_vfreq > max_vfreq)
>  		return false;
> =20
> -	return info->monitor_range.max_vfreq - info->monitor_range.min_vfreq > =
10;
> +	return max_vfreq - min_vfreq > 10;
>  }
> =20
>  bool intel_vrr_is_in_range(struct intel_connector *connector, int vrefre=
sh)
>  {
> -	const struct drm_display_info *info =3D &connector->base.display_info;
> +	int min_vfreq, max_vfreq;
> +
> +	intel_vrr_sink_range(connector, &min_vfreq, &max_vfreq);
> =20
>  	return intel_vrr_is_capable(connector) &&
> -		vrefresh >=3D info->monitor_range.min_vfreq &&
> -		vrefresh <=3D info->monitor_range.max_vfreq;
> +		vrefresh >=3D min_vfreq &&
> +		vrefresh <=3D max_vfreq;
>  }

[Severity: Medium]
Should intel_vrr_compute_config() also verify that crtc_state->has_hdmi_sink
(or crtc_state->has_infoframe) is true before enabling VRR on an HDMI
connector?

If userspace forces DVI mode via the connector audio property (setting
force_audio to HDMI_AUDIO_OFF_DVI) while an HDMI 2.1 VRR sink is connected,
intel_hdmi_compute_config() leaves pipe_config->has_hdmi_sink and
pipe_config->has_infoframe as false, and intel_ddi_enable_transcoder_func()
programs TRANS_DDI_MODE_SELECT_DVI:

	if (crtc_state->has_hdmi_sink)
		temp |=3D TRANS_DDI_MODE_SELECT_HDMI;
	else
		temp |=3D TRANS_DDI_MODE_SELECT_DVI;

Because intel_vrr_compute_config() only checks intel_vrr_is_in_range()
against connector->base.display_info, it still sets crtc_state->vrr.in_range
and crtc_state->vrr.enable to true in DVI mode, even though the AVI InfoFra=
me
is not computed and the transcoder cannot transmit HDMI data island packets
such as the VTEM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030203314.1085=
262-1-alan.stead@intel.com?part=3D3
