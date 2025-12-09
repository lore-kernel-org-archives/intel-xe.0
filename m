Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AF8D1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 11:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8780910E533;
	Tue,  9 Dec 2025 11:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZW4kYjzh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1AE10E533
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UilLj8XDDLS43nd+WrcYlm39RNd2dIEP/Hisy55OMaE=; b=ZW4kYjzhMt/+IYNf/bSI36TBbt
 L+jbGvK6UHz9o5RoKnuBR+KgElJ7QKFPIK/yatwC1KBUij4r2x8oCQ017MLIzpAkCfa7t4i2IbiZF
 SS+9vQR1iYg9zdfNKP/U+dl2bn8Kn4/2o/UtVlrLIFwlqZAH8aOc4xlEW/vHOqmDx1pFRDtloMsEH
 otcO43gipafWudfJ33uSjj9fnWNvG/FR6m/iAknG2RaLqg7laVgoExkr6Qpmk7SpXdIpbBnMvLcbZ
 jXpHzR7rHOmw6zBdRGk4EJRfuVPUb0aUoKv7WRweTqi/IPDUGsh921zhQvCoRa4ADAfIn3p2WRDCc
 jcDNKPjA==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vSw2x-00ATvU-3X; Tue, 09 Dec 2025 12:38:23 +0100
Message-ID: <c38cbd44-0f44-4d0a-9b34-e943bc27e8ad@igalia.com>
Date: Tue, 9 Dec 2025 12:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/10] drm/i915/display: Detect AuxCCS support via
 display parent interface
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-10-tursulin@igalia.com>
 <c1ad658c6cef76700f12e11fc671fbd6eb302108@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <c1ad658c6cef76700f12e11fc671fbd6eb302108@intel.com>
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


On 09/12/2025 09:31, Jani Nikula wrote:
> On Mon, 08 Dec 2025, Tvrtko Ursulin <tursulin@igalia.com> wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Whether AuxCCS can be properly supported depends on the support both from
>> the display side and non-display side of the driver.
>>
>> Let us therefore allow for the non-display part to be queried via the
>> display parent interface.
>>
>> The new interface replaces the HAS_AUX_CCS macro and we also remove the
>> FIXME from skl_universal_plane_create since now the xe will not advertise
>> the AuxCCS caps to start with so they do not need to be removed after
>> enumeration.
>>
>> Also, by removing this build specific FIXME we come a step closer to fully
>> de-coupling display and non-display.
> This could even be a separate prep patch.

It is standalone anyway so I could easily send it out on its own. 
Actually, to complete the cleanup it will need to be together with the 
HAS_AUX_DIST rename Ville suggested in 9/10. I'll do that then.

Regards,

Tvrtko

