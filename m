Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB2CC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 07:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B58C10E3AA;
	Tue,  8 Aug 2023 07:45:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E477210E3AA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691480730; x=1723016730;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/ExBjK04kpEOX9cwhno6kG5ue6826sNzhiWpWS6tcAs=;
 b=Qe4NIRW40917iuBvtwLiMShbwSp4rM6+e4+wis7j22OIf2nhdSO9jOxi
 yda97oTXQcXGWsI9mgkcO76ExAM0RxtsqxqCoPYouwGd0EbBH0vZtdqqC
 L0NBVcyn8oaELJY66+alxm1lg8CnOo3J+2hqFjIbTuCc3UliFfKsGZRmK
 mT4NqOXV5caU9AymWIZijctrfyNEEEMaVO+NlfxzYNml+u1G5JPJQ6eCl
 6Rn3HSVTVQyByvEFVYjxaCPg/icxgV55JKQPnsy9T2dW+4ENWqVjoY3+Z
 R8S3JAiatIE659IlF6smaY94uLkj1ljttlU56f9J8Rhs8XrKrRflgsV9V A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437077866"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="437077866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 00:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796621176"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="796621176"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 00:45:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230807173446.2039-1-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
Date: Tue, 08 Aug 2023 10:45:26 +0300
Message-ID: <87r0oet1t5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 07 Aug 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> As we are moving away from the controversial XE_BUG_ON macro,
> relying just on WARN_ON or drm_err does not cover the cases
> where we want to annotate functions with additional detailed
> debug checks to assert that all prerequisites are satisfied,
> without paying footprint or performance penalty on non-debug
> builds, where all misuses introduced during code integration
> were already fixed.
>
> Introduce family of xe_ASSERT macros that try to follow classic
> assert() utility and can be compiled out on non-debug builds.
>
> Macros are based on drm_WARN, but unlikely to origin, disallow
> use in expressions since we will compile that code out.

Final bikeshedding... thought of the inconsistency between:

 - drm_WARN_ON <-> xe_ASSERT
 - drm_WARN <-> xe_ASSERT_MSG

and wondering if xe_ASSERT_ON and xe_ASSERT would be more in line.

*shrug*

Either way, this looks fine.

BR,
Jani.




