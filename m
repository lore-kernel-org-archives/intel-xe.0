Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22669CF8861
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 14:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CB210E758;
	Thu, 20 Nov 2025 14:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/QpgI71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B3E10E2A9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763649278; x=1795185278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWhqSg1nrIy+0mG49TWNGQmRSZyt6iBdicPZrjdg8lM=;
 b=D/QpgI71GsQio82iSGSm54ps32888jLiagfhaSwH9QNlieHPDuoxNELz
 jQJpRYfq+fr8tvJnMnSiuEULSpRfBJb/BtgxzPibTZTGiUfiCZc/DySxz
 cz2KAw9oCCGhgGJiW4x/qA0QRzzA8WHFBxHRj+f8F/egR4T1s4tHrE/kM
 fcP18DXpIz6ff3Q7LpHTCY251eZE0xXVfcb3K4K8lUAyONdbI7vuC3FNI
 MPJsBv0KhunAdhy7EHn7YJEgh7rAHukRXXY5yK7f6b3hqKfSooEbs9O0u
 kBMDJLcEqIxWRlmI5e0cn8/R7ECxjyxY6Zi4whkv/7vM57y8qxxdO7vbm g==;
X-CSE-ConnectionGUID: B4E7Y0fXQeufngq3PwTeHg==
X-CSE-MsgGUID: 7Lc3KMgYTZqpRJFL7idMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65418632"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65418632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:34:38 -0800
X-CSE-ConnectionGUID: rrunwlsPTKq5/UKHm1A1og==
X-CSE-MsgGUID: buGHSykeR/y8FpMH6d9wIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="228689576"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 20 Nov 2025 06:34:37 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v5 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
Date: Thu, 20 Nov 2025 20:22:01 +0530
Message-ID: <20251120145157.6995-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
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

VF migration sends a marker to the GUC before resource fixups begin,
and repeats the marker with the RESFIX_DONE notification. This prevents
the GUC from submitting jobs during double migration events.

To reliably test double migration, a second migration must be triggered
while fixups from the first migration are still in progress. Since fixups
complete quickly, reproducing this scenario is difficult. Introduce
debugfs controls to add delays in the post-fixup phase, creating a
deterministic window for subsequent migrations.

New debugfs entries:
	/sys/kernel/debug/dri/<card>/
	├── gt0
	│   ├── vf
	│   │   ├── resfix_stoppers

- resfix_stoppers: Predefined checkpoints that allow the migration process
to pause at specific stages. The stages are given below.

VF_MIGRATION_WAIT_BEFORE_RESFIX_START	- BIT(0)
VF_MIGRATION_WAIT_BEFORE_FIXUPS		- BIT(1)
VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS	- BIT(2)
VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE	- BIT(3)

Each state will pause with a 1-second delay per iteration, continuing until
its corresponding bit is cleared or a maximum of 10 iterations is reached.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V4 -> V5:
- Updated debugfs entries (Michal W).

V3 -> V4:
- New commit

V2 -> V3:
- None.

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 37 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1cd3d8204c15..0f25091f4949 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bsearch.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -1234,6 +1235,34 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
 	return vf_notify_resfix_done(gt, marker);
 }
 
+#define VF_MIGRATION_WAIT_NO_WAIT			0
+#define VF_MIGRATION_WAIT_BEFORE_RESFIX_START		BIT(0)
+#define VF_MIGRATION_WAIT_BEFORE_FIXUPS		BIT(1)
+#define VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS		BIT(2)
+#define VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE		BIT(3)
+
+#define VF_MIGRATION_WAIT_DELAY_PER_ITER_IN_MS		1000
+#define VF_MIGRATION_WAIT_DELAY_MAX_ITERS		10
+
+#ifdef CONFIG_DRM_XE_DEBUG
+static inline void vf_post_migration_inject_wait(struct xe_gt *gt, int wait)
+{
+	uint delay_ms = VF_MIGRATION_WAIT_DELAY_PER_ITER_IN_MS;
+	int max_delay_iter = VF_MIGRATION_WAIT_DELAY_MAX_ITERS;
+
+	while ((gt->sriov.vf.migration.debug.resfix_stoppers &  wait) &&
+	       max_delay_iter--) {
+		xe_gt_dbg(gt,
+			  "*TESTING* injecting delay resfix_stoppers = 0x%x, remaining iters = %d\n",
+			  gt->sriov.vf.migration.debug.resfix_stoppers, max_delay_iter);
+
+		msleep(delay_ms);
+	}
+}
+#else
+static inline void vf_post_migration_inject_wait(struct xe_gt *gt, int wait) { }
+#endif
+
 /*
  * Increment the startup marker again if it overflows, since GUC
  * requires a non-zero marker to be set.
@@ -1270,18 +1299,26 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 		goto fail;
 	}
 
+	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESFIX_START);
+
 	marker = vf_post_migration_resfix_start_marker(gt);
 
 	err = vf_notify_resfix_start(gt, marker);
 	if (err)
 		goto fail;
 
+	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_FIXUPS);
+
 	err = vf_post_migration_fixups(gt);
 	if (err)
 		goto fail;
 
+	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS);
+
 	vf_post_migration_rearm(gt);
 
+	vf_post_migration_inject_wait(gt, VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE);
+
 	err = vf_post_migration_notify_resfix_done(gt, marker);
 	if (err && err != -EAGAIN)
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
index 2ed5b6780d30..66d5ffd0e371 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	vfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
+				  &gt->sriov.vf.migration.debug.resfix_stoppers);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 66c0062a42c6..3ece00f74e46 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @debug: Debug hooks for delaying migration */
+	struct {
+		/**
+		 * @debug.resfix_stoppers: Stop and wait at different stages
+		 * during post migration recovery
+		 */
+		u8 resfix_stoppers;
+	} debug;
 	/**
 	 * @resfix_marker: Marker sent on start and on end of post-migration
 	 * steps.
-- 
2.51.0

