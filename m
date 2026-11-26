Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92051606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTj4igNP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335F410E979;
	Thu, 26 Nov 2026 10:26:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E60710E97F;
 Thu, 26 Nov 2026 10:26:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B50A62F17;
 Thu, 26 Nov 2026 10:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BA21F000C6;
 Thu, 26 Nov 2026 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795688802;
 bh=dQJEUahATom/lvp1s/Wg4i1fc0bTCzcX65MNdayudFI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=YTj4igNPhw1Ev+g73cQjDKjiJEWegoHZJCJ8PSVJlVBDRD9KdLLwMGsS0xDHDXDhF
 mEyeKtp1QJaXJtJDZ6nL4YErWtzerNeRkEPflonAnGWb+hrkb4z8BysTDQR/9MpzhS
 BfMAkBI3HR8yKTb98s5jtfQJXFofMBwAbqK4yA7LZeVEwxu08jHWokeyHGU4xVS+n/
 uCxETipw4yxWx88PpkmJeH52S0PRVAvH8NQzK4vqi3swlXZbAoS0jknMX3FSE/NF+t
 8GzcBcgBZgk5tiKph4pjY1Q9k5vLo5KimvoijRS2TZ3FLHf7d8Cch6Ahi81edM3OhI
 uxP33VWHTJ19g==
Message-ID: <sashiko-outbox-235287@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/13] drm/i915/ddi_mgr: Register encoders with dynamic
 DDI support
To: "Imre Deak" <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126100755.1252635-10-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-10-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:26:42 +0000
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
- [Medium] drm/i915/ddi_mgr: legacy VBT assigned to alt-mode DDI in
  intel_ddi_mgr_get_devdata_for_ddi()
--

commit fb0303db841fcc8f1c97a0608f7a2f40859c71f0
Author: Imre Deak <imre.deak@intel.com>

drm/i915/ddi_mgr: Register encoders with dynamic DDI support

This commit registers DP and HDMI connectors for encoders in the shared
dynamic DDI pool, selects VBT encoder data and lane reversal based on the
assigned legacy PHY route, and rejects modesets on connectors that do not
match the current DDI allocation.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/d=
rm/i915/display/intel_ddi_mgr.c
> index a4a4673dda585..58e48a61b8160 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
[ ... ]
> @@ -120,6 +125,72 @@ u8 intel_ddi_mgr_ddc_pin_for_ddi(struct intel_displa=
y *display, enum port ddi)
>  	return mgr->ddc_pin[route->phy];
>  }
> =20
[ ... ]
> +const struct intel_bios_encoder_data *
> +intel_ddi_mgr_get_devdata_for_ddi(struct intel_display *display, enum po=
rt ddi)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	enum port port =3D ddi;
> +
> +	if (intel_ddi_mgr_is_enabled(mgr) && intel_ddi_mgr_is_pool_ddi(display,=
 ddi)) {
> +		const struct intel_ddi_route *route =3D &mgr->route[ddi - PORT_TC1];
> +
> +		if (route->mode =3D=3D INTEL_DDI_ROUTE_LEGACY)
> +			port =3D tc_to_port(route->phy);
> +	}
> +
> +	return intel_bios_encoder_data_lookup(display, port);
> +}

[Severity: Medium]
Can intel_ddi_mgr_get_devdata_for_ddi() assign a legacy PHY's VBT entry to
an alt-mode encoder when route->mode is INTEL_DDI_ROUTE_ALT?

If ddi corresponds to a dynamic legacy PHY in VBT (for example an
HDMI-only legacy port where child.dp_max_lane_count is 0), falling back to
port =3D ddi when that DDI is allocated to a DP-alt or TBT-alt sink attaches
the legacy VBT entry to encoder->devdata.  intel_dp_max_source_lane_count()
-> intel_bios_dp_max_lane_count() then evaluates
devdata->child.dp_max_lane_count + 1 and clamps the alt-mode DP sink on
that DDI to 1 lane (and applies any legacy VBT link-rate cap in
vbt_max_link_rate()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126100755.1252=
635-1-imre.deak@intel.com?part=3D9
