Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB966F4181F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 17:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CE610E577;
	Mon,  9 Mar 2026 17:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0r933KE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D4F10E577
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773076974; x=1804612974;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u9EikczcWTT2hXg5lWZDmKk1C0AfIXFgblyYZtn0TpQ=;
 b=g0r933KE3AgxlFm61TtaIJnp6gOn7NuRK50AXmqqczHM7T34CpcK5RRy
 QAzgUyYvke08pdqtuG5wgjO02H7r+jw1Go3wu7VmeYFht4ZU1P050Sr3A
 L+7mg4fxfoGB2eINI0IRrsIi8xzpoONB191FdCRcuT06N7LSfzs+xpEq4
 sZTWH0TyEgXCWv+na8uBJaf/ok8cvFmLC8UwxA5+fyoaRa7PP3DA+SeEv
 XhKurcxbAMAHPBI+sI3s5Hpvo+VXuL45qZA0loAUpRhLm6Src42h95KcV
 KPAPqoHefM1oy6ZQWDoRICfLQAi5Q7+y3pJpwZcRJqW7CpQSoKH4Vy16+ Q==;
X-CSE-ConnectionGUID: ya7grergQDqqimmD41eyFA==
X-CSE-MsgGUID: APCUg0s1RNW1ZWfcDjoHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77960138"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77960138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 10:22:53 -0700
X-CSE-ConnectionGUID: Qzl1j7xcRD607XhIBQzZIw==
X-CSE-MsgGUID: iNkPGZXgRSuET9FnotW3Gw==
X-ExtLoop1: 1
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.199])
 ([10.245.245.199])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 10:22:51 -0700
Message-ID: <07e5e84d-070b-4fb9-84b9-f80f63b14799@intel.com>
Date: Mon, 9 Mar 2026 17:22:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
 optimization
To: "Zhang, Carl" <carl.zhang@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Souza, Jose" <jose.souza@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
References: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
 <20260305121902.1892593-9-tejas.upadhyay@intel.com>
 <3d8e09d5-c82c-4d8f-91c8-6901860cfc6b@intel.com>
 <PH0PR11MB55798CDC10164A2ACEBC8B4A877AA@PH0PR11MB5579.namprd11.prod.outlook.com>
 <9bb8eb20-659c-45a3-8021-5c54620e707b@intel.com>
 <PH0PR11MB55795DE53945E3945748F1628779A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <PH0PR11MB55795DE53945E3945748F1628779A@PH0PR11MB5579.namprd11.prod.outlook.com>
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

On 09/03/2026 15:29, Zhang, Carl wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Friday, March 6, 2026 6:09 PM
>> To: Zhang, Carl <carl.zhang@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: thomas.hellstrom@linux.intel.com; Souza, Jose <jose.souza@intel.com>;
>> Mrozek, Michal <michal.mrozek@intel.com>
>> Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2 flush
>> optimization
>>
>> On 06/03/2026 07:11, Zhang, Carl wrote:
>>> My understanding:
>>> 1. GuC uses a timer to monitor media activity status. The mode becomes
>> active only when no media tasks have been detected for 5 seconds. From the
>> media perspective, this allows legacy behavior to be maintained without
>> requiring any changes.
>>> 2. The media UMD only needs to set usage hints to gmmlib, which then
>> manages the PAT index. Therefore, the UMD itself should not require
>> changes—only gmmlib needs to be updated to return PAT index 19 on NVL for
>> imported surfaces.
>>> My open is:
>>> 1. In some applications (e.g., ChromeOS), memory is allocated centrally
>> (possibly by minigbm) and then shared across different components. If there
>> are no media tasks, the system operates in persistent mode. However, based
>> on current interfaces, imported memory should be configured as transient +
>> 1-way coherency. This raises a question: if this memory is used exclusively by
>> compute (not media), is this the expected behavior?
>>
>> 2way is also allowed.
>>
>   
> But 2way is slower than 1 way , right?

Likely it would be, I think. But for Media only, not sure.

> 
>>> 2. For userptr memory that is used by only one component, I believe 1-way
>> coherency should be sufficient?
>>
>> I think for 1) and 2), it mostly comes down to CPU/host <-> GPU coherency,
>> right? If you don't use 2WAY or XA, userspace would now have to manually
>> handle the coherency, in case in "persistent" mode. It doesn't matter if there
>> is just one component/app, the coherency issue would still be there.
>>
> For Media (vdbox, vebox), does not use L2 cache,  so, if it is userptr
> 1-way is enough, just need snoop cpu cache.
> 
>> For example, for 2) if you only use 1way without XA, then AFAIK you now
>> need manual flushing, if GPU side is cached and CPU is expecting to see
>> coherent view. Like say GPU writes something and CPU later reads it. The 1-
>> way here would just ensure that GPU snoops the CPU caches on the first
>> access. But if it then gets cached on GPU side, there is now no guaranteed
>> flush when that GPU job is complete, when in "persistent" mode.
>>
> a. my understanding , L2 is used only for RCS and VCS. Not for VCS and VECS.
> Please correct me if there is any misunderstanding.  So, if one external resource
> is only used by media . never be used by CCS RCS. whether we should still have
> such limitation.

