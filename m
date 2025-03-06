Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419CBC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 21:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304010E900;
	Thu,  6 Mar 2025 21:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtUmk5OK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65610E900
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741297480; x=1772833480;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ne4+UnyX/Duml0lAU1imwQmZZHr0zgg7eh6A9egwy2s=;
 b=JtUmk5OKT+7kViok2cFEY+jAv/4ozFxZa0bU5J8SBhX7/zufckPBpR+U
 yq/id3+PzbXLlJQsX+Kvaed8FkddU0Zlvsxhla2JQe5AV9oKRQ7ChQvtP
 8UIjAc1Jak16mTlDYlv7wc043F9a/BakkncxeMiJ/7zr2r7u6mckubsle
 3bCDDaroja/aDF7gfzo4I6AODxnhAg/M19tH/mX9OkuP79Ixr1D0YouxK
 vT2oq9CZkQKymMtojYLdxfCWMkHx4lLs1eGCJ1cEoNoN2N11wQTigXlrV
 mdOueyRUWt/mZgpZNzP8JPRrza4Uz14ekYb6jn5+NCyq2kUTvOwOcqGgF g==;
X-CSE-ConnectionGUID: vSk+43vNSrqkITwj+ikMDw==
X-CSE-MsgGUID: 7/uYNQLbTOiegb0tyr3kZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42362052"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="42362052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:44:40 -0800
X-CSE-ConnectionGUID: 6dOTVgfOQhGz1IVfyJxV2g==
X-CSE-MsgGUID: sd/Hj6AKRbmbj8svZYpeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149939768"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 06 Mar 2025 13:44:39 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 670993543C;
 Thu,  6 Mar 2025 21:44:36 +0000 (GMT)
Message-ID: <c8320bf0-8556-4dd2-8852-dff7949ceefb@intel.com>
Date: Thu, 6 Mar 2025 22:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc: move KLV helpers to common file
To: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
 <20250227010530.3002093-2-daniele.ceraolospurio@intel.com>
 <02842531-7ce0-4518-a6c9-9530f946bb26@intel.com>
 <03101dc5-00cc-440c-9358-c136ba6d961e@intel.com>
 <ba0e0dab-3561-4ed7-abb7-ff424b3d8c3d@intel.com>
 <c0e68a6d-4250-4373-b573-2490b374660c@intel.com>
 <d0384c1a-f3aa-4c1d-922d-7dae3f61de69@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d0384c1a-f3aa-4c1d-922d-7dae3f61de69@intel.com>
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



