Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E3CC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6440F10F7B7;
	Thu,  2 May 2024 20:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAQC3Fs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8E10F7B7
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714682592; x=1746218592;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OEK56nn0N1YScR4b7/x90Cb3174qEDCdLh0d5ZoiRPs=;
 b=KAQC3Fs2fn33GRAcMTCPCkJeqU0EtyqdJ/upznpXksQ0kzc0HlQOhYjJ
 dSanrhcsO87P3gposRAuWtWFRdIDHFUKEgjcexNxT7Iuy1py9BBOUn2QZ
 /ozTAL1kbDtLVkH05grKN6svtcVjuGbOu44cFIwGkxJMiMCEA89i0oUeW
 TqKUBE+iNMeWzljWrhOkNdFnPO2xxVvzr6BBOfOTnaV6+lmriiIjVmiTk
 DA7hbQMgkRqJnmVYwJJtDd9aHXocsL64OU19+j2GV9G/Bf0c2fUg31fSO
 JTvZWknfZcfEa0LgxVcMNnlpNu3Chw6lyDbXHycVtUUWJEkA6j+OE+fNp w==;
X-CSE-ConnectionGUID: cQ8aWTEdT+KwSbLXaaObeQ==
X-CSE-MsgGUID: nWLWtw1eT8CVJFKvP7eq8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10638144"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10638144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:43:11 -0700
X-CSE-ConnectionGUID: Cz0ECThCSMOr/pqoHYPvTQ==
X-CSE-MsgGUID: MHikGgCsSs64mVC2QN3wrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27655310"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 02 May 2024 13:43:09 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B735232EBF;
 Thu,  2 May 2024 21:43:02 +0100 (IST)
Message-ID: <a56d9a7b-e7b2-4ace-bd01-51454f4397c2@intel.com>
Date: Thu, 2 May 2024 22:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Add helpers for manipulating macro
 arguments
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20240502195619.2483-1-michal.wajdeczko@intel.com>
 <20240502195619.2483-2-michal.wajdeczko@intel.com>
 <nm74vqoumf5tvredns7nluu4m4ud6wimly4ec23ykzh45jfchr@ppjb7yxeruay>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <nm74vqoumf5tvredns7nluu4m4ud6wimly4ec23ykzh45jfchr@ppjb7yxeruay>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 02.05.2024 22:16, Lucas De Marchi wrote:
> On Thu, May 02, 2024 at 09:56:18PM GMT, Michal Wajdeczko wrote:
>> Define generic helpers that will replace private definitions used
>> by the RTP code and will allow reuse by the new code.
>>
>> Put them in new xe_args.h file (instead of infamous xe_macros.h)
>> as once we find more potential users outside of the Xe driver we
>> may want to move all of these macros as-is to linux/args.h.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: don't pollute linux/args.h yet (Andy)
>> ---
>> drivers/gpu/drm/xe/xe_args.h | 114 +++++++++++++++++++++++++++++++++++
>> 1 file changed, 114 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_args.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
>> new file mode 100644
>> index 000000000000..6899fcc9405d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_args.h
>> @@ -0,0 +1,114 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_ARGS_H_
>> +#define _XE_ARGS_H_
>> +
> 
> as Andy mentioned, we could add a comment here stating this can
> eventually be moved to linux/args.h once more users show up.

added to commit message, but could repeat here as well

