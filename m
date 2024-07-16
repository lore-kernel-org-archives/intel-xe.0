Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E23C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 13:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F20010E70B;
	Tue, 16 Jul 2024 13:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzk7CosQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9962010E70B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721138106; x=1752674106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IfA4WcDkD8Gdo02akfmIXZsJldNOQjKvB1DxyGnxgCE=;
 b=hzk7CosQ2TEXTOzYzsHgd74FbCfRB1p8IQxyiFpOHDNFvmcoR4giopup
 wl/dg2SDHbsm1QTWHlqBja8jXqKYK74JZ5hXuKoYshqBPpL7h8U/WrgTQ
 CMwZe3d7J1NHxlEGpH9vPYFSgOKlDU2sqii97S9QtpvXqudptIFAI8aAU
 X8jp9Q4iEbdBJkzpFNamIRsi1mRjPhl1XHr76PqKE4GhoGvxiSvWn/w+o
 w/Qxtv9iy73u1P29s7ti1G0v/Yw2O5SZHdVxwWTgm4ZNFI72uGnBnb4Qo
 wgo72km462MnF7AlDoZOluqzH9sqwc5egZkp8Hq2QAqSjgoTByYdmE1hk Q==;
X-CSE-ConnectionGUID: vjRGuiNtRAWRcVXn77v1Rg==
X-CSE-MsgGUID: yue8sRamRnyNcbAbnTLl+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="12572671"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="12572671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 06:55:05 -0700
X-CSE-ConnectionGUID: gZT2ynKtSZ6TNgSI2YZV2A==
X-CSE-MsgGUID: WkSCs4UBTIeTkL/CbNpCpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="54262322"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 06:55:03 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vm: Keep the device awake for TLB inval
Date: Tue, 16 Jul 2024 15:38:55 +0200
Message-ID: <20240716133855.12015-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

GT can suspend while TLB invalidation is happening in the background.
This would cause a TLB timeout when that happens. Keep the device awake
when using fence which doesn't wait for the TLB invalidation to finish.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
Adding strace here for more information:

xe_pm-18095   [001] .....  3493.481048: xe_vma_unbind: dev=0000:00:02.0, vma=ffff8881c3062b00, asid=0x0000f, start=0x0000001a0000, end=0x0000001a1fff, userptr=0x000000000000,
xe_pm-18095   [001] .....  3493.481063: xe_vm_cpu_bind: dev=0000:00:02.0, vm=ffff88812a00d000, asid=0x0000f
xe_pm-18095   [001] .....  3493.481093: xe_gt_tlb_invalidation_fence_create: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
xe_pm-18095   [001] .....  3493.481095: xe_gt_tlb_invalidation_fence_work_func: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
xe_pm-18095   [001] .....  3493.481097: xe_gt_tlb_TL_fence_send: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93
xe_pm-18095   [001] d..1.  3493.481097: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x7000, len=8, tail=44, head=36
kworker/1:2-17900   [001] .....  3493.481302: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
kworker/1:2-17900   [001] .....  3493.481303: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x1, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4
kworker/1:2-17900   [001] .....  3493.481305: xe_exec_queue_stop: dev=0000:00:02.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x0, flags=0x0
xe_pm-18095   [001] .....  3493.756294: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=5, head=0
xe_pm-18095   [001] d..1.  3493.756470: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=10, head=5
kworker/u32:1-17912   [006] d..1.  3493.756535: xe_guc_ctb_g2h: G2H CTB: dev=0000:00:02.0, gt0: action=0x0, len=2, tail=2, head=2
xe_pm-18095   [001] .....  3493.756557: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=15, head=10
xe_pm-18095   [001] .....  3493.756559: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3004, len=3, tail=18, head=10
kworker/1:2-17900   [001] d..1.  3497.951783: xe_gt_tlb_invalidation_fence_timeout: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93

 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b6932cc98ff9..241b7ea00d5f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2700,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	struct dma_fence *fence;
 	int err;
 
+	xe_pm_runtime_get(vm->xe);
 	lockdep_assert_held_write(&vm->lock);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
@@ -2721,6 +2722,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 unlock:
 	drm_exec_fini(&exec);
+	xe_pm_runtime_put(vm->xe);
 	return err;
 }
 
-- 
2.42.0

