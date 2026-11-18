Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A177606A320
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYoclehe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1322210FA89;
	Wed, 18 Nov 2026 10:10:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4029B10FA89;
 Wed, 18 Nov 2026 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794996631; x=1826532631;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=j7UNWBY5COpBPBanyRIWe9v6z8A42FoLmoUu2cMl8No=;
 b=ZYocleheuw4kj+Yyi/APV5p8gtYsBawORWOkrNClmr14Txa7r0fRk2et
 yfjpafyFHZ4ZyDLmdYkRveW32ept7TktnXmjy6OCqH/YIRDTFvEdQGFoX
 BM60oppkm7VbU/vHVctLwaDakxhp3lD0wsGrgxP4Orz1EbpUpf/I/CtvT
 bD66OdDob4AkUTcrBmQkSyorExZW5RWhVTqjwRVX7N+XHid8tBxASfNcg
 TfBlNB7T1RRJK1DuVSppLA7VjkXqw/95ndmrQEwTVcPNCHxRoTzmcCHgY
 4yCAb8TG2WV0QFjcLnQD/0LVKdVx1yV1OLznv6THzco9Hlt6mEclFcDyp A==;
X-CSE-ConnectionGUID: flrrBMWGTDOX04z1u6l9bg==
X-CSE-MsgGUID: fr1Ea5OXQI6I0iRtchk/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3802105"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3802105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:10:31 -0800
X-CSE-ConnectionGUID: deKVLGjfQqSFB9DxjdCsGA==
X-CSE-MsgGUID: gU0JDp6MRTCWTWC+m5E8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10376183"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:10:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/8] drm/i915/de: Optimize the mmio_debug checks in
 intel_de_{read, write}()
In-Reply-To: <20261113134355.14579-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-6-ville.syrjala@linux.intel.com>
Date: Wed, 18 Nov 2026 12:10:27 +0200
Message-ID: <b3098ad82896ee2cb9be0320c11e6c037217862b@intel.com>
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

