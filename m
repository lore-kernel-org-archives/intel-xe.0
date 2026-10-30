Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286A606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPAdaoJP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7131129DA;
	Fri, 30 Oct 2026 20:59:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB171129DA;
 Fri, 30 Oct 2026 20:59:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4DFB942B7C;
 Fri, 30 Oct 2026 20:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4951F00A16;
 Fri, 30 Oct 2026 20:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793393964;
 bh=Ivtf0+yMWM32gSqHPNh9ItSA4xmhuy8NLqJOU9IIZZQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=oPAdaoJPTZp11x202cLQB0+9pz6/JM4UmNVpYnQNfrt+yP5FY7vsCb9ZEkBjYzJjb
 Qv0gngBcH4gTzekkv+7TWzLJrkDba956X6lNipe9LgJ/ncnG8AOERDVRZH+r4OP/61
 BGouWB+STRsFa9g1PDGPutsG5Fzi/oKIIzg1OrDdQe12vKiM8FTDEySOF49gU6bX13
 llRYpxhVQwGW1mtTm1N4+F39bqZLr2/D9YLgpEo/x64plRj1b/aJNTfEyj2DmQIqhK
 6jo4pe378GA1cP21qFh9PWrZYB0HCwPexrSwZxTCoEPa1c1z6wQEtAjP9uL3YAd0N5
 olv6E6cd3RDpQ==
Message-ID: <sashiko-outbox-191505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC v1 2/3] drm/i915/dip: Send the HDMI 2.1 VTEM when VRR is
 enabled
To: "Alan Stead" <alan.stead@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030203314.1085262-3-alan.stead@intel.com>
References: <20261030203314.1085262-1-alan.stead@intel.com>
 <20261030203314.1085262-3-alan.stead@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:59:23 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/i915/dip: undeclared HDMI_EMP_DATA in intel_dip_write_hdmi_vte=
m()
- [Medium] drm/i915/dip: misordered and unsent VRR disable VTEM in intel_vr=
r_disable()
- [Medium] drm/i915/dip: unpopulated vrr.in_range check in intel_dip_write_=
hdmi_vtem()
--

commit a0eb4dbdb4fb231ddf6c7b2a3526d3d1a7f9707a
Author: Alan Stead <alan.stead@intel.com>

drm/i915/dip: Send the HDMI 2.1 VTEM when VRR is enabled

This commit adds intel_dip_write_hdmi_vtem() to program an HDMI 2.1 Video
Timing Extended Metadata (VTEM) packet when enabling or disabling VRR on
an HDMI transcoder via intel_vrr_enable() and intel_vrr_disable().

> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i=
915/display/intel_dip.c
> index 831881e6c15ec..4748f6012337b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
[ ... ]
> @@ -74,6 +77,78 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_=
crtc_state *crtc_state)
>  		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
>  }
> =20
> +/* VTEM: 7 byte EM Data Set header (PB0-PB6) + 4 byte data set (MD0-MD3)=
 */
> +#define VTEM_DATA_SET_LENGTH	4
> +#define VTEM_EMP_SIZE		(7 + VTEM_DATA_SET_LENGTH)
> +/* Payload bytes carried by one EMP data island packet */
> +#define HDMI_EMP_PACKET_BODY	28
> +
> +/*
> + * Tell an HDMI 2.1 sink whether VRR is active with a Class 0 (Gaming-VR=
R)
> + * Video Timing Extended Metadata (VTEM) packet. It is a periodic
> + * pseudo-static EM Data Set: the hardware sends it every frame until it=
 is
> + * reprogrammed. On disable, a last VTEM with VRR_EN=3D0 and END set is =
sent,
> + * after which the hardware stops sending it.
> + */
> +void intel_dip_write_hdmi_vtem(const struct intel_crtc_state *crtc_state,
> +			       bool enable)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> +	const struct drm_display_mode *mode =3D &crtc_state->hw.adjusted_mode;
> +	u8 vic =3D crtc_state->infoframes.avi.avi.video_code;
> +	int base_rr =3D drm_mode_vrefresh(mode);
> +	u8 pb[HDMI_EMP_PACKET_BODY] =3D {};
> +	int i;
> +
> +	if (DISPLAY_VER(display) < 20 ||
> +	    !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) ||
> +	    !crtc_state->vrr.in_range)
> +		return;

