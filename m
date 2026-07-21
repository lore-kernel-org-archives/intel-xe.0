Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE9FC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 08:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6110E300;
	Tue, 21 Jul 2026 08:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBksh0Ub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0D10E300
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784623489; x=1816159489;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eRg8QEjoZtrIpLgwuzq/oFeLoqwKlityO8AVYDug15Q=;
 b=HBksh0UbPu1f9JBgJb9R4y5anX6AmA9gQPnGTekrPou/1sQPjM9E1rxZ
 0Y86BGLDRGnUiPhgvDGKYcVUytZ5ncXTfYMtzi4b36GF0+5vb2MZGbUZN
 mGmBq9pqA0uE/gUbCC3BgXI6BnBaXjehZBInnvGXn99EeXFvIYCyGl46N
 IIZBxW9+gqC2tGVCWGkQf9YbvGiX0d4Xwe3yXUczYJDjwkCkdU0Ghs66x
 fw+03VDytvuCzfARGPqPebXiBBJ0MArJuNpJkF9qgdRjiSzbiuLpuvxfB
 g5w7pAHqAWh4mSAm/RU8owt27klnEcafILEyOKeZgx0qNKwKu2j64Uz0o Q==;
X-CSE-ConnectionGUID: zSJY0e4aTf+ExIG9paCPrA==
X-CSE-MsgGUID: RkMO32JXRZuOojmPt5lyMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89038196"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="89038196"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:44:46 -0700
X-CSE-ConnectionGUID: AEkYNrlZQn64AdZlIYPIQQ==
X-CSE-MsgGUID: e3f7vvh9RRC8vfosvk0K7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253782186"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.58])
 ([10.245.245.58])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:44:44 -0700
Message-ID: <78425c51-b432-45af-bab8-7c74230880cc@intel.com>
Date: Tue, 21 Jul 2026 09:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
To: Matthew Brost <matthew.brost@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org,
 koby.elbaz@intel.com, shuicheng.lin@intel.com, thomas.hellstrom@intel.com
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-9-ilia.levi@intel.com>
 <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
 <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
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

On 21/07/2026 04:20, Matthew Brost wrote:
> On Wed, Jul 15, 2026 at 02:05:35PM +0100, Matthew Auld wrote:
>> Hi,
>>
>> On 26/05/2026 13:51, Ilia Levi wrote:
>>> The fault handler currently assumes it always operates on a VMA spanning
>>> the entire GEM object. This does not hold when the VMA has been split,
>>> e.g. by a partial munmap or mprotect. In that case the handler may map
>>> wrong physical pages or cause SIGBUS.
>>>
>>> Change the fault handler to map only the GEM subrange corresponding to
>>> the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
>>> because helpers like dma_mmap_pages() interpret vm_pgoff as an
>>> intra-buffer page offset; leaving the DRM fake offset there would break
>>> these helpers. Those drivers can get away with zeroing it because they
>>> map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
>>> is never consulted again. This driver does not use such helpers and
>>> defers mapping to the fault handler, where vm_pgoff must be preserved:
>>> when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
>>> subtracts the GEM object's fake mmap offset to recover the page offset
>>> within the object.
>>>
>>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>
>> Would it work if we did something like:
>>
>> +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *vma, unsigned
>> long addr)
>> +{
>> +       return -EINVAL;
>> +}
>> +
>>   static const struct vm_operations_struct vm_ops = {
>>          .open = drm_gem_vm_open,
>>          .close = drm_gem_vm_close,
>>          .fault = xe_mmio_gem_vm_fault,
>> +       .may_split = xe_mmio_gem_vm_may_split,
>>   };
>>
>> ?
>>
>> I don't think partial unmap or similar is really a real use case for this
>> type of special mapping. IMO if we can just reject that would be simplest?
>> What do you think here?
>>
> 
> +1 - I don't think split would really be a use case and most xe_mmio_gem
> usages are likely exactly one page, right?

Yeah, at least in the case of barrier and the other upcoming case I'm 
interested in, it should be one 4K page. There could be usecases where 
it's more than one page, but even so I doubt doing partial unmap or 
whatever is really a needed thing from userspace, for a mapping like 
this. But if that turns out wrong, loosening the restriction should be 
fine in the future. IMO keep it dumb & simple, especially given all the 
bugs we have here.

> 
> Matt
> 
>>> ---
>>>    drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
>>>    1 file changed, 11 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> index c22a38e5616b..15e884ad3f1c 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>>>    struct xe_mmio_gem {
>>>    	struct drm_gem_object base;
>>>    	phys_addr_t phys_addr;
>>> +	unsigned long pgoff;
>>>    };
>>>    static const struct vm_operations_struct vm_ops = {
>>> @@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
>>>    	if (err)
>>>    		goto free_gem;
>>> +	obj->pgoff = drm_vma_node_start(&base->vma_node);
>>> +
>>>    	err = drm_vma_node_allow(&base->vma_node, file);
>>>    	if (err)
>>>    		goto free_gem;
>>> @@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>>>    	if ((vma->vm_flags & VM_SHARED) == 0)
>>>    		return -EINVAL;
>>> -	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>>> -	vma->vm_pgoff = 0;
>>>    	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>>    	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>>    		     VM_DONTCOPY | VM_NORESERVE);
>>> @@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>    	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>    	struct drm_device *dev = base->dev;
>>>    	vm_fault_t ret = VM_FAULT_NOPAGE;
>>> -	unsigned long i;
>>> +	unsigned long addr, pfn;
>>> +	unsigned long pgoff;
>>>    	int idx;
>>>    	if (!drm_dev_enter(dev, &idx)) {
>>> @@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>    		return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>>    	}
>>> -	for (i = 0; i < base->size; i += PAGE_SIZE) {
>>> -		unsigned long addr = vma->vm_start + i;
>>> -		unsigned long phys_addr = obj->phys_addr + i;
>>> +	pgoff = vma->vm_pgoff - obj->pgoff;
>>> +	pfn = PHYS_PFN(obj->phys_addr) + pgoff;
>>> -		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>>> +	for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
>>> +		ret = vmf_insert_pfn(vma, addr, pfn);
>>>    		if (ret & VM_FAULT_ERROR)
>>>    			break;
>>> +
>>> +		pfn++;
>>>    	}
>>>    	drm_dev_exit(idx);
>>

