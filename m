Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5457CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 09:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712A10E349;
	Fri, 26 Jun 2026 09:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKtO4v1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD50710E349
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782467401; x=1814003401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gcvXQKTqbJ/EwKITlFpduK2aIZKGIJFNGiz5hnr5xr0=;
 b=PKtO4v1ywfpaDANB8zJxtBMkd1JoQ7PV4JpApnHbBo2X80GFWbkN3AT0
 zrKen21TKP2JxI8v++Ja0JqyfO6DH5Ggvho9l8gxQX6Wma+gi+4bG+7sB
 grhYMuXjqekUjhUI6HB9R9v6YTZRmDqhBZh9xCW8EJSEqSLklmRT5Agi4
 +HQK38kPJrmmzAKxcMnqvDGBeA+svLxzejkvzMLciM0TC3nMsoULMczu4
 CEfuqkT7WrHbSPgPtpHIAkL80kiqdX0sZ97BjYSLv36rI3RYShlRuxSGi
 RNGOE+doOYjXkkC4IOruuehREN2PAG5pB05fYtlDak6+7FZsxeb7npl4P Q==;
X-CSE-ConnectionGUID: i8nKhydSRWyFPiFFpr4Fpg==
X-CSE-MsgGUID: GyAbwFBGRNKd1TAKM5IDLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93612328"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="93612328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:50:01 -0700
X-CSE-ConnectionGUID: dcTmDBNkS5SGwRXv6NmLUQ==
X-CSE-MsgGUID: oonG/8c0SWufk3+umQDcQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="250218421"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.49])
 ([10.245.244.49])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:49:59 -0700
Message-ID: <32cdb954-c2d1-48cb-b847-80d5687b5ff0@intel.com>
Date: Fri, 26 Jun 2026 10:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
 <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
 <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
 <b992c4c5-4934-4015-b6e6-f8d13435d415@intel.com>
 <63fd304b-9b4d-4d8a-b609-25a807050448@intel.com>
 <e3e0025a-efb1-4c74-ab5d-83532a689474@intel.com>
 <d8562f46-cb43-4d66-abc8-35143466bc17@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d8562f46-cb43-4d66-abc8-35143466bc17@intel.com>
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

