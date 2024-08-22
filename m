Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFF9C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 09:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9BA10E818;
	Thu, 22 Aug 2024 09:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hk9ALjIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A1910E83F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724317816; x=1755853816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NUZTTPIdx/k57d93y7zccTSOknWDFagHWfUlbH3K+cU=;
 b=Hk9ALjIc6KVEWcVXAMl2JBqXmGL7fA7bdoXy0n38H1aLMJqd57bkybw1
 O5eOKy1f5Fmx9LknL547OXqQgXaWE0KddW5/f0+dz2ptzRKoJtCmNmgst
 sTUOHup6nwnamu1SupwS7lPd7uPt8OuxJTP143fKCcb5APn/FfN9R5l8B
 VlxAuAB6j3BGjXhsjlPdyU1rQlL17cDP5IEGFC6WKD2jSYXDL46LH7fJz
 WycY8vLG0tLcGRereqbhi2ZcG7mHtnChWAg0NumZi5ELXvT1wd9HvpAnQ
 Y/C4GPspWIqwKvoJmKzEtzse8AovINGFr/FfW4StnOSZTkWR1qNJbXfnV w==;
X-CSE-ConnectionGUID: vACxh79/Seay5XbjQgxPig==
X-CSE-MsgGUID: +gKa9cfHQomETyluH0OtBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22532294"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22532294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 02:10:16 -0700
X-CSE-ConnectionGUID: 4MoFCDJbQs6Z7fK1egoe+A==
X-CSE-MsgGUID: 6Uy8v6IcRw2HEDM9KeYYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61374492"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.49.79])
 ([10.246.49.79])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 02:10:15 -0700
Message-ID: <05f31035-abf4-414e-a2ef-541085a0048c@linux.intel.com>
Date: Thu, 22 Aug 2024 11:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix memory leak on xe_alloc_pf_queue failure
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20240822081325.1549-1-nirmoy.das@intel.com>
 <a7bcbf49-75d2-4b9c-b49f-11f6d348a7ab@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <a7bcbf49-75d2-4b9c-b49f-11f6d348a7ab@intel.com>
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


On 8/22/2024 10:52 AM, Matthew Auld wrote:
> On 22/08/2024 09:13, Nirmoy Das wrote:
>> Free up previously allocated pf_queue[i].data on error.
>>
>> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault 
>> queue size")
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c 
>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 0be4687bfc20..c19944eed5bd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -437,9 +437,13 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>>         for (i = 0; i < NUM_PF_QUEUE; ++i) {
>>           ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
>> -        if (ret)
>> +        if (ret) {
>> +            while (i-- > 0)
>> +                kfree(gt->usm.pf_queue[i].data);
>>               return ret;
>> +        }
>>       }
>
> I think this will then also leak below, if one of the queue create 
> fails? Maybe just convert this over to devm_calloc or similar that way 
> we don't need to do the manual unwind.

Ah, right! let me look into managed calloc way.

Nirmoy


>
>> +
>>       for (i = 0; i < NUM_ACC_QUEUE; ++i) {
>>           gt->usm.acc_queue[i].gt = gt;
>>           spin_lock_init(&gt->usm.acc_queue[i].lock);
