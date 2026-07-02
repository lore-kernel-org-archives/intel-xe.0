Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B904C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 10:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B219610E47D;
	Thu,  2 Jul 2026 10:35:21 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1AC10E47D;
 Thu,  2 Jul 2026 10:35:21 +0000 (UTC)
Received: from [62.183.198.118] (helo=[10.147.29.230])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wfElF-00000001MBS-3YGB; Thu, 02 Jul 2026 13:35:18 +0300
Message-ID: <a3f3ae2d7c922699b3b59423f1f6296cab449e33.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 13:35:12 +0300
In-Reply-To: <20260701153204.4124150-12-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-12-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/34] drm/i915/dp_link_caps: Add debugfs entry
 showing allowed configurations
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
> Add a debugfs entry showing the currently allowed link configurations
> in the connector's iteration order.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_caps.c | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/=
gpu/drm/i915/display/intel_dp_link_caps.c
> index 3ef678d47c71b..4482e1f9d6cd8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -1123,6 +1123,43 @@ static int i915_dp_max_lane_count_show(void *data,=
 u64 *val)
>  }
>  DEFINE_DEBUGFS_ATTRIBUTE(i915_dp_max_lane_count_fops, i915_dp_max_lane_c=
ount_show, NULL, "%llu\n");
> =20
> +static int intel_dp_allowed_link_configs_show(struct seq_file *m, void *=
data)
> +{
> +	struct intel_connector *connector =3D to_intel_connector(m->private);
> +	struct intel_display *display =3D to_intel_display(connector);
> +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	int err;
> +	int i;
> +
> +	err =3D drm_modeset_lock_single_interruptible(&display->drm->mode_confi=
g.connection_mutex);
> +	if (err)
> +		return err;
> +
> +	intel_dp_flush_connector_commits(connector);
> +
> +	i =3D 0;
> +	intel_dp_link_caps_iter_start(&iter,
> +				      link_caps,
> +				      intel_dp_link_caps_connector_compute_order(connector),
> +				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		seq_printf(m, "%s%dx%d",
> +			   i ? " " : "",
> +			   link_config.lane_count, link_config.rate);
> +		i++;
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
> +
> +	seq_putc(m, '\n');
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(intel_dp_allowed_link_configs);
> =20
>  /**
>   * intel_dp_link_caps_debugfs_add - add link caps debugfs files for a co=
nnector
> @@ -1149,6 +1186,9 @@ void intel_dp_link_caps_debugfs_add(struct intel_co=
nnector *connector)
> =20
>  	debugfs_create_file("i915_dp_max_lane_count", 0444, root,
>  			    connector, &i915_dp_max_lane_count_fops);
> +
> +	debugfs_create_file("intel_dp_allowed_link_configs", 0444, root,
> +			    connector, &intel_dp_allowed_link_configs_fops);
>  }
> =20
>  struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *inte=
l_dp)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