On 01.03.2025 02:55, John Harrison wrote:
> On 2/28/2025 14:21, Daniele Ceraolo Spurio wrote:
>> On 2/28/2025 1:47 PM, Michal Wajdeczko wrote:
>>> On 28.02.2025 00:59, Daniele Ceraolo Spurio wrote:
>>>> On 2/27/2025 3:29 PM, Michal Wajdeczko wrote:
>>>>> On 27.02.2025 02:05, Daniele Ceraolo Spurio wrote:
>>>>>> The GuC uses the same format for all its KLVs, so having the
>>>>>> functions
>>>>>> to set them in a common file will allow us to re-use it for different
>>>>>> types of KLVs and not just the WAs in ADS.
>>>>>> The next patch will make use of these functions for a new H2G
>>>>>> command.
>>>>>>
>>>>>> Signed-off-by: Daniele Ceraolo Spurio
>>>>>> <daniele.ceraolospurio@intel.com>
>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_guc_ads.c         | 89 +++++
>>>>>> +-------------------
>>>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 62 +++++++++++++++++
>>>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  7 ++
>>>>>>    3 files changed, 89 insertions(+), 69 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/
>>>>>> xe_guc_ads.c
>>>>>> index fab259adc380..ed3304a11812 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>>> @@ -22,6 +22,7 @@
>>>>>>    #include "xe_guc.h"
>>>>>>    #include "xe_guc_capture.h"
>>>>>>    #include "xe_guc_ct.h"
>>>>>> +#include "xe_guc_klv_helpers.h"
>>>>>>    #include "xe_hw_engine.h"
>>>>>>    #include "xe_lrc.h"
>>>>>>    #include "xe_map.h"
>>>>>> @@ -283,56 +284,6 @@ static size_t calculate_golden_lrc_size(struct
>>>>>> xe_guc_ads *ads)
>>>>>>        return total_size;
>>>>>>    }
>>>>>>    -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>>>>>> -                      enum xe_guc_klv_ids klv_id,
>>>>>> -                      u32 value,
>>>>>> -                      u32 *offset, u32 *remain)
>>>>>> -{
>>>>>> -    u32 size;
>>>>>> -    u32 klv_entry[] = {
>>>>>> -        /* 16:16 key/length */
>>>>>> -        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>>>> -        FIELD_PREP(GUC_KLV_0_LEN, 1),
>>>>>> -        value,
>>>>>> -        /* 1 dword data */
>>>>>> -    };
>>>>>> -
>>>>>> -    size = sizeof(klv_entry);
>>>>>> -
>>>>>> -    if (*remain < size) {
>>>>>> -        drm_warn(&ads_to_xe(ads)->drm,
>>>>>> -             "w/a klv buffer too small to add klv id %d\n", klv_id);
>>>>>> -    } else {
>>>>>> -        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>>>> -                 klv_entry, size);
>>>>>> -        *offset += size;
>>>>>> -        *remain -= size;
>>>>>> -    }
>>>>>> -}
>>>>>> -
>>>>>> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>>>>> -                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>>>>>> *remain)
>>>>>> -{
>>>>>> -    u32 klv_entry[] = {
>>>>>> -        /* 16:16 key/length */
>>>>>> -        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>>>> -        FIELD_PREP(GUC_KLV_0_LEN, 0),
>>>>>> -        /* 0 dwords data */
>>>>>> -    };
>>>>>> -    u32 size;
>>>>>> -
>>>>>> -    size = sizeof(klv_entry);
>>>>>> -
>>>>>> -    if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
>>>>>> -               "w/a klv buffer too small to add klv id %d\n",
>>>>>> klv_id))
>>>>>> -        return;
>>>>>> -
>>>>>> -    xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>>>> -             klv_entry, size);
>>>>>> -    *offset += size;
>>>>>> -    *remain -= size;
>>>>>> -}
>>>>>> -
>>>>>>    static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>>>    {
>>>>>>        struct xe_gt *gt = ads_to_gt(ads);
>>>>>> @@ -343,22 +294,22 @@ static void guc_waklv_init(struct xe_guc_ads
>>>>>> *ads)
>>>>>>        remain = guc_ads_waklv_size(ads);
>>>>>>          if (XE_WA(gt, 14019882105))
>>>>>> -        guc_waklv_enable_simple(ads,
>>>>>> -
>>>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>>>> -                    &offset, &remain);
>>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>>> +
>>>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>>>> +                     &offset, &remain);
>>>>>>        if (XE_WA(gt, 18024947630))
>>>>>> -        guc_waklv_enable_simple(ads,
>>>>>> - GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>>>>>> -                    &offset, &remain);
>>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>>> + GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>>>>>> +                     &offset, &remain);
>>>>>>        if (XE_WA(gt, 16022287689))
>>>>>> -        guc_waklv_enable_simple(ads,
>>>>>> -
>>>>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>>>>> -                    &offset, &remain);
>>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>>> +
>>>>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>>>>> +                     &offset, &remain);
>>>>>>          if (XE_WA(gt, 14022866841))
>>>>>> -        guc_waklv_enable_simple(ads,
>>>>>> - GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>>>>>> -                    &offset, &remain);
>>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>>> + GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>>>>>> +                     &offset, &remain);
>>>>>>          /*
>>>>>>         * On RC6 exit, GuC will write register 0xB04 with the default
>>>>>> value provided. As of now,
>>>>>> @@ -366,15 +317,15 @@ static void guc_waklv_init(struct xe_guc_ads
>>>>>> *ads)
>>>>>>         * future, so GuC depends on KMD to send it the correct value.
>>>>>>         */
>>>>>>        if (XE_WA(gt, 13011645652))
>>>>>> -        guc_waklv_enable_one_word(ads,
>>>>>> -
>>>>>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>>>>>> -                      0xC40,
>>>>>> -                      &offset, &remain);
>>>>>> +        xe_guc_klv_enable_one_word(ads_to_guc(ads), ads_to_map(ads),
>>>>>> +
>>>>>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>>>>>> +                       0xC40,
>>>>>> +                       &offset, &remain);
>>>>>>          if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
>>>>>> -        guc_waklv_enable_simple(ads,
>>>>>> -
>>>>>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>>>> -                    &offset, &remain);
>>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>>> +
>>>>>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>>>> +                     &offset, &remain);
>>>>>>          size = guc_ads_waklv_size(ads) - remain;
>>>>>>        if (!size)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/
>>>>>> drm/xe/xe_guc_klv_helpers.c
>>>>>> index 146a6eda9e06..50eab2086ee3 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>> @@ -7,8 +7,11 @@
>>>>>>    #include <drm/drm_print.h>
>>>>>>      #include "abi/guc_klvs_abi.h"
>>>>>> +#include "xe_gt_printk.h"
>>>>>> +#include "xe_guc.h"
>>>>>>    #include "xe_guc_klv_helpers.h"
>>>>>>    #include "xe_guc_klv_thresholds_set.h"
>>>>>> +#include "xe_map.h"
>>>>>>      #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)
>>>>>> (lo)))
>>>>>>    @@ -146,3 +149,62 @@ int xe_guc_klv_count(const u32 *klvs, u32
>>>>>> num_dwords)
>>>>>>          return num_dwords ? -ENODATA : num_klvs;
>>>>>>    }
>>>>>> +
>>>>>> +static void emit_klv(struct xe_guc *guc, struct iosys_map *map, u32
>>>>>> *klv_entry,
>>>>>> +             u32 size, u32 *offset, u32 *remain)
>>>>> s/klv_entry/klv
>>>>>
>>>>> s/size/num_dwords
>>>>>
>>>>> KLVs are always u32 aligned
>>>>> 'size/offset/remain' all should be in dwords
>>>> That would mean having to convert back and forth between u8 and u32:
>>>>
>>>> - allocation is in u8 aligned
>>>> - params to this function would be u32 aligned
>>> but for generic KLV functions it doesn't make sense to pass u8 sizes
>>> and we should aim to define function signatures that enforce proper
>>> logic
>>>
>>>> - xe_map_memcpy_to below needs u8 alignment, so convert back
>>>> - the GuC expects a u8 aligned size, so need to convert remain back
>>>> to u8
>>> that looks like a mistake done in this action definition, since all
>>> initial actions that introduced KLV concept (like UPDATE_VGT_POLICY,
>>> UPDATE_VF_CFG) were defined to operate on dwords as size
>>
>> This is an ADS entry and all ADS blocks are offset/size. The new H2G
>> command (in next patch) is indeed dword aligned, but it still seems
>> simpler to just have a single "offset / 4" that multiple conversions
>> back and forth.
> I agree that avoiding multiple conversions is best.
> 
> The data itself might be in 32-bit chunks 