> 
> or... once we start conflicting with other macros since we are not using
> an XE_ prefix anymore.
> 
>> +#include <linux/args.h>
>> +
>> +/**
>> + * CALL_ARGS - Invoke a macro, but allow parameters to be expanded
>> beforehand.
>> + * @f: name of the macro to invoke
>> + * @args: arguments for the macro
>> + *
>> + * This macro allows calling macros which names might generated or we
>> want to
>> + * make sure it's arguments will be correctly expanded.
>> + *
>> + * Example:
>> + *
>> + *    #define foo    X,Y,Z,Q
>> + *    #define bar    COUNT_ARGS(foo)
>> + *    #define buz    CALL_ARGS(COUNT_ARGS, foo)
>> + *
>> + *    With above definitions bar expands to 1 while buz expands to 4.
>> + */
>> +#define CALL_ARGS(f, args...)        __CALL_ARGS(f, args)
>> +#define __CALL_ARGS(f, args...)        f(args)
>> +
>> +/**
>> + * DROP_FIRST - Returns all arguments except the first one.
>> + * @args: arguments
>> + *
>> + * This helper macro allows manipulation the argument list before
>> passing it
>> + * to the next level macro.
>> + *
>> + * Example:
>> + *
>> + *    #define foo    X,Y,Z,Q
>> + *    #define bar    CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>> + *
>> + *    With above definitions bar expands to 3.
>> + */
>> +#define DROP_FIRST(args...)        __DROP_FIRST(args)
>> +#define __DROP_FIRST(a, b...)        b
>> +
>> +/**
>> + * PICK_FIRST - Returns the first argument.
>> + * @args: arguments
>> + *
>> + * This helper macro allows manipulation the argument list before
>> passing it
>> + * to the next level macro.
>> + *
>> + * Example:
>> + *
>> + *    #define foo    X,Y,Z,Q
>> + *    #define bar    PICK_FIRST(foo)
>> + *
>> + *    With above definitions bar expands to X.
>> + */
>> +#define PICK_FIRST(args...)        __PICK_FIRST(args)
>> +#define __PICK_FIRST(a, b...)        a
>> +
>> +/**
>> + * PICK_LAST - Returns the last argument.
>> + * @args: arguments
>> + *
>> + * This helper macro allows manipulation the argument list before
>> passing it
>> + * to the next level macro.
>> + *
>> + * Like COUNT_ARGS() this macro works up to 12 arguments.
>> + *
>> + * Example:
>> + *
>> + *    #define foo    X,Y,Z,Q
>> + *    #define bar    PICK_LAST(foo)
>> + *
>> + *    With above definitions bar expands to Q.
>> + */
>> +#define PICK_LAST(args...)        __PICK_ARG(COUNT_ARGS(args), args)
>> +#define __PICK_ARG(n, args...)        CALL_ARGS(CONCATENATE(PICK_ARG,
>> n), args)
>> +#define PICK_ARG1(args...)        PICK_FIRST(args)
>> +#define PICK_ARG2(args...)        PICK_ARG1(DROP_FIRST(args))
>> +#define PICK_ARG3(args...)        PICK_ARG2(DROP_FIRST(args))
>> +#define PICK_ARG4(args...)        PICK_ARG3(DROP_FIRST(args))
>> +#define PICK_ARG5(args...)        PICK_ARG4(DROP_FIRST(args))
>> +#define PICK_ARG6(args...)        PICK_ARG5(DROP_FIRST(args))
>> +#define PICK_ARG7(args...)        PICK_ARG6(DROP_FIRST(args))
>> +#define PICK_ARG8(args...)        PICK_ARG7(DROP_FIRST(args))
>> +#define PICK_ARG9(args...)        PICK_ARG8(DROP_FIRST(args))
>> +#define PICK_ARG10(args...)        PICK_ARG9(DROP_FIRST(args))
>> +#define PICK_ARG11(args...)        PICK_ARG10(DROP_FIRST(args))
>> +#define PICK_ARG12(args...)        PICK_ARG11(DROP_FIRST(args))
>> +
>> +/**
>> + * ARGS_SEP_COMMA - Definition of a comma character.
>> + *
>> + * This definition can be used in cases where any intermediate macro
>> expects
>> + * fixed number of arguments, but we want to pass more arguments
>> which can
>> + * be properly evaluated only by the next level macro.
>> + *
>> + * Example:
>> + *
>> + *    #define foo(f)    f(X) f(Y) f(Z) f(Q)
>> + *    #define bar    DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>> + *    #define buz    CALL_ARGS(COUNT_ARGS,
>> DROP_FIRST(foo(ARGS_SEP_COMMA)))
>> + *
>> + *    With above definitions bar expands to
>> + *        "X", "Y", "Z", "Q"
>> + *    and buz expands to 4.
>> + */
>> +#define ARGS_SEP_COMMA            ,
>> +
>> +#endif    /* _LINUX_ARGS_H */
> 
>         ^ wrong one, and anyway can be removed as we don't use
> these comments in xe

oops, that's leftover from copy

> 
> 
> Eventually we may also add a kunit to make sure we don't have surprises.
> As long as the .o match on next patch, not required for now.

well, I do have simple kunit, will try to add it to v3

> 
> with those fixed:
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> thanks
> Lucas De Marchi
> 
>> -- 
>> 2.43.0
>>
