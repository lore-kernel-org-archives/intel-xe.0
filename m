Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A2C606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lekdarka
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACA210F701;
	Wed, 18 Nov 2026 09:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38410F77B;
 Wed, 18 Nov 2026 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794995220; x=1826531220;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HYU5KFU6I7++nx8YaT3klJ+54yrb3XRq/XjHhsS/gu0=;
 b=lekdarkaZkRzn3EUzp5XKN5QmXOqd4kjgA9/+eFhR07zsvbBg04h+O9/
 sTBhMQ+7E4qSzvdJStp9W8RbfA1lAruqI+Rc03pmnp5PZnujKG2yvZKmq
 ld9T256sk/eguzpH+shwx0E1jFTvHRrWkrsRv9X0/4IJ0tvArAy32tr9h
 HUSBzDM/NyF4PfqK1rXSyRllpXvmPVfyKRYPlmAGgHEXuv1rvJZTnSsF4
 ey0jEsRDzFNZHVI6U2OpRnXIqZClob8ILZCs8YMn4XFuLPY0p0uc2QFwX
 L4xKUYgWOQcK46CFS/aPGf0/RY4FRsUCRyNHGbfNdDdBpt+KEGbAhOuas w==;
X-CSE-ConnectionGUID: o5pXJqN6Tki9Dlm8UPpxRA==
X-CSE-MsgGUID: 5PYaczqWTTSPxPkV61Ppkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3679302"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3679302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:46:59 -0800
X-CSE-ConnectionGUID: 3n9z6fAsSUmkhX4b/9AviA==
X-CSE-MsgGUID: oiidN6eVT2qGg+akufhlTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10042512"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:46:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/8] drm/i915/de: Make mmio_debug lockless
In-Reply-To: <avc7C3GbK39VmAzo@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-5-ville.syrjala@linux.intel.com>
 <avc7C3GbK39VmAzo@intel.com>
Date: Wed, 18 Nov 2026 11:46:55 +0200
Message-ID: <8090655c8cb0670c31293d12045072f57893e395@intel.com>
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

On Fri, 13 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Nov 13, 2026 at 03:43:51PM +0200, Ville Syrjala wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Currently we protect the mmio_debug state using mmio.lock.
>> We can't just drop the locks or we risk the read-modify-writes
>> to the modparam to get out of whack. But if we get rid of the
>> read-modify-writes and just switch to simple booleans all
>> we need are loads and stores which are naturally atomic.
>>=20
>> This is of course racy, but quite harmlessly so. Perhaps the
>> worst thing that can happen is that we mistake which register
>> caused the unclaimed access, but that can already happen since
>> we use the completely lockless intel_de_{read,write}_fw() in
>> many places. And a pair of threads getting a bit confused
>> about the state of the booleans should also be harmless. Perhaps
>> we end up doing a few extra unclaimed mmio debug checks while the
>> first thread is already about to disable the thing. No big deal.
>>=20
>> And for good measure, let's annotate the booleans with
>> READ_ONCE()/WRITE_ONCE() to highlight the lockless nature,
>> though I don't think we need those for correctness.
>>=20
>> With the booleans we do lose the capability to set mmio_debug
>> to a specific value, and then automagically disable it once
>> that many unclaimed register accesses have been detected.
>> With the boolean it's mmio_debug all the time or none of
>> the time. Not sure if anyone actually used that feature
>> anyway, so doesn't seem like a big loss to me.
>>=20
>> I do want to preserve the oneshot detection thing automagically
>> armed by intel_de_arm_unclaimed_mmio_detection(). So we need a
>> second boolean for that.
>>=20
>> And the third boolean will be mmio.unclaimed_mmio_check. That
>> was already effectively a boolean, but still being adjusted
>> with rmw.
>>=20
>> The FPGA_DBG/CLAIM_ER accesses done from the read/write vfuncs
>> will still be conditionally protected by the mmio.lock, based
>> on mmio_flags. But the accesses from intel_de_unclaimed_mmio_detected()
>> and intel_de_arm_unclaimed_mmio_detection() need another
>> solution. For that I'm just adding another boolean into the
>> mmio funcs that tells us whether the lock should be taken
>> there or not. Calls to these functions are exceedingly rare
>> so no need to come up with any clever solution here.
>>=20
>> Note that the modparam will now refuse any non-0/1 value, so
>> if anyone has left this enabled accidentally the module will
>> fail to load. But reminding people to turn this off in
>> production is probably a good thing :P
>
> Argh. Apparently igt uses the modparam for some reason. But it
> only sets it to -1, which is the default w/ the debug .config
> anyway. I guess it might make sense for people running the
> w/o all the debug knobs enabled in .config...

Maybe keep the modparam an int, but treat it as bool?

