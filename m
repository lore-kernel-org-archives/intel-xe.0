Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD26C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 13:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D3E10E078;
	Tue,  8 Aug 2023 13:58:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D0A10E078
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691503138; x=1723039138;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7YhiNJBfNB3IagZUL0GvsqIliuSVsb5LxiWoleo2FUE=;
 b=OGe/ZKVP45RO8PWRzo5dBvqdwyi5efiIl0Tb9PztNHAJDGmQMfTm3H9V
 NHLxkamdpM+Ls0qYltyHDJ0Rkx/iDeSpmtKOXj06HMS56cGgofYcigXon
 T/CcLQ0snmS/diWbAoMuNpqypwjVcHwo6JI9YmsFWMIcjyXy2sZoapOUh
 lmgd7MSYTxgsl1qkisHeOOE7Jtdl1QkE4HqwcPUfOYR0RkViClTTBWP7L
 bgm9TGlmd6LKctpVEf8G9B7poijDKVlU+rwI0ZkUT9u9sQ69CmnpNuT5w
 TjeVgiC/m22d/3x6Q7cmCbrvDhPK3lywUeEf1f2pcnv98Yhq8WebLl5Aw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373576293"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="373576293"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 06:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724930902"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="724930902"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2023 06:58:54 -0700
Received: from [10.249.136.96] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.136.96])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C393B340D5;
 Tue,  8 Aug 2023 14:58:53 +0100 (IST)
Message-ID: <a82b72a1-2804-1eca-6130-d111e6bf0f78@intel.com>
Date: Tue, 8 Aug 2023 15:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
 <87r0oet1t5.fsf@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87r0oet1t5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 08.08.2023 09:45, Jani Nikula wrote:
> On Mon, 07 Aug 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>> As we are moving away from the controversial XE_BUG_ON macro,
>> relying just on WARN_ON or drm_err does not cover the cases
>> where we want to annotate functions with additional detailed
>> debug checks to assert that all prerequisites are satisfied,
>> without paying footprint or performance penalty on non-debug
>> builds, where all misuses introduced during code integration
>> were already fixed.
>>
>> Introduce family of xe_ASSERT macros that try to follow classic
>> assert() utility and can be compiled out on non-debug builds.
>>
>> Macros are based on drm_WARN, but unlikely to origin, disallow
>> use in expressions since we will compile that code out.
> 
> Final bikeshedding... thought of the inconsistency between:
> 
>  - drm_WARN_ON <-> xe_ASSERT
>  - drm_WARN <-> xe_ASSERT_MSG

but use of _MSG suffix is consistent with:

 - BUILD_BUG_ON(cond)         <-> xe_ASSERT(cond)
 - BUILD_BUG_ON_MSG(cond,msg) <-> xe_ASSERT_MSG(cond,msg)

> 
> and wondering if xe_ASSERT_ON and xe_ASSERT would be more in line.

note that unlike WARN, ASSERT warns if the condition is false, thus
using _ON suffix could be misleading IMO

