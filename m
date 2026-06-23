Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDC2CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 10:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28A210EA87;
	Tue, 23 Jun 2026 10:34:56 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C48F10EA7C;
 Tue, 23 Jun 2026 10:34:55 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wbySx-0000000149f-3BbP; Tue, 23 Jun 2026 13:34:53 +0300
Message-ID: <8a99585e5d2c7b97cf0aa7c4abbe4bbed9bdece4.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 13:34:50 +0300
In-Reply-To: <20260616200849.3534628-11-imre.deak@intel.com>
References: <20260616200849.3534628-1-imre.deak@intel.com>
 <20260616200849.3534628-11-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/28] drm/i915/dp_link_caps: Move link config
 helpers to link caps
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
> Move the helpers handling link configurations to intel_dp_link_caps.c.
> Their functionality is part of the link capability logic and will be
> updated to use the link capability state in follow-up changes.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.



>  drivers/gpu/drm/i915/display/intel_dp.c       | 101 -----------------
>  drivers/gpu/drm/i915/display/intel_dp.h       |   2 -
>  .../gpu/drm/i915/display/intel_dp_link_caps.c | 102 ++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_caps.h |   5 +
>  4 files changed, 107 insertions(+), 103 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index c4ad386acc6db..c4b650431eff5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -33,7 +33,6 @@
>  #include <linux/notifier.h>
>  #include <linux/seq_buf.h>
>  #include <linux/slab.h>
> -#include <linux/sort.h>
>  #include <linux/string_helpers.h>
>  #include <linux/timekeeping.h>
>  #include <linux/types.h>
> @@ -677,106 +676,6 @@ int intel_dp_rate_index(const int *rates, int len, =
int rate)
>  	return -1;
>  }
> =20
> -static int intel_dp_link_config_rate(struct intel_dp *intel_dp,
> -				     const struct intel_dp_link_config_entry *lc)
> -{
> -	return intel_dp_common_rate(intel_dp, lc->link_rate_idx);
> -}
> -
> -static int intel_dp_link_config_lane_count(const struct intel_dp_link_co=
nfig_entry *lc)
> -{
> -	return 1 << lc->lane_count_exp;
> -}
> -
> -static int intel_dp_link_config_bw(struct intel_dp *intel_dp,
> -				   const struct intel_dp_link_config_entry *lc)
> -{
> -	return drm_dp_max_dprx_data_rate(intel_dp_link_config_rate(intel_dp, lc=
),
> -					 intel_dp_link_config_lane_count(lc));
> -}
> -
> -static int link_config_cmp_by_bw(const void *a, const void *b, const voi=
d *p)
> -{
> -	struct intel_dp *intel_dp =3D (struct intel_dp *)p;	/* remove const */
> -	const struct intel_dp_link_config_entry *lc_a =3D a;
> -	const struct intel_dp_link_config_entry *lc_b =3D b;
> -	int bw_a =3D intel_dp_link_config_bw(intel_dp, lc_a);
> -	int bw_b =3D intel_dp_link_config_bw(intel_dp, lc_b);
> -
> -	if (bw_a !=3D bw_b)
> -		return bw_a - bw_b;
> -
> -	return intel_dp_link_config_rate(intel_dp, lc_a) -
> -	       intel_dp_link_config_rate(intel_dp, lc_b);
> -}
> -
> -static void intel_dp_link_config_init(struct intel_dp *intel_dp)
> -{
> -	struct intel_display *display =3D to_intel_display(intel_dp);
> -	struct intel_dp_link_config_entry *lc;
> -	int num_common_lane_configs;
> -	int i;
> -	int j;
> -
> -	if (drm_WARN_ON(display->drm, !is_power_of_2(intel_dp_max_common_lane_c=
ount(intel_dp))))
> -		return;
> -
> -	num_common_lane_configs =3D ilog2(intel_dp_max_common_lane_count(intel_=
dp)) + 1;
> -
> -	if (drm_WARN_ON(display->drm, intel_dp->num_common_rates * num_common_l=
ane_configs >
> -				    ARRAY_SIZE(intel_dp->link.configs)))
> -		return;
> -
> -	intel_dp->link.num_configs =3D intel_dp->num_common_rates * num_common_=
lane_configs;
> -
> -	lc =3D &intel_dp->link.configs[0];
> -	for (i =3D 0; i < intel_dp->num_common_rates; i++) {
> -		for (j =3D 0; j < num_common_lane_configs; j++) {
> -			lc->lane_count_exp =3D j;
> -			lc->link_rate_idx =3D i;
> -
> -			lc++;
> -		}
> -	}
> -
> -	sort_r(intel_dp->link.configs, intel_dp->link.num_configs,
> -	       sizeof(intel_dp->link.configs[0]),
> -	       link_config_cmp_by_bw, NULL,
> -	       intel_dp);
> -}
> -
> -void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *l=
ink_rate, int *lane_count)
> -{
> -	struct intel_display *display =3D to_intel_display(intel_dp);
> -	const struct intel_dp_link_config_entry *lc;
> -
> -	if (drm_WARN_ON(display->drm, idx < 0 || idx >=3D intel_dp->link.num_co=
nfigs))
> -		idx =3D 0;
> -
> -	lc =3D &intel_dp->link.configs[idx];
> -
> -	*link_rate =3D intel_dp_link_config_rate(intel_dp, lc);
> -	*lane_count =3D intel_dp_link_config_lane_count(lc);
> -}
> -
> -int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate,=
 int lane_count)
