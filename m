Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B140C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 10:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B6310E281;
	Mon,  6 Jul 2026 10:49:39 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39DE10E281;
 Mon,  6 Jul 2026 10:49:38 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wggtM-00000001Tef-18RA; Mon, 06 Jul 2026 13:49:36 +0300
Message-ID: <c496755d198f317620e2cfaae20851aa3fc206a8.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 13:49:35 +0300
In-Reply-To: <20260701153204.4124150-20-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-20-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH v2 19/34] drm/i915/dp: Use link caps for eDP DSC config
 selection
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
> Use the link caps helper to select the maximum eDP link configuration
> for DSC computation, instead of using the separate max rate and lane
> count limits, which may not form a valid configuration after individual
> configs are disabled by fallback.
>=20
> This is a step towards unifying configuration selection and iteration
> across connector types and between compute and fallback paths.
>=20
> The state computation should likely consider all allowed configurations,
> as noted in the code comment; for now keep the existing eDP DSC behavior
> of selecting the maximum configuration determined by the eDP connector
> rate / lane config iteration order.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index c6920afb50902..79e3334d24332 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2248,7 +2248,7 @@ static int dsc_compute_compressed_bpp(struct intel_=
dp *intel_dp,
>  				      int pipe_bpp)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> -	const struct intel_connector *connector =3D to_intel_connector(conn_sta=
te->connector);
> +	struct intel_connector *connector =3D to_intel_connector(conn_state->co=
nnector);
>  	int min_bpp_x16, max_bpp_x16, bpp_step_x16;
>  	int bpp_x16;
>  	int ret;
> @@ -2260,8 +2260,19 @@ static int dsc_compute_compressed_bpp(struct intel=
_dp *intel_dp,
>  	max_bpp_x16 =3D align_max_compressed_bpp_x16(connector, pipe_config->ou=
tput_format,
>  						   pipe_bpp, max_bpp_x16);
>  	if (intel_dp_is_edp(intel_dp)) {
> -		pipe_config->port_clock =3D limits->max_rate;
> -		pipe_config->lane_count =3D limits->max_lane_count;
> +		struct intel_dp_link_config max_link_config;
> +
> +		/*
> +		 * FIXME: Clarify why eDP does not use the regular SST BW
> +		 * check and instead always uses the maximum link config,
> +		 * regardless of intel_dp::use_max_params. Then unify this eDP
> +		 * path with the regular DP path.
> +		 */

Are you planning to clarify this? Will it be part of your current
refactoring (maybe in later patches)?

> +		if (!intel_dp_get_connector_max_link_config(connector, limits, &max_li=
nk_config))
> +			return -EINVAL;
> +
> +		pipe_config->port_clock =3D max_link_config.rate;
> +		pipe_config->lane_count =3D max_link_config.lane_count;
> =20
>  		pipe_config->dsc.compressed_bpp_x16 =3D max_bpp_x16;
> =20

Regardless:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
