Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9A7C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 11:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7346210EADB;
	Fri, 12 Jan 2024 11:06:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC110EADB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705057559; x=1736593559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q2XyPcN5ocJ1N8x3FOC1RiKbQe0pQ/vr2dlGAZKeEsM=;
 b=h1K6taGoUHv4PtN8RvzrEzZ6R7FDUqnYk11qkUuDDv08zCw4npKfzCJf
 8Tuxtj/y0Z9Z5d/6mRUvXG7kOfMXPTjDmSehbG48ok5qOtcg8t1YtZVB0
 RWS3b2mOICF1VeFViZ09xwn2/QuXJq/SRaWiwd6e/qZ3CQa9sDs8dZZCc
 fh/GGZJnD0p2lTfwkHaySME3lDgx1GMo6OgUTKXfDlQGZm8+Ho+5fyIsX
 CY3RhrFx19v0KjlwumS62dCnc+pjasZ1Hv2PyP3fd74UigalxPcoVI2oi
 3bLtBR9UQr0oNBSKMxbmZcUqK5qKHMroIlW64fkSlhSp1/+lZsIYwXJny Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463430517"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="463430517"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 03:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="782995858"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="782995858"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 12 Jan 2024 03:05:56 -0800
Received: from [10.249.135.224] (unknown [10.249.135.224])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 35E3841B69;
 Fri, 12 Jan 2024 11:05:55 +0000 (GMT)
Message-ID: <80a2253c-feee-4817-83f0-4ef509d5e97d@intel.com>
Date: Fri, 12 Jan 2024 12:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow to exclude part of GGTT from allocations
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20240111182559.629-1-michal.wajdeczko@intel.com>
 <20240112092523.ir4ktzlhotrvo375@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240112092523.ir4ktzlhotrvo375@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.01.2024 10:25, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-sty-11 19:25:59 +0100]:
>> Soon we will be required to exclude some of the GGTT addresses
>> from the allocations, since on some platforms running the SR-IOV VF
>> mode, we will be able to use only selected range of the GGTT space.
>>
>> Add helper functions to manage such GGTT range exclusions, and
>> follow the naming from the similar concept used by GVT-g.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 71 ++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_ggtt.h |  3 ++
>>  2 files changed, 74 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index c639dbf3bdd2..6fdf830678b3 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -11,9 +11,12 @@
>>  #include <drm/i915_drm.h>
>>  
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>> +#include "xe_assert.h"
>>  #include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>  #include "xe_gt_tlb_invalidation.h"
>>  #include "xe_map.h"
>>  #include "xe_mmio.h"
>> @@ -312,6 +315,74 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>>  	}
>>  }
>>  
>> +static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>> +			      const struct drm_mm_node *node, const char *description)
>> +{
>> +	char buf[10];
>> +
>> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>> +		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
>> +		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
>> +			  node->start, node->start + node->size, buf, description);
> My personal preference in the log is for the address range to be 0x1000 - 0x1fff rather
> than 0x1000 - 0x2000.

In the past I also followed that rule, but then found [1]

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_mm.c#L1005

> 
>> +	}
>> +}
>> +
>> +/**
>> + * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
>> + * @ggtt: the &xe_ggtt where we want to make reservation
>> + * @start: the starting GGTT address of the reserved region
>> + * @end: then end GGTT address of the reserved region
>> + * @node: the &drm_mm_node to hold reserved GGTT node
>> + *
>> + * Use xe_ggtt_deballoon() to release a reserved GGTT node.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct drm_mm_node *node)
>> +{
>> +	int err;
>> +
>> +	xe_tile_assert(ggtt->tile, start < end);
>> +	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>> +	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>> +	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(node));
>> +
>> +	node->color = 0;
>> +	node->start = start;
>> +	node->size = end - start;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	err = drm_mm_reserve_node(&ggtt->mm, node);
>> +	mutex_unlock(&ggtt->lock);
>> +
>> +	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>> +		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>> +		       node->start, node->start + node->size, ERR_PTR(err)))
>> +		return err;
>> +
>> +	xe_ggtt_dump_node(ggtt, node, "balloon");
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_ggtt_deballoon - release a reserved GGTT region
>> + * @ggtt: the &xe_ggtt where reserved node belongs
>> + * @node: the &drm_mm_node with reserved GGTT region
>> + *
>> + * See xe_ggtt_balloon() for details.
>> + */
>> +void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>> +{
>> +	if (!drm_mm_node_allocated(node))
>> +		return;
>> +
>> +	xe_ggtt_dump_node(ggtt, node, "deballoon");
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	drm_mm_remove_node(node);
>> +	mutex_unlock(&ggtt->lock);
>> +}
>> +
> 
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

> 
>>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>>  				       u32 size, u32 align, u32 mm_flags)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index a09c166dff70..42705e1338e1 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -16,6 +16,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>>  
>> +int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
>> +void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
>> +
>>  int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>>  				u32 size, u32 align);
>>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
>>
>> base-commit: 79184e72263e91528195db01783148435c7e4fad
>> -- 
>> 2.25.1
>>
> 
