Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D3C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 16:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150F110E7D9;
	Tue, 21 Mar 2023 16:12:42 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A612D10E7DD
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679415160; x=1710951160;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/5OdkHo5JzYcP9O27etH2Ujjgi417eVprNF1+RAvxBk=;
 b=aM/SAQ8v/+UADvGNbY2n3gKKTJfJD3GefuUirQVpUESYlg9SFTZFPSzk
 5LpvzrMi5ES+xHXJU/PY+P9RSA0ln92rcC7dD3ZbH8LH+/McKKk3cVQeK
 WbkjCbKbv944KyZl76jOz//XxxLFdzKm2HVbJCcnLUIwWv+y5Y7Licfxf
 xlh2GoKU5PMix96sPjWl02QM229idRpphUflriYWg82cl7GgSnfS3pr4h
 e22o9WD+FB9o9g5Ki/+Ur4sld9cQbWqoAvcok26FJsyHfCpXrvLaeOXJh
 kteV+mJ2l5+bzDMMBwUqcq1nJ83cNbx+Zs0bF9qFCrcVaJ9lwLX60Vxy0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322828514"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="322828514"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 09:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674894311"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674894311"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 09:08:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <87v8iu6qc1.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230321160420.1352889-1-jani.nikula@intel.com>
 <87v8iu6qc1.fsf@intel.com>
Date: Tue, 21 Mar 2023 18:08:39 +0200
Message-ID: <87sfdy6q9k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/i915/rps: split out display rps parts to
 a separate file
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
Cc: lucas.demarchi@intel.com, Ville =?utf-8?B?U3ly?= =?utf-8?B?asOkbMOk?=
 <ville.syrjala@linux.intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> Split out the RPS parts so they can be conditionally compiled out later.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20230302164936.30341=
61-1-jani.nikula@intel.com
>> (cherry picked from commit 6dbbff25b39565c801c87379bc85933fb436518e)
>>
>> ---
>>
>> Here's an example of an upstream i915 commit that can help clean up
>> cherry-pick as well as cleanup of the #ifdefs in one go, otherwise it
>> breaks bisect.
>
> *sigh* I had something more here, but having #ifdef first on a line
> dropped it as comments, and turned it into nonsense.
>
> It's a backport of upstream i915 commit to help clean up #ifdefs, but
> how do we want to handle them?

Moreover, even if we're stalling with adding such #ifdefs to upstream
i915 now, we can however clean up existing usage in the xe branch to be
more suitable for upstream. For example, I'd take the #ifdefs here
pretty much without issues.

BR,
Jani.


