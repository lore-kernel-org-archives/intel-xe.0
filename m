Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA23C2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB1010E140;
	Wed, 19 Jun 2024 23:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWC7/BIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089310E140
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718839557; x=1750375557;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BdlMcQ6pkZkwLdC44Z5Q3z8dD11NEJQh4IPh7eTWgMk=;
 b=TWC7/BIVgjk57GdDhbVRWx8FvODMMlVrxA/KZ9eiLhW0QBIjAgujlIwn
 gMNfsG+fINr2fEsFwt/T4kXPvPz3LaKcTFz9d5J6MoGwYqS9fx31QInHx
 REXVF7L/Eq9zk92Gmsn1lavkedaoIMRIgDe0YMhqgasRP+SipQfWDY0yn
 dcEf0Ew4N49uyUgPsWKTjHbtI4jD6lHyjBwXMENAUAUM+OiMIg12I+LvI
 WXQyibF4GAQlERzCF76NF3Buh3gPQ076pAbABKkeJ0KwBLxcYdn1KSnVv
 IrXuDCdzX2w7YlmEGfdFhiLERdpLNcPA66OPKAFuBZNP+nKcXEs0fUbvf Q==;
X-CSE-ConnectionGUID: LSe9LsRnTBm/9MtkPCteZQ==
X-CSE-MsgGUID: qS+S7Ty5QtqgeV1OsC5EXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15670997"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15670997"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:25:56 -0700
X-CSE-ConnectionGUID: JqHdry+3QRe8HEasnKHH0g==
X-CSE-MsgGUID: Ds4+Y+gYQWyQ8Dpgrse/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42177184"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 19 Jun 2024 16:25:55 -0700
Received: from [10.246.25.139] (unknown [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6C9202878B;
 Thu, 20 Jun 2024 00:25:54 +0100 (IST)
Message-ID: <3d6d5d51-9cba-4808-88f7-a43562468bbb@intel.com>
Date: Thu, 20 Jun 2024 01:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/xe/vf: Don't use register based TLB invalidation
 if VF
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-8-michal.wajdeczko@intel.com>
 <ZnNmIskfVCxr/8Xv@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZnNmIskfVCxr/8Xv@DUT025-TGLU.fm.intel.com>
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



On 20.06.2024 01:13, Matthew Brost wrote:
> On Wed, Jun 19, 2024 at 11:45:55PM +0200, Michal Wajdeczko wrote:
>> VF drivers can only use GuC-based TLB invalidation, as they don't
>> have access to the related registers. However, VFs shouldn't need
>> any explicit TLB invalidation before enabling CTB communication,
>> as there will be an implicit GGTT TLB invalidation issued by the
>> GuC itself as part of MMIO-based action handling.
>>
> 
> Does assigning / removing a new GGTT mapping on a VF involve a MMIO
> action?

if we are adding new GGTT mapping _before_ CTB is ready, then we likely
doing that just to enable the CTB, which is MMIO action, that has
implicit TLB invalidation, or we did this to prepare our data long
before starting GuC, in which case we don't care until we enable CTB,
which is prev case, as we need CTB to create contexts and submit WLs

if we remove any GGTT mappings than likely we already pass the probe
phase and have CTB available

IMO, even in native mode we should also only rely on GuC CTB actions or
implicit TLB invalidation performed by GuC (unless we are running in
execlist mode)

> 
> Not touching registers on VF itself makes sense though.
> 
> Matt
> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 23d397a246a8..e1f1ccb01143 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_guc.h"
>>  #include "xe_guc_ct.h"
>>  #include "xe_mmio.h"
>> +#include "xe_sriov.h"
>>  #include "xe_trace.h"
>>  #include "regs/xe_guc_regs.h"
>>  
>> @@ -249,6 +250,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>  
>>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>> +		if (IS_SRIOV_VF(xe))
>> +			return 0;
>> +
>>  		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>> -- 
>> 2.43.0
>>
