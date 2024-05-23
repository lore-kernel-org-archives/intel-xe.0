Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E10EC25B79
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 21:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485810F202;
	Thu, 23 May 2024 21:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ciq2Jxek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C3610F202
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716500620; x=1748036620;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2BGbt/bH8NQknb3qPvVZhKtYXU0IM3oboxoAsEG6QA8=;
 b=Ciq2JxekMHqL3WvlTdlIkjp+R1gBTh6pATiXuYbVk6EZAuelpQcJhxef
 b7WaRzUsvemWzvOeoPRh00Bl6vkQsENRlPDkyhGPExyOnCqtvPLyghmVa
 YI51H6Rchzb9mOQ18ycszOOYn811KA+HYHctIYMrnVNpl4NoFAK3xK2FS
 OCSr1SRVahfPwH67n9ZYiUbL9aHC4DnwlCs0yl8nk1i55XT8u3AxWbhNr
 YIffXUOcv96SW8pxDRyHFri3/ALXmHHPcJfJ234PY/HKtgkNbZxrJPbVA
 Sl9ffIGYEzfA89gmoJ8XUSSJyj+NzY+1sceX3ZvmEiucwone6B120lLJW w==;
X-CSE-ConnectionGUID: pwlBkII9TLCA9BkOIpWhtw==
X-CSE-MsgGUID: ZWJpoSz0S/K9y2ZnFpQZPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12636007"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12636007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 14:43:39 -0700
X-CSE-ConnectionGUID: vftEsat4TI2ARr1u9eqMAw==
X-CSE-MsgGUID: 3hbOTAunS+KTm0nG291EAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34351548"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 23 May 2024 14:43:38 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7C12A28798;
 Thu, 23 May 2024 22:43:29 +0100 (IST)
Message-ID: <98416e39-077f-4ffe-8133-f5ee89bbe7ba@intel.com>
Date: Thu, 23 May 2024 23:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/vf: Provide early access to GMDID register
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-5-michal.wajdeczko@intel.com>
 <20240523210816.GB5383@mdroper-desk1.amr.corp.intel.com>
 <20240523211710.GC5383@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240523211710.GC5383@mdroper-desk1.amr.corp.intel.com>
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



On 23.05.2024 23:17, Matt Roper wrote:
> On Thu, May 23, 2024 at 02:08:16PM -0700, Matt Roper wrote:
>> On Thu, May 23, 2024 at 09:22:38PM +0200, Michal Wajdeczko wrote:
>>> VFs do not have direct access to the GMDID register and must obtain
>>> its value from the GuC. Since we need GMDID value very early in the
>>> driver probe flow, before we even start the full setup of GT and GuC
>>> data structures, we must do some early initializations ourselves.
>>>
>>> Additionally, since we also need GMDID for the media GT, which isn't
>>> created yet, temporarly tweak the root GT type into MEDIA to allow
>>> communication with the correct GuC, as only it can provide the value
>>> of the media GMDID register.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pci.c | 47 ++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index ece410289f6c..eefac633dbc1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -20,6 +20,8 @@
>>>  #include "xe_device.h"
>>>  #include "xe_drv.h"
>>>  #include "xe_gt.h"
>>> +#include "xe_gt_sriov_vf.h"
>>> +#include "xe_guc.h"
>>>  #include "xe_macros.h"
>>>  #include "xe_mmio.h"
>>>  #include "xe_module.h"
>>> @@ -471,10 +473,49 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>>>  
>>>  	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
>>>  
>>> -	if (type == GMDID_MEDIA)
>>> -		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
>>> +	if (IS_SRIOV_VF(xe)) {
>>> +		/*
>>> +		 * To get the value of the GMDID register, VFs must obtain it
>>> +		 * from the GuC using MMIO communication.
>>> +		 *
>>> +		 * Note that at this point the xe_gt is not fully uninitialized
>>> +		 * and only basic access to MMIO registers is possible. To use
>>> +		 * our existing GuC communication functions we must perform at
>>> +		 * least basic xe_gt and xe_guc initialization.
>>> +		 *
>>> +		 * Since to obtain the value of GMDID_MEDIA we need to use the
>>> +		 * media GuC, temporarly tweak the gt type.
>>> +		 */
>>> +		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>>> +
>>> +		if (type == GMDID_MEDIA) {
>>> +			gt->info.id = 1;
>>> +			gt->info.type = XE_GT_TYPE_MEDIA;
>>> +		} else {
>>> +			gt->info.id = 0;
>>> +			gt->info.type = XE_GT_TYPE_MAIN;
>>> +		}
>>> +
>>> +		xe_guc_comm_init_early(&gt->uc.guc);
>>> +
>>> +		/* don't bother with GMDID if failed to negotiate the GuC ABI */
>>> +		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
>>> +
>>> +		/* undo */
>>> +		gt->info.id = 0;
>>> +		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
>>
>> The xe_guc_comm_init_early() and xe_gt_sriov_vf_bootstrap() above also
>> make changes to the various GuC0 structures (which might be "wrong" if
>> we were reading the media's GMD_ID, but I think all of those changes
>> wind up getting overwritten later with the correct GuC0 values again
>> later when we initialize the GuC for real.  You might want to add some
>> kind of comment about that, since otherwise it looks at first glance
>> like we might be leaving GuC1 state inside the GuC0 structure here.

yep, I was relying here that all stuff will properly re-initialized
later on, so there is no need (or means) to rollback that

and yes, adding explicit comment about this is a good idea

>>
>> Otherwise,
>>
>>         Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Oh, one more question --- for non-SRIOV cases we assume that it's always
> safe to read the GMD_ID register offsets, even if the platform has
> fused-off media (like PVC did in the past).  If media is fused off, that
> register read comes back as 0x0 and we move forward recognizing that
> media just isn't available.  I don't think any of the post-MTL platforms
> we have at the moment (i.e., platforms where GMD_ID exists) ever have
> fused off media yet, but I imagine that situation will likely come back
> at some point in the future.
> 
> With the SRIOV-based flows here, are we going to get any GuC errors
> while blindly attempting to read the media GT's GMD_ID if media (and
> thus the media GuC) isn't actually present?

I'm afraid that today VF has no choice but assume that media GuC always
exists and VF can follow with GMDID query

but if there will be real SRIOV cases with fused off media GT then I
guess we will have to ask for some new KLV to be exposed by the root GuC
that VF could use (something similar to existing TILE_MASK)

> 
> 
> Matt
> 
>>
>>> +	} else {
>>> +		/*
>>> +		 * We need to apply the GSI offset explicitly here as at this
>>> +		 * point the xe_gt is not fully uninitialized and only basic
>>> +		 * access to MMIO registers is possible.
>>> +		 */
>>> +		if (type == GMDID_MEDIA)
>>> +			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
>>> +
>>> +		val = xe_mmio_read32(gt, gmdid_reg);
>>> +	}
>>>  
>>> -	val = xe_mmio_read32(gt, gmdid_reg);
>>>  	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>>>  	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
>>>  }
>>> -- 
>>> 2.43.0
>>>
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
> 
