Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB24DC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 08:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918AC10E197;
	Mon,  3 Apr 2023 08:02:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962E210E197
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680508953; x=1712044953;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2DEUUMaSScyQiv8s5YnjLESbNy3COzp5q2xcg8R99P4=;
 b=Ve0JHpZAMitmNEcDNQDIA56VA4E7u3Y0fSnJ3J6U4yZa3Tn8VOR4eNXv
 /jcgcBpfiMIbM3/kQlZ1zb+RHAEWjfLdxiRG2VtDwcbaj3KQBZxuvqPuu
 z5QK+E7jSJAv3wVxX2WLyJqsz30ZIZDhxOp/sK4yLPmSJnFsr2VTYas7o
 VyZkkK+TpWS6YUfo+6yFkRT6NtJP3qgqlHQqcL8tZKj58sKfJ0Ir8vbTN
 wvuhhTpfaVoarcZ9w0cpvU+pqz3fy841VvMQAPCRlU1WSQtnJ9pemmxqS
 tGjjboC3YVDm0C11/TJObfTT1o5u0KAzirJwqMOoQVVCv5caJzL41ytMe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="343531128"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="343531128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 01:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="663117105"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="663117105"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 01:02:30 -0700
Received: from [10.249.151.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C924D36377;
 Mon,  3 Apr 2023 09:02:29 +0100 (IST)
Message-ID: <36f329f0-f0b1-2171-f02b-82cac41f2bdf@intel.com>
Date: Mon, 3 Apr 2023 10:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230312191442.1609-1-michal.wajdeczko@intel.com>
 <ZB3tpsMC6DTOBHyM@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZB3tpsMC6DTOBHyM@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Introduce GT oriented log
 messages
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 24.03.2023 19:36, Rodrigo Vivi wrote:
> On Sun, Mar 12, 2023 at 08:14:41PM +0100, Michal Wajdeczko wrote:
>> While debugging GT related problems, it's good to know which GT was
>> reporting problems. Introduce helper macros to allow prefix GT logs
>> with GT idetifier. We will use them in upcoming patches.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_printk.h | 45 +++++++++++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>> new file mode 100644
>> index 000000000000..b12a92024126
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_PRINTK_H_
>> +#define _XE_GT_PRINTK_H_
>> +
>> +#include <drm/drm_print.h>
>> +#include "xe_gt_types.h"
>> +
>> +#define gt_printk(_gt, _level, _fmt, ...) \
>> +	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> 
> do we really need this one? setting the level as a second argument sounds not
> aligned with the rest.

this is just internal helper macro for other macros below
same approach as in pci_dev related macros - see [1]

[1] https://elixir.bootlin.com/linux/latest/C/ident/pci_printk

> 
> But everything else in this series is great.

thanks, note updated version here [2]

[2] https://patchwork.freedesktop.org/series/115083/

> you know I hate these macros in general, but this one makes everything
> cleaner and straighforward when you are withing the gt...

IMO we should also have xe_printk and family but there are few who are
strongly against, so I don't even try to send it

> 
> My only concern is that we will always end up with patches using
> the other drm helpers directly... but probably just a matter of time
> until folks gets used to it...

whoever worked with multi-tile issues then he/she will quickly switch to
new macros as this is must-have to be efficient

> 
>> +
>> +#define gt_err(_gt, _fmt, ...) \
>> +	gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
>> +
>> +#define gt_warn(_gt, _fmt, ...) \
>> +	gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
>> +
>> +#define gt_notice(_gt, _fmt, ...) \
>> +	gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>> +
>> +#define gt_info(_gt, _fmt, ...) \
>> +	gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>> +
>> +#define gt_dbg(_gt, _fmt, ...) \
>> +	gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>> +
>> +#define gt_err_ratelimited(_gt, _fmt, ...) \
>> +	gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>> +
>> +#define gt_WARN(_gt, _condition, _fmt, ...) \
>> +	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>> +
>> +#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
>> +	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>> +
>> +#define gt_WARN_ON(_gt, _condition) \
>> +	gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
>> +
>> +#define gt_WARN_ON_ONCE(_gt, _condition) \
>> +	gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
>> +
>> +#endif
>> -- 
>> 2.25.1
>>
