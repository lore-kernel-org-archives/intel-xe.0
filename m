Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED212C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6110EB1A;
	Tue,  8 Sep 2026 10:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlkZkUFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F15B10EB1A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788863118; x=1820399118;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9X5xZ593c4q0G/iZOpw8/t0UFEh1bsG1t/3J+zpBH7s=;
 b=DlkZkUFo73GwSDeQUtq+H7KOLuW3SJtblUMJJDFb4oxtWq842gHg0YvQ
 bHyzDOksK5sQC/+5OS6jK61aNcZXCx9rVR+tNq8FNlCokf+588uMCf6MQ
 fy34iuwVZybR+BsHFjf6Sx/iDzVnAAgj3xP2egFrqqyoqws8tLPBZu/OS
 z+NCm/e2d6oygkv0RdvBPlCUAE9BiSLnaGwWYp2k89pJ3TKOGA52/GPP0
 KbcabL9qUpzlkfpzVm4eZGbIhhjb5X2IqRsO4Fmd3PGONTzwO5/j0B7JX
 7ic7T18OHSjkG8PgoVVMXWhzDqsOSolh1L0hDy0ESdyq8Hszf2JzKc04M g==;
X-CSE-ConnectionGUID: qbygClILTIKfCHsL+zsaeg==
X-CSE-MsgGUID: 04uxF7jQSJymptPYq4KktA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93125055"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93125055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:25:18 -0700
X-CSE-ConnectionGUID: wB4w7BZ1QpGcWDLhoXqDVQ==
X-CSE-MsgGUID: lGxIKxHGQoeaPVYWkBzrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="275086509"
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:25:18 -0700
Message-ID: <6b0f0346-51ba-4ba9-9f33-d7366ef84515@Intel.com>
Date: Tue, 8 Sep 2026 15:55:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-7-dnyaneshwar.bhadane@intel.com>
 <ca6d9176-df1f-4a4c-904e-80a1955056f8@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <ca6d9176-df1f-4a4c-904e-80a1955056f8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 26-Aug-26 3:52 PM, Mallesh, Koujalagi wrote:
> 
> On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
>> Replace xe_gt_err() with xe_log_err() using the REGS component tag
>> when the maximum register whitelist slots are exhausted.
>>
>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/ 
>> xe/xe_reg_whitelist.c
>> index cab1b578ca0e..d58c31b30199 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_log.h"
>>   #include "xe_platform_types.h"
>>   #include "xe_reg_sr.h"
>>   #include "xe_rtp.h"
>> @@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct 
>> xe_hw_engine *hwe, struct xe_reg_sr *in
>>           };
>>           if (slot == RING_MAX_NONPRIV_SLOTS) {
>> -            xe_gt_err(hwe->gt,
>> -                  "hwe %s: maximum register whitelist slots (%d) 
>> reached, refusing to add more\n",
>> -                  hwe->name, RING_MAX_NONPRIV_SLOTS);
>> +            xe_log_err(hwe->gt, REGS, EPERM,
> 
> nit: xe_log takes negative error number. Errno should be -EOVERFLOW right?
This is good suggestion. I will update with -EOVERFLOW in next revision.
Thank you. >
> Thanks,
> 
> -/Mallesh
> 
>> +                   "hwe %s: maximum register whitelist slots (%d) 
>> reached, refusing to add more\n",
>> +                   hwe->name, RING_MAX_NONPRIV_SLOTS);
>>               break;
>>           }

