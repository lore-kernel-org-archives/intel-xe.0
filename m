Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55A1CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 14:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E20310E0E5;
	Wed, 27 May 2026 14:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCjx2QdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43810E0E5
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779891798; x=1811427798;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qubkqlpxsl4gAIbxVt+v+IphDk5/ThlnWCsULyLPPZc=;
 b=hCjx2QdZIrN0Iw41WW/j/PAQvHZtSi6dXXFeUIsOgBKdStmv8LE/aPMk
 m/R0Wua+viigSN+6Y93kZWdq/LfTbLYXP8l2bGEeJpfVRJsZ71xHUKL+q
 iRjJCW+rhpKlVRSeCPwG90BMxa9CofTbni/Y1Kqe/3rRkKdi6cZdhoXx+
 fSgtWG7FaiPqxNysZth7UnfWrXxCmpima7LVhW5wS3aUv4NC4p1a3eZnH
 twmV+fvmZ08+6ZWmAFrA4DEv07oDTi1F3KvhLYX+A7/KuCkGgHTjm0zFH
 vx2jU01Ci+JduCeOJXNXe6bhky34N1BUcaEfwND9gUM+rYh6l7P4hNLa3 w==;
X-CSE-ConnectionGUID: 4HPntGVwQ1qUV246N2efRw==
X-CSE-MsgGUID: VmN50GX7T8+V0Qidhv60xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80780995"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80780995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:23:18 -0700
X-CSE-ConnectionGUID: SeUGmxKsQuy49dIDXSIRUA==
X-CSE-MsgGUID: qUMJQY69Rne0fjo/3mzAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247206813"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.24])
 ([10.245.245.24])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:23:17 -0700
Message-ID: <c84fc0b2-32da-4809-8432-11b3f1d2153c@intel.com>
Date: Wed, 27 May 2026 15:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260527111335.140000-12-matthew.auld@intel.com>
 <20260527111335.140000-20-matthew.auld@intel.com>
 <c6532948-f3fc-4f47-b3bc-2ab789b84b4e@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <c6532948-f3fc-4f47-b3bc-2ab789b84b4e@intel.com>
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

On 27/05/2026 14:11, Michal Wajdeczko wrote:
> 
> 
> On 5/27/2026 1:13 PM, Matthew Auld wrote:
>> When host PF writes the logical configuration for the GUC PAGING engine,
>> the VF is meant to query it, and mirror it. Size of N means we have
>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>
>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>> should be zero on older platforms, where we should simply fall back to
>> the old behaviour.
>>
>> TODO: Check the final GuC ABI version before merging
>>
>> v2 (Sashiko):
>>    - We can't call use the guc_has_paging_engine() this early in the VF
>>      code. With that just unconditionally do the query, if the GuC is new
>>      enough and take the value as-is. With that drop the -1 special case and
>>      just let the upper layers figure out the rest.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 ++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++
>>   drivers/gpu/drm/xe/xe_hw_engine.c         | 30 +++++++++++++++--
>>   5 files changed, 81 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 644f5a4226d7..608678f8b18c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -52,6 +52,12 @@
>>    * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>    *      Tells the driver whether scheduler groups are enabled or not.
>>    *      Requires GuC ABI 1.26+
>> + *
>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>> + *      Tells the driver the paging engine configuration.
>> + *      Paging engine logical instances are guaranteed to be dense starting at
>> + *      index 0.
>> + *      Requires GuC ABI 1.35.1+
>>    */
> 
> please also update xe_guc_klv_key_to_string()

Thanks for taking a look. Will update.

