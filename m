Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDBFD2A52C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 15:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A54E10E050;
	Wed, 16 Oct 2024 15:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYJXDla+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7720F10E050
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729094084; x=1760630084;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BSAgi0aI5Yc7fr3cC0RXUCTpJWUxoggu2eM5dGTNODU=;
 b=VYJXDla+PHtqjbp1BBglvzHlJYmIG/vp54slsKgeIFVJjb7xpRTzI+aN
 a+HzQdqUgIKlJV0WlZhnJdUQpBAso0wQfpekuLA65b0oWKUhqiMppOqsV
 5wlrnJkHK+zNzyY1cI3eHupd56B64N7jHIMb1HNPLehsVpc/P1Dbhq8Ow
 UjZJQzxRGftZnOVn81OWFBlv2Fr8+63LE9dViWOsqjuyqj6IAlVMOSzK+
 outQUJADSYk6BB5aSMvEECQHsqMPQ0c34Y4vjLQC7FLoUC0oXWKPOKOPr
 abMjHnJMVKTgvRlEWX3qf1C84yfxJmF7g6s7lwNXaKkHuNacYOHQQ1u6z A==;
X-CSE-ConnectionGUID: xJM6UH9uR+6afkUgHEMsFw==
X-CSE-MsgGUID: I4whVSdCRZy+Wzs/ys1RVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39918355"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39918355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 08:54:43 -0700
X-CSE-ConnectionGUID: 6ILTukKBTm6bBJ4mmV16bQ==
X-CSE-MsgGUID: YM6+ettgQROexXpAov/dyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78283418"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 08:54:42 -0700
Message-ID: <041b4973-5453-4897-9969-fcbc6f57b826@intel.com>
Date: Wed, 16 Oct 2024 16:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
 <c55c17c9-9882-4124-918b-88b951469185@intel.com>
 <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <e8f4f5fd-d7a1-4ca9-8a62-543d10c32a15@intel.com>
 <DS7PR11MB6197DD082F407482D23E655281442@DS7PR11MB6197.namprd11.prod.outlook.com>
 <936a6826-cf97-4d77-8175-16b37f422f47@intel.com>
 <SJ1PR11MB62045186FCE678E792358F2E81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SJ1PR11MB62045186FCE678E792358F2E81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
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

