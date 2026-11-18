Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0722606A320
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mK3eZ/SO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF2810EC42;
	Wed, 18 Nov 2026 17:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644E10FE97;
 Wed, 18 Nov 2026 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795021276; x=1826557276;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6qL+AYOl3XwCwU8XmLtthaNrzMaFqAwFPP7fTAfYrPY=;
 b=mK3eZ/SO9oGAgVmlbPaNqoTz8x1lLZdA9GmELbKh2NCeFte3riumQBtz
 fIPrEkQDtFxqCPf8qVrmB4M4qKKzxapMwqyHjKPDx1/gnDmzO5EwZmlOv
 gp9J9s5THjiJ7oO0WRAkZnRsVJwRvhQ4w5q7L7JlhrAvOzvlViuccIcJo
 rQGJ4kKg/pe/iorL4CanXZ4CjvPnFdWuQZOFgJP2voqr+zUI6MDGRwAN0
 C4nDPYOL+jWOR6HzqZWmZjrex3em5SHiTDUYn2Y2Lv6aR0BIaz3cE6og6
 BYU9NJ5k+rytU/SGZwy33FodLgBFdbqZ5Hr4wihAKJOnc76jejlPD/F1R w==;
X-CSE-ConnectionGUID: mC0elyYLSVGuuz2GL2RgSg==
X-CSE-MsgGUID: EbcWXIORQKWNvS25wRBdrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3833276"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3833276"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:01:16 -0800
X-CSE-ConnectionGUID: DAOp5a8fQbysa1mgIxaSQQ==
X-CSE-MsgGUID: wodZLCU5TL6XtnFenutVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10074409"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:01:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/fb: move intel_dumb_fb_max_stride() to
 intel_fb.[ch]
In-Reply-To: <av3GffVIJ7ZoAViU@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261118134101.3465842-1-jani.nikula@intel.com>
 <av3GffVIJ7ZoAViU@intel.com>
Date: Wed, 18 Nov 2026 19:01:10 +0200
Message-ID: <29eab9520dbe40df4579c5873463d2dfc57854e6@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Nov 18, 2026 at 03:41:01PM +0200, Jani Nikula wrote:
>> Move intel_plane_fb_max_stride() and intel_dumb_fb_max_stride() to
>> intel_fb.[ch], and make the former static as its users are now
>> exclusively in intel_fb.c.
>>=20
>> As a side effect, we can reduce the display include "surface" of
>> i915_gem_create.c, as intel_display.h is quite a big header.
>
> Eventually we should perhaps consider sucking all the exported
> symbols into completely separate headers with nothing else
> in them. But no rush with that I guess.

I've been thinking about that.

Keep the headers in display/ or move to include/drm/intel/?

One big intel_display_api.h header, or multiple _api.h headers?

In the mean time it's helpful to reduce the APIs, there are still too
many. If it's a clean header with a reasonable amount of functions,
maybe a single header works.


BR,
Jani.


