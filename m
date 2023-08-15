Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBF9C001DE
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 17:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD19110E265;
	Tue, 15 Aug 2023 17:43:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A12410E256
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692121396; x=1723657396;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=L7CeOlBMnxkd72Gh9ip03meWzbi4t2KVt9k3FNH2WSU=;
 b=AJYKT8pfycYbJgka0/HDG6AzyBxVs1YfTymxOl/XG+BmtX4DYRVKVMiA
 xSbzSDS1Vd8dkaT0xUXn6E6IRGcabRtmOK/mu8XnG9CALBLmVxQMrrYAU
 r59LzANfmKfGjlLCNO5uTGbPbtnxZROO+nk2itxx4UsueWdnA3gh45B0n
 WgsIWr7dnisIpo+T0eoZOqb5TkLifjmWxNlXIRDHt9R6x/3OFkqOBHDFQ
 ijraBxZ9jg9niDm2vuCsJRW3DWSte//M/NwddkXZzMvbjBKY5V21AvsGS
 4wMr3kDBJ/QXPpcgsJ8cRaU0NW3wnDkciA3swVVcA4W7m5m1OxV4+okNU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403317363"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="403317363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 10:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763341585"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="763341585"
Received: from zlukwins-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 10:43:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <303c941b-7d4b-b478-2b39-e438231b4c0c@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230814083744.4408-1-dev@lankhorst.se>
 <20230814083744.4408-2-dev@lankhorst.se> <ZNpymXLxJGhisx6j@intel.com>
 <875y5gd5ha.fsf@intel.com>
 <303c941b-7d4b-b478-2b39-e438231b4c0c@lankhorst.se>
Date: Tue, 15 Aug 2023 20:43:08 +0300
Message-ID: <87h6p0b3rn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 15 Aug 2023, Maarten Lankhorst <dev@lankhorst.se> wrote:
> Even for 1 line changes like this? (Adding an if that is always true on=20
> i915.)

Yes. At the moment the dependencies are pretty complex, because the xe
changes here depend on a lot of xe commits that in turn depend on a
bunch of i915 commits that need to be refactored.

If we can isolate the i915 patches such that they don't depend on
anything and can be queued upstream first thing, it makes our lives
easier.

And obviously it's *much* easier to squash and juggle patches later on
than to split them up.

BR,
Jani.


>
> On 2023-08-15 11:23, Jani Nikula wrote:
>> On Mon, 14 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>> On Mon, Aug 14, 2023 at 10:37:44AM +0200, Maarten Lankhorst wrote:
>>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>
>>>> Just create a dummy to make DPT work.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>   .../drm/i915/display/skl_universal_plane.c    |  3 +-
>>>>   drivers/gpu/drm/xe/Makefile                   |  1 +
>>>>   drivers/gpu/drm/xe/display/xe_dpt.c           | 46 +++++++++++++++++=
++
>>>>   3 files changed, 49 insertions(+), 1 deletion(-)
>>>>   create mode 100644 drivers/gpu/drm/xe/display/xe_dpt.c
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/driv=
ers/gpu/drm/i915/display/skl_universal_plane.c
>>>> index c28f4198aa15..9469ec5a0417 100644
>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>
>>> We need to make i915 and xe changes in separated patches.
>>> Ideally we make all i915 changes in a way that it could even
>>> go directly to drm-intel-next already...
>>=20
>> Yes, please!
>>=20
>> BR,
>> Jani.
>>=20
>>>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>
>>>> @@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_p=
lane_state *plane_state,
>>>>   		 * The DPT object contains only one vma, so the VMA's offset
>>>>   		 * within the DPT is always 0.
>>>>   		 */
>>>> -		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>>>> +		if (plane_state->dpt_vma)
>>>> +			drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>>>>   		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
>>>>   		return offset >> 9;
>>>>   	} else {
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 6d9196ab275c..33bfe33632db 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -141,6 +141,7 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/dr=
m/i915/display/%.c FORCE
>>>>   # Display code specific to xe
>>>>   xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>>>>   	xe_display.o \
>>>> +	display/xe_dpt.o \
>>>>   	display/xe_fb_pin.o \
>>>>   	display/xe_hdcp_gsc.o \
>>>>   	display/xe_plane_initial.o \
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_dpt.c b/drivers/gpu/drm/xe/=
display/xe_dpt.c
>>>> new file mode 100644
>>>> index 000000000000..0695886045e3
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/display/xe_dpt.c
>>>> @@ -0,0 +1,46 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright =C2=A9 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include "intel_dpt.h"
>>>> +
>>>> +#include "i915_reg.h"
>>>> +
>>>> +#include "intel_de.h"
>>>> +#include "intel_display.h"
>>>> +#include "intel_display_types.h"
>>>> +
>>>> +void intel_dpt_destroy(struct i915_address_space *vm)
>>>> +{
>>>> +}
>>>> +
>>>> +struct i915_address_space *
>>>> +intel_dpt_create(struct intel_framebuffer *fb)
>>>> +{
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> +void intel_dpt_configure(struct intel_crtc *crtc)
>>>> +{
>>>> +	struct drm_i915_private *i915 =3D to_i915(crtc->base.dev);
>>>> +
>>>> +	if (DISPLAY_VER(i915) =3D=3D 14) {
>>>> +		enum pipe pipe =3D crtc->pipe;
>>>> +		enum plane_id plane_id;
>>>> +
>>>> +		for_each_plane_id_on_crtc(crtc, plane_id) {
>>>> +			if (plane_id =3D=3D PLANE_CURSOR)
>>>> +				continue;
>>>> +
>>>> +			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
>>>> +				     PLANE_CHICKEN_DISABLE_DPT,
>>>> +				     i915->params.enable_dpt ? 0 : PLANE_CHICKEN_DISABLE_DPT);
>>>> +		}
>>>> +	} else if (DISPLAY_VER(i915) =3D=3D 13) {
>>>> +		intel_de_rmw(i915, CHICKEN_MISC_2,
>>>> +			     CHICKEN_MISC_DISABLE_DPT,
>>>> +			     i915->params.enable_dpt ? 0 : CHICKEN_MISC_DISABLE_DPT);
>>>> +	}
>>>> +}
>>>> +
>>>> --=20
>>>> 2.39.2
>>>>
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
