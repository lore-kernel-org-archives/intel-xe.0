Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70515C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 13:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1A910E90A;
	Thu, 21 Mar 2024 13:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVjG6QSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C7510E90A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711027239; x=1742563239;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AanfltvuCY6c8ezNv5Hscburd2wSaZj0u9JP+W7PBN8=;
 b=JVjG6QSGfucNMcHP9/d4qzyavW3HTmLJk5TjST3ua/CSQ5+WhEgU7WaW
 uYFueqER7SbIrYoVguMKrKW6BExOj5tKKkehYmtBpnAaUJOZmAaoMZkcr
 l/lMYdStsUQq8VWrTisIfnTfSbKOp4z01gD0C29BjG8pbrw7BXK4rwkcG
 vplObkGJpG6nnzoeDgBe11kvuXi1wOxnhwtcAbNDCyQXU/tJp6eJ81SC8
 6fdCRSSIR93fT18QD18lpUF3B6AxTLdngdy2Nqx4j1IbfOTmijnNBzex7
 za9cI4g8Y2Ce34VPZwN1Lpe5i9MZifSc+sPuX9F6HBcEz/p4h0oGIt1oy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6620775"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6620775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14475578"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:20:38 -0700
Message-ID: <918da0c9-bdde-40be-a184-822ddfbea0ae@linux.intel.com>
Date: Thu, 21 Mar 2024 14:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add debug messages for MMU notifier and VMA
 invalidate
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240320194232.1910688-1-matthew.brost@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240320194232.1910688-1-matthew.brost@intel.com>
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


On 3/20/2024 8:42 PM, Matthew Brost wrote:
> Extra debug is useful when working on VM issues.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

  print_op() can be expanded to handle this but may be in a separate patch.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 80d43d75b1da..e3692b7e1711 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -648,6 +648,10 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>   	if (!mmu_notifier_range_blockable(range))
>   		return false;
>   
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
> +		xe_vma_start(vma), xe_vma_size(vma));
> +
>   	down_write(&vm->userptr.notifier_lock);
>   	mmu_interval_set_seq(mni, cur_seq);
>   
> @@ -3233,6 +3237,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	xe_assert(xe, !xe_vma_is_null(vma));
>   	trace_xe_vma_invalidate(vma);
>   
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "INVALIDATE: addr=0x%016llx, range=0x%016llx",
> +		xe_vma_start(vma), xe_vma_size(vma));
> +
>   	/* Check that we don't race with page-table updates */
>   	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>   		if (xe_vma_is_userptr(vma)) {
