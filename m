Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040C6C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 12:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD610E0E6;
	Wed, 15 Nov 2023 12:59:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBD410E0E6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700053161; x=1731589161;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=6RE9jqpwGRMPqS1HZtTqft83Q6mpfqBMb8ZjQffA4/c=;
 b=XoWvnKR3u0ZBrzL6T/o/IFbnztrCzyjoRv0C38CQPJIsxr2Hp3A3ddAl
 VQFDF8qbzq4DlEWmuFpoeAcI4V8QAhcNe06edQbYSzRHHBZyFZcKN2iMc
 qC+cWL9YIL2NX/b/Apw3O9PJsxN9i0D/5wlxJ3IzjeVOAS+UcoreRzGxt
 p5rmYfUlJK6clul00/e25/zzx4BHuXMdYUqlELs2kFHfMkhsGAwYSxfsl
 suUW7nllmXK6D2t6D+UNB/gjthMmZ5pPFLZ5mwur+qH/gXkfzHDk0V8G+
 BsY8Am93+putsfax4RSrPRhlSklfO1G/WOEKyoN5ZewHOgNMUl6uzHRCl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="477090781"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="477090781"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 04:59:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="835390484"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="835390484"
Received: from aklett-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.38.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 04:59:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <IA1PR11MB6347762FB53840B06F2188C0F4B2A@IA1PR11MB6347.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
 <e864e3ccbcbae65f3adb558064541f0ad9bbba78.camel@intel.com>
 <IA1PR11MB6347762FB53840B06F2188C0F4B2A@IA1PR11MB6347.namprd11.prod.outlook.com>
Date: Wed, 15 Nov 2023 14:59:07 +0200
Message-ID: <87fs17qijo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [v9,
 1/6] Revert "FIXME: drm/i915: xe dpt integration"
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

On Tue, 14 Nov 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Hog=
ander,
>> Jouni
>> Sent: Tuesday, November 14, 2023 2:11 PM
>> To: juhapekka.heikkila@gmail.com; intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [v9, 1/6] Revert "FIXME: drm/i915: xe dpt integr=
ation"
>>=20
>> Hello Juha-Pekka,
>>=20
>> Some of these patches already sent to intel-gfx as discussed offline:
>>=20
>> https://patchwork.freedesktop.org/series/126352/
>>=20
>> To my opinion we could already merge this and then do backport when
>> i915 patches are merged. For the whole set:
>>=20
>> Reviewed-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
>
> I agree, lets merge the i915 parts to drm-intel-next and then send out a =
fresh series,
> cherry picking the same along with the fixup to drop the FIXME patch.

I see that this was already merged... but I think at this point in time
it would be better to get the stuff merged to i915 first, and then
backported with cherry-pick -x annotations. Just skip the intermediate
step of merging something that must be fixed later.

BR,
Jani.

>
> Regards,
> Uma Shankar
>
>> BR,
>>=20
>> Jouni H=C3=B6gander
>>=20
>> On Mon, 2023-11-13 at 21:56 +0200, Juha-Pekka Heikkila wrote:
>> > This reverts commit e417510409165b44ad59bfdbc59cd90316e91dc1.
>> > ---
>> > =C2=A0.../gpu/drm/i915/display/intel_atomic_plane.c |=C2=A0 4 ---
>> > =C2=A0.../drm/i915/display/intel_display_types.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ----
>> > =C2=A0drivers/gpu/drm/i915/display/intel_dpt.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 14 +++-----
>> > =C2=A0drivers/gpu/drm/i915/display/intel_fb.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 36 +++--------------
>> > --
>> > =C2=A0.../drm/i915/display/skl_universal_plane.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 +---
>> > =C2=A05 files changed, 11 insertions(+), 55 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> > index 77e281bf4cb5..a8f36ca11e2e 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> > @@ -111,9 +111,7 @@ intel_plane_duplicate_state(struct drm_plane
>> > *plane)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__drm_atomic_helper_pl=
ane_duplicate_state(plane,
>> > &intel_state->uapi);
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_state->ggtt_vma =
=3D NULL;
>> > -#ifdef I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_state->dpt_vma =
=3D NULL;
>> > -#endif
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_state->flags =3D=
 0;
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* add reference to fb=
 */
