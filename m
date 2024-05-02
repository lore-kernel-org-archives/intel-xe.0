Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFD5C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B404710F7AA;
	Thu,  2 May 2024 20:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yl+4H9O8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADA010F7A3
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714682216; x=1746218216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+AifCmhLOTCrYJI7NP6kt15O7QHh4Jl0PuVkhQdJmHE=;
 b=Yl+4H9O810vsWfRYO8/xB13GmHtnNCcPKqIhQkktAx4cOFcu+ecHnayd
 xEkxK2D1EJQRK2zVfb7YYM0t/zE12Oxio7bOADSume07HIiei5LGo0L6/
 yXsoi2Lhqht5vCA7SsaYcb50nJXB3cmONcBE0oDv3jGywTINjEzlEy2Jv
 sxpxM4IYBVJHCBm+huktBW2LR9huOFHA8xMhFcIb6qYOqm0i1ObNzx4yO
 Xx6CYVqETzI8m28VuD4cWy2/H/u7UwsKfMIshrP9k4U6o/MViYqhojyUI
 rbs1dwp0lQZ1U80GrELFCxB+HGnAuOlwfN+EuwYVzBQyioSWUuQSmy1dg g==;
X-CSE-ConnectionGUID: YmQauFUqTO+v++k+UJqciA==
X-CSE-MsgGUID: 8z8lzYmWSOutHwb8sMSvoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13427348"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="13427348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:36:55 -0700
X-CSE-ConnectionGUID: ggfmohrAQkmaCHGpjMKx4w==
X-CSE-MsgGUID: VK5WVvzRSG6lodxXok/dFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58432500"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 02 May 2024 13:36:50 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 74E7D32EBE;
 Thu,  2 May 2024 21:36:48 +0100 (IST)
Message-ID: <8607c954-c49d-44d2-a2ff-a583f7d51491@intel.com>
Date: Thu, 2 May 2024 22:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 vinay.belgaumkar@intel.com, michal.winiarski@intel.com
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
 <ZjADLvXstooUQk58@intel.com> <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
 <2nxudidnseyqjxa7fsug2nnrudaysoqysl5vp2ftr4ikt6u4cw@ufsbnqheyovt>
 <ZjEUm9LD8irh+eKh@DUT025-TGLU.fm.intel.com>
 <87b968f4-e6ec-41e2-af11-03b6adc6f0f8@intel.com>
 <qer2v7bslci6af6u3ygkcpicxyacbex6r54wzfyww32rq3sevu@2tovdhmfdp4t>
 <7db2a29a-9a5e-48e8-8b28-711a74daa815@intel.com>
 <u3yk3pbtysegqltmlbhufuqhv27zqxefef2jkcm4klgy4dkkiu@nmt3dij4d4bj>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <u3yk3pbtysegqltmlbhufuqhv27zqxefef2jkcm4klgy4dkkiu@nmt3dij4d4bj>
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



