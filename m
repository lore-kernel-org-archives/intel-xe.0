Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDDAC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BD110E0AB;
	Tue,  8 Aug 2023 18:37:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D959310E0AB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519876; x=1723055876;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oGqSjyGg9C09YP7fugfOt0iNRmx8py0QCL4oeDtAOzQ=;
 b=jh3W+Fly9agkMsqTLJjcm8xtjX7M0CCtD04fPbFhaGb9o10CKapqJxCM
 iwUS5zG6OBLm3c/ietSrQm7MjHtoiwnRXy7jT9QGv+barjg4g0Ul0QA7k
 jIrywuKQE3cShw9qusw8o5M3AGcZqIqsv6/jp2yzFGcJa0nr6a1vtyZ36
 AXn6iXZAHNIXrOnR5pD2Ck4Kutf7jZ1wFyLhmOaXDdZ5s0ygw/Vc3Gl1T
 HBMqyffyrjNYAhVernoFaosFcDVcjXcp/kfLdnMkjl5p+OzKsZg2SL7Ht
 lpauOvNW2phDrv59IYfQqw2XBrm/AOjimdrZFZsfZeDZhM1kpgui1m/Vm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369816779"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="369816779"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978019361"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="978019361"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 11:37:54 -0700
Received: from [10.249.136.96] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.136.96])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E86A733BC4;
 Tue,  8 Aug 2023 19:37:52 +0100 (IST)
Message-ID: <39ed0d5d-c3f2-f0aa-47c9-ff244965ac68@intel.com>
Date: Tue, 8 Aug 2023 20:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
 <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
 <87y1ilshhn.fsf@intel.com>
 <uc5h46hdu34kr5yrng7jpn4o5fobs5z5ttkfqshqzqg3i4lyfc@ecqj62tyqw5o>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <uc5h46hdu34kr5yrng7jpn4o5fobs5z5ttkfqshqzqg3i4lyfc@ecqj62tyqw5o>
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 08.08.2023 18:28, Lucas De Marchi wrote:
> On Tue, Aug 08, 2023 at 06:04:20PM +0300, Jani Nikula wrote:
>> On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
>>>> As we are moving away from the controversial XE_BUG_ON macro,
>>>> relying just on WARN_ON or drm_err does not cover the cases
>>>> where we want to annotate functions with additional detailed
>>>> debug checks to assert that all prerequisites are satisfied,
>>>> without paying footprint or performance penalty on non-debug
>>>> builds, where all misuses introduced during code integration
>>>> were already fixed.
>>>>
>>>> Introduce family of xe_ASSERT macros that try to follow classic
>>>> assert() utility and can be compiled out on non-debug builds.
>>>>
>>>> Macros are based on drm_WARN, but unlikely to origin, disallow
>>>> use in expressions since we will compile that code out.
>>>>
>>>> As we are operating on the xe pointers, we can print additional
>>>> information about the device, like tile or GT identifier, that
>>>> is not available from generic WARN report:
>>>>
>>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>>>>    platform: 1 subplatform: 1
>>>>    graphics: Xe_LP 12.0 step B0
>>>>    media: Xe_M 12.0 step B0
>>>>    display: enabled step D0
>>>>    tile: 0 VRAM 0 B
>>>>    GT: 0 type 1
>>>>
>>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>>>>    platform: 7 subplatform: 3
>>>>    graphics: Xe_HPG 12.55 step A1
>>>>    media: Xe_HPM 12.55 step A1
>>>>    display: disabled step **
>>>>    tile: 0 VRAM 14.0 GiB
>>>>    GT: 0 type 1
>>>>
>>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281
>>>> xe_device_probe+0x374/0x520 [xe]
>>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>>>> [ ] Call Trace:
>>>> [ ]  ? __warn+0x7b/0x160
>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>> [ ]  ? report_bug+0x1c3/0x1d0
>>>> [ ]  ? handle_bug+0x42/0x70
>>>> [ ]  ? exc_invalid_op+0x14/0x70
>>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
>>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
>>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
>>>> [ ]  pci_device_probe+0x9e/0x160
>>>> [ ]  really_probe+0x19d/0x400
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
>>>> 1 file changed, 160 insertions(+)
>>>> create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h
>>>> b/drivers/gpu/drm/xe/xe_assert.h
>>>> new file mode 100644
>>>> index 000000000000..7ea295b7091c
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>>>> @@ -0,0 +1,160 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef __XE_ASSERT_H__
>>>> +#define __XE_ASSERT_H__
>>>> +
>>>> +#include <linux/string_helpers.h>
>>>> +#include <drm/drm_print.h>
>>>> +#include "xe_device_types.h"
>>>> +#include "xe_step.h"
>>>> +
>>>> +/**
>>>> + * DOC: Xe ASSERTs
>>>> + *
>>>> + * While Xe driver aims to be simpler than legacy i915 driver it is
>>>> still
>>>> + * complex enough that some changes introduced while adding new
>>>> functionality
>>>> + * could break the existing code.
>>>> + *
>>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage
>>>> could lead
>>>> + * to undesired increased driver footprint and may impact
>>>> production driver
>>>> + * performance as this additional code will be always present.
>>>> + *
>>>> + * To allow annotate functions with additional detailed debug
>>>> checks to assert
>>>> + * that all prerequisites are satisfied, without worrying about
>>>> footprint or
>>>> + * performance penalty on production builds where all potential
>>>> misuses
>>>> + * introduced during code integration were already fixed, we
>>>> introduce family
>>>> + * of ASSERT macros that try to follow classic assert() utility and
>>>> can be
>>>> + * compiled out on non-debug builds:
>>>> + *
>>>> + *  * &xe_ASSERT
>>>
>>> pass by comment, not really checking anything else here... Why are we
>>> mixing upper/lower case? It's perfectly fine to use XE_ as the namespace
>>> like is done for other macros.

note that while this functionality is implemented as a macro, due to
necessary inside magic to obtain file/line, from the usage POV it tries
to mimic inline function, so using all upper case, as for simple value
macro, seems incorrect

>>
>> I think it comes from drm_WARN,  

yes, it was following drm_WARN() name pattern (and it uses WARN inside)

>> but yeah, could be XE_ASSERT.

quote from [1] "It's a matter of taste, but the SHOUTING UPPERCASE has
been argued to be less readable than lowercase."

so if you really don't want to mix cases then maybe it should be all
lower case:

 - xe_assert()
 - xe_tile_assert()
 - xe_gt_assert()

[1]
https://cgit.freedesktop.org/drm/drm-tip/commit/include/drm/drm_print.h?id=fb6c7ab8718eb2543695d77ad8302ff81e8e1e32

> 
> yeah... I think copying that would be like perpetuating a mistake.

not sure if that was a mistake, rather nice try to avoid clash with
drm_warn() that was providing different functionality

but since there is no global ASSERT that we follow, we can name it all
lowercase like e.g. lockdep_assert_held()

Michal

> 
> Lucas De Marchi
> 
>>
>>>
>>> Lucas De Marchi
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
