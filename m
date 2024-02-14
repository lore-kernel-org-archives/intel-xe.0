Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CE7C48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 17:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D793C10E0A1;
	Wed, 14 Feb 2024 17:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPZ8W4X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1320810E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707932870; x=1739468870;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zReFimJCDAG3yJEzLponv+/nPE7MXzW7qFFhV7ughOs=;
 b=fPZ8W4X5jLIrXUgcZEWYL3qEsoN+uungaZq+lNWSIDieL6eTnjNXwf4W
 Ybms4UBdF/5VNUhbqYd9x06fJ3HHaSd86Fkr4Gdho53U8OrE8RD/fkM5r
 687qHNBEF9LxJab6FXdOxEixdz3dOldj3PdBL5m078kKSbGZoKYupCZ9J
 o7EJoHnSBNpg+c5aLm9wnLeieTqtVW9xgSvQSjpu2GiP2zNQ+qYc1nKMO
 nv/BlnoLfP3q8kxu+66vZLdhtvgtGYUc7RirRcm9+qgOTBNZwiet/yRCT
 wCUayNGHtbNBhPi6PsXIgPWmPi7DydvWXcdwQ3s7fyT8at2Em7ZwTszsV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1866656"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1866656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 09:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3178658"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2024 09:47:47 -0800
Received: from [10.249.138.241] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.138.241])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8C99827BAA;
 Wed, 14 Feb 2024 17:47:46 +0000 (GMT)
Message-ID: <a942292f-33cc-4d63-9733-217c614d7505@intel.com>
Date: Wed, 14 Feb 2024 18:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Promote GUC_GGTT_TOP definition to
 regs/xe_guc_regs.h
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240213213634.1437-1-michal.wajdeczko@intel.com>
 <ZcvsAxWzSAy_TEFs@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZcvsAxWzSAy_TEFs@intel.com>
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



On 13.02.2024 23:24, Rodrigo Vivi wrote:
> On Tue, Feb 13, 2024 at 10:36:34PM +0100, Michal Wajdeczko wrote:
>> This is a hardware based definition and instead of multiple local
>> definitions it would be better to have just one common definition.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
>>  drivers/gpu/drm/xe/xe_ggtt.c          | 4 +---
>>  drivers/gpu/drm/xe/xe_guc.c           | 2 --
>>  3 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 92320bbc9d3d..087eaa3b4d63 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -140,4 +140,7 @@ struct guc_doorbell_info {
>>  	u32 reserved[14];
>>  } __packed;
>>  
>> +/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>> +#define GUC_GGTT_TOP				0xFEE00000
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index ab96edb058d6..df5c58c63b74 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -11,6 +11,7 @@
>>  #include <drm/i915_drm.h>
>>  
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_guc_regs.h"
> 
> xe_ggtt component having to access xe_guc_regs doesn't the right movement to me.

but OTOH it is using xe_wopcm_size() which is also ~ GuC related stuff.

> 
> what about moving that to xe_gt_regs?

maybe new file "regs/xe_ggtt_layout.h" ?
like we have "regs/xe_lrc_layout.h"

+ Matt

> 
>>  #include "regs/xe_regs.h"
>>  #include "xe_assert.h"
>>  #include "xe_bo.h"
>> @@ -26,9 +27,6 @@
>>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
>>  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>>  
>> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>> -#define GUC_GGTT_TOP	0xFEE00000
>> -
>>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>  				   u16 pat_index)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 868208a39829..53a72769d3b4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -32,8 +32,6 @@
>>  #include "xe_wa.h"
>>  #include "xe_wopcm.h"
>>  
>> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>> -#define GUC_GGTT_TOP    0xFEE00000
>>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>  			    struct xe_bo *bo)
>>  {
>> -- 
>> 2.43.0
>>
