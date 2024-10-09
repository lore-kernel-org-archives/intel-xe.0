Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66148CEDD97
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 13:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319A610E725;
	Wed,  9 Oct 2024 13:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eof4tOgb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102F810E725
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728482214; x=1760018214;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=auDS3Ks16xxPHc6YsCa40vi2GmrkI279tPngIvD0gbc=;
 b=eof4tOgbKWM+NFrB8xTUrlWI5P2outbL55YepadTIXVLwyMFnP2cIa1j
 btF2AN+QSRdASvDqZSJ1IfDEiCNOBFJQ3a9I+Hwbgh17yThK9pZ8Lu2vn
 SLusMbOMOqqPRl7Ja3SWBLQ0m2GB8BIAxhrWBcV5S9BDu72AIy33eOkS6
 iiPyjD3T1kT3Icx9jRLnyxba7YoIKmztMNRQ0hwsdbwE/qgtO3IZ8Dx8d
 tGArh6glfJF9YHj+Qz2y5+M9fZW5qJkZbZITGgbMJfpPQEXEpR2uQu2xh
 feevJjS2tQYC7gSLhIF+k8yXeOAzO5ekyJn+1IliHOcmEhQ83gy36Z4Mg w==;
X-CSE-ConnectionGUID: ZNCTDj80QZyzNsScBEHNOg==
X-CSE-MsgGUID: MaFxyLEkTnCUFxZPxAe68A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31483016"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31483016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:56:53 -0700
X-CSE-ConnectionGUID: WhjxwFZ1T5qMuRFW+klihA==
X-CSE-MsgGUID: zj+zASFqRUWhtJTWrIxpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76208047"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.37])
 ([10.245.244.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:56:53 -0700
Message-ID: <c55c17c9-9882-4124-918b-88b951469185@intel.com>
Date: Wed, 9 Oct 2024 14:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241009101004.664216-1-tejas.upadhyay@intel.com>
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

Hi,

On 09/10/2024 11:10, Tejas Upadhyay wrote:
> In order to avoid having userspace to use MI_MEM_FENCE,
> we are adding a mechanism for userspace to generate a
> PCI memory barrier with low overhead (avoiding IOCTL call).

I guess it doesn't work if we just do VRAM write from the host side?

> 
> This is implemented by memory-mapping a page as uncached
> that is backed by MMIO on the dGPU and thus allowing userspace
> to do memory write to the page without invoking an IOCTL.
> We are selecting the MMIO so that it is not accessible from
> the PCI bus so that the MMIO writes themselves are ignored,
> but the PCI memory barrier will still take action as the MMIO
> filtering will happen after the memory barrier effect.
> 
> When we detect special defined offset in mmap(), We are mapping
> 4K page which contains the last of page of doorbell MMIO range
> to userspace for same purpose.
> 
> Note: Test coverage for this is added by IGT
>        https://patchwork.freedesktop.org/patch/618931/  here.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Needs some UMD Cc. This was requested by some UMD?

> ---
>   drivers/gpu/drm/xe/xe_device.c | 68 +++++++++++++++++++++++++++++++++-
>   1 file changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cd241a8e1838..c97a4d1f0a98 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -239,12 +239,78 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>   #define xe_drm_compat_ioctl NULL
>   #endif
>   
> +static void barrier_open(struct vm_area_struct *vma)
> +{
> +	drm_dev_get(vma->vm_private_data);
> +}
> +
> +static void barrier_close(struct vm_area_struct *vma)
> +{
> +	drm_dev_put(vma->vm_private_data);
> +}
> +
> +static const struct vm_operations_struct vm_ops_barrier = {
> +	.open = barrier_open,
> +	.close = barrier_close,
> +};
> +
> +static int xe_pci_barrier_mmap(struct file *filp,
> +			       struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +	unsigned long pfn;
> +	pgprot_t prot;
> +
> +	if (vma->vm_end - vma->vm_start > PAGE_SIZE)
> +		return -EINVAL;
> +
> +	if (is_cow_mapping(vma->vm_flags))
> +		return -EINVAL;
> +
> +	if (vma->vm_flags & (VM_READ | VM_EXEC))
> +		return -EINVAL;
> +
> +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> +
> +	prot = vm_get_page_prot(vma->vm_flags);
> +#define LAST_DB_PAGE_OFFSET 0x7ff001
> +	pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
> +			LAST_DB_PAGE_OFFSET);
> +	if (vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> +				pgprot_noncached(prot)) != VM_FAULT_NOPAGE)
> +		return -EFAULT;
> +
> +	vma->vm_ops = &vm_ops_barrier;
> +	vma->vm_private_data = dev;
> +	drm_dev_get(vma->vm_private_data);

What is going on here with pci power states? Say device goes into d3hot 
or d3cold and you touch this mmio, what happens? Do you get pci errors 
in dmesg? Does rpm need to get involved here? Might be good to have a 
testcase for this.

> +	return 0;
> +}
> +
> +static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;

With hotunplug I think there is also a special dummy page that gets 
faulted in if we detect that we are unplugged in the fault handler to 
avoid sigbus killing stuff (see xe_gem_fault()). Also I guess all mmaps 
are nuked on unplug so everything gets refaulted. But this doesn't look 
to use fault handler and just pre-populates it here, so wondering what 
would happen here?

> +
> +#define XE_PCI_BARRIER_MMAP_OFFSET (0x50 << PAGE_SHIFT)

This needs to go in uapi header I think?

> +	switch (vma->vm_pgoff) {

I think pgoff is the fake offset to be able to lookup the bo, so for 
this to work I think you would need to reserve this page somehow (if we 
go with this approach), otherwise user can easily end up mmapping a 
normal bo and get back a fake offset that happens to be this exact 
special barrier offset and then things go boom.

Another idea could be to have mmap_offset called with special flag to 
indicate this BARRIER thing, and then it returns the magic reserved 
offset. That way we don't need to hardcode XE_PCI_BARRIER_MMAP_OFFSET in 
the uapi, and be forever stuck with it.


> +	case XE_PCI_BARRIER_MMAP_OFFSET >> PAGE_SHIFT:
> +		return xe_pci_barrier_mmap(filp, vma);
> +	}
> +
> +	return drm_gem_mmap(filp, vma);
> +}
> +
>   static const struct file_operations xe_driver_fops = {
>   	.owner = THIS_MODULE,
>   	.open = drm_open,
>   	.release = drm_release_noglobal,
>   	.unlocked_ioctl = xe_drm_ioctl,
> -	.mmap = drm_gem_mmap,
> +	.mmap = xe_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
>   	.compat_ioctl = xe_drm_compat_ioctl,
