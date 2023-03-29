Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DD3C761A6
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 20:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF1D10EC51;
	Wed, 29 Mar 2023 20:25:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D58D10EC54
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680121540; x=1711657540;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ix3V8ldqwN18iizPMYy8ZsGUFkq931YpkfikpwUhUCM=;
 b=bCFGwjgX4QMngmSz4pi86ZQsTK0OM5zG7s1NN7wftQ4mpAHjlQpEZZep
 ilcg8IgD1b/qqfs+dmrrSeSCacg6MMs3Xa5IPCBMlWubpwjkhsx/XEkgV
 N8sK6rEomQt0CfCAkoCDLrByR+n3nXwILzZ3MpzJYBQH+9M6I6QjZigjF
 EziZiqd8Fkiib9vUsbaqliBPludkTtzuCBDNjzVPLSb/yop2lzwJSuKdw
 Yuj5CyJ0N6Q8Q19djwlIEKkkMpvSFxzj8S0WokIIEhe+iUYhwNst/w6YX
 FztddLP49sSDVFMa3sAJNSUFDgw1hRu1bJ2jXkvVG0lRLnYLFJxbF7bFN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329478910"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="329478910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 13:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930460408"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="930460408"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2023 13:25:37 -0700
Received: from [10.249.128.53] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.128.53])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EA9E435FDA;
 Wed, 29 Mar 2023 21:25:36 +0100 (IST)
Message-ID: <1aa027f7-27cc-e135-162c-3a04692ecd7c@intel.com>
Date: Wed, 29 Mar 2023 22:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230313080117.2320-1-michal.wajdeczko@intel.com>
 <ZB3unyFtQlmOFZHS@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZB3unyFtQlmOFZHS@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Promote guc_to_gt/xe helpers to .h
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