>
> As we are operating on the xe pointers, we can print additional
> information about the device, like tile or GT identifier, that
> is not available from generic WARN report:
>
> [ ] xe 0000:00:02.0: [drm] Assertion `true =3D=3D false` failed!
>     platform: 1 subplatform: 1
>     graphics: Xe_LP 12.0 step B0
>     media: Xe_M 12.0 step B0
>     display: enabled step D0
>     tile: 0 VRAM 0 B
>     GT: 0 type 1
>
> [ ] xe 0000:b3:00.0: [drm] Assertion `true =3D=3D false` failed!
>     platform: 7 subplatform: 3
>     graphics: Xe_HPG 12.55 step A1
>     media: Xe_HPM 12.55 step A1
>     display: disabled step **
>     tile: 0 VRAM 14.0 GiB
>     GT: 0 type 1
>
> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_de=
vice_probe+0x374/0x520 [xe]
> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> [ ] Call Trace:
> [ ]  ? __warn+0x7b/0x160
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? report_bug+0x1c3/0x1d0
> [ ]  ? handle_bug+0x42/0x70
> [ ]  ? exc_invalid_op+0x14/0x70
> [ ]  ? asm_exc_invalid_op+0x16/0x20
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> [ ]  pci_device_probe+0x9e/0x160
> [ ]  really_probe+0x19d/0x400
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_asser=
t.h
> new file mode 100644
> index 000000000000..7ea295b7091c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -0,0 +1,160 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_ASSERT_H__
> +#define __XE_ASSERT_H__
> +
> +#include <linux/string_helpers.h>
> +#include <drm/drm_print.h>
> +#include "xe_device_types.h"
> +#include "xe_step.h"
> +
> +/**
> + * DOC: Xe ASSERTs
> + *
> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> + * complex enough that some changes introduced while adding new function=
ality
> + * could break the existing code.
> + *
> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage coul=
d lead
> + * to undesired increased driver footprint and may impact production dri=
ver
> + * performance as this additional code will be always present.
> + *
> + * To allow annotate functions with additional detailed debug checks to =
assert
> + * that all prerequisites are satisfied, without worrying about footprin=
t or
> + * performance penalty on production builds where all potential misuses
> + * introduced during code integration were already fixed, we introduce f=
amily
> + * of ASSERT macros that try to follow classic assert() utility and can =
be
> + * compiled out on non-debug builds:
> + *
> + *  * &xe_ASSERT
> + *  * &xe_tile_ASSERT
> + *  * &xe_gt_ASSERT
> + *
> + * These macros are based on &drm_WARN, but unlikely to the origin, we d=
isallow
> + * use of them in an expressions since we will compile that code out.
> + *
> + * Note that these macros shall not be used to cover known gaps in the
> + * implementation, for such cases use &drm_WARN or &drm_err and provide =
valid
> + * safe fallback.
> + *
> + * Below code shows how asserts could help in debug to catch unplanned u=
se::
> + *
> + *	static void one_igfx(struct xe_device *xe)
> + *	{
> + *		xe_ASSERT(xe, xe->info.is_dgfx =3D=3D false);
> + *		xe_ASSERT(xe, xe->info.tile_count =3D=3D 1);
> + *	}
> + *
> + *	static void two_dgfx(struct xe_device *xe)
> + *	{
> + *		xe_ASSERT(xe, xe->info.is_dgfx);
> + *		xe_ASSERT(xe, xe->info.tile_count =3D=3D 2);
> + *	}
> + *
> + *	void foo(struct xe_device *xe)
> + *	{
> + *		if (xe->info.dgfx)
> + *			return two_dgfx(xe);
> + *		return one_igfx(xe);
> + *	}
> + */
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s`=
 failed!\n" msg,	\
> +		       __stringify(condition), ## arg);						\
> +})
> +#else
> +#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
> +	typecheck(struct xe_device *, xe);							\
> +	BUILD_BUG_ON_INVALID(condition);							\
> +})
> +#endif
> +
> +/**
> + * xe_ASSERT - warn if condition is false when debugging.
> + * @xe: the &struct xe_device pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_ASSERT() uses &drm_WARN to emit a warning and print additional inf=
ormation
> + * that could be read from the &xe pointer if provided &condition is fal=
se.
> + *
> + * Contrary to &drm_WARN, xe_ASSERT() is effective only on debug builds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressi=
ons
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_ASSERT(xe, condition) xe_ASSERT_MSG((xe), condition, "")
> +#define xe_ASSERT_MSG(xe, condition, msg, arg...) ({						\
> +	struct xe_device *__xe =3D (xe);								\
> +	__XE_ASSERT_MSG(__xe, condition,							\
> +			"platform: %d subplatform: %d\n"					\
> +			"graphics: %s %u.%u step %s\n"						\
> +			"media: %s %u.%u step %s\n"						\
> +			"display: %s step %s\n"							\
> +			msg,									\
> +			__xe->info.platform, __xe->info.subplatform,				\
> +			__xe->info.graphics_name,						\
> +			__xe->info.graphics_verx100 / 100,					\
> +			__xe->info.graphics_verx100 % 100,					\
> +			xe_step_name(__xe->info.step.graphics),					\
> +			__xe->info.media_name,							\
> +			__xe->info.media_verx100 / 100,						\
> +			__xe->info.media_verx100 % 100,						\
> +			xe_step_name(__xe->info.step.media),					\
> +			str_enabled_disabled(__xe->info.enable_display),			\
> +			xe_step_name(__xe->info.step.display),					\
> +			## arg);								\
> +})
> +
> +/**
> + * xe_tile_ASSERT - warn if condition is false when debugging.
> + * @tile: the &struct xe_tile pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_tile_ASSERT() uses &drm_WARN to emit a warning and print additional
> + * information that could be read from the &tile pointer if provided &co=
ndition
> + * is false.
> + *
> + * Contrary to &drm_WARN, xe_tile_ASSERT() is effective only on debug bu=
ilds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressi=
ons
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_tile_ASSERT(tile, condition) xe_tile_ASSERT_MSG((tile), condi=
tion, "")
> +#define xe_tile_ASSERT_MSG(tile, condition, msg, arg...) ({					\
> +	struct xe_tile *__tile =3D (tile);							\
> +	char __buf[10];										\
> +	xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,	=
		\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_=
size, 1,	\
> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> +})
> +
> +/**
> + * xe_gt_ASSERT - warn if condition is false when debugging.
> + * @gt: the &struct xe_gt pointer to which &condition applies
> + * @condition: condition to check
> + *
> + * xe_gt_ASSERT() uses &drm_WARN to emit a warning and print additional
> + * information that could be safetely read from the &gt pointer if provi=
ded
> + * &condition is false.
> + *
> + * Contrary to &drm_WARN, xe_gt_ASSERT() is effective only on debug buil=
ds
> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressi=
ons
> + * or as a condition.
> + *
> + * See `Xe ASSERTs`_ for general usage guidelines.
> + */
> +#define xe_gt_ASSERT(gt, condition) xe_gt_ASSERT_MSG((gt), condition, "")
> +#define xe_gt_ASSERT_MSG(gt, condition, msg, arg...) ({						\
> +	struct xe_gt *__gt =3D (gt);								\
> +	xe_tile_ASSERT_MSG(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,=
			\
> +			   __gt->info.id, __gt->info.type, ## arg);				\
> +})
> +
> +#endif /* __XE_ASSERT_H__ */

--=20
Jani Nikula, Intel Open Source Graphics Center
