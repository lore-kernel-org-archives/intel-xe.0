Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11969E9B263
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2EA10E5A1;
	Tue, 24 Feb 2026 13:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwFpSVoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA210E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941343; x=1803477343;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xN93uy/P/fqlM5OPBXswYFEFymfMMAUJQiBow1jVE2I=;
 b=NwFpSVoEbEx3Dl9DfPUulS+0RVzwh+J+U468UrcW2Acw89CefZbnqL3b
 pPneeRYpz8z2hnYrQu9JZVR5EpB4ToXUlQg3Upg8IgYjBSDIkgzdqPAjC
 5BODEVigjI5nlvIkb86OXv654m+MKa2J2sktGvWvdWJD6QX/odetj77kA
 m7zjjFb1QwGhXo3b5wtLTn5JAvVNjMYBM3f/8ooricwCjRxkABZ+McUwz
 t5n0vrE/hCPXYrUSrvs/kzs5E0WGAwbk9kTLZMZrWV+o6wEBN/UDF+YIe
 HU0jUNVf9NNk2XX0lhD4wcdvqB2vDSzKRCPf2r0BXfcWSC36k6J9+CIRF Q==;
X-CSE-ConnectionGUID: NkCAFFcdSmS0qhwphQ8MrA==
X-CSE-MsgGUID: 2VLBDYO1R1+ar+2cs0YzIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84411675"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84411675"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:55:42 -0800
X-CSE-ConnectionGUID: jvGFeZQXQSaMM2FWsB0L2A==
X-CSE-MsgGUID: wTLJHzeMT0ebdzc8+sd5bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246482463"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.173])
 ([10.245.244.173])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:55:40 -0800
