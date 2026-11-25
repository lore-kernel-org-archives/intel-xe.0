Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679D8606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InLnM+Mu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176EA10E25F;
	Wed, 25 Nov 2026 20:28:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC73410E235;
 Wed, 25 Nov 2026 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795638511; x=1827174511;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YeY2ZrH4AXqpN5OcBPhkMvypYddwljhJESeK2pbuMCk=;
 b=InLnM+Muvs5q6zHHPyytVjueVUsCqbEjDiPMRASl/wceiGuoTNKMvpxb
 D8H+9J6QuM16/y/BANHYLbHQpVLk/ptItiXbhO9FmvSm6ZNWarRT1KMdb
 80SKbXmnyuP+NS/sUUofGaXp2CUFq/Q/dvbKindezHnE0PFupSrakk8Lj
 xzkRdUikJ3Rw4i1uKv9uv9UXNByBT9ZYS+TAFxtzcj+nH5PRl2ySfage+
 8Paq1okzHw4e6Q3PdUbDHxev1MvZczmdT9+le/ERE1LFCjZfrN0ANvVqR
 PyxoTf+RT8zlmEX50Tc2Prgija2WNo7HVZ+9hVR2UDJ9Hlgbzjuwt1EsF g==;
X-CSE-ConnectionGUID: WtptSMvvStqi7hDlJs+p+g==
X-CSE-MsgGUID: 5NPwltzSTGukG2qgYTMwjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4433824"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4433824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 12:28:30 -0800
X-CSE-ConnectionGUID: KV8mkb6XRRKpPJQ/yUZ7Dw==
X-CSE-MsgGUID: uMURZJy7QBmd5AImFLzphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11949957"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 12:28:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/de: Convert mmio.lock to raw spinlock
In-Reply-To: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
Date: Wed, 25 Nov 2026 22:28:25 +0200
Message-ID: <27bf9e1ba664fdac755c6d17126686a4f27ea334@intel.com>
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

On Wed, 25 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> On PREEMPT_RT normal spinlocks turn into sleeping mutexes.
> We want to be able to read registers inside tracepoints
> (which still aren't allowed to sleep on PREEMPT_RT), so
> convert our mmio.lock into a raw spinlock.
>
> The display specific mmio.lock (unlike the old device
> wide uncore.lock) is not held across forcewake waits and
> whatnot, so the lock hold times should be very short.
> Thus a raw spinlock is a good fit here.

Makes sense to me, but Sashiko had some concerns. I didn't analyze them
further.

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>



>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_wm.c            |  6 +++---
>  drivers/gpu/drm/i915/display/intel_de.c           | 10 +++++-----
>  drivers/gpu/drm/i915/display/intel_display_core.h |  2 +-
>  drivers/gpu/drm/i915/display/intel_vblank.c       |  4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i91=
5/display/i9xx_wm.c
> index 46bfada7c060..1c8aaa1ec58f 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_wm.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
> @@ -1889,9 +1889,9 @@ static void vlv_atomic_update_fifo(struct intel_ato=
mic_state *state,
>  	 * parallel updates from multiple pipes.
>  	 *
>  	 * intel_pipe_update_start() has already disabled interrupts
> -	 * for us, so a plain spin_lock() is sufficient here.
> +	 * for us, so a plain raw_spin_lock() is sufficient here.
>  	 */
> -	spin_lock(&display->mmio.lock);
> +	raw_spin_lock(&display->mmio.lock);
>=20=20
>  	switch (crtc->pipe) {
>  	case PIPE_A:
> @@ -1951,7 +1951,7 @@ static void vlv_atomic_update_fifo(struct intel_ato=
mic_state *state,
>=20=20
>  	intel_de_read_fw(display, DSPARB(display));
>=20=20
> -	spin_unlock(&display->mmio.lock);
> +	raw_spin_unlock(&display->mmio.lock);
>  }
>=20=20
>  #undef VLV_FIFO
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index bb008e1ee8fd..5cf8f681c3c8 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -276,9 +276,9 @@ bool intel_de_unclaimed_mmio_detected(struct intel_di=
splay *display)
>  		return false;
>=20=20
>  	if (display->mmio.funcs->check_for_unclaimed_mmio_needs_lock) {
> -		spin_lock_irq(&display->mmio.lock);
> +		raw_spin_lock_irq(&display->mmio.lock);
>  		ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
> -		spin_unlock_irq(&display->mmio.lock);
> +		raw_spin_unlock_irq(&display->mmio.lock);
>  	} else {
>  		ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
>  	}
> @@ -332,7 +332,7 @@ __mmio_lock_pre(struct intel_display *display, unsign=
ed long *irqflags,
>  		const unsigned int mmio_flags)
>  {
>  	if (mmio_flags & __MMIO_LOCK)
> -		spin_lock_irqsave(&display->mmio.lock, *irqflags);
> +		raw_spin_lock_irqsave(&display->mmio.lock, *irqflags);
>  }
>=20=20
>  static __always_inline void
> @@ -340,7 +340,7 @@ __mmio_lock_post(struct intel_display *display, unsig=
ned long irqflags,
>  		 const unsigned int mmio_flags)
>  {
>  	if (mmio_flags & __MMIO_LOCK)
> -		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
> +		raw_spin_unlock_irqrestore(&display->mmio.lock, irqflags);
>  }
>=20=20
>  static __always_inline bool
> @@ -534,7 +534,7 @@ void intel_de_init(struct intel_display *display)
>  {
>  	display->mmio.uncore =3D to_intel_uncore(display->drm);
>=20=20
> -	spin_lock_init(&display->mmio.lock);
> +	raw_spin_lock_init(&display->mmio.lock);
>=20=20
>  	/*
>  	 * TODO: enable unclaimed register detection
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index b422d24e21b2..bc00860c10f1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -540,7 +540,7 @@ struct intel_display {
>  		 * using intel_de_{read,write}(), but not those
>  		 * done using intel_de_{read,write}_fw().
>  		 */
> -		spinlock_t lock;
> +		raw_spinlock_t lock;
>=20=20
>  		struct intel_uncore *uncore;
>  		const struct intel_mmio_funcs *funcs;
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 114ff43381b5..a9be8d4ad2df 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -290,13 +290,13 @@ static int __intel_get_crtc_scanline(struct intel_c=
rtc *crtc)
>  static void intel_vblank_section_enter(struct intel_display *display)
>  	__acquires(display->mmio.lock)
>  {
> -	spin_lock(&display->mmio.lock);
> +	raw_spin_lock(&display->mmio.lock);
>  }
>=20=20
>  static void intel_vblank_section_exit(struct intel_display *display)
>  	__releases(display->mmio.lock)
>  {
> -	spin_unlock(&display->mmio.lock);
> +	raw_spin_unlock(&display->mmio.lock);
>  }
>  #else
>  static void intel_vblank_section_enter(struct intel_display *display)

--=20
Jani Nikula, Intel