>
>>=20
>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/Kconfig.debug            |  2 +-
>>  drivers/gpu/drm/i915/display/intel_de.c       | 58 +++++++++----------
>>  drivers/gpu/drm/i915/display/intel_de.h       |  1 +
>>  .../gpu/drm/i915/display/intel_display_core.h |  7 +--
>>  .../drm/i915/display/intel_display_params.c   |  4 +-
>>  .../drm/i915/display/intel_display_params.h   |  2 +-
>>  6 files changed, 34 insertions(+), 40 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/K=
config.debug
>> index dc43dcfbadb6..6a020adc43ee 100644
>> --- a/drivers/gpu/drm/i915/Kconfig.debug
>> +++ b/drivers/gpu/drm/i915/Kconfig.debug
>> @@ -76,7 +76,7 @@ config DRM_I915_DEBUG_MMIO
>>  	help
>>  	  By default, always enables the extra sanity checks (extra register
>>  	  reads) around every mmio (register) access that will slow the system
>> -	  down. This sets the default value of i915.mmio_debug to -1 and can
>> +	  down. This sets the default value of i915.mmio_debug to Y and can
>>  	  be overridden at module load.
>>=20=20
>>  	  Recommended for driver developers only.
>> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i=
915/display/intel_de.c
>> index 06d91570bee2..5a74cf173cb8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_de.c
>> +++ b/drivers/gpu/drm/i915/display/intel_de.c
>> @@ -242,12 +242,16 @@ static bool vlv_check_for_unclaimed_mmio(struct in=
tel_display *display)
>>  	return true;
>>  }
>>=20=20
>> +static bool mmio_debug_is_enabled(struct intel_display *display)
>> +{
>> +	return READ_ONCE(display->params.mmio_debug) ||
>> +		READ_ONCE(display->mmio.mmio_debug_oneshot);
>> +}
>> +
>>  static void check_unclaimed_mmio_pre(struct intel_display *display,
>>  				     intel_reg_t reg, bool write)
>>  {
>> -	lockdep_assert_held(&display->mmio.lock);
>> -
>> -	if (!display->params.mmio_debug)
>> +	if (!mmio_debug_is_enabled(display))
>>  		return;
>>=20=20
>>  	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
>> @@ -262,9 +266,7 @@ static void check_unclaimed_mmio_pre(struct intel_di=
splay *display,
>>  static void check_unclaimed_mmio_post(struct intel_display *display,
>>  				      intel_reg_t reg, bool write)
>>  {
>> -	lockdep_assert_held(&display->mmio.lock);
>> -
>> -	if (!display->params.mmio_debug)
>> +	if (!mmio_debug_is_enabled(display))
>>  		return;
>>=20=20
>>  	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
>> @@ -275,8 +277,7 @@ static void check_unclaimed_mmio_post(struct intel_d=
isplay *display,
>>  		 write ? "write to" : "read from",
>>  		 i915_mmio_reg_offset(reg));
>>=20=20
>> -	/* Only report the first N failures */
>> -	display->params.mmio_debug--;
>> +	WRITE_ONCE(display->mmio.mmio_debug_oneshot, false);
>>  }
>>=20=20
>>  bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
>> @@ -286,43 +287,36 @@ bool intel_de_unclaimed_mmio_detected(struct intel=
_display *display)
>>  	if (!display->mmio.funcs->check_for_unclaimed_mmio)
>>  		return false;
>>=20=20
>> -	spin_lock_irq(&display->mmio.lock);
>> -	ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
>> -	spin_unlock_irq(&display->mmio.lock);
>> +	if (display->mmio.funcs->check_for_unclaimed_mmio_needs_lock) {
>> +		spin_lock_irq(&display->mmio.lock);
>> +		ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
>> +		spin_unlock_irq(&display->mmio.lock);
>> +	} else {
>> +		ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
>> +	}
>>=20=20
>>  	return ret;
>>  }
>>=20=20
>>  bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *displa=
y)
>>  {
>> -	bool ret =3D false;
>> -
>> -	if (!display->mmio.funcs->check_for_unclaimed_mmio)
>> +	if (!READ_ONCE(display->mmio.unclaimed_mmio_check))
>>  		return false;
>>=20=20
>> -	spin_lock_irq(&display->mmio.lock);
>> -
>> -	if (display->mmio.unclaimed_mmio_check <=3D 0)
>> -		goto out;
>> -
>> -	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
>> -		goto out;
>> +	if (!intel_de_unclaimed_mmio_detected(display))
>> +		return false;
>>=20=20
>> -	if (!display->params.mmio_debug) {
>> +	if (!READ_ONCE(display->params.mmio_debug)) {
>>  		drm_dbg_kms(display->drm,
>>  			    "Unclaimed register detected, "
>>  			    "enabling oneshot unclaimed register reporting. "
>> -			    "Please use i915.mmio_debug=3DN for more information.\n");
>> -		display->params.mmio_debug++;
>> +			    "Please use i915.mmio_debug=3DY for more information.\n");
>> +		WRITE_ONCE(display->mmio.mmio_debug_oneshot, true);
>>  	}
>>=20=20
>> -	display->mmio.unclaimed_mmio_check--;
>> -	ret =3D true;
>> +	WRITE_ONCE(display->mmio.unclaimed_mmio_check, false);
>>=20=20
>> -out:
>> -	spin_unlock_irq(&display->mmio.lock);
>> -
>> -	return ret;
>> +	return true;
>>  }
>>=20=20
>>  #define __MMIO_WAKELOCK		BIT(0)
>> @@ -474,12 +468,14 @@ static const struct intel_mmio_funcs hsw_mmio_func=
s =3D {
>>  	.read =3D hsw_mmio_read,
>>  	.write =3D hsw_mmio_write,
>>  	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
>> +	.check_for_unclaimed_mmio_needs_lock =3D true,
>>  };
>>=20=20
>>  static const struct intel_mmio_funcs vlv_mmio_funcs =3D {
>>  	.read =3D hsw_mmio_read,
>>  	.write =3D hsw_mmio_write,
>>  	.check_for_unclaimed_mmio =3D vlv_check_for_unclaimed_mmio,
>> +	.check_for_unclaimed_mmio_needs_lock =3D true,
>>  };
>>=20=20
>>  #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
>> @@ -539,7 +535,7 @@ void intel_de_init(struct intel_display *display)
>>  	}
>>=20=20
>>  	if (display->mmio.funcs->check_for_unclaimed_mmio)
>> -		display->mmio.unclaimed_mmio_check =3D 1;
>> +		WRITE_ONCE(display->mmio.unclaimed_mmio_check, true);
>>=20=20
>>  	/* clear out unclaimed reg detection bit someone else left behind */
>>  	if (intel_de_unclaimed_mmio_detected(display))
>> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i=
915/display/intel_de.h
>> index 2c469a2d6a20..cbf44975dced 100644
>> --- a/drivers/gpu/drm/i915/display/intel_de.h
>> +++ b/drivers/gpu/drm/i915/display/intel_de.h
>> @@ -13,6 +13,7 @@ struct intel_mmio_funcs {
>>  	u32 (*read)(struct intel_display *display, intel_reg_t reg);
>>  	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
>>  	bool (*check_for_unclaimed_mmio)(struct intel_display *display);
>> +	bool check_for_unclaimed_mmio_needs_lock;
>>  };
>>=20=20
>>  void intel_de_init(struct intel_display *display);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers=
/gpu/drm/i915/display/intel_display_core.h
>> index d68ecc19b8a8..92a3ce4247b1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
>> @@ -539,17 +539,14 @@ struct intel_display {
>>  		 * serializes all display register accesses done
>>  		 * using intel_de_{read,write}(), but not those
>>  		 * done using intel_de_{read,write}_fw().
>> -		 *
>> -		 * The lock also protects mmio.unclaimed_mmio_check
>> -		 * and read-modify-write of display->params.mmio_debug.
>>  		 */
>>  		spinlock_t lock;
>>=20=20
>>  		struct intel_uncore *uncore;
>>  		const struct intel_mmio_funcs *funcs;
>>=20=20
>> -		/* protected by mmio.lock */
>> -		int unclaimed_mmio_check;
>> +		bool mmio_debug_oneshot;
>> +		bool unclaimed_mmio_check;
>>  	} mmio;
>>=20=20
>>  	struct {
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drive=
rs/gpu/drm/i915/display/intel_display_params.c
>> index ace3081461de..7ef974861c8e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
>> @@ -143,8 +143,8 @@ intel_display_param_named_unsafe(enable_dmc_wl, int,=
 0400,
>>  	"(-1=3Duse per-chip default, 0=3Ddisabled, 1=3Denabled, 2=3Dmatch any =
register, 3=3Dalways locked) "
>>  	"Default: -1");
>>=20=20
>> -intel_display_param_named(mmio_debug, int, 0400,
>> -	"Enable the MMIO debug code for the first N failures (default: off). "
>> +intel_display_param_named(mmio_debug, bool, 0400,
>> +	"Enable MMIO debug code (default: false). "
>>  	"This may negatively affect performance.");
>>=20=20
>>  __maybe_unused
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drive=
rs/gpu/drm/i915/display/intel_display_params.h
>> index bcbca95318d6..f6b9c294840c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
>> @@ -51,7 +51,7 @@ struct drm_printer;
>>  	param(bool, psr_safest_params, false, 0400) \
>>  	param(bool, enable_psr2_sel_fetch, true, 0400) \
>>  	param(int, enable_dmc_wl, -1, 0400) \
>> -	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
>> +	param(bool, mmio_debug, IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
>>  	/*
>>  	 * Debugfs-only knob (per-device): no matching module_param is registe=
red
>>  	 * in intel_display_params.c on purpose. Runtime-toggle via debugfs.
>> --=20
>> 2.56.0

--=20
Jani Nikula, Intel
