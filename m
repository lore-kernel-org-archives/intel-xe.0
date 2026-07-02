Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F51FC43602
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA63510F2EF;
	Thu,  2 Jul 2026 11:23:56 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1EB10E4BD;
 Thu,  2 Jul 2026 11:23:55 +0000 (UTC)
Received: from [62.183.198.118] (helo=[10.147.29.230])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wfFWK-00000001MI4-37cR; Thu, 02 Jul 2026 14:23:53 +0300
Message-ID: <0ece60bcaf370cc26fae967cdd80ac9042d54b4f.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 14:23:51 +0300
In-Reply-To: <20260701153204.4124150-16-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-16-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 15/34] drm/i915/dp_tunnel: Query max BW config via
 link_caps for BW computation
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
> Query the maximum link BW configuration via the link caps interface to
> compute the available TBT bandwidth. Unlike the max common link params
> used so far for this, the max BW config also accounts for any forced
> link parameters.
>=20
> This makes the max BW link config query uniform across mode validation
> and TBT BW calculation, and allows unexporting the
> intel_dp_link_caps_max_common_lane_count() helper.
>=20
> v2: Use the max BW link configuration, instead of the max link limits.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_dp_link_caps.h | 1 -
>  drivers/gpu/drm/i915/display/intel_dp_tunnel.c    | 8 +++++---
>  3 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index c209c8a935234..8dfb7f4f703bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -290,7 +290,7 @@ void intel_dp_link_caps_print_common_rates(struct int=
el_dp_link_caps *link_caps)
>  	drm_dbg_kms(display->drm, "common rates: %s\n", seq_buf_str(&s));
>  }
> =20
> -int intel_dp_link_caps_max_common_lane_count(struct intel_dp_link_caps *=
link_caps)
> +static int intel_dp_link_caps_max_common_lane_count(struct intel_dp_link=
_caps *link_caps)
>  {
>  	return link_caps->max_lane_count;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.h
> index 667bd70b2396d..07002d745d384 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -125,7 +125,6 @@ int intel_dp_common_rate(struct intel_dp_link_caps *l=
ink_caps, int index);
>  int intel_dp_link_caps_common_rate_idx(struct intel_dp_link_caps *link_c=
aps, int rate);
>  int intel_dp_max_common_rate(struct intel_dp_link_caps *link_caps);
>  int intel_dp_link_caps_num_common_rates(struct intel_dp_link_caps *link_=
caps);
> -int intel_dp_link_caps_max_common_lane_count(struct intel_dp_link_caps *=
link_caps);
> =20
>  void intel_dp_link_caps_print_common_rates(struct intel_dp_link_caps *li=
nk_caps);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c b/drivers/gpu=
/drm/i915/display/intel_dp_tunnel.c
> index 76e9753766b9f..49fa4c9699b61 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> @@ -58,10 +58,12 @@ static int kbytes_to_mbits(int kbytes)
>  static int get_current_link_bw(struct intel_dp *intel_dp)
>  {
>  	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> -	int rate =3D intel_dp_max_common_rate(link_caps);
> -	int lane_count =3D intel_dp_link_caps_max_common_lane_count(link_caps);
> +	struct intel_dp_link_config max_bw_config;
> =20
> -	return intel_dp_max_link_data_rate(intel_dp, rate, lane_count);
> +	intel_dp_link_caps_get_max_bw_config(link_caps, &max_bw_config);
> +
> +	return intel_dp_max_link_data_rate(intel_dp, max_bw_config.rate,
> +						     max_bw_config.lane_count);
>  }
> =20
>  static int __update_tunnel_state(struct intel_dp *intel_dp, bool force_s=
ink_update)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
