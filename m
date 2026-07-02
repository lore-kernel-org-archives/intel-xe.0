Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDE4C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502C510F301;
	Thu,  2 Jul 2026 11:22:17 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8808B10F2F5;
 Thu,  2 Jul 2026 11:22:16 +0000 (UTC)
Received: from [62.183.198.118] (helo=[10.147.29.230])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wfFUi-00000001MHd-1mZ9; Thu, 02 Jul 2026 14:22:14 +0300
Message-ID: <c8d3918319b066643df94f63771a6a54b61778cc.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 14:22:11 +0300
In-Reply-To: <20260701153204.4124150-15-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-15-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 14/34] drm/i915/dp: Query max BW config via link_caps
 during mode validation
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
> Query the maximum link BW configuration during mode validation and MST
> link probing directly from intel_dp_link_caps_get_max_bw_config(),
> instead of using the intel_dp_max_link_rate() and
> intel_dp_max_lane_count() helpers.
>=20
> This makes the max BW link config query uniform across mode validation
> and TBT BW calculation, and allows unexporting the
> intel_dp_max_link_rate()/intel_dp_max_lane_count() helpers.
>=20
> v2: Use the max BW link configuration, instead of the max link limits.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 10 ++++++----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  2 --
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 ++++++++++++----
>  3 files changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index bc333bc9296b2..b10bbbf0f49bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -354,7 +354,7 @@ static int intel_dp_get_max_common_lane_count(struct =
intel_dp *intel_dp)
>  	return min3(source_max, sink_max, lane_max);
>  }
> =20
> -int intel_dp_max_lane_count(struct intel_dp *intel_dp)
> +static int intel_dp_max_lane_count(struct intel_dp *intel_dp)
>  {
>  	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	struct intel_dp_link_config max_link_limits;
> @@ -1331,6 +1331,7 @@ intel_dp_mode_valid_format(struct intel_connector *=
connector,
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	enum intel_output_format output_format;
>  	int max_rate, mode_rate, max_lanes, max_link_clock;
> +	struct intel_dp_link_config max_bw_config;
>  	u16 dsc_max_compressed_bpp =3D 0;
>  	enum drm_mode_status status;
>  	bool dsc =3D false;
> @@ -1343,8 +1344,9 @@ intel_dp_mode_valid_format(struct intel_connector *=
connector,
> =20
>  	output_format =3D intel_dp_output_format(connector, sink_format);
> =20
> -	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
> -	max_lanes =3D intel_dp_max_lane_count(intel_dp);
> +	intel_dp_link_caps_get_max_bw_config(intel_dp->link.caps, &max_bw_confi=
g);
> +	max_link_clock =3D max_bw_config.rate;
> +	max_lanes =3D max_bw_config.lane_count;
> =20
>  	max_rate =3D intel_dp_max_link_data_rate(intel_dp, max_link_clock, max_=
lanes);
> =20
> @@ -1538,7 +1540,7 @@ static void intel_dp_print_rates(struct intel_dp *i=
ntel_dp)
>  	intel_dp_link_caps_print_common_rates(intel_dp->link.caps);
>  }
> =20
> -int
> +static int
>  intel_dp_max_link_rate(struct intel_dp *intel_dp)
>  {
>  	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index 13872b8c4975e..9564369ea4852 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -111,8 +111,6 @@ void intel_dp_mst_suspend(struct intel_display *displ=
ay);
>  void intel_dp_mst_resume(struct intel_display *display);
>  int intel_dp_rate_limit_len(const int *rates, int len, int max_rate);
>  int intel_dp_max_source_lane_count(struct intel_digital_port *dig_port);
> -int intel_dp_max_link_rate(struct intel_dp *intel_dp);
> -int intel_dp_max_lane_count(struct intel_dp *intel_dp);
>  int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_st=
ate);
>  int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
>  int intel_dp_rate_index(const int *rates, int len, int rate);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index ecc90e8faee11..e113c9e60e67d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -47,6 +47,7 @@
>  #include "intel_display_wa.h"
>  #include "intel_dp.h"
>  #include "intel_dp_hdcp.h"
> +#include "intel_dp_link_caps.h"
>  #include "intel_dp_link_training.h"
>  #include "intel_dp_mst.h"
>  #include "intel_dp_test.h"
> @@ -1476,6 +1477,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *=
_connector,
>  	unsigned long bw_overhead_flags =3D
>  		DRM_DP_BW_OVERHEAD_MST | DRM_DP_BW_OVERHEAD_SSC_REF_CLK;
>  	int min_link_bpp_x16 =3D fxp_q4_from_int(18);
> +	struct intel_dp_link_config max_bw_config;
>  	static bool supports_dsc;
>  	int ret;
>  	bool dsc =3D false;
> @@ -1508,8 +1510,9 @@ mst_connector_mode_valid_ctx(struct drm_connector *=
_connector,
>  		min_link_bpp_x16 =3D intel_dp_compute_min_compressed_bpp_x16(connector=
,
>  									   INTEL_OUTPUT_FORMAT_RGB);
> =20
> -	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
> -	max_lanes =3D intel_dp_max_lane_count(intel_dp);
> +	intel_dp_link_caps_get_max_bw_config(intel_dp->link.caps, &max_bw_confi=
g);
> +	max_link_clock =3D max_bw_config.rate;
> +	max_lanes =3D max_bw_config.lane_count;
> =20
>  	max_rate =3D intel_dp_max_link_data_rate(intel_dp,
>  					       max_link_clock, max_lanes);
> @@ -2135,14 +2138,19 @@ bool intel_dp_mst_crtc_needs_modeset(struct intel=
_atomic_state *state,
>   */
>  void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp)
>  {
> -	int link_rate =3D intel_dp_max_link_rate(intel_dp);
> -	int lane_count =3D intel_dp_max_lane_count(intel_dp);
> +	struct intel_dp_link_config max_bw_config;
> +	int link_rate;
> +	int lane_count;
>  	u8 rate_select;
>  	u8 link_bw;
> =20
>  	if (intel_dp->link.active)
>  		return;
> =20
> +	intel_dp_link_caps_get_max_bw_config(intel_dp->link.caps, &max_bw_confi=
g);
> +	link_rate =3D max_bw_config.rate;
> +	lane_count =3D max_bw_config.lane_count;
> +
>  	if (intel_mst_probed_link_params_valid(intel_dp, link_rate, lane_count)=
)
>  		return;
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
