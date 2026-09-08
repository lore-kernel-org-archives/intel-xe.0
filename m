Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C605C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 14:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF17D10E0F4;
	Tue,  8 Sep 2026 14:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyAvCyj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9460210E0F4
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788877279; x=1820413279;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mB/XhwkwJLA6+3AyhNOyImgvzOpeqPa3jvKuimpVrcw=;
 b=VyAvCyj67Fb6XxrjX58kHAIGV/615N1qvyzJh/V2Uy2wdyvhXmOWNIj3
 i7QOHoMZj4LVewkII/XqV9fKTPzcanRTd/6qmT1oP/GD6qhXX25LggGgN
 29yt9cuOUs0AQA55f+q8SY1AvW9lZFQvVqvMXnHUTSyDRhib2R/HmGHZs
 K+Ro03oAWXbsTvTjJEHR7BduA36wFT1kbhSgY4HRJNXlLP4CEgZI7VqNL
 k3GM8rkKD3NZ26+TFcLnB6K6Z5kFBbTmAWzWVTaQY17nL5cJBiBz9XyTf
 DPuxtTYn6qIRUKHyJG00aW7p1rZZgZsdTwaVkXRxOysWxK/u022FuLOGE g==;
X-CSE-ConnectionGUID: rpdwVCZJRyeUiSa0+COZFQ==
X-CSE-MsgGUID: p/cTZEBTQDWaVT5VyibyTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99873727"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="99873727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:21:13 -0700
X-CSE-ConnectionGUID: Tkl/mJqISJG5v9+Hs7LlIw==
X-CSE-MsgGUID: RwYKX+fITHWwdhe8UK/6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="266694082"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.158])
 ([10.245.244.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 07:21:12 -0700
Message-ID: <f8ca23eb-193a-4c12-8d5b-be943fa820bc@intel.com>
Date: Tue, 8 Sep 2026 15:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260908134955.1344429-10-matthew.auld@intel.com>
 <20260908134955.1344429-18-matthew.auld@intel.com>
 <20260908140939.CD9811F00A3A@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260908140939.CD9811F00A3A@smtp.kernel.org>
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

On 08/09/2026 15:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The migration of the PCI barrier mmap to use `xe_mmio_gem` removed the `VM_READ` restriction, allowing userspace to map and read from the doorbell register.
> --
> 
> commit 545a53278606e03a94bbfc5ae72975b8ad8c6cae
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe: convert PCI barrier mmap to use xe_mmio_gem
> 
> This commit converts the PCI barrier mmap over to use xe_mmio_gem, simplifying
> the codebase and replacing the hard coded fake offset design. It introduces the
> first user of xe_mmio_gem for mapping the PCIe doorbell register.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
>> -static int xe_pci_barrier_mmap(struct file *filp,
>> -			       struct vm_area_struct *vma)
>> -{
> [ ... ]
>> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
>> -		return -EINVAL;
>> -
>> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> 
> [Severity: High]
> Does removing this VM_READ restriction allow userspace to map the PCIe
> doorbell register with read permissions?
> 
> The original xe_pci_barrier_mmap implementation explicitly restricted mappings
> to write-only by rejecting VM_READ and clearing VM_MAYREAD. By migrating to
> the generic xe_mmio_gem_mmap implementation in xe_mmio_gem.c, this read
> restriction is dropped, as the generic code only restricts VM_EXEC:
> 
> drivers/gpu/drm/xe/xe_mmio_gem.c:xe_mmio_gem_mmap() {
>          if (vma->vm_flags & VM_EXEC)
>                  return -EINVAL;
> 
>          vma->vm_page_prot = pgprot_noncached(vma_get_page_prot(vma));
>          vm_flags_mod(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>                       VM_NORESERVE, VM_MAYEXEC);
> }
> 
> Reading from write-only PCIe doorbell registers can trigger an Unsupported
> Request or PCIe completion timeout, resulting in a Machine Check Exception
> and a full system hang. Because this mapping is accessible to unprivileged
> userspace, could this introduce a denial of service vulnerability?

I think you could anyway do that with write + fault and then do a read 
to get past it. At least on x86 where there is no 
write-only/read-disable bit in the PTE. So no way to actually prevent 
it. Also, for upcoming usecase I want read support for mmio_gem, so 
figured just drop this so I don't have to special case it later.

> 

