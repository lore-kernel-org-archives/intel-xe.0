Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468F0C25B5C
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 14:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1D710F60F;
	Thu,  2 May 2024 14:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gp21xZtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCE410F60F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714659170; x=1746195170;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZKFrA3hJdkEaqQJk95pVerQwvlCAiq2auujdiy/JUqI=;
 b=Gp21xZtI35YgZcwmemQIcouxWVZ557SI9aAdRV1AuTA0LdcBYA4nhrRx
 mgNm7ljlHrj7qBXCR+LbFZLL5wZ/WT364zhfar506cq6fs1bcmPZQ5yFx
 7Xr+2uvGAHOauERJF5/E7wSL/NG+iV8mPydLZRQseAOemHgf5Rj1g70N3
 kHaaeDG2ToJpkdISQ2C+q/YKXVr1jSf8CTSsoOKtpcMoYJH/spvfwB/Yd
 3Iaoj65Xf0+u5VQJybHU6RhDGo6nHEXoudBPrCIAXtgTeAPhngffblQZr
 UFdxrmSkzZDiA2p5Bg3g427HRdj6m8x5LF11K+URgUPah8ZDzSOiFZFSb Q==;
X-CSE-ConnectionGUID: vnYZnXwOSN+mLtNwJC1biw==
X-CSE-MsgGUID: k50XqPLETwe5Gylf8ow2ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10647153"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10647153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 07:12:50 -0700
X-CSE-ConnectionGUID: Q7DqnGsrS+WNgpdvs/cjqg==
X-CSE-MsgGUID: pTJsTGeATPSJnKT9AbdEog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31599766"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 02 May 2024 07:12:47 -0700
Received: from [10.246.17.255] (unknown [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 84A5F27BA1;
 Thu,  2 May 2024 15:12:45 +0100 (IST)
Message-ID: <7db2a29a-9a5e-48e8-8b28-711a74daa815@intel.com>
Date: Thu, 2 May 2024 16:12:43 +0200
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
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <qer2v7bslci6af6u3ygkcpicxyacbex6r54wzfyww32rq3sevu@2tovdhmfdp4t>
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



On 02.05.2024 14:55, Lucas De Marchi wrote:
> On Thu, May 02, 2024 at 01:54:55PM GMT, Michal Wajdeczko wrote:
>>
>>
>> On 30.04.2024 17:56, Matthew Brost wrote:
>>> On Mon, Apr 29, 2024 at 04:03:25PM -0500, Lucas De Marchi wrote:
>>>> On Mon, Apr 29, 2024 at 08:36:04PM GMT, Matthew Brost wrote:
>>>>> On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
>>>>>> On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
>>>>>>> Not really used, it's just a copy of engine_mask, which already
>>>>>>> reads
>>>>>>> the fuses to mark engines as available/not-available.
>>>>>>
>>>>>> I got confused trying to understand why this ever existed.
>>>>>> It indeed doesn't make much sense on today's code.
>>>>>>
>>>>>
>>>>> That was my doing with the intent that we never use the engine mask
>>>>> until after hwconfig load as the engine mask would be read from
>>>>> that. Or
>>>>> alternatively in SRIOV via CTB (or MMIO) relays.
>>>>>
>>>>> i.e. it was fake way to enforce correct load ordering.
>>>>
>>>> but we never used it from hwconfig (instead we kept the fake copy here)
>>>> and we never will as it doesn't have the info we need.
>>>>
>>>> Instead we just went out of our way and started using __engine_mask
>>>> instead where needed. See e.g.  drivers/gpu/drm/xe/xe_migrate.c. I
>>>> fail to
>>>> see how exactly this enforces the correct load ordering. At most it
>>>> would return the wrong value and we would silently ignore it (e.g.
>>>> if we
>>>> had a call like xe_hw_engine_mask_per_class() before that point
>>>> since it
>>>> uses gt->info.engine_mask).
>>>>
>>>> For SR-IOV, nothing overrides engine_mask anywhere. Not even if I look
>>>> at the wip branch for VF.  So, I'd say that if VF needs it, then please
>>>> add the prep together with patches making use of that because the
>>>> way it
>>>> is is now it's too fragile.
>>
>> but the idea was that for any engine overrides there should be no VF
>> specific code, except the way how VF will know the fuse values
>>
>> in other words, the only SR-IOV requirement for the load ordering was to
>> make sure that we can use GuC CTB, to allow the VF communicate with GuC,
>> prior to making any manipulation around engines.
>>
>> separate requirement to use hwconfig by the native driver, was actually
>> from the arch team, and it was a prerequisite for SR-IOV requirement, as
>> fulfilling this requirement was guaranteeing that MMIO, GGTT and IRQ
>> would be operational, thus GuC CTB will work.
>>
>> note that actual driver implementation, before this series, still didn't
>> comply with initial requirements, as while we pretend that we can enable
>> CTB in xe_guc_min_load_for_hwconfig(), any CTB communication will fail
>> as IRQ are not enabled yet
>>
>>>>
>>>
>>> They should read the fuses via a GuC relay.
>>>
>>>>>
>>>>> Assuming fuses are read after this removed LoC, the load ordering is
>>>>> correct.
>>>>
>>>> fuses are read much much earlier than that, in xe_pci.c. Why would
>>>> it be
>>>> wrong?
>>
>> only GMDID is read there and VF must use GuC MMIO (lucky not CTB)
>> communication to get that.
> 
> right, I looked in the wrong place. GMDID is read from xe_pci.c.
> Fuses follow this call chain:
> 
> xe_device_probe() -> xe_gt_init() -> all_fw_domain_init() ->
> xe_hw_engines_init_early()
> 
>>
>> on VFs we read fuses right after we get a hwconfig and enable
>> (malfunctioning) CTB
> 
> where? except from  the place I'm removing and the place we read the
> fuses, I didn't find anywhere the engine_mask being changed.

to be more specific: on VF we are getting fuse values at hwconfig phase,
just to have them cached locally, before driver will try to 'read' them
in the call chain listed above.

  xe_device_probe
    xe_gt_init_hwconfig
      xe_uc_init_hwconfig
        vf_guc_min_load_for_hwconfig

and that's before

  xe_device_probe
    xe_gt_init

and while it's after

  xe_device_probe
    xe_gt_init_early

it doesn't change too much right now as on VF we don't call any of:

  xe_wa_process_gt
  xe_wa_process_oob
  xe_tuning_process_gt

as those access registers that are not available for the VFs

so we should be fine unless some WA/tuning should be handled by the VF

Michal

> 
> thanks
> Lucas De Marchi
> 
>>
>>>>
>>>
>>> I was thinking the fuse read required hwconfig step (also brings up
>>
>> that was due to the ordering suggested by arch:
>>
>> 1. read hwconfig
>> 2. read fuses
>>
>> and since 1) requires the GuC, so MMIO and GGTT must be functional
>>
>> thus for 2) the VFs can use CTB Relay (as MMIO/GGTT and IRQ shall be
>> already functional due to 1)
>>
>>> CTBs) but now that I think about this, I believe the fuses can be read
>>> via a MMIO relay so the current location probably works. Double check
>>
>> according to arch team, we can't use the GuC MMIO Relay anymore
>>
>>> with Michal Winarski on that.
>>>
>>> Anyways don't let anything I say hold this up.
>>
>> btw, I was able to test this series on my WIP SR-IOV branch and didn't
>> notice any regressions yet
>>
>> Michal
>>
>>>
>>> Matt
>>>
>>>> Lucas De Marchi
>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>>>
>>>>>>> While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
>>>>>>>
>>>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>
>>>>>>
>>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>>>>>>>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>>>>>>>  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>>>>>>>  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>>>>>>>  4 files changed, 4 insertions(+), 14 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>>>> index e922e77f5010..00a22cf2f5b5 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>>>> @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>>>>>>      if (err)
>>>>>>>          goto out_fw;
>>>>>>>
>>>>>>> -    /* XXX: Fake that we pull the engine mask from hwconfig blob */
>>>>>>> -    gt->info.engine_mask = gt->info.__engine_mask;
>>>>>>> -
>>>>>>>  out_fw:
>>>>>>>      xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>>>  out:
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>> index cfdc761ff7f4..72568414fb7d 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>> @@ -116,12 +116,6 @@ struct xe_gt {
>>>>>>>          u32 reference_clock;
>>>>>>>          /** @info.engine_mask: mask of engines present on GT */
>>>>>>>          u64 engine_mask;
>>>>>>> -        /**
>>>>>>> -         * @info.__engine_mask: mask of engines present on GT
>>>>>>> read from
>>>>>>> -         * xe_pci.c, used to fake reading the engine_mask from the
>>>>>>> -         * hwconfig blob.
>>>>>>> -         */
>>>>>>> -        u64 __engine_mask;
>>>>>>>          /** @info.gmdid: raw GMD_ID value from hardware */
>>>>>>>          u32 gmdid;
>>>>>>>      } info;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> index 9f6e9b7f11c8..59a3f24d31e6 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct
>>>>>>> xe_gt *gt)
>>>>>>>       * all of the actual service copy engines (BCS1-BCS8) have
>>>>>>> been fused
>>>>>>>       * off.
>>>>>>>       */
>>>>>>> -    return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
>>>>>>> -                        XE_HW_ENGINE_BCS1);
>>>>>>> +    return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
>>>>>>>  }
>>>>>>>
>>>>>>>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>> b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>> index a0cf5dd803c2..6b2086ea24ab 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>> @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>>          gt = tile->primary_gt;
>>>>>>>          gt->info.id = xe->info.gt_count++;
>>>>>>>          gt->info.type = XE_GT_TYPE_MAIN;
>>>>>>> -        gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>>>>>>> +        gt->info.engine_mask = graphics_desc->hw_engine_mask;
>>>>>>>          if (MEDIA_VER(xe) < 13 && media_desc)
>>>>>>> -            gt->info.__engine_mask |= media_desc->hw_engine_mask;
>>>>>>> +            gt->info.engine_mask |= media_desc->hw_engine_mask;
>>>>>>>
>>>>>>>          if (MEDIA_VER(xe) < 13 || !media_desc)
>>>>>>>              continue;
>>>>>>> @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>>
>>>>>>>          gt = tile->media_gt;
>>>>>>>          gt->info.type = XE_GT_TYPE_MEDIA;
>>>>>>> -        gt->info.__engine_mask = media_desc->hw_engine_mask;
>>>>>>> +        gt->info.engine_mask = media_desc->hw_engine_mask;
>>>>>>>          gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>>>>>>>          gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.43.0
>>>>>>>
