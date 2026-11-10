Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2070B606A326
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6QKhh0o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D627210F643;
	Tue, 10 Nov 2026 12:14:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BA010F643;
 Tue, 10 Nov 2026 12:14:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D939638CF;
 Tue, 10 Nov 2026 12:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094301F0089F;
 Tue, 10 Nov 2026 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794312862;
 bh=0q+IpIU5/zKMLQVg9mTp1sn4euIxNR2Sjqe7xlaPajA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=I6QKhh0obyxXsTCAmoatk+4i+Qc3OHy1yTqeSCrJIGtxCTKo7i7v/lZNQS4VCx8E6
 Ik4rJC/dHJUj6xE1kSpl9Tr2viKwxZieY2iU6Tsk5iWh58GqCj7Q6D+wGhNtgTWwcM
 i7ku0ENoCTBOF0YtA0H67HFbfXLsM1qQbHpY/YmCtaqJpvdB7ZuLb0KL4Uz86jsfq9
 dvQgztH8MEfSeN/7qG4KHBfmDhdvTGYKyKTxsjMx/SNUtTSnrpfz80WELrpBDkpLTM
 lDQ75TqZJSMz5hf5JQE928qRBww/JwN/c4zXr5k3sbe9yEIP12W7vVNn8vtDlr1pQe
 QNu1l585khx9g==
Message-ID: <sashiko-outbox-206990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] drm/i915/dp: Use the VBT fast link training link
 config for eDP
To: "Lee Shawn C" <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110115432.894616-5-shawn.c.lee@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
 <20261110115432.894616-5-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:14:21 +0000
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
- [High] drm/i915/dp: use_max_params overrides
  intel_dp_apply_vbt_edp_link_config()
- [High] drm/i915/dp: no M/N or BW fallback in
  intel_dp_apply_vbt_edp_link_config()
--

commit 46497d5cbedd717d0790bb659b620e0c9e18c67c
Author: Lee Shawn C <shawn.c.lee@intel.com>

drm/i915/dp: Use the VBT fast link training link config for eDP

This commit restricts the candidate eDP link configurations during compute
config to the rate and lane count specified by the VBT fast link training
parameters when fast link training is enabled.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index ef164a7976187..0390bd62d7596 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2824,6 +2824,62 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp =
*intel_dp,
>  	return true;
>  }
> =20
> +/*
> + * If the VBT enables eDP fast link training for the panel, restrict the
> + * candidate link configs to the VBT fast link training link rate and/or
> + * lane count (a zero value means no restriction for that parameter). The
> + * filter is intersected with any filter already set in @limits. If no
> + * allowed config matches (e.g. the VBT values are not supported by the
> + * source/sink, or link training fallback has disabled all such configs),
> + * the VBT params are ignored.
> + */
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
> @@ -2940,6 +2996,8 @@ intel_dp_compute_config_limits(struct intel_dp *int=
el_dp,
>  		limits->link_config_filter =3D new_filter;
>  	}
> =20
> +	intel_dp_apply_vbt_edp_link_config(intel_dp, connector, limits);

[Severity: High]
Does calling intel_dp_apply_vbt_edp_link_config() after the
intel_dp->use_max_params block cause non-maximum VBT configs to be
ignored whenever use_max_params is set?

intel_edp_init_dpcd() initializes intel_dp->use_max_params =3D true for all
eDP < 1.4 panels, and intel_dp_compute_config_limits() narrows
limits->link_config_filter to the single max_config entry before calling
intel_dp_apply_vbt_edp_link_config().  Any VBT rate or lane count lower
than max_config will not match that single-entry filter, so the VBT config
is ignored and intel_dp_use_vbt_fast_link_levels() also returns false.

On eDP >=3D 1.4 panels, if link training fails on the VBT config, the first
fallback step in intel_dp_get_link_train_fallback_values() sets
intel_dp->use_max_params =3D true and returns 0 without disabling the
failed config in link_caps:

drivers/gpu/drm/i915/display/intel_dp_link_training.c:intel_dp_get_link_tra=
in_fallback_values() {
	if (intel_dp_is_edp(intel_dp) && !intel_dp->use_max_params) {
		lt_dbg(intel_dp, DP_PHY_DPRX,
		       "Retrying Link training for eDP with max parameters\n");
		intel_dp->use_max_params =3D true;
		return 0;
	}
}

If the VBT config was already max_config, the retry repeats the exact
same failed config; if it was lower than max_config, the failed VBT
config stays enabled in link_caps and will be selected again if
max_config later fails and falls back.

> +
>  	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state=
, limits))
>  		return false;

[Severity: High]
Can restricting limits->link_config_filter to vbt_filter cause the
modeset to fail instead of falling back when the VBT config cannot
support the mode's M/N ratio or required bandwidth?

If the VBT specifies a rate or lane count that is present in link_caps
(for example RBR 1.62 Gbps, which is encoded as 0 in VBT versions
182..223) but is too low for the panel's mode, vbt_filter is non-empty
and overwrites limits->link_config_filter.

When vbt_rate violates the Link M/N ratio limit,
intel_dp_compute_m_n_ratio_limits() then sees no valid configs in
limits->link_config_filter and fails intel_dp_compute_config_limits()
even if higher rates in link_caps would pass.  Even if the M/N check
passes, intel_dp_compute_link_config_wide() only searches
limits->link_config_filter and returns -EINVAL when the VBT config lacks
bandwidth for the mode, which fails the modeset on non-DSC eDP panels (or
picks the under-provisioned VBT config without a bandwidth check in
dsc_compute_compressed_bpp() on DSC-capable eDP panels).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110115432.8946=
16-1-shawn.c.lee@intel.com?part=3D4