On 26/06/2026 10:42, Michal Wajdeczko wrote:
> 
> 
> On 6/26/2026 11:16 AM, Matthew Auld wrote:
>> On 25/06/2026 21:58, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 6/25/2026 1:53 PM, Daniele Ceraolo Spurio wrote:
>>>>
>>>>
>>>> On 6/25/2026 1:40 PM, Michal Wajdeczko wrote:
>>>>>
>>>>> On 6/23/2026 7:50 PM, Daniele Ceraolo Spurio wrote:
>>>>>>
>>>>>> On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>>>>>>> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>>>>>>>> When host PF writes the logical configuration for the GUC PAGING engine,
>>>>>>>> the VF is meant to query it, and mirror it. Size of N means we have
>>>>>>>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>>>>>>>
>>>>>>>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>>>>>>>> should be zero on older platforms, where we should simply fall back to
>>>>>>>> the old behaviour.
>>>>>>>>
>>>>>>>> v2 (Sashiko):
>>>>>>>>      - We can't call use the guc_has_paging_engine() this early in the VF
>>>>>>>>        code. With that just unconditionally do the query, if the GuC is new
>>>>>>>>        enough and take the value as-is. With that drop the -1 special case and
>>>>>>>>        just let the upper layers figure out the rest.
>>>>>>>> v3:
>>>>>>>>      - Also update xe_guc_klv_key_to_string. (Michal)
>>>>>>>>      - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>>>>>>>        tweaks. (Michal)
>>>>>>>>      - Update with final GuC version.
>>>>>>>> v4:
>>>>>>>>      - Just fallback to manual reserve when vf reported paging engines is
>>>>>>>>        zero. Will revisit in the future.
>>>>>>>>
>>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 ++++++++++++++++ +++++++
>>>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>>>>>>>     drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>>>>>>>     drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>>>>>>>     drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>>>>>>>     6 files changed, 91 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/ drm/xe/abi/guc_klvs_abi.h
>>>>>>>> index 644f5a4226d7..753c049d2fc8 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>>>> @@ -52,6 +52,12 @@
>>>>>>>>      * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>>>>>      *      Tells the driver whether scheduler groups are enabled or not.
>>>>>>>>      *      Requires GuC ABI 1.26+
>>>>>>>> + *
>>>>>>>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>>>>>>>> + *      Tells the driver the paging engine configuration.
>>>>>>>> + *      Paging engine logical instances are guaranteed to be dense starting at
>>>>>>>> + *      index 0.
>>>>>>>> + *      Requires GuC ABI 1.36+
>>>>>>>>      */
>>>>>>>>       #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY 0x3000u
>>>>>>>> @@ -60,6 +66,9 @@
>>>>>>>>     #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY 0x3001u
>>>>>>>>     #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>>>>>     +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY 0x3003u
>>>>>>>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN    1u
>>>>>>>> +
>>>>>>>>     /**
>>>>>>>>      * DOC: GuC Self Config KLVs
>>>>>>>>      *
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/ drm/xe/xe_gt_sriov_vf.c
>>>>>>>> index 0cd9d77f3351..0a11e63f470b 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>>>> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>>>>>         return 0;
>>>>>>>>     }
>>>>>>>>     +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>>>>>>>> +{
>>>>>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>>>>>> +    struct xe_uc_fw_version guc_version;
>>>>>>>> +    u32 value = 0;
>>>>>>>> +    int err;
>>>>>>>> +
>>>>>>>> +    xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>>>>>>> +
>>>>>>>> +    if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>>>>>>>> +                        &value);
>>>>>>>> +    if (unlikely(err)) {
>>>>>>>> +        xe_gt_sriov_err(gt,
>>>>>>>> +                "Failed to obtain the number of paging instances (%pe)\n",
>>>>>>>> +                ERR_PTR(err));
>>>>>>>> +        return err;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    gt->sriov.vf.runtime.num_paging_engine_instances = value;
>>>>>>>> +
>>>>>>>> +    xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>>>>>>>> +    return err;
>>>>>>>       return 0;
>>>>>>>
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     /**
>>>>>>>>      * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>>>>>      * @gt: the &xe_gt
>>>>>>>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>>>>>         if (has_gmdid(xe))
>>>>>>>>             vf_cache_gmdid(gt);
>>>>>>>>     +    err = vf_cache_num_paging_engines(gt);
>>>>>>>> +    if (unlikely(err))
>>>>>>>> +        return err;
>>>>>>>> +
>>>>>>>>         return 0;
>>>>>>>>     }
>>>>>>>>     @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>>>>>         return gt->sriov.vf.self_config.num_ctxs;
>>>>>>>>     }
>>>>>>>>     +/**
>>>>>>>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
>>>>>>> nit: we don't do any query here
>>>>>>>> + * @gt: the &xe_gt
>>>>>>>> + *
>>>>>>>> + * This function is for VF use only.
>>>>>>>> + *
>>>>>>>> + * Return: number of GuC paging engine instances configured by the PF.
>>>>>>>> + */
>>>>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>>>>>>>> +{
>>>>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>>>>>> +
>>>>>>>> +    return gt->sriov.vf.runtime.num_paging_engine_instances;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>>>>>>>     {
>>>>>>>>         u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/ drm/xe/xe_gt_sriov_vf.h
>>>>>>>> index 79878f21b1da..d171a8242a34 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>>>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>>>>>     u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>>>>>     u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>>>>>>     bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>>>>>>>       u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>>>>>>>     void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/ gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>>> index 80562ffadb16..21cb9bc1a341 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>>>>>>>             /** @regs.value: register value. */
>>>>>>>>             u32 value;
>>>>>>>>         } *regs;
>>>>>>>> +    /**
>>>>>>>> +     * @num_paging_engine_instances: number of configured paging engines.
>>>>>>>> +     */
>>>>>>>> +    u32 num_paging_engine_instances;
>>>>>>> nit: can we move this up near .uses_sched_groups
>>>>>>>
>>>>>>>>     };
>>>>>>>>       /**
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/ gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>>> index 97600edda837..be992b8da9a1 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>>>>>>>         /* GuC Global Config KLVs */
>>>>>>>>         case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>>>>>>>             return "group_scheduling_available";
>>>>>>>> +    case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>>>>>>>> +        return "num_paging_engine_instances";
>>>>>>>>         /* VGT POLICY keys */
>>>>>>>>         case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>>>>>>             return "sched_if_idle";
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/ xe/xe_hw_engine.c
>>>>>>>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>>>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>>>>>>>         return err;
>>>>>>>>     }
>>>>>>>>     -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>     {
>>>>>>>>         struct xe_device *xe = gt_to_xe(gt);
>>>>>>>>         unsigned int num_copy_engines = 0, num_paging_engines = 0;
>>>>>>>> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>         if (num_copy_engines && xe->info.has_usm)
>>>>>>>>             num_paging_engines = 1;
>>>>>>>>     +    if (IS_SRIOV_VF(xe)) {
>>>>>>> maybe:
>>>>>>>
>>>>>>>       if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
>>>>>>> or
>>>>>>>       if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>>>>>>>
>>>>>>>> +        u32 vf_num_paging_engines;
>>>>>>>> +
>>>>>>>> +        /*
>>>>>>>> +         * PF could in theory reserve multiple paging engines, which
>>>>>>>> +         * internally the submission/scheduling backend can load balance
>>>>>>>> +         * from. Not something we currently expect, but we are at the
>>>>>>>> +         * mercy of the PF, so we just need try our best to mirror the
>>>>>>>> +         * paging configuration.
>>>>>>>> +         */
>>>>>>>> +        vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>>>>>>>> +        if (vf_num_paging_engines) {
>>>>>>>> +            /* This should only be non-zero on NVL-S+ */
>>>>>>>> +            xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
>>>>> missed this one: I'm not sure we should use assert here:
>>>>> it's not our fault after all, but it's misbehaving PF,
>>>>> so either we silently live with that or abort
>>>>>
>>>>>>>> +            num_paging_engines = vf_num_paging_engines;
>>>>>>>> +        }
>>>>>>> hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?
>>>>>>>
>>>>>>> can it be due to GuC FW being older that 1.36 on NVL-S+?
>>>>>>> can PF skip programming paging class on NVL-S+?
>>>>>> PF can indeed skip programming the paging class and that is a valid (although currently unexpected) scenario.
>>>>>>
>>>>>>> maybe 0 on NVL-S+ is a good reason to abort the probe?
>>>>>> The expectation from the GuC side is that if PF has reserved a paging engine then VF must match it, but if PF hasn't reserved a paging engine then VF is free to reserve a BCS to do paging.
>>>>> but then this paging engine on VF side will not be a paging CLASS, as the rest of the code may assume
>>>>> or it doesn't matter for the VF?
>>>>
>>>> You're right that if we reserve a BCS (like we do now on current platforms) then it needs to be submitted as a COPY class and not as a PAGING class.
>>>> It looks like xe_hwe_to_guc_class and xe_hwe_guc_logical_instance might be unconditionally returning PAGING class on VF if we're on a setup that supports it even if PF has not enabled it (unless I'm missing something), so that might need to be updated.
>>>
>>> I was indeed missing something :)
>>> xe_guc_has_paging_engine(), which is used in both xe_hwe_to_guc_class and xe_hwe_guc_logical_instance to decide if COPY or PAGING class should be used, on VF returns true only if PF has reserved a paging engine (see patch 10); if no paging engines are reserved the code should automatically fall back to COPY class.
> 
> hmm, so maybe we should move that VF chunk from patch 10 to this patch here?
> 
>>
>> Yeah, should "just work" either way.
> 
> ok, so either way, with at least assert fixed,

