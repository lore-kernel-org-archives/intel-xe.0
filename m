Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53547C55AB9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 12:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E87C10E355;
	Fri, 20 Feb 2026 12:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuMKCYGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6792010E355
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771589222; x=1803125222;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cOVPX3TkyPLj1l4SUHhcNoFYgwT6KG9MW2QHOIGaoU8=;
 b=AuMKCYGc1TX191E6rxWkySliBFkmV7tv8o40PtuTjsITbXqxOl1RaZFS
 e909nZq9COjFcllrgMRPYx6lVUsUCAOV0oAV6vUazniPllZAuAINZOaZ7
 2Iu2dZjHpUre6FNovleJ+zBb4YFRgBCJ/rL5HBYc1B3HWD2ZmWjHc7gJb
 UnWrakq7pj+cCYE7Pfp2Z62NlAJ3hBpgu6Ft/m9lBlzAWOJm9UfYu+Lzw
 NSJp5lY4G6Z7TZKApA9M+Hdm6PU4ZkO4MwDfT5MwsnD46Y7dWf/Jby07t
 m1O9rxM5XrOBdLSGWVKDGWCcn4XmFT01gl5djVvyeCVrmFTyaEjUntkL6 A==;
X-CSE-ConnectionGUID: dBRAZwyoQLOOWo6ZpBNdFA==
X-CSE-MsgGUID: X+v1TPI3SnKqWABtNHBzng==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84134115"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="84134115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 04:06:54 -0800
X-CSE-ConnectionGUID: CK7cpjKVQBiLQtqBXlKv7w==
X-CSE-MsgGUID: 3KazixNfSNWpZygPLishHQ==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.77])
 ([10.245.245.77])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 04:06:52 -0800
Message-ID: <d458d60b-7764-4e52-8303-3616e79de6d2@intel.com>
Date: Fri, 20 Feb 2026 12:06:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20260220101638.1609775-6-tejas.upadhyay@intel.com>
 <20260220101638.1609775-9-tejas.upadhyay@intel.com>
 <81bc4af0-9601-4709-8bc3-bebb1aa354bd@intel.com>
 <f78a69da78de6991c22e77140bd68b56904d37e2.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <f78a69da78de6991c22e77140bd68b56904d37e2.camel@linux.intel.com>
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

On 20/02/2026 11:50, Thomas Hellström wrote:
> On Fri, 2026-02-20 at 11:46 +0000, Matthew Auld wrote:
>> On 20/02/2026 10:16, Tejas Upadhyay wrote:
>>> When set, the L2 flush optimization feature will control
>>> whether L2 is in Persistent or Transient mode through
>>> monitoring of media activity.
>>>
>>> To enable L2 flush optimization include new feature flag
>>> GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
>>> media type is detected.
>>>
>>> Also, restrict userptr, svm and dmabuf mappings to be
>>> either 2WAY or XA+1WAY
>>>
>>> V2(MattA): validate dma-buf bos and madvise pat-index
> 
> Question: Assuming that we on *faulting* VMs always perform a TLB flush
> on unbind. Can we eliminate the PAT restrictions on those? That would
> actually then include all SVM maps.

With unbind do you mean notifier invalidation flow on svm side? Or 
actual vma unbind?

