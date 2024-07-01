Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE0C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 16:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95EF10E47C;
	Mon,  1 Jul 2024 16:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNtk01lT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09110E481
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719850986; x=1751386986;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2UKi8IYJXgiKNK/IgZIx4nzuxxMldahEHyLopv2734g=;
 b=JNtk01lT3cEh8TaVmsSIIzPHepzZrrzBiq6emeDXeeMjRAlcQmPV7oGK
 vL6BZDxw3MqMfBnbTCMOMtzMBHioB8bA33+ZUv2Kz1SIhNMu3ZB36J5Rn
 s2Tgm2XoD3/AnS6yj1Q54ROuRzNz7PXPQrZwpiyxhxQ3Y62YwzsQ9eLiU
 2VJInAxaP52iUYSXemBxllkG9rSyq2vi9GeJraVOoSBvZFkx0hD6Bt/Xt
 c+oO3sNBHZaDQgaWzZVryIH6xrIjBJdagRJn8XC3dkpaRp1d4BoPPVbJ3
 x4U8QNg4hxfSRN6a03CESKrmKXtd3z2N+yBtzxtUMJTDzyV+RNt+qvza+ Q==;
X-CSE-ConnectionGUID: J5fqFw8WTzqSC+HH/WRYdA==
X-CSE-MsgGUID: gH2uv/tpTVq7B1xNE/m9aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17119591"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="17119591"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 09:23:06 -0700
X-CSE-ConnectionGUID: q9LvqRjqTtq6/5XSXp47jw==
X-CSE-MsgGUID: ZKoTdXwHSia4pMzaWTjnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="46014335"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 01 Jul 2024 09:23:05 -0700
Received: from [10.245.82.99] (unknown [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8F5F835441;
 Mon,  1 Jul 2024 17:23:03 +0100 (IST)
Message-ID: <e7b96ffc-cf4f-4308-9395-518bc80639f6@intel.com>
Date: Mon, 1 Jul 2024 18:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Track writes to inaccessible registers
 from VF
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
 <20240626084304.1345-2-michal.wajdeczko@intel.com>
 <20240627092328.hdk46cnrji6mi4ax@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240627092328.hdk46cnrji6mi4ax@intel.com>
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



On 27.06.2024 11:23, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-26 10:43:03 +0200]:
>> Only limited set of registers is accessible for the VF driver.
>> The hardware will silently drop writes to inaccessible registers,
>> but to improve our driver lets track all such unexpected writes
>> on debug builds.
>>
>> We will explicitly allow bad writes to SOFTWARE_FLAGS_SPR33 since
>> it is used by the driver just to mimic wmb and we do not have any
>> similar unused scratch register accessible from the VF.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>> v2: update commit message (Gustavo)
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 22 ++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>>  drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
>>  3 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 41e46a00c01e..36cefe3161e1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -892,6 +892,28 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>>  	return rr->value;
>>  }
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
>> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, !reg.vf);
>> +
> NIT: I know that the name of this functios is supposed to correspond to xe_gt_sriov_vf_read32,
>      but the content does not correspond to it at all. 
>      Maybe let add here some command like:
> 
> /*
>  * For now we do not handle in any special way writes to registers that
>  * VF does not have access to, but let's log a warning about the attempt
>  * of such use
>  */

will update function description and/or add comment like that

>> +	xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>> +		   "VF is trying to write %#x to an inaccessible register %#x+%#x\n",
>> +		   val, reg.addr, addr - reg.addr);
> 
>  
>> +}
>> +
>>  /**
>>   * xe_gt_sriov_vf_print_config - Print VF self config.
>>   * @gt: the &xe_gt
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 0de7f8cbcfa6..e541ce57bec2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>  
>>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index f92faad4b96d..ff72afd79272 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -151,7 +151,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>>  
>>  	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
> Should we still trace registries to which VF do not have access ?

in ideal world we shouldn't see any attempts from VF driver to write to
unsupported registers, so for code simplicity I would leave it as is

> Maybe we should also log there that the write is rejected ?

and in less ideal world we will have a full WARN that will have a better
visibility than traces

> 
>> -	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>> +
>> +	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)) && reg.addr != SOFTWARE_FLAGS_SPR33.addr)
> 
> It seems to me that it would look better if you handled a case of SOFTWARE_FLAGS_SPR33 in
> xe_gt_sriov_vf_write32

hmm, maybe the better solution would be to select a different register
that is marked as VF accessible, question is whether it needs to be RW

@Matt - can we pick RO register VF_CAP(0x1901f8) ?

will that be sufficient to mimics wmb?
will that work for PF/native ?
if not, what can VF do to mimics wmb on DGFX ?

> But no matter if you leave it here or move it: this case needs some comment in the code
> (With a lot of code changes, the commit description is no longer easily accessible)
> 
>> +		xe_gt_sriov_vf_write32(gt, reg, val);
>> +	else
>> +		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> 
> I suspect I know what you are going to say, but what about mmio_ext ?

I never seen any platform with has_mmio_ext, so not sure how it will
support VFs, but still, similar to xe_gt_sriov_vf_read32(), the
xe_gt_sriov_vf_write32() takes xe_reg as parameter so any adjustment
needed to handle reg.ext could be done there as needed

> 
>>  }
>>  
>>  u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> -- 
>> 2.43.0
>>
> 