On 16/10/2024 16:13, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Monday, October 14, 2024 7:23 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory
>> barrier
>>
>> On 14/10/2024 14:08, Upadhyay, Tejas wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: Monday, October 14, 2024 4:34 PM
>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory
>>>> barrier
>>>>
>>>> On 14/10/2024 11:23, Upadhyay, Tejas wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>>>> Sent: Wednesday, October 9, 2024 7:27 PM
>>>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>>>> xe@lists.freedesktop.org
>>>>>> Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory
>>>>>> barrier
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 09/10/2024 11:10, Tejas Upadhyay wrote:
>>>>>>> In order to avoid having userspace to use MI_MEM_FENCE, we are
>>>>>>> adding a mechanism for userspace to generate a PCI memory barrier
>>>>>>> with low overhead (avoiding IOCTL call).
>>>>>>
>>>>>> I guess it doesn't work if we just do VRAM write from the host side?
>>>>>
>>>>> Writing to VRAM will adds some overhead which UMD wants to avoid. So
>>>> the suggestion came out was to use special MMIO page mapped directly
>>>> which is not accessible from the PCI bus so that the MMIO writes
>>>> themselves are ignored, but the PCI memory barrier will still take
>>>> action as the MMIO filtering will happen after the memory barrier effect.
>>>>
>>>> Would be good to add this info to the commit message.
>>>
>>> Ok.
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> This is implemented by memory-mapping a page as uncached that is
>>>>>>> backed by MMIO on the dGPU and thus allowing userspace to do
>>>> memory
>>>>>>> write to the page without invoking an IOCTL.
>>>>>>> We are selecting the MMIO so that it is not accessible from the
>>>>>>> PCI bus so that the MMIO writes themselves are ignored, but the
>>>>>>> PCI memory barrier will still take action as the MMIO filtering
>>>>>>> will happen after the memory barrier effect.
>>>>>>>
>>>>>>> When we detect special defined offset in mmap(), We are mapping 4K
>>>>>>> page which contains the last of page of doorbell MMIO range to
>>>>>>> userspace for same purpose.
>>>>>>>
>>>>>>> Note: Test coverage for this is added by IGT
>>>>>>>           https://patchwork.freedesktop.org/patch/618931/  here.
>>>>>>>
>>>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>>>
>>>>>> Needs some UMD Cc. This was requested by some UMD?
>>>>>
>>>>> Yes, I will add someone in cc.
>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/xe/xe_device.c | 68
>>>>>> +++++++++++++++++++++++++++++++++-
>>>>>>>      1 file changed, 67 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>>>>> b/drivers/gpu/drm/xe/xe_device.c index cd241a8e1838..c97a4d1f0a98
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>>> @@ -239,12 +239,78 @@ static long xe_drm_compat_ioctl(struct file
>>>>>>> *file,
>>>>>> unsigned int cmd, unsigned lo
>>>>>>>      #define xe_drm_compat_ioctl NULL
>>>>>>>      #endif
>>>>>>>
>>>>>>> +static void barrier_open(struct vm_area_struct *vma) {
>>>>>>> +	drm_dev_get(vma->vm_private_data);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void barrier_close(struct vm_area_struct *vma) {
>>>>>>> +	drm_dev_put(vma->vm_private_data);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct vm_operations_struct vm_ops_barrier = {
>>>>>>> +	.open = barrier_open,
>>>>>>> +	.close = barrier_close,
>>>>>>> +};
>>>>>>> +
>>>>>>> +static int xe_pci_barrier_mmap(struct file *filp,
>>>>>>> +			       struct vm_area_struct *vma) {
>>>>>>> +	struct drm_file *priv = filp->private_data;
>>>>>>> +	struct drm_device *dev = priv->minor->dev;
>>>>>>> +	unsigned long pfn;
>>>>>>> +	pgprot_t prot;
>>>>>>> +
>>>>>>> +	if (vma->vm_end - vma->vm_start > PAGE_SIZE)
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	if (is_cow_mapping(vma->vm_flags))
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	if (vma->vm_flags & (VM_READ | VM_EXEC))
>>>>>>> +		return -EINVAL;
>>>>>>> +
>>>>>>> +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
>>>>>>> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
>>>>>> VM_DONTDUMP | VM_IO);
>>>>>>> +
>>>>>>> +	prot = vm_get_page_prot(vma->vm_flags); #define
>>>>>> LAST_DB_PAGE_OFFSET
>>>>>>> +0x7ff001
>>>>>>> +	pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0)
>> +
>>>>>>> +			LAST_DB_PAGE_OFFSET);
>>>>>>> +	if (vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
>>>>>>> +				pgprot_noncached(prot)) !=
>>>>>> VM_FAULT_NOPAGE)
>>>>>>> +		return -EFAULT;
>>>>>>> +
>>>>>>> +	vma->vm_ops = &vm_ops_barrier;
>>>>>>> +	vma->vm_private_data = dev;
>>>>>>> +	drm_dev_get(vma->vm_private_data);
>>>>>>
>>>>>> What is going on here with pci power states? Say device goes into
>>>>>> d3hot or d3cold and you touch this mmio, what happens? Do you get
>>>>>> pci errors in dmesg? Does rpm need to get involved here? Might be
>>>>>> good to have a testcase for this.
>>>>>
>>>>> I am not sure here. But we will have follow up IGT patch once basic
>>>>> IGT is
>>>> merged, where we will try to add test you are suggesting here.
>>>>
>>>> I think we need to understand this. If we need rpm here, then the
>>>> design might need to change, since grabbing rpm for the lifetime of
>>>> the mmap is likely the same as just disabling rpm completely, which
>>>> is maybe not acceptable. Not sure though.
>>>
>>> we don't need rpm here as the membarrier is to generate a side-effect
>>> on the GT to serialise any memory traffic across the PCI bus; if the
>>> device is asleep, there is no memory traffic across the bus, thus the
>>> requirement is satisfied
>>
>> Ok, but would be good to confirm that. At least for stuff like pci access with
>> LMEMBAR, IIRC device must be in d0 or you can get pci errors, even if writes
>> are ignored.
> 
> Tried d3hot with this test,
> 
>          ptr = mmap(NULL, size, prot, flags, device.fd_xe, offset);
>          igt_assert(ptr != MAP_FAILED);
> 
>          sleep(1);
>          igt_assert(in_d3(device, d_state));
>          /* Check whole page for any errors, also check as
>           * we should not read written values back
>           */
>          for (int i = 0; i < size / sizeof(*ptr); i++) {
>                  /* It is expected unconfigured doorbell space
>                   * will return read value 0xdeadbeef
>                   */
>                  igt_assert_eq_u32(READ_ONCE(ptr[i]), 0xdeadbeef);
> 
>                  igt_gettime(&tv);
>                  ptr[i] = i;
>                  if (READ_ONCE(ptr[i]) == i) {
>                          while (READ_ONCE(ptr[i]) == i)
>                                  ;
>                          igt_info("fd:%d value retained for %"PRId64"ns pos:%d\n",
>                                   device.fd_xe, igt_nsec_elapsed(&tv), i);
>                  }
>                  igt_assert_neq(READ_ONCE(ptr[i]), i);
>          }
> 
> I am putting device in D3 and then reading, I am able to read back mappings.