>
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 35 -------------------
>>  drivers/gpu/drm/i915/display/intel_display.h |  5 ---
>>  drivers/gpu/drm/i915/display/intel_fb.c      | 36 ++++++++++++++++++++
>>  drivers/gpu/drm/i915/display/intel_fb.h      |  2 ++
>>  drivers/gpu/drm/i915/gem/i915_gem_create.c   |  2 +-
>>  5 files changed, 39 insertions(+), 41 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/=
drm/i915/display/intel_display.c
>> index f4d9148efde3..19caae633d29 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -590,41 +590,6 @@ void intel_disable_transcoder(const struct intel_cr=
tc_state *old_crtc_state)
>>  		intel_wait_for_pipe_off(old_crtc_state);
>>  }
>>=20=20
>> -u32 intel_plane_fb_max_stride(struct intel_display *display,
>> -			      const struct drm_format_info *info,
>> -			      u64 modifier)
>> -{
>> -	struct intel_crtc *crtc;
>> -	struct intel_plane *plane;
>> -
>> -	/*
>> -	 * We assume the primary plane for pipe A has
>> -	 * the highest stride limits of them all,
>> -	 * if in case pipe A is disabled, use the first pipe from pipe_mask.
>> -	 */
>> -	crtc =3D intel_first_crtc(display);
>> -	if (!crtc)
>> -		return 0;
>> -
>> -	plane =3D to_intel_plane(crtc->base.primary);
>> -
>> -	return plane->max_stride(plane, info, modifier,
>> -				 DRM_MODE_ROTATE_0);
>> -}
>> -
>> -u32 intel_dumb_fb_max_stride(struct drm_device *drm,
>> -			     u32 pixel_format, u64 modifier)
>> -{
>> -	struct intel_display *display =3D to_intel_display(drm);
>> -
>> -	if (!HAS_DISPLAY(display))
>> -		return 0;
>> -
>> -	return intel_plane_fb_max_stride(display,
>> -					 drm_get_format_info(drm, pixel_format, modifier),
>> -					 modifier);
>> -}
>> -
>>  void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
>>  			     struct intel_plane_state *plane_state,
>>  			     bool visible)
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/=
drm/i915/display/intel_display.h
>> index d53b7b4a80e7..8bb37dfe47fc 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display.h
>> @@ -356,11 +356,6 @@ void intel_link_compute_m_n(u16 bpp, int nlanes,
>>  			    int pixel_clock, int link_clock,
>>  			    int bw_overhead,
>>  			    struct intel_link_m_n *m_n);
>> -u32 intel_plane_fb_max_stride(struct intel_display *display,
>> -			      const struct drm_format_info *info,
>> -			      u64 modifier);
>> -u32 intel_dumb_fb_max_stride(struct drm_device *drm,
>> -			     u32 pixel_format, u64 modifier);
>>  enum drm_mode_status
>>  intel_mode_valid_max_plane_size(struct intel_display *display,
>>  				const struct drm_display_mode *mode,
>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i=
915/display/intel_fb.c
>> index 9d71f594537f..2c63aeefaea8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/drm_print.h>
>>=20=20
>>  #include "intel_bo.h"
>> +#include "intel_crtc.h"
>>  #include "intel_display.h"
>>  #include "intel_display_core.h"
>>  #include "intel_display_types.h"
>> @@ -1330,6 +1331,41 @@ static bool intel_plane_needs_remap(const struct =
intel_plane_state *plane_state)
>>  	return stride > max_stride;
>>  }
>>=20=20
>> +static u32 intel_plane_fb_max_stride(struct intel_display *display,
>> +				     const struct drm_format_info *info,
>> +				     u64 modifier)
>> +{
>> +	struct intel_crtc *crtc;
>> +	struct intel_plane *plane;
>> +
>> +	/*
>> +	 * We assume the primary plane for pipe A has
>> +	 * the highest stride limits of them all,
>> +	 * if in case pipe A is disabled, use the first pipe from pipe_mask.
>> +	 */
>> +	crtc =3D intel_first_crtc(display);
>> +	if (!crtc)
>> +		return 0;
>> +
>> +	plane =3D to_intel_plane(crtc->base.primary);
>> +
>> +	return plane->max_stride(plane, info, modifier,
>> +				 DRM_MODE_ROTATE_0);
>> +}
>> +
>> +u32 intel_dumb_fb_max_stride(struct drm_device *drm,
>> +			     u32 pixel_format, u64 modifier)
>> +{
>> +	struct intel_display *display =3D to_intel_display(drm);
>> +
>> +	if (!HAS_DISPLAY(display))
>> +		return 0;
>> +
>> +	return intel_plane_fb_max_stride(display,
>> +					 drm_get_format_info(drm, pixel_format, modifier),
>> +					 modifier);
>> +}
>> +
>>  static int convert_plane_offset_to_xy(const struct intel_framebuffer *f=
b, int color_plane,
>>  				      int plane_width, int *x, int *y)
>>  {
>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i=
915/display/intel_fb.h
>> index 0a027e2595b2..ebf6485fd2fd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fb.h
>> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
>> @@ -119,6 +119,8 @@ intel_user_framebuffer_create(struct drm_device *dev,
>>  bool intel_fb_modifier_uses_dpt(struct intel_display *display, u64 modi=
fier);
>>  bool intel_fb_uses_dpt(const struct drm_framebuffer *fb);
>>=20=20
>> +u32 intel_dumb_fb_max_stride(struct drm_device *drm, u32 pixel_format, =
u64 modifier);
>> +
>>  unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier);
>>=20=20
>>  struct drm_gem_object *intel_fb_bo(const struct drm_framebuffer *fb);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_create.c
>> index e12ec59afb8d..c7ebec72a5e5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -6,7 +6,7 @@
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_print.h>
>>=20=20
>> -#include "display/intel_display.h"
>> +#include "display/intel_fb.h"
>>  #include "gem/i915_gem_ioctls.h"
>>  #include "gem/i915_gem_lmem.h"
>>  #include "gem/i915_gem_region.h"
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
