Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB007C4452F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 13:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6948010E781;
	Tue, 21 Jul 2026 13:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbszzzNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5766710E781
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784639983; x=1816175983;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0yD8PSM9MXFKSeHyHEiiJtA+sz3wN+g6OunvBB+9X+Y=;
 b=ZbszzzNfOpNokHZ4upg8UNzFyUVyYR5RK51Gdy8NABFPQ2PLcaGC62vU
 tNgc0bckBOdtwCKgXypsSMcyuR+KwD+4h9zqN/6iT3dzN/osB639KfAAp
 YWGGFsWBUUeWTEumZ4AaYphyFz9+NSDDokRv6sLsReKXFAVm2kyrRl35X
 4FWppFvRrM1Z3Wx3OZx9vKc+byiRXSxTOyjYEVkKppB1MQDIqHbgN8Np2
 WZnFgKm+5TR2AYCqitWzL8NYXmRB2ahRNVegmTD6udkcGnP6a9luTmQlo
 s4PZNLM2H8gN4aBUn+BUlaJksNRjeviTObzWopdUSzHvmU1Tg3+A7Yoh0 g==;
X-CSE-ConnectionGUID: O0mf/RwQTCyCaDbZlj86/Q==
X-CSE-MsgGUID: xi8V6O2pSRGYX06BoeSfIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85439829"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85439829"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:19:42 -0700
X-CSE-ConnectionGUID: D60IhnJjTgSWRf1IssdLIw==
X-CSE-MsgGUID: m8ZHFyk0RsicNzPWec+SJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="262039564"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.58])
 ([10.245.245.58])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:19:40 -0700
Message-ID: <ef91436b-2ba6-404a-aa47-45937175663a@intel.com>
Date: Tue, 21 Jul 2026 14:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
To: "Levi, Ilia" <ilia.levi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, koby.elbaz@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-9-ilia.levi@intel.com>
 <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
 <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
 <78425c51-b432-45af-bab8-7c74230880cc@intel.com>
 <d3802216-6404-4d4d-b166-a3407bfd4c14@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d3802216-6404-4d4d-b166-a3407bfd4c14@intel.com>
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

On 21/07/2026 12:49, Levi, Ilia wrote:
> 
> On 21-Jul-26 11:44, Matthew Auld wrote:
>> On 21/07/2026 04:20, Matthew Brost wrote:
>>> On Wed, Jul 15, 2026 at 02:05:35PM +0100, Matthew Auld wrote:
>>>> Hi,
>>>>
>>>> On 26/05/2026 13:51, Ilia Levi wrote:
>>>>> The fault handler currently assumes it always operates on a VMA spanning
>>>>> the entire GEM object. This does not hold when the VMA has been split,
>>>>> e.g. by a partial munmap or mprotect. In that case the handler may map
>>>>> wrong physical pages or cause SIGBUS.
>>>>>
>>>>> Change the fault handler to map only the GEM subrange corresponding to
>>>>> the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
>>>>> because helpers like dma_mmap_pages() interpret vm_pgoff as an
>>>>> intra-buffer page offset; leaving the DRM fake offset there would break
>>>>> these helpers. Those drivers can get away with zeroing it because they
>>>>> map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
>>>>> is never consulted again. This driver does not use such helpers and
>>>>> defers mapping to the fault handler, where vm_pgoff must be preserved:
>>>>> when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
>>>>> subtracts the GEM object's fake mmap offset to recover the page offset
>>>>> within the object.
>>>>>
>>>>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>>>>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>>
>>>> Would it work if we did something like:
>>>>
>>>> +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *vma, unsigned
>>>> long addr)
>>>> +{
>>>> +       return -EINVAL;
>>>> +}
>>>> +
>>>>    static const struct vm_operations_struct vm_ops = {
>>>>           .open = drm_gem_vm_open,
>>>>           .close = drm_gem_vm_close,
>>>>           .fault = xe_mmio_gem_vm_fault,
>>>> +       .may_split = xe_mmio_gem_vm_may_split,
>>>>    };
>>>>
>>>> ?
>>>>
>>>> I don't think partial unmap or similar is really a real use case for this
>>>> type of special mapping. IMO if we can just reject that would be simplest?
>>>> What do you think here?
>>>>
>>>
>>> +1 - I don't think split would really be a use case and most xe_mmio_gem
>>> usages are likely exactly one page, right?
>>
>> Yeah, at least in the case of barrier and the other upcoming case I'm interested in, it should be one 4K page. There could be usecases where it's more than one page, but even so I doubt doing partial unmap or whatever is really a needed thing from userspace, for a mapping like this. But if that turns out wrong, loosening the restriction should be fine in the future. IMO keep it dumb & simple, especially given all the bugs we have here.
> 
> 
> We could definitely do that, but I'm not sure what we would gain by being more
> restrictive.
 > > In terms of implementation, we won't need to store and use pgoff, 
