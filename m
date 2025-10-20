Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AC7CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655610E32F;
	Mon, 20 Oct 2025 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5SeyFe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B834B10E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964974; x=1792500974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=z14phZW/EKkbwgLipAxypt6CQOcc4TA8jxZRjLsLsJw=;
 b=B5SeyFe56c+xaTTdDHMxkLatPVMxmYDILfmXXComkEcR53jusqkvOjnk
 djvlwePPouIRkDHkt+huFsExmmfn0TJ/Ckuu7JPbqi0zpB9YFFPnhhuIZ
 AjsBl6nIoq9LZ7sToGYkOTPDV5lPkUaw7E68LiOhKr6yORdKU1bcN0Ik4
 ymYcZH0XgmSbtqTjJwrLfaFJrkbDJfK1Aj2LTOx95rXa3MHguz+NjN6h5
 1K/PnFga7li+dnNj/vzLGEojGeIyIdES/pMlbPZxaoQ9FOyEb8LUJR/Iz
 GSv2XBccUJmdUO/13HpBJw/PaslYksaqCYlKH4kNTmFbplF+5hqu851S+ A==;
X-CSE-ConnectionGUID: hpiw9+SFT/eP6EQOKFT9og==
X-CSE-MsgGUID: QbcCwuhlQ3i8igW+y5zSrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85700342"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="85700342"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:56:14 -0700
X-CSE-ConnectionGUID: glUZsD+PR6eshn75urdbFA==
X-CSE-MsgGUID: vVY04Y0lQFOXwGSrBL1zWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182465068"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.47])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:56:10 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch,
 christian.koenig@amd.com, thomas.hellstrom@linux.intel.com,
 joonas.lahtinen@linux.intel.com, christoph.manszewski@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com, andrzej.hajda@intel.com,
 matthew.auld@intel.com, maciej.patelczyk@intel.com,
 gwan-gyeong.mun@intel.com, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 16/20] drm/xe/eudebug: Mark guc contexts as debuggable
In-Reply-To: <aOQL/Qz32Jwkh6J5@lstrano-desk.jf.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
 <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
 <aOQL/Qz32Jwkh6J5@lstrano-desk.jf.intel.com>
Date: Mon, 20 Oct 2025 15:56:07 +0300
Message-ID: <87ikg9ohp4.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

Matthew Brost <matthew.brost@intel.com> writes:

> On Mon, Oct 06, 2025 at 02:17:06PM +0300, Mika Kuoppala wrote:
>> We need to inform to guc which contexts are debuggable
>> as their handling is different from ordinary contexts.
>> 
>> Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 +++
>>  drivers/gpu/drm/xe/xe_eudebug_hw.c       | 55 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_eudebug_hw.h       |  4 ++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       |  4 ++
>>  4 files changed, 68 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 47756e4674a1..32a5f680a6d2 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -155,6 +155,7 @@ enum xe_guc_action {
>>  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>>  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>>  	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
>> +	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
>>  	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
>>  	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
>>  	XE_GUC_ACTION_LIMIT
>> @@ -278,4 +279,8 @@ enum xe_guc_g2g_type {
>>  /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
>>  #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
>>  
>> +enum  xe_guc_eu_kernel_debug_request_type {
>> +	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
>> +};
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
>> index a62c4b439888..cd4627705b56 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
>> +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
>> @@ -12,6 +12,7 @@
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_engine_regs.h"
>>  
>> +#include "abi/guc_actions_abi.h"
>>  #include "xe_eudebug.h"
>>  #include "xe_eudebug_types.h"
>>  #include "xe_exec_queue.h"
>> @@ -20,6 +21,9 @@
>>  #include "xe_gt.h"
>>  #include "xe_gt_debug.h"
>>  #include "xe_gt_mcr.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_exec_queue_types.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_lrc.h"
>>  #include "xe_macros.h"
>> @@ -675,6 +679,57 @@ static int xe_eu_control_stopped(struct xe_eudebug *d,
>>  	return xe_gt_eu_attention_bitmap(q->gt, bits, bitmask_size);
>>  }
>>  
>> +static int xe_guc_action_eu_kernel_debug(struct xe_device *xe,
>> +					 struct xe_exec_queue *q,
>> +					 struct xe_lrc *lrc, u32 cmd)
>> +{
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_EU_KERNEL_DEBUG,
>> +		q->guc->id,
>> +		cmd,
>> +		0, /* reserved */
>> +	};
>> +	int ret, i;
>> +
>> +	if (cmd != XE_GUC_EU_KERNEL_DEBUG_ENABLE)
>
> Maybe an xe_gt_assert here instead.
>
>> +		return -EINVAL;
>> +
>> +	ret = -EINVAL;
>> +	for (i = 0; i < q->width; i++) {
>
> I would double check with the GuC team if you have have enable EU
> debugging on each guc_id in multi-lrc contexts. I suspect not given
> register, scheduling toggles, and deregister H2G operate only on the
> main GuC ID. I'm am however unsure as H2G 8006 is not in GuC spec I'm
> looking at.
>

I have not yet had definite answer if main GuC id is enough.

>> +		if (lrc && q->lrc[i] != lrc)
>> +			continue;
>> +
>
> The above code looks unused as LRC is always NULL.
>
>> +		action[1] = q->guc->id + i;
>> +		drm_dbg(&xe->drm, "Guc action[%u] for ctx=%d",
>> +			cmd, action[1]);
>
> Prefer xe_gt_dbg.
>
>> +
>> +		ret = xe_guc_ct_send(&q->gt->uc.guc.ct,
>> +				     action, ARRAY_SIZE(action), 0, 0);
>> +
>> +		if (ret)
>> +			drm_dbg(&xe->drm, "eudebug guc cmd %u failed with %d\n",
>> +				cmd, ret);
>
> Prefer xe_gt_dbg.
>
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static bool xe_guc_has_debug_contexts(struct xe_gt *gt)
>> +{
>> +	return GUC_FIRMWARE_VER(&gt->uc.guc) >=	MAKE_GUC_VER(70, 49, 0);
>> +}
>> +
>> +int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q)
>> +{
>
> The return value is not checked at the caller, so NULL return would be
> better choice.
>
>> +	struct xe_device *xe = gt_to_xe(q->gt);
>> +
>> +	if (!xe_guc_has_debug_contexts(q->gt))
>> +		return 0;
>> +
>> +	return xe_guc_action_eu_kernel_debug(xe, q, NULL,
>> +					     XE_GUC_EU_KERNEL_DEBUG_ENABLE);
>> +}
>> +
>>  static struct xe_eudebug_eu_control_ops eu_control = {
>>  	.interrupt_all = xe_eu_control_interrupt_all,
>>  	.stopped = xe_eu_control_stopped,
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
>> index 8f59ec574e4e..5d1df5d7dc46 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
>> +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
>> @@ -23,10 +23,14 @@ long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg);
>>  
>>  struct xe_exec_queue *xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx);
>>  
>> +int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q);
>> +
>
> I'd probably stick this implementation xe_guc_submit.c as even though
> this EU debug specific, IMO you don't really need to compile this part
> out as surely if EU kconfig is unset EXEC_QUEUE_EUDEBUG_FLAG_ENABLE
> would be clear. Maybe ask others about where to stick this, as my
> opinion on this isn't strong either way.

I tucked it in xe_guc_submit.c without config switch. Much more
straightforward. Thanks.
-Mika

>
> Matt
>
>>  #else /* CONFIG_DRM_XE_EUDEBUG */
>>  
>>  static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable) { }
>>  
>> +static inline int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q) { return 0; }
>> +
>>  #endif /* CONFIG_DRM_XE_EUDEBUG */
>>  
>>  #endif /* _XE_EUDEBUG_HW_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 16f78376f196..da264c1cfe76 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -21,6 +21,7 @@
>>  #include "xe_assert.h"
>>  #include "xe_devcoredump.h"
>>  #include "xe_device.h"
>> +#include "xe_eudebug_hw.h"
>>  #include "xe_exec_queue.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gpu_scheduler.h"
>> @@ -655,6 +656,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>  	if (xe_exec_queue_is_lr(q))
>>  		xe_exec_queue_get(q);
>>  
>> +	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
>> +		xe_eudebug_exec_queue_enable(q);
>> +
>>  	set_exec_queue_registered(q);
>>  	trace_xe_exec_queue_register(q);
>>  	if (xe_exec_queue_is_parallel(q))
>> -- 
>> 2.43.0
>> 