> 
> /Thomas
>   
> 
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc.c        |  3 +++
>>>    drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>>>    drivers/gpu/drm/xe/xe_vm.c         |  9 +++++++++
>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 18 ++++++++++++++++++
>>>    4 files changed, 31 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>> b/drivers/gpu/drm/xe/xe_guc.c
>>> index cbbb4d665b8f..97c33c3dd520 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc
>>> *guc)
>>>    	if (xe_guc_using_main_gamctrl_queues(guc))
>>>    		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>>>    
>>> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) &&
>>> xe_gt_is_media_type(guc_to_gt(guc)))
>>> +		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>>> +
>>>    	return flags;
>>>    }
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> index a33ea288b907..39ff7b3e960b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
>>>    #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>>>    #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>>>    #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>>> +#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>>>    
>>>    #define GUC_CTL_DEBUG			3
>>>    #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>> b/drivers/gpu/drm/xe/xe_vm.c
>>> index c06fd250e037..e2e4c9648d05 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3474,6 +3474,11 @@ static int vm_bind_ioctl_check_args(struct
>>> xe_device *xe, struct xe_vm *vm,
>>>    				 op ==
>>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>    		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>>>    				 op ==
>>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>> +		    XE_IOCTL_DBG(xe,
>>> xe_device_is_l2_flush_optimized(xe) &&
>>> +				 (op ==
>>> DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>>> +				  /* svm */
>>> +				  op == (DRM_XE_VM_BIND_OP_MAP &&
>>> is_cpu_addr_mirror)) &&
>>
>> op == (DRM_XE_VM_BIND_OP_MAP && is_cpu_addr_mirror)
>>
>> I think you meant (op == DRM_XE_VM_BIND_OP_MAP) && is_cpu ?
>>
>> But maybe just drop the op check. Having the check being consistent
>> for
>> bind/unbind matches existing uapi behaviour?
>>
>>> +				 (pat_index != 19 || coh_mode !=
>>> XE_COH_2WAY)) ||
>>>    		    XE_IOCTL_DBG(xe, comp_en &&
>>>    				 op ==
>>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>    		    XE_IOCTL_DBG(xe, op ==
>>> DRM_XE_VM_BIND_OP_MAP_USERPTR &&
>>> @@ -3608,6 +3613,10 @@ static int
>>> xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
>>> *bo,
>>>    	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
>>> comp_en))
>>>    		return -EINVAL;
>>>    
>>> +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
>>> xe_device_is_l2_flush_optimized(xe) &&
>>> +			 (pat_index != 19 || coh_mode !=
>>> XE_COH_2WAY)))
>>> +		return -EINVAL;
>>> +
>>>    	/* If a BO is protected it can only be mapped if the key
>>> is still valid */
>>>    	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) &&
>>> xe_bo_is_protected(bo) &&
>>>    	    op != DRM_XE_VM_BIND_OP_UNMAP && op !=
>>> DRM_XE_VM_BIND_OP_UNMAP_ALL)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index 1a1ad8c07d49..2a35dbeba2d8 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>>> void *data, struct drm_file *fil
>>>    	struct xe_vmas_in_madvise_range madvise_range = {.addr =
>>> args->start,
>>>    							 .range =
>>> args->range, };
>>>    	struct xe_madvise_details details;
>>> +	u16 pat_index, coh_mode;
>>>    	struct xe_vm *vm;
>>>    	struct drm_exec exec;
>>>    	int err, attr_type;
>>> @@ -447,6 +448,15 @@ int xe_vm_madvise_ioctl(struct drm_device
>>> *dev, void *data, struct drm_file *fil
>>>    	if (err || !madvise_range.num_vmas)
>>>    		goto madv_fini;
>>>    
>>> +	pat_index = array_index_nospec(args->pat_index.val, xe-
>>>> pat.n_entries);
>>
>> This needs to be conditional on DRM_XE_MEM_RANGE_ATTR_PAT. This is a
>> union underneath so pat_index.val is not actually a pat_index for the
>> other madv types, but just some other random data.
>>
>>> +	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>> +	if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
>>> +			 xe_device_is_l2_flush_optimized(xe) &&
>>> +			 (pat_index != 19 || coh_mode !=
>>> XE_COH_2WAY))) {
>>> +		err = -EINVAL;
>>> +		goto madv_fini;
>>> +	}
>>> +
>>>    	if (madvise_range.has_bo_vmas) {
>>>    		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
>>>    			if (!check_bo_args_are_sane(vm,
>>> madvise_range.vmas,
>>> @@ -464,6 +474,14 @@ int xe_vm_madvise_ioctl(struct drm_device
>>> *dev, void *data, struct drm_file *fil
>>>    
>>>    				if (!bo)
>>>    					continue;
>>> +
>>> +				if (XE_IOCTL_DBG(xe, bo-
>>>> ttm.base.import_attach &&
>>> +						
>>> xe_device_is_l2_flush_optimized(xe) &&
>>> +						 (pat_index != 19
>>> || coh_mode != XE_COH_2WAY))) {
>>> +					err = -EINVAL;
>>> +					goto err_fini;
>>> +				}
>>> +
>>>    				err = drm_exec_lock_obj(&exec,
>>> &bo->ttm.base);
>>>    				drm_exec_retry_on_contention(&exec
>>> );
>>>    				if (err)

