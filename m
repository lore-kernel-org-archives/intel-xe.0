Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84492C531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4067810E5C3;
	Tue, 28 Jul 2026 16:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDCN8Y2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F255010E5C3
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785256683; x=1816792683;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FxGvB+sfGzPNGsYn3Yqbh3hRzUscGdtMDbn3Cd9YRlI=;
 b=PDCN8Y2PUTrerQzCYJFsBGrr9cQx268l5pRmVZ8BIsUDNSnQkkWdgW10
 MEm5p/kkQHCSfBagWIoLL9cqiL/+BJ3TLQwYVWUA3+LEST13cpyHICppD
 JXD5DXAcg1ixFNHJzkWLdzj+9Ji04IhqWfmheMI38j3R3WUK5QTizuPG9
 vDVNc+r+DOMAEBGab3b708lrAGaRT9UN4zlNfM+uBE04dfv8m53kYeM0i
 pt328W2cx1bkkLJWKEFMxLuprI76pZAhxRZejDlK8oNwlkkkeaz05jBvj
 rJXW7GTeGwEuW6a3STe71GDsCtrVNnHshWEty+VwUxL/GCD0tB4sIYs8q A==;
X-CSE-ConnectionGUID: HaaaqWM8RBmVE6esq9B9Xw==
X-CSE-MsgGUID: LhBi1eSiQiCpnAP5dQjXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96203531"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96203531"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:38:02 -0700
X-CSE-ConnectionGUID: Fj8Fje4XSeC6GO2el1pBMw==
X-CSE-MsgGUID: ez2h8ZSPRtiXRKl8HeAmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="253415579"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.120])
 ([10.245.244.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:38:00 -0700
Message-ID: <aacb6ef7-6d09-4ad7-a7f2-e202a3867dfc@intel.com>
Date: Tue, 28 Jul 2026 17:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/mmio_gem: use write-back mapping for dummy
 page
To: "Levi, Ilia" <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, meny.yossefi@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, matthew.brost@intel.com,
 Sashiko <sashiko-bot@kernel.org>
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-3-ilia.levi@intel.com>
 <87f46e8d-f436-43a8-a2b9-bd509ff566c4@intel.com>
 <95514f1d-2cee-4c3e-b228-2a43dddd5269@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <95514f1d-2cee-4c3e-b228-2a43dddd5269@intel.com>
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

On 24/07/2026 10:49, Levi, Ilia wrote:
> 
> On 23-Jul-26 20:16, Matthew Auld wrote:
>> On 23/07/2026 17:18, Ilia Levi wrote:
>>> Currently vmf_insert_pfn() maps the dummy page as UC, inheriting the
>>> VMA's page protection which was set for the real MMIO region. This
>>> conflicts with the direct map's WB mapping of the same page, creating a
>>> cache type alias which is architecturally undefined on x86.
>>
>> Is this claim correct? AFAICT on x86 it pulls the caching type from the pfn, so if the page is allocated as WB, it should just use WB, no? I'm looking at pfnmap_setup_cachemode() on x86.
>>
>> Perhaps this is instead needed for non-x86?
> 
> Right, or on x86 if PAT is disabled. Good catch!

With that perhaps tweaked to make it clearer,

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
>>
>>>
>>> Use vmf_insert_pfn_prot() with a WB pgprot instead. Also simplify to
>>> fault in the requested page instead of the whole VMA.
>>>
>>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> Closes: https://sashiko.dev/#/patchset/20260525125801.975038-6-ilia.levi%40intel.com
>>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_mmio_gem.c | 19 +++++--------------
>>>    1 file changed, 5 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> index f15a6a84af15..418a24bdfa4e 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> @@ -172,14 +172,13 @@ static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>>>        __free_page((struct page *)res);
>>>    }
>>>    -static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>>> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_fault *vmf)
>>>    {
>>> +    struct vm_area_struct *vma = vmf->vma;
>>>        struct drm_gem_object *base = vma->vm_private_data;
>>>        struct drm_device *dev = base->dev;
>>> -    vm_fault_t ret = VM_FAULT_NOPAGE;
>>>        struct page *page;
>>>        unsigned long pfn;
>>> -    unsigned long i;
>>>          page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>>>        if (!page)
>>> @@ -190,16 +189,8 @@ static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>>>          pfn = page_to_pfn(page);
>>>    -    /* Map the entire VMA to the same dummy page */
>>> -    for (i = 0; i < base->size; i += PAGE_SIZE) {
>>> -        unsigned long addr = vma->vm_start + i;
>>> -
>>> -        ret = vmf_insert_pfn(vma, addr, pfn);
>>> -        if (ret & VM_FAULT_ERROR)
>>> -            break;
>>> -    }
>>> -
>>> -    return ret;
>>> +    return vmf_insert_pfn_prot(vma, vmf->address, pfn,
>>> +                   vm_get_page_prot(vma->vm_flags));
>>>    }
>>>      static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>> @@ -219,7 +210,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>             * It is assumed the userspace will receive the notification via some
>>>             * other channel (e.g. drm uevent).
>>>             */
>>> -        return xe_mmio_gem_vm_fault_dummy_page(vma);
>>> +        return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>>        }
>>>          for (i = 0; i < base->size; i += PAGE_SIZE) {
>>

