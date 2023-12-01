Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD2EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 13:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4C10E8AB;
	Fri,  1 Dec 2023 13:44:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E9010E8AB
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701438279; x=1732974279;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=DpD3qYg4PG+z3gdocNTkUmMS1woIXlZrlStjJwml5K0=;
 b=kcpQ/F+nl10ASjEBHnMOHmXa61r5sxJOQgCUh3WkwCuzNJZEiipjmsqA
 rmwX+GeEuxS5t5rbRlAJF06nAhv8f3pvmxsdvniZW0cFSY25pCK+941zy
 2efF2w/szKcFvOsh1BdZOyyuOjSEuETD5IZOMsBeroRC3cvLMuVu7+cFA
 nxdsl6ipoClECyF4HrnLiNXtJJ46Q9DycZLWDg5qr+pjur8OH9n/BzzIK
 lkGHOmq/DuOSUQpdWTKDPx7X/JZWtJ0LskrmxqEdZJRmhYIiNwPSZjiRe
 ivlepFSNBx963m/60GnS2tAGvnB6n+sB4V2ACcbtT6JHDRWBcoePwTgTa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383893160"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="383893160"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 05:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769688672"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="769688672"
Received: from vlubart-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.207])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 05:44:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231201134133.3356433-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231201134133.3356433-1-jouni.hogander@intel.com>
Date: Fri, 01 Dec 2023 15:44:32 +0200
Message-ID: <874jh23um7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] fixup! FIXME: drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 01 Dec 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Remove bunch of unnecessary changes from the hack patch.
>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 8 ++++----
>  drivers/gpu/drm/i915/display/intel_fbc.c          | 2 --
>  drivers/gpu/drm/i915/display/intel_frontbuffer.c  | 7 ++++---
>  drivers/gpu/drm/i915/display/intel_frontbuffer.h  | 4 ----
>  4 files changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/=
gpu/drm/i915/display/intel_atomic_plane.c
> index a8f36ca11e2e..06c2455bdd78 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1066,10 +1066,10 @@ static int
>  intel_prepare_plane_fb(struct drm_plane *_plane,
>  		       struct drm_plane_state *_new_plane_state)
>  {
> -	struct intel_plane_state *new_plane_state =3D
> -		to_intel_plane_state(_new_plane_state);
>  	struct i915_sched_attr attr =3D { .priority =3D I915_PRIORITY_DISPLAY };
>  	struct intel_plane *plane =3D to_intel_plane(_plane);
> +	struct intel_plane_state *new_plane_state =3D
> +		to_intel_plane_state(_new_plane_state);
>  	struct intel_atomic_state *state =3D
>  		to_intel_atomic_state(new_plane_state->uapi.state);
>  	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
> @@ -1153,9 +1153,9 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>  {
>  	struct intel_plane_state *old_plane_state =3D
>  		to_intel_plane_state(_old_plane_state);
> -	__maybe_unused struct intel_atomic_state *state =3D
> +	struct intel_atomic_state *state =3D
>  		to_intel_atomic_state(old_plane_state->uapi.state);
> -	__maybe_unused struct drm_i915_private *dev_priv =3D to_i915(plane->dev=
);
> +	struct drm_i915_private *dev_priv =3D to_i915(plane->dev);
>  	struct drm_i915_gem_object *obj =3D intel_fb_obj(old_plane_state->hw.fb=
);
>=20=20
>  	if (!obj)
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index 1152bd4cb8f8..32de94e0e69e 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -453,7 +453,6 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
>=20=20
>  	intel_de_write(i915, DPFC_CB_BASE,
>  		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
> -
>  }
>=20=20
>  static const struct intel_fbc_funcs g4x_fbc_funcs =3D {
> @@ -800,7 +799,6 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
>  	drm_dbg_kms(&i915->drm,
>  		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d=
\n",
>  		    i915_gem_stolen_node_size(&fbc->compressed_fb), fbc->limit);
> -
>  	return 0;
>=20=20
>  err_llb:
> diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/g=
pu/drm/i915/display/intel_frontbuffer.c
> index d64ce5bfeca8..2ea37c0414a9 100644
> --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
> @@ -190,7 +190,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
>  		      enum fb_op_origin origin,
>  		      unsigned int frontbuffer_bits)
>  {
> -	struct drm_i915_private *i915 =3D intel_bo_to_i915((front->obj));
> +	struct drm_i915_private *i915 =3D intel_bo_to_i915(front->obj);
>=20=20
>  	if (origin =3D=3D ORIGIN_CS) {
>  		spin_lock(&i915->display.fb_tracking.lock);
> @@ -259,6 +259,7 @@ static void frontbuffer_release(struct kref *ref)
>  	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
>=20=20
>  	i915_ggtt_clear_scanout(obj);
> +
>  	ret =3D i915_gem_object_set_frontbuffer(obj, NULL);
>  	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, ret);
>  	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
> @@ -289,12 +290,12 @@ intel_frontbuffer_get(struct drm_i915_gem_object *o=
bj)
>  			 frontbuffer_retire,
>  			 I915_ACTIVE_RETIRE_SLEEPS);
>  	INIT_WORK(&front->flush_work, intel_frontbuffer_flush_work);
> +
>  	spin_lock(&i915->display.fb_tracking.lock);
>  	cur =3D i915_gem_object_set_frontbuffer(obj, front);
>  	spin_unlock(&i915->display.fb_tracking.lock);
>  	if (cur !=3D front)
>  		kfree(front);
> -
>  	return cur;
>  }
>=20=20
> @@ -337,7 +338,7 @@ void intel_frontbuffer_track(struct intel_frontbuffer=
 *old,
>  	}
>=20=20
>  	if (new) {
> -		drm_WARN_ON(&intel_bo_to_i915(old->obj)->drm,
> +		drm_WARN_ON(&intel_bo_to_i915(new->obj)->drm,
>  			    atomic_read(&new->bits) & frontbuffer_bits);
>  		atomic_or(frontbuffer_bits, &new->bits);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/g=
pu/drm/i915/display/intel_frontbuffer.h
> index 00467d513e74..abb51e8bb920 100644
> --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
> +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
> @@ -28,10 +28,6 @@
>  #include <linux/bits.h>
>  #include <linux/kref.h>
>=20=20
> -#ifndef I915
> -#include "xe_bo.h"
> -#endif
> -
>  #include "i915_active_types.h"
>=20=20
>  struct drm_i915_private;

--=20
Jani Nikula, Intel
