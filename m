Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA152C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 09:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8310EC25;
	Tue,  7 Jul 2026 09:32:30 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0468310EC25;
 Tue,  7 Jul 2026 09:32:29 +0000 (UTC)
Received: from 81-197-16-175.elisa-laajakaista.fi ([81.197.16.175]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wh2AC-00000001VOW-3JqY; Tue, 07 Jul 2026 12:32:27 +0300
Message-ID: <bda423b95b9d79cd58da098b2c06e022f1992869.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 07 Jul 2026 12:32:20 +0300
In-Reply-To: <20260701153204.4124150-23-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-23-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH v2 22/34] drm/i915/dp: Remove min/max link config limits
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2026-07-01 at 18:31 +0300, Imre Deak wrote:
> Remove the min/max rate and lane count fields from struct
> link_config_limits after all state computation is converted to use the
> configuration filter.
>=20
> A simple min/max range cannot fully describe the valid configuration
> set once individual configurations are disabled (for example by
> fallback), as it may allow combinations that are not actually valid.
> The configuration filter, on the other hand, always represents a
> consistent set of valid configurations.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c       | 86 -------------------
>  drivers/gpu/drm/i915/display/intel_dp.h       |  6 --
>  .../gpu/drm/i915/display/intel_dp_link_caps.c |  4 +-
>  .../gpu/drm/i915/display/intel_dp_link_caps.h |  2 -
>  drivers/gpu/drm/i915/display/intel_dp_test.c  | 23 -----
>  5 files changed, 2 insertions(+), 119 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 79e3334d24332..16b3ab9732120 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -354,44 +354,6 @@ static int intel_dp_get_max_common_lane_count(struct=
 intel_dp *intel_dp)
