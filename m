Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788B9C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 11:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4240210E428;
	Tue,  7 Mar 2023 11:12:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D7110E428
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 11:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678187565; x=1709723565;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3F8ZUYuSGL+QSie1vTciLv4PSOW/TCZdnwWTSZyqL4k=;
 b=V/8eXNarveSduB3yK+gvQ0iqRwRxud/M7RB91XjSw2FhvF4OzHTeMVEG
 +nLFKG7HOa3n4EGXG+s4+CelY7vcI7tAAwM3B2B4wA+nqZQPX6+n2+LHT
 bkUmXmzsZWUJFRxmSb16a8j7rMSJjrI+vSzZNbwgJ3aH0Px+6bXd8cMQ+
 RCp0+fvIVw3LivMgC8daD8iJGwiAXBeUjiQNS6jwiBRs3uSX8BCNtdI6Q
 Qk/KtiyvCSKvSjUW4Y6pRfb7J0qsuJ6wffmlaC5qO/6DfZ2FWH/fHIj1i
 7g7aK+1i4N9nWQL9oDUkEiBZRycxTeJpShkYb3K8IjVK+G0ZUZBbcvSI9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319655121"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="319655121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005825204"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005825204"
Received: from avocking-mobl1.ger.corp.intel.com (HELO [10.252.12.120])
 ([10.252.12.120])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:12:37 -0800
Message-ID: <cfc9a08d-c7c8-c43d-d0a3-cfa73fbf4df5@intel.com>
Date: Tue, 7 Mar 2023 11:12:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-2-matthew.auld@intel.com>
 <29c89d5f-0d58-2972-4434-31d130d638d3@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <29c89d5f-0d58-2972-4434-31d130d638d3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: add
 xe_ttm_stolen_cpu_access_needs_ggtt()
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

On 07/03/2023 09:53, Gwan-gyeong Mun wrote:
> Looks good to me.
> By the way, the commit message explained only the case of smallbar, is 
> there a way to access stolen memory in the case of dgpu resizable-bar?

It's just a case of whether the stolen portion fits entirely within the 
BAR size, or not. If it doesn't then we disable CPU access for stolen 
VRAM. Normally with resizable-bar enabled in the BIOS the BAR we are 
given is automatically configured to use the full-bar size. The 
resize-bar logic in the driver I think is normally never triggered 
(outside ofc driver testing with the special modparam). And when 
triggered most of the time it just fails anyway, since resizable-bar is 
likely disabled or not supported, at least from what I've seen.

> 
> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Thanks.

> 
> On 3/1/23 4:48 PM, Matthew Auld wrote:
>> xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
>> case where stolen is not directly CPU accessible on some older
>> integrated platforms, and as such a GGTT mapping was also required for
>> CPU access (as per the check in xe_bo_create_pin_map_at()).
>>
>> However with small-bar systems on dgfx we have one more case where
>> stolen is also inaccessible, however here we don't have any fallback
>> GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
>> make this distinction clear. In such a case the later vmap() will fail
>> anyway.
>>
>> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c             |  2 +-
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 14 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  1 +
>>   3 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 2bfd3f6f2e9a..876f77669104 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct 
>> xe_device *xe, struct xe_gt *gt,
>>       u64 end = offset == ~0ull ? offset : start + size;
>>       if (flags & XE_BO_CREATE_STOLEN_BIT &&
>> -        xe_ttm_stolen_cpu_inaccessible(xe))
>> +        xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>           flags |= XE_BO_CREATE_GGTT_BIT;
>>       bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, 
>> type, flags);
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> index 2e8d07ad42ae..4bf373a03d64 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>> @@ -66,6 +66,20 @@ bool xe_ttm_stolen_cpu_inaccessible(struct 
>> xe_device *xe)
>>       return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
>>   }
>> +/**
>> + * xe_ttm_stolen_needs_ggtt - If we can't directly CPU access stolen, 
>> can we
>> + * then fallback to mapping through the GGTT.
>> + * @xe: xe device
>> + *
>> + * Some older integrated platforms don't support reliable CPU access 
>> for stolen,
>> + * however on such hardware we can always use the mappable part of 
>> the GGTT for
>> + * CPU access. Check if that's the case for this device.
>> + */
>> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
>> +{
>> +    return xe_ttm_stolen_cpu_inaccessible(xe) && !IS_DGFX(xe);
>> +}
>> +
>>   static s64 detect_bar2_dgfx(struct xe_device *xe, struct 
>> xe_ttm_stolen_mgr *mgr)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h 
>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> index 2fda97b97a05..e210dada636e 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>> @@ -15,6 +15,7 @@ struct xe_device;
>>   void xe_ttm_stolen_mgr_init(struct xe_device *xe);
>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct 
>> ttm_resource *mem);
>>   bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
>> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
>>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
