Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9AC282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 18:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146B10E4C6;
	Mon,  3 Mar 2025 18:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWgxFApZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF3A10E4D8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741027678; x=1772563678;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=60z5De73MkVvbLCFiVErZHp1VUZwLwsgPT3tF19oaAw=;
 b=WWgxFApZvdFoQUjPR/IRqhWtfw7MKeGx0N+/IN+F4/MxMGb8TxOZpLr0
 9UreM0mcPgVlfTTfWHYSpvQbP4lL+fxOw04vYNiE1gfwhCpCVawtWjzAd
 KebVXpEaCEusygGVs67BY0aILeNXzkqSVZWz2fE/zYdWV+8RMAc5E1ZTs
 3SoraWn+K0yeU0Zc4TVMcm3ZNDls7sWE0DYF6mUFdTjTGH6LNa64P5HWq
 QJ+/pHJE8rEkQtWQfyzhiKLmr28k88EKuKz3+XGu48iR4rUYZZ7/DzKFl
 3WuutzIFD/wL1LoweUYANqIKxqs7pAkUrn7DvYnfoTcLXYZoUI7Bazvi0 A==;
X-CSE-ConnectionGUID: mYWG49kKQ9+foNTDblBoMw==
X-CSE-MsgGUID: F8H8GG4tSzuVG/19RgqUTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52125640"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="52125640"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 10:47:53 -0800
X-CSE-ConnectionGUID: bYEH7xnASO+0Gwtastjw1Q==
X-CSE-MsgGUID: +d+xXWyJT72InP6yTtBROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118663854"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 03 Mar 2025 10:47:52 -0800
Received: from [10.245.99.10] (unknown [10.245.99.10])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CA34134EE7;
 Mon,  3 Mar 2025 18:47:50 +0000 (GMT)
Message-ID: <64899758-d054-4f0c-a38f-8931473bada7@intel.com>
Date: Mon, 3 Mar 2025 19:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe: Avoid reading RMW registers in emit_wa_job
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-4-michal.wajdeczko@intel.com>
 <3vm7izwczds45yaktuljfpges6rwsf27afgn7esuo6mdwontm5@vqtj3zkmnlmp>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3vm7izwczds45yaktuljfpges6rwsf27afgn7esuo6mdwontm5@vqtj3zkmnlmp>
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



On 03.03.2025 19:06, Lucas De Marchi wrote:
> On Mon, Mar 03, 2025 at 06:35:20PM +0100, Michal Wajdeczko wrote:
>> To allow VFs properly handle LRC WAs, we should postpone doing
>> all RMW register operations and let them be run by the engine
>> itself, since attempt to perform read registers from within the
>> driver will fail on the VF. Use MI_MATH and ALU for that.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c | 84 ++++++++++++++++++++++++++++----------
>> 1 file changed, 63 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 10a9e3c72b36..8068b4bc0a09 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -12,8 +12,10 @@
>>
>> #include <generated/xe_wa_oob.h>
>>
>> +#include "instructions/xe_alu_commands.h"
>> #include "instructions/xe_gfxpipe_commands.h"
>> #include "instructions/xe_mi_commands.h"
>> +#include "regs/xe_engine_regs.h"
>> #include "regs/xe_gt_regs.h"
>> #include "xe_assert.h"
>> #include "xe_bb.h"
>> @@ -176,15 +178,6 @@ static int emit_nop_job(struct xe_gt *gt, struct
>> xe_exec_queue *q)
>>     return 0;
>> }
>>
>> -/*
>> - * Convert back from encoded value to type-safe, only to be used when
>> reg.mcr
>> - * is true
>> - */
>> -static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
>> -{
>> -    return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
>> -}
>> -
>> static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>> {
>>     struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>> @@ -194,6 +187,7 @@ static int emit_wa_job(struct xe_gt *gt, struct
>> xe_exec_queue *q)
>>     struct xe_bb *bb;
>>     struct dma_fence *fence;
>>     long timeout;
>> +    int count_rmw = 0;
>>     int count = 0;
>>
>>     if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>> @@ -206,30 +200,32 @@ static int emit_wa_job(struct xe_gt *gt, struct
>> xe_exec_queue *q)
>>     if (IS_ERR(bb))
>>         return PTR_ERR(bb);
>>
>> -    xa_for_each(&sr->xa, idx, entry)
>> -        ++count;
>> +    /* count RMW registers as those will be handled separately */
>> +    xa_for_each(&sr->xa, idx, entry) {
>> +        if (entry->reg.masked || entry->clr_bits == ~0)
>> +            ++count;
>> +        else
>> +            ++count_rmw;
>> +    }
>>
>> -    if (count) {
>> +    if (count || count_rmw)
>>         xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>>
>> +    if (count) {
>> +        /* emit single LRI with all non RMW regs */
>> +
>>         bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM |
>> MI_LRI_NUM_REGS(count);
>>
>>         xa_for_each(&sr->xa, idx, entry) {
>>             struct xe_reg reg = entry->reg;
>> -            struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>>             u32 val;
>>
>> -            /*
>> -             * Skip reading the register if it's not really needed
>> -             */
>>             if (reg.masked)
>>                 val = entry->clr_bits << 16;
>> -            else if (entry->clr_bits + 1)
>> -                val = (reg.mcr ?
>> -                       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
>> -                       xe_mmio_read32(&gt->mmio, reg)) & (~entry-
>> >clr_bits);
>> -            else
>> +            else if (entry->clr_bits == ~0)
>>                 val = 0;
>> +            else
>> +                continue;
>>
>>             val |= entry->set_bits;
>>
>> @@ -239,6 +235,52 @@ static int emit_wa_job(struct xe_gt *gt, struct
>> xe_exec_queue *q)
>>         }
>>     }
>>
>> +    if (count_rmw) {
>> +        /* emit MI_MATH for each RMW reg */
>> +
>> +        xa_for_each(&sr->xa, idx, entry) {
>> +            if (entry->reg.masked || entry->clr_bits == ~0)
>> +                continue;
> 
> why can't we handle the normal writes here as well and avoid having some
> written from the CPU side and some from the GPU side?
> 

there were/are no writes here, we had reads only in case of the RMW
value that had to be programmed in LRI (previous approach)

and we have two loops since first covers all simple writes as all could
be programmed as single LRI command, while second loop emits separate
MATH commands per each RMW

