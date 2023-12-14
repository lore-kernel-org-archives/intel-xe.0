Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B60C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 00:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F38610E872;
	Thu, 14 Dec 2023 00:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2084810E8A2
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 00:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702513254; x=1734049254;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P7J7RNos3Egy9q1wXzuTezILNncGrtCsLdcn27ihWco=;
 b=bFguyxfZCFHpk5kJeCkmUGGqvssBoQ5XDkJfaph0se7OESeuM7qUtrhW
 BuaLhd1pL5oIP47EmX3pT/H0zk3ljO0f9mB9ELrtVJMEus5Ci1Hf7t+TN
 yLKcCfZLJ48XIheAwii7tmAItXSlMD95vxiLvyiT5ap13SjICtVAYC0yO
 6CI/M2rLRIjGDd665Wmc11HtwKk+HpfgkOo/n6aQ3SClOXnleeCa1aFY6
 Wg4hcJed2y4K8rfEkB3q4UQ8WOnqQFITI/lQ6Wrfz/GQVI5glCus7zf8y
 Fw3QXJAE1yAINzN2C/a1Snphz9fJ4xNpRud5rMl+IGUM+5yKzH99uuVq9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459368707"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="459368707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 16:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="723856352"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="723856352"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 13 Dec 2023 16:20:51 -0800
Received: from [10.249.145.20] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.145.20])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 79AA03685D;
 Thu, 14 Dec 2023 00:20:50 +0000 (GMT)
Message-ID: <73bac872-4b3c-4a1f-a711-46dc27e0731e@intel.com>
Date: Thu, 14 Dec 2023 01:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/xe/vf: Add VF specific interrupt handler
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-11-michal.wajdeczko@intel.com>
 <20231213005751.GQ1327160@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231213005751.GQ1327160@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 13.12.2023 01:57, Matt Roper wrote:
> On Tue, Dec 12, 2023 at 10:00:54PM +0100, Michal Wajdeczko wrote:
>> There are small differences in handling of the register based
>> interrupts on the VF driver as some registers are not accessible
>> to the VF driver. Additionally VFs must support Memory Based
>> Interrupts. Add VF specific interrupt handler for this.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_irq.c | 71 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index d1f5ba4bb745..907c8ff0fa21 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -17,7 +17,9 @@
>>  #include "xe_gt.h"
>>  #include "xe_guc.h"
>>  #include "xe_hw_engine.h"
>> +#include "xe_memirq.h"
>>  #include "xe_mmio.h"
>> +#include "xe_sriov.h"
>>  
>>  /*
>>   * Interrupt registers for a unit are always consecutive and ordered
>> @@ -498,6 +500,9 @@ static void xelp_irq_reset(struct xe_tile *tile)
>>  
>>  	gt_irq_reset(tile);
>>  
>> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
>> +		return;
>> +
>>  	mask_and_disable(tile, PCU_IRQ_OFFSET);
>>  }
>>  
>> @@ -508,6 +513,9 @@ static void dg1_irq_reset(struct xe_tile *tile)
>>  
>>  	gt_irq_reset(tile);
>>  
>> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
>> +		return;
>> +
>>  	mask_and_disable(tile, PCU_IRQ_OFFSET);
>>  }
>>  
>> @@ -518,11 +526,34 @@ static void dg1_irq_reset_mstr(struct xe_tile *tile)
>>  	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>>  }
>>  
>> +static void vf_irq_reset(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	if (GRAPHICS_VERx100(xe) < 1210)
>> +		xelp_intr_disable(xe);
>> +	else
>> +		xe_assert(xe, xe_device_has_memirq(xe));
> 
> Isn't this going to fail on DG1 (version 12.10)?  I don't believe it has
> memirq does it?

there is no SRIOV on DG1, so we won't be using this function there

> 
> Of course I don't know how much effort we want to put into these older
> platforms that are just temporary development vehicles and will never be
> "officially" supported by the Xe driver.  If we never enable SRIOV on
> those, then it doesn't really matter.
> 
> 
> Matt
> 
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		if (xe_device_has_memirq(xe))
>> +			xe_memirq_reset(&tile->sriov.vf.memirq);
>> +		else
>> +			gt_irq_reset(tile);
>> +	}
>> +}
>> +
>>  static void xe_irq_reset(struct xe_device *xe)
>>  {
>>  	struct xe_tile *tile;
>>  	u8 id;
>>  
>> +	if (IS_SRIOV_VF(xe))
>> +		return vf_irq_reset(xe);
>> +
>>  	for_each_tile(tile, xe, id) {
>>  		if (GRAPHICS_VERx100(xe) >= 1210)
>>  			dg1_irq_reset(tile);
>> @@ -545,8 +576,26 @@ static void xe_irq_reset(struct xe_device *xe)
>>  	}
>>  }
>>  
>> +static void vf_irq_postinstall(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +
>> +	for_each_tile(tile, xe, id)
>> +		if (xe_device_has_memirq(xe))
>> +			xe_memirq_postinstall(&tile->sriov.vf.memirq);
>> +
>> +	if (GRAPHICS_VERx100(xe) < 1210)
>> +		xelp_intr_enable(xe, true);
>> +	else
>> +		xe_assert(xe, xe_device_has_memirq(xe));
>> +}
>> +
>>  static void xe_irq_postinstall(struct xe_device *xe)
>>  {
>> +	if (IS_SRIOV_VF(xe))
>> +		return vf_irq_postinstall(xe);
>> +
>>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>>  
>>  	/*
>> @@ -563,8 +612,30 @@ static void xe_irq_postinstall(struct xe_device *xe)
>>  		xelp_intr_enable(xe, true);
>>  }
>>  
>> +static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +
>> +	spin_lock(&xe->irq.lock);
>> +	if (!xe->irq.enabled) {
>> +		spin_unlock(&xe->irq.lock);
>> +		return IRQ_NONE;
>> +	}
>> +	spin_unlock(&xe->irq.lock);
>> +
>> +	for_each_tile(tile, xe, id)
>> +		xe_memirq_handler(&tile->sriov.vf.memirq);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>>  static irq_handler_t xe_irq_handler(struct xe_device *xe)
>>  {
>> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
>> +		return vf_mem_irq_handler;
>> +
>>  	if (GRAPHICS_VERx100(xe) >= 1210)
>>  		return dg1_irq_handler;
>>  	else
>> -- 
>> 2.25.1
>>
> 
