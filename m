Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670B0606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKTZqGkw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFA910FC8C;
	Wed, 21 Oct 2026 07:40:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557A10FC74;
 Wed, 21 Oct 2026 07:40:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 40CDC60A5E;
 Wed, 21 Oct 2026 07:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD001F000C9;
 Wed, 21 Oct 2026 07:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792568444;
 bh=TZuv9+GIMOibhxoIu1W1YEs0tTiAuyBnweL+5pj7v5M=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=TKTZqGkwwIkYWzVS6buuPGlbIKfrwkM430xmLAgpZPqkvKFCjFeDGzkbYMonZIoyP
 dXbfKyzZatSVQTdXOJNaeHlry9uEWB+AX9kRxkPCyQeYB1oZobs7WSE/OGJMANGgbC
 XLWmeDyaPHwz4tzjjLRX9MQ9y0Bp4Co8Nw2URnYiG5Uhyzyhz7Iaae+eKGE94T/k33
 Jk0IdGP5z7Fj30si+A6ko0vUeTyKSr4So3Mp4OLh4pocFYrPUPxr8/cprMF02fFX6L
 Y8o2G0GxaeSNqx5J4erZEBRo1jW+9fKB+7SQ0v4mV9PvdYYNdwFXykkYyj/vCLWPq0
 PKBxkYwWEENHw==
Message-ID: <sashiko-outbox-179922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/11] drm/i915/dp: Limit M/N ratio for DP
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021072438.1164249-3-suraj.kandpal@intel.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
 <20261021072438.1164249-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 07:40:43 +0000
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
- [Medium] drm/i915/dp: misordered M/N ratio filter in intel_dp_compute_con=
fig_limits()
--

commit 46d07c1bdb22b62954414e63e1d33e15eab315fb
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/dp: Limit M/N ratio for DP

This commit restricts DisplayPort link configurations to those whose ceiling
Link M/Link N ratio fits within the transcoder timing generator limit during
link config limit computation, and prunes modes in mode_valid when no link
configuration can satisfy the ratio.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index d8c0d9381471d..7ceb7c02b597b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -2656,6 +2725,48 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct intel_=
connector *connector,
>  	return true;
>  }
> =20
> +static bool
> +intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
> +				  struct drm_connector_state *conn_state,
> +				  const struct intel_crtc_state *crtc_state,
> +				  struct link_config_limits *limits)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D to_intel_connector(conn_state->co=
nnector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_caps_order order =3D
> +		intel_dp_link_caps_connector_compute_order(connector);
> +	struct intel_dp_link_caps_filter new_filter =3D INTEL_DP_LINK_CAPS_FILT=
ER_NONE;
> +	int pixel_clock =3D intel_dp_mso_pixel_clock(intel_dp,
> +						  intel_dp_mode_clock(crtc_state, conn_state));
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	bool found =3D false;
> +
> +	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_con=
fig_filter);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (!intel_dp_can_support_m_n(display, pixel_clock, link_config.rate))
> +			continue;
> +
> +		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
> +		found =3D true;
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	if (!found) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] No link config with a Link M/N ratio <=3D %d\n=
",
> +			    connector->base.base.id, connector->base.name,
> +			    intel_dp_get_max_m_n_ratio(display));
> +
> +		return false;
> +	}
> +
> +	limits->link_config_filter =3D new_filter;
> +
> +	return true;
> +}
> +
>  bool
>  intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>  			       struct drm_connector_state *conn_state,
> @@ -2772,6 +2883,9 @@ intel_dp_compute_config_limits(struct intel_dp *int=
el_dp,
>  		limits->link_config_filter =3D new_filter;
>  	}
> =20
> +	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state=
, limits))
> +		return false;
> +
>  	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
>  		return false;
> =20

[Severity: Medium]
Should intel_dp_compute_m_n_ratio_limits() be called earlier in
intel_dp_compute_config_limits() in drivers/gpu/drm/i915/display/intel_dp.c,
and should intel_dp_test_compute_config() also run before or intersect with
that filter?

Right before the new intel_dp_compute_m_n_ratio_limits() call,
intel_dp_compute_config_limits() narrows limits->link_config_filter to a
single max_config when is_mst or intel_dp->use_max_params is set:

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

	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
		return false;
	...
}

Because the link symbol clock is not monotonic with link rate or bandwidth
(e.g., 128b/132b rates divide by 32 while 8b/10b rates divide by 10),
intel_dp_get_connector_max_link_config() can pick a high-rate configuration
with a lower symbol clock that violates intel_dp_can_support_m_n(), even
when a lower link rate in link_caps has a higher symbol clock that satisfies
the ratio.

Since limits->link_config_filter has already been restricted to that single
max_config before intel_dp_compute_m_n_ratio_limits() runs, won't
intel_dp_compute_m_n_ratio_limits() fail the modeset instead of allowing
intel_dp_get_connector_max_link_config() to select the highest configuration
among those that satisfy the ratio?

Conversely, intel_dp_test_compute_config() runs immediately after
intel_dp_compute_m_n_ratio_limits(). When a compliance link training request
is active, intel_dp_test_compute_config() -> set_filter_for_link_params() ->
set_filter_for_link_config() in drivers/gpu/drm/i915/display/intel_dp_test.c
replaces limits->link_config_filter with a fresh filter built from link_cap=
s:

drivers/gpu/drm/i915/display/intel_dp_test.c:set_filter_for_link_config() {
	struct intel_dp_link_caps_filter new_filter =3D INTEL_DP_LINK_CAPS_FILTER_=
NONE;

	if (!intel_dp_link_caps_filter_add(link_caps, &new_filter, link_params))
		return false;

	limits->link_config_filter =3D new_filter;

	return true;
}

Won't that overwrite and discard the filter computed by
intel_dp_compute_m_n_ratio_limits()?

[ ... ]

>
>
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021072438.1164=
249-1-suraj.kandpal@intel.com?part=3D2
