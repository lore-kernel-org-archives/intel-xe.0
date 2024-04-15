Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B3DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659871122CF;
	Mon, 15 Apr 2024 08:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEKcL4ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC41122F5
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 08:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713168898; x=1744704898;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OsCkvd3baQAYLBBfAZfhEH6wqUgwbl+rTATF1M5XPJA=;
 b=jEKcL4tiWk0MFYRnBbwnRYhtTeJIZWh2x7Kyd0fe6Gf+ElogYkCfpEmw
 DbdaHy0z3Uj9T+huLcdmRUq5oVBo4sqy2VXkPpy/w6AXYZjGTwOnS+/55
 dXgUpsT7diy7OfxUf8mCAu6vkNnkkjfrtOmmAbuux73ekfKBL8ssxXeic
 R4KVSDVa4HLMpwLkA+e6Z9epbMy/Vz9uZv9YW4blfhdsXNrmEysWmWNLR
 440LWAc8tZeM3yresd/DXgB2+B9nUnN3PAsJpMwBaRo5oVt4navlqpKSa
 gZ+jLO8JuCuzUrOuxqmV6ErnyvqbvAOr8lhixrX4GGXryyHXqwqCEPmcw w==;
X-CSE-ConnectionGUID: hW1Jt5GUT1Go86AUZ7oP2g==
X-CSE-MsgGUID: N/zXAeCjQdqMofdonjKN1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8764923"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8764923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:14:49 -0700
X-CSE-ConnectionGUID: jEh3SLPpRt6HO7GflcZJSg==
X-CSE-MsgGUID: fQT8bIZJRLyzaEFsIpEXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21937799"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2024 01:14:47 -0700
Received: from [10.252.44.99] (mwajdecz-MOBL.ger.corp.intel.com [10.252.44.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 523C1332C6;
 Mon, 15 Apr 2024 09:14:37 +0100 (IST)
Message-ID: <641307dc-9f35-4da1-a4d7-6eaa18b47188@intel.com>
Date: Mon, 15 Apr 2024 10:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe/pf: Add SR-IOV PF specific early GT
 initialization
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-6-michal.wajdeczko@intel.com>
 <3688efbc-df20-439c-8b53-7e4ae9f1b81c@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3688efbc-df20-439c-8b53-7e4ae9f1b81c@intel.com>
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



On 15.04.2024 07:19, Ghimiray, Himal Prasad wrote:
> 
> On 15-04-2024 00:31, Michal Wajdeczko wrote:
>> The PF driver must maintain additional GT level data per each VF.
>> This additional per-VF data will be added in upcoming patches and
>> will include: provisioning configuration (like GGTT space or LMEM
>> allocation sizes or scheduling parameters), monitoring thresholds
>> and counters, and more.
>>
>> As number of supported VFs varies across platforms use flexible
>> array where first entry will contain metadata for the PF itself
>> (if such configuration parameter is applicable for the PF) and
>> all remaining entries will contain data for potential VFs.
>>
>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |  1 +
>>   drivers/gpu/drm/xe/xe_gt.c                |  7 +++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 52 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.h       | 20 +++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  9 ++++
>>   5 files changed, 89 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index c46d145606f6..daa5865a2773 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -160,6 +160,7 @@ xe-y += \
>>       xe_sriov.o
>>     xe-$(CONFIG_PCI_IOV) += \
>> +    xe_gt_sriov_pf.o \
>>       xe_gt_sriov_pf_control.o \
>>       xe_gt_sriov_pf_policy.o \
>>       xe_lmtt.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index cfa5da900461..38956b60e084 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -29,6 +29,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_gt_sriov_pf.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_gt_topology.h"
>> @@ -311,6 +312,12 @@ int xe_gt_init_early(struct xe_gt *gt)
>>   {
>>       int err;
>>   +    if (IS_SRIOV_PF(gt_to_xe(gt))) {
>> +        err = xe_gt_sriov_pf_init_early(gt);
>> +        if (err)
>> +            return err;
>> +    }
>> +
>>       err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> new file mode 100644
>> index 000000000000..791dcdd767e2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -0,0 +1,52 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_gt_sriov_pf.h"
>> +#include "xe_gt_sriov_pf_helpers.h"
>> +
>> +/*
>> + * VF's metadata is maintained in the flexible array where:
>> + *   - entry [0] contains metadata for the PF (only if applicable),
>> + *   - entries [1..n] contain metadata for VF1..VFn::
>> + *
>> + *       <--------------------------- 1 + total_vfs ----------->
>> + *      +-------+-------+-------+-----------------------+-------+
>> + *      |   0   |   1   |   2   |                       |   n   |
>> + *      +-------+-------+-------+-----------------------+-------+
>> + *      |  PF   |  VF1  |  VF2  |      ...     ...      |  VFn  |
>> + *      +-------+-------+-------+-----------------------+-------+
>> + */
>> +static int pf_alloc_metadata(struct xe_gt *gt)
>> +{
>> +    unsigned int num_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
>> +
>> +    gt->sriov.pf.vfs = drmm_kcalloc(&gt_to_xe(gt)->drm, 1 + num_vfs,
>> +                    sizeof(*gt->sriov.pf.vfs), GFP_KERNEL);
>> +    if (!gt->sriov.pf.vfs)
>> +        return -ENOMEM;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
>> + * @gt: the &xe_gt to initialize
>> + *
>> + * Early initialization of the PF data.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>> +{
>> +    int err;
>> +
>> +    err = pf_alloc_metadata(gt);
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
> 
> nit: If there's a possibility of extending this function in the future
> to accommodate other initializations, it's best to leave it as it is.

that's correct, at least one more sub-component (PF services) will be
initialized here in the very near future

> Otherwise, return pf_alloc_metadata(gt) looks cleaner.
> 
> LGTM
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

thanks!

> 
> 
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> new file mode 100644
>> index 000000000000..05142ffc4319
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_SRIOV_PF_H_
>> +#define _XE_GT_SRIOV_PF_H_
>> +
>> +struct xe_gt;
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>> +#else
>> +static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>> +{
>> +    return 0;
>> +}
>> +#endif
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> index 768277b8bc95..223f280ef748 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>> @@ -10,12 +10,21 @@
>>     #include "xe_gt_sriov_pf_policy_types.h"
>>   +/**
>> + * struct xe_gt_sriov_metadata - GT level per-VF metadata.
>> + */
>> +struct xe_gt_sriov_metadata {
>> +    /* XXX: VF metadata will go here */
>> +};
>> +
>>   /**
>>    * struct xe_gt_sriov_pf - GT level PF virtualization data.
>>    * @policy: policy data.
>> + * @vfs: metadata for all VFs.
>>    */
>>   struct xe_gt_sriov_pf {
>>       struct xe_gt_sriov_pf_policy policy;
>> +    struct xe_gt_sriov_metadata *vfs;
>>   };
>>     #endif