Yeah, that matches my understanding. It sounded like Media access does 
not go via l2, so I assume goes directly to system memory. Hence why l2 
needs to be fully flushed if sharing something with Media (which is 
assumed whenever Media is currently turned on).

> 
> b. if there is media task, seems it cant be "persistent" mode. Of course, maybe,
> it is "persistent" mode, then media task comes, it turns to "transient" mode.
> But the data is still in cache , not flushed.  for this case, I agree that any resource
> used firstly by CCS or RCS then shared it to media, it should be set to 2-way or
> 1-way + XA.
> 
>> So assumption was that for userptr, the memory comes from the host, and
>> access is likely shared with CPU/host, so seems reasonable you would want
>> XA or 2WAY. For foreign imported memory you are likely sharing with host or
>> some other device/driver, so seems reasonable you would probably want XA
>> or 2WAY.
>>
>> We can drop the restrictions, if userspace really needs it, but it would be up to
>> userspace to deal with all the CPU/host vs GPU coherency fun, if applicable.
>> The restrictions do simplify things a little on the KMD side, plus the validation
>> angle in IGT.
>>
> I am thinking whether it is too strict.  There is different useagecases.

Do you know which index(s) you would pick instead, for Media only cases? 
I think that is the only edge case you are concerned with here?

Is it not the case that if you are only submitting within Media and it 
if it doesn't actually use l2, wouldn't the XA and l2 cache mode stuff 
be a no-op anyway, since the access from Media side never goes through l2?

Do you know which index that we don't allow, would give 
different/preferred behaviour for Media only case?

