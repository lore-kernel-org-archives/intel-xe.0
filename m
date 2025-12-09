Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062BBD1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 11:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38FF10E52E;
	Tue,  9 Dec 2025 11:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N8aVJgaF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649DF10E52E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JcFxUOmgNuSDUCO45Uc5zrvF65VU+6RTxay3uaVm9nY=; b=N8aVJgaFGglHSOSYCUweRRHOCw
 e8ME9BBb4Pj2gjqdX2HAjgoD6b8WshZg3MpfonRlb6lmNGAVnRPPDQu3qJIH39u3wStVBICeF+qWR
 0zxhUOEHiB7+l1uUU8HM7pAWtwOWCc3O76+kRw8p4WDi97fPIIBuYrZndFTE3DdofMAI3TdgjP3+Q
 aZpRcjY6kuWvTTnTsuzQhyQjuLdaxumEqnrbXKHnBQXLPIZWCqwTABUt9RxL1yxfiectcjUYfUpJ6
 PpGuUJSXjaLTIyOk8yRjk04CBsoiCclxZRfJtc7WGy8sU7cFSbn4HigqONmK3DUqWFQ4G5k131ADk
 cEaVRuZQ==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vSvzc-00ATsd-Kb; Tue, 09 Dec 2025 12:34:57 +0100
Message-ID: <667d66b3-f7e1-4785-8fec-ccaf707628c4@igalia.com>
Date: Tue, 9 Dec 2025 12:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/10] drm/i915/display: Detect AuxCCS support via
 display parent interface
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-10-tursulin@igalia.com> <aTfvCxI7KTZsR3wm@intel.com>
 <aTfyM6H9yUccwoxm@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <aTfyM6H9yUccwoxm@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 09/12/2025 10:56, Ville Syrjälä wrote:
> On Tue, Dec 09, 2025 at 11:42:35AM +0200, Ville Syrjälä wrote:
>> On Mon, Dec 08, 2025 at 08:17:20PM +0100, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Whether AuxCCS can be properly supported depends on the support both from
>>> the display side and non-display side of the driver.
>>>
>>> Let us therefore allow for the non-display part to be queried via the
>>> display parent interface.
>>>
>>> The new interface replaces the HAS_AUX_CCS macro and we also remove the
>>> FIXME from skl_universal_plane_create since now the xe will not advertise
>>> the AuxCCS caps to start with so they do not need to be removed after
>>> enumeration.
>>>
>>> Also, by removing this build specific FIXME we come a step closer to fully
>>> de-coupling display and non-display.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_display_device.h |  1 -
>>>   drivers/gpu/drm/i915/display/intel_fb.c             |  3 ++-
>>>   drivers/gpu/drm/i915/display/intel_parent.c         |  5 +++++
>>>   drivers/gpu/drm/i915/display/intel_parent.h         |  2 ++
>>>   drivers/gpu/drm/i915/display/skl_universal_plane.c  |  9 ++-------
>>>   drivers/gpu/drm/i915/i915_driver.c                  | 10 ++++++++++
>>>   include/drm/intel/display_parent_interface.h        |  3 +++
>>>   7 files changed, 24 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
>>> index 11c2b2883f35..dc61c6560015 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
>>> @@ -149,7 +149,6 @@ struct intel_display_platforms {
>>>   #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
>>>   #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
>>>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>>> -#define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)
>>>   #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
>>>   #define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
>>>   #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
>>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
>>> index b34b4961fe1c..5b8e02ca2faf 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>>> @@ -21,6 +21,7 @@
>>>   #include "intel_fb_bo.h"
>>>   #include "intel_frontbuffer.h"
>>>   #include "intel_panic.h"
>>> +#include "intel_parent.h"
>>>   #include "intel_plane.h"
>>>   
>>>   #define check_array_bounds(display, a, i) drm_WARN_ON((display)->drm, (i) >= ARRAY_SIZE(a))
>>> @@ -558,7 +559,7 @@ static bool plane_has_modifier(struct intel_display *display,
>>>   	 * where supported.
>>>   	 */
>>>   	if (intel_fb_is_ccs_modifier(md->modifier) &&
>>> -	    HAS_AUX_CCS(display) != !!md->ccs.packed_aux_planes)
>>> +	    intel_parent_has_auxccs(display) != !!md->ccs.packed_aux_planes)
>>>   		return false;
>>>   
>>>   	if (md->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
>>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
>>> index 2ea310cc3509..7a55def19836 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_parent.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
>>> @@ -94,3 +94,8 @@ void intel_parent_fence_priority_display(struct intel_display *display, struct d
>>>   	if (display->parent->fence_priority_display)
>>>   		display->parent->fence_priority_display(fence);
>>>   }
>>> +
>>> +bool intel_parent_has_auxccs(struct intel_display *display)
>>> +{
>>> +	return display->parent->has_auxccs && display->parent->has_auxccs(display->drm);
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
>>> index 8f91a6f75c53..f34ee81ed7a1 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_parent.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
>>> @@ -33,4 +33,6 @@ bool intel_parent_has_fenced_regions(struct intel_display *display);
>>>   
>>>   void intel_parent_fence_priority_display(struct intel_display *display, struct dma_fence *fence);
>>>   
>>> +bool intel_parent_has_auxccs(struct intel_display *display);
>>> +
>>>   #endif /* __INTEL_PARENT_H__ */
>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>> index 6cd94f400e3f..7e5dce8cfec0 100644
>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>> @@ -22,6 +22,7 @@
>>>   #include "intel_fbc.h"
>>>   #include "intel_frontbuffer.h"
>>>   #include "intel_panic.h"
>>> +#include "intel_parent.h"
>>>   #include "intel_plane.h"
>>>   #include "intel_psr.h"
>>>   #include "intel_psr_regs.h"
>>> @@ -1602,7 +1603,7 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
>>>   	}
>>>   
>>>   	/* FLAT CCS doesn't need to program AUX_DIST */
>>> -	if (HAS_AUX_CCS(display))
>>> +	if (intel_parent_has_auxccs(display))
>> This is wrong. This is also used for planar formats on
>> pre-icl. I'd just leave it be so that we always write sensible
>> o PLANE_AUX_DIST.
> And maybe s/HAS_AUX_CCS/HAS_AUX_DIST/ or something?

Sure - rename as a separate patch or everything in this one?

Regards,

Tvrtko

