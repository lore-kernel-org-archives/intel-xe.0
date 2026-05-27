Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2213CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 09:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9B10E02C;
	Wed, 27 May 2026 09:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPhCUMno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C1B10E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779872914; x=1811408914;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Jf5zJnU/YU6HRiuHPoQnkgwM4tCRCkHXLfLZZnljLOs=;
 b=GPhCUMnoH51zGeAH1AMhGwrXw0O4dsQtLjNorgM1x2keUluPneDdhs4j
 yxEWJtfqKxn0fV47+tbfE0w8ancrDSXod38Hk3JwXvXK563SscakfdFBh
 Jty6K+jftF4MRoHhSDAS6iXn7WtwuQOvfYDcqcGcbqCSX4rzR6JjpLNpg
 WudCY8RXssUUTq8JKFvuKzgs284GGGM/rcVFhw2KMAV2UcoNXQ8pbjxtG
 m2BQpYzVMjmGSDtImEbAA9ReiHQQOhTyEz0jD2s9I+vHtEAu69t/lRBcA
 XQWWfLEtWfRuMyl0JSMEgWYXN/THlMchHUdl6yrmf4tYfQrkoeEzhiLTn g==;
X-CSE-ConnectionGUID: 0BIM05xhQUut1AauvP27gg==
X-CSE-MsgGUID: vxkIeQgAStumAO+NgQVCag==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80728799"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80728799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 02:08:33 -0700
X-CSE-ConnectionGUID: K3hzUhawS02ONjU/EICQtQ==
X-CSE-MsgGUID: b8G2M9QYS06KHFq0MvVH+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="246443490"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.24])
 ([10.245.245.24])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 02:08:32 -0700
Message-ID: <e1aee190-51f9-43f1-b50c-3889bcac7fd7@intel.com>
Date: Wed, 27 May 2026 10:08:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/guc: handle guc logical instance for
 paging engine
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260526141901.62207-12-matthew.auld@intel.com>
 <20260526141901.62207-18-matthew.auld@intel.com>
 <0e2427b6-e58a-492a-b025-1318fd81ca15@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0e2427b6-e58a-492a-b025-1318fd81ca15@intel.com>
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

On 26/05/2026 23:59, Daniele Ceraolo Spurio wrote:
> 
> 
> On 5/26/2026 7:19 AM, Matthew Auld wrote:
>> In the GuC backend, we need a different logical instance when referring
>> to the reserved paging engine. Under the hood, this is still just the
>> same physical BSC engine, however from the GuC POV this is actually
>> re-mapped to a separate GUC_PAGING_CLASS, with the logical index
>> starting from zero.
>>
>> The idea is to not leak this into the upper layers, since this is GuC
>> version specific, so the changes here are purely on the GuC side.
>>
>> No functional change.
> 
> Double-checked all usages of hwe->logical_instance and AFAICS you 
> covered all the GuC related ones in this patch.
> We'll have to be careful in future reviews to make sure hwe- 
>  >logical_instance is not accidentally used directly with the GuC in new 
> code, but I can't think of a good way to make such a mistake easier to 
> avoid.
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks. Thinking we could also add a comment under 
hwe->logical_instance, and link that against some kernel-doc for 
xe_hwe_guc_logical_instance(). And explain that for GuC side, never use 
the raw logical_instance, use the helper. That might help a bit, both 
for human and LLM review side.

