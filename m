Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D092DCE7B1C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 14:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D49010E0D1;
	Fri,  6 Sep 2024 14:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKZbBb1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C8610E0B4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725632314; x=1757168314;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Etf4zrdFZpDn70iRz7lf8b/zyCkLqxABAHHM+/4nVYY=;
 b=gKZbBb1DO09+Ura+aTu+3IOxRgjek4wB9shSthDxRAJkIwx7TCFhlT1z
 XlNaPA6xiWMudQ/tGhlCbnR4hSoceQ0eQfKIzYCjwpV2D+vPahlXAiizO
 if/4kscny3VXFL0F/b7R+bE30VOdIu/tXFkZygkrNqGxNC8n/hE7LZdIw
 QJkEnMqgjqUCiAb1VzSjcHTXY6LJqK49s9yweex3RDu2TCZoJgZsKdyzg
 OXE+ak2ke4vcQfbKGDABTVW3VTwUmtaFGBphcL49yE19u6loeGPoCfRQH
 L+n8XGYDlrLKT5nyjBF4qwQpdSxGrBm9UfS7ptoEZQxW9Vqvlex1Dhf31 A==;
X-CSE-ConnectionGUID: 9mWIRn/ZQ7yU/21qtBGCyw==
X-CSE-MsgGUID: FuY4rXLoQhWVuMb5qj3E9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34989339"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="34989339"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:18:33 -0700
X-CSE-ConnectionGUID: iVkExR5qT8S8nqivbGEhdQ==
X-CSE-MsgGUID: KTRizeAyRuyDCL9FdtUB4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70379876"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:18:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
In-Reply-To: <ybknt6v4oc6fyn35kvgpb6rtr7tamw5jn6gae5oxluo63x7rfw@und53xxy5n4y>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240906070133.3843174-1-nemesa.garg@intel.com>
 <87frqdnp09.fsf@intel.com>
 <ybknt6v4oc6fyn35kvgpb6rtr7tamw5jn6gae5oxluo63x7rfw@und53xxy5n4y>
Date: Fri, 06 Sep 2024 17:18:25 +0300
Message-ID: <87plpgn9vy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 06 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Sep 06, 2024 at 11:51:50AM GMT, Jani Nikula wrote:
>>
>>Cc: Rodrigo and Lucas, note for you at the end.
>>
>>On Fri, 06 Sep 2024, Nemesa Garg <nemesa.garg@intel.com> wrote:
>>> Disable the support for odd x pan for NV12 format as underrun
>>> issue is seen.
>>>
>>> WA: 16024459452
>>>
>>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>>> ---
>>>  .../gpu/drm/i915/display/intel_atomic_plane.c    | 16 ++++++++++++++--
>>>  drivers/gpu/drm/i915/display/intel_display_wa.h  |  2 ++
>>>  drivers/gpu/drm/xe/display/xe_display_wa.c       |  5 +++++
>>>  3 files changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>> index e979786aa5cf..9b17321f3477 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>> @@ -47,11 +47,13 @@
>>>  #include "intel_display_rps.h"
>>>  #include "intel_display_trace.h"
>>>  #include "intel_display_types.h"
>>> +#include "intel_display_wa.h"
>>>  #include "intel_fb.h"
>>>  #include "intel_fb_pin.h"
>>>  #include "skl_scaler.h"
>>>  #include "skl_watermark.h"
>>>
>>> +
>>
>>Superfluous newline.
>>
>>>  static void intel_plane_state_reset(struct intel_plane_state *plane_state,
>>>  				    struct intel_plane *plane)
>>>  {
>>> @@ -1029,8 +1031,18 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>>>  		 * This allows NV12 and P0xx formats to have odd size and/or odd
>>>  		 * source coordinates on DISPLAY_VER(i915) >= 20
>>>  		 */
>>> -		hsub = 1;
>>> -		vsub = 1;
>>> +
>>> +		/*
>>> +		 * Wa_16023981245 for display version 20.
>>> +		 * Do not support odd x-panning for NV12.
>>> +		 */
>>> +		if (intel_display_needs_wa_16023981245(i915) &&
>>> +		    fb->format->format == DRM_FORMAT_NV12) {
>>> +			vsub = 1;
>>> +		} else {
>>> +			hsub = 1;
>>> +			vsub = 1;
>>> +		}
>>
>>Nitpick, the whole thing could be simplified to only touch hsub since
>>the w/a is about x-panning and vsub is the same in both branches.
>>
>>>  	} else {
>>>  		hsub = fb->format->hsub;
>>>  		vsub = fb->format->vsub;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
>>> index be644ab6ae00..9be35a751503 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
>>> @@ -14,8 +14,10 @@ void intel_display_wa_apply(struct drm_i915_private *i915);
>>>
>>>  #ifdef I915
>>>  static inline bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915) { return false; }
>>> +static inline bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915) { return false; }
>>>  #else
>>>  bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915);
>>> +bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915);
>>>  #endif
>>>
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
>>> index 68e3d1959ad6..fde4e09589a3 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
>>> @@ -14,3 +14,8 @@ bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915)
>>>  {
>>>  	return XE_WA(xe_root_mmio_gt(i915), 16023588340);
>>>  }
>>> +
>>> +bool intel_display_needs_wa_16023981245(struct drm_i915_private *i915)
>>> +{
>>> +	return XE_WA(xe_root_mmio_gt(i915), 22019338487_display);
>>
>>16023981245 vs 22019338487 and not explained in the commit message?!?
>>
>>Rodrigo, Lucas, I think we're going to need to handle display
>>workarounds separately in i915 display. I'm fine with merging this now,
>>it's not a big deal, but this interface is not future compatible.
>>
>>The first step could be simply converting these two to the old style
>>workarounds in i915 display, i.e. just checking for display version or
>>platform directly, and later adding wa infrastructure similar to what xe
>>has, but for display only.
>
> Do you expect any WA like this to be enabled for both xe and i915? There
> are no platform with i915 and display_ver == 20.  I think for past
> platforms, just following the display version and platform check is fine.
> For newer ones, where there's only support in xe, we use the xe way.

Consider having an independent intel-display.ko that caters for display
IP support, regardless of whether it's being used by i915 or xe.

From that perspective, any interfaces like this become increasingly
weird. Display code should depend on its own platform, display version
and stepping identification, also for workarounds.

The xe_wa_oob.rules file doesn't have a single display version or
stepping check. There's a single display w/a that looks at
PLATFORM(LUNARLAKE). And that's all it can do. Nowadays xe core doesn't
have the information on display version or stepping. It has no business
looking at the guts of struct intel_display to figure it out.

BR,
Jani.


>
> Lucas De Marchi
>
>>
>>BR,
>>Jani.
>>
>>
>>
>>> +}
>>
>>
>>
>>
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
