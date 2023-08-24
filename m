Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02804C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 15:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DDB10E579;
	Thu, 24 Aug 2023 15:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFE610E579
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692890367; x=1724426367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1JlVQBSd06/TlDcBzNtfLwNyaRcYQAsaguZCsaaVxsw=;
 b=elLu0HYppDWyL+Yrq66oE7L0W8ilXEQkpS1w863+DRvDj2WuKwiE/pni
 KnYdijjIDrxlu3AZ9ihfx0H5ISzH5cyesbcYfSewl4tT8X7UuSQbsiBui
 bSiEEA2sUV4+pCUhWr1SddnpRlwxcAMK+u8T1DgFi8wRF0VUko7aBpfVO
 6UttiapZ6jV8XQ0CzmMBGDsSH9xOH+vAPpYr9AybPt9q2G5jrMV7YFRyY
 LtXF6yrPt+7V3tfKQPU26OxkuruabRMHx7heklQkF+Xpj3vyy7RzZe0ao
 FvaFCe19Cex4qCDxCaYo/8uecTltzWEPGbtS78JJHWgzaFc0xbT1Xzwy8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="371871827"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="371871827"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 08:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="740239856"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="740239856"
Received: from romanbog-mobl1.ger.corp.intel.com (HELO [10.252.5.6])
 ([10.252.5.6])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 08:19:14 -0700
Message-ID: <238cd457-5468-9c61-fa8c-aa1d728d6cbc@intel.com>
Date: Thu, 24 Aug 2023 16:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230823175551.230686-3-matthew.auld@intel.com>
 <20230823175551.230686-4-matthew.auld@intel.com>
 <ZOdop3raHNPl1O/C@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZOdop3raHNPl1O/C@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: nuke GuC on unload
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 24/08/2023 15:26, Matthew Brost wrote:
> On Wed, Aug 23, 2023 at 06:55:53PM +0100, Matthew Auld wrote:
>> On PVC unloading followed by reloading the module often results in a
>> completely dead machine (seems to be plaguing CI). Resetting the GuC
>> like we do at load seems to cure it at least when locally testing this.
>>
>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/542
>> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/597
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Seems reasonible to reset the GuC on driver unload, one question below.
> 
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_uc.c  |  5 +++++
>>   drivers/gpu/drm/xe/xe_uc.h  |  1 +
>>   3 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index e102637c0695..bbe06686a706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include "xe_guc.h"
>>   
>> +#include <drm/drm_managed.h>
>> +
>>   #include "generated/xe_wa_oob.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_guc_regs.h"
>> @@ -20,6 +22,7 @@
>>   #include "xe_guc_submit.h"
>>   #include "xe_mmio.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_uc.h"
>>   #include "xe_uc_fw.h"
>>   #include "xe_wa.h"
>>   #include "xe_wopcm.h"
>> @@ -217,6 +220,15 @@ static void guc_write_params(struct xe_guc *guc)
>>   		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
>>   }
>>   
>> +static void guc_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_guc *guc = arg;
>> +
>> +	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> +	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>> +	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>> +}
>> +
>>   int xe_guc_init(struct xe_guc *guc)
>>   {
>>   	struct xe_device *xe = guc_to_xe(guc);
>> @@ -240,6 +252,10 @@ int xe_guc_init(struct xe_guc *guc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
>> +	if (ret)
>> +		goto out;
>> +
> 
> Any reason this is after xe_guc_ct_init but before xe_guc_pc_init? Seems
> like odd placement.

Yeah, I think the issue was that pc_fini() needs the GuC to be alive, so 
order needs to be that guc_fini() is called last. I can try to move the 
pc_fini() into guc_fini() and see if that is cleaner.

> 
> Matt
> 
>>   	ret = xe_guc_pc_init(&guc->pc);
>>   	if (ret)
>>   		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index addd6f2681b9..9c8ce504f4da 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -167,6 +167,11 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>   	return 0;
>>   }
>>   
>> +int xe_uc_fini_hw(struct xe_uc *uc)
>> +{
>> +	return xe_uc_sanitize_reset(uc);
>> +}
>> +
>>   int xe_uc_reset_prepare(struct xe_uc *uc)
>>   {
>>   	/* GuC submission not enabled, nothing to do */
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 42219b361df5..4109ae7028af 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>>   int xe_uc_init_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>   int xe_uc_init_hw(struct xe_uc *uc);
>> +int xe_uc_fini_hw(struct xe_uc *uc);
>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>> -- 
>> 2.41.0
>>
