Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA9C0218C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 10:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9F10E6A9;
	Wed, 22 Jan 2025 10:24:48 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E203B10E2FE;
 Wed, 22 Jan 2025 10:24:46 +0000 (UTC)
Received: from 91-155-255-183.elisa-laajakaista.fi ([91.155.255.183]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1taXue-00000003zfN-2pEf; Wed, 22 Jan 2025 12:24:44 +0200
Message-ID: <08e1dba99b68f2bfc575585ba9f22ee0d1daf852.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 12:24:43 +0200
In-Reply-To: <20250117220747.87927-5-gustavo.sousa@intel.com>
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
 <20250117220747.87927-5-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-1 
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] drm/i915/dmc_wl: Enable the debugfs only with
 enable_dmc_wl_debugfs=1
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
> We use a spinlock to protect DMC wakelock debugfs data, since it is also
> accessed by the core DMC wakelock logic. Taking the spinlock when the
> debugfs is not in use introduces a small but unnecessary penalty.
>=20
> Since the debugfs functionality is only expected to be used for, uh,
> debugging sessions, let's protect it behind a module parameter
> enable_dmc_wl_debugfs. That way, we only take the lock if the feature
> was enabled in the first place.
>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---

Looks good.  With a small optional nitpick below.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

[...]
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/driver=
s/gpu/drm/i915/display/intel_display_params.c
> index c4f1ab43fc0c..bc36d1b0ef87 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -479,9 +488,14 @@ void intel_dmc_wl_debugfs_log_untracked(struct intel=
_display *display, u32 offse
>  bool intel_dmc_wl_debugfs_offset_in_extra_ranges(struct intel_display *d=
isplay, u32 offset)
>  {
>  	struct intel_dmc_wl_dbg *dbg =3D &display->wl.dbg;
> -	bool ret =3D false;
> +	bool ret;

Why not keep this as it was...

>  	unsigned long flags;
> =20
> +	if (!display->params.enable_dmc_wl_debugfs)
> +		return false;
> +
> +	ret =3D false;
> +

...then you don't need to set it here, and can return ret in the if
above for consistency.

--
Cheers,
Luca.
