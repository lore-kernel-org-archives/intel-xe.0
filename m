Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD330C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 10:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4710E281;
	Mon,  6 Jul 2026 10:48:44 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC2410E281;
 Mon,  6 Jul 2026 10:48:42 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wggsR-00000001TeE-3zPz; Mon, 06 Jul 2026 13:48:41 +0300
Message-ID: <27260d45509462ffefc185565b6f1509531e0a65.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 13:48:38 +0300
In-Reply-To: <20260701153204.4124150-19-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-19-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH v2 18/34] drm/i915/dp: Iterate configurations via
 link_caps for SST DSC
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
> Use the link caps configuration iterator for DP SST link configuration
> computation for DSC mode. This is a step towards unifying configuration
> selection and iteration across connector types and between compute and
> fallback paths.
>=20
> The iteration preserves the DP SST connector rate/lane ordering used by
> the current code.
>=20
> This also allows removing the now unused common rate count helper.
>=20
> v2:
> - Rebase on changes using a filter object instead of a mask of
>   configuration indices.
> - Rebase on changes using an iteration object.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c       | 92 +++++++++----------
>  .../gpu/drm/i915/display/intel_dp_link_caps.c |  5 -
>  .../gpu/drm/i915/display/intel_dp_link_caps.h |  1 -
>  3 files changed, 44 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 108298186d121..c6920afb50902 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1988,60 +1988,56 @@ static int dsc_compute_link_config(struct intel_d=
p *intel_dp,
>  				   const struct link_config_limits *limits,
>  				   int dsc_bpp_x16)
>  {
> -	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	const struct drm_display_mode *adjusted_mode =3D &pipe_config->hw.adjus=
ted_mode;
> -	int link_rate, lane_count;
> -	int i;
> +	struct intel_connector *connector =3D to_intel_connector(conn_state->co=
nnector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_caps_order order =3D
> +		intel_dp_link_caps_connector_compute_order(connector);
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> =20
> -	for (i =3D 0; i < intel_dp_link_caps_num_common_rates(intel_dp->link.ca=
ps); i++) {
> -		link_rate =3D intel_dp_common_rate(link_caps, i);
> -		if (link_rate < limits->min_rate || link_rate > limits->max_rate)
> -			continue;
> +	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_con=
fig_filter);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		/*
> +		 * FIXME: intel_dp_mtp_tu_compute_config() requires
> +		 * ->lane_count and ->port_clock set before we know
> +		 * they'll work. If we end up failing altogether,
> +		 * they'll remain in crtc state. This shouldn't matter,
> +		 * as we'd then bail out from compute config, but it's
> +		 * just ugly.
> +		 */
> +		pipe_config->lane_count =3D link_config.lane_count;
> +		pipe_config->port_clock =3D link_config.rate;
> =20
> -		for (lane_count =3D limits->min_lane_count;
> -		     lane_count <=3D limits->max_lane_count;
> -		     lane_count <<=3D 1) {
> +		if (drm_dp_is_uhbr_rate(link_config.rate)) {
> +			int ret;
> =20
> -			/*
> -			 * FIXME: intel_dp_mtp_tu_compute_config() requires
> -			 * ->lane_count and ->port_clock set before we know
> -			 * they'll work. If we end up failing altogether,
> -			 * they'll remain in crtc state. This shouldn't matter,
> -			 * as we'd then bail out from compute config, but it's
> -			 * just ugly.
> -			 */
> -			pipe_config->lane_count =3D lane_count;
> -			pipe_config->port_clock =3D link_rate;
> +			ret =3D intel_dp_mtp_tu_compute_config(intel_dp,
> +							     pipe_config,
> +							     conn_state,
> +							     dsc_bpp_x16,
> +							     dsc_bpp_x16,
> +							     0, true);
> +			if (ret)
> +				continue;
> +		} else {
> +			unsigned long bw_overhead_flags =3D
> +				pipe_config->fec_enable ? DRM_DP_BW_OVERHEAD_FEC : 0;
> +			int line_slice_count =3D
> +				intel_dsc_line_slice_count(&pipe_config->dsc.slice_config);
> =20
> -			if (drm_dp_is_uhbr_rate(link_rate)) {
> -				int ret;
> -
> -				ret =3D intel_dp_mtp_tu_compute_config(intel_dp,
> -								     pipe_config,
> -								     conn_state,
> -								     dsc_bpp_x16,
> -								     dsc_bpp_x16,
> -								     0, true);
> -				if (ret)
> -					continue;
> -			} else {
> -				unsigned long bw_overhead_flags =3D
> -					pipe_config->fec_enable ? DRM_DP_BW_OVERHEAD_FEC : 0;
> -				int line_slice_count =3D
> -					intel_dsc_line_slice_count(&pipe_config->dsc.slice_config);
> -
> -				if (!is_bw_sufficient_for_dsc_config(intel_dp,
> -								     link_rate, lane_count,
> -								     adjusted_mode->crtc_clock,
> -								     adjusted_mode->hdisplay,
> -								     line_slice_count,
> -								     dsc_bpp_x16,
> -								     bw_overhead_flags))
> -					continue;
> -			}
> -
> -			return 0;
> +			if (!is_bw_sufficient_for_dsc_config(intel_dp,
> +							     link_config.rate,
> +							     link_config.lane_count,
> +							     adjusted_mode->crtc_clock,
> +							     adjusted_mode->hdisplay,
> +							     line_slice_count,
> +							     dsc_bpp_x16,
> +							     bw_overhead_flags))
> +				continue;
>  		}
> +
> +		return 0;
>  	}
> =20
>  	return -EINVAL;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index 8dfb7f4f703bc..4ce35b76afee6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -273,11 +273,6 @@ int intel_dp_max_common_rate(struct intel_dp_link_ca=
ps *link_caps)
>  	return intel_dp_common_rate(link_caps, link_caps->num_rates - 1);
>  }
> =20
> -int intel_dp_link_caps_num_common_rates(struct intel_dp_link_caps *link_=
caps)
> -{
> -	return link_caps->num_rates;
> -}
> -
>  void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *li=
nk_caps)
>  {
>  	struct intel_display *display =3D to_intel_display(link_caps->dp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.h
> index 07002d745d384..3c7e6c8d1ab1d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -124,7 +124,6 @@ int intel_dp_common_len_rate_limit(struct intel_dp_li=
nk_caps *link_caps,
>  int intel_dp_common_rate(struct intel_dp_link_caps *link_caps, int index=
);
>  int intel_dp_link_caps_common_rate_idx(struct intel_dp_link_caps *link_c=
aps, int rate);
>  int intel_dp_max_common_rate(struct intel_dp_link_caps *link_caps);
> -int intel_dp_link_caps_num_common_rates(struct intel_dp_link_caps *link_=
caps);
> =20
>  void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *li=
nk_caps);
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
