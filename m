Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642BBC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830E310E0BB;
	Fri,  1 Dec 2023 09:21:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAFE10E855
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422454; x=1732958454;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vXM21fTCeYmM/shpHixHy7XoyFXTLVtcdVhlwRDXjME=;
 b=X1YhPoegDit2owHkWyEv6jhLw3P53TJKJIjYGRHfeY3vrKPfAmzGr+wl
 wfqXdXrFULzt4MCd6Mw1/jTkq0+vSsRh62PZx1QeKoEUA3Q3xG+QollH/
 ulK5otAwYEKdZfCyWX3l8fZOfjjeh7ZXQA54oN2mdzBwi48xDnSYdMdne
 cPmBBNfZsdGkxo0qaMsjlRV1t8awaBmvZ3ge6cSJBvm/NDPkwEeF8HE5p
 Yuv6wexMHa1rji2aj9yg7R9r6npQDbVA76NaQelnsAXLQ4TvHgISfi2Zn
 k06VjOXXfzjz0zZvBCWu7hgB7wM0ZlXDYrs89MnyHbmb6TrE1xbGvpwNY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="424619768"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="424619768"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="773374937"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="773374937"
Received: from qiangfu1-mobl1.ccr.corp.intel.com (HELO [10.249.254.213])
 ([10.249.254.213])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:20:31 -0800
Message-ID: <e0b43979-5ab4-e974-d8d5-d540a48252b8@linux.intel.com>
Date: Fri, 1 Dec 2023 10:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231127150330.38041-1-thomas.hellstrom@linux.intel.com>
 <20231127150330.38041-2-thomas.hellstrom@linux.intel.com>
 <ZWTkIF13SYmeFuE/@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZWTkIF13SYmeFuE/@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe/uapi: Use LR abbrev for
 long-running vms
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/27/23 19:46, Rodrigo Vivi wrote:
> On Mon, Nov 27, 2023 at 04:03:30PM +0100, Thomas Hellström wrote:
>> Currently we're using "compute mode" for long running VMs using
>> preempt-fences for memory management, and "fault mode" for long
>> running VMs using page faults.
>>
>> Change this to use the terminology "long-running" abbreviated as LR for
>> long-running VMs. These VMs can then either be in preempt-fence mode or
>> fault mode. The user can force fault mode at creation time, but otherwise
>> the driver can choose to use fault- or preempt-fence mode for long-running
>> vms depending on the device capabilities. Initially unless fault-mode is
>> specified, the driver uses preempt-fence mode.
>>
>> v2:
>> - Fix commit message wording and the documentation around
>>    CREATE_FLAG_LR_MODE and CREATE_FLAG_FAULT_MODE
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c |  8 ++++----
>>   include/uapi/drm/xe_drm.h  | 23 ++++++++++++++++++++++-
>>   2 files changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index aa965e90ce12..6d35067ed8bc 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1919,7 +1919,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>>   }
>>   
>>   #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
>> -				    DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE | \
>> +				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
>>   				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
>>   				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>>   
>> @@ -1955,7 +1955,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>   			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>>   		return -EINVAL;
>>   
>> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE &&
>> +	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>>   			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>>   		return -EINVAL;
>>   
>> @@ -1972,12 +1972,12 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>   
>>   	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>>   		flags |= XE_VM_FLAG_SCRATCH_PAGE;
>> -	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
>> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
>>   		flags |= XE_VM_FLAG_LR_MODE;
>>   	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
>>   		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
>>   	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>> -		flags |= XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE;
>> +		flags |= XE_VM_FLAG_FAULT_MODE;
>>   
>>   	vm = xe_vm_create(xe, flags);
>>   	if (IS_ERR(vm))
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 88f3aca02b08..2810997a6db4 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -589,8 +589,29 @@ struct drm_xe_vm_create {
>>   	__u64 extensions;
>>   
>>   #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>> -#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
>> +	/*
>> +	 * An LR, or Long Running VM accepts exec submissions
>> +	 * to its exec_queues that don't have an upper time limit on
>> +	 * the job execution time. But exec submissions to these
>> +	 * don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
>> +	 * DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
>> +	 * used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
>> +	 * LR VMs can be created in recoverable page-fault mode using
>> +	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
>> +	 * If that flag is omitted, the UMD can not rely on the slightly
>> +	 * different per-VM overcommit semantics that are enabled by
>> +	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
>> +	 * still enable recoverable pagefaults if supported by the device.
>> +	 */
>> +#define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>>   #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
>> +	/*
>> +	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
>> +	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
>> +	 * on demand when accessed, and also allows per-VM overcommit of memory.
>> +	 * The xe driver internally uses recoverable pagefaults to implement
>> +	 * this.
> what happens if user selects this flag in a hardware that doesn't support
> recoverable pagefaults?

It will return -EINVAL. Same thing happens if user, for example selects 
scratch page mode.

It also appears like currently the device supports either only pagefault 
mode user VMs or only non-pagefault mode user VMs. Not completely sure why.

/Thomas


>> +	 */
>>   #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
>>   	/** @flags: Flags */
>>   	__u32 flags;
>> -- 
>> 2.41.0
>>
