Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055D1CA0EF1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 15:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B927810E42E;
	Tue, 12 Sep 2023 15:11:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA46910E42E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694531481; x=1726067481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sLp9W8t0sPmLBnLJ/Cqzhq5d+JV/dxkIKb200uYG9Y8=;
 b=Da5gqa6UWtBtZJKo63RWnnN9dojxgP7kxGcGxxsI1jIyJHbhu/mUT21x
 /7dGYjKb8Mrrr00DWEnQFtUK/XLqEwgAkTWEcSNdP72Ta87ky3VO0CosY
 Yo5TPpGiDuImoWAnCjWo0yhgCuGen/aNNTWGNdMUZkizcARPYSCxoqaug
 ArEq5/MrdM/ARlbb51v5xsgZAPUitru+N89/PS+uxNHP+hbbA0cMQaY8j
 XC6nryu3rpmv0X9BJPUMBDFUo8OJoXlY0NqqPS4ISzILlBrbfCq1OzSqg
 C1mA1rnnyxx9wlT5SgBx4FKjvg8daRC8aAj/S+y+xlJ+d57jHWv9zLMPK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381106359"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381106359"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 08:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074580495"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="1074580495"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2023 08:11:16 -0700
Received: from [10.249.142.144] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.142.144])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8A737312E1;
 Tue, 12 Sep 2023 16:11:14 +0100 (IST)
Message-ID: <85abfd0d-0eef-b90d-37d2-297cfb53db1e@intel.com>
Date: Tue, 12 Sep 2023 17:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com> <87pm2nd3p1.fsf@intel.com>
 <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com> <871qf3y0qa.fsf@intel.com>
 <268cacb5-2feb-b43f-325f-5aef9cf8951f@intel.com> <ZQBz0Mk3O71oebl+@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZQBz0Mk3O71oebl+@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.09.2023 16:21, Rodrigo Vivi wrote:
