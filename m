Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361CE606A327
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAsH0HPJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B6A10E36D;
	Fri, 13 Nov 2026 14:13:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072C410EC2E;
 Fri, 13 Nov 2026 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794579175; x=1826115175;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CIRvsBrRtil9bs4i8c/Bp0xzjeZ+KwclHQo1UvuRCAE=;
 b=XAsH0HPJgdX8Njcj8JKoctmX8Ca6hchTvV9S3bFKzWIa7Lkg2N7aGhfF
 HI1fOm9fp+aDe18sqfsCbJeW8/gzaAewMMSbdmPKqIlht/8xA7j3JTtsv
 tfE7kNGpI+2b1F0oJNW8iovlvpgE3mDKuyPN+f2C74OIOxSHmdGIS9mRR
 QzykenY1e76F9ImbFSa+oF7Fy6Wk19bgqflbeQikOi1Z1DEwgmYXsGmE3
 0C2u69Rwx0pvtyTWKYzM/luClLXnWhFiflv7pCEygDY7MXt3s+NvlnZ9F
 Eq6TgArx8slRx4p4LWTaVOsCI7LQy6JkLPXJOBttQOOLCsXGcjuGhykrn w==;
X-CSE-ConnectionGUID: sbT/7k+pRwO8QgU7Daj0yw==
X-CSE-MsgGUID: pnSag+VIT9WiXwaGGt4CHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3275660"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3275660"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:12:54 -0800
X-CSE-ConnectionGUID: FuALAJ94TVqeaw12csjy/g==
X-CSE-MsgGUID: 6SMdzXJ2TsCcgryx637+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9093730"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 06:12:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/8] drm/i915/de: Pimp the intel_de_{read, write}_fw() docs
In-Reply-To: <20261113134355.14579-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-3-ville.syrjala@linux.intel.com>
Date: Fri, 13 Nov 2026 16:12:51 +0200
Message-ID: <f472ab77b47162fac4185465c3e19956d4e7d43e@intel.com>
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Include a bit more guidance on when to use or not use
> intel_de_{read,write}_fw(), and what the extra caveats
> are.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index a6dcb91b36f2..2c469a2d6a20 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -87,12 +87,19 @@ int intel_de_wait_for_clear_ms(struct intel_display *=
display, intel_reg_t reg,
>  			       u32 mask, unsigned int timeout_ms);
>=20=20
>  /*
> - * Unlocked mmio-accessors, think carefully before using these.
> + * Unlocked mmio-accessors, think carefully before using these. Generall=
y only
> + * highly performance sensitive code should use these (eg. vblank evade =
critical
> + * section, or interrupt handlers).
>   *
>   * Certain architectures will die if the same cacheline is concurrently =
accessed
> - * by different clients (e.g. on Ivybridge). Access to registers should
> - * therefore generally be serialised, by either the dev_priv->uncore.loc=
k or
> + * by different clients (e.g. on Ivybridge/Haswell). Access to registers=
 should
> + * therefore generally be serialised, by either the display->mmio.lock or
>   * a more localised lock guarding all access to that bank of registers.
> + *
> + * DMC wakelock will not be taken by these. It must be done manually,
> + * if needed.

Is there anything we could mention here about what "if needed" really
means?

Regardless,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> + *
> + * These will also skip the mmio_debug unclaimed register detection.
>   */
>  u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
>  void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u=
32 val);

--=20
Jani Nikula, Intel
