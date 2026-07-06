Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0CC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 16:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D69910E3D1;
	Mon,  6 Jul 2026 16:45:25 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A55710E3D1;
 Mon,  6 Jul 2026 16:45:24 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wgmRd-00000001UFv-1qDL; Mon, 06 Jul 2026 19:45:22 +0300
Message-ID: <83eb97e76ee3aa7e49cea7a7966a513b51d5d137.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 06 Jul 2026 19:45:19 +0300
In-Reply-To: <20260701153204.4124150-21-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-21-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH v2 20/34] drm/i915/dp_mst: Use link caps for non-DSC
 config selection
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
> Use the link caps helper to select the maximum MST link configuration
> for non-DSC computation, instead of using the separate max rate and lane
> count limits, which may not form a valid configuration after individual
> configs are disabled by fallback.
>=20
> This is a step towards unifying configuration selection and iteration
> across connector types and between compute and fallback paths.
>=20
> In some cases all configurations should be considered, as noted in the
> code comment; for now keep the existing behavior of selecting the
> maximum bandwidth configuration as determined by the MST connector's BW
> config iteration order.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index e113c9e60e67d..47b8563f85e4d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -445,8 +445,20 @@ static int mst_stream_compute_link_config(struct int=
el_dp *intel_dp,
>  					  struct drm_connector_state *conn_state,
>  					  const struct link_config_limits *limits)
>  {
> -	crtc_state->lane_count =3D limits->max_lane_count;
> -	crtc_state->port_clock =3D limits->max_rate;
> +	struct intel_connector *connector =3D to_intel_connector(conn_state->co=
nnector);
> +	struct intel_dp_link_config max_link_config;
> +
> +	/*
> +	 * FIXME: Use a proper iteration over the link configurations, instead
> +	 * of using only the max BW config. For instance UHBR rate configs may
> +	 * have additional limitations over non-UHBR ones, due to the DSC DPT
> +	 * bpp maximum limit.
> +	 */
> +	if (!intel_dp_get_connector_max_link_config(connector, limits, &max_lin=
k_config))
> +		return -EINVAL;
> +
> +	crtc_state->port_clock =3D max_link_config.rate;
> +	crtc_state->lane_count =3D max_link_config.lane_count;
> =20
>  	/*
>  	 * FIXME: allocate the BW according to link_bpp, which in the case of

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
