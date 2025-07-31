Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB5C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173C110E140;
	Thu, 31 Jul 2025 09:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7Cs5VLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52CD10E140
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753953461; x=1785489461;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4vKlvKx+7zxJgLDzfAx1lO3wxW0/0IS0xf71Q3bMP/Q=;
 b=G7Cs5VLievo0e7/bsBu8P3TwXnyfN5h34hnYj70OEmUExP0M9m09LjOQ
 ZHSYGs2AgCBM4tFupl/OWuKcMzgqWlFCRKWolTXPP4AJAcRj55B8thA0i
 Q9jye/C6eEifFJHVMxs91cyXl9z95odln5piz4xbCp5haPQc4s+kdYQIF
 E81NmWxqf2kTRtnyRuB//CerJhpTTSAf7XpHV0fbBircv9ccweIoX8x3l
 3SJsPE4nxQ13zbtSIgBuHs/wMQacXFvGVRKRq0sk+iKRVMv7349R0DkR8
 6DSlqh1rFXJn5eHhbzuGrH9VGKnBPqfVt3zUMM88bDawvC58yA49gYl7P g==;
X-CSE-ConnectionGUID: na3x5mkFRfi14ZOYub3FBA==
X-CSE-MsgGUID: RxY/f6fiQQqI5CeLw4EMMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66543157"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="66543157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:17:41 -0700
X-CSE-ConnectionGUID: VWlGrybPQw2Hds1nOemAXw==
X-CSE-MsgGUID: BmJXkplWTLyvx2oejctuzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="162482930"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.250])
 ([10.245.245.250])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:17:39 -0700
Message-ID: <53af72cd-6cc3-47e6-9715-24c6e95cb3b3@intel.com>
Date: Thu, 31 Jul 2025 10:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/migrate: don't overflow max copy size
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
 <20250730143335.174373-7-matthew.auld@intel.com>
 <d5135cd4c939bfb73123aac8f3adac9c7cd2a846.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d5135cd4c939bfb73123aac8f3adac9c7cd2a846.camel@intel.com>
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

On 30/07/2025 19:25, Summers, Stuart wrote:
> On Wed, 2025-07-30 at 15:33 +0100, Matthew Auld wrote:
>> With non-page aligned copy, we need to use byte aligned pitch,
>> however
>> the size itself might still be close to our maximum of ~8M, and so
>> the
>> dimensions of the copy can easily exceed the S16_MAX limit of the
>> copy
>> command leading to the following assert:
>>
>> xe 0000:03:00.0: [drm] Assertion `size / pitch <= ((s16)(((u16)~0U)
>>>> 1))` failed!
>> platform: BATTLEMAGE subplatform: 1
>> graphics: Xe2_HPG 20.01 step A0
>> media: Xe2_HPM 13.01 step A1
>> tile: 0 VRAM 10.0 GiB
>> GT: 0 type 1
>>
>> WARNING: CPU: 23 PID: 10605 at drivers/gpu/drm/xe/xe_migrate.c:673
>> emit_copy+0x4b5/0x4e0 [xe]
>>
>> To fix this account for the pitch when calculating the number of
>> current
>> bytes to copy.
>>
>> Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU
>> for non-visible access")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index b6bdc9bd32b0..daca18b5b45f 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -2056,6 +2056,12 @@ int xe_migrate_access_memory(struct xe_migrate
>> *m, struct xe_bo *bo,
>>                  else
>>                          current_bytes = min_t(int, bytes_left,
>> cursor.size);
>>   
>> +               if (current_bytes & ~PAGE_MASK) {
>> +                       int pitch = 4;
> 
> This 4 is ndwords right? It would be nice to have a macro here instead
> of just assuming that all over this file. But not a review blocker..

In this case it's 4 bytes, so one dword. Yeah, it is a bit ugly.

> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Thanks.

> 
>> +
>> +                       current_bytes = min_t(int, current_bytes,
>> S16_MAX * pitch);
>> +               }
>> +
>>                  if (fence)
>>                          dma_fence_put(fence);
>>   
> 