Ok, cool. And dmesg is also clean? I guess would be good to try with 
d3cold. If we can turn the above into an igt, there should be something 
in CI that is d3cold capable to check this.

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int xe_mmap(struct file *filp, struct vm_area_struct *vma) {
>>>>>>> +	struct drm_file *priv = filp->private_data;
>>>>>>> +	struct drm_device *dev = priv->minor->dev;
>>>>>>> +
>>>>>>> +	if (drm_dev_is_unplugged(dev))
>>>>>>> +		return -ENODEV;
>>>>>>
>>>>>> With hotunplug I think there is also a special dummy page that gets
>>>>>> faulted
>>>> in
>>>>>> if we detect that we are unplugged in the fault handler to avoid
>>>>>> sigbus
>>>> killing
>>>>>> stuff (see xe_gem_fault()). Also I guess all mmaps are nuked on
>>>>>> unplug so everything gets refaulted. But this doesn't look to use
>>>>>> fault handler and
>>>> just
>>>>>> pre-populates it here, so wondering what would happen here?
>>>>>
>>>>> Got your point. This might have problem, Do you have any suggestion
>> here?
>>>>
>>>> Not really. But maybe first just try it with an igt and see what
>>>> happens? We can run hotunplug igt for example.
>>>
>>> If unplug happens then it's a new device at that point and the client needs
>> to reload, so I think we don’t need to take care this.
>>
>> At least for normal bo mmap stuff you usually don't want to crash the
>> app/umd, hence why a lot of effort is spent trying to avoid returning SIGBUS
>> by instead mapping a dummy page if we detect device was detached in the
>> fault handler. The user will need to get a new driver fd (assuming device
>> comes back), but user should be able to gracefully detect the unplug instead
>> of crashing (all iocts will return an error for example).
>>
>> When you do the unplug the driver instance stays alive, even after pci remove
>> callback is called, where that driver instance is detached from the pci device
>> underneath. If user is accessing the barrier ptr when this happens does it
>> crash? Would be good to check that.
> 
> Created fault handler and did remapping and I see test is passing post unplug also.

You remapped it to the dummy page? Yeah, that should do the trick, I think.

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +#define XE_PCI_BARRIER_MMAP_OFFSET (0x50 << PAGE_SHIFT)
>>>>>>
>>>>>> This needs to go in uapi header I think?
>>>>>
>>>>> Yes I went though uapi header, did not see any offset there, did not find
>>>> suitable place. Any suggestion where should this be positioned in uapi
>>>> header?
>>>>
>>>> It might make sense to have mmap_offest flag instead (as per below),
>>>> then we don't need this.
>>>>
>>>>>
>>>>>>
>>>>>>> +	switch (vma->vm_pgoff) {
>>>>>>
>>>>>> I think pgoff is the fake offset to be able to lookup the bo, so for this to
>>>> work I
>>>>>> think you would need to reserve this page somehow (if we go with this
>>>>>> approach), otherwise user can easily end up mmapping a normal bo
>> and
>>>> get
>>>>>> back a fake offset that happens to be this exact special barrier offset and
>>>> then
>>>>>> things go boom.
>>>>>>
>>>>>> Another idea could be to have mmap_offset called with special flag to
>>>>>> indicate this BARRIER thing, and then it returns the magic reserved
>> offset.
>>>>>> That way we don't need to hardcode XE_PCI_BARRIER_MMAP_OFFSET
>> in
>>>> the
>>>>>> uapi, and be forever stuck with it.
>>>>>
>>>>> Are you saying on different platforms this unused offset might change.
>> For
>>>> current purpose BMG and PVC both has correct value for this as unused
>>>> offset.
>>>>
>>>> Why is it an unused offset, also why is it platform specific? The
>>>> vm_pgoff can also contain the fake offset to lookup the BO, so you would
>>>> now need to ensure that the special barrier offset is never used, and so
>>>> doesn't clash with some random BO offset. Maybe I'm missing something
>>>> here...
>>>
>>> Oh now I recall, for vm_pgoff, there is some offset added, which is leaving
>> anything below that offset untouched. We selected vm_pgoff to be used from
>> that area.
>>
>> Ah, you mean DRM_FILE_PAGE_OFFSET_START? It does feel a bit scary to
>> rely on that internal behaviour and then bake it into the uapi forever.
>> So far I assume drivers are not really depending on that behaviour so
>> that could change in the future.
> 
> Are you insisting this change now or we leave it for future?

IMO we should at least consider not hard coding the offset in the uapi, 
but maybe just return it from mmap_offset when passing a special flag, 
with no hard guarentee that the offset can't change if kmd so chooses? 
What do you think?

Also if we want to keep the magic 0x50 instead of allocating an actual 
offset it might be good to add a build check against 
DRM_FILE_PAGE_OFFSET_START somewhere?

> 
> Tejas
>>
>>>
>>> Tejas
>>>
>>>>
>>>>>
>>>>> But I agree for future compatibility, we can have this handling in KMD
>> itself
>>>> to detect platform and provide correct unused defined offset to UMD to
>> map.
>>>> I will take care of this.
>>>>>
>>>>> Tejas
>>>>>
>>>>>>
>>>>>>
>>>>>>> +	case XE_PCI_BARRIER_MMAP_OFFSET >> PAGE_SHIFT:
>>>>>>> +		return xe_pci_barrier_mmap(filp, vma);
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	return drm_gem_mmap(filp, vma);
>>>>>>> +}
>>>>>>> +
>>>>>>>      static const struct file_operations xe_driver_fops = {
>>>>>>>      	.owner = THIS_MODULE,
>>>>>>>      	.open = drm_open,
>>>>>>>      	.release = drm_release_noglobal,
>>>>>>>      	.unlocked_ioctl = xe_drm_ioctl,
>>>>>>> -	.mmap = drm_gem_mmap,
>>>>>>> +	.mmap = xe_mmap,
>>>>>>>      	.poll = drm_poll,
>>>>>>>      	.read = drm_read,
>>>>>>>      	.compat_ioctl = xe_drm_compat_ioctl,
