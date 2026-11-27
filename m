Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07D606A332
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jNe/wAgy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42F910E3FC;
	Fri, 27 Nov 2026 14:32:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BB910E3FC;
 Fri, 27 Nov 2026 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795789932; x=1827325932;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zAkTtfYlMeY0MXNOAiOs3w7VPPBTT3+ri7gR4Gq3M/o=;
 b=jNe/wAgycDuTnRxLFjvRZX3WqNjmHIdxV4ELtqAFq7npDrRotwlOPznu
 d9amFy18IN4YhDxyyLxzB0lsod53HG89JNxfiekv3lZOcfCynS4JSHw5Y
 FsKCykkq6FGMVQ7C0dlOy0f5ebV47gYcC/aHCaBiNjKjTviFZsZiwMVR4
 DyOwRDKJbpXmkeNRb1SjBrs5WRqhdESMtjCqus3zfA1X+0S9a/YdVBwTM
 EJuXbYHRJ9qqwQyeUbUuPAGC04u/ly7c8n4OQhBYvCcWkPHycTHyuaInG
 FeY8T6Cjul0PznsdzSfDd5ZkbUX4gachXHNC5hMPrRiLRVHJQwOVxWvjB Q==;
X-CSE-ConnectionGUID: usF6ISfWSN+BkmB5fYSaTw==
X-CSE-MsgGUID: A0IAP5fnSAGzJmmWd9FzCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4752543"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4752543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:32:11 -0800
X-CSE-ConnectionGUID: sceTVb7GSumDmyFZ8nO6SQ==
X-CSE-MsgGUID: II9epvaVQoqmxYm8OKVOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12193533"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 06:32:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/7] drm/i915/de: Move the register tracepoint to display
In-Reply-To: <20261126212728.9034-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
 <20261126212728.9034-2-ville.syrjala@linux.intel.com>
Date: Fri, 27 Nov 2026 16:32:06 +0200
Message-ID: <773de96611b8e4085d51239fb04a8a54c5a01ff7@intel.com>
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

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Implement the register read/write tracepoint directly in display
> code. The goal is to eliminate the uncore stuff completely
> and this is one step towards it.
>
> Having a display exclusive tracepoint does mean that one has
> to enable both the core xe/i915 tracepoint and the display
> tracepoint to get a full view of the system (ignoring all
> the completely untraced exceptions in i915). But in general
> I think this is an improvement for pure display work as you
> no longer have to filter out all kinds of irrelevant registers.
> The only thing I might end up missing from the core side is
> the top level interrupt registers. With just the display
> tracepoint enabled you'll not catch those.
>
> Until we eliminate the remaining uncore usage you will see
> double traces for display registers on xe if you have
> both tracepoints enabled. i915 does not trace the _fw()
> stuff (which we use to implement the display register
> accessors) so on i915 you will get just the display traces
> for display registers.
>
> Support for 64bit register values is dropped since we
> don't use those in the display. The few 64bit registers that
> we have in display are accessed as a pair of 32bit registers.
>
> The display code always passed 'true' as the condition to the
> i915 tracpoint, so there is no point in making the new
> tracepoint conditional.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c       | 21 ++++++++++++----
>  .../drm/i915/display/intel_display_trace.h    | 24 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index bb008e1ee8fd..fe77e8769c9b 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -10,8 +10,8 @@
>  #include "intel_de.h"
>  #include "intel_display_regs.h"
>  #include "intel_display_rpm.h"
> +#include "intel_display_trace.h"
>  #include "intel_uncore.h"
> -#include "intel_uncore_trace.h"
>=20=20
>  static inline struct intel_uncore *__to_uncore(struct intel_display *dis=
play)
>  {
> @@ -151,25 +151,36 @@ int intel_de_wait_for_clear_ms(struct intel_display=
 *display, intel_reg_t reg,
>=20=20
>  u8 intel_de_read8(struct intel_display *display, intel_reg_t reg)
>  {
> +	u8 val;
> +
>  	/* this is only used on VGA registers (possible on pre-g4x) */
>  	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 5 || display->platf=
orm.g4x);
>=20=20
> -	return intel_uncore_read8(__to_uncore(display), reg);
> +	val =3D intel_uncore_read8(__to_uncore(display), reg);
> +	trace_intel_reg_rw(false, reg, val, sizeof(val));
> +
> +	return val;
>  }
>=20=20
>  void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 =
val)
>  {
>  	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 5 || display->platf=
orm.g4x);
>=20=20
> +	trace_intel_reg_rw(true, reg, val, sizeof(val));
>  	intel_uncore_write8(__to_uncore(display), reg, val);
>  }
>=20=20
>  u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
>  {
> +	u16 val;
> +
>  	/* this is only used on MCHBAR registers on pre-SNB */
>  	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 6);
>=20=20
> -	return intel_uncore_read16(__to_uncore(display), reg);
> +	val =3D intel_uncore_read16(__to_uncore(display), reg);
> +	trace_intel_reg_rw(false, reg, val, sizeof(val));
> +
> +	return val;
>  }
>=20=20
>  static __always_inline u32
> @@ -178,7 +189,7 @@ __intel_de_read_fw(struct intel_display *display, int=
el_reg_t reg)
>  	u32 val;
>=20=20
>  	val =3D intel_uncore_read_fw(__to_uncore(display), reg);
> -	trace_i915_reg_rw(false, reg, val, sizeof(val), true);
> +	trace_intel_reg_rw(false, reg, val, sizeof(val));
>=20=20
>  	return val;
>  }
> @@ -186,7 +197,7 @@ __intel_de_read_fw(struct intel_display *display, int=
el_reg_t reg)
>  static __always_inline void
>  __intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 =
val)
>  {
> -	trace_i915_reg_rw(true, reg, val, sizeof(val), true);
> +	trace_intel_reg_rw(true, reg, val, sizeof(val));
>  	intel_uncore_write_fw(__to_uncore(display), reg, val);
>  }
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers=
/gpu/drm/i915/display/intel_display_trace.h
> index 98ba7e20ca30..fe69d203549b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -959,6 +959,30 @@ TRACE_EVENT(intel_frontbuffer_flush,
>  		      __get_str(dev), __entry->frontbuffer_bits, __entry->origin)
>  );
>=20=20
> +TRACE_EVENT(intel_reg_rw,
> +	TP_PROTO(bool write, intel_reg_t reg, u32 val, int len),
> +
> +	TP_ARGS(write, reg, val, len),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, val)
> +		__field(u32, reg)
> +		__field(u16, write)
> +		__field(u16, len)
> +		),
> +
> +	TP_fast_assign(
> +		__entry->val =3D val;
> +		__entry->reg =3D intel_reg_offset(reg);
> +		__entry->write =3D write;
> +		__entry->len =3D len;
> +		),
> +
> +	TP_printk("%s reg=3D0x%x, len=3D%d, val=3D0x%x",
> +		__entry->write ? "write" : "read",
> +		__entry->reg, __entry->len, __entry->val)
> +);
> +
>  #endif /* __INTEL_DISPLAY_TRACE_H__ */
>=20=20
>  /* This part must be outside protection */

--=20
Jani Nikula, Intel
