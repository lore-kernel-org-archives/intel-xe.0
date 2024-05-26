Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA6C25B7A
	for <intel-xe@archiver.kernel.org>; Sun, 26 May 2024 16:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4F10ED4D;
	Sun, 26 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuYDPmnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C05710E5FB
 for <intel-xe@lists.freedesktop.org>; Sun, 26 May 2024 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716740026; x=1748276026;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HJSwSHQBLnseJMpZRE6i8aaBjpLq0DapP2QgMGR9oq0=;
 b=IuYDPmnROcMYmDkVXFTkvUCLcZ/ur33YHXssxxCP9AxViwdE1aGBe/iD
 it0lhcbI1SkvlfajwMjWtwGG4+In/S1XNgP6Awl8WHCwHFowFB2tFc0Mi
 1KLpFeexDJJt/fY+fA7OenKRPZsJ7f0tcQaCsMPF0cD9c8cqG5gJkrCB7
 3YArYL9MfDKhNVrSfu8uiI1BgPM2HHyapm5ytBczqjZTBH0XnaBY9IwZN
 YgZ21UXl6cqWeghNJtVO97bb7BoBPYx5aVqLcGul0QdcGyQEw3xPZLgYR
 tJJRs4KmqOlH7jFiQsOjWFJO7kWpDIMTei87n+v9dIdmOxlXJDUCXljPE Q==;
X-CSE-ConnectionGUID: x797cUkNSnyWAMVavo5MCw==
X-CSE-MsgGUID: tC7dBQzaRy66m0yxwIMCIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13178265"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; d="scan'208";a="13178265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 09:13:45 -0700
X-CSE-ConnectionGUID: M/9vmOAoS02nCna9QlB6/A==
X-CSE-MsgGUID: Rg0ReQikR8m07Z1y97NxwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; d="scan'208";a="65747336"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 26 May 2024 09:13:42 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1810B3683B;
 Sun, 26 May 2024 17:13:41 +0100 (IST)
Message-ID: <1ae42521-4204-431c-b7f8-bedc63e7d104@intel.com>
Date: Sun, 26 May 2024 18:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add device CXL capabilities identification
To: Farah Kassabri <fkassabri@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Kassabri, Farah" <farah.kassabri@intel.com>
References: <20240526082405.658908-1-fkassabri@habana.ai>
 <af704f09-d34b-443a-be00-4764720ec743@intel.com>
 <95df096c-58b3-48d4-9055-eb89baaed2d4@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <95df096c-58b3-48d4-9055-eb89baaed2d4@habana.ai>
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



