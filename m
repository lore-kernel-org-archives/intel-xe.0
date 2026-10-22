Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1D3606A31B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7/DYCnt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEBB10E3A2;
	Thu, 22 Oct 2026 03:35:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9810E3A2;
 Thu, 22 Oct 2026 03:34:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 58D9D40B3B;
 Thu, 22 Oct 2026 03:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163F11F000C1;
 Thu, 22 Oct 2026 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792640094;
 bh=ZLjSYyaSb8u9vJmd0cy+6KHSGzuTQToS8FAORWzhGdg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=M7/DYCnt7ovRJugjj/lTt3Jiak2fxYFzpBFAoYY6hdUSYfchd1nPhMUyEeDn4VqjZ
 T1rZVX6j4HlAGTcZmT4fOsgRYLM6u4FvhdmOlVs7CiNJwAuagrvJ4F6pblykKm17ou
 8dzyqFb3mg3Av5q8/lVbDduTvEec0Iy5zX+7qQZ7QUYs+IZ5WnVBsWktEzPudbpiET
 0IJ720Hr7+pJ+ISTL3I2USso1PFph8adCKf+alGXq6cMETEwDbRk3U3z2FqyaIhdFa
 LFwuNokn/ZIotgJdgctvyKxfv0rrEhhJW+Ty7GmJOieHd/bbvh16MKzkmGJvqNHjuN
 bMJ4vJea+1s4A==
Message-ID: <sashiko-outbox-180971@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/13] drm/i915/dp: Limit M/N ratio for DP
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261022032247.1378809-3-suraj.kandpal@intel.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 03:34:53 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/dp: misordered M/N ratio filter in intel_dp_compute_con=
fig_limits()
--

commit 702cc07abf5c42e8a3c593b53932c55fcc454655
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/dp: Limit M/N ratio for DP

This commit restricts DisplayPort link configurations and prunes modes where
the ceiling of the Link M/N ratio exceeds the hardware limit supported by t=
he
transcoder timing generator DDA.

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

[Severity: Medium]
Does calling intel_dp_compute_m_n_ratio_limits() after the
(is_mst || intel_dp->use_max_params) block and before
intel_dp_test_compute_config() in intel_dp_compute_config_limits() cause two
filtering regressions?

First, in drivers/gpu/drm/i915/display/intel_dp.c:
intel_dp_compute_config_limits() narrows limits->link_config_filter to a
single max_config before intel_dp_compute_m_n_ratio_limits() runs:

	if (is_mst || intel_dp->use_max_params) {
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

Because 128b/132b symbol clocks (rate * 10 / 32) are lower than 8b/10b symb=
ol
clocks (rate * 10 / 10), max_config can pick a UHBR rate such as UHBR10
(312.5 MHz symbol clock) or UHBR20 (625 MHz symbol clock) that exceeds the
M/N ratio limit for a high pixel clock mode, even when a lower link rate li=
ke
HBR3 (810 MHz symbol clock) or HBR2 (540 MHz symbol clock) satisfies the M/N
ratio and passed intel_dp_mode_valid_m_n(). Since
intel_dp_compute_m_n_ratio_limits() only iterates over
limits->link_config_filter, won't it reject the modeset instead of allowing
intel_dp_get_connector_max_link_config() to select the highest M/N-compatib=
le
configuration?

Second, intel_dp_test_compute_config() is called right after
intel_dp_compute_m_n_ratio_limits(). When intel_dp->compliance.test_type is
DP_TEST_LINK_TRAINING, intel_dp_test_compute_config() ->
set_filter_for_link_params() -> set_filter_for_link_config() in
drivers/gpu/drm/i915/display/intel_dp_test.c overwrites
limits->link_config_filter with a fresh filter:

static bool set_filter_for_link_config(struct intel_connector *connector,
				       struct intel_dp_link_caps *link_caps,
				       const struct intel_dp_link_config *link_params,
				       struct link_config_limits *limits)
{
	struct intel_dp_link_caps_filter new_filter =3D INTEL_DP_LINK_CAPS_FILTER_=
NONE;

	if (!intel_dp_link_caps_filter_add(link_caps, &new_filter, link_params))
		return false;

	limits->link_config_filter =3D new_filter;

	return true;
}

Because intel_dp_link_caps_filter_add() checks get_allowed_config_filter()
rather than limits->link_config_filter, won't this discard the M/N ratio
filter applied by intel_dp_compute_m_n_ratio_limits() and allow an
M/N-invalid compliance link configuration?

Should intel_dp_compute_m_n_ratio_limits() be called before the
(is_mst || intel_dp->use_max_params) block, or after
intel_dp_test_compute_config() while also filtering before
intel_dp_get_connector_max_link_config()?

> =20
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022032247.1378=
809-1-suraj.kandpal@intel.com?part=3D2
