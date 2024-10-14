Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D6FD16240
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 11:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4716810E1BE;
	Mon, 14 Oct 2024 11:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsdtEZA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4F10E1BE
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728903838; x=1760439838;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QtSvIsQp4mSVBBIAuNnZQLD87oPxBPW69BEFfNAA9cc=;
 b=RsdtEZA61Fvy5x8HwrUQeylHLWGEL9YegT8cAcuOOwBFIk+6Hvselzlc
 OpGInIrAJmAE4qlfd2JBGrekhks+qGZy/MZVM8TjxxtxhGGlS/1igA1GI
 HDhYaKYiYxpBm8H6rwV0Zoq1R9HZEpxzj7OtSEef6AKGUX9UDoS213B0I
 AkLC5WZWHPUzGnHoYPHFU0wH8JtuC72ydviY1CBRtIcBTs8LU7/kWsPux
 rmtBhL9jtGOX2gy27kIM/rP8VaHu2TZE72SAR+1f53XzlfTFuWlzVCF3f
 UXXlHDgSUXVhpvQE4vs1s3yL2w1JHnEgC0ygcJj5NKLcdA0VebIdIDG1L Q==;
X-CSE-ConnectionGUID: cWzaHNu7RKKEpuYGLpy6tA==
X-CSE-MsgGUID: Ol7Hs5QwSw+vELRb41eYQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28329739"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28329739"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 04:03:57 -0700
X-CSE-ConnectionGUID: /nIo44GxQwiP73jaw82nCA==
X-CSE-MsgGUID: 0FFsrh9vSbmThTFyCl7Skw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77413280"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.94])
 ([10.245.244.94])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 04:03:56 -0700
Message-ID: <e8f4f5fd-d7a1-4ca9-8a62-543d10c32a15@intel.com>
Date: Mon, 14 Oct 2024 12:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
 <c55c17c9-9882-4124-918b-88b951469185@intel.com>
 <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
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

On 14/10/2024 11:23, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Wednesday, October 9, 2024 7:27 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory
>> barrier
>>
>> Hi,
>>
>> On 09/10/2024 11:10, Tejas Upadhyay wrote:
>>> In order to avoid having userspace to use MI_MEM_FENCE, we are adding
>>> a mechanism for userspace to generate a PCI memory barrier with low
>>> overhead (avoiding IOCTL call).
>>
>> I guess it doesn't work if we just do VRAM write from the host side?
> 
> Writing to VRAM will adds some overhead which UMD wants to avoid. So the suggestion came out was to use special MMIO page mapped directly which is not accessible from the PCI bus so that the MMIO writes themselves are ignored, but the PCI memory barrier will still take action as the MMIO filtering will happen after the memory barrier effect.

Would be good to add this info to the commit message.

> 
>>
>>>
>>> This is implemented by memory-mapping a page as uncached that is
>>> backed by MMIO on the dGPU and thus allowing userspace to do memory
>>> write to the page without invoking an IOCTL.
>>> We are selecting the MMIO so that it is not accessible from the PCI
>>> bus so that the MMIO writes themselves are ignored, but the PCI memory
>>> barrier will still take action as the MMIO filtering will happen after
>>> the memory barrier effect.
>>>
>>> When we detect special defined offset in mmap(), We are mapping 4K
>>> page which contains the last of page of doorbell MMIO range to
>>> userspace for same purpose.
>>>
>>> Note: Test coverage for this is added by IGT
>>>         https://patchwork.freedesktop.org/patch/618931/  here.
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Needs some UMD Cc. This was requested by some UMD?
> 
> Yes, I will add someone in cc.
> 
>>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device.c | 68
>> +++++++++++++++++++++++++++++++++-
>>>    1 file changed, 67 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>> b/drivers/gpu/drm/xe/xe_device.c index cd241a8e1838..c97a4d1f0a98
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -239,12 +239,78 @@ static long xe_drm_compat_ioctl(struct file *file,
>> unsigned int cmd, unsigned lo
>>>    #define xe_drm_compat_ioctl NULL
>>>    #endif
>>>
>>> +static void barrier_open(struct vm_area_struct *vma) {
>>> +	drm_dev_get(vma->vm_private_data);
>>> +}
>>> +
>>> +static void barrier_close(struct vm_area_struct *vma) {
>>> +	drm_dev_put(vma->vm_private_data);
>>> +}
>>> +
>>> +static const struct vm_operations_struct vm_ops_barrier = {
>>> +	.open = barrier_open,
>>> +	.close = barrier_close,
>>> +};
>>> +
>>> +static int xe_pci_barrier_mmap(struct file *filp,
>>> +			       struct vm_area_struct *vma) {
>>> +	struct drm_file *priv = filp->private_data;
>>> +	struct drm_device *dev = priv->minor->dev;
>>> +	unsigned long pfn;
>>> +	pgprot_t prot;
>>> +
>>> +	if (vma->vm_end - vma->vm_start > PAGE_SIZE)
>>> +		return -EINVAL;
>>> +
>>> +	if (is_cow_mapping(vma->vm_flags))
>>> +		return -EINVAL;
>>> +
>>> +	if (vma->vm_flags & (VM_READ | VM_EXEC))
>>> +		return -EINVAL;
>>> +
>>> +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
>>> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
>> VM_DONTDUMP | VM_IO);
>>> +
>>> +	prot = vm_get_page_prot(vma->vm_flags); #define
>> LAST_DB_PAGE_OFFSET
>>> +0x7ff001
>>> +	pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
>>> +			LAST_DB_PAGE_OFFSET);
>>> +	if (vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
>>> +				pgprot_noncached(prot)) !=
>> VM_FAULT_NOPAGE)
>>> +		return -EFAULT;
>>> +
>>> +	vma->vm_ops = &vm_ops_barrier;
>>> +	vma->vm_private_data = dev;
>>> +	drm_dev_get(vma->vm_private_data);
>>
>> What is going on here with pci power states? Say device goes into d3hot or
>> d3cold and you touch this mmio, what happens? Do you get pci errors in
>> dmesg? Does rpm need to get involved here? Might be good to have a
>> testcase for this.
> 
> I am not sure here. But we will have follow up IGT patch once basic IGT is merged, where we will try to add test you are suggesting here.

