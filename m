Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1128606A32C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O4y25JDf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BE3112E7B;
	Fri,  6 Nov 2026 15:38:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E09112E67;
 Fri,  6 Nov 2026 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793979509; x=1825515509;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LlS/SBUAjppr7Kd/jXlDvJqyp5f47N68iFe5CqN5fhs=;
 b=O4y25JDfw22L87LVFWu1W2dJizpHDHyrUSN/FXkTosRuf32YxRn9h+eW
 lZDWaU8ZLZbak+XS7i0YwtcmxjgAPDlXab6G1Yixbm11Brwftj0BBLjjb
 BNljW0mGBAyIwj2dQbQTKTi2u7uOtrn7ZOnTwdLWmlezXzqWXUsyOozVA
 zWDfy0AQgmbeaNQUMQGlA7zMaxBWObAIVGgte0oDE03TaDTyZKse6IKWm
 JeFU7c63qDlkXL1UPjM19NT8Hhj7YXgoZkHg07uvvII4YNDom4jT3h99t
 zt0rD5CdF3uDlXkFpioJ2fKVvB0FBLVMNXXu7RkaNCQwVbANeVPrtSRmu A==;
X-CSE-ConnectionGUID: Djgr8fTdQvWvpA3GIggAYw==
X-CSE-MsgGUID: R1Rmb6obTKOGRsv83d/HBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2663573"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2663573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:38:29 -0800
X-CSE-ConnectionGUID: zoTiAObDT/Ke0/lD8hiAnA==
X-CSE-MsgGUID: AVQAAuDrQbGwTmI+FMIFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7630321"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:38:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/i915/de: Stop using intel_uncore_{read,write}()
In-Reply-To: <20261104221842.18799-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-9-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 17:37:59 +0200
Message-ID: <24b36f993e343935ae34e0671d8cb8935caebb95@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Stop using the heavier intel_uncore_{read,write}() and
> just use intel_uncore_{read,write}_fw() for all display
> register accesses.
>
> The main functional change here is that we now stop
> grabbing uncore.lock for display registers. Its job
> is now fully taken over by the display mmio.lock.
>
> The one little thing we want to keep from the uncore
> implementation is the runtime pm asserts (sadly xe
> doesn't implement them, but i915 does). We have the
> parent interface for it, so just use it. That is one
> extra vfunc call, but not sure there's any way around
> it.
>
> One somewhat unexpected side effect (or bonus) is that
> on ILK we also lose ilk_dummy_write(), which is currently
> done ahead of all (non-fw) mmio accesses. The only
> purpose of the dummy write is to wake the GT from
> RC6 ahead of the actual mmio access. Display has
> nothing to do with RC6, and I don't think we actually
> ever enabled RC6 on ILK, so the whole thing is pointless.
>
> As a result of eliminating ilk_dummy_write() display
> register accesses become faster on ILK (numbers in
> nanoseconds):
>       | fw  |   non-fw   |
> read  | 140 | 430 -> 140 |
> write | 170 | 470 -> 170 |
>
> Register accesses on TGL also get a bit faster,
> compared against the original code before the
> display mmio vfuncs were introduced:
>       | fw  |   non-fw   | theoretical non-fw(*)
> read  | 230 | 970 -> 840 | 2*230+230 =3D 690
> write | 100 | 820 -> 740 | 2*230+100 =3D 560
>
> (*) two FPGA_DBG reads + the actual register access
>
> I presume the improvement was due to some combination of
> eliminating the extra debug lock and just reducing the
> runtime overhead in general. The remaining delta between
> theory and practice seems to be mostly due to mmio.lock.
> We'll probably want to think of ways to eliminate the lock
> entirely, on the platforms that don't need it for register
> access serialization...
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I guess would like to see mmio tracing pulled into display side too.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 0a51105e0fba..397145bc7e5b 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -9,6 +9,7 @@
>=20=20
>  #include "intel_de.h"
>  #include "intel_display_regs.h"
> +#include "intel_display_rpm.h"
>=20=20
>  static int intel_de_wait_for_register(struct intel_display *display,
>  				      intel_reg_t reg, u32 mask, u32 value,
> @@ -341,11 +342,13 @@ __intel_de_read(struct intel_display *display, inte=
l_reg_t reg,
>  	unsigned long irqflags;
>  	u32 val;
>=20=20
> +	assert_display_rpm_held(display);
> +
>  	__mmio_wakelock_pre(display, reg, mmio_flags);
>  	__mmio_lock_pre(display, &irqflags, mmio_flags);
>  	__mmio_unclaimed_pre(display, reg, false, mmio_flags);
>=20=20
> -	val =3D intel_uncore_read(__to_uncore(display), reg);
> +	val =3D intel_de_read_fw(display, reg);
>=20=20
>  	__mmio_unclaimed_post(display, reg, false, mmio_flags);
>  	__mmio_lock_post(display, irqflags, mmio_flags);
> @@ -360,11 +363,13 @@ __intel_de_write(struct intel_display *display, int=
el_reg_t reg, u32 val,
>  {
>  	unsigned long irqflags;
>=20=20
> +	assert_display_rpm_held(display);
> +
>  	__mmio_wakelock_pre(display, reg, mmio_flags);
>  	__mmio_lock_pre(display, &irqflags, mmio_flags);
>  	__mmio_unclaimed_pre(display, reg, true, mmio_flags);
>=20=20
> -	intel_uncore_write(__to_uncore(display), reg, val);
> +	intel_de_write_fw(display, reg, val);
>=20=20
>  	__mmio_unclaimed_post(display, reg, true, mmio_flags);
>  	__mmio_lock_post(display, irqflags, mmio_flags);

--=20
Jani Nikula, Intel
