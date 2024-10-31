Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41071D767F4
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7DF10E03D;
	Thu, 31 Oct 2024 18:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B20FYq4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1074310E03D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2aTP8B++ygDDzk2FmAVXJFbZ8iRz1X4FqbKUegQk9M=;
 b=B20FYq4hqgvFC0XpNW11I3wPFicPKboRjgQN5rlFGPgEP0KdsTDETkOh
 VEtg8N+Gn6aMD2ze5saCokYz7567u3kQ3vTCsFbFLyng4/IJc1Wushzoi
 i+G1pgzNx5YBmpKktEjiTgxoc/PBacM0Lm1Ozlc2wxclI9ieBvHxbXq2h
 1/SnwcSv0foZEVW49I/btH1o3MtgYb9bltkLjG41ZPIZ4a2QUXNorDK4I
 PipePJrxXOq1aOeUBzorAj6eirZRIQqVsjJHw4l3oOvMLHFVIqwb5VatX
 OYl0oegv2tDbkAzKxzPTffxC0DrZ7Nbg6dfeamElZ2WfasLbgzwmmt79x Q==;
X-CSE-ConnectionGUID: GXikeSweTwmPix6I2oj/Yg==
X-CSE-MsgGUID: vS3imDdPSc2LExGvJHB6Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255870"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255870"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
X-CSE-ConnectionGUID: 8SLuA05UTTu5eAZyM4G59A==
X-CSE-MsgGUID: rT2XIYycQnqgnU0HNpg5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637572"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 4/8] drm/xe: Take PM ref in delayed snapshot capture worker
Date: Thu, 31 Oct 2024 11:10:44 -0700
Message-Id: <20241031181048.2948948-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

The delayed snapshot capture worker can access the GPU or VRAM both of
which require a PM reference. Take a reference in this worker.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Fixes: 4f04d07c0a94 ("drm/xe: Faster devcoredump")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d2679c5d976b..0b0cd6aa1d9f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -23,6 +23,7 @@
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -158,8 +159,11 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 {
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	struct xe_device *xe = coredump_to_xe(coredump);
 	unsigned int fw_ref;
 
+	xe_pm_runtime_get(xe);
+
 	/* keep going if fw fails as we still want to save the memory and SW data */
 	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
@@ -168,6 +172,8 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
+	xe_pm_runtime_put(xe);
+
 	/* Calculate devcoredump size */
 	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
 
-- 
2.34.1