On 02.05.2024 19:26, Lucas De Marchi wrote:
> On Thu, May 02, 2024 at 04:12:43PM GMT, Michal Wajdeczko wrote:
>>
>>
>> On 02.05.2024 14:55, Lucas De Marchi wrote:
>>> On Thu, May 02, 2024 at 01:54:55PM GMT, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 30.04.2024 17:56, Matthew Brost wrote:
>>>>> On Mon, Apr 29, 2024 at 04:03:25PM -0500, Lucas De Marchi wrote:
>>>>>> On Mon, Apr 29, 2024 at 08:36:04PM GMT, Matthew Brost wrote:
>>>>>>> On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
>>>>>>>> On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
>>>>>>>>> Not really used, it's just a copy of engine_mask, which already
>>>>>>>>> reads
>>>>>>>>> the fuses to mark engines as available/not-available.
>>>>>>>>
>>>>>>>> I got confused trying to understand why this ever existed.
>>>>>>>> It indeed doesn't make much sense on today's code.
>>>>>>>>
>>>>>>>
>>>>>>> That was my doing with the intent that we never use the engine mask
>>>>>>> until after hwconfig load as the engine mask would be read from
>>>>>>> that. Or
>>>>>>> alternatively in SRIOV via CTB (or MMIO) relays.
>>>>>>>
>>>>>>> i.e. it was fake way to enforce correct load ordering.
>>>>>>
>>>>>> but we never used it from hwconfig (instead we kept the fake copy
>>>>>> here)
>>>>>> and we never will as it doesn't have the info we need.
>>>>>>
>>>>>> Instead we just went out of our way and started using __engine_mask
>>>>>> instead where needed. See e.g.  drivers/gpu/drm/xe/xe_migrate.c. I
>>>>>> fail to
>>>>>> see how exactly this enforces the correct load ordering. At most it
>>>>>> would return the wrong value and we would silently ignore it (e.g.
>>>>>> if we
>>>>>> had a call like xe_hw_engine_mask_per_class() before that point
>>>>>> since it
>>>>>> uses gt->info.engine_mask).
>>>>>>
>>>>>> For SR-IOV, nothing overrides engine_mask anywhere. Not even if I
>>>>>> look
>>>>>> at the wip branch for VF.  So, I'd say that if VF needs it, then
>>>>>> please
>>>>>> add the prep together with patches making use of that because the
>>>>>> way it
>>>>>> is is now it's too fragile.
>>>>
>>>> but the idea was that for any engine overrides there should be no VF
>>>> specific code, except the way how VF will know the fuse values
>>>>
>>>> in other words, the only SR-IOV requirement for the load ordering
>>>> was to
>>>> make sure that we can use GuC CTB, to allow the VF communicate with
>>>> GuC,
>>>> prior to making any manipulation around engines.
>>>>
>>>> separate requirement to use hwconfig by the native driver, was actually
>>>> from the arch team, and it was a prerequisite for SR-IOV
>>>> requirement, as
>>>> fulfilling this requirement was guaranteeing that MMIO, GGTT and IRQ
>>>> would be operational, thus GuC CTB will work.
>>>>
>>>> note that actual driver implementation, before this series, still
>>>> didn't
>>>> comply with initial requirements, as while we pretend that we can
>>>> enable
>>>> CTB in xe_guc_min_load_for_hwconfig(), any CTB communication will fail
>>>> as IRQ are not enabled yet
>>>>
>>>>>>
>>>>>
>>>>> They should read the fuses via a GuC relay.
>>>>>
>>>>>>>
>>>>>>> Assuming fuses are read after this removed LoC, the load ordering is
>>>>>>> correct.
>>>>>>
>>>>>> fuses are read much much earlier than that, in xe_pci.c. Why would
>>>>>> it be
>>>>>> wrong?
>>>>
>>>> only GMDID is read there and VF must use GuC MMIO (lucky not CTB)
>>>> communication to get that.
>>>
>>> right, I looked in the wrong place. GMDID is read from xe_pci.c.
>>> Fuses follow this call chain:
>>>
>>> xe_device_probe() -> xe_gt_init() -> all_fw_domain_init() ->
>>> xe_hw_engines_init_early()
>>>
>>>>
>>>> on VFs we read fuses right after we get a hwconfig and enable
>>>> (malfunctioning) CTB
>>>
>>> where? except from  the place I'm removing and the place we read the
>>> fuses, I didn't find anywhere the engine_mask being changed.
>>
>> to be more specific: on VF we are getting fuse values at hwconfig phase,
>> just to have them cached locally, before driver will try to 'read' them
>> in the call chain listed above.
>>
>>  xe_device_probe
>>    xe_gt_init_hwconfig
>>      xe_uc_init_hwconfig
>>        vf_guc_min_load_for_hwconfig
> 
> are you sure you pushed it somewhere? I found this function in one of
> the WIP branches, but no sign of using fuses.

it's two steps:

1. fuses are retrieved from PF during hwconfig phase

        vf_guc_min_load_for_hwconfig
          xe_gt_sriov_vf_runtime

2. when driver reads fuses, VF uses cached values instead real

   xe_hw_engines_init_early
     read_media_fuses
       xe_mmio_read32
         xe_gt_sriov_vf_read32

> 
> More specifically, I'm grepping for user of engine_mask and what is
> possibly setting it. If in VF we read media/graphics/copy fuses to tell
> what are the engines available, we should really be setting engine_mask.
> Somewhere.  How is VF being tested on systems that have engines fused
> off?

we don't need to look for fused systems, as without above hooks the VF
would wrongly try to read from non-existing register that will result
with getting fuse value as all 0xFFFFF (or 0x0000) and likely causing
masking out all engines

> 
> Also, I don't thikn here we are talking about partitioning (different
> engines to VFs), are we?

no, we don't

> 
>>
>> and that's before
>>
>>  xe_device_probe
>>    xe_gt_init
>>
>> and while it's after
>>
>>  xe_device_probe
>>    xe_gt_init_early
>>
>> it doesn't change too much right now as on VF we don't call any of:
>>
>>  xe_wa_process_gt
>>  xe_wa_process_oob
>>  xe_tuning_process_gt
>>
>> as those access registers that are not available for the VFs
>>
>> so we should be fine unless some WA/tuning should be handled by the VF
> 
> then those should probably be in another category to be processed by the
> rtp infra.
> 
> 
> Anyway, I'm reading this as "for sr-iov it doesn't matter right now or
> in the mid-term future", so I will proceed and prepare a v2 after
> checking why CI failed.

as long as driver will keep hwconfig step (or whatever) that will
guarantee that GuC communication works prior to the place when it will
read and apply engine/topology fuses, then it should be fine for VF

