Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABF6CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 13:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68810E24E;
	Tue, 12 Sep 2023 13:34:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D05F10E23B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694525658; x=1726061658;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=a2/YNUj1IDGoAo1/GJudwZK+dCvYfwjMM8TTM8W2IAI=;
 b=RWpXtOtv+0hLyxyAxiU3anWz7vcKPEpAjw3qC5zJJ1FC7/EISriS2VKY
 H4zG/zsAM1TPJylaNu+vE7w8KoTEHg4IM4GmyyFE83gQCb8eIPvLkY44D
 nKNN96N0Tx9zRDULkdU8GvPCkiIxAnCWHYNE4AwR08csj7GBICB9ZdS0X
 UuQdrytGrjwk7n9vG6HgOYBR2ElSkfMWOxFeF6WWEQZIArEGfQsfb4R0h
 Gfpy4JTM0xhcx8N+If+CA8PSHRQLhUPetiAs31EWun2IFU3ouPoGt/pW8
 fH4SVWsXFF1k+lqUPSZS3sjBpihHH6RJmz0JqRoJ62Fiwe+KRoHpI/PFx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381074929"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381074929"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990502467"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="990502467"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:34:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com> <87pm2nd3p1.fsf@intel.com>
 <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com>
Date: Tue, 12 Sep 2023 16:34:05 +0300
Message-ID: <871qf3y0qa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/xe: Introduce Xe assert macros
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 12.09.2023 13:35, Jani Nikula wrote:
>> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>> As we are moving away from the controversial XE_BUG_ON macro,
>>> relying just on WARN_ON or drm_err does not cover the cases
>>> where we want to annotate functions with additional detailed
>>> debug checks to assert that all prerequisites are satisfied,
>>> without paying footprint or performance penalty on non-debug
>>> builds, where all misuses introduced during code integration
>>> were already fixed.
>>>
>>> Introduce family of Xe assert macros that try to follow classic
>>> assert() utility and can be compiled out on non-debug builds.
>>>
>>> Macros are based on drm_WARN, but unlikely to origin, disallow
>>> use in expressions since we will compile that code out.
>>>
>>> As we are operating on the xe pointers, we can print additional
>>> information about the device, like tile or GT identifier, that
>>> is not available from generic WARN report:
>>>
>>> [ ] xe 0000:00:02.0: [drm] Assertion `true =3D=3D false` failed!
>>>     platform: 1 subplatform: 1
>>>     graphics: Xe_LP 12.00 step B0
>>>     media: Xe_M 12.00 step B0
>>>     display: enabled step D0
>>>     tile: 0 VRAM 0 B
>>>     GT: 0 type 1
>>>
>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true =3D=3D false` failed!
>>>     platform: 7 subplatform: 3
>>>     graphics: Xe_HPG 12.55 step A1
>>>     media: Xe_HPM 12.55 step A1
>>>     display: disabled step **
>>>     tile: 0 VRAM 14.0 GiB
>>>     GT: 0 type 1
>>>
>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_=
device_probe+0x374/0x520 [xe]
>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>>> [ ] Call Trace:
>>> [ ]  ? __warn+0x7b/0x160
>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>> [ ]  ? report_bug+0x1c3/0x1d0
>>> [ ]  ? handle_bug+0x42/0x70
>>> [ ]  ? exc_invalid_op+0x14/0x70
>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
>>> [ ]  pci_device_probe+0x9e/0x160
>>> [ ]  really_probe+0x19d/0x400
>>>
>>> v2: use lowercase names
>>> v3: apply xe coding style
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 177 insertions(+)
>>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_ass=
ert.h
>>> new file mode 100644
>>> index 000000000000..b2d3c9b82b31
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>>> @@ -0,0 +1,177 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright =C2=A9 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_ASSERT_H_
>>> +#define _XE_ASSERT_H_
>>> +
>>> +#include <linux/string_helpers.h>
>>> +
>>> +#include <drm/drm_print.h>
>>> +
>>> +#include "xe_device_types.h"
>>> +#include "xe_step.h"
>>> +
>>> +/**
>>> + * DOC: Xe ASSERTs
>>> + *
>>> + * While Xe driver aims to be simpler than legacy i915 driver it is st=
ill
>>> + * complex enough that some changes introduced while adding new functi=
onality
>>> + * could break the existing code.
>>> + *
>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage co=
uld lead
>>> + * to undesired increased driver footprint and may impact production d=
river
>>> + * performance as this additional code will be always present.
>>> + *
>>> + * To allow annotate functions with additional detailed debug checks t=
o assert
>>> + * that all prerequisites are satisfied, without worrying about footpr=
int or
>>> + * performance penalty on production builds where all potential misuses
>>> + * introduced during code integration were already fixed, we introduce=
 family
>>> + * of Xe assert macros that try to follow classic assert() utility:
>>> + *
>>> + *  * &xe_assert
>>> + *  * &xe_tile_assert
>>> + *  * &xe_gt_assert
>>> + *
>>> + * These macros are implemented on top of &drm_WARN, but unlikely to t=
he origin,
>>> + * warning is triggered when provided condition is false. Additionally=
 all above
>>> + * assert macros cannot be used in expressions or as a condition, since
>>> + * underlying code will be compiled out on non-debug builds.
>>> + *
>>> + * Note that these macros are not intended for use to cover known gaps=
 in the
>>> + * implementation; for such cases use regular &drm_WARN or &drm_err an=
d provide
>>> + * valid safe fallback.
>>> + *
>>> + * Also in cases where performance or footprint is not an issue, devel=
opers
>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure =
that bug
>>> + * reports from production builds will contain meagningful diagnostics=
 data.
>>> + *
>>> + * Below code shows how asserts could help in debug to catch unplanned=
 use::
>>> + *
>>> + *	static void one_igfx(struct xe_device *xe)
>>> + *	{
>>> + *		xe_assert(xe, xe->info.is_dgfx =3D=3D false);
>>> + *		xe_assert(xe, xe->info.tile_count =3D=3D 1);
>>> + *	}
>>> + *
>>> + *	static void two_dgfx(struct xe_device *xe)
>>> + *	{
>>> + *		xe_assert(xe, xe->info.is_dgfx);
>>> + *		xe_assert(xe, xe->info.tile_count =3D=3D 2);
>>> + *	}
>>> + *
>>> + *	void foo(struct xe_device *xe)
>>> + *	{
>>> + *		if (xe->info.dgfx)
>>> + *			return two_dgfx(xe);
>>> + *		return one_igfx(xe);
>>> + *	}
>>> + *
>>> + *	void bar(struct xe_device *xe)
>>> + *	{
>>> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
>>> + *			return;
>>> + *
>>> + *		if (xe->info.tile_count =3D=3D 2)
>>> + *			return two_dgfx(xe);
>>> + *		return one_igfx(xe);
>>> + *	}
>>> + */
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%=
s` failed!\n" msg,	\
>>> +		       __stringify(condition), ## arg);						\
>>> +})
>>> +#else
>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
>>> +	typecheck(struct xe_device *, xe);							\
>>> +	BUILD_BUG_ON_INVALID(condition);							\
>>> +})
>>> +#endif
>>> +
>>> +/**
>>> + * xe_assert - warn if condition is false when debugging.
>>> + * @xe: the &struct xe_device pointer to which &condition applies
>>> + * @condition: condition to check
>>> + *
>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional i=
nformation
>>> + * that could be read from the &xe pointer if provided &condition is f=
alse.
>>> + *
>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expres=
sions
>>> + * or as a condition.
>>> + *
>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>> + */
>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
>>> +	struct xe_device *__xe =3D (xe);								\
>>> +	__xe_assert_msg(__xe, condition,							\
>>> +			"platform: %d subplatform: %d\n"					\
>>> +			"graphics: %s %u.%02u step %s\n"					\
>>> +			"media: %s %u.%02u step %s\n"						\
>>> +			"display: %s step %s\n"							\
>>> +			msg,									\
>>> +			__xe->info.platform, __xe->info.subplatform,				\
>>> +			__xe->info.graphics_name,						\
>>> +			__xe->info.graphics_verx100 / 100,					\
>>> +			__xe->info.graphics_verx100 % 100,					\
>>> +			xe_step_name(__xe->info.step.graphics),					\
>>> +			__xe->info.media_name,							\
>>> +			__xe->info.media_verx100 / 100,						\
>>> +			__xe->info.media_verx100 % 100,						\
>>> +			xe_step_name(__xe->info.step.media),					\
>>> +			str_enabled_disabled(__xe->info.enable_display),			\
>>> +			xe_step_name(__xe->info.step.display),					\
>>> +			## arg);								\
>>> +})
>>=20
>> I guess I have missed this huge splat all along... Why is it necessary?
>> If you print the device id, all the information should be there already,
>> right?
>
> somewhere in the dmesg (if someone/CI was clever enough) maybe yes
>
> but in bug reports usually only the WARN is included, so exposing some
> basic info here for quicker triage