Message-ID: <fd59e38b-5c4b-4b04-bb9c-26f14509986d@intel.com>
Date: Tue, 24 Feb 2026 13:55:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>
References: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
 <20260224113147.1656939-9-tejas.upadhyay@intel.com>
 <cb539bba-fbcc-457a-9c6e-f2200b02949d@intel.com>
 <SJ1PR11MB6204275709D0270F9B4C7E3C8174A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SJ1PR11MB6204275709D0270F9B4C7E3C8174A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/02/2026 13:54, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 24 February 2026 19:19
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: thomas.hellstrom@linux.intel.com
>> Subject: Re: [PATCH V4 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
>> feature
>>
>> On 24/02/2026 11:31, Tejas Upadhyay wrote:
>>> When set, the L2 flush optimization feature will control whether L2 is
>>> in Persistent or Transient mode through monitoring of media activity.
>>>
>>> To enable L2 flush optimization include new feature flag
>>> GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when media type is
>>> detected.
>>>
>>> Also, restrict userptr, svm and dmabuf mappings to be either 2WAY or
>>> XA+1WAY
>>
>> Should we also update the uapi header kernel-doc to document/reflect this,
>> since this is a new uapi contract? Also with that we need the usual UMD Cc,
>> just to make sure we are on the same page.
> 
> Sure adding Michal and Jose.

Also media side?

> 
>>
>> Also it might make sense to split the uapi stuff out and exlicity label
>> with: "drm/xe/uapi:", or relabel this commit with "uapi" somewhere in the
>> commit title?
> 
> In a way right, we are changing the expectation for UAPI so can be split and labelled. I will see what is best fit, split or rename to commit.
> 
> Tejas
>>
>>>
>>> V3(MattA): check valid op and pat_index value
>>> V2(MattA): validate dma-buf bos and madvise pat-index
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>   > --->   drivers/gpu/drm/xe/xe_guc.c        |  3 +++
>>>    drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>>>    drivers/gpu/drm/xe/xe_vm.c         |  8 ++++++++
>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 23 +++++++++++++++++++++++
>>>    4 files changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index cbbb4d665b8f..97c33c3dd520 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>>    	if (xe_guc_using_main_gamctrl_queues(guc))
>>>    		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>>>
>>> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) &&
>> xe_gt_is_media_type(guc_to_gt(guc)))
>>> +		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>>   > +>   	return flags;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> index a33ea288b907..39ff7b3e960b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
>>>    #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>>>    #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>>>    #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>>> +#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>>>
>>>    #define GUC_CTL_DEBUG			3
>>>    #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index c06fd250e037..809c868b8ea1 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3474,6 +3474,10 @@ static int vm_bind_ioctl_check_args(struct
>> xe_device *xe, struct xe_vm *vm,
>>>    				 op ==
>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>    		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>>>    				 op ==
>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>> +		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
>>> +				 (op ==
>> DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>>> +				  is_cpu_addr_mirror) &&
>>> +				 (pat_index != 19 || coh_mode !=
>> XE_COH_2WAY)) ||
>>>    		    XE_IOCTL_DBG(xe, comp_en &&
>>>    				 op ==
>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>    		    XE_IOCTL_DBG(xe, op ==
>> DRM_XE_VM_BIND_OP_MAP_USERPTR && @@
>>> -3608,6 +3612,10 @@ static int xe_vm_bind_ioctl_validate_bo(struct
>> xe_device *xe, struct xe_bo *bo,
>>>    	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
>>>    		return -EINVAL;
>>>
>>> +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
>> xe_device_is_l2_flush_optimized(xe) &&
>>> +			 (pat_index != 19 || coh_mode != XE_COH_2WAY)))
>>> +		return -EINVAL;
>>> +
>>>    	/* If a BO is protected it can only be mapped if the key is still valid */
>>>    	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) &&
>> xe_bo_is_protected(bo) &&
>>>    	    op != DRM_XE_VM_BIND_OP_UNMAP && op !=
>>> DRM_XE_VM_BIND_OP_UNMAP_ALL) diff --git
>>> a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index 1a1ad8c07d49..e669e578618b 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>>    	struct xe_vmas_in_madvise_range madvise_range = {.addr = args-
>>> start,
>>>    							 .range =  args->range,
>> };
>>>    	struct xe_madvise_details details;
>>> +	u16 pat_index, coh_mode;
>>>    	struct xe_vm *vm;
>>>    	struct drm_exec exec;
>>>    	int err, attr_type;
>>> @@ -447,6 +448,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>>    	if (err || !madvise_range.num_vmas)
>>>    		goto madv_fini;
>>>
>>> +	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
>>> +		pat_index = array_index_nospec(args->pat_index.val, xe-
>>> pat.n_entries);
>>> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>> +		if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas
>> &&
>>> +				 xe_device_is_l2_flush_optimized(xe) &&
>>> +				 (pat_index != 19 || coh_mode !=
>> XE_COH_2WAY))) {
>>> +			err = -EINVAL;
>>> +			goto madv_fini;
>>> +		}
>>> +	}
>>> +
>>>    	if (madvise_range.has_bo_vmas) {
>>>    		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
>>>    			if (!check_bo_args_are_sane(vm,
>> madvise_range.vmas, @@ -464,6
>>> +476,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>> struct drm_file *fil
>>>
>>>    				if (!bo)
>>>    					continue;
>>> +
>>> +				if (args->type ==
>> DRM_XE_MEM_RANGE_ATTR_PAT) {
>>> +					if (XE_IOCTL_DBG(xe, bo-
>>> ttm.base.import_attach &&
>>> +
>> xe_device_is_l2_flush_optimized(xe) &&
>>> +							 (pat_index != 19 ||
>>> +							  coh_mode !=
>> XE_COH_2WAY))) {
>>> +						err = -EINVAL;
>>> +						goto err_fini;
>>> +					}
>>> +				}
>>> +
>>>    				err = drm_exec_lock_obj(&exec, &bo-
>>> ttm.base);
>>>    				drm_exec_retry_on_contention(&exec);
>>>    				if (err)
> 