> 
> Daniele
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  3 ++-
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  3 ++-
>>   drivers/gpu/drm/xe/xe_guc.h                 |  1 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c             | 22 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |  6 ++++--
>>   5 files changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/ 
>> gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index f28c7ae0e8c2..0f242db775e1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -382,9 +382,10 @@ static ssize_t sched_group_engines_read(struct 
>> file *file, char __user *buf,
>>       if (group < num_groups) {
>>           for_each_hw_engine(hwe, gt, id) {
>>               u8 guc_class = xe_hwe_to_guc_class(hwe);
>> +            u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>>               u32 mask = groups[group].engines[guc_class];
>> -            if (mask & BIT(hwe->logical_instance)) {
>> +            if (mask & BIT(guc_logical_instance)) {
>>                   strlcat(engines, hwe->name, sizeof(engines));
>>                   strlcat(engines, " ", sizeof(engines));
>>               }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/ 
>> drm/xe/xe_gt_sriov_pf_policy.c
>> index cf117bf52d41..cdfe194926d3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -472,6 +472,7 @@ static void pf_sched_group_media_slices(struct 
>> xe_gt *gt, struct guc_sched_group
>>       for_each_hw_engine(hwe, gt, id) {
>>           u8 guc_class = xe_hwe_to_guc_class(hwe);
>> +        u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>>           switch (hwe->class) {
>>           case XE_ENGINE_CLASS_VIDEO_DECODE:
>> @@ -490,7 +491,7 @@ static void pf_sched_group_media_slices(struct 
>> xe_gt *gt, struct guc_sched_group
>>               slice = 0;
>>           }
>> -        values[slice_to_group[slice]].engines[guc_class] |= BIT(hwe- 
>> >logical_instance);
>> +        values[slice_to_group[slice]].engines[guc_class] |= 
>> BIT(guc_logical_instance);
>>       }
>>       *groups = values;
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 0934927e8254..61e3ee19a59b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -69,6 +69,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, 
>> u32 *payload, u32 len);
>>   #endif
>>   u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
>> +u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe);
>>   static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/ 
>> xe_guc_ads.c
>> index cedab0e1f798..b7d7eb4f3296 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -527,6 +527,23 @@ u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
>>       }
>>   }
>> +u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
>> +{
>> +    struct xe_gt *gt = hwe->gt;
>> +
>> +    if (xe_guc_has_paging_engine(&hwe->gt->uc.guc) &&
>> +        xe_gt_is_usm_hwe(gt, hwe)) {
>> +        int shift = gt->usm.paging_hwe0->logical_instance;
>> +
>> +        xe_gt_assert(gt, shift <= hwe->logical_instance);
>> +
>> +        /* GUC_PAGING_CLASS:guc_logical_instance */
>> +        return hwe->logical_instance - shift;
>> +    }
>> +
>> +    return hwe->logical_instance;
>> +}
>> +
>>   /*
>>    * Write the offsets corresponding to the golden LRCs. The actual 
>> data is
>>    * populated later by guc_golden_lrc_populate()
>> @@ -595,11 +612,14 @@ static void guc_mapping_table_init(struct xe_gt 
>> *gt,
>>       guc_mapping_table_init_invalid(gt, info_map);
>>       for_each_hw_engine(hwe, gt, id) {
>> +        u16 guc_logical_instance;
>>           u8 guc_class;
>>           guc_class = xe_hwe_to_guc_class(hwe);
>> +        guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>> +
>>           info_map_write(xe, info_map,
>> -                   mapping_table[guc_class][hwe->logical_instance],
>> +                   mapping_table[guc_class][guc_logical_instance],
>>                      hwe->instance);
>>       }
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.c
>> index 150d891d5a09..2feb87492312 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -28,6 +28,7 @@ static struct iosys_map engine_activity_map(struct 
>> xe_guc *guc, struct xe_hw_eng
>>       struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>>       struct engine_activity_buffer *buffer;
>>       u16 guc_class = xe_hwe_to_guc_class(hwe);
>> +    u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>>       size_t offset;
>>       if (engine_activity->num_functions) {
>> @@ -39,7 +40,7 @@ static struct iosys_map engine_activity_map(struct 
>> xe_guc *guc, struct xe_hw_eng
>>       }
>>       offset += offsetof(struct guc_engine_activity_data,
>> -              engine_activity[guc_class][hwe->logical_instance]);
>> +              engine_activity[guc_class][guc_logical_instance]);
>>       return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>   }
>> @@ -151,8 +152,9 @@ static struct engine_activity 
>> *hw_engine_to_engine_activity(struct xe_hw_engine
>>       struct xe_guc *guc = &hwe->gt->uc.guc;
>>       struct engine_activity_group *eag = &guc- 
>> >engine_activity.eag[index];
>>       u16 guc_class = xe_hwe_to_guc_class(hwe);
>> +    u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
>> -    return &eag->engine[guc_class][hwe->logical_instance];
>> +    return &eag->engine[guc_class][guc_logical_instance];
>>   }
>>   static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
> 

