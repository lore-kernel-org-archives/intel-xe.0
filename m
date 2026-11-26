Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C4606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXllt/Xs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF471122E2;
	Thu, 26 Nov 2026 10:41:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8971122FA;
 Thu, 26 Nov 2026 10:41:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DC9F61F53;
 Thu, 26 Nov 2026 10:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4821F000D0;
 Thu, 26 Nov 2026 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795689698;
 bh=RK45D7+e+iOcW3RnTCutIaBZLm4zHzJntoCpJ8jzTVk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FXllt/Xsoxah3s99erdKglb9rx96mehJXspfi4IsRHc0exsrEAvnyL4cGs+Fnjq/B
 zXmwHKGlsUm2pD/Psh4WIy3+viwxF3MSTniHS89ytZf9QBOnIBWK7wFrPz8LCutkDD
 /cBEYQr9yP1An0ddQBlRZcEB/C9bvMcwEfG8KnJDrHEpwDtzKx+au5OC1O7kHlE1cQ
 Kvo0zR7EIUry1UD3rUTbzmz34YKF9UBZsrDcMU8sFyOBvhMYBAQhR7mhqM/CGzjFyH
 oNhrHFHzrh1I+QACfyvYwmT7bFt8l3l0GC3DPZuFwEIGr5a1ETLEPNauOvKqBN65Ty
 A8ByIEAplJljA==
Message-ID: <sashiko-outbox-235307@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/13] drm/i915/ddi_mgr: Handle DDI pool system suspend
 and resume
To: "Imre Deak" <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126100755.1252635-13-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-13-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:41:38 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/i915/ddi_mgr: stale TC max_lane_count in
  resume_ddi_resource()
- [Medium] drm/i915/ddi_mgr: intel_ddi_mgr_suspend() disables DDC on
  shutdown
--

commit bca24baba50bb2986501c95a0a336e4e761dcc14
Author: Imre Deak <imre.deak@intel.com>

drm/i915/ddi_mgr: Handle DDI pool system suspend and resume

This commit adds system suspend and resume handling for the DDI pool
manager, disabling pool DDC adapters on suspend and rebuilding legacy DDI
routes, HPD mappings, Type-C port state, and DP source capabilities on
resume.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/d=
rm/i915/display/intel_ddi_mgr.c
> index 8f32e7c8dff27..a0157ff6afc04 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> @@ -840,6 +840,83 @@ static void update_hpd_sources(struct intel_display =
*display)
>  	}
>  }
> =20
> +void intel_ddi_mgr_suspend(struct intel_display *display)
> +{
> +	if (!intel_ddi_mgr_is_enabled(display->ddi_mgr))
> +		return;
> +
> +	intel_gmbus_ddi_pool_update(display, false);
> +}
> +
> +static void resume_ddi_resource(struct intel_display *display,
> +				struct intel_encoder *encoder,
> +				const struct intel_ddi_route *old_route)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	struct intel_digital_port *dig_port;
> +	const struct intel_ddi_route *route;
> +
> +	if (!encoder)
> +		return;
> +
> +	route =3D &mgr->route[encoder->port - PORT_TC1];
> +	dig_port =3D enc_to_dig_port(encoder);
> +	encoder->devdata =3D intel_ddi_mgr_get_devdata_for_ddi(display, encoder=
->port);
> +	intel_tc_port_set_legacy(dig_port, mgr->enabled &&
> +				route->mode =3D=3D INTEL_DDI_ROUTE_LEGACY);
> +	dig_port->lane_reversal =3D intel_ddi_mgr_encoder_has_lane_reversal(enc=
oder);
> +
> +	if (mgr->enabled && old_route->mode =3D=3D route->mode &&
> +	    old_route->phy =3D=3D route->phy)
> +		return;
> +
> +	intel_dp_update_source_caps(&dig_port->dp);
> +}

[Severity: Medium]
Does intel_dp_update_source_caps() rebuild dig_port->dp.link.caps using a
stale tc->max_lane_count here?

intel_ddi_mgr_resume() runs before drm_mode_config_reset() calls
intel_ddi_encoder_reset() -> intel_tc_port_init_mode(dig_port), and
intel_tc_port_set_legacy() only updates tc->legacy_port while tc->mode is
TC_PORT_DISCONNECTED.  When intel_dp_update_source_caps() calls
intel_dp_set_common_link_params() -> intel_dp_get_max_common_lane_count(),
intel_tc_port_max_lane_count(dig_port) still returns the pre-suspend
route's tc->max_lane_count.

If a pool encoder's route changes across suspend/resume between a 2-lane
DP-alt sink and a 4-lane legacy PHY (or vice versa), link.caps is clamped
to 2 lanes on a 4-lane route or retains 4-lane configurations on a 2-lane
route during the resume modeset restore.

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index b018608eae032..a9b03b4a1e76b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -780,6 +780,7 @@ static int __intel_display_driver_pm_suspend(struct i=
ntel_display *display, bool
>  	intel_display_driver_suspend_access(display);
> =20
>  	intel_encoder_suspend_all(display);
> +	intel_ddi_mgr_suspend(display);
> =20
>  	intel_dmc_suspend(display);
> =20

[Severity: Medium]
When shutdown is true, does calling intel_ddi_mgr_suspend() here disable
the pool DDC adapters before intel_display_driver_shutdown() runs
intel_encoder_shutdown_all()?

In __intel_display_driver_pm_suspend(display, true),
drm_atomic_helper_shutdown() disables active outputs and turns off Type 2
DP dual-mode adaptor TMDS buffers over DDC.  intel_ddi_mgr_suspend() then
marks the pool GMBUS adapters disabled, so the subsequent
intel_encoder_shutdown_all() -> intel_hdmi_encoder_shutdown() ->
intel_dp_dual_mode_set_tmds_output(intel_hdmi, true) call fails in
gmbus_xfer() with -ENXIO instead of re-enabling the TMDS output buffer for
reboot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126100755.1252=
635-1-imre.deak@intel.com?part=3D12
