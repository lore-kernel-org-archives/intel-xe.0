Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D34C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 15:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054210E600;
	Tue, 15 Jul 2025 15:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAK/mGlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A4610E600
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752594867; x=1784130867;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=P33pVmLEYAZSQzHxNbOxWuXealFQ9pQ4vn6etGkw68I=;
 b=FAK/mGlwBi31/suH6HmvTQXnotGw3NaGvnrxJPHofeA0WWwzcH4FrSvd
 MnypptUUBWc0gK7MJWhId3S5hj25fPx3DDj1fuRK7s8qDA/JQOVfkRpLW
 I7TdpGLkQIJ4lGnP2kMus8h8InLlU0VzDxA0FFL2/HsaMLMxBfbX3NlMr
 uDWeAisvMzCc9TXf9/DwGUnhO8r4bKYtf/plUSy0cZvZUeUXUDmFpfrja
 +V4bEHgVSX4aqV4ydV1vPMiwh5EUBxEaXzwxaTKk81vdFq3xmLXKna5Qb
 dEf2ftOIC/uN0Ngh0XCpEKhsZZqXsETvtkEe0/5ttU/7WDa8fYfMeQfqc w==;
X-CSE-ConnectionGUID: tad6IcgwQnq5MuON+8R4NA==
X-CSE-MsgGUID: eTShPDR2QZiSJE1H/9dgkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65888316"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65888316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:54:27 -0700
X-CSE-ConnectionGUID: GkOkWbLNRGy7xpNk+5mp+A==
X-CSE-MsgGUID: e6YyEXXXRZ6MiE6B9SsJzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161576503"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:54:26 -0700
Message-ID: <0175ca57-8feb-4bd5-ace2-85338ba6df78@intel.com>
Date: Tue, 15 Jul 2025 16:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix oops in xe_gem_fault when running
 core_hotunplug test.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
References: <20250715152057.23254-2-dev@lankhorst.se>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250715152057.23254-2-dev@lankhorst.se>
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

On 15/07/2025 16:20, Maarten Lankhorst wrote:
> I saw an oops in xe_gem_fault when running the xe-fast-feedback
> testlist against the realtime kernel without debug options enabled.
> 
> The panic happens after core_hotunplug unbind-rebind finishes.
> Presumably what happens is that a process mmaps, unlocks because
> of the FAULT_FLAG_RETRY_NOWAIT logic, has no process memory left,
> causing ttm_bo_vm_dummy_page() to return VM_FAULT_NOPAGE, since
> there was nothing left to populate, and then oopses in
> "mem_type_is_vram(tbo->resource->mem_type)" because tbo->resource
> is NULL.
> 
> It's convoluted, but fits the data and explains the oops after
> the test exits.

Yeah, looks like on unplug you can indeed have a NULL placement 
according to xe_evict_flags (I think we also evict everything on unplug 
with xe_bo_pci_dev_remove_all), where purge placement might result in 
calling pipeline gutting on the BO, AFAICT. If the fault is triggered on 
such a BO after the unplug then this explains the NPD.

> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c5a5154e1363b..68aefb6f23cde 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1716,22 +1716,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>   					       TTM_BO_VM_NUM_PREFAULT);
>   		drm_dev_exit(idx);
> +
> +		if (ret == VM_FAULT_RETRY &&
> +		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +			goto out;
> +
> +		/*
> +		 * ttm_bo_vm_reserve() already has dma_resv_lock.
> +		 */
> +		if (ret == VM_FAULT_NOPAGE &&
> +		    mem_type_is_vram(tbo->resource->mem_type)) {
> +			mutex_lock(&xe->mem_access.vram_userfault.lock);
> +			if (list_empty(&bo->vram_userfault_link))
> +				list_add(&bo->vram_userfault_link,
> +					 &xe->mem_access.vram_userfault.list);
> +			mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +		}
>   	} else {
>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>   	}
>   
> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		goto out;
> -	/*
> -	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> -	 */
> -	if (ret == VM_FAULT_NOPAGE && mem_type_is_vram(tbo->resource->mem_type)) {
> -		mutex_lock(&xe->mem_access.vram_userfault.lock);
> -		if (list_empty(&bo->vram_userfault_link))
> -			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault.list);
> -		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> -	}
> -
>   	dma_resv_unlock(tbo->base.resv);
>   out:
>   	if (needs_rpm)