> -{
> -	int link_rate_idx =3D intel_dp_rate_index(intel_dp->common_rates, intel=
_dp->num_common_rates,
> -						link_rate);
> -	int lane_count_exp =3D ilog2(lane_count);
> -	int i;
> -
> -	for (i =3D 0; i < intel_dp->link.num_configs; i++) {
> -		const struct intel_dp_link_config_entry *lc =3D &intel_dp->link.config=
s[i];
> -
> -		if (lc->lane_count_exp =3D=3D lane_count_exp &&
> -		    lc->link_rate_idx =3D=3D link_rate_idx)
> -			return i;
> -	}
> -
> -	return -1;
> -}
> -
>  /* Return %true if the common rates changed. */
>  static bool intel_dp_set_common_rates(struct intel_dp *intel_dp)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index 8cc6ea04e000c..fdf9bd88859e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -108,8 +108,6 @@ int intel_dp_config_required_rate(const struct intel_=
crtc_state *crtc_state);
>  int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
>  int intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
>  int intel_dp_rate_index(const int *rates, int len, int rate);
> -int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate,=
 int lane_count);
> -void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *l=
ink_rate, int *lane_count);
>  void intel_dp_update_sink_caps(struct intel_dp *intel_dp);
>  void intel_dp_reset_link_params(struct intel_dp *intel_dp);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index 8ecdc01af70eb..6a37ba8c35e27 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -4,7 +4,9 @@
>   */
> =20
>  #include <linux/debugfs.h>
> +#include <linux/log2.h>
>  #include <linux/slab.h>
> +#include <linux/sort.h>
> =20
>  #include <drm/drm_print.h>
> =20
> @@ -81,6 +83,106 @@ void intel_dp_link_caps_get_forced_params(struct inte=
l_dp_link_caps *link_caps,
>  	forced_params->lane_count =3D forced_lane_count(link_caps->dp);
>  }
> =20
> +static int intel_dp_link_config_rate(struct intel_dp *intel_dp,
> +				     const struct intel_dp_link_config_entry *lc)
> +{
> +	return intel_dp_common_rate(intel_dp, lc->link_rate_idx);
> +}
> +
> +static int intel_dp_link_config_lane_count(const struct intel_dp_link_co=
nfig_entry *lc)
> +{
> +	return 1 << lc->lane_count_exp;
> +}
> +
> +static int intel_dp_link_config_bw(struct intel_dp *intel_dp,
> +				   const struct intel_dp_link_config_entry *lc)
> +{
> +	return drm_dp_max_dprx_data_rate(intel_dp_link_config_rate(intel_dp, lc=
),
> +					 intel_dp_link_config_lane_count(lc));
> +}
> +
> +static int link_config_cmp_by_bw(const void *a, const void *b, const voi=
d *p)
> +{
> +	struct intel_dp *intel_dp =3D (struct intel_dp *)p;	/* remove const */
> +	const struct intel_dp_link_config_entry *lc_a =3D a;
> +	const struct intel_dp_link_config_entry *lc_b =3D b;
> +	int bw_a =3D intel_dp_link_config_bw(intel_dp, lc_a);
> +	int bw_b =3D intel_dp_link_config_bw(intel_dp, lc_b);
> +
> +	if (bw_a !=3D bw_b)
> +		return bw_a - bw_b;
> +
> +	return intel_dp_link_config_rate(intel_dp, lc_a) -
> +	       intel_dp_link_config_rate(intel_dp, lc_b);
> +}
> +
> +void intel_dp_link_config_init(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_dp_link_config_entry *lc;
> +	int num_common_lane_configs;
> +	int i;
> +	int j;
> +
> +	if (drm_WARN_ON(display->drm, !is_power_of_2(intel_dp_max_common_lane_c=
ount(intel_dp))))
> +		return;
> +
> +	num_common_lane_configs =3D ilog2(intel_dp_max_common_lane_count(intel_=
dp)) + 1;
> +
> +	if (drm_WARN_ON(display->drm, intel_dp->num_common_rates * num_common_l=
ane_configs >
> +				    ARRAY_SIZE(intel_dp->link.configs)))
> +		return;
> +
> +	intel_dp->link.num_configs =3D intel_dp->num_common_rates * num_common_=
lane_configs;
> +
> +	lc =3D &intel_dp->link.configs[0];
> +	for (i =3D 0; i < intel_dp->num_common_rates; i++) {
> +		for (j =3D 0; j < num_common_lane_configs; j++) {
> +			lc->lane_count_exp =3D j;
> +			lc->link_rate_idx =3D i;
> +
> +			lc++;
> +		}
> +	}
> +
> +	sort_r(intel_dp->link.configs, intel_dp->link.num_configs,
> +	       sizeof(intel_dp->link.configs[0]),
> +	       link_config_cmp_by_bw, NULL,
> +	       intel_dp);
> +}
> +
> +void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *l=
ink_rate, int *lane_count)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	const struct intel_dp_link_config_entry *lc;
> +
> +	if (drm_WARN_ON(display->drm, idx < 0 || idx >=3D intel_dp->link.num_co=
nfigs))
> +		idx =3D 0;
> +
> +	lc =3D &intel_dp->link.configs[idx];
> +
> +	*link_rate =3D intel_dp_link_config_rate(intel_dp, lc);
> +	*lane_count =3D intel_dp_link_config_lane_count(lc);
> +}
> +
> +int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate,=
 int lane_count)