>
>
>> ---
>>  drivers/gpu/drm/i915/Makefile                 |  1 +
>>  .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++-----------------
>>  .../gpu/drm/i915/display/intel_display_rps.c  | 81 ++++++++++++++++++
>>  .../gpu/drm/i915/display/intel_display_rps.h  | 34 ++++++++
>>  4 files changed, 123 insertions(+), 78 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefi=
le
>> index ae9259ab3261..f689132e1506 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -239,6 +239,7 @@ i915-y +=3D \
>>  	display/intel_display_power.o \
>>  	display/intel_display_power_map.o \
>>  	display/intel_display_power_well.o \
>> +	display/intel_display_rps.o \
>>  	display/intel_dmc.o \
>>  	display/intel_dpio_phy.o \
>>  	display/intel_dpll.o \
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers=
/gpu/drm/i915/display/intel_atomic_plane.c
>> index 3d37f44ec835..e666a5c1fd91 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> @@ -34,13 +34,10 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_fourcc.h>
>>=20=20
>> -#ifdef I915
>> -#include "gt/intel_rps.h"
>> -#endif
>> -
>>  #include "i915_config.h"
>>  #include "intel_atomic_plane.h"
>>  #include "intel_cdclk.h"
>> +#include "intel_display_rps.h"
>>  #include "intel_display_trace.h"
>>  #include "intel_display_types.h"
>>  #include "intel_fb.h"
>> @@ -951,66 +948,6 @@ int intel_atomic_plane_check_clipping(struct intel_=
plane_state *plane_state,
>>  	return 0;
>>  }
>>=20=20
>> -#ifdef I915
>> -struct wait_rps_boost {
>> -	struct wait_queue_entry wait;
>> -
>> -	struct drm_crtc *crtc;
>> -	struct i915_request *request;
>> -};
>> -
>> -static int do_rps_boost(struct wait_queue_entry *_wait,
>> -			unsigned mode, int sync, void *key)
>> -{
>> -	struct wait_rps_boost *wait =3D container_of(_wait, typeof(*wait), wai=
t);
>> -	struct i915_request *rq =3D wait->request;
>> -
>> -	/*
>> -	 * If we missed the vblank, but the request is already running it
>> -	 * is reasonable to assume that it will complete before the next
>> -	 * vblank without our intervention, so leave RPS alone.
>> -	 */
>> -	if (!i915_request_started(rq))
>> -		intel_rps_boost(rq);
>> -	i915_request_put(rq);
>> -
>> -	drm_crtc_vblank_put(wait->crtc);
>> -
>> -	list_del(&wait->wait.entry);
>> -	kfree(wait);
>> -	return 1;
>> -}
>> -
>> -static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
>> -				       struct dma_fence *fence)
>> -{
>> -	struct wait_rps_boost *wait;
>> -
>> -	if (!dma_fence_is_i915(fence))
>> -		return;
>> -
>> -	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>> -		return;
>> -
>> -	if (drm_crtc_vblank_get(crtc))
>> -		return;
>> -
>> -	wait =3D kmalloc(sizeof(*wait), GFP_KERNEL);
>> -	if (!wait) {
>> -		drm_crtc_vblank_put(crtc);
>> -		return;
>> -	}
>> -
>> -	wait->request =3D to_request(dma_fence_get(fence));
>> -	wait->crtc =3D crtc;
>> -
>> -	wait->wait.func =3D do_rps_boost;
>> -	wait->wait.flags =3D 0;
>> -
>> -	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>> -}
>> -#endif
>> -
>>  /**
>>   * intel_prepare_plane_fb - Prepare fb for usage on plane
>>   * @_plane: drm plane to prepare for
>> @@ -1102,13 +1039,13 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>  		dma_resv_iter_begin(&cursor, obj->base.resv,
>>  				    DMA_RESV_USAGE_WRITE);
>>  		dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> -			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>> -						   fence);
>> +			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>> +							     fence);
>>  		}
>>  		dma_resv_iter_end(&cursor);
>>  	} else {
>> -		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>> -					   new_plane_state->uapi.fence);
>> +		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>> +						     new_plane_state->uapi.fence);
>>  	}
>>=20=20
>>  	/*
>> @@ -1119,10 +1056,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>  	 * that are not quite steady state without resorting to forcing
>>  	 * maximum clocks following a vblank miss (see do_rps_boost()).
>>  	 */
>> -	if (!state->rps_interactive) {
>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, true);
>> -		state->rps_interactive =3D true;
>> -	}
>> +	intel_display_rps_mark_interactive(dev_priv, state, true);
>>=20=20
>>  	return 0;
>>=20=20
>> @@ -1159,12 +1093,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>>  	if (!obj)
>>  		return;
>>=20=20
>> -#ifdef I915
>> -	if (state->rps_interactive) {
>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
>> -		state->rps_interactive =3D false;
>> -	}
>> -#endif
>> +	intel_display_rps_mark_interactive(dev_priv, state, false);
>>=20=20
>>  	/* Should only be called after a successful intel_prepare_plane_fb()! =
*/
>>  	intel_plane_unpin_fb(old_plane_state);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/=
gpu/drm/i915/display/intel_display_rps.c
>> new file mode 100644
>> index 000000000000..918d0327169a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
>> @@ -0,0 +1,81 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_vblank.h>
>> +
>> +#include "gt/intel_rps.h"
>> +#include "i915_drv.h"
>> +#include "intel_display_rps.h"
>> +#include "intel_display_types.h"
>> +
>> +struct wait_rps_boost {
>> +	struct wait_queue_entry wait;
>> +
>> +	struct drm_crtc *crtc;
>> +	struct i915_request *request;
>> +};
>> +
>> +static int do_rps_boost(struct wait_queue_entry *_wait,
>> +			unsigned mode, int sync, void *key)
>> +{
>> +	struct wait_rps_boost *wait =3D container_of(_wait, typeof(*wait), wai=
t);
>> +	struct i915_request *rq =3D wait->request;
>> +
>> +	/*
>> +	 * If we missed the vblank, but the request is already running it
>> +	 * is reasonable to assume that it will complete before the next
>> +	 * vblank without our intervention, so leave RPS alone.
>> +	 */
>> +	if (!i915_request_started(rq))
>> +		intel_rps_boost(rq);
>> +	i915_request_put(rq);
>> +
>> +	drm_crtc_vblank_put(wait->crtc);
>> +
>> +	list_del(&wait->wait.entry);
>> +	kfree(wait);
>> +	return 1;
>> +}
>> +
>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>> +					  struct dma_fence *fence)
>> +{
>> +	struct wait_rps_boost *wait;
>> +
>> +	if (!dma_fence_is_i915(fence))
>> +		return;
>> +
>> +	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>> +		return;
>> +
>> +	if (drm_crtc_vblank_get(crtc))
>> +		return;
>> +
>> +	wait =3D kmalloc(sizeof(*wait), GFP_KERNEL);
>> +	if (!wait) {
>> +		drm_crtc_vblank_put(crtc);
>> +		return;
>> +	}
>> +
>> +	wait->request =3D to_request(dma_fence_get(fence));
>> +	wait->crtc =3D crtc;
>> +
>> +	wait->wait.func =3D do_rps_boost;
>> +	wait->wait.flags =3D 0;
>> +
>> +	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>> +}
>> +
>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>> +					struct intel_atomic_state *state,
>> +					bool interactive)
>> +{
>> +	if (state->rps_interactive =3D=3D interactive)
>> +		return;
>> +
>> +	intel_rps_mark_interactive(&to_gt(i915)->rps, interactive);
>> +	state->rps_interactive =3D interactive;
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.h b/drivers/=
gpu/drm/i915/display/intel_display_rps.h
>> new file mode 100644
>> index 000000000000..2cfb8a303b77
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __INTEL_DISPLAY_RPS_H__
>> +#define __INTEL_DISPLAY_RPS_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct dma_fence;
>> +struct drm_crtc;
>> +struct drm_i915_private;
>> +struct intel_atomic_state;
>> +
>> +#ifdef I915
>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>> +					  struct dma_fence *fence);
>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>> +					struct intel_atomic_state *state,
>> +					bool interactive);
>> +#else
>> +static inline void intel_display_rps_boost_after_vblank(struct drm_crtc=
 *crtc,
>> +							struct dma_fence *fence)
>> +{
>> +}
>> +static inline void intel_display_rps_mark_interactive(struct drm_i915_p=
rivate *i915,
>> +						      struct intel_atomic_state *state,
>> +						      bool interactive)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* __INTEL_DISPLAY_RPS_H__ */

--=20
Jani Nikula, Intel Open Source Graphics Center
