Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C1C761A6
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 11:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4B110EDE5;
	Thu, 30 Mar 2023 11:58:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FBB10EDDC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680177514; x=1711713514;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fn+0FtSTN2pLakXdIbEXiAb7pX0CNcQKCPp/QUWTUgs=;
 b=MQQmva3e4+MspuBaqAHgvM0l/j90FWA49C5I7RHULGqMD8y+p6O+PUZ1
 TStrl95hADGsE4BwObzsSOd0+ADbXhXAwqFRwBmkSvjEfBvP0J/o9KoPF
 2E6F/eLBA8zzor+1vKAKdLRheCX87Vw2OPT4sNHiVSG45N4FA5GSV//8W
 UKoc4ADBulVKdg/qBVYVthwZSKJv1uLntFaufMkLvfI3SQBS8xo8E726C
 wrkMYofqrxDt04Gr5M55en6xGm+lFXsHe2HLxhFuW7qH4oa90XmAnK/tN
 ekzr3vGCmj/jCXJuKLVzbnTZ/DhGllCiY5md+XOTD1S/FGtuN9CQhsUbj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342758553"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="342758553"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="634859880"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="634859880"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:58:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
In-Reply-To: <1aa027f7-27cc-e135-162c-3a04692ecd7c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230313080117.2320-1-michal.wajdeczko@intel.com>
 <ZB3unyFtQlmOFZHS@intel.com>
 <1aa027f7-27cc-e135-162c-3a04692ecd7c@intel.com>
Date: Thu, 30 Mar 2023 14:58:25 +0300
Message-ID: <87zg7u30ym.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 29 Mar 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 24.03.2023 19:40, Rodrigo Vivi wrote:
>> On Mon, Mar 13, 2023 at 09:01:17AM +0100, Michal Wajdeczko wrote:
>>> Duplicating these helpers in almost every .c file was a bad idea.
>>> Define them as inlines in .h file to allow proper reuse.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 74a74051f354..96f6e3f46ed7 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -6,6 +6,7 @@
>>>  #ifndef _XE_GUC_H_
>>>  #define _XE_GUC_H_
>>>  
>>> +#include "xe_gt.h"
>> 
>> sometimes the duplication is better then forcing more dependencies then needed.
>
> IMHO duplication is always bad, and unnecessary dependencies are usually
> as result of another bad decision/placement of needed functionality
>
>> 
>> I'm really not saying that this is the case here... If we are sure that the
>> xe_gt.h was already affecting all the cases that include xe_guc.h then we
>> should go with your patch...
>
> it looks so:
>
> $ cgrep include.*xe_guc\\.h -C 15 | grep include..xe_gt*u*c*\\.h
> ./xe_huc.c-11-#include "xe_gt.h"
> ./xe_huc.c:12:#include "xe_guc.h"
> ./xe_guc_ads.c-13-#include "xe_gt.h"
> ./xe_guc_ads.c:14:#include "xe_guc.h"
> ./xe_irq.c-17-#include "xe_gt.h"
> ./xe_irq.c:18:#include "xe_guc.h"
> ./xe_guc_submit.c-20-#include "xe_gt.h"
> ./xe_guc_submit.c:21:#include "xe_guc.h"
> ./xe_uc.c-9-#include "xe_gt.h"
> ./xe_uc.c:10:#include "xe_guc.h"
> ./xe_gt_pagefault.c-15-#include "xe_gt.h"
> ./xe_gt_pagefault.c:17:#include "xe_guc.h"
> ./xe_guc_debugfs.c-12-#include "xe_gt.h"
> ./xe_guc_debugfs.c:13:#include "xe_guc.h"
> ./xe_guc_hwconfig.c-12-#include "xe_gt.h"
> ./xe_guc_hwconfig.c:13:#include "xe_guc.h"
> ./xe_guc_ct.c-18-#include "xe_gt.h"
> ./xe_guc_ct.c:21:#include "xe_guc.h"
> ./xe_guc.c:6:#include "xe_guc.h"
> ./xe_guc.c-12-#include "xe_gt.h"
> ./xe_gt_tlb_invalidation.c-8-#include "xe_gt.h"
> ./xe_gt_tlb_invalidation.c:9:#include "xe_guc.h"

The metric I've been using for header interdependency is the answer to
this question:

    How many object files would get rebuilt if this header file was
    modified?

Unfortunately, my scripts are currently unable to handle the i915
display code in Xe, but practically all the display files also get
rebuilt when any of the headers with 60+ deps below get modified.

This is the same situation as in i915. We have a ton of headers which
cause practically the entire driver to be rebuilt when modified.

I think it's a failure in abstractions.


BR,
Jani.