in KLV world data *must* be in 32-bit chunks

> but all the KMD operations are
> in bytes - allocation, memcpy, etc. So adding extra conversions seems
> unnecessary and will just make the code less readable and more error prone.

if you allow byte sizes you will still need to handle invalid use cases
with unaligned sizes and any conversion should be mostly in the helper
layer, that, by definition, should hide any implementation details from
exposed logical data view (here 32-bit based KLV)

> 
> 
>>
>>>
>>>> Just using u8 everywhere seems simpler instead of converting back and
>>>> forth.
>>>>
>>>>> this will also match rest of functions in this file
>>>>>
>>>>>> +{
>>>>>> +    if (xe_gt_WARN(guc_to_gt(guc), *remain < size,
>>>>> do we need xe_gt_WARN in production?
>>>>> maybe xe_gt_assert will suffice?
>>>> I've kept this the same as what was in the original function. Not sure
>>>> why it was xe_gt_WARN instead of assert.
>>>>
>>>>>> +               "klv buffer too small to add klv id 0x%04x\n",
>>>>> s/klv/KLV
>>>>>
>>>>>> + FIELD_GET(GUC_KLV_0_KEY, klv_entry[0])))
>>>>>> +        return;
>>>>>> +
>>>>>> +    xe_map_memcpy_to(guc_to_xe(guc), map, *offset, klv_entry, size);
>>>>>> +    *offset += size;
>>>>>> +    *remain -= size;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * xe_guc_klv_enable_simple - Emits a KLV with no data to an iosys
>>>>>> mapped buffer
>>>>>> + * @guc: the guc structure
>>>>>> + * @map: the iosys_map to write to
>>>>>> + * @klv_id: the KLV to enable
>>>>> key ? there is no Len nor Value
>>>>>
>>>>> this will follow other functions in this file
>>>> ok, will rename.
>>>>
>>>>>> + * @offset: pointer to a variable holding the offset to write to
>>>>>> + * @remain: pointer to a variable holding the remaining writing
>>>>>> space available
>>>>>> + *
>>>>>> + * The function checks if there is enough space to emit a KLV with
>>>>>> no data and
>>>>>> + * if so writes it to memory. After the write, the offset and remain
>>>>>> variables
>>>>>> + * are respectively increased and decreased of the written size to
>>>>>> be ready for
>>>>>> + * the next emission.
>>>>>> + */
>>>>>> +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct iosys_map
>>>>>> *map,
>>>>>> +                  u16 klv_id, u32 *offset, u32 *remain)
>>>>>> +{
>>>>>> +    u32 klv_entry = PREP_GUC_KLV(klv_id, 0);
>>>>>      u32 klv[] = { PREP_GUC_KLV(key, 0) };
>>>>>
>>>>>      emit(... ARRAY_SIZE(klv)
>>>> Why? this function is specifically targeted to writing a single u32,
>>>> why
>>>> write it as a u32[1]?
>>>>
>>>>>> +
>>>>>> +    emit_klv(guc, map, &klv_entry, sizeof(klv_entry), offset,
>>>>>> remain);
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * xe_guc_klv_enable_one_word - Emits a KLV with 1 DW data to an
>>>>>> iosys mapped buffer
>>>>>> + * @guc: the guc structure
>>>>>> + * @map: the iosys_map to write to
>>>>>> + * @klv_id: the KLV to enable
>>>>> s/klv_id/key
>>>>>
>>>>>> + * @value: the data associated with the KLV
>>>>>> + * @offset: pointer to a variable holding the offset to write to
>>>>>> + * @remain: pointer to a variable holding the remaining writing
>>>>>> space available
>>>>>> + *
>>>>>> + * The function checks if there is enough space to emit a KLV with 1
>>>>>> DW data and
>>>>>> + * if so writes it to memory. After the write, the offset and remain
>>>>>> variables
>>>>>> + * are respectively increased and decreased of the written size to
>>>>>> be ready for
>>>>>> + * the next emission.
>>>>>> + */
>>>>>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map
>>>>>> *map,
>>>>>> +                u16 klv_id, u32 value, u32 *offset, u32 *remain)
>>>>>> +{
>>>>>> +    u32 klv_entry[] = {
>>>>>> +        PREP_GUC_KLV(klv_id, 1),
>>>>>> +        value,
>>>>>> +    };
>>>>>> +
>>>>>> +    emit_klv(guc, map, klv_entry, sizeof(klv_entry), offset,
>>>>>> remain);
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/
>>>>>> drm/xe/xe_guc_klv_helpers.h
>>>>>> index c676d21c173b..231f7c4b0947 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>>> @@ -10,6 +10,8 @@
>>>>>>    #include <linux/types.h>
>>>>>>      struct drm_printer;
>>>>>> +struct iosys_map;
>>>>>> +struct xe_guc;
>>>>>>      const char *xe_guc_klv_key_to_string(u16 key);
>>>>>>    @@ -61,4 +63,9 @@ int xe_guc_klv_count(const u32 *klvs, u32
>>>>>> num_dwords);
>>>>>>    #define PREP_GUC_KLV_TAG(TAG) \
>>>>>>        PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG),
>>>>>> MAKE_GUC_KLV_LEN(TAG))
>>>>>>    +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct
>>>>>> iosys_map
>>>>>> *map,
>>>>>> +                  u16 klv_id, u32 *offset, u32 *remain);
>>>>>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map
>>>>>> *map,
>>>>>> +                u16 klv_id, u32 value, u32 *offset, u32 *remain);
>>>>> hmm, "enable" does not fit here, maybe:
>>>>>
>>>>> xe_guc_klv_emit_empty / no_data / no_value
>>>>> xe_guc_klv_emit_dword
>>>> emit_nodata should work.
>>>>
>>>>> and those should be inlines that use:
>>>>>
>>>>> void xe_guc_klv_emit_simple(
>>>>>      struct xe_guc *guc,
>>>>>      struct iosys_map *map,
>>>>>      u16 key, u16 len, const u32 *klv,
>>>>>      u32 *offset, u32 *remain);
>>>>>
>>>>> like:
>>>>>
>>>>> inline xe_guc_klv_emit_simple_empty(.. key ..)
>>>>> {
>>>>>      xe_guc_klv_emit_simple(.. key, 0, NULL, ..);
>>>>> }
>>>>>
>>>>>
>>>>> inline xe_guc_klv_emit_simple_dword(.. key, value ..)
>>>>> {
>>>>>      xe_guc_klv_emit_simple(.. key, 1, &value, ..);
>>>>> }
>>>> This seems to just make things harder. xe_guc_klv_emit_simple() would
>>>> need to handle the case where we have data differently from the case
>>>> where we don't, potentially with 2 separate memcpys (one always done
>>>> for
>>> this isn't on the hot path so I would prefer avoid code duplication over
>>> perf optimization
>>
>> This isn't about a perf optimization, it is about keeping the code
>> simple. The only duplication is between:
>>
>> u32 klv_entry = PREP_GUC_KLV(klv_id, 0);
>>
>> and
>>
>> u32 klv_entry[] = {
>>         PREP_GUC_KLV(klv_id, 1),
>>         value,
>> };
>>
>> Which is minimal, but it keeps the common code much simpler as it
>> doesn't have to handle optional parameters.
>>
>>>
>>>> the key and one optional for the data). I really don't see the benefit
>>>> when the current approach still makes most of the code common in
>>>> emit_klv() and only has separate arrays. Also, that wouldn't be a
>>>> "simple" emission anymore since it'd handle all the possible cases, so
>>>> the naming also wouldn't fit.
>>> but the goal is to have helper function to 'emit KLVs', so the 'simple'
>>> here means help in building and emit of the proper KLV-header based on
>>> the provided key/len params, followed by emit of value (as dwords)
>>
>> The "simple" here was in reference to the fact that there was no data,
>> as compared against the emit_dword.
>>
>>>
>>> and while your current case is only KLV with 0 or 1 dword, nothing
>>> prevents us from implementing generic helper, and satisfying your need
>>> with trivial wrappers for 0/1 case
>>
>> I'll give it a try and see how it looks, but it really seems like
>> we're over-engineering this by introducing an helper that can handle
>> cases that we don't have.
> I agree with Daniele. There is no need to overcomplicate things to
> support use cases that don't exist.
> 
> And yes, the 'simple' meant no data. So calling a function

