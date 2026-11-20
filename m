Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A86606A331
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DFrmKOvr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62C710E132;
	Fri, 20 Nov 2026 14:38:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1F410E90F;
 Fri, 20 Nov 2026 14:38:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C4E8E40276;
 Fri, 20 Nov 2026 14:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B21F1F000C6;
 Fri, 20 Nov 2026 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185494;
 bh=n0wp+Mk73OwfCT4Ha8gekjAJ40jbifBXN4nDyowCZgk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DFrmKOvrNXdUTrm0sPEnh1qNPgnBud22LqRyvAASjcbDD4t4fDLp1xsXMO5fB987I
 VD5016w/064bu13epevqNyBn2bNvPwE+56Y57qM7wRl+e1QKUdRYIrHX+MGrQlIH0i
 IkGuUnC4xa8mmw9hp6m2VTkspkEB3qVn38sU8dUrDY8vHj11hwEt85DzhYAizOEwkv
 jnO6RL2cAhmTTXiUydvf9s7Y3NmrqTitFAadrhMDQPDIsf4CmwCZ76o5xU2Yuby4cl
 gEhH5MArvmsGrQ/bscrgg33/L7nagDh1GyGJQBFdTToAK4znWsSMzcNaFSxjn103lr
 X0bC8Gm4tshlQ==
Message-ID: <sashiko-outbox-225396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/29] drm/i915/dp: Enable DSC pass-through in the PCON
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-23-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-23-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:38:13 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/dp: stale DP_DSC_ENABLE bits in
  intel_dp_sink_disable_decompression()
--

commit 2433da6ae530a721973aa8e15cc125c351ed4832
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Enable DSC pass-through in the PCON

This commit adds helpers to enable and disable DSC pass-through in a PCON
instead of enabling sink decompression when pcon_config.dsc_op is set to
INTEL_PCON_DSC_PASSTHROUGH.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 7b66cd82b065e..5bfbcf91d7add 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3998,6 +3998,18 @@ intel_dp_sink_set_dsc_passthrough(const struct int=
el_connector *connector,
>  			    str_enable_disable(enable));
>  }
> =20
> +static void
> +intel_dp_pcon_set_dsc_passthrough(struct intel_connector *connector, boo=
l enable)
> +{
> +	struct intel_display *display =3D to_intel_display(connector);
> +
> +	if (write_dsc_decompression_flag(connector->dp.dsc_decompression_aux,
> +					 DP_DSC_PASSTHROUGH_EN, enable) < 0)
> +		drm_dbg_kms(display->drm,
> +			    "Failed to %s PCON DSC pass-through\n",
> +			    str_enable_disable(enable));
> +}
> +
>  static int intel_dp_dsc_aux_ref_count(struct intel_atomic_state *state,
>  				      const struct intel_connector *connector,
>  				      bool for_get_ref)
> @@ -4068,7 +4080,8 @@ static bool intel_dp_dsc_aux_put_ref(struct intel_a=
tomic_state *state,
>   * sink device, whereas on MST based on each device's DSC capabilities i=
t's
>   * either the last branch device (enabling decompression in it) or both =
the
>   * last branch device (enabling passthrough in it) and the sink device
> - * (enabling decompression in it).
> + * (enabling decompression in it). A PCON passing a DSC stream through to
> + * the HDMI sink gets passthrough enabled instead of decompression.
>   */
>  void intel_dp_sink_enable_decompression(struct intel_atomic_state *state,
>  					struct intel_connector *connector,
> @@ -4087,6 +4100,12 @@ void intel_dp_sink_enable_decompression(struct int=
el_atomic_state *state,
>  	if (!intel_dp_dsc_aux_get_ref(state, connector))
>  		return;
> =20
> +	/* A PCON passing the DSC stream through to the HDMI sink doesn't decod=
e it */
> +	if (new_crtc_state->pcon_config.dsc_op =3D=3D INTEL_PCON_DSC_PASSTHROUG=
H) {
> +		intel_dp_pcon_set_dsc_passthrough(connector, true);
> +		return;
> +	}
> +
>  	intel_dp_sink_set_dsc_passthrough(connector, true);
>  	intel_dp_sink_set_dsc_decompression(connector, true);
>  }
> @@ -4118,6 +4137,11 @@ void intel_dp_sink_disable_decompression(struct in=
tel_atomic_state *state,
>  	if (!intel_dp_dsc_aux_put_ref(state, connector))
>  		return;
> =20
> +	if (old_crtc_state->pcon_config.dsc_op =3D=3D INTEL_PCON_DSC_PASSTHROUG=
H) {
> +		intel_dp_pcon_set_dsc_passthrough(connector, false);
> +		return;
> +	}

[Severity: Medium]
Can this leave DP_DSC_PASSTHROUGH_EN and DP_DECOMPRESSION_EN stale or both
set in the PCON's DP_DSC_ENABLE register?

pcon_config.dsc_op is not read out from the hardware during initial probe
or resume:

drivers/gpu/drm/i915/display/intel_display_types.h:intel_crtc_state {
    ...
	/*
	 * Configuration of a DP->HDMI PCON. Only used for state computation,
	 * not read out from the HW.
	 */
	struct {
		enum intel_pcon_dsc_op dsc_op;
    ...
}

When taking over a DSC mode where the PCON had DP_DSC_PASSTHROUGH_EN set,
old_crtc_state->pcon_config.dsc_op is INTEL_PCON_NO_DSC during the disable
phase of the initial modeset.  intel_dp_sink_disable_decompression() then
calls intel_dp_sink_set_dsc_decompression(connector, false), which only
clears DP_DECOMPRESSION_EN via write_dsc_decompression_flag(), while
intel_dp_sink_set_dsc_passthrough(connector, false) is a no-op on SST
because connector->mst.port is NULL.

As a result, DP_DSC_PASSTHROUGH_EN stays set in the PCON for a following
uncompressed mode, or gets combined with DP_DECOMPRESSION_EN (0x03) if the
next mode enables PCON DSC decoding.  Likewise, because
intel_dp_pcon_set_dsc_passthrough(connector, true) only sets
DP_DSC_PASSTHROUGH_EN via write_dsc_decompression_flag(), any pre-existing
DP_DECOMPRESSION_EN bit in DP_DSC_ENABLE is not cleared when enabling
pass-through.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D22
