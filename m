Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC5C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 22:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6710E97D;
	Fri,  1 Dec 2023 22:49:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C482010E141
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701470948; x=1733006948;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8v29lpTRe/Oq7IVaC/dzUmuOM4Rv8OCwLx3CTcEwvFs=;
 b=AjaS9pTOtMPwgQD591gtsob5+bzZUiJ1+ElwdSyyok2f8zWBq23n01U5
 l/sSChcMsTOJT24OVO/Ql1vKs4cqnj5H3qx5hV23xbrItIbrEsoZnzcFN
 th5KRIGJJ2ACfEpJzqmZcFCXcwXhBG2CXek929nwn0KpqaDIQYqrUJ3QU
 BSQ8CRDcBwJhlSCZb49rnAZU1YqQOdcj1IR4jEBipO3CIntuhmNjEdkPL
 e+N6qkBsGjnk3PCy8iglR7FoLgG+bmOaMbe8l/vmhlZCowk6GwWzdghJV
 byBTD1F0FV588MmKKASc9mHLq/KSjOFq8jxTwWe365lEIjCWO59C8phSY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="460052267"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="460052267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 14:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="835905585"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="835905585"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga008.fm.intel.com with ESMTP; 01 Dec 2023 14:49:06 -0800
Received: from [10.249.142.37] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.142.37])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B9A363C586;
 Fri,  1 Dec 2023 22:49:04 +0000 (GMT)
Message-ID: <4d812868-dbb6-4ecf-bfcc-54889397b604@intel.com>
Date: Fri, 1 Dec 2023 23:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231115143838.2081-1-michal.wajdeczko@intel.com>
 <20231115143838.2081-2-michal.wajdeczko@intel.com>
 <lkmhdvb53r2uks2ikjzx7f4ajeest25kjzz6ozpqy5llhrjeyv@57xn7aoxwzfm>
 <20231130225615.GC1327160@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231130225615.GC1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Use dedicated function to read
 engine fuse registers
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 30.11.2023 23:56, Matt Roper wrote:
> On Wed, Nov 29, 2023 at 09:02:51AM -0600, Lucas De Marchi wrote:
>> On Wed, Nov 15, 2023 at 03:38:36PM +0100, Michal Wajdeczko wrote:
>>> These registers are not directly exposed to VFs, use function that
>>> will provide required data also when running as a VF.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_hw_engine.c | 6 +++---
>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index e831e63c5e48..1cf26c3c15c5 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -496,7 +496,7 @@ static void read_media_fuses(struct xe_gt *gt)
>>>
>>> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>
>>> -	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
>>> +	media_fuse = xe_mmio_fuse_read32(gt, GT_VEBOX_VDBOX_DISABLE);
>>
>> I'm not sure about this approach as it's not really clear which register
>> should or should not use this variant. For someone reading the code it
>> will be very confusing. We already have the mcr variant... what if one
>> of those registers is also MCR?
>>
>> As an alternative, we could annotate the registers on their definition
>> like we do for masked registers, and just tread them differently on the
>> normal functions when in VF mode. See the first struct inside struct
>> xe_reg. On register definition we would pass it as XE_REG_OPTION_XXXXXX
>>
>> +Matt Roper
>>
>> I'm unsure what's the best approach here without seeing the VF
>> implementation. Just want to kickstart a discussion.

something like here [1] where VF will receive set of register values
from PF that we will use if VF asks for such register

[1]
https://github.com/intel/linux-intel-lts/blob/5.10/yocto/drivers/gpu/drm/i915/intel_uncore.c#L1758

> 
> I don't think fuse registers are something that would ever be multicast
> since they're "higher level" in the hardware design and not down inside
> of specific hardware subunits.
> 
> I do like the idea of XE_REG_OPTION_XXXXXX since once you mark the
> register that way once, any future code that accesses the same register
> will automatically do the right thing, even if the person adding new
> code isn't aware of the SRIOV-specific details.

I've started tagging registers with

	/**
	 * XE_REG_OPTION_VF - Register is "VF" accessible.
	 *
	 * The register with this option could be accessed by
	 * the VF directly over MMIO BAR.
	 *
	 * To be used with XE_REG() and XE_REG_INITIALIZER().
	 */
	#define XE_REG_OPTION_VF		.vf = 1

but then we must hope that HW team will not change their minds for
existing register offsets in future platforms - now it should be OK.

For registers that VFs need but can't access directly (like fuses & co)
I wanted to add other flag:

	/**
	 * XE_REG_OPTION_VF_RUNTIME - Register is "VF" accessible.
	 *
	 * The register with this option could be accessed by
	 * the VF but only over dedicated mechanism.
	 * Implies XE_REG_OPTION_VF.
	 *
	 * To be used with XE_REG() and XE_REG_INITIALIZER().
	 */
	#define XE_REG_OPTION_VF_RUNTIME	.vf = 1, .vf_runtime = 1

but then xe_reg grows over single u32 - can we make addr:27 bit?

On related note, to actually benefit from this new xe_reg flags, extra
code will be added to generic xe_mmio_read32|write32 functions, likely
making them non-inline, is this OK?

Michal

> 
> 
> Matt
> 
>>
>> Lucas De Marchi
>>
>>
>>>
>>> 	/*
>>> 	 * Pre-Xe_HP platforms had register bits representing absent engines,
>>> @@ -541,7 +541,7 @@ static void read_copy_fuses(struct xe_gt *gt)
>>>
>>> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>
>>> -	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
>>> +	bcs_mask = xe_mmio_fuse_read32(gt, MIRROR_FUSE3);
>>> 	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
>>>
>>> 	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
>>> @@ -588,7 +588,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
>>> 	struct xe_device *xe = gt_to_xe(gt);
>>> 	u32 ccs_mask;
>>>
>>> -	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
>>> +	ccs_mask = xe_mmio_fuse_read32(gt, XEHP_FUSE4);
>>> 	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
>>>
>>> 	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
>>> -- 
>>> 2.25.1
>>>
> 