On 24.03.2023 19:40, Rodrigo Vivi wrote:
> On Mon, Mar 13, 2023 at 09:01:17AM +0100, Michal Wajdeczko wrote:
>> Duplicating these helpers in almost every .c file was a bad idea.
>> Define them as inlines in .h file to allow proper reuse.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  6 ------
>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  6 ------
>>  drivers/gpu/drm/xe/xe_guc.c                 | 12 ------------
>>  drivers/gpu/drm/xe/xe_guc.h                 | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_guc_debugfs.c         | 12 ------------
>>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 12 ------------
>>  drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ------------
>>  7 files changed, 11 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 1677640e1075..2ae54fecf4ab 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -58,12 +58,6 @@ struct acc {
>>  	u8 engine_instance;
>>  };
>>  
>> -static struct xe_gt *
>> -guc_to_gt(struct xe_guc *guc)
>> -{
>> -	return container_of(guc, struct xe_gt, uc.guc);
>> -}
>> -
>>  static bool access_is_atomic(enum access_type access_type)
>>  {
>>  	return access_type == ACCESS_TYPE_ATOMIC;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index f279e21300aa..259382d54871 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -12,12 +12,6 @@
>>  
>>  #define TLB_TIMEOUT	(HZ / 4)
>>  
>> -static struct xe_gt *
>> -guc_to_gt(struct xe_guc *guc)
>> -{
>> -	return container_of(guc, struct xe_gt, uc.guc);
>> -}
>> -
>>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>  {
>>  	struct xe_gt *gt = container_of(work, struct xe_gt,
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 58b9841616e4..8fb2920d96da 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -22,18 +22,6 @@
>>  #include "xe_uc_fw.h"
>>  #include "xe_wopcm.h"
>>  
>> -static struct xe_gt *
>> -guc_to_gt(struct xe_guc *guc)
>> -{
>> -	return container_of(guc, struct xe_gt, uc.guc);
>> -}
>> -
>> -static struct xe_device *
>> -guc_to_xe(struct xe_guc *guc)
>> -{
>> -	return gt_to_xe(guc_to_gt(guc));
>> -}
>> -
>>  /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>>  #define GUC_GGTT_TOP    0xFEE00000
>>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 74a74051f354..96f6e3f46ed7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_GUC_H_
>>  #define _XE_GUC_H_
>>  
>> +#include "xe_gt.h"
> 
> sometimes the duplication is better then forcing more dependencies then needed.

IMHO duplication is always bad, and unnecessary dependencies are usually
as result of another bad decision/placement of needed functionality

> 
> I'm really not saying that this is the case here... If we are sure that the
> xe_gt.h was already affecting all the cases that include xe_guc.h then we
> should go with your patch...

it looks so:

$ cgrep include.*xe_guc\\.h -C 15 | grep include..xe_gt*u*c*\\.h
./xe_huc.c-11-#include "xe_gt.h"
./xe_huc.c:12:#include "xe_guc.h"
./xe_guc_ads.c-13-#include "xe_gt.h"
./xe_guc_ads.c:14:#include "xe_guc.h"
./xe_irq.c-17-#include "xe_gt.h"
./xe_irq.c:18:#include "xe_guc.h"
./xe_guc_submit.c-20-#include "xe_gt.h"
./xe_guc_submit.c:21:#include "xe_guc.h"
./xe_uc.c-9-#include "xe_gt.h"
./xe_uc.c:10:#include "xe_guc.h"
./xe_gt_pagefault.c-15-#include "xe_gt.h"
./xe_gt_pagefault.c:17:#include "xe_guc.h"
./xe_guc_debugfs.c-12-#include "xe_gt.h"
./xe_guc_debugfs.c:13:#include "xe_guc.h"
./xe_guc_hwconfig.c-12-#include "xe_gt.h"
./xe_guc_hwconfig.c:13:#include "xe_guc.h"
./xe_guc_ct.c-18-#include "xe_gt.h"
./xe_guc_ct.c:21:#include "xe_guc.h"
./xe_guc.c:6:#include "xe_guc.h"
./xe_guc.c-12-#include "xe_gt.h"
./xe_gt_tlb_invalidation.c-8-#include "xe_gt.h"
./xe_gt_tlb_invalidation.c:9:#include "xe_guc.h"


btw, there is already rev2 [1]

[1] https://patchwork.freedesktop.org/series/115083/


> 
>>  #include "xe_guc_types.h"
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_macros.h"
>> @@ -56,4 +57,14 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>>  	}
>>  }
>>  
>> +static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>> +{
>> +	return container_of(guc, struct xe_gt, uc.guc);
>> +}
>> +
>> +static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
>> +{
>> +	return gt_to_xe(guc_to_gt(guc));
>> +}
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index 6b72db4d5bb2..dbb3001db928 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -15,18 +15,6 @@
>>  #include "xe_guc_log.h"
>>  #include "xe_macros.h"
>>  
>> -static struct xe_gt *
>> -guc_to_gt(struct xe_guc *guc)
>> -{
>> -	return container_of(guc, struct xe_gt, uc.guc);
>> -}
>> -
>> -static struct xe_device *
>> -guc_to_xe(struct xe_guc *guc)
>> -{
>> -	return gt_to_xe(guc_to_gt(guc));
>> -}
>> -
>>  static struct xe_guc *node_to_guc(struct drm_info_node *node)
>>  {
>>  	return node->info_ent->data;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>> index a6982f323ed1..a89d26565fdd 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>> @@ -13,18 +13,6 @@
>>  #include "xe_guc.h"
>>  #include "xe_map.h"
>>  
>> -static struct xe_gt *
>> -guc_to_gt(struct xe_guc *guc)
>> -{
>> -	return container_of(guc, struct xe_gt, uc.guc);
>> -}
>> -
>> -static struct xe_device *
>> -guc_to_xe(struct xe_guc *guc)
>> -{
>> -	return gt_to_xe(guc_to_gt(guc));
>> -}
>> -
>>  static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, u32 size)
>>  {
>>  	u32 action[] = {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index e857013070b9..6b3159e75be9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -32,18 +32,6 @@
>>  #include "xe_trace.h"
>>  #include "xe_vm.h"
>>  
>> -static struct xe_gt *
>> -guc_to_gt(struct xe_guc *guc)
>> -{
>> -	return container_of(guc, struct xe_gt, uc.guc);
>> -}
>> -
>> -static struct xe_device *
>> -guc_to_xe(struct xe_guc *guc)
>> -{
>> -	return gt_to_xe(guc_to_gt(guc));
>> -}
>> -
>>  static struct xe_guc *
>>  engine_to_guc(struct xe_engine *e)
>>  {
>> -- 
>> 2.25.1
>>
