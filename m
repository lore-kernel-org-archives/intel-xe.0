Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D7CD59D84
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEA410E92C;
	Fri, 12 Dec 2025 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlZcgqPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD110E92D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564134; x=1797100134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nwh55nG3Iqpom+o2fnmaZfMqH7jBQrD/QrAfrR46uyE=;
 b=PlZcgqPPbaM6jDMkDbaTEKp52lznze/SVpBs0iSZ6DryRtXrw8RNXMmB
 VNPvK5bi7Ry3B2V2NsAa2wB9SVDTItjYZxmLuxtYe6mSZP5QRSceOpst/
 ik5UJRyEnoPgqgOqeu9B37ST+znDQuINRLt0xyKrhVewiGegzM/4ZwZca
 m9bXH6Q3ra1H1qGym74z9U1NvYzx/xUNyTkItl9ga93h5nVeb0ZT+8sNT
 uqnC0xytMi5ZEDEFrfKBafqfyN6JR+QvuIU6qeuRTrd3ofnDluUrx0O5y
 PhNtLbbvO89Vz5bgdsDrFFizc0TX+7dqKdQhp+6mBHUG+/FSvOWqPJh1w Q==;
X-CSE-ConnectionGUID: 3mktfr8YTMekyzTrO0g1zA==
X-CSE-MsgGUID: 3WYBnW4WRm+6Od6AlxQ+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432796"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: He27vuvARXC6e8bv4LlEdg==
X-CSE-MsgGUID: Z1bY7ft7QMmHiwbwonXQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633940"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 1/7] drm/xe: Adjust long-running workload timeslices to
 reasonable values
Date: Fri, 12 Dec 2025 10:28:41 -0800
Message-Id: <20251212182847.1683222-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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
Cc: stable@vger.kernel.org
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

