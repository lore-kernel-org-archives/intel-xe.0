Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65D6C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 09:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFEA10E8C7;
	Wed, 22 Mar 2023 09:15:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CE210E8C7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476510; x=1711012510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/+S5Smae55BrbbBMwzp1ZdXlq1J49wEENS7CPmm2C4I=;
 b=Di5c2WEURHaMcajDMx4yxGBRsM7jcCH1Ic2X01wvbmKIYzoaea6auWV7
 /XNZL8jnAqusrKR/Jpee7Ko+OysLGHhL2kMJBwNuCUy2WkMZCde6MMoC9
 xBYF3SoWtBFKL3DaO4s5vV/p0cSVPbS6Tv4lQmtgbdGa3wLEBC4mjy8Qy
 uq8UszQCT+sAzLQqrjrK7Eip3K19fBqCt1g1tLNoyJqsruvN21SPyNjVL
 r/E5f0oLSJV7EocNY0uFuzpI54m6TttIUwTYjr9DyyRkArS7/d66uHEym
 2YrRSSjLm4zYtZFqtLSvxM09YRCo0UdM0gMe9ns+Tk8fcjthik20RC3MS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319557757"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="319557757"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684232508"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="684232508"
Received: from jprokopo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.221])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:15:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20230321230448.rkgnfemrg4ehwfat@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230321160420.1352889-1-jani.nikula@intel.com>
 <87v8iu6qc1.fsf@intel.com> <87sfdy6q9k.fsf@intel.com>
 <20230321230448.rkgnfemrg4ehwfat@ldmartin-desk2.lan>
Date: Wed, 22 Mar 2023 11:15:05 +0200
Message-ID: <87pm916tba.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Mar 21, 2023 at 06:08:39PM +0200, Jani Nikula wrote:
>>On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>> On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>> Split out the RPS parts so they can be conditionally compiled out late=
r.
>>>>
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>>> Link: https://patchwork.freedesktop.org/patch/msgid/20230302164936.303=
4161-1-jani.nikula@intel.com
>>>> (cherry picked from commit 6dbbff25b39565c801c87379bc85933fb436518e)
>>>>
>>>> ---
>>>>
>>>> Here's an example of an upstream i915 commit that can help clean up
>>>> cherry-pick as well as cleanup of the #ifdefs in one go, otherwise it
>>>> breaks bisect.
>>>
>>> *sigh* I had something more here, but having #ifdef first on a line
>>> dropped it as comments, and turned it into nonsense.
>>>
>>> It's a backport of upstream i915 commit to help clean up #ifdefs, but
>>> how do we want to handle them?
>>
>>Moreover, even if we're stalling with adding such #ifdefs to upstream
>>i915 now, we can however clean up existing usage in the xe branch to be
>>more suitable for upstream. For example, I'd take the #ifdefs here
>>pretty much without issues.
>
> instead of a cherry-pick + squashed-ifdef-removal I think it's better
> to do:
>
> 1) cherry-pick
> 2) remove ifdefs and commit with
>
> 	git commit -s --fixup=3D38a139546384
>
>    ... or whatever commit added them (there are a few before that commit
>    above)

Even if that results in a broken build for a commit?

I also have i915 patches locally that I think are probably fine upstream
*with* the xe submission, but not standalone. They clean up #ifdefs. The
trouble is, they often break the build on top of drm-xe-next, unless I
also fix the commit adding #ifdefs. And in a rebase, they should go
*before* 38a139546384.

Here's a good example: https://paste.debian.net/1274882/

That commit should go before 38a139546384, with -DI915=3D1 added to i915
build, but it also touches xe to keep building properly.

Here, I admit a git-pile setup would help this part of the job.

> The reason is that I don't think we will be able to avoid 1 more rebase
> before being merged upstream.  We can't do merge-approach neither
> because of these commits we don't really want to ever show up in
> upstream (and because we are on top of drm-tip rather than e.g.
> drm-next). So doing the above at least makes a rebase more bearable:

I thought the rebase was going to be on v6.2, I argued for basing on
drm-intel-next, but it ended up being on drm-tip after all. I was kind
of surprised.

> Whenever we do a rebase (with --autosquash) the cherry-pick should
> automatically be dropped by git and the fixup should automatically remove
> the addition of the ifdefs in the commit that added them.

