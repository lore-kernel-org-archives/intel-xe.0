Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12626CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 14:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D810E897;
	Thu, 14 Aug 2025 14:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HV4F8x5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2210E897
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755180196; x=1786716196;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=07Kagm6AYos8PSZmC0A3Ml0Loqt3WOSriw71o1DFTLM=;
 b=HV4F8x5VE5Z3x551TnDw4+khDXZA0FeMW6uKc5nc7/hK5ZkfJO1GYRgs
 xrO6LXBYzBFRhKlEmXmepKoYpGJPvSbMo1OqcTtn+il/q0SSu864jtAEU
 wfPYpLC8YRAxd+h7YXo+op6dOL7mW2isaJtcrc7ajnavis9KQ9YNklXXy
 O0kAQgjwU3RDfvgSJ3jTwR+7jI7A1ccgO1oW1uSCVlzctQyoJvyEuiS2T
 4rQSo/VKBaftk2GCY/gFDlNEzAHpZdMoI6VzUwlU+8buJWlySzVdAXH0m
 LT2DJMfksPT47SszxvFptBT/OFwKXNBX9m7kN/5lWVMrrJysBwUpgPONz A==;
X-CSE-ConnectionGUID: RGvnrUUNTnmHSIgw1hsDLw==
X-CSE-MsgGUID: mE2rvtE9SyeKI9Kk3sR00g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="60122574"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="60122574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:03:16 -0700
X-CSE-ConnectionGUID: +pv+4Zx1TWuwWJ+3Keuh2g==
X-CSE-MsgGUID: Di2iVrolSMKkl95iOjc6zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170901995"
Received: from zzombora-mobl1 (HELO [10.245.244.158]) ([10.245.244.158])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:03:15 -0700
Message-ID: <98ec41d9-9410-41f4-b922-f985cbadd000@intel.com>
Date: Thu, 14 Aug 2025 15:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <20250808110452.467513-2-matthew.auld@intel.com>
 <791aec1f4149ab370cc09a4152e4ab5d29a8b673.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <791aec1f4149ab370cc09a4152e4ab5d29a8b673.camel@intel.com>
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

On 08/08/2025 18:02, Summers, Stuart wrote:
> On Fri, 2025-08-08 at 12:04 +0100, Matthew Auld wrote:
>> When clearing VRAM we should be able to skip invalidating the TLBs if
>> we
>> are only using the identity map to access VRAM (which is the common
>> case), since no modifications are made to PTEs on the fly. Also since
>> we
>> use huge 1G entries within the identity map, there should be a pretty
>> decent chance that the next packet(s) (if also clears) can avoid a
>> tree
>> walk if we don't shoot down the TLBs, like if we have to process a
>> long
>> stream of clears.
>>
>> For normal moves/copies, we usually always end up with the src or dst
>> being system memory, meaning we can't only rely on the identity map
>> and
>> will also need to emit PTEs and so will always require a TLB flush.
> 
> Hey Matt,
> 
> Definitely looks like a good, interesting change. I'm running a few
> local tests. Can we hold on this merge for a few hours? I'll report
> back as soon as I have that.

Should I be worried here? I didn't see a follow up :)

> 
> Thanks,
> Stuart
> 
>>
>> v2:
>>    - Update commit to explain the situation for normal copies (Matt B)
>>    - Rebase on latest changes
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
>>   drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
>>   2 files changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 4effe10d815b..356097fd6d2a 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -906,7 +906,7 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>                          goto err;
>>                  }
>>   
>> -               xe_sched_job_add_migrate_flush(job, flush_flags);
>> +               xe_sched_job_add_migrate_flush(job, flush_flags |
>> MI_INVALIDATE_TLB);
>>                  if (!fence) {
>>                          err = xe_sched_job_add_deps(job, src_bo-
>>> ttm.base.resv,
>>                                                     
>> DMA_RESV_USAGE_BOOKKEEP);
>> @@ -1287,11 +1287,13 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>   
>>                  size -= clear_L0;
>>                  /* Preemption is enabled again by the ring ops. */
>> -               if (clear_vram && xe_migrate_allow_identity(clear_L0,
>> &src_it))
>> +               if (clear_vram && xe_migrate_allow_identity(clear_L0,
>> &src_it)) {
>>                          xe_res_next(&src_it, clear_L0);
>> -               else
>> -                       emit_pte(m, bb, clear_L0_pt, clear_vram,
>> clear_only_system_ccs,
>> -                                &src_it, clear_L0, dst);
>> +               } else {
>> +                       emit_pte(m, bb, clear_L0_pt, clear_vram,
>> +                                clear_only_system_ccs, &src_it,
>> clear_L0, dst);
>> +                       flush_flags |= MI_INVALIDATE_TLB;
>> +               }
>>   
>>                  bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>                  update_idx = bb->len;
>> @@ -1302,7 +1304,7 @@ struct dma_fence *xe_migrate_clear(struct
>> xe_migrate *m,
>>                  if (xe_migrate_needs_ccs_emit(xe)) {
>>                          emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>                                        m->cleared_mem_ofs, false,
>> clear_L0);
>> -                       flush_flags = MI_FLUSH_DW_CCS;
>> +                       flush_flags |= MI_FLUSH_DW_CCS;
>>                  }
>>   
>>                  job = xe_bb_create_migration_job(m->q, bb,
>> @@ -1637,6 +1639,8 @@ __xe_migrate_update_pgtables(struct xe_migrate
>> *m,
>>                  goto err_sa;
>>          }
>>   
>> +       xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>> +
>>          if (ops->pre_commit) {
>>                  pt_update->job = job;
>>                  err = ops->pre_commit(pt_update);
>> @@ -1862,7 +1866,7 @@ static struct dma_fence *xe_migrate_vram(struct
>> xe_migrate *m,
>>                  goto err;
>>          }
>>   
>> -       xe_sched_job_add_migrate_flush(job, 0);
>> +       xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>>   
>>          mutex_lock(&m->job_mutex);
>>          xe_sched_job_arm(job);
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index e8f22ec5f9af..80dffc3ba036 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32
>> ppgtt_flag, u32 *dw, int i)
>>          return i;
>>   }
>>   
>> -static int emit_flush_invalidate(u32 addr, u32 val, u32 *dw, int i)
>> +static int emit_flush_invalidate(u32 addr, u32 val, u32 flush_flags,
>> u32 *dw, int i)
>>   {
>> -       dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
>> MI_FLUSH_DW_OP_STOREDW |
>> -                 MI_FLUSH_IMM_DW;
>> +       dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW |
>> +                 MI_FLUSH_IMM_DW | (flush_flags & MI_INVALIDATE_TLB)
>> ?: 0;
>>   
>>          dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>>          dw[i++] = 0;
>> @@ -410,13 +410,13 @@ static void emit_migration_job_gen12(struct
>> xe_sched_job *job,
>>          i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
>>   
>>          dw[i++] = preparser_disable(true);
>> -       i = emit_flush_invalidate(saddr, seqno, dw, i);
>> +       i = emit_flush_invalidate(saddr, seqno, job-
>>> migrate_flush_flags, dw, i);
>>          dw[i++] = preparser_disable(false);
>>   
>>          i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>>   
>>          i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
>> -                               MI_INVALIDATE_TLB | job-
>>> migrate_flush_flags,
>> +                               job->migrate_flush_flags,
>>                                  dw, i);
>>   
>>          i = emit_user_interrupt(dw, i);
> 