> 
>>   
>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>> @@ -60,6 +66,9 @@
>>   #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
>>   #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
>>   
>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY	0x3003u
>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN	1u
>> +
>>   /**
>>    * DOC: GuC Self Config KLVs
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 0cd9d77f3351..5c1581c9e432 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -658,6 +658,41 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	struct xe_uc_fw_version guc_version;
>> +	u32 value = 0;
>> +	int err;
>> +
>> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>> +
>> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 35, 1))
>> +		return 0;
>> +
>> +	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>> +					    &value);
>> +	if (unlikely(err)) {
>> +		xe_gt_sriov_err(gt,
>> +				"Failed to obtain the number of paging instances (%pe)\n",
>> +				ERR_PTR(err));
>> +		return err;
>> +	}
> 
> can we do some sanity check here?
> maybe at least compare with BCS_INSTANCES if not zero?

There is a sanity check in hw_engine_setup_logical_and_paging_mapping() 
with:

   if (XE_WARN_ON(num_paging_engines > num_copy_engines))
       return -EINVAL;

I figured add it there, since we also need to pick a value for 
num_paging_engines with PF flow, which then unifies the check in one place.

What do you think here?

> 
>> +
>> +	gt->sriov.vf.runtime.num_paging_engine_instances = value;
>> +
>> +	xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>> +	return err;
>> +}
>> +
> 
> missing kernel-doc
> 
>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
> 
> and move this function down below the xe_gt_sriov_vf_query_config
> to keep xe_gt_sriov_vf_query_config and all its helpers together
> 
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +
>> +	return gt->sriov.vf.runtime.num_paging_engine_instances;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>    * @gt: the &xe_gt
>> @@ -694,6 +729,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>   	if (has_gmdid(xe))
>>   		vf_cache_gmdid(gt);
>>   
>> +	err = vf_cache_num_paging_engines(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 79878f21b1da..d171a8242a34 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>   bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 80562ffadb16..21cb9bc1a341 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>   		/** @regs.value: register value. */
>>   		u32 value;
>>   	} *regs;
>> +	/**
>> +	 * @num_paging_engine_instances: number of configured paging engines.
>> +	 */
>> +	u32 num_paging_engine_instances;
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 31aa6dec0a48..9cdd3e64235c 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -652,7 +652,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   	return err;
>>   }
>>   
>> -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
> 
> nit: maybe it can be 'int' from the beginning?

You mean add this in one of the previous patches? I figured add it here, 
since there is no real failure mode yet, until we get to this patch.

> 
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	unsigned int num_copy_engines = 0, num_paging_engines = 0;
>> @@ -669,6 +669,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>   	if (num_copy_engines && xe->info.has_usm)
>>   		num_paging_engines = 1;
>>   
>> +	if (IS_SRIOV_VF(xe)) {
> 
> maybe this should be:
> 
> 	if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
> 
> so VF will either trust the value received from the PF,
> or share the same logic with the PF otherwise

Can do. But I think we still want to assert:

xe_gt_assert(gt, !vf_num_paging_engines);

Agreement going forward is that this will always be zero on pre-NVL, so 
I think we need double check that in the driver somewhere?

I could move this assert to the VF query instead? My thinking was just 
have the query capture the value as-is, if the GuC version supports it, 
and let the upper layers do the validation etc.

> 
>> +		u32 vf_num_paging_engines;
>> +
>> +		/*
>> +		 * PF could in theory reserve multiple paging engines, which
>> +		 * internally the submission/scheduling backend can load balance
>> +		 * from. Not something we currently expect, but we are at the
>> +		 * mercy of the PF, so we just need try our best to mirror the
>> +		 * paging configuration.
>> +		 */
>> +		vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>> +		if (xe->info.platform >= XE_NOVALAKE_S)
>> +			num_paging_engines = vf_num_paging_engines;
> 
> then we will not bother if received value match the "num_copy_engines && xe->info.has_usm" case
> 
>> +		else
>> +			/* This should only be non-zero on NVL-S+ */
>> +			xe_gt_assert(gt, !vf_num_paging_engines);
> 
> and this assert will be obsolete
> 
>> +	}
>> +
>> +	if (XE_WARN_ON(num_paging_engines > num_copy_engines))
> 
> use xe_gt_WARN_ON(gt, ...) instead
> 
>> +		return -EINVAL;
>> +
>>   	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>   
>>   	/* FIXME: Doing a simple logical mapping that works for most hardware */
>> @@ -690,6 +711,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>   			}
>>   		}
>>   	}
>> +
>> +	return 0;
>>   }
>>   
>>   static void read_media_fuses(struct xe_gt *gt)
>> @@ -908,7 +931,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>   			return err;
>>   	}
>>   
>> -	hw_engine_setup_logical_and_paging_mapping(gt);
>> +	err = hw_engine_setup_logical_and_paging_mapping(gt);
>> +	if (err)
>> +		return err;
>> +
>>   	err = xe_hw_engine_setup_groups(gt);
>>   	if (err)
>>   		return err;
> 