(and that GMDID is read using normal mmio_read32() function, not
bypassing MMIO initialization, as VF needs to setup MMIO communication
with GuC to get GMDID - but you're not touching this phase)

> 
> 
> thanks
> Lucas De Marchi
> 
> 
>>
>> Michal
>>
>>>
>>> thanks
>>> Lucas De Marchi
>>>
>>>>
>>>>>>
>>>>>
>>>>> I was thinking the fuse read required hwconfig step (also brings up
>>>>
>>>> that was due to the ordering suggested by arch:
>>>>
>>>> 1. read hwconfig
>>>> 2. read fuses
>>>>
>>>> and since 1) requires the GuC, so MMIO and GGTT must be functional
>>>>
>>>> thus for 2) the VFs can use CTB Relay (as MMIO/GGTT and IRQ shall be
>>>> already functional due to 1)
>>>>
>>>>> CTBs) but now that I think about this, I believe the fuses can be read
>>>>> via a MMIO relay so the current location probably works. Double check
>>>>
>>>> according to arch team, we can't use the GuC MMIO Relay anymore
>>>>
>>>>> with Michal Winarski on that.
>>>>>
>>>>> Anyways don't let anything I say hold this up.
>>>>
>>>> btw, I was able to test this series on my WIP SR-IOV branch and didn't
>>>> notice any regressions yet
>>>>
>>>> Michal
>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>> Lucas De Marchi
>>>>>>
>>>>>>>
>>>>>>> Matt
>>>>>>>
>>>>>>>>>
>>>>>>>>> While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>>
>>>>>>>>
>>>>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>>
>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>>>>>>>>>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>>>>>>>>>  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>>>>>>>>>  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>>>>>>>>>  4 files changed, 4 insertions(+), 14 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>>> b/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>>> index e922e77f5010..00a22cf2f5b5 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>>> @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>>>>>>>>      if (err)
>>>>>>>>>          goto out_fw;
>>>>>>>>>
>>>>>>>>> -    /* XXX: Fake that we pull the engine mask from hwconfig
>>>>>>>>> blob */
>>>>>>>>> -    gt->info.engine_mask = gt->info.__engine_mask;
>>>>>>>>> -
>>>>>>>>>  out_fw:
>>>>>>>>>      xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>>>>>  out:
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>>> index cfdc761ff7f4..72568414fb7d 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>>> @@ -116,12 +116,6 @@ struct xe_gt {
>>>>>>>>>          u32 reference_clock;
>>>>>>>>>          /** @info.engine_mask: mask of engines present on GT */
>>>>>>>>>          u64 engine_mask;
>>>>>>>>> -        /**
>>>>>>>>> -         * @info.__engine_mask: mask of engines present on GT
>>>>>>>>> read from
>>>>>>>>> -         * xe_pci.c, used to fake reading the engine_mask from
>>>>>>>>> the
>>>>>>>>> -         * hwconfig blob.
>>>>>>>>> -         */
>>>>>>>>> -        u64 __engine_mask;
>>>>>>>>>          /** @info.gmdid: raw GMD_ID value from hardware */
>>>>>>>>>          u32 gmdid;
>>>>>>>>>      } info;
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> index 9f6e9b7f11c8..59a3f24d31e6 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>>> @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct
>>>>>>>>> xe_gt *gt)
>>>>>>>>>       * all of the actual service copy engines (BCS1-BCS8) have
>>>>>>>>> been fused
>>>>>>>>>       * off.
>>>>>>>>>       */
>>>>>>>>> -    return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
>>>>>>>>> -                        XE_HW_ENGINE_BCS1);
>>>>>>>>> +    return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
>>>>>>>>>  }
>>>>>>>>>
>>>>>>>>>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> index a0cf5dd803c2..6b2086ea24ab 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>>>>          gt = tile->primary_gt;
>>>>>>>>>          gt->info.id = xe->info.gt_count++;
>>>>>>>>>          gt->info.type = XE_GT_TYPE_MAIN;
>>>>>>>>> -        gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>>>>>>>>> +        gt->info.engine_mask = graphics_desc->hw_engine_mask;
>>>>>>>>>          if (MEDIA_VER(xe) < 13 && media_desc)
>>>>>>>>> -            gt->info.__engine_mask |= media_desc->hw_engine_mask;
>>>>>>>>> +            gt->info.engine_mask |= media_desc->hw_engine_mask;
>>>>>>>>>
>>>>>>>>>          if (MEDIA_VER(xe) < 13 || !media_desc)
>>>>>>>>>              continue;
>>>>>>>>> @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>>>>
>>>>>>>>>          gt = tile->media_gt;
>>>>>>>>>          gt->info.type = XE_GT_TYPE_MEDIA;
>>>>>>>>> -        gt->info.__engine_mask = media_desc->hw_engine_mask;
>>>>>>>>> +        gt->info.engine_mask = media_desc->hw_engine_mask;
>>>>>>>>>          gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>>>>>>>>>          gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>>>>>>>>>
>>>>>>>>> -- 
>>>>>>>>> 2.43.0
>>>>>>>>>
