Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DADECD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740810E0F2;
	Tue,  3 Sep 2024 11:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FyELbnvl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1857688EFF
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725361712; x=1756897712;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1Oyv5DPIBv7algjNpwc+PJ0EOCDi0LhCgkTvsQIbFk4=;
 b=FyELbnvljyD5PLCHpFlpf7/vTZd8xYWSm5vmBj8Ah/3FjDI7yPp9Qoja
 AASCgTPBdvi+/wJaPNAstvDWSxDQS4cH5wUNRAs7liIq35epiYuV1eghv
 9P/oBVpSYwtfDcBRV1cme73JOeiHXBJzKxKEQWZbu3GKBMBhT6A1VsS4U
 1r6kS+UsvyHU/b4DTbOZFzW4ReDwDhBpQEiisC8uQc90Ma6b4I8r9UA4o
 YgBoJoTsWswHEoOST1pGtEEAehPhSUAYTaz73ctrneeVZ8KkJV3EbIej1
 +5lKvbSvt/EkOWg71+m1/8uJ8BtVLsH/F8/iYiNDaxchbcaqi8upiw5xT w==;
X-CSE-ConnectionGUID: Ojy8UhpNTAaCgmp/2076dA==
X-CSE-MsgGUID: uw+FUs8DSXagwvQY+0xNFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="46477193"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="46477193"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 04:08:32 -0700
X-CSE-ConnectionGUID: X7KEIm8LQuGUDwPUeDsh/w==
X-CSE-MsgGUID: DyTmiNx1RPylh/fOomhbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="69667333"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.222])
 ([10.245.244.222])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 04:08:30 -0700
Message-ID: <4bcc669d-7fb9-4daa-a94d-22a785f04b22@intel.com>
Date: Tue, 3 Sep 2024 12:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: improve cache flushing behaviour
To: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240902153744.63456-2-matthew.auld@intel.com>
 <9d3f3a9d-bfde-4a06-a776-743b1ed47236@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <9d3f3a9d-bfde-4a06-a776-743b1ed47236@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 03/09/2024 11:53, Nirmoy Das wrote:
> 
> On 9/2/2024 5:37 PM, Matthew Auld wrote:
>> The BSpec seems to suggest that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
>> on for manual global invalidation to take effect
> 
> I couldn't find this reference, in which bspec is this mentioned ?

BSpec: 71718

For discrete under global invalidation it says: "Device Cache flushed if 
SCRATCH1LPFC bit[0] is set". Which is why I originally added this, 
however this then turns flushing on for all kinds of stuff like 
pipecontrol which is not what we want. But from playing around with this 
a bunch on BMG that doesn't look to be true. Also the original WA made 
no mention of needing to mess with SCRATCH1LPFC.

I'm kind of hoping this helps that compute benchmark with not nuking 
entire device cache between submissions.

> 
> 
> Regards,
> 
> Nirmoy
> 
>>   and actually flush
>> device cache, however this also turns on flushing for things like
>> pipecontrol, which occurs between submissions for compute/render. This
>> sounds like massive overkill for our needs, where we already have the
>> manual flushing on the display side with the global invalidation. Some
>> observations on BMG:
>>
>> 1. Disabling l2 caching for host writes and stubbing out the driver
>>     global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH enabled, has
>>     no impact on wb-transient-vs-display IGT, which makes sense since the
>>     pipecontrol is now flushing the device cache after the render copy.
>>     Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
>>     expected since device cache is now dirty and display engine can't see
>>     the writes.
>>
>> 2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
>>     invalidation also has no impact on wb-transient-vs-display. This
>>     suggests that the global invalidation still works as expected and is
>>     flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH turned on.
>>
>> With that drop EN_L3_RW_CCS_CACHE_FLUSH.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>>   drivers/gpu/drm/xe/xe_gt.c           | 1 -
>>   2 files changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0d1a4a9f4e11..88a01970cc5c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -387,9 +387,6 @@
>>   #define XE2_GLOBAL_INVAL            XE_REG(0xb404)
>> -#define SCRATCH1LPFC                XE_REG(0xb474)
>> -#define   EN_L3_RW_CCS_CACHE_FLUSH        REG_BIT(0)
>> -
>>   #define XE2LPM_L3SQCREG5            XE_REG_MCR(0xb658)
>>   #define XE2_TDF_CTRL                XE_REG(0xb418)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index f82b3e8ac5c8..313cc4242281 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -110,7 +110,6 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt 
>> *gt)
>>           return;
>>       if (!xe_gt_is_media_type(gt)) {
>> -        xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
>>           reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>>           reg |= CG_DIS_CNTLBUS;
>>           xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
