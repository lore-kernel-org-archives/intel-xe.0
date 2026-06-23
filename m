Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7772CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 10:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C63710EA7C;
	Tue, 23 Jun 2026 10:31:13 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A788610EA7C;
 Tue, 23 Jun 2026 10:31:11 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wbyPL-0000000148P-2jXZ; Tue, 23 Jun 2026 13:31:09 +0300
Message-ID: <d071dd25621b1fe89d59059bdf87dfcb99146fd1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 13:31:06 +0300
In-Reply-To: <20260616200849.3534628-9-imre.deak@intel.com>
References: <20260616200849.3534628-1-imre.deak@intel.com>
 <20260616200849.3534628-9-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 08/28] drm/i915/dp_link_training: Use helpers to get
 forced link params
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

On Tue, 2026-06-16 at 23:08 +0300, Imre Deak wrote:
> Use intel_dp_link_caps_get_forced_params() in the link training fallback
> code instead of directly accessing the state. This allows the link caps
> module to track changes to forced parameters internally.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.



>  .../drm/i915/display/intel_dp_link_training.c | 22 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index cbef3d45baf9c..61ada34ab9c8e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1850,18 +1850,22 @@ static bool reduce_link_params_in_bw_order(struct=
 intel_dp *intel_dp,
>  					   const struct intel_crtc_state *crtc_state,
>  					   int *new_link_rate, int *new_lane_count)
>  {
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_config forced_params;
>  	int link_rate;
>  	int lane_count;
>  	int i;
> =20
> +	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
> +
>  	i =3D intel_dp_link_config_index(intel_dp, crtc_state->port_clock, crtc=
_state->lane_count);
>  	for (i--; i >=3D 0; i--) {
>  		intel_dp_link_config_get(intel_dp, i, &link_rate, &lane_count);
> =20
> -		if ((intel_dp->link.force_rate &&
> -		     intel_dp->link.force_rate !=3D link_rate) ||
> -		    (intel_dp->link.force_lane_count &&
> -		     intel_dp->link.force_lane_count !=3D lane_count))
> +		if ((forced_params.rate &&
> +		     forced_params.rate !=3D link_rate) ||
> +		    (forced_params.lane_count &&
> +		     forced_params.lane_count !=3D lane_count))
>  			continue;
> =20
>  		break;
> @@ -1878,10 +1882,13 @@ static bool reduce_link_params_in_bw_order(struct=
 intel_dp *intel_dp,
> =20
>  static int reduce_link_rate(struct intel_dp *intel_dp, int current_rate)
>  {
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_config forced_params;
>  	int rate_index;
>  	int new_rate;
> =20
> -	if (intel_dp->link.force_rate)
> +	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
> +	if (forced_params.rate)
>  		return -1;
> =20
>  	rate_index =3D intel_dp_rate_index(intel_dp->common_rates,
> @@ -1902,7 +1909,10 @@ static int reduce_link_rate(struct intel_dp *intel=
_dp, int current_rate)
> =20
>  static int reduce_lane_count(struct intel_dp *intel_dp, int current_lane=
_count)
>  {
> -	if (intel_dp->link.force_lane_count)
> +	struct intel_dp_link_config forced_params;
> +
> +	intel_dp_link_caps_get_forced_params(intel_dp->link.caps, &forced_param=
s);
> +	if (forced_params.lane_count)
>  		return -1;
> =20
>  	if (current_lane_count =3D=3D 1)
