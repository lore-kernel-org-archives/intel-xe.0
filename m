Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC30C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 10:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1EA10E8BA;
	Mon,  6 Jul 2026 10:42:33 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5451D10E8BA;
 Mon,  6 Jul 2026 10:42:32 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wggmR-00000001TdM-0vQg; Mon, 06 Jul 2026 13:42:29 +0300
Message-ID: <848d5c924d5d893fed8ef7c5856b0343937c5591.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 13:42:26 +0300
In-Reply-To: <20260701153204.4124150-18-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-18-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH v2 17/34] drm/i915/dp: Iterate configurations via
 link_caps for SST non-DSC
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
> computation for non-DSC mode. This is a step towards unifying
> configuration selection and iteration across connector types and between
> compute and fallback paths.
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
>  drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++++++++++-------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 42bb1c7622525..108298186d121 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1754,43 +1754,42 @@ intel_dp_compute_link_config_wide(struct intel_dp=
 *intel_dp,
>  				  const struct drm_connector_state *conn_state,
>  				  const struct link_config_limits *limits)
>  {
> +	struct intel_connector *connector =3D to_intel_connector(conn_state->co=
nnector);
> +	int bpp, clock =3D intel_dp_mode_clock(pipe_config, conn_state);
>  	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> -	int bpp, i, lane_count, clock =3D intel_dp_mode_clock(pipe_config, conn=
_state);
> -	int link_rate, link_avail;
> +	struct intel_dp_link_caps_order order =3D
> +		intel_dp_link_caps_connector_compute_order(connector);
> +	int link_avail;
> =20
>  	for (bpp =3D fxp_q4_to_int(limits->link.max_bpp_x16);
>  	     bpp >=3D fxp_q4_to_int(limits->link.min_bpp_x16);
>  	     bpp -=3D 2 * 3) {
>  		int link_bpp_x16 =3D
>  			intel_dp_output_format_link_bpp_x16(pipe_config->output_format, bpp);
> +		struct intel_dp_link_config link_config;
> +		struct intel_dp_link_caps_iter iter;
> =20
> -		for (i =3D 0; i < intel_dp_link_caps_num_common_rates(intel_dp->link.c=
aps); i++) {
> -			link_rate =3D intel_dp_common_rate(link_caps, i);
> -			if (link_rate < limits->min_rate ||
> -			    link_rate > limits->max_rate)
> -				continue;
> -
> -			for (lane_count =3D limits->min_lane_count;
> -			     lane_count <=3D limits->max_lane_count;
> -			     lane_count <<=3D 1) {
> -				const struct drm_display_mode *adjusted_mode =3D
> +		intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_co=
nfig_filter);
> +		for_each_dp_link_config(&iter, &link_config) {
> +			const struct drm_display_mode *adjusted_mode =3D
>  					&pipe_config->hw.adjusted_mode;
> -				int mode_rate =3D
> -					intel_dp_link_required(link_rate, lane_count,
> -							       clock, adjusted_mode->hdisplay,
> -							       link_bpp_x16, 0);
> +			int mode_rate;
> =20
> -				link_avail =3D intel_dp_max_link_data_rate(intel_dp,
> -									 link_rate,
> -									 lane_count);
> +			mode_rate =3D intel_dp_link_required(link_config.rate,
> +							   link_config.lane_count,
> +							   clock, adjusted_mode->hdisplay,
> +							   link_bpp_x16, 0);
> =20
> -				if (mode_rate <=3D link_avail) {
> -					pipe_config->lane_count =3D lane_count;
> -					pipe_config->pipe_bpp =3D bpp;
> -					pipe_config->port_clock =3D link_rate;
> +			link_avail =3D intel_dp_max_link_data_rate(intel_dp,
> +								 link_config.rate,
> +								 link_config.lane_count);
> =20
> -					return 0;
> -				}
> +			if (mode_rate <=3D link_avail) {
> +				pipe_config->lane_count =3D link_config.lane_count;
> +				pipe_config->pipe_bpp =3D bpp;
> +				pipe_config->port_clock =3D link_config.rate;
> +
> +				return 0;
>  			}
>  		}
>  	}

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