If only there was a way to tell git rebase how to reorder the
patches. That would be needed for the ones that aren't upstream.

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
>>>
>>>
>>>> ---
>>>>  drivers/gpu/drm/i915/Makefile                 |  1 +
>>>>  .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++-----------------
>>>>  .../gpu/drm/i915/display/intel_display_rps.c  | 81 ++++++++++++++++++
>>>>  .../gpu/drm/i915/display/intel_display_rps.h  | 34 ++++++++
>>>>  4 files changed, 123 insertions(+), 78 deletions(-)
>>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
>>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Make=
file
>>>> index ae9259ab3261..f689132e1506 100644
>>>> --- a/drivers/gpu/drm/i915/Makefile
>>>> +++ b/drivers/gpu/drm/i915/Makefile
>>>> @@ -239,6 +239,7 @@ i915-y +=3D \
>>>>  	display/intel_display_power.o \
>>>>  	display/intel_display_power_map.o \
>>>>  	display/intel_display_power_well.o \
>>>> +	display/intel_display_rps.o \
>>>>  	display/intel_dmc.o \
>>>>  	display/intel_dpio_phy.o \
>>>>  	display/intel_dpll.o \
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drive=
rs/gpu/drm/i915/display/intel_atomic_plane.c
>>>> index 3d37f44ec835..e666a5c1fd91 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>> @@ -34,13 +34,10 @@
>>>>  #include <drm/drm_atomic_helper.h>
>>>>  #include <drm/drm_fourcc.h>
>>>>
>>>> -#ifdef I915
>>>> -#include "gt/intel_rps.h"
>>>> -#endif
>>>> -
>>>>  #include "i915_config.h"
>>>>  #include "intel_atomic_plane.h"
>>>>  #include "intel_cdclk.h"
>>>> +#include "intel_display_rps.h"
>>>>  #include "intel_display_trace.h"
>>>>  #include "intel_display_types.h"
>>>>  #include "intel_fb.h"
>>>> @@ -951,66 +948,6 @@ int intel_atomic_plane_check_clipping(struct inte=
l_plane_state *plane_state,
>>>>  	return 0;
>>>>  }
>>>>
>>>> -#ifdef I915
>>>> -struct wait_rps_boost {
>>>> -	struct wait_queue_entry wait;
>>>> -
>>>> -	struct drm_crtc *crtc;
>>>> -	struct i915_request *request;
>>>> -};
>>>> -
>>>> -static int do_rps_boost(struct wait_queue_entry *_wait,
>>>> -			unsigned mode, int sync, void *key)
>>>> -{
>>>> -	struct wait_rps_boost *wait =3D container_of(_wait, typeof(*wait), w=
ait);
>>>> -	struct i915_request *rq =3D wait->request;
>>>> -
>>>> -	/*
>>>> -	 * If we missed the vblank, but the request is already running it
>>>> -	 * is reasonable to assume that it will complete before the next
>>>> -	 * vblank without our intervention, so leave RPS alone.
>>>> -	 */
>>>> -	if (!i915_request_started(rq))
>>>> -		intel_rps_boost(rq);
>>>> -	i915_request_put(rq);
>>>> -
>>>> -	drm_crtc_vblank_put(wait->crtc);
>>>> -
>>>> -	list_del(&wait->wait.entry);
>>>> -	kfree(wait);
>>>> -	return 1;
>>>> -}
>>>> -
>>>> -static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>> -				       struct dma_fence *fence)
>>>> -{
>>>> -	struct wait_rps_boost *wait;
>>>> -
>>>> -	if (!dma_fence_is_i915(fence))
>>>> -		return;
>>>> -
>>>> -	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>>>> -		return;
>>>> -
>>>> -	if (drm_crtc_vblank_get(crtc))
>>>> -		return;
>>>> -
>>>> -	wait =3D kmalloc(sizeof(*wait), GFP_KERNEL);
>>>> -	if (!wait) {
>>>> -		drm_crtc_vblank_put(crtc);
>>>> -		return;
>>>> -	}
>>>> -
>>>> -	wait->request =3D to_request(dma_fence_get(fence));
>>>> -	wait->crtc =3D crtc;
>>>> -
>>>> -	wait->wait.func =3D do_rps_boost;
>>>> -	wait->wait.flags =3D 0;
>>>> -
>>>> -	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>>>> -}
>>>> -#endif
>>>> -
>>>>  /**
>>>>   * intel_prepare_plane_fb - Prepare fb for usage on plane
>>>>   * @_plane: drm plane to prepare for
>>>> @@ -1102,13 +1039,13 @@ intel_prepare_plane_fb(struct drm_plane *_plan=
e,
>>>>  		dma_resv_iter_begin(&cursor, obj->base.resv,
>>>>  				    DMA_RESV_USAGE_WRITE);
>>>>  		dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>> -			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>> -						   fence);
>>>> +			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>> +							     fence);
>>>>  		}
>>>>  		dma_resv_iter_end(&cursor);
>>>>  	} else {
>>>> -		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>> -					   new_plane_state->uapi.fence);
>>>> +		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>> +						     new_plane_state->uapi.fence);
>>>>  	}
>>>>
>>>>  	/*
>>>> @@ -1119,10 +1056,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>>>  	 * that are not quite steady state without resorting to forcing
>>>>  	 * maximum clocks following a vblank miss (see do_rps_boost()).
>>>>  	 */
>>>> -	if (!state->rps_interactive) {
>>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, true);
>>>> -		state->rps_interactive =3D true;
>>>> -	}
>>>> +	intel_display_rps_mark_interactive(dev_priv, state, true);
>>>>
>>>>  	return 0;
>>>>
>>>> @@ -1159,12 +1093,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>>>>  	if (!obj)
>>>>  		return;
>>>>
>>>> -#ifdef I915
>>>> -	if (state->rps_interactive) {
>>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
>>>> -		state->rps_interactive =3D false;
>>>> -	}
>>>> -#endif
>>>> +	intel_display_rps_mark_interactive(dev_priv, state, false);
>>>>
>>>>  	/* Should only be called after a successful intel_prepare_plane_fb()=
! */
>>>>  	intel_plane_unpin_fb(old_plane_state);
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/driver=
s/gpu/drm/i915/display/intel_display_rps.c
>>>> new file mode 100644
>>>> index 000000000000..918d0327169a
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
>>>> @@ -0,0 +1,81 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright =C2=A9 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_crtc.h>
>>>> +#include <drm/drm_vblank.h>
>>>> +
>>>> +#include "gt/intel_rps.h"
>>>> +#include "i915_drv.h"
>>>> +#include "intel_display_rps.h"
>>>> +#include "intel_display_types.h"
>>>> +
>>>> +struct wait_rps_boost {
>>>> +	struct wait_queue_entry wait;
>>>> +
>>>> +	struct drm_crtc *crtc;
>>>> +	struct i915_request *request;
>>>> +};
>>>> +
>>>> +static int do_rps_boost(struct wait_queue_entry *_wait,
>>>> +			unsigned mode, int sync, void *key)
>>>> +{
>>>> +	struct wait_rps_boost *wait =3D container_of(_wait, typeof(*wait), w=
ait);
>>>> +	struct i915_request *rq =3D wait->request;
>>>> +
>>>> +	/*
>>>> +	 * If we missed the vblank, but the request is already running it
>>>> +	 * is reasonable to assume that it will complete before the next
>>>> +	 * vblank without our intervention, so leave RPS alone.
>>>> +	 */
>>>> +	if (!i915_request_started(rq))
>>>> +		intel_rps_boost(rq);
>>>> +	i915_request_put(rq);
>>>> +
>>>> +	drm_crtc_vblank_put(wait->crtc);
>>>> +
>>>> +	list_del(&wait->wait.entry);
>>>> +	kfree(wait);
>>>> +	return 1;
>>>> +}
>>>> +
>>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>> +					  struct dma_fence *fence)
>>>> +{
>>>> +	struct wait_rps_boost *wait;
>>>> +
>>>> +	if (!dma_fence_is_i915(fence))
>>>> +		return;
>>>> +
>>>> +	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>>>> +		return;
>>>> +
>>>> +	if (drm_crtc_vblank_get(crtc))
>>>> +		return;
>>>> +
>>>> +	wait =3D kmalloc(sizeof(*wait), GFP_KERNEL);
>>>> +	if (!wait) {
>>>> +		drm_crtc_vblank_put(crtc);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	wait->request =3D to_request(dma_fence_get(fence));
>>>> +	wait->crtc =3D crtc;
>>>> +
>>>> +	wait->wait.func =3D do_rps_boost;
>>>> +	wait->wait.flags =3D 0;
>>>> +
>>>> +	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>>>> +}
>>>> +
>>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>>> +					struct intel_atomic_state *state,
>>>> +					bool interactive)
>>>> +{
>>>> +	if (state->rps_interactive =3D=3D interactive)
>>>> +		return;
>>>> +
>>>> +	intel_rps_mark_interactive(&to_gt(i915)->rps, interactive);
>>>> +	state->rps_interactive =3D interactive;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.h b/driver=
s/gpu/drm/i915/display/intel_display_rps.h
>>>> new file mode 100644
>>>> index 000000000000..2cfb8a303b77
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.h
>>>> @@ -0,0 +1,34 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright =C2=A9 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef __INTEL_DISPLAY_RPS_H__
>>>> +#define __INTEL_DISPLAY_RPS_H__
>>>> +
>>>> +#include <linux/types.h>
>>>> +
>>>> +struct dma_fence;
>>>> +struct drm_crtc;
>>>> +struct drm_i915_private;
>>>> +struct intel_atomic_state;
>>>> +
>>>> +#ifdef I915
>>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>> +					  struct dma_fence *fence);
>>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>>> +					struct intel_atomic_state *state,
>>>> +					bool interactive);
>>>> +#else
>>>> +static inline void intel_display_rps_boost_after_vblank(struct drm_cr=
tc *crtc,
>>>> +							struct dma_fence *fence)
>>>> +{
>>>> +}
>>>> +static inline void intel_display_rps_mark_interactive(struct drm_i915=
_private *i915,
>>>> +						      struct intel_atomic_state *state,
>>>> +						      bool interactive)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>> +#endif /* __INTEL_DISPLAY_RPS_H__ */
>>
>>--=20
>>Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
