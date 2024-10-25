Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D42D1039A
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 16:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F136510EB0E;
	Fri, 25 Oct 2024 16:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5CwBdCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E7310EB0E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729872217; x=1761408217;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HKIq9hY09BFUFtD+j2pgeoxjWnH5WfKCnBFvl6IdW5o=;
 b=N5CwBdCi+ZxcF14JBPl+/GS3D05N0/EKm7xfJN2pGZQsP8IzPpIPRB+v
 wmnfXKVwCVtbKylF9OCyM4n4okGcA4OBiPHTQo+wCRxMOZp1mDlxUQus8
 8xTpLIkWRK/NL4HGY7s9uOlh0XsTqY/LvZQ8ckipAazQ6VSxRpJJK6rff
 yV+fxQIEjAi5Ls3lCQ8QOY0NmWzzZ3cYqwkHh5rOPiDRTAQq3MaLqIqPG
 nyyzA38bWg/9mW8Q+I0O4vzNguV80oXpc1eIyXE63HPtLLO0+jNJhpGpw
 xy998VLuCHwq+7834+UAiEsnwaS5TWySlwHr+J3XREqYDlI2J/shk343w g==;
X-CSE-ConnectionGUID: 2Dj/s/1RRIK1LsKc9cl4zA==
X-CSE-MsgGUID: /KDpGgcoSnGW8VrqobdhbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29677781"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29677781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 09:03:36 -0700
X-CSE-ConnectionGUID: vJWqYolwRAW+N4d8vgbNhw==
X-CSE-MsgGUID: LOvuvOzeQ2qva/5i3GfskA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="118403184"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.197.87])
 ([10.245.197.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 09:03:32 -0700
Message-ID: <3865ed60-94aa-4bfc-b263-90283aef274f@linux.intel.com>
Date: Fri, 25 Oct 2024 18:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Jani Nikula <jani.nikula@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20241024151815.929142-1-nirmoy.das@intel.com>
 <87bjz9sbqs.fsf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <87bjz9sbqs.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 10/24/2024 6:32 PM, Jani Nikula wrote:
> On Thu, 24 Oct 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> Flush xe ordered_wq in case of ufence timeout which is observed
>> on LNL and that points to the recent scheduling issue with E-cores.
>>
>> This is similar to the recent fix:
>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>> response timeout") and should be removed once there is E core
>> scheduling fix.
>>
>> v2: Add platform check(Himal)
>>     s/__flush_workqueue/flush_workqueue(Jani)
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> index f5deb81eba01..78a0ad3c78fe 100644
>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_macros.h"
>> +#include "compat-i915-headers/i915_drv.h"
> Sorry, you just can't use this in xe core. At all. Not even a little
> bit. It's purely for i915 display compat code.
>
> If you need it for the LNL platform check, you need to use:
>
> 	xe->info.platform == XE_LUNARLAKE


Will do that. That macro looked odd but I didn't know a better way.

>
> Although platform checks in xe code are generally discouraged.


This issue unfortunately depending on platform instead of graphics IP.


Thanks,

Nirmoy

>
> BR,
> Jani.
>
>
>
>>  #include "xe_exec_queue.h"
>>  
>>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>> @@ -155,6 +156,19 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>>  		}
>>  
>>  		if (!timeout) {
>> +			if (IS_LUNARLAKE(xe)) {
>> +				/*
>> +				 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h
>> +				 * worker in case of g2h response timeout")
>> +				 *
>> +				 * TODO: Drop this change once workqueue scheduling delay issue is
>> +				 * fixed on LNL Hybrid CPU.
>> +				 */
>> +				flush_workqueue(xe->ordered_wq);
>> +				err = do_compare(addr, args->value, args->mask, args->op);
>> +				if (err <= 0)
>> +					break;
>> +			}
>>  			err = -ETIME;
>>  			break;
>>  		}