I think we need to understand this. If we need rpm here, then the design 
might need to change, since grabbing rpm for the lifetime of the mmap is 
likely the same as just disabling rpm completely, which is maybe not 
acceptable. Not sure though.

> 
>>
>>> +	return 0;
>>> +}
>>> +
>>> +static int xe_mmap(struct file *filp, struct vm_area_struct *vma) {
>>> +	struct drm_file *priv = filp->private_data;
>>> +	struct drm_device *dev = priv->minor->dev;
>>> +
>>> +	if (drm_dev_is_unplugged(dev))
>>> +		return -ENODEV;
>>
>> With hotunplug I think there is also a special dummy page that gets faulted in
>> if we detect that we are unplugged in the fault handler to avoid sigbus killing
>> stuff (see xe_gem_fault()). Also I guess all mmaps are nuked on unplug so
>> everything gets refaulted. But this doesn't look to use fault handler and just
>> pre-populates it here, so wondering what would happen here?
> 
> Got your point. This might have problem, Do you have any suggestion here?

Not really. But maybe first just try it with an igt and see what 
happens? We can run hotunplug igt for example.

>   
>>
>>> +
>>> +#define XE_PCI_BARRIER_MMAP_OFFSET (0x50 << PAGE_SHIFT)
>>
>> This needs to go in uapi header I think?
> 
> Yes I went though uapi header, did not see any offset there, did not find suitable place. Any suggestion where should this be positioned in uapi header?

It might make sense to have mmap_offest flag instead (as per below), 
then we don't need this.

> 
>>
>>> +	switch (vma->vm_pgoff) {
>>
>> I think pgoff is the fake offset to be able to lookup the bo, so for this to work I
>> think you would need to reserve this page somehow (if we go with this
>> approach), otherwise user can easily end up mmapping a normal bo and get
>> back a fake offset that happens to be this exact special barrier offset and then
>> things go boom.
>>
>> Another idea could be to have mmap_offset called with special flag to
>> indicate this BARRIER thing, and then it returns the magic reserved offset.
>> That way we don't need to hardcode XE_PCI_BARRIER_MMAP_OFFSET in the
>> uapi, and be forever stuck with it.
> 
> Are you saying on different platforms this unused offset might change. For current purpose BMG and PVC both has correct value for this as unused offset.

Why is it an unused offset, also why is it platform specific? The 
vm_pgoff can also contain the fake offset to lookup the BO, so you would 
now need to ensure that the special barrier offset is never used, and so 
doesn't clash with some random BO offset. Maybe I'm missing something 
here...

> 
> But I agree for future compatibility, we can have this handling in KMD itself to detect platform and provide correct unused defined offset to UMD to map. I will take care of this.
> 
> Tejas
>   
>>
>>
>>> +	case XE_PCI_BARRIER_MMAP_OFFSET >> PAGE_SHIFT:
>>> +		return xe_pci_barrier_mmap(filp, vma);
>>> +	}
>>> +
>>> +	return drm_gem_mmap(filp, vma);
>>> +}
>>> +
>>>    static const struct file_operations xe_driver_fops = {
>>>    	.owner = THIS_MODULE,
>>>    	.open = drm_open,
>>>    	.release = drm_release_noglobal,
>>>    	.unlocked_ioctl = xe_drm_ioctl,
>>> -	.mmap = drm_gem_mmap,
>>> +	.mmap = xe_mmap,
>>>    	.poll = drm_poll,
>>>    	.read = drm_read,
>>>    	.compat_ioctl = xe_drm_compat_ioctl,