>> > @@ -138,9 +136,7 @@ intel_plane_destroy_state(struct drm_plane *plane,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_plane_sta=
te *plane_state =3D
>> > to_intel_plane_state(state);
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_WARN_ON(plane->dev=
, plane_state->ggtt_vma); -#ifdef I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_WARN_ON(plane->dev=
, plane_state->dpt_vma); -#endif
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__drm_atomic_helper_pl=
ane_destroy_state(&plane_state->uapi);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (plane_state->hw.fb)
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> > b/drivers/gpu/drm/i915/display/intel_display_types.h
>> > index b5e4b94c129b..db20dd7e5c0d 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> > @@ -143,9 +143,7 @@ struct intel_framebuffer {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_fb_view remapped_view;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>> >
>> > -#ifdef I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_address_sp=
ace *dpt_vm; -#endif
>> > =C2=A0};
>> >
>> > =C2=A0enum intel_hotplug_state {
>> > @@ -696,11 +694,7 @@ struct intel_plane_state {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} hw;
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *ggtt_=
vma;
>> > -#ifdef I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *dpt_v=
ma;
>> > -#else
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma embed_vma;
>> > -#endif
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags;
>> > =C2=A0#define PLANE_HAS_FENCE BIT(0)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c
>> > b/drivers/gpu/drm/i915/display/intel_dpt.c
>> > index 6e73c7a15942..2b067cb952f0 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> > @@ -3,6 +3,11 @@
>> > =C2=A0 * Copyright =C2=A9 2021 Intel Corporation
>> > =C2=A0 */
>> >
>> > +#include "gem/i915_gem_domain.h"
>> > +#include "gem/i915_gem_internal.h"
>> > +#include "gem/i915_gem_lmem.h"
>> > +#include "gt/gen8_ppgtt.h"
>> > +
>> > =C2=A0#include "i915_drv.h"
>> > =C2=A0#include "i915_reg.h"
>> > =C2=A0#include "intel_de.h"
>> > @@ -10,13 +15,6 @@
>> > =C2=A0#include "intel_dpt.h"
>> > =C2=A0#include "intel_fb.h"
>> >
>> > -#ifdef I915
>> > -
>> > -#include "gem/i915_gem_domain.h"
>> > -#include "gem/i915_gem_internal.h"
>> > -#include "gem/i915_gem_lmem.h"
>> > -#include "gt/gen8_ppgtt.h"
>> > -
>> > =C2=A0struct i915_dpt {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_address_sp=
ace vm;
>> >
>> > @@ -320,8 +318,6 @@ void intel_dpt_destroy(struct i915_address_space
>> > *vm)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_vm_put(&dpt->vm);
>> > =C2=A0}
>> >
>> > -#endif
>> > -
>> > =C2=A0void intel_dpt_configure(struct intel_crtc *crtc)
>> > =C2=A0{
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_privat=
e *i915 =3D to_i915(crtc->base.dev); diff
>> > --git a/drivers/gpu/drm/i915/display/intel_fb.c
>> > b/drivers/gpu/drm/i915/display/intel_fb.c
>> > index 1ce61245728a..3862e55e8980 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_fb.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>> > @@ -1885,34 +1885,16 @@ int intel_plane_compute_gtt(struct
>> > intel_plane_state *plane_state)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return intel_plane_che=
ck_stride(plane_state);
>> > =C2=A0}
>> >
>> > -static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer
>> > *fb)
>> > -{
>> > -#ifdef I915
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_framebuffer *i=
ntel_fb =3D to_intel_framebuffer(fb);
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (intel_fb_uses_dpt(fb))
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0intel_dpt_destroy(intel_fb->dpt_vm);
>> > -#else
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (intel_fb_obj(fb)->flags=
 & XE_BO_CREATE_PINNED_BIT) {
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0struct xe_bo *bo =3D intel_fb_obj(fb);
>> > -
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/* Unpin our kernel fb first */
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0xe_bo_lock(bo, false);
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0xe_bo_unpin(bo);
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0xe_bo_unlock(bo);
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_bo_put(intel_fb_obj(fb));
>> > -#endif
>> > -}
>> > -
>> > =C2=A0static void intel_user_framebuffer_destroy(struct drm_framebuffer
>> > *fb)
>> > =C2=A0{
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_framebuff=
er *intel_fb =3D to_intel_framebuffer(fb);
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_framebuffer_cleanu=
p(fb);
>> >
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_frontbuffer_put(intel=
_fb->frontbuffer);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (intel_fb_uses_dpt(fb))
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0intel_dpt_destroy(intel_fb->dpt_vm);
>> >
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_user_framebuffer_dest=
roy_vm(fb);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_frontbuffer_put(intel=
_fb->frontbuffer);
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(intel_fb);
>> > =C2=A0}
>> > @@ -2155,18 +2137,13 @@ int intel_framebuffer_init(struct
>> > intel_framebuffer *intel_fb,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> >
>> > -#ifdef I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0fb->obj[i] =3D &obj->base; -#else
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0fb->obj[i] =3D &obj->ttm.base; -#endif
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D intel_fill_fb_=
info(dev_priv, intel_fb);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err;
>> >
>> > -#ifdef I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (intel_fb_uses_dpt(=
fb)) {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_address_space *vm;
>> >
>> > @@ -2179,10 +2156,6 @@ int intel_framebuffer_init(struct
>> > intel_framebuffer *intel_fb,
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fb->dpt_vm =3D vm;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > -#else
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Hold a reference to obje=
ct while fb is alive */
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_bo_get(obj);
>> > -#endif
>> >
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_framebuffe=
r_init(&dev_priv->drm, fb,
>> > &intel_fb_funcs);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> > @@ -2193,7 +2166,8 @@ int intel_framebuffer_init(struct
>> > intel_framebuffer *intel_fb,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> >
>> > =C2=A0err_free_dpt:
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_user_framebuffer_dest=
roy_vm(fb);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (intel_fb_uses_dpt(fb))
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0intel_dpt_destroy(intel_fb->dpt_vm);
>> > =C2=A0err:
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_frontbuffer_put(=
intel_fb->frontbuffer);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > index 68eabe089aaf..4553dd6bfbbd 100644
>> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > @@ -1010,13 +1010,9 @@ static u32 skl_surf_address(const struct
>> > intel_plane_state *plane_state,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The DPT object contains only one vma, so the =
VMA's
>> > offset
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * within the DPT is always 0.
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0drm_WARN_ON(&i915->drm, offset & 0x1fffff); -#ifdef
>> > I915
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_WARN_ON(&i915->drm, plane_state->dpt_vma-
>> > >node.start);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0drm_WARN_ON(&i915->drm, offset & 0x1fffff);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return offset >> 9;
>> > -#else
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return 0;
>> > -#endif
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_WARN_ON(&i915->drm, offset & 0xfff);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return offset;
>

--=20
Jani Nikula, Intel