On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently we do the "is mmio_debug enabled?" check from
> the non-inlined check_unclaimed_mmio_{pre,post}(). That means
> we pay for two extra function calls for every register access
> even when mmio_debug is disabled.
>
> Inline the checks into the actual intel_de_{read,write}() to
> avoid the pointless overhead. We have to hand hold the compiler
> a bit (by using a bitwise OR instead of logical OR) or else
> it'll emit a separate branch for each boolean.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 44 ++++++++++++++-----------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 5a74cf173cb8..81fd1569bb65 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -242,18 +242,9 @@ static bool vlv_check_for_unclaimed_mmio(struct inte=
l_display *display)
>  	return true;
>  }
>=20=20
> -static bool mmio_debug_is_enabled(struct intel_display *display)
> -{
> -	return READ_ONCE(display->params.mmio_debug) ||
> -		READ_ONCE(display->mmio.mmio_debug_oneshot);
> -}
> -
>  static void check_unclaimed_mmio_pre(struct intel_display *display,
>  				     intel_reg_t reg, bool write)
>  {
> -	if (!mmio_debug_is_enabled(display))
> -		return;
> -
>  	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
>  		return;
>=20=20
> @@ -266,9 +257,6 @@ static void check_unclaimed_mmio_pre(struct intel_dis=
play *display,
>  static void check_unclaimed_mmio_post(struct intel_display *display,
>  				      intel_reg_t reg, bool write)
>  {
> -	if (!mmio_debug_is_enabled(display))
> -		return;
> -
>  	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
>  		return;
>=20=20
> @@ -355,19 +343,29 @@ __mmio_lock_post(struct intel_display *display, uns=
igned long irqflags,
>  		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
>  }
>=20=20
> +static __always_inline bool
> +__mmio_debug_is_enabled(struct intel_display *display)
> +{
> +	/* with || gcc emits two branches for this */
> +	return unlikely(READ_ONCE(display->params.mmio_debug) |

If the module parameter gets reverted back to an int, this'll need

	!!READ_ONCE(display->params.mmio_debug)

if you're keeping the |. But which one's better then, both for
readability and code generation, !! + | or just ||.

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +			READ_ONCE(display->mmio.mmio_debug_oneshot));
> +}
> +
>  static __always_inline void
>  __mmio_unclaimed_pre(struct intel_display *display, intel_reg_t reg,
> -		     const bool write, const unsigned int mmio_flags)
> +		     const bool write, const bool mmio_debug_is_enabled,
> +		     const unsigned int mmio_flags)
>  {
> -	if (mmio_flags & __MMIO_UNCLAIMED)
> +	if (mmio_flags & __MMIO_UNCLAIMED && mmio_debug_is_enabled)
>  		check_unclaimed_mmio_pre(display, reg, write);
>  }
>=20=20
>  static __always_inline void
>  __mmio_unclaimed_post(struct intel_display *display, intel_reg_t reg,
> -		      const bool write, const unsigned int mmio_flags)
> +		      const bool write, const bool mmio_debug_is_enabled,
> +		      const unsigned int mmio_flags)
>  {
> -	if (mmio_flags & __MMIO_UNCLAIMED)
> +	if (mmio_flags & __MMIO_UNCLAIMED && mmio_debug_is_enabled)
>  		check_unclaimed_mmio_post(display, reg, write);
>  }
>=20=20
> @@ -375,6 +373,7 @@ static __always_inline u32
>  __intel_de_read(struct intel_display *display, intel_reg_t reg,
>  		const unsigned int mmio_flags)
>  {
> +	const bool mmio_debug_is_enabled =3D __mmio_debug_is_enabled(display);
>  	unsigned long irqflags;
>  	u32 val;
>=20=20
> @@ -382,11 +381,13 @@ __intel_de_read(struct intel_display *display, inte=
l_reg_t reg,
>=20=20
>  	__mmio_wakelock_pre(display, reg, mmio_flags);
>  	__mmio_lock_pre(display, &irqflags, mmio_flags);
> -	__mmio_unclaimed_pre(display, reg, false, mmio_flags);
> +	__mmio_unclaimed_pre(display, reg, false,
> +			     mmio_debug_is_enabled, mmio_flags);
>=20=20
>  	val =3D __intel_de_read_fw(display, reg);
>=20=20
> -	__mmio_unclaimed_post(display, reg, false, mmio_flags);
> +	__mmio_unclaimed_post(display, reg, false,
> +			      mmio_debug_is_enabled, mmio_flags);
>  	__mmio_lock_post(display, irqflags, mmio_flags);
>  	__mmio_wakelock_post(display, reg, mmio_flags);
>=20=20
> @@ -397,17 +398,20 @@ static __always_inline void
>  __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
>  		 const unsigned int mmio_flags)
>  {
> +	const bool mmio_debug_is_enabled =3D __mmio_debug_is_enabled(display);
>  	unsigned long irqflags;
>=20=20
>  	assert_display_rpm_held(display);
>=20=20
>  	__mmio_wakelock_pre(display, reg, mmio_flags);
>  	__mmio_lock_pre(display, &irqflags, mmio_flags);
> -	__mmio_unclaimed_pre(display, reg, true, mmio_flags);
> +	__mmio_unclaimed_pre(display, reg, true,
> +			     mmio_debug_is_enabled, mmio_flags);
>=20=20
>  	__intel_de_write_fw(display, reg, val);
>=20=20
> -	__mmio_unclaimed_post(display, reg, true, mmio_flags);
> +	__mmio_unclaimed_post(display, reg, true,
> +			      mmio_debug_is_enabled, mmio_flags);
>  	__mmio_lock_post(display, irqflags, mmio_flags);
>  	__mmio_wakelock_post(display, reg, mmio_flags);
>  }

--=20
Jani Nikula, Intel
