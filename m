Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D34D116F1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 12:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6EB10E168;
	Fri, 28 Nov 2025 12:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iH9QMA04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542810E168
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764334639; x=1795870639;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8SmQZi8VGLbz0CPnvekgWafB6WCMRYaZXOL5bO0bRm4=;
 b=iH9QMA041cPbc93EulmPLG3Hej/Iu9BbvA0vJigUo3O03a0HLDJddG+4
 ycJ7CQ4f8n2Bl45xhLWyRzeXs4Z9VIdgyVFIDvk6Zq89yJegMq0j0i2c5
 jbB2f9zAmWPFRSLHD/Ryw4egC61K+XjN8MIZA5kdTZNEr+RuNpT6Moah7
 /m6Sz1prRfEYKNOz8bX9d8xhkXnk+dH686XhbRU/xKmngcCRUHEcdcVL7
 7W/EQc29AFcCHLbDc7mLK9ECgvGHcUhR8XP3OUjxUCOVcjy0ojuynZaDe
 PDQiocv9VxAWKKzyhS9OacfTXwHRwxOauJzSYvD5dWCGOLb59D1H55V1H A==;
X-CSE-ConnectionGUID: SdCRpHxzTI+H6yvsmgYD2Q==
X-CSE-MsgGUID: et0LBvfXSy+DvtBd8mnhgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65373666"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="65373666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 04:57:19 -0800
X-CSE-ConnectionGUID: QLyqQ2y7TcW1VJDn8TrKJw==
X-CSE-MsgGUID: WYCIVWz5R82zs1sZRxYdYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="224410718"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.244.230])
 ([10.245.244.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 04:57:18 -0800
Message-ID: <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
Date: Fri, 28 Nov 2025 12:57:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
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

On 28/11/2025 10:46, Thomas Hellström wrote:
> The user can give advices as to how the CPU will access an
> address range. Use those advices to determine the number of
> bo pages to prefault on a page-fault.
> 
> Do this regardless of whether we can find a way to avoid the
> fairly slow vm_insert_pfn_prot() to populate buffer
> object maps.
> 
> Initially, fault up to 512 pages on sequential access and
> a single page on random access.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6fd6ce6c6586..07d0d954f826 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
>   	return err;
>   }
>   
> +/*
> + * Number of prefaulted pages for the MADV_SEQUENTIAL and
> + * MADV_RANDOM madvise() advices.
> + */
> +#define XE_BO_VM_NUM_PREFAULT_SEQ  512
> +#define XE_BO_VM_NUM_PREFAULT_RAND 1
> +
>   /* Call into TTM to populate PTEs, and register bo for PTE removal on runtime suspend. */
>   static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
>   {
> +	const struct vm_area_struct *vma = vmf->vma;
> +	pgoff_t num_prefault;
>   	vm_fault_t ret;
>   
>   	trace_xe_bo_cpu_fault(bo);
>   
> +	if (vma->vm_flags & VM_SEQ_READ)
> +		num_prefault = XE_BO_VM_NUM_PREFAULT_SEQ;
> +	else if (vma->vm_flags & VM_RAND_READ)
> +		num_prefault = XE_BO_VM_NUM_PREFAULT_RAND;
> +	else
> +		num_prefault = TTM_BO_VM_NUM_PREFAULT;

Ah, interesting. Do we know if any UMD is making use of these special 
flags today? Just wondering if this might be a visible change or not? 
Also would it make sense to document/advertise this somewhere for UMD 
folks, in case this has an immediate benefit for them?

I guess would be good to add an IGT which uses both flags, if we don't 
already?

Anyway, I think change makes sense,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>   	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -				       TTM_BO_VM_NUM_PREFAULT);
> +				       num_prefault);
>   	/*
>   	 * When TTM is actually called to insert PTEs, ensure no blocking conditions
>   	 * remain, in which case TTM may drop locks and return VM_FAULT_RETRY.

