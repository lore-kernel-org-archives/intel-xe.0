Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2512DEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 20:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A7E10E117;
	Fri, 28 Jul 2023 20:33:36 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02410E117
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690576414; x=1722112414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9FgAgDRkdrrMOXyOIGEXGGajWvOKeKZCeiRfzhfzIAM=;
 b=HDkf90OF/bTsQz3uzMrWZaiapYs6Xoy37233qfZGYehdPRYWhMq/IaBO
 lPn6o/ve3u7mRixs/dDDIcaSxwyKCJpIG3TI+n5+GvigeTkQeybCO1Xx+
 MmqMiyMxxJeW2te9YTp+v/v1LR1LewrJvEsDq40QcJ54/g8xSC6QbPALc
 UCAlIw+Skp5aicj/sLxTj7P2xGd59r/u31xCE4vNb+6OzRT5CV6BHxmJN
 Zer438Twkrmq6RG/gMs7VPknzl/9vuytIUh/uvce9wTJUQvRQqIAFS16U
 eWeeuam4JzekP7fsRVQin5lmgePyLuADyfuVWEvxSMyeizMw0uMeDo1RC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="434964251"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="434964251"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 13:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="974208585"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="974208585"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 13:33:31 -0700
Received: from [10.249.133.86] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.133.86])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 957F037B85;
 Fri, 28 Jul 2023 21:33:30 +0100 (IST)
Message-ID: <5e88b39b-6c15-cae4-0a15-0dbd7ef594b4@intel.com>
Date: Fri, 28 Jul 2023 22:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230728192518.1951-1-michal.wajdeczko@intel.com>
 <5abeaa6e197e6f63cb3ae7f66084f011be2fa662.camel@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <5abeaa6e197e6f63cb3ae7f66084f011be2fa662.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC] drm/xe: Introduce xe_ASSERT macros
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 28.07.2023 21:47, Vivi, Rodrigo wrote:
> On Fri, 2023-07-28 at 21:25 +0200, Michal Wajdeczko wrote:
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
> 
> This is indeed much better and clear then the XE_BUG_ON.
> 
> Also, let me be clear that my intention with reply is not to
> block the introduction of this assert macro.

thanks

> 
> But I'd like to raise my concern(s?) with such assert macros:
> 
> In many cases that we currently use these macros are actually
> very useful on production build. Whenever we receive bug reports
> we should be able to ask the reporter to get a dmesg or enable
> a drm.debug and get a message and we could see these, without
> ever having to ask the report to rebuild the kernel with a debug
> config.

you should think of xe_assert() as extension to static_assert() but
aimed to be executed during internal CI builds only, when we run basic
integration tests, and were we are able to quickly catch all misuses,
caused by rapid or multiple changes going in.

> 
> Then, we add this in the code and we start using this everywhere
> without stopping to think if that would be good in a report and
> we end up with a code full of asserts and big problem to get the
> useful information from the bug reports.

those asserts shouldn't fire beyond integration builds - if someone uses
assert() to tag unfinished work, then it's simply wrong, in such cases
true WARN and correct fallback shall be implemented - and that's the
role of the reviewers to spot it ;)

> 
> Aside from the fact that we end up going far from other drm and
> non-drm kernel drivers and starting from day 0 a driver full of
> driver-isms.

maybe because our driver(s) are bigger and more complex ? also much more
developers are working on it, with multiple refactoring going constantly
on, so we should have mechanism to allow us catching unexpected uses
without polluting production driver too much.

btw, DRM already has assert() but named as bug()

[1] https://elixir.bootlin.com/linux/latest/C/ident/DRM_MM_BUG_ON

> 
> I would prefer we have a driver where we make usage of the all
> the drm error, warning, debug, info variants on a case by case,
> carefully analyzing the needs and thinking about the bug reports
> that we might receive from end users.

+1

it would be also nice if driver is correctly handling all errors or
invalid input paths, but at the same time, it shouldn't duplicate checks
that shall be already done at higher layer/caller - with asserts() we
just express our expectations without ignoring other bugs by trying
handle that unexpected case down the stack

> 
>>
>> Macros are based on drm_WARN, but unlikely to origin, disallow
>> use in expressions since we will compile that code out.
>>
>> As we are operating on the xe pointers, we can print additional
>> information about the device, like tile or GT identifier, that
>> is not available from generic WARN report:
>>
>> [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
>>     graphics: Xe_LP 12.0 media: Xe_M 12.0 GT0
>> [ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280
>> xe_device_probe+0x2f5/0x4a0 [xe]
>> [ ] RIP: 0010:xe_device_probe+0x2f5/0x4a0 [xe]
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_assert.h | 47
>> ++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_assert.h
>> b/drivers/gpu/drm/xe/xe_assert.h
>> new file mode 100644
>> index 000000000000..65306768d637
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>> @@ -0,0 +1,47 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_ASSERT_H__
>> +#define __XE_ASSERT_H__
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +
>> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...)
>> ({                                           \
>> +       struct xe_device *__xe =
>> (xe);                                                          \
>> +       int __passed =
>> !!(condition);                                                       
>>     \
>> +       drm_WARN(&__xe->drm, !__passed, "[" DRM_NAME "] Assertion
>> `%s` failed!\n"               \
>> +                "graphics: %s %u.%u media: %s %u.%u "
>> fmt,                                     \
>> +               
>> __stringify(condition),                                              
>>           \
>> +                __xe-
>>> info.graphics_name,                                                 
>>      \
>> +                __xe->info.graphics_verx100 / 100, __xe-
>>> info.graphics_verx100 % 100,          \
>> +                __xe-
>>> info.media_name,                                                    
>>      \
>> +                __xe->info.media_verx100 / 100, __xe-
>>> info.media_verx100 % 100,                \
>> +                ##
>> arg);                                                                
>>        \
>> +       (void)(__passed);                                            
>>                            \
>> +})
>> +
>> +#else
>> +
>> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...)
>> ({                                           \
>> +       typecheck(struct xe_device *,
>> xe);                                                      \
>> +       BUILD_BUG_ON_INVALID(condition);                             
>>                            \
>> +})
>> +
>> +#endif
>> +
>> +#define xe_ASSERT(xe, condition) \
>> +       xe_ASSERT_MSG((xe), condition, "")
>> +
>> +#define xe_tile_ASSERT(tile, condition)
>> ({                                                     \
>> +       struct xe_tile *__tile =
>> (tile);                                                        \
>> +       xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile%u ",
>> __tile->id);                    \
>> +})
>> +
>> +#define xe_gt_ASSERT(gt, condition)
>> ({                                                         \
>> +       struct xe_gt *__gt =
>> (gt);                                                              \
>> +       xe_ASSERT_MSG(gt_to_xe(__gt), condition, "GT%u ", __gt-
>>> info.id);                       \
>> +})
>> +
>> +#endif /* __XE_ASSERT_H__ */
> 