On 26.05.2024 15:10, Farah Kassabri wrote:
> On 5/26/2024 13:32, Michal Wajdeczko wrote:
>> [You don't often get email from michal.wajdeczko@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hi Farah,
>>
>> On 26.05.2024 10:24, Farah Kassabri wrote:
>>> As future Intel GPUs will use CXL interface with the host
>>> servers, this patch will add check if the xe device has CXL
>>> capabilities or not, by reading the PCIe standard DVSEC register
>>> and identify the CXL vendor id.
>>>
>>> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile          |  3 ++-
>>>   drivers/gpu/drm/xe/xe_cxl.c          | 33 ++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_cxl.h          | 14 ++++++++++++
>>>   drivers/gpu/drm/xe/xe_device.c       |  5 +++++
>>>   drivers/gpu/drm/xe/xe_device_types.h | 10 +++++++++
>>>   5 files changed, 64 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_cxl.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_cxl.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index c9f067b8f54d..faf40ff3c62e 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -146,7 +146,8 @@ xe-y += xe_bb.o \
>>>        xe_vram_freq.o \
>>>        xe_wait_user_fence.o \
>>>        xe_wa.o \
>>> -     xe_wopcm.o
>>> +     xe_wopcm.o \
>>> +     xe_cxl.o \
>>
>> please keep .o list sorted alphabetically
>>
>>>
>>>   xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_cxl.c b/drivers/gpu/drm/xe/xe_cxl.c
>>> new file mode 100644
>>> index 000000000000..da47a79ee2c2
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_cxl.c
>>> @@ -0,0 +1,33 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_cxl.h"
>>> +
>>> +int xe_init_cxl_capabilities(struct xe_device *xe, struct pci_dev *pdev)
>>
>> please add kernel-doc for any new public function
>>
>> and as this function is defined in xe_cxl.* then use "xe_cxl_" prefix
>>
>> hmm, do you really need to explicitly pass the pdev as parameter ?
>> isn't it already setup and available as to_pci_dev(xe->drm.dev) ?
>>
>>> +{
>>> +     int cxl_dvsec, rc;
>>
>> pci_find_dvsec_capability() as defined as returning u16, so maybe
>> cxl_dvsec can be u16 too ?
>>
>>> +     u16 ctrl;
>>> +
>>> +     cxl_dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL, CXL_DVSEC_PCIE_DEVICE);
>>> +     if (cxl_dvsec) {
>>
>> I guess the BKM is to do an early return if conditions are not met
>>
>>          if (!cxl_dvsec)
>>                  return 0;
>>
>>          ...
>>          return 0;
>>
>>> +             xe->info.has_cxl_cap = true;
>>> +             xe->cxl.dvsec = cxl_dvsec;
>>> +
>>> +             rc = pci_read_config_word(pdev, cxl_dvsec + CXL_DVSEC_CTRL_OFFSET, &ctrl);
>>> +             if (rc < 0) {
>>> +                     drm_err(&xe->drm, "Failed to read dvsec ctrl register\n");
>>
>> shouldn't we use "DVSEC" in any user facing messages ?
>> also maybe printing value of the rc would be good hint for diagnostics ?
>>
>>> +                     return rc;
>>> +             }
>>> +
>>> +             if (ctrl & CXL_DVSEC_MEM_ENABLE)
>>> +                     xe->cxl.type = (ctrl & BIT(0)) ? 2 : 3;
>>> +             else
>>> +                     xe->cxl.type = 1;
>>
>> shouldn't we have some defines for these types, or the plan is to always
>> use plain numbers everywhere ?
>>
>>> +
>>> +             drm_dbg(&xe->drm, "The device has CXL capability, type %u\n", xe->cxl.type);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_cxl.h b/drivers/gpu/drm/xe/xe_cxl.h
>>> new file mode 100644
>>> index 000000000000..971c6e9adc2f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_cxl.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_CXL_H_
>>> +#define _XE_CXL_H_
>>> +
>>> +#include "xe_device.h"
>>> +#include "../drivers/cxl/cxlpci.h"
>>
>> you don't need to include these headers here,
>> just add forward declaration:
>>
>> struct xe_device;
> 
> I need the includes cannot just forward declaration.
> for example: PCI_DVSEC_VENDOR_ID_CXL and other defines exist in cxlpci.h
> to_pci_dev needs the xe_device.h also the drm_dbg/err ....
> As to all other comments agreed and fixed.

you surely will need those includes in .c file to implement your
functionality, but not in .h file, used by other compilation units,
where forward declarations should be sufficient

> 
> BR,
> Farah
>>
>>> +
>>> +int xe_init_cxl_capabilities(struct xe_device *xe, struct pci_dev *pdev);
>>> +
>>> +#endif /* _XE_CXL_H_ */
>>
>> it was decided to not use include guard name in closing #endif
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 5acf2c92789f..ca2e47a47b11 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -50,6 +50,7 @@
>>>   #include "xe_ttm_sys_mgr.h"
>>>   #include "xe_vm.h"
>>>   #include "xe_wait_user_fence.h"
>>> +#include "xe_cxl.h"
>>>
>>>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>>   {
>>> @@ -312,6 +313,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>>        if (WARN_ON(err))
>>>                goto err;
>>>
>>> +     err = xe_init_cxl_capabilities(xe, pdev);
>>> +     if (err)
>>> +             goto err;
>>> +
>>>        return xe;
>>>
>>>   err:
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index bc97990fd032..aad56b829ca4 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -285,6 +285,8 @@ struct xe_device {
>>>                u8 has_atomic_enable_pte_bit:1;
>>>                /** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>>>                u8 has_device_atomics_on_smem:1;
>>> +             /** @info.has_cxl_cap: device has CXL capabilities */
>>> +             u8 has_cxl_cap:1;
>>>
>>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>                struct {
>>> @@ -321,6 +323,14 @@ struct xe_device {
>>>                struct ttm_resource_manager sys_mgr;
>>>        } mem;
>>>
>>> +     /** @cxl: cxl info for device */
>>> +     struct {
>>> +             /** @cxl.dvsec: offset to device DVSEC */
>>> +             int dvsec;
>>
>> do you need full 'int' here or maybe 'u16' is sufficient ?
>>
>>> +             /** @cxl.type: cxl device type */
>>
>> shouldn't we use "CXL" in documentation ?
>>
>>> +             int type;
>>
>> u16 ?
>>
>>> +     } cxl;
>>> +
>>>        /** @sriov: device level virtualization data */
>>>        struct {
>>>                /** @sriov.__mode: SR-IOV mode (Don't access directly!) */
> 