but I would
> still keep the loop change (as it reads more naturally) and remove
> vma->vm_pgoff = 0 (since drm_vma_node_unmap() zapping relies on it).
> So it comes out to roughly the same amount of code either way — the .may_split
> hook is about the same size as the pgoff handling it replaces.
> 
> And while partial unmap indeed doesn't sound useful, I could imagine a use-case
> for mprotect, e.g. a hw producer ring whose body is mapped read-only to
> userspace while a control/doorbell page stays writable.
> 
> If you think a narrower API is preferable though - I'm ok with making the change.

Since this is uapi, it's usually better to go as narrow as possible, 
since it will be harder to revoke later, if we did decide to do that. On 
the other hand loosening the restriction later is fine.

In addition it looks like adding features with no current user or a way 
to currently validate it in IGT, even if the code itself looks simple in 
the KMD.

> 
> - Ilia
> 
>>
>>>
>>> Matt
>>>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
>>>>>     1 file changed, 11 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>>> index c22a38e5616b..15e884ad3f1c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>>> @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>>>>>     struct xe_mmio_gem {
>>>>>         struct drm_gem_object base;
>>>>>         phys_addr_t phys_addr;
>>>>> +    unsigned long pgoff;
>>>>>     };
>>>>>     static const struct vm_operations_struct vm_ops = {
>>>>> @@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
>>>>>         if (err)
>>>>>             goto free_gem;
>>>>> +    obj->pgoff = drm_vma_node_start(&base->vma_node);
>>>>> +
>>>>>         err = drm_vma_node_allow(&base->vma_node, file);
>>>>>         if (err)
>>>>>             goto free_gem;
>>>>> @@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>>>>>         if ((vma->vm_flags & VM_SHARED) == 0)
>>>>>             return -EINVAL;
>>>>> -    /* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>>>>> -    vma->vm_pgoff = 0;
>>>>>         vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>>>>         vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>>>>                  VM_DONTCOPY | VM_NORESERVE);
>>>>> @@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>>>         struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>>>         struct drm_device *dev = base->dev;
>>>>>         vm_fault_t ret = VM_FAULT_NOPAGE;
>>>>> -    unsigned long i;
>>>>> +    unsigned long addr, pfn;
>>>>> +    unsigned long pgoff;
>>>>>         int idx;
>>>>>         if (!drm_dev_enter(dev, &idx)) {
>>>>> @@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>>>             return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>>>>         }
>>>>> -    for (i = 0; i < base->size; i += PAGE_SIZE) {
>>>>> -        unsigned long addr = vma->vm_start + i;
>>>>> -        unsigned long phys_addr = obj->phys_addr + i;
>>>>> +    pgoff = vma->vm_pgoff - obj->pgoff;
>>>>> +    pfn = PHYS_PFN(obj->phys_addr) + pgoff;
>>>>> -        ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>>>>> +    for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
>>>>> +        ret = vmf_insert_pfn(vma, addr, pfn);
>>>>>             if (ret & VM_FAULT_ERROR)
>>>>>                 break;
>>>>> +
>>>>> +        pfn++;
>>>>>         }
>>>>>         drm_dev_exit(idx);
>>>>
>>

