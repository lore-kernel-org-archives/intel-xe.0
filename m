Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451C3C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 17:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EFC10F17E;
	Thu, 23 Jul 2026 17:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDky/Dcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01C610F17E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784827024; x=1816363024;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HRs4g8ER8z1iXhyHZdp9SRu3Oyt4u/u6r05ftasF2nY=;
 b=PDky/DccgP3BZ2Kg5I6depNiC+gShrd90ShQ4IjdMnXv+697CCmbZjxa
 +c0JCklfWHYDeCxglV3urYDlUMWoVpGhlkvmqOTjJsJy2YGiLjnRcfm13
 AkJUzFtlNH61cqa5ZieUfqFdZopcQTGt3zEWwKOFsLoTROjjmcT602cmc
 jyBHP70SshluxIgvhYEgGsOhbu+AadZ3lwLnmHEHQ8UnqZF8EK0usXD10
 BOdJGgVMvYgxTxCEGeQ6kPzdinoSLnbi15R1Z7bhL4VNVtGNQ3CzQLuL5
 Lzue6P5uPgiNTyqFlHZdukUbW8h6YO/eikBWCfdvVp6Mk0wos6MHRAgdo g==;
X-CSE-ConnectionGUID: EVXajuA2T5e6jmEc7/V5nw==
X-CSE-MsgGUID: yDTWU2fuQ4qJpSfhm33HWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85607151"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85607151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 10:17:04 -0700
X-CSE-ConnectionGUID: yeenMMkBR0yMuQ2EPyhG+A==
X-CSE-MsgGUID: +woEjOgFRQ6Aa4K8ftVbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="262251233"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 10:17:02 -0700
Message-ID: <87f46e8d-f436-43a8-a2b9-bd509ff566c4@intel.com>
Date: Thu, 23 Jul 2026 18:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/mmio_gem: use write-back mapping for dummy
 page
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, meny.yossefi@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, matthew.brost@intel.com,
 Sashiko <sashiko-bot@kernel.org>
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-3-ilia.levi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260723161832.137153-3-ilia.levi@intel.com>
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

On 23/07/2026 17:18, Ilia Levi wrote:
> Currently vmf_insert_pfn() maps the dummy page as UC, inheriting the
> VMA's page protection which was set for the real MMIO region. This
> conflicts with the direct map's WB mapping of the same page, creating a
> cache type alias which is architecturally undefined on x86.

Is this claim correct? AFAICT on x86 it pulls the caching type from the 
pfn, so if the page is allocated as WB, it should just use WB, no? I'm 
looking at pfnmap_setup_cachemode() on x86.

Perhaps this is instead needed for non-x86?

> 
> Use vmf_insert_pfn_prot() with a WB pgprot instead. Also simplify to
> fault in the requested page instead of the whole VMA.
> 
> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260525125801.975038-6-ilia.levi%40intel.com
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio_gem.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index f15a6a84af15..418a24bdfa4e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -172,14 +172,13 @@ static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>   	__free_page((struct page *)res);
>   }
>   
> -static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
>   {
> +	struct vm_area_struct *vma = vmf->vma;
>   	struct drm_gem_object *base = vma->vm_private_data;
>   	struct drm_device *dev = base->dev;
> -	vm_fault_t ret = VM_FAULT_NOPAGE;
>   	struct page *page;
>   	unsigned long pfn;
> -	unsigned long i;
>   
>   	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>   	if (!page)
> @@ -190,16 +189,8 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>   
>   	pfn = page_to_pfn(page);
>   
> -	/* Map the entire VMA to the same dummy page */
> -	for (i = 0; i < base->size; i += PAGE_SIZE) {
> -		unsigned long addr = vma->vm_start + i;
> -
> -		ret = vmf_insert_pfn(vma, addr, pfn);
> -		if (ret & VM_FAULT_ERROR)
> -			break;
> -	}
> -
> -	return ret;
> +	return vmf_insert_pfn_prot(vma, vmf->address, pfn,
> +				   vm_get_page_prot(vma->vm_flags));
>   }
>   
>   static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
> @@ -219,7 +210,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>   		 * It is assumed the userspace will receive the notification via some
>   		 * other channel (e.g. drm uevent).
>   		 */
> -		return xe_mmio_gem_vm_fault_dummy_page(vma);
> +		return xe_mmio_gem_vm_fault_dummy_page(vmf);
>   	}
>   
>   	for (i = 0; i < base->size; i += PAGE_SIZE) {

