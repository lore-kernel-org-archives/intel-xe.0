Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7680CC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 11:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387BF10E3FC;
	Mon, 20 Mar 2023 11:31:17 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37C10E3FF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679311875; x=1710847875;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kl/DFPXcQjzdGjUoE32tR9cHUC8zMtNnNW/anhukumU=;
 b=YnB865+USjGsC7E3VUKgJsiZ9iHnjd/+6Nr0LebfmPlbWIILXXEFlKqx
 FwQKrkUJ4WkAjg9gUA0n5wA9/rPy++6WYEvcJfucZqRusRXEAMmOD0Kuj
 rZHD2yGun1rcIzEtQSwqPtLOGv8dTubbECz6M5t/Awf4nptakHKB6/POE
 IU33jKyiMrsRW/tXXnFuDHbq8GGz6hcol2RfvYXBF60DijrTyDoGLmfnZ
 13khoVbDCMZmvRCRnUBVxJUeNRi5AdgjtabC50f4rP+ItVg+0eBMJXDI8
 g+F4/+bbZTRGKtEQu2x8wSe9deuIN4VehGAJrfPWRf63kFzPkZn9KIAzJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="366354342"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="366354342"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 04:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="713533085"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="713533085"
Received: from scojocar-mobl1.ger.corp.intel.com (HELO [10.249.45.53])
 ([10.249.45.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 04:31:13 -0700
Message-ID: <346d3a67-11dc-afac-9b28-335b8fe1c4fa@linux.intel.com>
Date: Mon, 20 Mar 2023 12:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230318032842.578049-1-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230318032842.578049-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix potential deadlock handling page
 faults
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

Hey,

On 2023-03-18 04:28, Matthew Brost wrote:
> Within a class the GuC will hault scheduling if the head of the queue
> can't be scheduled the queue will block. This can lead to deadlock if
> BCS0-7 all have faults and another engine on BCS0-7 is at head of the
> GuC scheduling queue as the migration engine used to fix tthe fault will
> be blocked. To work around this set the migration engine to the highest
> priority when servicing page faults.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 76ec40567a78..8fad6e60f826 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -106,6 +106,7 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>   static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_engine *e = xe_gt_migrate_engine(gt);
>   	struct xe_vm *vm;
>   	struct xe_vma *vma = NULL;
>   	struct xe_bo *bo;
> @@ -185,6 +186,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	if (ret)
>   		goto unlock_vm;
>   
> +	e->ops->set_priority(e, DRM_SCHED_PRIORITY_KERNEL);
>   	if (atomic) {
>   		if (xe_vma_is_userptr(vma)) {
>   			ret = -EACCES;
> @@ -204,7 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   
>   	/* Bind VMA only to the GT that has faulted */
>   	trace_xe_vma_pf_bind(vma);
> -	fence = __xe_pt_bind_vma(gt, vma, xe_gt_migrate_engine(gt), NULL, 0,
> +	fence = __xe_pt_bind_vma(gt, vma, e, NULL, 0,
>   				 vma->gt_present & BIT(gt->info.id));
>   	if (IS_ERR(fence)) {
>   		ret = PTR_ERR(fence);
> @@ -218,6 +220,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	 */
>   	dma_fence_wait(fence, false);
>   	dma_fence_put(fence);
> +	e->ops->set_priority(e, DRM_SCHED_PRIORITY_NORMAL);

Could we just keep the priority of the migrate engine at KERNEL? This 
change is prone to undo the same priority bump by another pagefault, 
unless you protect the priority with a lock.

~Maarten