> 
>>>
>>> Thanks
>>> Carl
>>>
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: Thursday, March 5, 2026 10:00 PM
>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: thomas.hellstrom@linux.intel.com; Zhang, Carl
>> <carl.zhang@intel.com>;
>>>> Souza, Jose <jose.souza@intel.com>; Mrozek, Michal
>>>> <michal.mrozek@intel.com>
>>>> Subject: Re: [PATCH V6 3/4] drm/xe/xe3p_lpg: Restrict UAPI to enable L2
>> flush
>>>> optimization
>>>>
>>>> On 05/03/2026 12:19, Tejas Upadhyay wrote:
>>>>> When set, starting xe3p_lpg, the L2 flush optimization feature will
>>>>> control whether L2 is in Persistent or Transient mode through
>>>>> monitoring of media activity.
>>>>>
>>>>> To enable L2 flush optimization include new feature flag
>>>>> GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when media
>> type
>>>> is
>>>>> detected.
>>>>>
>>>>> Tighten UAPI validation to restrict userptr, svm and dmabuf mappings
>>>>> to be either 2WAY or XA+1WAY
>>>>>
>>>>> V5(Thomas): logic correction
>>>>> V4(MattA): Modify uapi doc and commit
>>>>> V3(MattA): check valid op and pat_index value
>>>>> V2(MattA): validate dma-buf bos and madvise pat-index
>>>>>
>>>>> Acked-by: José Roberto de Souza <jose.souza@intel.com>
>>>>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc.c        |  3 +++
>>>>>     drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>>>>>     drivers/gpu/drm/xe/xe_vm.c         |  8 ++++++++
>>>>>     drivers/gpu/drm/xe/xe_vm_madvise.c | 23 +++++++++++++++++++++++
>>>>>     include/uapi/drm/xe_drm.h          |  4 +++-
>>>>>     5 files changed, 38 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 54d2fc780127..43dc4353206f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>>>>     	if (xe_guc_using_main_gamctrl_queues(guc))
>>>>>     		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>>>>>
>>>>> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) &&
>>>> xe_gt_is_media_type(guc_to_gt(guc)))
>>>>> +		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>>>>
>>>> Pending whether we also need this on primary GT or not. Since it sounded
>>>> like it would also need to know whether to do a targeted or full flush
>> based
>>>> on current Media status, and it's unclear if here we are meant to opt into
>> that
>>>> for every GT/GuC instance vs just the Media GuC.
>>>>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>
>>>>> +
>>>>>     	return flags;
>>>>>     }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>> index bb8f71d38611..b73fae063fac 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>> @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
>>>>>     #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>>>>>     #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>>>>>     #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>>>>> +#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>>>>>
>>>>>     #define GUC_CTL_DEBUG			3
>>>>>     #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>> index da0ce0b3704c..0b236e08c158 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>> @@ -3481,6 +3481,10 @@ static int vm_bind_ioctl_check_args(struct
>>>> xe_device *xe, struct xe_vm *vm,
>>>>>     				 op ==
>>>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>>>     		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>>>>>     				 op ==
>>>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>>> +		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
>>>>> +				 (op ==
>>>> DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>>>>> +				  is_cpu_addr_mirror) &&
>>>>> +				 (pat_index != 19 && coh_mode !=
>>>> XE_COH_2WAY)) ||
>>>>>     		    XE_IOCTL_DBG(xe, comp_en &&
>>>>>     				 op ==
>>>> DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>>>>>     		    XE_IOCTL_DBG(xe, op ==
>>>> DRM_XE_VM_BIND_OP_MAP_USERPTR && @@
>>>>> -3615,6 +3619,10 @@ static int xe_vm_bind_ioctl_validate_bo(struct
>>>> xe_device *xe, struct xe_bo *bo,
>>>>>     	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
>>>>>     		return -EINVAL;
>>>>>
>>>>> +	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
>>>> xe_device_is_l2_flush_optimized(xe) &&
>>>>> +			 (pat_index != 19 && coh_mode != XE_COH_2WAY)))
>>>>> +		return -EINVAL;
>>>>> +
>>>>>     	/* If a BO is protected it can only be mapped if the key is still valid */
>>>>>     	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) &&
>>>> xe_bo_is_protected(bo) &&
>>>>>     	    op != DRM_XE_VM_BIND_OP_UNMAP && op !=
>>>>> DRM_XE_VM_BIND_OP_UNMAP_ALL) diff --git
>>>>> a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> index 07169586e35f..376c014239ee 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> @@ -411,6 +411,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>>>> void *data, struct drm_file *fil
>>>>>     	struct xe_vmas_in_madvise_range madvise_range = {.addr = args-
>>>>> start,
>>>>>     							 .range =  args-
>>>>> range, };
>>>>>     	struct xe_madvise_details details;
>>>>> +	u16 pat_index, coh_mode;
>>>>>     	struct xe_vm *vm;
>>>>>     	struct drm_exec exec;
>>>>>     	int err, attr_type;
>>>>> @@ -447,6 +448,17 @@ int xe_vm_madvise_ioctl(struct drm_device
>> *dev,
>>>> void *data, struct drm_file *fil
>>>>>     	if (err || !madvise_range.num_vmas)
>>>>>     		goto madv_fini;
>>>>>
>>>>> +	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
>>>>> +		pat_index = array_index_nospec(args->pat_index.val, xe-
>>>>> pat.n_entries);
>>>>> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>>>> +		if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas
>>>> &&
>>>>> +				 xe_device_is_l2_flush_optimized(xe) &&
>>>>> +				 (pat_index != 19 && coh_mode !=
>>>> XE_COH_2WAY))) {
>>>>> +			err = -EINVAL;
>>>>> +			goto madv_fini;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>>     	if (madvise_range.has_bo_vmas) {
>>>>>     		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
>>>>>     			if (!check_bo_args_are_sane(vm,
>>>> madvise_range.vmas, @@ -464,6
>>>>> +476,17 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void
>> *data,
>>>>> struct drm_file *fil
>>>>>
>>>>>     				if (!bo)
>>>>>     					continue;
>>>>> +
>>>>> +				if (args->type ==
>>>> DRM_XE_MEM_RANGE_ATTR_PAT) {
>>>>> +					if (XE_IOCTL_DBG(xe, bo-
>>>>> ttm.base.import_attach &&
>>>>> +
>>>> xe_device_is_l2_flush_optimized(xe) &&
>>>>> +							 (pat_index != 19 &&
>>>>> +							  coh_mode !=
>>>> XE_COH_2WAY))) {
>>>>> +						err = -EINVAL;
>>>>> +						goto err_fini;
>>>>> +					}
>>>>> +				}
>>>>> +
>>>>>     				err = drm_exec_lock_obj(&exec, &bo-
>>>>> ttm.base);
>>>>>     				drm_exec_retry_on_contention(&exec);
>>>>>     				if (err)
>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>> index ef2565048bdf..862fed3cf1ed 100644
>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>> @@ -1103,7 +1103,9 @@ struct drm_xe_vm_bind_op {
>>>>>     	 * incoherent GT access is possible.
>>>>>     	 *
>>>>>     	 * Note: For userptr and externally imported dma-buf the kernel
>>>> expects
>>>>> -	 * either 1WAY or 2WAY for the @pat_index.
>>>>> +	 * either 1WAY or 2WAY for the @pat_index. Starting from NVL-P, for
>>>>> +	 * userptr, svm, madvise and externally imported dma-buf the kernel
>>>> expects
>>>>> +	 * either 2WAY or 1WAY and XA @pat_index.
>>>>>     	 *
>>>>>     	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD
>>>> restrictions
>>>>>     	 * on the @pat_index. For such mappings there is no actual memory
>>>>> being
>>>
> 

