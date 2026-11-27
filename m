Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D52606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KSvvymDu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE37112B34;
	Fri, 27 Nov 2026 15:14:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9D4112B34;
 Fri, 27 Nov 2026 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795792467; x=1827328467;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=D6TVnE/HikdehnKMqK2Y+skZUaAb0IJRJrNLk0Y+6rc=;
 b=KSvvymDuqSq06cYjLyxM9Qfa1CNgbJ9iy8rYmtnd7S2WP4v0bF+bn8Lr
 p1iB2Q6Q3aURFpZg5Jq5oh1eS/ZpbW/tYlJKx4ve6YXhGGMxZeIhPTzEp
 VlqA9PCmPKton64CbKX4pYumGEz6SK8OvPAgpPCPiv4V5enMk16MOu3KT
 dK+HRmAGze9x6fWQeJugWwGpMkabRl+B9z8mDGZ7M4a0sd12YfiB8fQz7
 sOUg+/2yR8xwtDSDypvWwz4jbHvwDPxI8h8nLL9xbljnuqynPO/LnSH15
 wjZ5NiFwKxGGFkqFIupCd5eLtUisUal/zW8DkJ4OY48fIBB2crE5f523B A==;
X-CSE-ConnectionGUID: Yc4+z3SbR2SZGrjPnFRYAA==
X-CSE-MsgGUID: I8XPAPqeSoSZCj/vKQzCrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4634780"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4634780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 07:14:27 -0800
X-CSE-ConnectionGUID: zFf+muY+Q4efmnSAErY2Zw==
X-CSE-MsgGUID: MFAaWnZKTayqGNanBCuJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12762267"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 07:14:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/7] drm/xe: Nuke the compat uncore stuff
In-Reply-To: <20261126212728.9034-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
 <20261126212728.9034-7-ville.syrjala@linux.intel.com>
Date: Fri, 27 Nov 2026 17:14:22 +0200
Message-ID: <c6ccb1acac119f29861c3dc666c3175d60d9e87f@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The display code no longer uses any uncore stuff, so nuke the
> compatibility layer from xe.

I was a bit eager with merging commit a54880740531 ("drm/xe: remove
unused fake uncore lock") so this needs a rebase. Sorry.

compat intel_uncore_trace.h should also be removed, either in this patch
or alreayd in patch 2.

Another comment inline below, other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h | 66 -------------------
>  drivers/gpu/drm/xe/display/xe_display.c       |  3 -
>  drivers/gpu/drm/xe/xe_device_types.h          | 13 ----
>  3 files changed, 82 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/driv=
ers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> deleted file mode 100644
> index 707f7ad0378d..000000000000
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright =C2=A9 2023 Intel Corporation
> - */
> -
> -#ifndef __INTEL_UNCORE_H__
> -#define __INTEL_UNCORE_H__
> -
> -#include "i915_reg_defs.h"
> -#include "xe_device.h"
> -#include "xe_device_types.h"
> -#include "xe_mmio.h"
> -
> -static inline struct intel_uncore *to_intel_uncore(struct drm_device *dr=
m)
> -{
> -	return &to_xe_device(drm)->uncore;
> -}
> -
> -static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncor=
e *uncore)
> -{
> -	struct xe_device *xe =3D container_of(uncore, struct xe_device, uncore);
> -
> -	return xe_root_tile_mmio(xe);
> -}
> -
> -static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
> -				    i915_reg_t i915_reg)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
> -}
> -
> -static inline void intel_uncore_write8(struct intel_uncore *uncore,
> -				       i915_reg_t i915_reg, u8 val)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	xe_mmio_write8(__compat_uncore_to_mmio(uncore), reg, val);
> -}
> -
> -static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
> -				      i915_reg_t i915_reg)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
> -}
> -
> -static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
> -				       i915_reg_t i915_reg)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> -}
> -
> -static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
> -					 i915_reg_t i915_reg, u32 val)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
> -}
> -
> -#endif /* __INTEL_UNCORE_H__ */
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 5ace8295b498..6a179d0683e5 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -85,9 +85,6 @@ int xe_display_init_early(struct xe_device *xe)
>  	if (!xe->info.probe_display)
>  		return 0;
>=20=20
> -	/* Fake uncore lock */
> -	spin_lock_init(&xe->uncore.lock);
> -
>  	intel_display_driver_early_probe(display);
>=20=20
>  	intel_display_device_info_runtime_init(display);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 9e0d7d3d07d5..abc70c949b2c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -649,19 +649,6 @@ struct xe_device {
>  #endif
>=20=20
>  	/* private: */

The above blank line and comment need to go as well, they're just for
indicating the display stuff isn't documented here.

And yay!!! Getting rid of this stuff is a major milestone long time
coming!

> -
> -#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> -	/*
> -	 * Any fields below this point are the ones used by display.
> -	 * They are temporarily added here so xe_device can be desguised as
> -	 * drm_i915_private during build. After cleanup these should go away,
> -	 * migrating to the right sub-structs
> -	 */
> -
> -	struct intel_uncore {
> -		spinlock_t lock;
> -	} uncore;
> -#endif
>  };
>=20=20
>  /**

--=20
Jani Nikula, Intel