>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display_device.h |  1 -
>>   drivers/gpu/drm/i915/display/intel_fb.c             |  3 ++-
>>   drivers/gpu/drm/i915/display/intel_parent.c         |  5 +++++
>>   drivers/gpu/drm/i915/display/intel_parent.h         |  2 ++
>>   drivers/gpu/drm/i915/display/skl_universal_plane.c  |  9 ++-------
>>   drivers/gpu/drm/i915/i915_driver.c                  | 10 ++++++++++
>>   include/drm/intel/display_parent_interface.h        |  3 +++
>>   7 files changed, 24 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
>> index 11c2b2883f35..dc61c6560015 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
>> @@ -149,7 +149,6 @@ struct intel_display_platforms {
>>   #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
>>   #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
>>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>> -#define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)
>>   #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
>>   #define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
>>   #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
>> index b34b4961fe1c..5b8e02ca2faf 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>> @@ -21,6 +21,7 @@
>>   #include "intel_fb_bo.h"
>>   #include "intel_frontbuffer.h"
>>   #include "intel_panic.h"
>> +#include "intel_parent.h"
>>   #include "intel_plane.h"
>>   
>>   #define check_array_bounds(display, a, i) drm_WARN_ON((display)->drm, (i) >= ARRAY_SIZE(a))
>> @@ -558,7 +559,7 @@ static bool plane_has_modifier(struct intel_display *display,
>>   	 * where supported.
>>   	 */
>>   	if (intel_fb_is_ccs_modifier(md->modifier) &&
>> -	    HAS_AUX_CCS(display) != !!md->ccs.packed_aux_planes)
>> +	    intel_parent_has_auxccs(display) != !!md->ccs.packed_aux_planes)
>>   		return false;
>>   
>>   	if (md->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
>> index 2ea310cc3509..7a55def19836 100644
>> --- a/drivers/gpu/drm/i915/display/intel_parent.c
>> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
>> @@ -94,3 +94,8 @@ void intel_parent_fence_priority_display(struct intel_display *display, struct d
>>   	if (display->parent->fence_priority_display)
>>   		display->parent->fence_priority_display(fence);
>>   }
>> +
>> +bool intel_parent_has_auxccs(struct intel_display *display)
>> +{
>> +	return display->parent->has_auxccs && display->parent->has_auxccs(display->drm);
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
>> index 8f91a6f75c53..f34ee81ed7a1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_parent.h
>> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
>> @@ -33,4 +33,6 @@ bool intel_parent_has_fenced_regions(struct intel_display *display);
>>   
>>   void intel_parent_fence_priority_display(struct intel_display *display, struct dma_fence *fence);
>>   
>> +bool intel_parent_has_auxccs(struct intel_display *display);
>> +
>>   #endif /* __INTEL_PARENT_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> index 6cd94f400e3f..7e5dce8cfec0 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> @@ -22,6 +22,7 @@
>>   #include "intel_fbc.h"
>>   #include "intel_frontbuffer.h"
>>   #include "intel_panic.h"
>> +#include "intel_parent.h"
>>   #include "intel_plane.h"
>>   #include "intel_psr.h"
>>   #include "intel_psr_regs.h"
>> @@ -1602,7 +1603,7 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
>>   	}
>>   
>>   	/* FLAT CCS doesn't need to program AUX_DIST */
>> -	if (HAS_AUX_CCS(display))
>> +	if (intel_parent_has_auxccs(display))
>>   		intel_de_write_dsb(display, dsb, PLANE_AUX_DIST(pipe, plane_id),
>>   				   skl_plane_aux_dist(plane_state, color_plane));
>>   
>> @@ -2972,12 +2973,6 @@ skl_universal_plane_create(struct intel_display *display,
>>   	else
>>   		caps = skl_plane_caps(display, pipe, plane_id);
>>   
>> -	/* FIXME: xe has problems with AUX */
>> -	if (!IS_ENABLED(I915) && HAS_AUX_CCS(display))
>> -		caps &= ~(INTEL_PLANE_CAP_CCS_RC |
>> -			  INTEL_PLANE_CAP_CCS_RC_CC |
>> -			  INTEL_PLANE_CAP_CCS_MC);
>> -
>>   	modifiers = intel_fb_plane_get_modifiers(display, caps);
>>   
>>   	ret = drm_universal_plane_init(display->drm, &plane->base,
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index d98839427ef9..59e396a74ca4 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -757,6 +757,15 @@ static void fence_priority_display(struct dma_fence *fence)
>>   		i915_gem_fence_wait_priority_display(fence);
>>   }
>>   
>> +static bool has_auxccs(struct drm_device *drm)
>> +{
>> +	struct drm_i915_private *i915 = to_i915(drm);
>> +
>> +	return IS_GRAPHICS_VER(i915, 9, 12) ||
>> +	       IS_ALDERLAKE_P(i915) ||
>> +	       IS_METEORLAKE(i915);
>> +}
>> +
>>   static const struct intel_display_parent_interface parent = {
>>   	.hdcp = &i915_display_hdcp_interface,
>>   	.rpm = &i915_display_rpm_interface,
>> @@ -765,6 +774,7 @@ static const struct intel_display_parent_interface parent = {
>>   	.vgpu_active = vgpu_active,
>>   	.has_fenced_regions = has_fenced_regions,
>>   	.fence_priority_display = fence_priority_display,
>> +	.has_auxccs = has_auxccs,
>>   };
>>   
>>   const struct intel_display_parent_interface *i915_driver_parent_interface(void)
>> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
>> index 61d1b22adc83..0d79f3c189c3 100644
>> --- a/include/drm/intel/display_parent_interface.h
>> +++ b/include/drm/intel/display_parent_interface.h
>> @@ -80,6 +80,9 @@ struct intel_display_parent_interface {
>>   
>>   	/** @fence_priority_display: Set display priority. Optional. */
>>   	void (*fence_priority_display)(struct dma_fence *fence);
>> +
>> +	/** @has_auxcss: Are AuxCCS formats supported by the parent. Optional. */
>> +	bool (*has_auxccs)(struct drm_device *drm);
>>   };
>>   
>>   #endif

