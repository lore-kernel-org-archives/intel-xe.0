Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A2C43602
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509F010F2D5;
	Thu,  2 Jul 2026 11:06:25 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C61C10F2CB;
 Thu,  2 Jul 2026 11:06:23 +0000 (UTC)
Received: from [62.183.198.118] (helo=[10.147.29.230])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wfFFJ-00000001MFc-299v; Thu, 02 Jul 2026 14:06:21 +0300
Message-ID: <f1fea9a8679405d066dae779085448f7f3978442.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 14:06:16 +0300
In-Reply-To: <20260701153204.4124150-14-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-14-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 13/34] drm/i915/dp_link_caps: Add helper to query max
 BW link configuration
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
> Add a helper to query the link configuration among the currently allowed
> configurations with the maximum link BW.
>=20
> This will be used by follow-up changes to unify the max BW link config
> query during mode validation and TBT BW calculation.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_caps.c   | 17 +++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_caps.h   |  3 +++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index d00bb8047de2f..c209c8a935234 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -550,6 +550,23 @@ bool intel_dp_link_caps_get_max_config(struct intel_=
dp_link_caps *link_caps,
>  	return true;
>  }
> =20
> +/**
> + * intel_dp_link_caps_get_max_bw_config - get maximum BW link configurat=
ion
> + * @link_caps: link capabilities state
> + * @max_config: returned maximum link configuration
> + *
> + * Return the maximum BW link configuration among the currently
> + * allowed configurations.
> + */
> +void intel_dp_link_caps_get_max_bw_config(struct intel_dp_link_caps *lin=
k_caps,
> +					  struct intel_dp_link_config *max_config)
> +{
> +	if (!intel_dp_link_caps_get_max_config(link_caps,
> +					       bw_desc_config_order().key, INTEL_DP_LINK_CAPS_FILTER_ALL,
> +					       max_config))
> +		*max_config =3D INTEL_DP_LINK_CONFIG_NULL;
> +}
> +
>  static int find_config_idx(struct intel_dp_link_caps *link_caps,
>  			   struct intel_dp_link_caps_filter filter,
>  			   const struct intel_dp_link_config *link_config)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.h
> index 6dd2ce64e24ed..667bd70b2396d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -146,6 +146,9 @@ bool intel_dp_link_caps_get_max_config(struct intel_d=
p_link_caps *link_caps,
>  				       struct intel_dp_link_caps_filter filter,
>  				       struct intel_dp_link_config *max_config);
> =20
> +void intel_dp_link_caps_get_max_bw_config(struct intel_dp_link_caps *lin=
k_caps,
> +					  struct intel_dp_link_config *max_config);
> +
>  void intel_dp_link_caps_get_max_limits(struct intel_dp_link_caps *link_c=
aps,
>  				       struct intel_dp_link_config *max_link_limits);
>  bool intel_dp_link_caps_set_max_limits(struct intel_dp_link_caps *link_c=
aps,

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
