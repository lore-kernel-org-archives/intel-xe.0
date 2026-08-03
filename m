Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BD3C55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 09:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFE710E55D;
	Mon,  3 Aug 2026 09:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKYaRw1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C77A10E55C;
 Mon,  3 Aug 2026 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785749535; x=1817285535;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=lUWpOA7QwiP0dm/R4n6v/C3FhK0IGDRGZaxrKHyjDjw=;
 b=iKYaRw1DfTEokND38m2t+gIrddfAEAjULJkWg9n4GnhzVX+mKLZ6spth
 7IhYAlfaIlesD3VbFGRkCKWuywzgWg7ZIPO38Q6E3CDGqWhwRZNj1rUYu
 8LBPS0jFa3GD+BK4t4NXFWDlx8ORyV9w6C+mMMMprWkJ5PG9lJyJn+9rn
 IiKeMuYv0Jud2u+HLEuMo8JeWwM1p6GKypZfMUb+QabAYLiI9VNmsTntz
 F+Wq/TF9C5atP42sLRPMo72Y/5QUOYP3D3cJQemFA5W0nwt01y/wumAv4
 7zL/byjPMV8D/0kcSuId6rncwnmoU9X1BzQpISM3NPYxF2mc052q7ASdE w==;
X-CSE-ConnectionGUID: pf3ZTkImTmqMxMH8/6UFzA==
X-CSE-MsgGUID: vUN/LlFtRRqNpxNqdiVzXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="103822108"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="103822108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:32:15 -0700
X-CSE-ConnectionGUID: nGrYSPJYTH6g6lxg/l99Yw==
X-CSE-MsgGUID: 7UgvbTV8QgOL889zgUlsqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="284556915"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:32:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/{i915, xe}/display: move transient data flush call
 to display parent interface
In-Reply-To: <DS4PPFE901A304F6EDF1624AEE15EE3E411E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728170029.608289-1-jani.nikula@intel.com>
 <DS4PPFE901A304F6EDF1624AEE15EE3E411E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Mon, 03 Aug 2026 12:32:11 +0300