>  	return min3(source_max, sink_max, lane_max);
>  }
> =20
> -static int intel_dp_max_lane_count(struct intel_dp *intel_dp)
> -{
> -	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> -	struct intel_dp_link_config max_link_limits;
> -	struct intel_dp_link_config forced_params;
> -	int lane_count;
> -
> -	intel_dp_link_caps_get_max_limits(link_caps, &max_link_limits);
> -	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
> -
> -	if (forced_params.lane_count)
> -		lane_count =3D forced_params.lane_count;
> -	else
> -		lane_count =3D max_link_limits.lane_count;
> -
> -	switch (lane_count) {
> -	case 1:
> -	case 2:
> -	case 4:
> -		return lane_count;
> -	default:
> -		MISSING_CASE(lane_count);
> -		return 1;
> -	}
> -}
> -
> -static int intel_dp_min_lane_count(struct intel_dp *intel_dp)
> -{
> -	struct intel_dp_link_config forced_params;
> -
> -	intel_dp_link_caps_get_forced_params(intel_dp->link.caps, &forced_param=
s);
> -
> -	if (forced_params.lane_count)
> -		return forced_params.lane_count;
> -
> -	return 1;
> -}
> -
>  int intel_dp_link_bw_overhead(int link_clock, int lane_count, int hdispl=
ay,
>  			      int dsc_slice_count, int bpp_x16, unsigned long flags)
>  {
> @@ -1540,39 +1502,6 @@ static void intel_dp_print_rates(struct intel_dp *=
intel_dp)
>  	intel_dp_link_caps_print_common_rates(intel_dp->link.caps);
>  }
> =20
> -static int
> -intel_dp_max_link_rate(struct intel_dp *intel_dp)
> -{
> -	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> -	struct intel_dp_link_config max_link_limits;
> -	struct intel_dp_link_config forced_params;
> -	int len;
> -
> -	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
> -
> -	if (forced_params.rate)
> -		return forced_params.rate;
> -
> -	intel_dp_link_caps_get_max_limits(link_caps, &max_link_limits);
> -	len =3D intel_dp_common_len_rate_limit(link_caps, max_link_limits.rate)=
;
> -
> -	return intel_dp_common_rate(link_caps, len - 1);
> -}
> -
> -static int
> -intel_dp_min_link_rate(struct intel_dp *intel_dp)
> -{
> -	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> -	struct intel_dp_link_config forced_params;
> -
> -	intel_dp_link_caps_get_forced_params(intel_dp->link.caps, &forced_param=
s);
> -
> -	if (forced_params.rate)
> -		return forced_params.rate;
> -
> -	return intel_dp_common_rate(link_caps, 0);
> -}
> -
>  int intel_dp_rate_select(struct intel_dp *intel_dp, int rate)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> @@ -2711,18 +2640,6 @@ intel_dp_compute_config_limits(struct intel_dp *in=
tel_dp,
>  	struct intel_connector *connector =3D
>  		to_intel_connector(conn_state->connector);
> =20
> -	/*
> -	 * Remove the following min/max rate and lane count setup, once
> -	 * all users are converted to use link_config_mask instead.
> -	 */
> -	limits->min_rate =3D intel_dp_min_link_rate(intel_dp);
> -	limits->max_rate =3D intel_dp_max_link_rate(intel_dp);
> -
> -	limits->min_rate =3D min(limits->min_rate, limits->max_rate);
> -
> -	limits->min_lane_count =3D intel_dp_min_lane_count(intel_dp);
> -	limits->max_lane_count =3D intel_dp_max_lane_count(intel_dp);
> -
>  	limits->link_config_filter =3D INTEL_DP_LINK_CAPS_FILTER_ALL;
> =20
>  	limits->pipe.min_bpp =3D intel_dp_min_bpp(crtc_state->output_format);
> @@ -2802,9 +2719,6 @@ intel_dp_compute_config_limits(struct intel_dp *int=
el_dp,
>  		 * configuration, and typically on older panels these
>  		 * values correspond to the native resolution of the panel.
>  		 */
> -		limits->min_lane_count =3D limits->max_lane_count;
> -		limits->min_rate =3D limits->max_rate;
> -
>  		if (!intel_dp_get_connector_max_link_config(connector, limits, &max_co=
nfig))
>  			return false;
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index 9564369ea4852..0ec519fa12368 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -28,12 +28,6 @@ struct intel_dp_link_config;
>  struct intel_encoder;
> =20
>  struct link_config_limits {
> -	/*
> -	 * TODO: Remove the following min/max rate and lane count limits
> -	 * once all users are converted to use link_config_mask instead.
> -	 */
> -	int min_rate, max_rate;
> -	int min_lane_count, max_lane_count;
>  	struct intel_dp_link_caps_filter link_config_filter;
>  	struct {
>  		/* Uncompressed DSC input or link output bpp in 1 bpp units */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index 4ce35b76afee6..766dc9a98e05a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -242,8 +242,8 @@ intel_dp_link_caps_connector_fallback_order(bool is_m=
st)
>  }
> =20
>  /* Get length of common rates array potentially limited by max_rate. */
> -int intel_dp_common_len_rate_limit(struct intel_dp_link_caps *link_caps,
> -				   int max_rate)
> +static int intel_dp_common_len_rate_limit(struct intel_dp_link_caps *lin=
k_caps,
> +					  int max_rate)
>  {
>  	return intel_dp_rate_limit_len(link_caps->rates,
>  				       link_caps->num_rates, max_rate);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.h
> index 3c7e6c8d1ab1d..bb785c15c91f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -119,8 +119,6 @@ intel_dp_link_caps_connector_compute_order(struct int=
el_connector *connector);
>  struct intel_dp_link_caps_order
>  intel_dp_link_caps_connector_fallback_order(bool is_mst);
> =20
> -int intel_dp_common_len_rate_limit(struct intel_dp_link_caps *link_caps,
> -				   int max_rate);
>  int intel_dp_common_rate(struct intel_dp_link_caps *link_caps, int index=
);
>  int intel_dp_link_caps_common_rate_idx(struct intel_dp_link_caps *link_c=
aps, int rate);
>  int intel_dp_max_common_rate(struct intel_dp_link_caps *link_caps);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c b/drivers/gpu/d=
rm/i915/display/intel_dp_test.c
> index ec7fa690910bb..0551a1ce60d39 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_test.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
> @@ -114,7 +114,6 @@ bool intel_dp_test_compute_config(struct intel_connec=
tor *connector,
>  				  struct link_config_limits *limits)
>  {
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> =20
>  	/* For DP Compliance we override the computed bpp for the pipe */
> @@ -130,28 +129,6 @@ bool intel_dp_test_compute_config(struct intel_conne=
ctor *connector,
> =20
>  	/* Use values requested by Compliance Test Request */
>  	if (intel_dp->compliance.test_type =3D=3D DP_TEST_LINK_TRAINING) {
> -		int index;
> -
> -		/*
> -		 * TODO: Remove the following min/max link limit setup
> -		 * after converting to use the link configuration filter
> -		 * instead in limits.
> -		 */
> -		/* Validate the compliance test data since max values
> -		 * might have changed due to link train fallback.
> -		 */
> -		if (intel_dp_link_params_valid(intel_dp, intel_dp->compliance.test_lin=
k_rate,
> -					       intel_dp->compliance.test_lane_count)) {
> -			index =3D intel_dp_link_caps_common_rate_idx(link_caps,
> -								   intel_dp->compliance.test_link_rate);
> -			if (index >=3D 0) {
> -				limits->min_rate =3D intel_dp->compliance.test_link_rate;
> -				limits->max_rate =3D intel_dp->compliance.test_link_rate;
> -			}
> -			limits->min_lane_count =3D intel_dp->compliance.test_lane_count;
> -			limits->max_lane_count =3D intel_dp->compliance.test_lane_count;
> -		}
> -
>  		if (!set_filter_for_link_params(connector,
>  						intel_dp->compliance.test_link_rate,
>  						intel_dp->compliance.test_lane_count,

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
