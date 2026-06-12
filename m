Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E35CD4F2C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 08:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315E210F337;
	Fri, 12 Jun 2026 08:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="RLXn11e/";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E82C10F337
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781254217;
 bh=i3fcQ3sWq/RnIsGhWCtV/ms6fD1PJ/hhYCp0LaWevXs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RLXn11e/IZGfwkUDQ6JVh+8dX/QfTEM9xPXRrNCjiBOUH/IVS5ciuf8zn+/H+44cO
 6THdvZbkRyGi0AhADWyarJ9ipaF00spSgl2Uag3Swuj1y1GhAGgnIe+h+x2+UE1OO6
 3QyHl89GrbKRIX7sRsPLyy5cfNj7afpI3k7HlWqI75tJMxyfkBk4LRjR0ZJJ24ffGA
 /RkMwDyOIDgTpVrTygChS8MaF2UlddCNpHWrp5vfG7lKBLPxiTUkLfBNQRFd+Uo4Od
 E/Ga9qvM6RbJEYTEnlwsAsfjFG7bAueFGeoWVzpxHv66jBPi6w4xGcEvr40/HrgSyS
 T+9bKyUPXGX6A==
Message-ID: <218b95a4-5f1b-4aa5-9368-99900771a614@lankhorst.se>
Date: Fri, 12 Jun 2026 10:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Levi, Ilia" <ilia.levi@intel.com>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <20260610212833.153366-16-stuart.summers@intel.com>
 <cff1c411-59a6-4b1c-acb5-5c3b8762f628@lankhorst.se>
 <33176777e912d36550455b221bac5f4b355c7819.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <33176777e912d36550455b221bac5f4b355c7819.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

On 6/12/26 00:49, Summers, Stuart wrote:
> On Thu, 2026-06-11 at 12:47 +0200, Maarten Lankhorst wrote:
>> Hello,
>>
>> On 6/10/26 23:28, Stuart Summers wrote:
>>> Introduce XE_MSIX_MAX_VECS (1024) as a software cap on the total
>>> number
>>> of MSI-X vectors the driver will use. We want a way to cap the
>>> number
>>> of vectors separately from the PCIe capability. This way we can
>>> more
>>> easily manage certain system-wide configurations that might differ
>>> from the per-device level configuration.
>>>
>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>> Assisted-by: Copilot:claude-sonnet-4.6
>>> ---
>>>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>>>  drivers/gpu/drm/xe/xe_irq.h | 7 +++++++
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c
>>> b/drivers/gpu/drm/xe/xe_irq.c
>>> index 9e49e2241da4..3429bb305293 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -895,7 +895,7 @@ static int xe_irq_msix_init(struct xe_device
>>> *xe)
>>>                 return nvec;
>>>         }
>>>  
>>> -       xe->irq.msix.nvec = nvec;
>>> +       xe->irq.msix.nvec = min_t(int, nvec, XE_MSIX_MAX_VECS);
>>>         xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
>>>         return 0;
>>>  }
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.h
>>> b/drivers/gpu/drm/xe/xe_irq.h
>>> index a28bd577ba52..5f48249dae8a 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.h
>>> +++ b/drivers/gpu/drm/xe/xe_irq.h
>>> @@ -10,6 +10,13 @@
>>>  
>>>  #define XE_IRQ_DEFAULT_MSIX 1
>>>  
>>> +/*
>>> + * Software cap on the total number of MSI-X vectors the driver
>>> will use.
>>> + * Allows the supported vectors to be managed independent of the
>>> PCI
>>> + * config space report.
>>> + */
>>> +#define XE_MSIX_MAX_VECS 1024
>>> +
>>>  struct xe_device;
>>>  struct xe_tile;
>>>  struct xe_gt;
>> I took a quick look at the PCI docs for the kernel.
>>
>> pci_alloc_irq_vectors will request a minimum of 1024 vectors in this
>> case,
>> but is allowed to allocate more.
>>
>> Although we should set a sensible default using pci_msix_vec_count(),
>> I'm not sure it makes sense to specifically limit them if we can use
>> as many as we like.
>>
>> The return value of pci_alloc_irq_vectors returns the amount of
>> vectors actually available, so this patch clamps the amount available
>> without necessity.
>>
>> What about this instead, and drop configfs?
>>
>> xe->irq.msix.nvec = err = pci_alloc_irq_vectors(pdev,
>> NUM_OF_STATIC_MSIX, pci_msix_vec_count()) ?
>>
>> In this case, we get the maximum amount of vectors available, without
>> requiring any caps or requiring configfs.
>>
>> If MSI-X vectors really provide a speedup, would it be beneficial to
>> use those on the migration queues as well?
> So there are two issues I'm trying to solve with this and the configfs
> patch (mostly the configfs patch).
>
> 1) Our hardware might report a value, but depending on the generation,
> the firmware might limit the amount we can realistically configure for
> various reasons. I realize we don't want to necessarily override the
> PCIe config without reason, but we also want to make sure we aren't
> trying to allocate more than the firmware has set up for us in terms of
> security, etc. We want to catch this kind of thing in software if
> possible rather than allocating vectors that are masked in hardware and
> only find out when the user apps start hanging (because the interrupts
> they expected aren't coming in).
>
> 2) There are use cases like vmware that limit not by the device, but by
> the entire system. Our device and firmware might support something like
> 1024, but we are just one of many devices in the system and in the
> hypervisor we want a way to limit this without having to change the
> BIOS configuration.

Yeah makes sense. Is the firmware here GuC or UEFI?

If our device supports only 1024 then it's safe to have it as limit.

Kind regards,

~Maarten Lankhorst