For the assert can we go with:

if (xe_gt_WARN_ON(gt, xe->info.platform < XE_NOVALAKE_S))
     return -EINVAL;

?

I do think we should treat it as some kind of error. I think from xe 
pov, we will be missing coverage for this combo of GUC_PAGING + pre-NVL 
+ vf, so can't say for sure if it will work or continue to work, or 
mabye just blow up in a more obscure way later. If this does actaully 
trigger in production we can revisit?

> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks.

> 
>>
>>>
>>>>
>>>>>
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>>>>>>>> +        return -EINVAL;
>>>>>>>> +
>>>>>>>>         reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>>>>>>>           /* FIXME: Doing a simple logical mapping that works for most hardware */
>>>>>>>> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>>                 }
>>>>>>>>             }
>>>>>>>>         }
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>>     }
>>>>>>>>       static void read_media_fuses(struct xe_gt *gt)
>>>>>>>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>>>>>>>                 return err;
>>>>>>>>         }
>>>>>>>>     -    hw_engine_setup_logical_and_paging_mapping(gt);
>>>>>>>> +    err = hw_engine_setup_logical_and_paging_mapping(gt);
>>>>>>>> +    if (err)
>>>>>>>> +        return err;
>>>>>>>> +
>>>>>>>>         err = xe_hw_engine_setup_groups(gt);
>>>>>>>>         if (err)
>>>>>>>>             return err;
>>>>
>>>
>>
> 

