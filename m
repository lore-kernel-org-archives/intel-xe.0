Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2734EC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038EE10E046;
	Fri, 24 Mar 2023 16:22:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F27110E046
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679674941; x=1711210941;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xmyPa/E1B+d+3r89tTJK46fP9XTdhZth1RVW7kX6m6o=;
 b=ihaMueomZu9O2NCO2nVgUazC1XVqyvaFa6U7Clq+dRRnpV5wQIkS8pO8
 QEwxituCzKIy5zSq4QlW5wyQcQ4o3at86Jo5pbJk2O3PCLFGMG6NV5zQN
 Bp5J9zPecN3jzDLl0ZH4e2mO45jSm0K+5LnLHHqcancprDdI/gi6QVPiy
 1oKbd6uWaDWoLfN+kNSTPN57HcUShcIx27rrR5qzTzvckoTQG07dcgW8/
 Aoyf0FLwess0Q9T/6FegTqOKkm4CaQhVU+uktXXzrWH7B+ELcqUbDY5zb
 TB6P1YZxatXJB5pFixCI4u0DzRYCdVYxUa1fvkd9PA3SiR/CyPdnggGeM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328242099"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328242099"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676204674"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="676204674"
Received: from bherle-mobl.ger.corp.intel.com (HELO [10.252.38.170])
 ([10.252.38.170])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:22:20 -0700
Message-ID: <04a53f29-7087-c4ea-3630-adac66506929@linux.intel.com>
Date: Fri, 24 Mar 2023 17:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230321160815.673423-1-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230321160815.673423-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2023-03-21 17:08, Matthew Brost wrote:
> Rather waiting for the VM to be destroyed (all refs to VM go to zero),
> drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
> This avoids a window where user space can create a faulting VM, close
> it, and a subsequent creation of a non-faulting VM fails.
>
> v2 (Lucas): Drop VLK reference in commit message
>
> Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 68ab51f84bed..ab036a51d17e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1349,6 +1349,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	XE_WARN_ON(!list_empty(&vm->extobj.list));
>   	up_write(&vm->lock);
>   
> +	mutex_lock(&xe->usm.lock);
> +	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> +		xe->usm.num_vm_in_fault_mode--;
> +	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> +		xe->usm.num_vm_in_non_fault_mode--;
> +	mutex_unlock(&xe->usm.lock);
> +
>   	xe_vm_put(vm);
>   }
>   
> @@ -1393,18 +1400,10 @@ static void vm_destroy_work_func(struct work_struct *w)
>   
>   	drm_gpuva_manager_destroy(&vm->mgr);
>   
> -	mutex_lock(&xe->usm.lock);
> -	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> -		xe->usm.num_vm_in_fault_mode--;
> -	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> -		xe->usm.num_vm_in_non_fault_mode--;
> -	mutex_unlock(&xe->usm.lock);
> -
>   	trace_xe_vm_free(vm);
>   	dma_fence_put(vm->rebind_fence);
>   	dma_resv_fini(&vm->resv);
>   	kfree(vm);
> -
>   }
>   
>   void xe_vm_free(struct kref *ref)