drivers/gpu/drm/xe/xe_hw_fence_types.h: 68
drivers/gpu/drm/xe/xe_wopcm_types.h: 67
drivers/gpu/drm/xe/xe_uc_types.h: 67
drivers/gpu/drm/xe/xe_uc_fw_types.h: 67
drivers/gpu/drm/xe/xe_sa_types.h: 67
drivers/gpu/drm/xe/xe_reg_sr_types.h: 67
drivers/gpu/drm/xe/xe_platform_types.h: 67
drivers/gpu/drm/xe/xe_lrc_types.h: 67
drivers/gpu/drm/xe/xe_hw_engine_types.h: 67
drivers/gpu/drm/xe/xe_huc_types.h: 67
drivers/gpu/drm/xe/xe_guc_types.h: 67
drivers/gpu/drm/xe/xe_guc_pc_types.h: 67
drivers/gpu/drm/xe/xe_guc_log_types.h: 67
drivers/gpu/drm/xe/xe_guc_fwif.h: 67
drivers/gpu/drm/xe/xe_guc_ct_types.h: 67
drivers/gpu/drm/xe/xe_guc_ads_types.h: 67
drivers/gpu/drm/xe/xe_gt_types.h: 67
drivers/gpu/drm/xe/xe_force_wake_types.h: 67
drivers/gpu/drm/xe/abi/guc_messages_abi.h: 67
drivers/gpu/drm/xe/abi/guc_klvs_abi.h: 67
drivers/gpu/drm/xe/abi/guc_errors_abi.h: 67
drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h: 67
drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h: 67
drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h: 67
drivers/gpu/drm/xe/abi/guc_actions_abi.h: 67
drivers/gpu/drm/xe/xe_step_types.h: 65
drivers/gpu/drm/xe/xe_device_types.h: 65
drivers/gpu/drm/xe/xe_macros.h: 57
drivers/gpu/drm/xe/regs/xe_reg_defs.h: 54
drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h: 54
drivers/gpu/drm/xe/xe_hw_engine.h: 53
drivers/gpu/drm/xe/xe_gt.h: 53
drivers/gpu/drm/xe/xe_force_wake.h: 46
drivers/gpu/drm/xe/regs/xe_gpu_commands.h: 43
drivers/gpu/drm/xe/xe_device.h: 42
drivers/gpu/drm/xe/xe_vm_types.h: 41
drivers/gpu/drm/xe/xe_pt_types.h: 41
drivers/gpu/drm/xe/xe_bo_types.h: 37
drivers/gpu/drm/xe/xe_bo.h: 32
drivers/gpu/drm/xe/xe_map.h: 26
drivers/gpu/drm/xe/xe_mmio.h: 23
drivers/gpu/drm/xe/xe_engine_types.h: 22
drivers/gpu/drm/xe/xe_sched_job_types.h: 20
drivers/gpu/drm/xe/regs/xe_gt_regs.h: 20
drivers/gpu/drm/xe/xe_sched_job.h: 19
drivers/gpu/drm/xe/xe_vm.h: 17
drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h: 14
drivers/gpu/drm/xe/regs/xe_regs.h: 14
drivers/gpu/drm/xe/xe_guc_engine_types.h: 13
drivers/gpu/drm/xe/xe_trace.h: 12
drivers/gpu/drm/xe/xe_engine.h: 12
drivers/gpu/drm/xe/xe_guc.h: 11
drivers/gpu/drm/xe/xe_lrc.h: 10
drivers/gpu/drm/xe/xe_hw_fence.h: 10
drivers/gpu/drm/xe/xe_ggtt_types.h: 10
drivers/gpu/drm/xe/xe_ggtt.h: 10
drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h: 8
drivers/gpu/drm/xe/xe_ttm_vram_mgr.h: 8
drivers/gpu/drm/xe/xe_pci.h: 8
drivers/gpu/drm/xe/xe_migrate.h: 8
drivers/gpu/drm/xe/tests/xe_test.h: 8
drivers/gpu/drm/xe/regs/xe_engine_regs.h: 8
drivers/gpu/drm/xe/xe_guc_ct.h: 7
drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h: 7
drivers/gpu/drm/xe/xe_res_cursor.h: 6
drivers/gpu/drm/xe/xe_module.h: 6
drivers/gpu/drm/xe/xe_gt_topology.h: 6
drivers/gpu/drm/xe/xe_gt_mcr.h: 6
drivers/gpu/drm/xe/xe_wopcm.h: 5
drivers/gpu/drm/xe/xe_uc_fw.h: 5
drivers/gpu/drm/xe/xe_uc_fw_abi.h: 5
drivers/gpu/drm/xe/xe_rtp_types.h: 5
drivers/gpu/drm/xe/xe_reg_sr.h: 5
drivers/gpu/drm/xe/xe_pm.h: 5
drivers/gpu/drm/xe/xe_mocs.h: 5
drivers/gpu/drm/xe/xe_guc_reg.h: 5
drivers/gpu/drm/xe/xe_display.h: 5
drivers/gpu/drm/xe/xe_bo_evict.h: 5
drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h: 4
drivers/gpu/drm/xe/xe_sync_types.h: 4
drivers/gpu/drm/xe/xe_sync.h: 4
drivers/gpu/drm/xe/xe_step.h: 4
drivers/gpu/drm/xe/xe_rtp.h: 4
drivers/gpu/drm/xe/xe_ring_ops_types.h: 4
drivers/gpu/drm/xe/xe_pt.h: 4
drivers/gpu/drm/xe/xe_pcode.h: 4
drivers/gpu/drm/xe/xe_irq.h: 4
drivers/gpu/drm/xe/xe_guc_submit.h: 4
drivers/gpu/drm/xe/xe_gt_pagefault.h: 4
drivers/gpu/drm/xe/xe_drv.h: 4
drivers/gpu/drm/xe/regs/xe_lrc_layout.h: 4
drivers/gpu/drm/xe/xe_wa.h: 3
drivers/gpu/drm/xe/xe_sa.h: 3
drivers/gpu/drm/xe/xe_reg_whitelist.h: 3
drivers/gpu/drm/xe/xe_preempt_fence_types.h: 3
drivers/gpu/drm/xe/xe_preempt_fence.h: 3
drivers/gpu/drm/xe/xe_huc.h: 3
drivers/gpu/drm/xe/xe_guc_pc.h: 3
drivers/gpu/drm/xe/xe_guc_log.h: 3
drivers/gpu/drm/xe/xe_guc_hwconfig.h: 3
drivers/gpu/drm/xe/xe_gt_sysfs_types.h: 3
drivers/gpu/drm/xe/xe_gt_sysfs.h: 3
drivers/gpu/drm/xe/xe_execlist_types.h: 3
drivers/gpu/drm/xe/xe_execlist.h: 3
drivers/gpu/drm/xe/xe_dma_buf.h: 3
drivers/gpu/drm/xe/xe_bb_types.h: 3
drivers/gpu/drm/xe/xe_bb.h: 3
drivers/gpu/drm/xe/tests/xe_migrate_test.h: 3
drivers/gpu/drm/xe/tests/xe_dma_buf_test.h: 3
drivers/gpu/drm/xe/tests/xe_bo_test.h: 3
drivers/gpu/drm/xe/xe_wait_user_fence.h: 2
drivers/gpu/drm/xe/xe_vm_madvise.h: 2
drivers/gpu/drm/xe/xe_uc.h: 2
drivers/gpu/drm/xe/xe_uc_debugfs.h: 2
drivers/gpu/drm/xe/xe_tuning.h: 2
drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h: 2
drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h: 2
drivers/gpu/drm/xe/xe_ring_ops.h: 2
drivers/gpu/drm/xe/xe_query.h: 2
drivers/gpu/drm/xe/xe_huc_debugfs.h: 2
drivers/gpu/drm/xe/xe_guc_debugfs.h: 2
drivers/gpu/drm/xe/xe_guc_ads.h: 2
drivers/gpu/drm/xe/xe_gt_debugfs.h: 2
drivers/gpu/drm/xe/xe_gt_clock.h: 2
drivers/gpu/drm/xe/xe_exec.h: 2
drivers/gpu/drm/xe/xe_debugfs.h: 2
drivers/gpu/drm/xe/display/ext/intel_pm.h: 2
drivers/gpu/drm/xe/xe_pcode_api.h: 1
drivers/gpu/drm/xe/xe_pat.h: 1
drivers/gpu/drm/xe/display/ext/intel_pch.h: 1
drivers/gpu/drm/xe/display/ext/intel_dram.h: 1
drivers/gpu/drm/xe/display/ext/intel_device_info.h: 1
drivers/gpu/drm/xe/display/ext/i9xx_wm.h: 1
drivers/gpu/drm/xe/display/ext/i915_irq.h: 1
drivers/gpu/drm/xe/xe_vm_doc.h: 0
drivers/gpu/drm/xe/xe_migrate_doc.h: 0
drivers/gpu/drm/xe/xe_bo_doc.h: 0
drivers/gpu/drm/xe/display/xe_de.h: 0
drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h: 0
drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h: 0
drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h: 0
drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h: 0
drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h: 0
drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_config.h: 0
drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h: 0



-- 
Jani Nikula, Intel Open Source Graphics Center
