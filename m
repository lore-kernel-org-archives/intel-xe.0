Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E3CFA466
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 15:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB21610E2F8;
	Mon, 24 Nov 2025 15:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld48akWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670E610E2F8
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763999399; x=1795535399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bLiwjeYFZq9UfseauLgmRGHTsqbRiqqp+40yxoRgtcY=;
 b=Ld48akWWWnQNfL1tA/BI+n4pce4gppGcv845nLU3lPel1PTQrwH02zxn
 6jF+dvEll1DfuKfqezmQ3CSi6PuW/lZICh4B+fb184y4+zge2Rb4ZdufY
 Jf5w5pwYFd1lJCrHJ6D1n+ZEg/Vg7WWqTcVsBYAGq1TY6xlDASJCn0eZX
 cQOsoRzYFOWXXLO2o1+H9fx61Jl6oSJYJcCD2AOTZAzn4ugie/zvuRLIz
 iN1sdeEJJnyjpHkP83dnnj8gdpcWhXvM1S/XqTCcBmfTyUFxMZlKgkLeO
 EfmWdbRuJKTVeANs/f3SoW/WXNPEV71HM62a0Hm2BQGHz7H5gWDUT/AUX g==;
X-CSE-ConnectionGUID: emJUcX6bThO+U2z4+ULRAA==
X-CSE-MsgGUID: nQxJElHCRlee1HGTgluj/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65002177"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65002177"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 07:49:59 -0800
X-CSE-ConnectionGUID: d4ge//BETxWdYIQoNYuYbw==
X-CSE-MsgGUID: FaKdqcvEQqKkUYmbUYVS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196662215"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 07:49:57 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v6 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
Date: Mon, 24 Nov 2025 21:37:23 +0530
Message-ID: <20251124160719.29812-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
References: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
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
its corresponding bit is cleared.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V5 -> V6:
- Fixed review comments (Michal W).
- Removed timeout and VF KMD waits infinately when resfix_stoppers bits are
set.
- Created helper macro for WAIT positions.

V4 -> V5:
- Updated debugfs entries (Michal W).

V3 -> V4:
- New commit

V2 -> V3:
- None.

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 38 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8e3fba6521f0..aabc3064c3ef 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bsearch.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -1228,6 +1229,35 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
 	return vf_resfix_done(gt, marker);
 }
 
+#define VF_MIGRATION_WAIT_NO_WAIT			0
+#define VF_MIGRATION_WAIT_BEFORE_RESFIX_START		BIT(0)
+#define VF_MIGRATION_WAIT_BEFORE_FIXUPS			BIT(1)
+#define VF_MIGRATION_WAIT_BEFORE_RESTART_JOBS		BIT(2)
+#define VF_MIGRATION_WAIT_BEFORE_RESFIX_DONE		BIT(3)
+
+#define VF_MIGRATION_WAIT_DELAY_IN_MS			1000
+
+#define VF_MIGRATION_INJECT_WAIT(gt, _POS) ({	\
+	struct xe_gt *__gt = (gt);		\
+	vf_post_migration_inject_wait(__gt, VF_MIGRATION_WAIT_##_POS); \
+	})
+
+#ifdef CONFIG_DRM_XE_DEBUG
+static void vf_post_migration_inject_wait(struct xe_gt *gt, int wait)
+{
+	uint delay_ms = VF_MIGRATION_WAIT_DELAY_IN_MS;
+
+	while (gt->sriov.vf.migration.debug.resfix_stoppers &  wait) {
+		xe_gt_dbg(gt, "*TESTING* injecting delay due to resfix_stoppers = 0x%x\n",
+			  gt->sriov.vf.migration.debug.resfix_stoppers);
+
+		msleep(delay_ms);
+	}
+}
+#else
+static void vf_post_migration_inject_wait(struct xe_gt *gt, int wait) { }
+#endif
+
 /*
  * Reset the marker to 1 after it overflows since GuC requires a non-zero
  * marker to be set.
@@ -1266,18 +1296,26 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 		goto fail;
 	}
 
+	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_RESFIX_START);
+
 	marker = vf_post_migration_resfix_start_marker(gt);
 
 	err = vf_resfix_start(gt, marker);
 	if (err)
 		goto fail;
 
+	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_FIXUPS);
+
 	err = vf_post_migration_fixups(gt);
 	if (err)
 		goto fail;
 
+	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_RESTART_JOBS);
+
 	vf_post_migration_rearm(gt);
 
+	VF_MIGRATION_INJECT_WAIT(gt, BEFORE_RESFIX_DONE);
+
 	err = vf_post_migration_resfix_done(gt, marker);
 	if (err == -EREMCHG)
 		goto queue;
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