[Severity: Medium]
When intel_vrr_disable() calls intel_dip_write_hdmi_vtem(old_crtc_state,
false) to disable VRR from an inherited hardware state read out at driver
load, will this !crtc_state->vrr.in_range check cause an early return and
skip sending the terminating VTEM packet (VRR_EN=3D0 and END=3D1)?

During hardware state readout in intel_modeset_readout_hw_state() ->
intel_vrr_get_config(), old_crtc_state->vrr.enable is populated from
TRANS_VRR_CTL, but old_crtc_state->vrr.in_range is never set:

drivers/gpu/drm/i915/display/intel_vrr.c:intel_vrr_get_config() {
	...
	if (intel_vrr_always_use_vrr_tg(display))
		crtc_state->vrr.enable =3D vrr_enable && !intel_vrr_is_fixed_rr(crtc_stat=
e);
	else
		crtc_state->vrr.enable =3D vrr_enable;
	...
}

Since both callers of intel_dip_write_hdmi_vtem() =E2=80=94 intel_vrr_enabl=
e() and
intel_vrr_disable() =E2=80=94 already guard on crtc_state->vrr.enable (and
intel_vrr_compute_config() only sets vrr.enable when vrr.in_range is true),
is the !crtc_state->vrr.in_range check in intel_dip_write_hdmi_vtem()
needed?

> +
> +	/* PB0-PB6: EM Data Set header (Sync =3D 0, DS_Type =3D pseudo-static) =
*/
> +	pb[0] =3D BIT(7) |			/* NEW */
> +		BIT(2) |			/* VFR */
> +		(enable ? 0 : BIT(6));		/* END */
> +	pb[2] =3D 1;				/* Organization_ID: HDMI */
> +	pb[4] =3D 1;				/* Data_Set_Tag: VTEM */
> +	pb[6] =3D VTEM_DATA_SET_LENGTH;		/* Data_Set_Length */
> +
> +	/* PB7-PB10: MD0-MD3 (M_CONST =3D 0, FVA_Factor_M1 =3D 0, MD2 bit 2 res=
erved) */
> +	if (enable) {
> +		pb[7] =3D BIT(0);			/* VRR_EN */
> +		/* Base_Vfront and Base_Refresh_Rate are only sent without a VIC */
> +		if (!vic) {
> +			pb[8] =3D min(mode->crtc_vsync_start - mode->crtc_vdisplay, 255);
> +			pb[9] =3D (base_rr >> 8) & 0x3;
> +			pb[10] =3D base_rr & 0xff;
> +		}
> +	}
> +
> +	drm_dbg_kms(display->drm,
> +		    "[TRANSCODER %s] VTEM: VRR_EN=3D%d VIC=3D%u Base_Vfront=3D%u Base_=
RR=3D%u\n",
> +		    transcoder_name(cpu_transcoder), enable, vic, pb[8],
> +		    pb[9] << 8 | pb[10]);
> +
> +	/*
> +	 * HDMI_EMP_CTL first, then the payload dwords (PB0 in bits 7:0), then
> +	 * the header, whose write clock crosses the whole packet. HB0 must be
> +	 * set to the EMP packet type, the hardware doesn't fill it in.
> +	 */
> +	intel_de_write(display, HDMI_EMP_CTL(display, cpu_transcoder),
> +		       HDMI_EMP_CTL_TYPE_VTEM);
> +	for (i =3D 0; i < ARRAY_SIZE(pb); i +=3D 4)
> +		intel_de_write(display, HDMI_EMP_DATA(display, cpu_transcoder),
> +			       pb[i] | pb[i + 1] << 8 | pb[i + 2] << 16 |
> +			       pb[i + 3] << 24);

[Severity: High]
Does drivers/gpu/drm/i915/display/intel_dip.c fail to compile here because
HDMI_EMP_DATA is not defined?

In drivers/gpu/drm/i915/display/intel_dip_regs.h, the patch defines
HDMI_EMP_CTL and HDMI_EMP_HEADER with a comment noting that the payload is
HDMI_EMP_DATA, but neither intel_dip_regs.h nor intel_display_regs.h (nor
follow-up commit d2e831520b52) defines HDMI_EMP_DATA or _HDMI_EMP_DATA_A,
causing an implicit declaration build failure when CONFIG_DRM_I915 or
CONFIG_DRM_XE_DISPLAY is enabled.

