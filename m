Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA5606A327
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cAJ4EsH3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D91123D1;
	Fri, 13 Nov 2026 14:25:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4CB1123D1;
 Fri, 13 Nov 2026 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794579915; x=1826115915;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=J0fv3ru5GGL3AVsUT8wkHqROyNoqVr/vU7yV8itn7xw=;
 b=cAJ4EsH3+1J2TP6BvsV9z6MEUXZ0knUwnI6gKJST/EsO23qg3CfYYdl4
 7apCGJosvuHwVmZL4dL/ixc5fqsZxMLqrl2ourdgWK833MIjJ/spt2JCm
 MQ+599RSFl2HG79bLVusoUqkNBj+OLbiizZYBhHkqxHHnbtJEK6uxAIAg
 SmsAl3es1uaaHJSjgSKvJBRMqJnnIHnO7IifX0til7tbg6RbV3ZkZzz57
 A+TFF+AQ0zTUnaCOLUJ2RzmG1yfYgoxzLo2OFBcXEo8QYiXiQ7thfamlq
 7qAZxQ3J/PmQ4NXgh71tgnC9kGwE/nmcbP0z5s5LlbSUxCbKia5COHX1W Q==;
X-CSE-ConnectionGUID: 21dMQ0MSQAuqNP/pVmjg4Q==
X-CSE-MsgGUID: 5zzgf7ujRwuBx4b+se8vCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3416573"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3416573"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:25:15 -0800
X-CSE-ConnectionGUID: ePECGBF9QXKZXfjgZoaawg==
X-CSE-MsgGUID: JBlGHMveQaKAGEBsx+EiwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; d="scan'208";a="10830458"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:25:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/8] drm/i915/de: Flatten the unclaimed mmio code
In-Reply-To: <20261113134355.14579-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-4-ville.syrjala@linux.intel.com>
Date: Fri, 13 Nov 2026 16:25:10 +0200
Message-ID: <69786f99ddd814e89a22d32367a97cbb64090752@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The unclaimed register access code is nested a few
> too many levels to my linking in places. Flatten it
> all out to make it a bit nicer.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 51 ++++++++++++++-----------
>  1 file changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 8a94f3f1d3ee..06d91570bee2 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -250,11 +250,13 @@ static void check_unclaimed_mmio_pre(struct intel_d=
isplay *display,
>  	if (!display->params.mmio_debug)
>  		return;
>=20=20
> -	if (display->mmio.funcs->check_for_unclaimed_mmio(display))
> -		drm_dbg_kms(display->drm,
> -			    "Unclaimed access detected before %s register 0x%x\n",
> -			    write ? "write to" : "read from",
> -			    i915_mmio_reg_offset(reg));
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
> +		return;
> +
> +	drm_dbg_kms(display->drm,
> +		    "Unclaimed access detected before %s register 0x%x\n",
> +		    write ? "write to" : "read from",
> +		    i915_mmio_reg_offset(reg));
>  }
>=20=20
>  static void check_unclaimed_mmio_post(struct intel_display *display,
> @@ -265,13 +267,16 @@ static void check_unclaimed_mmio_post(struct intel_=
display *display,
>  	if (!display->params.mmio_debug)
>  		return;
>=20=20
> -	if (drm_WARN(display->drm,
> -		     display->mmio.funcs->check_for_unclaimed_mmio(display),
> -		     "Unclaimed %s register 0x%x\n",
> -		     write ? "write to" : "read from",
> -		     i915_mmio_reg_offset(reg)))
> -		/* Only report the first N failures */
> -		display->params.mmio_debug--;
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
> +		return;
> +
> +	drm_WARN(display->drm, true,
> +		 "Unclaimed %s register 0x%x\n",
> +		 write ? "write to" : "read from",
> +		 i915_mmio_reg_offset(reg));
> +
> +	/* Only report the first N failures */
> +	display->params.mmio_debug--;
>  }
>=20=20
>  bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
> @@ -300,18 +305,20 @@ bool intel_de_arm_unclaimed_mmio_detection(struct i=
ntel_display *display)
>  	if (display->mmio.unclaimed_mmio_check <=3D 0)
>  		goto out;
>=20=20
> -	if (display->mmio.funcs->check_for_unclaimed_mmio(display)) {
> -		if (!display->params.mmio_debug) {
> -			drm_dbg_kms(display->drm,
> -				    "Unclaimed register detected, "
> -				    "enabling oneshot unclaimed register reporting. "
> -				    "Please use i915.mmio_debug=3DN for more information.\n");
> -			display->params.mmio_debug++;
> -		}
> -		display->mmio.unclaimed_mmio_check--;
> -		ret =3D true;
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
> +		goto out;
> +
> +	if (!display->params.mmio_debug) {
> +		drm_dbg_kms(display->drm,
> +			    "Unclaimed register detected, "
> +			    "enabling oneshot unclaimed register reporting. "
> +			    "Please use i915.mmio_debug=3DN for more information.\n");
> +		display->params.mmio_debug++;
>  	}
>=20=20
> +	display->mmio.unclaimed_mmio_check--;
> +	ret =3D true;
> +
>  out:
>  	spin_unlock_irq(&display->mmio.lock);

--=20
Jani Nikula, Intel
