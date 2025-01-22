Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5515C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 10:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E71F10E2FE;
	Wed, 22 Jan 2025 10:19:40 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662E10E2FE;
 Wed, 22 Jan 2025 10:19:39 +0000 (UTC)
Received: from 91-155-255-183.elisa-laajakaista.fi ([91.155.255.183]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1taXpg-00000003zem-3bdA; Wed, 22 Jan 2025 12:19:37 +0200
Message-ID: <540ff319476ce72f625d1c2205fbd4eb2f726333.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 12:19:35 +0200
In-Reply-To: <20250117220747.87927-4-gustavo.sousa@intel.com>
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
 <20250117220747.87927-4-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] drm/i915/dmc_wl: Add extra_ranges debugfs
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

On Fri, 2025-01-17 at 19:06 -0300, Gustavo Sousa wrote:
> We already have a way of finding the set of untracked offsets for which
> there has been one or more MMIO operations via the
> "intel_dmc_wl/untracked" debugfs interface.
>=20
> However, in order to try adding one or more of those registers to the
> set of tracked offsets, one would need to manually change the source
> code and re-compile the driver.
>=20
> To make debugging easier, also add a "intel_dmc_wl/extra_ranges" debugfs
> interface so that extra offsets to be tracked can be defined during
> runtime, removing the need of re-compilation or even module reloading.
>=20
> With "intel_dmc_wl/untracked" and "intel_dmc_wl/extra_ranges", one could
> even come up with a search algorithm to find missing offsets when
> debugging a failing test case in a similar fashion to git-bisect. Such
> an algorithm is subject for a future tool, probably implemented in
> another repository (e.g. IGT).
>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---

Some comments below.


[...]
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl_debugfs.c b/driver=
s/gpu/drm/i915/display/intel_dmc_wl_debugfs.c
> index 41e59d775fe5..1493d296ac98 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl_debugfs.c

[...]
> +bool intel_dmc_wl_debugfs_offset_in_extra_ranges(struct intel_display *d=
isplay, u32 offset)
> +{
> +	struct intel_dmc_wl_dbg *dbg =3D &display->wl.dbg;
> +	bool ret =3D false;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dbg->lock, flags);
> +
> +	if (!dbg->extra_ranges)
> +		goto out_unlock;
> +
> +	for (int i =3D 0; dbg->extra_ranges[i].start; i++) {
> +		u32 end =3D dbg->extra_ranges[i].end ?: dbg->extra_ranges[i].start;
> +
> +		if (dbg->extra_ranges[i].start <=3D offset && offset <=3D end) {
> +			ret =3D true;
> +			goto out_unlock;
> +		}
> +	}
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&dbg->lock, flags);
> +
> +	return ret;
> +}

This function is probably almost identical than the one used to check
the hard-coded ranges, isn't it? In that case, couldn't you just pass
the ranges array (in this case dbg->extra_ranges) to the same function?


> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl_debugfs.h b/driver=
s/gpu/drm/i915/display/intel_dmc_wl_debugfs.h
> index 9437c324966f..ae61217a2789 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl_debugfs.h
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl_debugfs.h
> @@ -11,6 +11,11 @@
> =20
>  struct intel_display;
> =20
> +struct intel_dmc_wl_dbg_extra_range {
> +	u32 start;
> +	u32 end;
> +};
> +

Why do you need another struct for this?

[...]

--
Cheers,
Luca.

