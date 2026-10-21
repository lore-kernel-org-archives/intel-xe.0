Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028A4606A329
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHo1wJH3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAB010FBD9;
	Wed, 21 Oct 2026 07:33:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0D10FC5A;
 Wed, 21 Oct 2026 07:33:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 891CA601F1;
 Wed, 21 Oct 2026 07:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C151F000C9;
 Wed, 21 Oct 2026 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792567998;
 bh=A7Xm4WkDLjxWRfQsU8A6g3x/biwAfzz5Cnvi2hS5Whc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XHo1wJH3+lME10nu38ygysUsYqaJC2GwK6bA5Q1bF1eQrQFQZg3sw2LZwEmUiEXe2
 eXcMXBhSSfA+ZjPGzQ3q3AQs67O0/3wJceQhO+dfztsVG8iJ9aBjnUy+rM/tC7yQJo
 P5ScMaFhYZllhdojR8mKMxhw/y2RuuPBeuxVChEsxRbHnATCDt9Gn5VfcjRPK/FrLS
 hCABVDIHC2IFpxn53X14xP82idonJzy1anWVlpQqlNE++5ThfCOHBup69moa2vpW2I
 YY2hocZ3ZwcQ4pPkb1CAWct4sigU9Pfu4/BgpJPa2eHcfU2gDkfqLHJ5LXOwJjNIRz
 j8U8PwUphKpfw==
Message-ID: <sashiko-outbox-179915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/11] drm/i915/dp_mst: Limit M/N ratio for MST
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021071401.1161586-5-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-5-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 07:33:17 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/dp_mst: M/N mode_valid and compute_config_limits filter=
 mismatch
--

commit 5b89059b3b94b9fbcca8f03ce951374211a9cdbc
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp_mst: Limit M/N ratio for MST

This commit adds a Link M/N ratio check to mst_connector_mode_valid_ctx()
using intel_dp_mode_valid_m_n() to prune modes whose pixel clock exceeds
the hardware Link M/N ratio limit across all link configurations.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 7023619aaaba9..f00edfb66a10a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct drm_connector =
*_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
> =20
> +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +
>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode

[Severity: Medium]
Could there be a mismatch here between how mst_connector_mode_valid_ctx()
validates the M/N ratio and how intel_dp_compute_config_limits() filters
link configurations for MST?

In drivers/gpu/drm/i915/display/intel_dp_mst.c,
mst_connector_mode_valid_ctx() checks link bandwidth solely against
max_bw_config, whereas intel_dp_mode_valid_m_n() iterates over all link
configurations in INTEL_DP_LINK_CAPS_FILTER_ALL:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_mode_valid_m_n() {
	...
	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
				      INTEL_DP_LINK_CAPS_FILTER_ALL);
	for_each_dp_link_config(&iter, &link_config) {
		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
					     link_config.rate)) {
			found =3D true;

			break;
		}
	}
	...
}

However, during modeset via mst_stream_compute_config() ->
mst_stream_compute_link_for_joined_pipes() ->
mst_stream_compute_config_limits() -> intel_dp_compute_config_limits() in
drivers/gpu/drm/i915/display/intel_dp.c, the MST path narrows
limits->link_config_filter to the single unfiltered max_config before
calling intel_dp_compute_m_n_ratio_limits():

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_compute_config_limits() {
	...
	if (is_mst || intel_dp->use_max_params) {
		struct intel_dp_link_caps_filter new_filter =3D INTEL_DP_LINK_CAPS_FILTER=
_NONE;
		struct intel_dp_link_config max_config;
		...
		if (!intel_dp_get_connector_max_link_config(connector, limits, &max_confi=
g))
			return false;

		if (!intel_dp_link_caps_filter_add(link_caps, &new_filter, &max_config))
			return false;

		limits->link_config_filter =3D new_filter;
	}

	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state, l=
imits))
		return false;
	...
}

On a DP 2.x MST topology supporting both 128b/132b UHBR rates (where symbol
clock is rate * 10 / 32, e.g. 312.5 MHz for UHBR10 or 421.875 MHz for
UHBR13.5) and 8b/10b rates (where symbol clock is rate / 10, e.g. 810 MHz
for HBR3), a high-pixel-clock mode can exceed the M/N ratio limit at
max_bw_config (such as 4xUHBR10) while still passing
intel_dp_can_support_m_n() at HBR3.

Wouldn't that allow mst_connector_mode_valid_ctx() to return MODE_OK for a
mode that then fails atomic check in intel_dp_compute_config_limits() with
-EINVAL because only max_config was retained in limits->link_config_filter?
Should mst_connector_mode_valid_ctx() either check
intel_dp_can_support_m_n() against max_link_clock, or should
intel_dp_compute_m_n_ratio_limits() run before selecting max_config in
intel_dp_compute_config_limits()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021071401.1161=
586-1-suraj.kandpal@intel.com?part=3D4
