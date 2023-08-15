Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F95C04A6A
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 13:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B70110E182;
	Tue, 15 Aug 2023 13:13:41 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B34E10E182
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 13:13:40 +0000 (UTC)
Message-ID: <303c941b-7d4b-b478-2b39-e438231b4c0c@lankhorst.se>
Date: Tue, 15 Aug 2023 15:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230814083744.4408-1-dev@lankhorst.se>
 <20230814083744.4408-2-dev@lankhorst.se> <ZNpymXLxJGhisx6j@intel.com>
 <875y5gd5ha.fsf@intel.com>
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <875y5gd5ha.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Implement xe DPT slightly
 differently.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Even for 1 line changes like this? (Adding an if that is always true on 
i915.)

On 2023-08-15 11:23, Jani Nikula wrote:
> On Mon, 14 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Mon, Aug 14, 2023 at 10:37:44AM +0200, Maarten Lankhorst wrote:
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> Just create a dummy to make DPT work.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>   .../drm/i915/display/skl_universal_plane.c    |  3 +-
>>>   drivers/gpu/drm/xe/Makefile                   |  1 +
>>>   drivers/gpu/drm/xe/display/xe_dpt.c           | 46 +++++++++++++++++++
>>>   3 files changed, 49 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/gpu/drm/xe/display/xe_dpt.c
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>> index c28f4198aa15..9469ec5a0417 100644
>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>
>> We need to make i915 and xe changes in separated patches.
>> Ideally we make all i915 changes in a way that it could even
>> go directly to drm-intel-next already...
> 
> Yes, please!
> 
> BR,
> Jani.
> 
>>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>>
>>> @@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
>>>   		 * The DPT object contains only one vma, so the VMA's offset
>>>   		 * within the DPT is always 0.
>>>   		 */
>>> -		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>>> +		if (plane_state->dpt_vma)
>>> +			drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>>>   		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
>>>   		return offset >> 9;
>>>   	} else {
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 6d9196ab275c..33bfe33632db 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -141,6 +141,7 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>>>   # Display code specific to xe
>>>   xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>   	xe_display.o \
>>> +	display/xe_dpt.o \
>>>   	display/xe_fb_pin.o \
>>>   	display/xe_hdcp_gsc.o \
>>>   	display/xe_plane_initial.o \
>>> diff --git a/drivers/gpu/drm/xe/display/xe_dpt.c b/drivers/gpu/drm/xe/display/xe_dpt.c
>>> new file mode 100644
>>> index 000000000000..0695886045e3
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/display/xe_dpt.c
>>> @@ -0,0 +1,46 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include "intel_dpt.h"
>>> +
>>> +#include "i915_reg.h"
>>> +
>>> +#include "intel_de.h"
>>> +#include "intel_display.h"
>>> +#include "intel_display_types.h"
>>> +
>>> +void intel_dpt_destroy(struct i915_address_space *vm)
>>> +{
>>> +}
>>> +
>>> +struct i915_address_space *
>>> +intel_dpt_create(struct intel_framebuffer *fb)
>>> +{
>>> +	return NULL;
>>> +}
>>> +
>>> +void intel_dpt_configure(struct intel_crtc *crtc)
>>> +{
>>> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
>>> +
>>> +	if (DISPLAY_VER(i915) == 14) {
>>> +		enum pipe pipe = crtc->pipe;
>>> +		enum plane_id plane_id;
>>> +
>>> +		for_each_plane_id_on_crtc(crtc, plane_id) {
>>> +			if (plane_id == PLANE_CURSOR)
>>> +				continue;
>>> +
>>> +			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
>>> +				     PLANE_CHICKEN_DISABLE_DPT,
>>> +				     i915->params.enable_dpt ? 0 : PLANE_CHICKEN_DISABLE_DPT);
>>> +		}
>>> +	} else if (DISPLAY_VER(i915) == 13) {
>>> +		intel_de_rmw(i915, CHICKEN_MISC_2,
>>> +			     CHICKEN_MISC_DISABLE_DPT,
>>> +			     i915->params.enable_dpt ? 0 : CHICKEN_MISC_DISABLE_DPT);
>>> +	}
>>> +}
>>> +
>>> -- 
>>> 2.39.2
>>>
> 