Message-ID: <e16a7c76b87ce1a4f138e53638b8787eaaa7319c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 03 Aug 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH] drm/{i915, xe}/display: move transient data flush call =
to display
>> parent interface
>>=20
>> Move the core driver TDF call to display parent interface to avoid direc=
t calls
>> from display to xe driver.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Thanks, pushed to din.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c  |  4 +--
>> .../gpu/drm/i915/display/intel_frontbuffer.c  |  3 +--
>>  drivers/gpu/drm/i915/display/intel_parent.c   |  6 +++++
>>  drivers/gpu/drm/i915/display/intel_parent.h   |  1 +
>>  drivers/gpu/drm/i915/display/intel_tdf.h      | 25 -------------------
>>  drivers/gpu/drm/xe/Makefile                   |  3 +--
>>  drivers/gpu/drm/xe/display/xe_display.c       | 15 +++++++++++
>>  drivers/gpu/drm/xe/display/xe_tdf.c           | 15 -----------
>>  include/drm/intel/display_parent_interface.h  |  3 +++
>>  9 files changed, 29 insertions(+), 46 deletions(-)  delete mode 100644
>> drivers/gpu/drm/i915/display/intel_tdf.h
>>  delete mode 100644 drivers/gpu/drm/xe/display/xe_tdf.c
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index 9dfd095f325f..bf838834b89f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -107,6 +107,7 @@
>>  #include "intel_modeset_verify.h"
>>  #include "intel_overlay.h"
>>  #include "intel_panel.h"
>> +#include "intel_parent.h"
>>  #include "intel_pch_display.h"
>>  #include "intel_pch_refclk.h"
>>  #include "intel_pfit.h"
>> @@ -119,7 +120,6 @@
>>  #include "intel_sdvo.h"
>>  #include "intel_snps_phy.h"
>>  #include "intel_tc.h"
>> -#include "intel_tdf.h"
>>  #include "intel_tv.h"
>>  #include "intel_vblank.h"
>>  #include "intel_vdsc.h"
>> @@ -7506,7 +7506,7 @@ static void intel_atomic_commit_tail(struct
>> intel_atomic_state *state)
>>=20
>>  	intel_atomic_commit_fence_wait(state);
>>=20
>> -	intel_td_flush(display);
>> +	intel_parent_transient_data_flush(display);
>>=20
>>  	intel_atomic_prepare_plane_clear_colors(state);
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>> b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>> index 705742e117ca..70aae6ffa3fe 100644
>> --- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>> +++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>> @@ -66,7 +66,6 @@
>>  #include "intel_frontbuffer.h"
>>  #include "intel_parent.h"
>>  #include "intel_psr.h"
>> -#include "intel_tdf.h"
>>=20
>>  /**
>>   * frontbuffer_flush - flush frontbuffer @@ -95,7 +94,7 @@ static void
>> frontbuffer_flush(struct intel_display *display,
>>  	trace_intel_frontbuffer_flush(display, frontbuffer_bits, origin);
>>=20
>>  	might_sleep();
>> -	intel_td_flush(display);
>> +	intel_parent_transient_data_flush(display);
>>  	intel_drrs_flush(display, frontbuffer_bits);
>>  	intel_psr_flush(display, frontbuffer_bits, origin);
>>  	intel_fbc_flush(display, frontbuffer_bits, origin); diff --git
>> a/drivers/gpu/drm/i915/display/intel_parent.c
>> b/drivers/gpu/drm/i915/display/intel_parent.c
>> index a5e41ea66921..ffc1f5e0518c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_parent.c
>> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
>> @@ -451,6 +451,12 @@ bool intel_parent_has_fenced_regions(struct
>> intel_display *display)
>>  	return display->parent->has_fenced_regions && display->parent-
>> >has_fenced_regions(display->drm);
>>  }
>>=20
>> +void intel_parent_transient_data_flush(struct intel_display *display) {
>> +	if (display->parent->transient_data_flush)
>> +		display->parent->transient_data_flush(display->drm);
>> +}
>> +
>>  bool intel_parent_vgpu_active(struct intel_display *display)  {
>>  	return display->parent->vgpu_active && display->parent-
>> >vgpu_active(display->drm);
>> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h
>> b/drivers/gpu/drm/i915/display/intel_parent.h
>> index 595d4148b8eb..c817a826169c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_parent.h
>> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
>> @@ -155,6 +155,7 @@ int intel_parent_vlv_iosf_write(struct intel_display
>> *display, enum vlv_iosf_sb_
>>  /* generic */
>>  bool intel_parent_has_auxccs(struct intel_display *display);  bool
>> intel_parent_has_fenced_regions(struct intel_display *display);
>> +void intel_parent_transient_data_flush(struct intel_display *display);
>>  bool intel_parent_vgpu_active(struct intel_display *display);  void
>> intel_parent_fence_priority_display(struct intel_display *display, struct
>> dma_fence *fence);
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_tdf.h
>> b/drivers/gpu/drm/i915/display/intel_tdf.h
>> deleted file mode 100644
>> index 0862c2bfd9cd..000000000000
>> --- a/drivers/gpu/drm/i915/display/intel_tdf.h
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright =C2=A9 2024 Intel Corporation
>> - */
>> -
>> -#ifndef __INTEL_TDF_H__
>> -#define __INTEL_TDF_H__
>> -
>> -/*
>> - * TDF (Transient-Data-Flush) is needed for Xe2+ where special L3:XD ca=
ching
>> can
>> - * be enabled through various PAT index modes. Idea is to use this cach=
ing
>> mode
>> - * when for example rendering onto the display surface, with the promis=
e that
>> - * KMD will ensure transient cache entries are always flushed by the ti=
me we
>> do
>> - * the display flip, since display engine is never coherent with CPU/GP=
U caches.
>> - */
>> -
>> -struct intel_display;
>> -
>> -#ifdef I915
>> -static inline void intel_td_flush(struct intel_display *display) {} -#e=
lse -void
>> intel_td_flush(struct intel_display *display); -#endif
>> -
>> -#endif
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile i=
ndex
>> 67ada1d6c2fb..44ed055439d4 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -228,8 +228,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>>  	display/xe_hdcp_gsc.o \
>>  	display/xe_initial_plane.o \
>>  	display/xe_panic.o \
>> -	display/xe_stolen.o \
>> -	display/xe_tdf.o
>> +	display/xe_stolen.o
>>=20
>>  # Display code shared with i915
>>  xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>> b/drivers/gpu/drm/xe/display/xe_display.c
>> index 8da4c457a4a0..5f5e79505b3d 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -446,6 +446,20 @@ static bool has_auxccs(struct drm_device *drm)
>>  	return xe->info.platform =3D=3D XE_ALDERLAKE_P;  }
>>=20
>> +/*
>> + * TDF (Transient-Data-Flush) is needed for Xe2+ where special L3:XD
>> +caching can
>> + * be enabled through various PAT index modes. Idea is to use this
>> +caching mode
>> + * when for example rendering onto the display surface, with the
>> +promise that
>> + * KMD will ensure transient cache entries are always flushed by the
>> +time we do
>> + * the display flip, since display engine is never coherent with CPU/GP=
U caches.
>> + */
>> +static void transient_data_flush(struct drm_device *drm) {
>> +	struct xe_device *xe =3D to_xe_device(drm);
>> +
>> +	xe_device_td_flush(xe);
>> +}
>> +
>>  static const struct intel_display_parent_interface parent =3D {
>>  	.bo =3D &xe_display_bo_interface,
>>  	.dsb =3D &xe_display_dsb_interface,
>> @@ -459,6 +473,7 @@ static const struct intel_display_parent_interface p=
arent
>> =3D {
>>  	.rpm =3D &xe_display_rpm_interface,
>>  	.stolen =3D &xe_display_stolen_interface,
>>  	.has_auxccs =3D has_auxccs,
>> +	.transient_data_flush =3D transient_data_flush,
>>  };
>>=20
>>  /**
>> diff --git a/drivers/gpu/drm/xe/display/xe_tdf.c
>> b/drivers/gpu/drm/xe/display/xe_tdf.c
>> deleted file mode 100644
>> index 78bda4c47874..000000000000
>> --- a/drivers/gpu/drm/xe/display/xe_tdf.c
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -// SPDX-License-Identifier: MIT
>> -/*
>> - * Copyright =C2=A9 2024 Intel Corporation
>> - */
>> -
>> -#include "intel_display_core.h"
>> -#include "intel_tdf.h"
>> -#include "xe_device.h"
>> -
>> -void intel_td_flush(struct intel_display *display) -{
>> -	struct xe_device *xe =3D to_xe_device(display->drm);
>> -
>> -	xe_device_td_flush(xe);
>> -}
>> diff --git a/include/drm/intel/display_parent_interface.h
>> b/include/drm/intel/display_parent_interface.h
>> index de395df9ca30..8b25107615ea 100644
>> --- a/include/drm/intel/display_parent_interface.h
>> +++ b/include/drm/intel/display_parent_interface.h
>> @@ -302,6 +302,9 @@ struct intel_display_parent_interface {
>>  		/** @has_fenced_regions: Support legacy fencing? Optional. */
>>  		bool (*has_fenced_regions)(struct drm_device *drm);
>>=20
>> +		/** @transient_data_flush: Transient data flush. Optional. */
>> +		void (*transient_data_flush)(struct drm_device *drm);
>> +
>>  		/** @vgpu_active: Is vGPU active? Optional. */
>>  		bool (*vgpu_active)(struct drm_device *drm);
>>  	};
>> --
>> 2.47.3
>

--=20
Jani Nikula, Intel