> On Tue, Sep 12, 2023 at 03:48:01PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 12.09.2023 15:34, Jani Nikula wrote:
>>> On Tue, 12 Sep 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>>>> On 12.09.2023 13:35, Jani Nikula wrote:
>>>>> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
>>>>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>
>>>>>> As we are moving away from the controversial XE_BUG_ON macro,
>>>>>> relying just on WARN_ON or drm_err does not cover the cases
>>>>>> where we want to annotate functions with additional detailed
>>>>>> debug checks to assert that all prerequisites are satisfied,
>>>>>> without paying footprint or performance penalty on non-debug
>>>>>> builds, where all misuses introduced during code integration
>>>>>> were already fixed.
>>>>>>
>>>>>> Introduce family of Xe assert macros that try to follow classic
>>>>>> assert() utility and can be compiled out on non-debug builds.
>>>>>>
>>>>>> Macros are based on drm_WARN, but unlikely to origin, disallow
>>>>>> use in expressions since we will compile that code out.
>>>>>>
>>>>>> As we are operating on the xe pointers, we can print additional
>>>>>> information about the device, like tile or GT identifier, that
>>>>>> is not available from generic WARN report:
>>>>>>
>>>>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>>>>>>     platform: 1 subplatform: 1
>>>>>>     graphics: Xe_LP 12.00 step B0
>>>>>>     media: Xe_M 12.00 step B0
>>>>>>     display: enabled step D0
>>>>>>     tile: 0 VRAM 0 B
>>>>>>     GT: 0 type 1
>>>>>>
>>>>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>>>>>>     platform: 7 subplatform: 3
>>>>>>     graphics: Xe_HPG 12.55 step A1
>>>>>>     media: Xe_HPM 12.55 step A1
>>>>>>     display: disabled step **
>>>>>>     tile: 0 VRAM 14.0 GiB
>>>>>>     GT: 0 type 1
>>>>>>
>>>>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
>>>>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>>>>>> [ ] Call Trace:
>>>>>> [ ]  ? __warn+0x7b/0x160
>>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>>>> [ ]  ? report_bug+0x1c3/0x1d0
>>>>>> [ ]  ? handle_bug+0x42/0x70
>>>>>> [ ]  ? exc_invalid_op+0x14/0x70
>>>>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
>>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
>>>>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
>>>>>> [ ]  pci_device_probe+0x9e/0x160
>>>>>> [ ]  really_probe+0x19d/0x400
>>>>>>
>>>>>> v2: use lowercase names
>>>>>> v3: apply xe coding style
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 177 insertions(+)
>>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..b2d3c9b82b31
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>>>>>> @@ -0,0 +1,177 @@
>>>>>> +/* SPDX-License-Identifier: MIT */
>>>>>> +/*
>>>>>> + * Copyright © 2023 Intel Corporation
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _XE_ASSERT_H_
>>>>>> +#define _XE_ASSERT_H_
>>>>>> +
>>>>>> +#include <linux/string_helpers.h>
>>>>>> +
>>>>>> +#include <drm/drm_print.h>
>>>>>> +
>>>>>> +#include "xe_device_types.h"
>>>>>> +#include "xe_step.h"
>>>>>> +
>>>>>> +/**
>>>>>> + * DOC: Xe ASSERTs
>>>>>> + *
>>>>>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
>>>>>> + * complex enough that some changes introduced while adding new functionality
>>>>>> + * could break the existing code.
>>>>>> + *
>>>>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
>>>>>> + * to undesired increased driver footprint and may impact production driver
>>>>>> + * performance as this additional code will be always present.
>>>>>> + *
>>>>>> + * To allow annotate functions with additional detailed debug checks to assert
>>>>>> + * that all prerequisites are satisfied, without worrying about footprint or
>>>>>> + * performance penalty on production builds where all potential misuses
>>>>>> + * introduced during code integration were already fixed, we introduce family
>>>>>> + * of Xe assert macros that try to follow classic assert() utility:
>>>>>> + *
>>>>>> + *  * &xe_assert
>>>>>> + *  * &xe_tile_assert
>>>>>> + *  * &xe_gt_assert
>>>>>> + *
>>>>>> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
>>>>>> + * warning is triggered when provided condition is false. Additionally all above
>>>>>> + * assert macros cannot be used in expressions or as a condition, since
>>>>>> + * underlying code will be compiled out on non-debug builds.
>>>>>> + *
>>>>>> + * Note that these macros are not intended for use to cover known gaps in the
>>>>>> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
>>>>>> + * valid safe fallback.
>>>>>> + *
>>>>>> + * Also in cases where performance or footprint is not an issue, developers
>>>>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
>>>>>> + * reports from production builds will contain meagningful diagnostics data.
>>>>>> + *
>>>>>> + * Below code shows how asserts could help in debug to catch unplanned use::
>>>>>> + *
>>>>>> + *	static void one_igfx(struct xe_device *xe)
>>>>>> + *	{
>>>>>> + *		xe_assert(xe, xe->info.is_dgfx == false);
>>>>>> + *		xe_assert(xe, xe->info.tile_count == 1);
>>>>>> + *	}
>>>>>> + *
>>>>>> + *	static void two_dgfx(struct xe_device *xe)
>>>>>> + *	{
>>>>>> + *		xe_assert(xe, xe->info.is_dgfx);
>>>>>> + *		xe_assert(xe, xe->info.tile_count == 2);
>>>>>> + *	}
>>>>>> + *
>>>>>> + *	void foo(struct xe_device *xe)
>>>>>> + *	{
>>>>>> + *		if (xe->info.dgfx)
>>>>>> + *			return two_dgfx(xe);
>>>>>> + *		return one_igfx(xe);
>>>>>> + *	}
>>>>>> + *
>>>>>> + *	void bar(struct xe_device *xe)
>>>>>> + *	{
>>>>>> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
>>>>>> + *			return;
>>>>>> + *
>>>>>> + *		if (xe->info.tile_count == 2)
>>>>>> + *			return two_dgfx(xe);
>>>>>> + *		return one_igfx(xe);
>>>>>> + *	}
>>>>>> + */
>>>>>> +
>>>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
>>>>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
>>>>>> +		       __stringify(condition), ## arg);						\
>>>>>> +})
>>>>>> +#else
>>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
>>>>>> +	typecheck(struct xe_device *, xe);							\
>>>>>> +	BUILD_BUG_ON_INVALID(condition);							\
>>>>>> +})
>>>>>> +#endif
>>>>>> +
>>>>>> +/**
>>>>>> + * xe_assert - warn if condition is false when debugging.
>>>>>> + * @xe: the &struct xe_device pointer to which &condition applies
>>>>>> + * @condition: condition to check
>>>>>> + *
>>>>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
>>>>>> + * that could be read from the &xe pointer if provided &condition is false.
>>>>>> + *
>>>>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
>>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>>>>>> + * or as a condition.
>>>>>> + *
>>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>>>>> + */
>>>>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
>>>>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
>>>>>> +	struct xe_device *__xe = (xe);								\
>>>>>> +	__xe_assert_msg(__xe, condition,							\
>>>>>> +			"platform: %d subplatform: %d\n"					\
>>>>>> +			"graphics: %s %u.%02u step %s\n"					\
>>>>>> +			"media: %s %u.%02u step %s\n"						\
>>>>>> +			"display: %s step %s\n"							\
>>>>>> +			msg,									\
>>>>>> +			__xe->info.platform, __xe->info.subplatform,				\
>>>>>> +			__xe->info.graphics_name,						\
>>>>>> +			__xe->info.graphics_verx100 / 100,					\
>>>>>> +			__xe->info.graphics_verx100 % 100,					\
>>>>>> +			xe_step_name(__xe->info.step.graphics),					\
>>>>>> +			__xe->info.media_name,							\
>>>>>> +			__xe->info.media_verx100 / 100,						\
>>>>>> +			__xe->info.media_verx100 % 100,						\
>>>>>> +			xe_step_name(__xe->info.step.media),					\
>>>>>> +			str_enabled_disabled(__xe->info.enable_display),			\
>>>>>> +			xe_step_name(__xe->info.step.display),					\
>>>>>> +			## arg);								\
>>>>>> +})
>>>>>
>>>>> I guess I have missed this huge splat all along... Why is it necessary?
>>>>> If you print the device id, all the information should be there already,
>>>>> right?
>>>>
>>>> somewhere in the dmesg (if someone/CI was clever enough) maybe yes
>>>>
>>>> but in bug reports usually only the WARN is included, so exposing some
>>>> basic info here for quicker triage
>>>
>>> I just think it's unnecessary duplication. 
>>
>> but what if assert() fires before driver print welcome messages ;)
>>
>> IMO we should try to collect whatever is possible and comes almost at no
>> extra cost (you don't need to type anything, macro takes care of that)
>>
>>> Most likely this will only be
>>> enabled in CI only anyway.
>>
>> I assume asserts will fire mostly during pre-merge testing (either on CI
>> or on tested manually on DUT machines)
> 
> I'm with Jani here. In all of these cases you already know the PCI ID of
> that specific machine, so all this extra information should already be known.
> 
> The only benefit would be to get user reports when we get just that debug
> msg. But also asking for a lspci -nn | grep VGA was never that complicated.

but lspci will not show you the GMDID, so how you will know IP version?
likely same problem with VRAM size as you will see just BAR size, no?
and in the near future how to distinguish between native and PF mode?

> 
> My recommendation is to remove the duplication of this information here.

honestly I don't understand why are we aiming to have totally silent
driver that makes any debug just harder and clueless - maybe it's time
to help early adopters and feature enablers by providing more, even if
duplicated, data which is still better than nothing - like in case when
the driver decides to fail the probe ... you may just start guessing why

> But this is not a blocker in my opinion and we could go with this patch as is.
> 
> Jani, do you see this as a blocker and a new version needed?
> 
> maybe a follow-up later so we don't block this entire series?
> 
> Thanks,
> Rodrigo.
> 
>>
>>>
>>>>
>>>>>
>>>>> This also makes it impossible to use xe_assert() with a NULL xe device
>>>>> pointer in contexts where you don't have the device available.
>>>>
>>>> there was no such requirement (but we can add that if needed)
>>>>
>>>> note that code is based on drm_WARN() which also doesn't work with NULL
>>>
>>> Ah, true. The drm_dbg and friends do.
>>
>> true, so do you want xe_assert() and family to also accept NULL ?
>>
>>>
>>>>
>>>> Michal
>>>>
>>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>
>>>>>> +
>>>>>> +/**
>>>>>> + * xe_tile_assert - warn if condition is false when debugging.
>>>>>> + * @tile: the &struct xe_tile pointer to which &condition applies
>>>>>> + * @condition: condition to check
>>>>>> + *
>>>>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
>>>>>> + * information that could be read from the &tile pointer if provided &condition
>>>>>> + * is false.
>>>>>> + *
>>>>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
>>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>>>>>> + * or as a condition.
>>>>>> + *
>>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>>>>> + */
>>>>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
>>>>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
>>>>>> +	struct xe_tile *__tile = (tile);							\
>>>>>> +	char __buf[10];										\
>>>>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
>>>>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
>>>>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>>>>>> +})
>>>>>> +
>>>>>> +/**
>>>>>> + * xe_gt_assert - warn if condition is false when debugging.
>>>>>> + * @gt: the &struct xe_gt pointer to which &condition applies
>>>>>> + * @condition: condition to check
>>>>>> + *
>>>>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
>>>>>> + * information that could be safetely read from the &gt pointer if provided
>>>>>> + * &condition is false.
>>>>>> + *
>>>>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
>>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>>>>>> + * or as a condition.
>>>>>> + *
>>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
>>>>>> + */
>>>>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
>>>>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
>>>>>> +	struct xe_gt *__gt = (gt);								\
>>>>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
>>>>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
>>>>>> +})
>>>>>> +
>>>>>> +#endif
>>>>>
>>>
