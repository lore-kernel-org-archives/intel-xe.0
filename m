Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D15606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjMl9ONJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0871510E562;
	Tue, 17 Nov 2026 11:29:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C644E10E562;
 Tue, 17 Nov 2026 11:29:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3059943FDC;
 Tue, 17 Nov 2026 11:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57391F000C4;
 Tue, 17 Nov 2026 11:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794914953;
 bh=1eJAfsZkq5uKq46cATNY5pcmbsh8PHuUWrTYu1zMCyc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FjMl9ONJm8vRYDbIpuihL8q2ODVr+9MLTw4MyfFf73bvhDe3+uW06bywhJPTWGWJN
 4zW6ciKh3Zk9M6Y9FsIlboUOXKEhRuCJFUKe+9n9FnDSCmp78orVObPO8ntr0xBMCE
 FlQXo/UYVejlUOigFWr/SEBGjsD2k/U3fU80SuxE4EkHvy27IVS7TM1jB5YfAp4C3s
 ZFpFGEI6Vf9GIDwqYseU0FX+9a5SE7iLC1Le4XDupwHe7yMNJY6BdVkfSljxkC/KXv
 J29Ma8kfGXt0nYJ3Ez9b7A8gW2IBq56YH8uwZOiNVB8v3cw8VxcAc7bCJeUQ9vNIqy
 xrB+Yes5Uz2sQ==
Message-ID: <sashiko-outbox-218711@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: Extend HDR mode to HLG
To: "Vidya Srinivas" <vidya.srinivas@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261117104808.2023577-1-vidya.srinivas@intel.com>
References: <20261117104808.2023577-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:29:12 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/i915/dp: PQ/HLG fastset skips TCON update in
  intel_backlight_update()
- [Medium] drm/i915/dp: stale HDR TCON bits in
  intel_dp_aux_fill_hdr_tcon_params()
--

commit 12c8fa843bb08be12fb5ea03fd4f7818e8682022
Author: Vidya Srinivas <vidya.srinivas@intel.com>

drm/i915/dp: Extend HDR mode to HLG

This commit extends intel_dp_in_hdr_mode() to recognize BT.2100 HLG in
addition to SMPTE ST 2084 (PQ), while restricting
INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE to PQ outputs in the eDP AUX HDR
backlight path.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/driv=
ers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index dc2f0f3088a94..fa68cc6803a6a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -284,8 +284,16 @@ intel_dp_aux_fill_hdr_tcon_params(const struct drm_c=
onnector_state *conn_state,
>  	 * HDR mode.
>  	 */
>  	if (intel_dp_in_hdr_mode(conn_state)) {
> +		const struct hdr_output_metadata *hdr_metadata =3D
> +			conn_state->hdr_output_metadata->data;
> +
>  		*ctrl |=3D INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE;
> -		*ctrl |=3D INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
> +
> +		/* The TCON can only decode SMPTE ST 2084 (PQ), not HLG. */
> +		if (hdr_metadata->hdmi_metadata_type1.eotf =3D=3D HDMI_EOTF_SMPTE_ST20=
84)
> +			*ctrl |=3D INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
> +		else
> +			*ctrl &=3D ~INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE;
>  	}

[Severity: Medium]
Will switching hdr_output_metadata between SMPTE ST 2084 (PQ) and BT.2100
HLG on an active panel skip updating INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE?

Because intel_dp_in_hdr_mode() now returns true for both PQ and HLG, both
compute the same pipe_bpp and infoframes.enable mask, and
intel_pipe_config_compare() skips PIPE_CONF_CHECK_INFOFRAME(drm) when
checking for a fastset.  Switching between PQ and HLG therefore takes the
fastset path, where intel_ddi_update_pipe_dp() -> intel_backlight_update()
skips __intel_backlight_enable() -> intel_dp_aux_hdr_enable_backlight()
because panel->backlight.enabled is already true:

drivers/gpu/drm/i915/display/intel_backlight.c:intel_backlight_update() {
	...
	mutex_lock(&display->backlight.lock);
	if (!panel->backlight.enabled)
		__intel_backlight_enable(crtc_state, conn_state);

	mutex_unlock(&display->backlight.lock);
	...
}

As a result, INTEL_EDP_HDR_GETSET_CTRL_PARAMS is not updated in DPCD during
a PQ <-> HLG transition, leaving the panel TCON decoding HLG as PQ or
failing to decode PQ after HLG.

[Severity: Medium]
Does intel_dp_aux_fill_hdr_tcon_params() leave
INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE and
INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE set when
intel_dp_in_hdr_mode(conn_state) is false?

intel_dp_aux_hdr_enable_backlight() initializes ctrl from the current DPCD
INTEL_EDP_HDR_GETSET_CTRL_PARAMS value (old_ctrl) before calling
intel_dp_aux_fill_hdr_tcon_params().  When enabling the backlight in SDR
mode, the if (intel_dp_in_hdr_mode(conn_state)) block is not entered, so
neither bit is cleared if it was previously set in DPCD.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117104808.2023=
577-1-vidya.srinivas@intel.com?part=3D1
