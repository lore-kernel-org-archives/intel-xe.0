Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44470D30CF4
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 00:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0886810E37F;
	Wed, 14 Jan 2026 00:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqAb3KaC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89B010E56E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768349075; x=1799885075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5cEl4dxitwx3kahpArCxUWFTrcE67d0tU7Kp/4r5OjQ=;
 b=hqAb3KaCOqvVDHYLbhFf3gH8mLEMVSa20FcDm2ogcUGi/e2KEd5OefXd
 p70Ect8T/inEBf85JAbfvefNxLI8P288lXWdo0MloyIsgTljPu29g7S5h
 /vYIXewK1ljla6mTVEmlqSNglOoEC1Ez/JSDTd+wSOyvaIyZnLb3OctnN
 N9z4nH1rtGfyI9+vQV6jwFN9ga6p0Yo1YXSTzL9E7iW7LhlWkg3ubDA2o
 J+upZFmWJR8RFx7QdHBGmqmc8IRItUdPuLLvAeYdaTt5MW1w/xw2vGGmK
 QL4JNmtTCHtg9yBGzbwFS7fj8K40zn6b4G4F4t1WuQL5SjRGcIAs+IAK2 w==;
X-CSE-ConnectionGUID: wJNx5fU4Qz+lfEOw8m4yTQ==
X-CSE-MsgGUID: yU5ApYMZQqGyGfRKH9CaIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81010596"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="81010596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:04:34 -0800
X-CSE-ConnectionGUID: ACb2qCG5SdGgi/Pax4c5Sw==
X-CSE-MsgGUID: 7OP82/ilRb2a/qdZG4KZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="203740095"
Received: from dut4344arlh.fm.intel.com ([10.105.10.86])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:04:34 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB invalidations
Date: Wed, 14 Jan 2026 00:04:20 +0000
Message-Id: <20260114000421.331082-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114000421.331082-1-stuart.summers@intel.com>
References: <20260114000421.331082-1-stuart.summers@intel.com>
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

Current hardware does an implicit TLB invalidation on
context switch. This is required for various use cases like
preempt fences where a context switch will happen without
any explicit TLB invalidation from the KMD.

Add a hook to make this explicit as part of the ring
prior to batch execution to allow for more explicit testing
and sequencing of user batch execution.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_sched_job.c    | 7 +++++--
 drivers/gpu/drm/xe/xe_vm.c           | 3 +++
 5 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f689766adcb1..fa193e0b906d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,6 +355,8 @@ struct xe_device {
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
 		u8 has_range_tlb_inval:1;
+		/** @info.has_ring_tlb_inval: Performs TLB invalidations on context switch */
+		u8 has_ring_tlb_inval:1;
 		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
 		u8 has_soc_remapper_sysctrl:1;
 		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5c705124270e..a2ce9da2e3cb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -893,6 +893,7 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_device_atomics_on_smem = 1;
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+	xe->info.has_ring_tlb_inval = graphics_desc->has_ring_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 20acc5349ee6..783ebda6eae1 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -72,6 +72,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
+	u8 has_ring_tlb_inval:1;
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 };
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 39aec7f6d86d..c3b3d9c56dbb 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -246,6 +246,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 void xe_sched_job_arm(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = gt_to_xe(q->gt);
 	struct dma_fence *fence, *prev;
 	struct xe_vm *vm = q->vm;
 	u64 seqno = 0;
@@ -259,9 +260,11 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 			xe_vm_assert_held(q->vm);
 	}
 
-	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
+	if (vm && !xe_sched_job_is_migration(q) &&
+	    (xe->info.has_ring_tlb_inval || !xe_vm_in_lr_mode(vm)) &&
 	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
-		xe_vm_assert_held(vm);
+		if (!xe->info.has_ring_tlb_inval)
+			xe_vm_assert_held(vm);
 		q->tlb_flush_seqno = vm->tlb_flush_seqno;
 		job->ring_ops_flush_tlb = true;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 694f592a0f01..8e0ba2eba21e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1619,6 +1619,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			vm->batch_invalidate_tlb = false;
 		}
 
+		if (xe->info.has_ring_tlb_inval)
+			vm->batch_invalidate_tlb = true;
+
 		/* Fill pt_root after allocating scratch tables */
 		for_each_tile(tile, xe, id) {
 			if (!vm->pt_root[id])
-- 
2.34.1