hmm, not sure which dictionary says that, quoting the web:

adjective
1. easily understood or done; presenting no difficulty.
"a simple solution"

> 'simple_dword' is broken and 'simple_empty' is redundant! We could maybe
> drop the 'enable' part if the helpers might be used for other KLV
> purposes at some point. But it would just be 'xe_guc_klv_add_simple' and
> 'xe_guc_klv_add_one_word'. If you really thing the use of 'simple' is
> ambiguous or confusing then maybe 'xe_guc_klv_add_empty' instead but
> that sounds odd to me.

but to be clear: using KLVs without the VALUE is odd and naming that
exceptional case as 'simple' is IMO just wrong

anyway, the idea was to have single "generic" function that can emit
KLVs with data of any length, plus some wrappers for "trivial" cases:

inline xe_guc_klv_emit_empty(.. key ..)
{
     xe_guc_klv_emit(.. key, 0, NULL, ..);
}

inline xe_guc_klv_emit_u32(.. key, value ..)
{
    xe_guc_klv_emit(.. key, 1, &value, ..);
}

inline xe_guc_klv_emit_u64(.. key, value ..)
{
    xe_guc_klv_emit(.. key, 2, &value, ..);
}

note that for upcoming VF save/restore feature we will likely have to
emit more complex KLVs, so having a "generic" emit function could be an
immediate bonus

> 
> John.
> 
>>
>> Daniele
>>
>>>
>>>> Daniele
>>>>
>>>>>> +
>>>>>>    #endif
>>
> 