I just think it's unnecessary duplication. Most likely this will only be
enabled in CI only anyway.

>
>>=20
>> This also makes it impossible to use xe_assert() with a NULL xe device
>> pointer in contexts where you don't have the device available.
>
> there was no such requirement (but we can add that if needed)
>
> note that code is based on drm_WARN() which also doesn't work with NULL

Ah, true. The drm_dbg and friends do.

>
> Michal
>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>>> +
>>> +/**
>>> + * xe_tile_assert - warn if condition is false when debugging.
>>> + * @tile: the &struct xe_tile pointer to which &condition applies
>>> + * @condition: condition to check
>>> + *
>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additio=
nal
>>> + * information that could be read from the &tile pointer if provided &=
condition
>>> + * is false.
>>> + *
>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug =
builds
>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expres=
sions
>>> + * or as a condition.
>>> + *
>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>> + */
>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), con=
dition, "")
>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
>>> +	struct xe_tile *__tile =3D (tile);							\
>>> +	char __buf[10];										\
>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg=
,			\
>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physica=
l_size, 1,	\
>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>>> +})
>>> +
>>> +/**
>>> + * xe_gt_assert - warn if condition is false when debugging.
>>> + * @gt: the &struct xe_gt pointer to which &condition applies
>>> + * @condition: condition to check
>>> + *
>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
>>> + * information that could be safetely read from the &gt pointer if pro=
vided
>>> + * &condition is false.
>>> + *
>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug bu=
ilds
>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expres=
sions
>>> + * or as a condition.
>>> + *
>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>> + */
>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, =
"")
>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
>>> +	struct xe_gt *__gt =3D (gt);								\
>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" ms=
g,			\
>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
>>> +})
>>> +
>>> +#endif
>>=20

--=20
Jani Nikula, Intel
