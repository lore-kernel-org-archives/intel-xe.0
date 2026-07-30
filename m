Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE0CC55167
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 13:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD0C10E18E;
	Thu, 30 Jul 2026 13:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UI1fB5IK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2410E18E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785417166; x=1816953166;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=zyTFT5PUTIzO6aWPAmeFZLa5yPKvMYo7+eyon/uh6fk=;
 b=UI1fB5IKvWBsUccuwkN9H7E71P19ubXcsjX1uK7hB+pzeYEoWn9PrZQD
 hpjfuEbHW+K4EWD2c0ao+JOg1Wp9XE+6B3nOd+kbA7sOCplmFM0D/3/nX
 41ZXGV9yFKshkboKsBme50VvQUIVtgJhDWNuacTiSm15xuk3+daUDAirv
 fP7ryDj8umDHGwgky7+zWIxK6Wt52YWnNVP/VClNBJi2zy//osOrkHi/i
 gPIM/Aft7Bxmbo5dJLi2wAjuN/theoim3OUGhdc8xoa47r1CDYCjWzIDH
 BPc7WtvtCp6wngX2rqQBWPOtB0oGwsUx4GsTKK2jrs8TAniJYaslj7BwU Q==;
X-CSE-ConnectionGUID: yB59aYg0QsGWcyd6ScBCsA==
X-CSE-MsgGUID: M3u+N1gkRXyXxFm4o3mmbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85798816"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85798816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 06:12:46 -0700
X-CSE-ConnectionGUID: ARd7VzA8TwSGDtDQjzmTxQ==
X-CSE-MsgGUID: n7vPDf9UTGee4IANC7Oy1g==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 06:12:44 -0700
Message-ID: <789a05bc-f33f-41ed-869d-0fbe45ebef09@intel.com>
Date: Thu, 30 Jul 2026 14:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
From: Matthew Auld <matthew.auld@intel.com>
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, stable@vger.kernel.org
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730004735.344627-1-jia.yao@intel.com>
 <20260730004735.344627-3-jia.yao@intel.com>
 <148b38ae-eae7-40d5-837c-fddda1299d9f@intel.com>
Content-Language: en-GB
In-Reply-To: <148b38ae-eae7-40d5-837c-fddda1299d9f@intel.com>
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

On 30/07/2026 11:51, Matthew Auld wrote:
> On 30/07/2026 01:47, Jia Yao wrote:
>> On dGFX the original ADS BO is explicitly migrated to VRAM by
>> xe_guc_realloc_post_hwconfig() so that xe_bo_main_addr() returns a
>> real device-physical address (DPA) rather than an IOMMU IOVA.  A
>> separate SYSTEM BO for the UM queues would not go through that migration
>> path, so its IOVA would differ from the physical address on systems
>> where pages are allocated above 4 GB.  GuC/GAM accesses the UM queue
>> ring via base_dpa (with_dpa=true on pre-Xe3p), so an incorrect DPA
>> causes all-zero fault descriptors to be forwarded to the driver.
> 
> I feel like I don't fully understand the explanation here. Is the issue 
> not just the contig requirement for base_dpa? We now use attempt a best 
> effort approach for system memory, however for dgpu we can go further 
> and use VRAM to guarantee that requirement. If that is all this is doing 
> then commit message can be simplified with something like:
> 
> "To fully guarantee the contig requirement for base_dpa, we can instead 
> just use VRAM for the um queue, on dgpu..."

Or is the issue that this has to always be in VRAM, since there is no 
bit to say whether the DPA is system vs VRAM, like we do for the GGTT 
pte? On dgpu, assumption is that this is then always VRAM, if using DPA? 
If so, please make that clearer in the commit message.

> 
>>
>> Use XE_BO_FLAG_VRAM_IF_DGFX() for the UM queue BO so that on dGFX the
>> BO is allocated directly in VRAM and xe_bo_main_addr() returns the
>> correct DPA without needing a post-hwconfig migration step.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c     |  6 ------
>>   drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++-----
>>   2 files changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 21cf3edef922..4023700ff2a9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -714,12 +714,6 @@ static int xe_guc_realloc_post_hwconfig(struct 
>> xe_guc *guc)
>>       if (ret)
>>           return ret;
>> -    if (guc->ads.um_queue_bo) {
>> -        ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc- 
>> >ads.um_queue_bo);
>> -        if (ret)
>> -            return ret;
>> -    }
>> -
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/ 
>> xe_guc_ads.c
>> index 7f371f9c7268..53636333fb45 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -409,11 +409,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>           size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
>>                               GUC_UM_HW_QUEUE_MAX);
>> -        bo = xe_managed_bo_create_pin_map(xe, tile, um_size,
>> -                          XE_BO_FLAG_SYSTEM |
>> -                          XE_BO_FLAG_GGTT |
>> -                          XE_BO_FLAG_GGTT_INVALIDATE |
>> -                          XE_BO_FLAG_PINNED_NORESTORE);
>> +        u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +                   XE_BO_FLAG_GGTT |
>> +                   XE_BO_FLAG_GGTT_INVALIDATE |
>> +                   XE_BO_FLAG_PINNED_NORESTORE;
>> +
>> +        bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
>>           if (IS_ERR(bo))
>>               return PTR_ERR(bo);
> 