In addition, the loop writes all 7 payload dwords to HDMI_EMP_DATA(display,
cpu_transcoder) without a dword index, whereas the transcoder Video DIP
Adaptive Sync / EMP packet buffer uses indexed data registers
ADL_TVIDEO_DIP_AS_SDP_DATA(display, trans, i) (0x60484 + i * 4) controlled
via VIDEO_DIP_ENABLE_AS_ADL in HSW_TVIDEO_DIP_CTL (0x60200). Should this
be programming the indexed Video DIP AS SDP / EMP buffer instead of
HDMI_EMP_CTL, HDMI_EMP_DATA, and HDMI_EMP_HEADER?

[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index d43a06907d18a..142ba2db52fda 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1010,6 +1010,8 @@ void intel_vrr_enable(const struct intel_crtc_state=
 *crtc_state)
> =20
>  	if (!intel_vrr_always_use_vrr_tg(display))
>  		intel_vrr_tg_enable(crtc_state);
> +
> +	intel_dip_write_hdmi_vtem(crtc_state, true);
>  }
> =20
>  void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
> @@ -1024,6 +1026,8 @@ void intel_vrr_disable(const struct intel_crtc_stat=
e *old_crtc_state)
> =20
>  	intel_vrr_disable_dc_balancing(old_crtc_state);
>  	intel_vrr_set_fixed_rr_timings(old_crtc_state, old_crtc_state->cpu_tran=
scoder);
> +
> +	intel_dip_write_hdmi_vtem(old_crtc_state, false);
>  }

[Severity: Medium]
Is placing intel_dip_write_hdmi_vtem(old_crtc_state, false) at the end of
intel_vrr_disable() ordered and guarded as intended across the disable and
fastset paths?

1. On platforms where !intel_vrr_always_use_vrr_tg(display) (such as
display version 20), intel_vrr_tg_disable() clears VRR_CTL_VRR_ENABLE in
TRANS_VRR_CTL and waits for VRR_STATUS_VRR_EN_LIVE to clear at the next
vblank before intel_dip_write_hdmi_vtem(old_crtc_state, false) is called:

drivers/gpu/drm/i915/display/intel_vrr.c:intel_vrr_tg_disable() {
	...
	if (intel_de_wait_for_clear_ms(display,
				       TRANS_VRR_STATUS(display, cpu_transcoder),
				       VRR_STATUS_VRR_EN_LIVE, 1000))
		drm_err(display->drm, "Timed out waiting for VRR live status to clear\n");
	...
}

Because the VRR_EN=3D0, END=3D1 VTEM is only written after that vblank wait
completes, the vblank in which the VRR timing generator turns off will
still transmit the old VTEM with VRR_EN=3D1 and END=3D0.

2. On a full modeset in intel_commit_modeset_disables(),
intel_pre_plane_update() calls intel_vrr_disable(old_crtc_state) and then
intel_old_crtc_state_disables() -> hsw_crtc_disable() ->
intel_ddi_post_disable_hdmi_or_sst() -> intel_disable_transcoder() clears
TRANSCONF_ENABLE without waiting for another vblank after
intel_dip_write_hdmi_vtem(old_crtc_state, false), so the final VTEM with
VRR_EN=3D0 and END=3D1 is never transmitted before the transcoder stops.

3. In drivers/gpu/drm/i915/display/intel_display.c,
intel_crtc_vrr_disabling() also returns true during seamless fastsets where
VRR stays enabled (old_crtc_state->vrr.enable && new_crtc_state->vrr.enable)
if update_m_n, update_lrr, or vrr_params_changed() is set:

drivers/gpu/drm/i915/display/intel_display.c:intel_crtc_vrr_disabling() {
	return is_disabling(vrr.enable, old_crtc_state, new_crtc_state) ||
		(old_crtc_state->vrr.enable &&
		 (new_crtc_state->update_m_n || new_crtc_state->update_lrr ||
		  vrr_params_changed(old_crtc_state, new_crtc_state)));
}

In that case, intel_pre_update_crtc() -> intel_pre_plane_update() ->
intel_vrr_disable() programs a VTEM with VRR_EN=3D0 and END=3D1 before vbla=
nk
evasion even though VRR remains enabled in new_crtc_state. Should
intel_dip_write_hdmi_vtem(old_crtc_state, false) be programmed before the
vblank wait and avoided when VRR is only being reconfigured across a
fastset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030203314.1085=
262-1-alan.stead@intel.com?part=3D2