> +{
> +	int link_rate_idx =3D intel_dp_rate_index(intel_dp->common_rates, intel=
_dp->num_common_rates,
> +						link_rate);
> +	int lane_count_exp =3D ilog2(lane_count);
> +	int i;
> +
> +	for (i =3D 0; i < intel_dp->link.num_configs; i++) {
> +		const struct intel_dp_link_config_entry *lc =3D &intel_dp->link.config=
s[i];
> +
> +		if (lc->lane_count_exp =3D=3D lane_count_exp &&
> +		    lc->link_rate_idx =3D=3D link_rate_idx)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
>  static int i915_dp_force_link_rate_show(struct seq_file *m, void *data)
>  {
>  	struct intel_connector *connector =3D to_intel_connector(m->private);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.h
> index c6a84891db464..dab956e804b95 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -17,6 +17,11 @@ int intel_dp_max_common_rate(struct intel_dp *intel_dp=
);
>  void intel_dp_link_caps_get_forced_params(struct intel_dp_link_caps *lin=
k_caps,
>  					  struct intel_dp_link_config *forced_params);
> =20
> +int intel_dp_link_config_index(struct intel_dp *intel_dp, int link_rate,=
 int lane_count);
> +void intel_dp_link_config_get(struct intel_dp *intel_dp, int idx, int *l=
ink_rate, int *lane_count);
> +
> +void intel_dp_link_config_init(struct intel_dp *intel_dp);
> +
>  void intel_dp_link_caps_debugfs_add(struct intel_connector *connector);
> =20
>  struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *inte=
l_dp);
