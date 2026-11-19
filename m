Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E11606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaUi/NYy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45A10EB96;
	Thu, 19 Nov 2026 20:57:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FB410E8D5;
 Thu, 19 Nov 2026 20:57:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8DED44EB3;
 Thu, 19 Nov 2026 20:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A86E1F000C6;
 Thu, 19 Nov 2026 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795121853;
 bh=SGR0SzEtmAStTnOW9T6GwZHcfycrUcDc8jiaJNUhELA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BaUi/NYy99bgOplwfe/MeXcIyFdVOAn2jH6T3c+b9LGcFNysXb6cPm3NG4V/dQNHm
 +I7hVFiuFLVuLsjxtSLYwl4qo08pO1ke67CwWczhjCfZFY2YKPPnJlnvRL6jQ1cNsm
 y70Gw+uTTdnCMJ7noylh8W+o1WuEwPgTOcwzriZg7G98TEupVFpg09l6Mn0vLo20SZ
 MAfIO8BdL7pp/ONRoWNQiCigF2V5GvvdeRCvSCCgpXDCDz8b+AqeyxcHPvWGGKEMgW
 H5k9j8mlFNWb7Sgg4wyvHnmlGz7Yqtrq4G5nCEyzuRYeGBxIUb+d63dH6nSLlacpfi
 PzQ41cOma1quw==
Message-ID: <sashiko-outbox-224079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] drm/i915/de: Make mmio_debug lockless
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261119205040.31935-5-ville.syrjala@linux.intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
 <20261119205040.31935-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 20:57:33 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/de: intel_de_arm_unclaimed_mmio_detection() logs
  invalid mmio_debug=3DY
--

commit 61affa910ea8da633b71cb74783032c77e14188a
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/de: Make mmio_debug lockless

This commit converts the unclaimed MMIO debug tracking from lock-protected
read-modify-write counters to lockless booleans, while keeping the
mmio_debug module parameter as an int for compatibility.

> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 17954963ddf98..82ed1c6a55c96 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c

[ ... ]

> @@ -286,43 +287,36 @@ bool intel_de_unclaimed_mmio_detected(struct intel_=
display *display)
>  	if (!display->mmio.funcs->check_for_unclaimed_mmio)
>  		return false;
> =20
> -	spin_lock_irq(&display->mmio.lock);
> -	ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
> -	spin_unlock_irq(&display->mmio.lock);
> +	if (display->mmio.funcs->check_for_unclaimed_mmio_needs_lock) {
> +		spin_lock_irq(&display->mmio.lock);
> +		ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
> +		spin_unlock_irq(&display->mmio.lock);
> +	} else {
> +		ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
> +	}
> =20
>  	return ret;
>  }
> =20
>  bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
>  {
> -	bool ret =3D false;
> -
> -	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> +	if (!READ_ONCE(display->mmio.unclaimed_mmio_check))
>  		return false;
> =20
> -	spin_lock_irq(&display->mmio.lock);
> -
> -	if (display->mmio.unclaimed_mmio_check <=3D 0)
> -		goto out;
> -
> -	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
> -		goto out;
> +	if (!intel_de_unclaimed_mmio_detected(display))
> +		return false;
> =20
> -	if (!display->params.mmio_debug) {
> +	if (!READ_ONCE(display->params.mmio_debug)) {
>  		drm_dbg_kms(display->drm,
>  			    "Unclaimed register detected, "
>  			    "enabling oneshot unclaimed register reporting. "
> -			    "Please use i915.mmio_debug=3DN for more information.\n");
> -		display->params.mmio_debug++;
> +			    "Please use i915.mmio_debug=3DY for more information.\n");
> +		WRITE_ONCE(display->mmio.mmio_debug_oneshot, true);
>  	}

[Severity: Low]
Should this message suggest i915.mmio_debug=3D1 instead of i915.mmio_debug=
=3DY?

Because mmio_debug remains an int module parameter, param_set_int() rejects
"Y" with -EINVAL and prevents the i915 module from loading when a user
passes i915.mmio_debug=3DY on the command line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119205040.3193=
5-1-ville.syrjala@linux.intel.com?part=3D4
