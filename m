Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71078C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 15:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB5410E4B2;
	Mon, 24 Jun 2024 15:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBUQz2iJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCF610E4B2
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719242159; x=1750778159;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FDJFZrf04dmyB835BClDM7ra0w3lGUqH98BailwxrW0=;
 b=KBUQz2iJa0U3nHB/lK1mvmzEPFQX4YXG89rgx8CTAbSXiey7wBCWDSQw
 U+JzHWngUJxrtzavgFD1u0sNzW/ZwhXZgSlWMITtteAE2Py1oP0UTSCYQ
 VyjWxog9mWlHeAmA47Vw6SygrHgflMjLWcLRywfUjJYPYBy47Re4LUk3k
 f6armRb6h1IDr97sbl9yT1A7h0vbWSREm79FCaITEmBOPGBGKnc6J8Wu1
 HolAtVjrYMfS7O2p3LiUowLAeHbYJNHc2YMkWfcQwS1/MWO6oNDSTxRFl
 sIswnrRcUppoqjln9G92EZrovSoKxC9TE2Rq9HgBmpCJOy+3OKuiY7zGK g==;
X-CSE-ConnectionGUID: rqepZqNBSWS9c6zQlppmPA==
X-CSE-MsgGUID: W6/fy3/5QbmA0ICNdxBT9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16347540"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16347540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:15:59 -0700
X-CSE-ConnectionGUID: oJgccWXpSaOQE5UtL5BfkQ==
X-CSE-MsgGUID: pda7nX9URAO3YDYR6dGHDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="47777921"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 24 Jun 2024 08:15:57 -0700
Received: from [10.246.19.248] (unknown [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6A5B527BC6;
 Mon, 24 Jun 2024 16:15:55 +0100 (IST)
Message-ID: <64b8cb47-ba34-4eca-96d9-4d038756ef11@intel.com>
Date: Mon, 24 Jun 2024 17:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Track writes to inaccessible registers from VF
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20240624114526.1125-1-michal.wajdeczko@intel.com>
 <171924129379.2361.8455638058654111043@gjsousa-mobl2>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171924129379.2361.8455638058654111043@gjsousa-mobl2>
Content-Type: text/plain; charset=UTF-8
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



On 24.06.2024 17:01, Gustavo Sousa wrote:
> Quoting Michal Wajdeczko (2024-06-24 08:45:26-03:00)
>> Only limited set of registers is accessible for the VF driver.
>> The hardware will silently drop writes to inaccessible registers,
>> but to improve our driver lets track all such unexpected writes
>> on debug builds.
>>
>> We will explicitly ignore writes to SOFTWARE_FLAGS_SPR33 since it
> 
> Drive-by comment: I might be missing something, but it looks like the
> new code would actually try to do the write as PF instead of ignoring
> it?

true, VF will try to write anyway, as it's not 'unexpected' anymore, but
rather part of the wmb flow,

and yes, this comment might be unclear, likely I should say:

  "We will explicitly _allow bad_ writes to SOFTWARE_FLAGS_SPR33"

as we just want to ignore the WARN but keep the write

> 
> --
> Gustavo Sousa
> 
>> is used by the driver just to mimic wmb and we do not have any
>> similar unused scratch register accessible from the VF.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 22 ++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>> drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
>> 3 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 41e46a00c01e..36cefe3161e1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -892,6 +892,28 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>>         return rr->value;
>> }
>>
>> +/**
>> + * xe_gt_sriov_vf_write32 - Track writes to an inaccessible registers.
>> + * @gt: the &xe_gt
>> + * @reg: the register to write
>> + * @val: value to write
>> + *
>> + * This function is for VF use only.
>> + * This function is dedicated for registers that VFs can't write directly.
>> + * It will trigger a WARN if running on debug build.
>> + */
>> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>> +{
>> +        u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>> +
>> +        xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +        xe_gt_assert(gt, !reg.vf);
>> +
>> +        xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>> +                   "VF is trying to write %#x to an inaccessible register %#x+%#x\n",
>> +                   val, reg.addr, addr - reg.addr);
>> +}
>> +
>> /**
>>  * xe_gt_sriov_vf_print_config - Print VF self config.
>>  * @gt: the &xe_gt
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 0de7f8cbcfa6..e541ce57bec2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>> u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>> u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>> u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>
>> void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>> void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index f92faad4b96d..ff72afd79272 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -151,7 +151,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>>         u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>>
>>         trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>> -        writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>> +
>> +        if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)) && reg.addr != SOFTWARE_FLAGS_SPR33.addr)
>> +                xe_gt_sriov_vf_write32(gt, reg, val);
>> +        else
>> +                writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>> }
>>
>> u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> -- 
>> 2.43.0
>>