> 
> *shrug*
> 
> Either way, this looks fine.
> 
> BR,
> Jani.
> 
> 
> 
> 
>>
>> As we are operating on the xe pointers, we can print additional
>> information about the device, like tile or GT identifier, that
>> is not available from generic WARN report:
>>
>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>>     platform: 1 subplatform: 1
>>     graphics: Xe_LP 12.0 step B0
>>     media: Xe_M 12.0 step B0
>>     display: enabled step D0
>>     tile: 0 VRAM 0 B
>>     GT: 0 type 1
>>
>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>>     platform: 7 subplatform: 3
>>     graphics: Xe_HPG 12.55 step A1
>>     media: Xe_HPM 12.55 step A1
>>     display: disabled step **
>>     tile: 0 VRAM 14.0 GiB
>>     GT: 0 type 1
>>
>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>> [ ] Call Trace:
>> [ ]  ? __warn+0x7b/0x160
>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>> [ ]  ? report_bug+0x1c3/0x1d0
>> [ ]  ? handle_bug+0x42/0x70
>> [ ]  ? exc_invalid_op+0x14/0x70
>> [ ]  ? asm_exc_invalid_op+0x16/0x20
>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
>> [ ]  pci_device_probe+0x9e/0x160
>> [ ]  really_probe+0x19d/0x400
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>>  1 file changed, 160 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>> new file mode 100644
>> index 000000000000..7ea295b7091c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>> @@ -0,0 +1,160 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_ASSERT_H__
>> +#define __XE_ASSERT_H__
>> +
>> +#include <linux/string_helpers.h>
>> +#include <drm/drm_print.h>
>> +#include "xe_device_types.h"
>> +#include "xe_step.h"
>> +
>> +/**
>> + * DOC: Xe ASSERTs
>> + *
>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
>> + * complex enough that some changes introduced while adding new functionality
>> + * could break the existing code.
>> + *
>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
>> + * to undesired increased driver footprint and may impact production driver
>> + * performance as this additional code will be always present.
>> + *
>> + * To allow annotate functions with additional detailed debug checks to assert
>> + * that all prerequisites are satisfied, without worrying about footprint or
>> + * performance penalty on production builds where all potential misuses
>> + * introduced during code integration were already fixed, we introduce family
>> + * of ASSERT macros that try to follow classic assert() utility and can be
>> + * compiled out on non-debug builds:
>> + *
>> + *  * &xe_ASSERT
>> + *  * &xe_tile_ASSERT
>> + *  * &xe_gt_ASSERT
>> + *
>> + * These macros are based on &drm_WARN, but unlikely to the origin, we disallow
>> + * use of them in an expressions since we will compile that code out.
>> + *
>> + * Note that these macros shall not be used to cover known gaps in the
>> + * implementation, for such cases use &drm_WARN or &drm_err and provide valid
>> + * safe fallback.
>> + *
>> + * Below code shows how asserts could help in debug to catch unplanned use::
>> + *
>> + *	static void one_igfx(struct xe_device *xe)
>> + *	{
>> + *		xe_ASSERT(xe, xe->info.is_dgfx == false);
>> + *		xe_ASSERT(xe, xe->info.tile_count == 1);
>> + *	}
>> + *
>> + *	static void two_dgfx(struct xe_device *xe)
>> + *	{
>> + *		xe_ASSERT(xe, xe->info.is_dgfx);
>> + *		xe_ASSERT(xe, xe->info.tile_count == 2);
>> + *	}
>> + *
>> + *	void foo(struct xe_device *xe)
>> + *	{
>> + *		if (xe->info.dgfx)
>> + *			return two_dgfx(xe);
>> + *		return one_igfx(xe);
>> + *	}
>> + */
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
>> +		       __stringify(condition), ## arg);						\
>> +})
>> +#else
>> +#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
>> +	typecheck(struct xe_device *, xe);							\
>> +	BUILD_BUG_ON_INVALID(condition);							\
>> +})
>> +#endif
>> +
>> +/**
>> + * xe_ASSERT - warn if condition is false when debugging.
>> + * @xe: the &struct xe_device pointer to which &condition applies
>> + * @condition: condition to check
>> + *
>> + * xe_ASSERT() uses &drm_WARN to emit a warning and print additional information
>> + * that could be read from the &xe pointer if provided &condition is false.
>> + *
>> + * Contrary to &drm_WARN, xe_ASSERT() is effective only on debug builds
>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>> + * or as a condition.
>> + *
>> + * See `Xe ASSERTs`_ for general usage guidelines.
>> + */
>> +#define xe_ASSERT(xe, condition) xe_ASSERT_MSG((xe), condition, "")
>> +#define xe_ASSERT_MSG(xe, condition, msg, arg...) ({						\
>> +	struct xe_device *__xe = (xe);								\
>> +	__XE_ASSERT_MSG(__xe, condition,							\
>> +			"platform: %d subplatform: %d\n"					\
>> +			"graphics: %s %u.%u step %s\n"						\
>> +			"media: %s %u.%u step %s\n"						\
>> +			"display: %s step %s\n"							\
>> +			msg,									\
>> +			__xe->info.platform, __xe->info.subplatform,				\
>> +			__xe->info.graphics_name,						\
>> +			__xe->info.graphics_verx100 / 100,					\
>> +			__xe->info.graphics_verx100 % 100,					\
>> +			xe_step_name(__xe->info.step.graphics),					\
>> +			__xe->info.media_name,							\
>> +			__xe->info.media_verx100 / 100,						\
>> +			__xe->info.media_verx100 % 100,						\
>> +			xe_step_name(__xe->info.step.media),					\
>> +			str_enabled_disabled(__xe->info.enable_display),			\
>> +			xe_step_name(__xe->info.step.display),					\
>> +			## arg);								\
>> +})
>> +
>> +/**
>> + * xe_tile_ASSERT - warn if condition is false when debugging.
>> + * @tile: the &struct xe_tile pointer to which &condition applies
>> + * @condition: condition to check
>> + *
>> + * xe_tile_ASSERT() uses &drm_WARN to emit a warning and print additional
>> + * information that could be read from the &tile pointer if provided &condition
>> + * is false.
>> + *
>> + * Contrary to &drm_WARN, xe_tile_ASSERT() is effective only on debug builds
>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>> + * or as a condition.
>> + *
>> + * See `Xe ASSERTs`_ for general usage guidelines.
>> + */
>> +#define xe_tile_ASSERT(tile, condition) xe_tile_ASSERT_MSG((tile), condition, "")
>> +#define xe_tile_ASSERT_MSG(tile, condition, msg, arg...) ({					\
>> +	struct xe_tile *__tile = (tile);							\
>> +	char __buf[10];										\
>> +	xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>> +})
>> +
>> +/**
>> + * xe_gt_ASSERT - warn if condition is false when debugging.
>> + * @gt: the &struct xe_gt pointer to which &condition applies
>> + * @condition: condition to check
>> + *
>> + * xe_gt_ASSERT() uses &drm_WARN to emit a warning and print additional
>> + * information that could be safetely read from the &gt pointer if provided
>> + * &condition is false.
>> + *
>> + * Contrary to &drm_WARN, xe_gt_ASSERT() is effective only on debug builds
>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
>> + * or as a condition.
>> + *
>> + * See `Xe ASSERTs`_ for general usage guidelines.
>> + */
>> +#define xe_gt_ASSERT(gt, condition) xe_gt_ASSERT_MSG((gt), condition, "")
>> +#define xe_gt_ASSERT_MSG(gt, condition, msg, arg...) ({						\
>> +	struct xe_gt *__gt = (gt);								\
>> +	xe_tile_ASSERT_MSG(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
>> +			   __gt->info.id, __gt->info.type, ## arg);				\
>> +})
>> +
>> +#endif /* __XE_ASSERT_H__ */
> 
