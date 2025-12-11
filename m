Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E12D43359
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1C910E812;
	Thu, 11 Dec 2025 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byPoIFit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCC510E274
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486838; x=1797022838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lMo9b1C/wb9LWMD0tYIjsj5AnwWxN3WWwziTSdheR0=;
 b=byPoIFitx1KsVCLoKrqTOZimUCt6x+Roib7FYHVn/tH94lLguHKGSih/
 3bBxI6dJ1fRhsWyRehfIL5+p5pveutZOOj/di30xS9jD0YgfVJGcy4eYj
 AqFS5GCSPKQdaACf/7XsbbA5ypDkD48lrmM1MwubqeS/utRiPeAB6oJom
 GlNK3FVMx7HjMXJwGpDGBPb83Xa8lg6DkHUMCH60ps6B9OsR61S/65Hz6
 TyPpv+BX2hlJ01YNOR4Ng69PeVnDnt9+G1IMEPMR+DU5IJyyxPXZQnfO9
 GfKTJvwSpQR+CRAvW3/E70860VCBmQ34OFlb9+JSEFg/+wmLra02b/lJP w==;
X-CSE-ConnectionGUID: 5Y2N/eZASfCYhJx3fPq7EA==
X-CSE-MsgGUID: 8sbWt0abQ6CyFOnhnNOKTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67649718"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67649718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
X-CSE-ConnectionGUID: 7uxt5eFdSlmLKXVySMCi0w==
X-CSE-MsgGUID: hGbWXPgqRf2gsNFI5pP3iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234297944"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH 1/6] drm/xe: Adjust long-running workload timeslices to
 reasonable values
Date: Thu, 11 Dec 2025 13:00:27 -0800
Message-Id: <20251211210032.1520113-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211210032.1520113-1-matthew.brost@intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

A 10ms timeslice for long-running workloads is far too long and causes
significant jitter in benchmarks when the system is shared. Adjust the
value to 5ms for preempt-fencing VMs, as the resume step there is quite
costly as memory is moved around, and set it to zero for pagefault VMs,
since switching back to pagefault mode after dma-fence mode is
relatively fast.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 5 ++++-
 drivers/gpu/drm/xe/xe_vm_types.h | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c2012d20faa6..4648f8a458cf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1508,7 +1508,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
-	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
+	if (flags & XE_VM_FLAG_FAULT_MODE)
+		vm->preempt.min_run_period_ms = 0;
+	else
+		vm->preempt.min_run_period_ms = 5;
 
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3bf912bfbdcc..18bad1dd08e6 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -263,7 +263,7 @@ struct xe_vm {
 		 * @min_run_period_ms: The minimum run period before preempting
 		 * an engine again
 		 */
-		s64 min_run_period_ms;
+		unsigned int min_run_period_ms;
 		/** @exec_queues: list of exec queues attached to this VM */
 		struct list_head exec_queues;
 		/** @num_exec_queues: number exec queues attached to this VM */
-- 
2.34.1

