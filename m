Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2789606A333
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtbqgBwQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765610EA0A;
	Mon, 16 Nov 2026 14:19:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E3110EB22;
 Mon, 16 Nov 2026 14:19:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E5384368B;
 Mon, 16 Nov 2026 14:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EACF1F000C4;
 Mon, 16 Nov 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794838767;
 bh=TVsxrQsT4OsE3Q+/rAlycmFEC5q/azvK54KOtQfjzSo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PtbqgBwQbYqnOevf8yO109wB3O/Qu8MgKE50NeJTizLTjfPYwAGMyzMR79FLqvKmv
 N/Mm+/IGgKFf6yuTGlq2C4JfoxO0XypYRD+xSWsgQiLq3xwlMEtytKeSCOphx/UcGj
 D7unU96+37cfXBHYpi96i077HNbqOcDWNnSGUAslD4huj9VQpukECwHpzD0W5W/w/C
 L/w1SqcabivXeEpEzoV6dfIiPqW+Ljnym9NszDBHjdvj0rnhLgC4vhhvWIM1RPbGfe
 DfCwRBj+CZNS7p86jAvvBy6M0snv65t5MO/yY6mIqSvGnhG8YejFw0QxsXDQ/A+ENc
 ryEtTjWNPavsQ==
Message-ID: <sashiko-outbox-217152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] drm/i915/dp: Use the VBT fast link training link
 config for eDP
To: "Lee Shawn C" <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116135904.59365-5-shawn.c.lee@intel.com>
References: <20261116135904.59365-1-shawn.c.lee@intel.com>
 <20261116135904.59365-5-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 14:19:26 +0000
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
- [High] drm/i915/dp: missing M/N and BW fallback in
  intel_dp_apply_vbt_edp_link_config()
- [High] drm/i915/dp: use_max_params overrides
  intel_dp_apply_vbt_edp_link_config()
--

commit 7ebafd17f2c671a09a03aeab471e356e0295de7d
Author: Lee Shawn C <shawn.c.lee@intel.com>

drm/i915/dp: Use the VBT fast link training link config for eDP

This commit restricts eDP link configurations during compute config to the
VBT fast link training rate and lane count when eDP fast link training is
enabled in the VBT and supported by the sink.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index ef164a7976187..d5829bef801af 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2824,6 +2824,54 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp =
*intel_dp,
>  	return true;
>  }
> =20
> +static void
> +intel_dp_apply_vbt_edp_link_config(struct intel_dp *intel_dp,
> +				   struct intel_connector *connector,
> +				   struct link_config_limits *limits)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_caps_filter vbt_filter =3D INTEL_DP_LINK_CAPS_FILT=
ER_NONE;
> +	struct intel_dp_link_caps_iter iter;
> +	struct intel_dp_link_config config;
> +	int vbt_rate =3D connector->panel.vbt.edp.rate;
> +	int vbt_lanes =3D connector->panel.vbt.edp.lanes;
> +
> +	if (!intel_dp_is_edp(intel_dp) ||
> +	    !connector->panel.vbt.edp.fast_link_training ||
> +	    !drm_dp_fast_training_cap(intel_dp->dpcd) ||
> +	    (!vbt_rate && !vbt_lanes))
> +		return;
> +
> +	intel_dp_link_caps_iter_start(&iter, link_caps,
> +				      intel_dp_link_caps_connector_compute_order(connector),
> +				      limits->link_config_filter);
> +	for_each_dp_link_config(&iter, &config) {
> +		if (vbt_rate && config.rate !=3D vbt_rate)
> +			continue;
> +		if (vbt_lanes && config.lane_count !=3D vbt_lanes)
> +			continue;
> +
> +		intel_dp_link_caps_filter_add(link_caps, &vbt_filter, &config);
> +	}
> +	intel_dp_link_caps_iter_end(&iter);

[Severity: High]
Does intersecting against limits->link_config_filter after the
intel_dp->use_max_params check cause VBT fast link training configs to be
ignored whenever use_max_params is true?

intel_edp_init_dpcd() sets intel_dp->use_max_params to true on all eDP < 1.4
panels, and intel_dp_compute_config_limits() narrows
limits->link_config_filter to a single max_config entry before calling
intel_dp_apply_vbt_edp_link_config(). Any VBT rate or lane count lower than
max_config will not match that single-entry filter, leaving
vbt_filter.config_mask zero so the VBT config (and its voltage swing and
pre-emphasis levels in intel_dp_use_vbt_fast_link_levels()) is bypassed.

On eDP >=3D 1.4 panels, if link training fails on the VBT config,
intel_dp_get_link_train_fallback_values() sets intel_dp->use_max_params =3D
true and returns without calling intel_dp_link_caps_disable_config(), either
retrying the same failed config if the VBT config was already max_config or
leaving a failed lower VBT config enabled in link_caps for subsequent
fallbacks.

> +
> +	if (!vbt_filter.config_mask) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] VBT eDP link config (lanes %d, rate %d) not in=
 allowed link configs, ignoring\n",
> +			    connector->base.base.id, connector->base.name,
> +			    vbt_lanes, vbt_rate);
> +		return;
> +	}
> +
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] Limiting link configs to VBT eDP lanes %d, rate=
 %d\n",
> +		    connector->base.base.id, connector->base.name,
> +		    vbt_lanes, vbt_rate);
> +
> +	limits->link_config_filter =3D vbt_filter;
> +}
> +
>  bool
>  intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>  			       struct drm_connector_state *conn_state,
> @@ -2940,6 +2988,8 @@ intel_dp_compute_config_limits(struct intel_dp *int=
el_dp,
>  		limits->link_config_filter =3D new_filter;
>  	}
> =20
> +	intel_dp_apply_vbt_edp_link_config(intel_dp, connector, limits);
> +
>  	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state=
, limits))
>  		return false;

[Severity: High]
Can restricting limits->link_config_filter to vbt_filter here cause the
modeset to fail instead of falling back when the VBT link config is in
link_caps but cannot support the mode's M/N ratio or required bandwidth?

link_caps contains all common source and sink rates and lane counts (for
example 1.62 Gbps RBR, which is also the 0-value encoding in VBT versions
182..223 in parse_edp_fast_link_params()), so an under-provisioned VBT
config still matches in intel_dp_apply_vbt_edp_link_config() and overwrites
limits->link_config_filter.

If vbt_rate is too low for intel_dp_can_support_m_n(),
intel_dp_compute_m_n_ratio_limits() then sees only vbt_filter and returns
false even when higher rates in link_caps could support the mode. Even when
the M/N check passes, if the VBT config lacks bandwidth for the mode,
intel_dp_compute_link_config_wide() degrades pipe_bpp or returns -EINVAL
without retrying against the unfiltered link_caps, failing the modeset on
non-DSC eDP panels or selecting the VBT link config without a bandwidth
check in dsc_compute_compressed_bpp() on DSC-capable eDP panels:

drivers/gpu/drm/i915/display/intel_dp.c:dsc_compute_compressed_bpp() {
    ...
	if ( intel_dp_is_edp(intel_dp)) {
		struct intel_dp_link_config max_link_config;

		if (!intel_dp_get_connector_max_link_config(connector, limits, &max_link_=
config))
			return -EINVAL;

		pipe_config->port_clock =3D max_link_config.rate;
		pipe_config->lane_count =3D max_link_config.lane_count;

		pipe_config->dsc.compressed_bpp_x16 =3D max_bpp_x16;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116135904.5936=
5-1-shawn.c.lee@intel.com?part=3D4
