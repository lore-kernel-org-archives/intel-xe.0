Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1AACA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC8F10E3FE;
	Tue, 12 Sep 2023 11:19:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C587E10E3FE
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694517544; x=1726053544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g0VGnysjEeSvVCedvBnU3l1+PRKy6Lvux0aMb2XXU5A=;
 b=cx5CJnHNb31ZNHH7qdI37qOjgOYO1nlWBOKPnunVedaUvXNJa5R6O7rm
 3sgxkRsIAILiEj+R7tOFK91uSb0bDKaYHjhNWKlzeMVmd3n6RQDWAiCwj
 EODiQwhADX7LbWpMKyhl6iOHpBsaain4CvwJrwg9TS8gOVckFaw9feXcF
 et9VIqmOrfhmCw+VkCR7PSvQyKIVjDecnAWWCqFwSbiFprEKMtjVarIqx
 dSFRcIVBlpBJaxeHqwj1UN1CRclpCNXv7S9dd9bT5KBIWd/y7HXD7UST+
 3yqryMTrabaNU1oFxG85cvhM9s64w+rP4QEJQKcBoBzNfmOum4V31jWU0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381045405"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381045405"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="720365133"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="720365133"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2023 04:19:01 -0700
Received: from [10.249.142.144] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.142.144])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id F174C312CF;
 Tue, 12 Sep 2023 12:18:59 +0100 (IST)
Message-ID: <124627f2-ca2b-c0a5-f394-d77c23fccca0@intel.com>
Date: Tue, 12 Sep 2023 13:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com>
 <ZQArJ0mDJRMWFgIk@fdugast-desk.home> <87y1hbd7bb.fsf@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87y1hbd7bb.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.09.2023 12:17, Jani Nikula wrote:
> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
>> Hi Michal,
>>
>> On Tue, Sep 12, 2023 at 08:36:34AM +0000, Francois Dugast wrote:
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
>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>>>     platform: 1 subplatform: 1
>>>     graphics: Xe_LP 12.00 step B0
>>>     media: Xe_M 12.00 step B0
>>>     display: enabled step D0
>>>     tile: 0 VRAM 0 B
>>>     GT: 0 type 1
>>>
>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>>>     platform: 7 subplatform: 3
>>>     graphics: Xe_HPG 12.55 step A1
>>>     media: Xe_HPM 12.55 step A1
>>>     display: disabled step **
>>>     tile: 0 VRAM 14.0 GiB
>>>     GT: 0 type 1
>>>
>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
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
>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>>> new file mode 100644
>>> index 000000000000..b2d3c9b82b31
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>>> @@ -0,0 +1,177 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
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
>>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
>>> + * complex enough that some changes introduced while adding new functionality
>>> + * could break the existing code.
>>> + *
>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
>>> + * to undesired increased driver footprint and may impact production driver
>>> + * performance as this additional code will be always present.
>>> + *
>>> + * To allow annotate functions with additional detailed debug checks to assert
>>> + * that all prerequisites are satisfied, without worrying about footprint or
>>> + * performance penalty on production builds where all potential misuses
>>> + * introduced during code integration were already fixed, we introduce family
>>> + * of Xe assert macros that try to follow classic assert() utility:
>>> + *
>>> + *  * &xe_assert
>>> + *  * &xe_tile_assert
>>> + *  * &xe_gt_assert
>>> + *
>>> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
>>> + * warning is triggered when provided condition is false. Additionally all above
>>> + * assert macros cannot be used in expressions or as a condition, since
>>> + * underlying code will be compiled out on non-debug builds.
>>> + *
>>> + * Note that these macros are not intended for use to cover known gaps in the
>>> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
>>> + * valid safe fallback.
>>> + *
>>> + * Also in cases where performance or footprint is not an issue, developers
>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
>>> + * reports from production builds will contain meagningful diagnostics data.
>>> + *
>>> + * Below code shows how asserts could help in debug to catch unplanned use::
>>> + *
>>> + *	static void one_igfx(struct xe_device *xe)
>>> + *	{
>>> + *		xe_assert(xe, xe->info.is_dgfx == false);
>>> + *		xe_assert(xe, xe->info.tile_count == 1);
>>> + *	}
>>> + *
>>> + *	static void two_dgfx(struct xe_device *xe)
>>> + *	{
>>> + *		xe_assert(xe, xe->info.is_dgfx);
>>> + *		xe_assert(xe, xe->info.tile_count == 2);
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
>>> + *		if (xe->info.tile_count == 2)
>>> + *			return two_dgfx(xe);
>>> + *		return one_igfx(xe);
>>> + *	}
>>> + */
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
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
>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
>>> + * that could be read from the &xe pointer if provided &condition is false.
>>> + *
>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>>> + * or as a condition.
>>> + *
>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>> + */
>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
>>> +	struct xe_device *__xe = (xe);								\
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
>>> +
>>> +/**
>>> + * xe_tile_assert - warn if condition is false when debugging.
>>> + * @tile: the &struct xe_tile pointer to which &condition applies
>>> + * @condition: condition to check
>>> + *
>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
>>> + * information that could be read from the &tile pointer if provided &condition
>>> + * is false.
>>> + *
>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>>> + * or as a condition.
>>> + *
>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>> + */
>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> 
> Side note, why's the message "" instead of, say, __stringify(condition)?

'msg' is used to pass additional message that we want to print, no need
to pass explicit stringify(condition) here as this will be done by
xe_tile_assert_msg()


> 
>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
>>> +	struct xe_tile *__tile = (tile);							\
>>> +	char __buf[10];										\
>>
>> Just realized the build fails when CONFIG_DRM_XE_DEBUG=n due to:
>>
>> 	drivers/gpu/drm/xe/xe_assert.h:149:14: error: unused variable ‘__buf’ [-Werror=unused-variable]
>> 	149 |         char __buf[10];
>>
>> We probably need to make this variable also depend on CONFIG_DRM_XE_DEBUG.
> 
> __maybe_unused is better here.

yes, __maybe_unused will do the trick

> 
> BR,
> Jani.
> 
>>
>> Francois
>>
>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>>> +})
>>> +
>>> +/**
>>> + * xe_gt_assert - warn if condition is false when debugging.
>>> + * @gt: the &struct xe_gt pointer to which &condition applies
>>> + * @condition: condition to check
>>> + *
>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
>>> + * information that could be safetely read from the &gt pointer if provided
>>> + * &condition is false.
>>> + *
>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>>> + * or as a condition.
>>> + *
>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>> + */
>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
>>> +	struct xe_gt *__gt = (gt);								\
>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
>>> +})
>>> +
>>> +#endif
>>> -- 
>>> 2.34.1
>>>
> 
