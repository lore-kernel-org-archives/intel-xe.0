Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3EFCDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 10:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476CD10EA87;
	Tue, 23 Jun 2026 10:32:08 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274E210EA85;
 Tue, 23 Jun 2026 10:32:07 +0000 (UTC)
Received: from 87-93-171-105.bb.dnainternet.fi ([87.93.171.105]
 helo=[192.168.101.113])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wbyQF-0000000148r-0ijI; Tue, 23 Jun 2026 13:32:05 +0300
Message-ID: <b9eeb884f3bc2a3a8411d30c1236a98a94e8e805.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 13:32:02 +0300
In-Reply-To: <20260616200849.3534628-10-imre.deak@intel.com>
References: <20260616200849.3534628-1-imre.deak@intel.com>
 <20260616200849.3534628-10-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 09/28] drm/i915/dp_link_caps: Move forced link params
 to link_caps
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
> Move tracking of the forced link parameters from struct intel_dp to
> struct intel_dp_link_caps.
>=20
> Previous changes made all users access these parameters through the link
> caps helpers, so the state can now be kept internal to the link caps
> module.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  .../drm/i915/display/intel_display_types.h    |  2 --
>  .../gpu/drm/i915/display/intel_dp_link_caps.c | 30 ++++++++++++++-----
>  2 files changed, 22 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 10933ccdeb31e..c84ef29529373 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1865,8 +1865,6 @@ struct intel_dp {
>  		 */
>  		int mst_probed_lane_count;
>  		int mst_probed_rate;
> -		int force_lane_count;
> -		int force_rate;
>  		struct intel_dp_link_training *training;
>  		struct intel_dp_link_caps *caps;
>  	} link;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index ea90e84500a89..8ecdc01af70eb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -15,6 +15,12 @@
> =20
>  struct intel_dp_link_caps {
>  	struct intel_dp *dp;
> +
> +	/*
> +	 * Forced parameters requested via debugfs. Remains set across sink
> +	 * disconnects.
> +	 */
> +	struct intel_dp_link_config forced_params;
>  };
> =20
>  /* Get length of common rates array potentially limited by max_rate. */
> @@ -44,20 +50,24 @@ int intel_dp_max_common_rate(struct intel_dp *intel_d=
p)
> =20
>  static int forced_lane_count(struct intel_dp *intel_dp)
>  {
> -	if (!intel_dp->link.force_lane_count)
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +
> +	if (!link_caps->forced_params.lane_count)
>  		return 0;
> =20
> -	return clamp(intel_dp->link.force_lane_count, 1, intel_dp_max_common_la=
ne_count(intel_dp));
> +	return clamp(link_caps->forced_params.lane_count,
> +		     1, intel_dp_max_common_lane_count(intel_dp));
>  }
> =20
>  static int forced_link_rate(struct intel_dp *intel_dp)
>  {
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	int len;
> =20
> -	if (!intel_dp->link.force_rate)
> +	if (!link_caps->forced_params.rate)
>  		return 0;
> =20
> -	len =3D intel_dp_common_len_rate_limit(intel_dp, intel_dp->link.force_r=
ate);
> +	len =3D intel_dp_common_len_rate_limit(intel_dp, link_caps->forced_para=
ms.rate);
>  	if (len =3D=3D 0)
>  		return intel_dp_common_rate(intel_dp, 0);
> =20
> @@ -76,6 +86,7 @@ static int i915_dp_force_link_rate_show(struct seq_file=
 *m, void *data)
>  	struct intel_connector *connector =3D to_intel_connector(m->private);
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	int current_rate =3D -1;
>  	int force_rate;
>  	int err;
> @@ -90,7 +101,7 @@ static int i915_dp_force_link_rate_show(struct seq_fil=
e *m, void *data)
>  	if (intel_dp->link.active)
>  		current_rate =3D intel_dp->link_rate;
> =20
> -	force_rate =3D intel_dp->link.force_rate;
> +	force_rate =3D link_caps->forced_params.rate;
> =20
>  	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
> =20
> @@ -150,6 +161,7 @@ static ssize_t i915_dp_force_link_rate_write(struct f=
ile *file,
>  	struct intel_connector *connector =3D to_intel_connector(m->private);
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	int rate;
>  	int err;
> =20
> @@ -164,7 +176,7 @@ static ssize_t i915_dp_force_link_rate_write(struct f=
ile *file,
>  	intel_dp_flush_connector_commits(connector);
> =20
>  	intel_dp_reset_link_params(intel_dp);
> -	intel_dp->link.force_rate =3D rate;
> +	link_caps->forced_params.rate =3D rate;
> =20
>  	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
> =20
> @@ -179,6 +191,7 @@ static int i915_dp_force_lane_count_show(struct seq_f=
ile *m, void *data)
>  	struct intel_connector *connector =3D to_intel_connector(m->private);
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	int current_lane_count =3D -1;
>  	int force_lane_count;
>  	int err;
> @@ -192,7 +205,7 @@ static int i915_dp_force_lane_count_show(struct seq_f=
ile *m, void *data)
> =20
>  	if (intel_dp->link.active)
>  		current_lane_count =3D intel_dp->lane_count;
> -	force_lane_count =3D intel_dp->link.force_lane_count;
> +	force_lane_count =3D link_caps->forced_params.lane_count;
> =20
>  	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
> =20
> @@ -256,6 +269,7 @@ static ssize_t i915_dp_force_lane_count_write(struct =
file *file,
>  	struct intel_connector *connector =3D to_intel_connector(m->private);
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
>  	int lane_count;
>  	int err;
> =20
> @@ -270,7 +284,7 @@ static ssize_t i915_dp_force_lane_count_write(struct =
file *file,
>  	intel_dp_flush_connector_commits(connector);
> =20
>  	intel_dp_reset_link_params(intel_dp);
> -	intel_dp->link.force_lane_count =3D lane_count;
> +	link_caps->forced_params.lane_count =3D lane_count;
> =20
>  	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
> =20
