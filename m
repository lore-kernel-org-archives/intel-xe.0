Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC865D116F8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 09:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE4F10E359;
	Mon,  1 Dec 2025 09:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mr2Nyjku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848CF10E359
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581571; x=1796117571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UGdjf6qUdi8HZc6uoBoJIZc7AGZq3Fs038FHJa5DFNY=;
 b=Mr2NyjkuovcHnVIiWc2IO755l0QgZ/0rOShRp3B7lCPptCGazNMaB1HB
 Yu7+7P4qpY/ixqUjZjtIp+Qj28S/NS1VHDYpgEd3iZDba1NtX8jDUyKcY
 BGqzh75sD0dZH4WQIrdfkNiopBuoarIaPkSxGpjPNNEEz7yAD1IMxJKw7
 jn0olv7yOeLQWIMExPI8HeQU7fSpTfal4fBpq/dElruDSorlMxA3/Kurk
 KfjpdMut/gQHL6lOW6sNCB0YlFgrrBECiTnWgq4GWv1PoVlz+Tm7WRe0d
 PhTa5PKpPlE/sghU58d7eyA9zNk0hYNhsyEQXGH0qkhYm3gjufqkPe1od g==;
X-CSE-ConnectionGUID: DSxYIqd1QB6X2p/genLtew==
X-CSE-MsgGUID: RrGOL1QBQtq6i3glzaP35Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89164425"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89164425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:32:50 -0800
X-CSE-ConnectionGUID: gXSQDpEcRKKPtDkNb7H23g==
X-CSE-MsgGUID: fhdsiBc1QEKHkA4ckMAdTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198379570"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 01:32:48 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v8 4/4] drm/xe/vf: Add debugfs entries to test VF double
 migration
Date: Mon,  1 Dec 2025 15:20:16 +0530
Message-ID: <20251201095011.21453-10-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
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
	/sys/kernel/debug/dri/BDF/
	├── tile0
	│   ├─gt0
	│   │ ├──vf
	│   │ │  ├── resfix_stoppers

resfix_stoppers: Predefined checkpoints that allow the migration process
to pause at specific stages. The stages are given below.

VF_MIGRATION_WAIT_RESFIX_START		- BIT(0)
VF_MIGRATION_WAIT_FIXUPS		- BIT(1)
VF_MIGRATION_WAIT_RESTART_JOBS		- BIT(2)
VF_MIGRATION_WAIT_RESFIX_DONE		- BIT(3)

Each state will pause with a 1-second delay per iteration, continuing until
its corresponding bit is cleared.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Acked-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V7 -> V8:
- Fixed review comments (Michal W).
- Fixed issue with checkPatch.pl

V6 -> V7:
- Fixed review comments (Michal W).
- Updated commit message.

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
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 40 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 12 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 +++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 0b3ecb000ff7..3c806c8e5f3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bsearch.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -41,6 +42,37 @@
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
+#ifdef CONFIG_DRM_XE_DEBUG
+enum VF_MIGRATION_WAIT_POINTS {
+	VF_MIGRATION_WAIT_RESFIX_START	= BIT(0),
+	VF_MIGRATION_WAIT_FIXUPS	= BIT(1),
+	VF_MIGRATION_WAIT_RESTART_JOBS	= BIT(2),
+	VF_MIGRATION_WAIT_RESFIX_DONE	= BIT(3),
+};
+
+#define VF_MIGRATION_WAIT_DELAY_IN_MS	1000
+static void vf_post_migration_inject_wait(struct xe_gt *gt,
+					  enum VF_MIGRATION_WAIT_POINTS wait)
+{
+	while (gt->sriov.vf.migration.debug.resfix_stoppers & wait) {
+		xe_gt_dbg(gt,
+			  "*TESTING* injecting %u ms delay due to resfix_stoppers=%#x, to continue clear %#x\n",
+			  VF_MIGRATION_WAIT_DELAY_IN_MS,
+			  gt->sriov.vf.migration.debug.resfix_stoppers, wait);
+
+		msleep(VF_MIGRATION_WAIT_DELAY_IN_MS);
+	}
+}
+
+#define VF_MIGRATION_INJECT_WAIT(gt, _POS) ({					\
+	struct xe_gt *__gt = (gt);						\
+	vf_post_migration_inject_wait(__gt, VF_MIGRATION_WAIT_##_POS);		\
+	})
+
+#else
+#define VF_MIGRATION_INJECT_WAIT(_gt, ...)	typecheck(struct xe_gt *, (_gt))
+#endif
+
 static int guc_action_vf_reset(struct xe_guc *guc)
 {
 	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
@@ -320,6 +352,8 @@ static int vf_resfix_start(struct xe_gt *gt, u16 marker)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	VF_MIGRATION_INJECT_WAIT(gt, RESFIX_START);
+
 	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
 
 	return guc_action_vf_resfix_start(guc, marker);
@@ -1158,6 +1192,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	void *buf = gt->sriov.vf.migration.scratch;
 	int err;
 
+	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
+
 	/* xe_gt_sriov_vf_query_config will fixup the GGTT addresses */
 	err = xe_gt_sriov_vf_query_config(gt);
 	if (err)
@@ -1176,6 +1212,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 
 static void vf_post_migration_rearm(struct xe_gt *gt)
 {
+	VF_MIGRATION_INJECT_WAIT(gt, RESTART_JOBS);
+
 	/*
 	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
 	 * must be working at this point, since the recovery did started,
@@ -1206,6 +1244,8 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 
 static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
 {
+	VF_MIGRATION_INJECT_WAIT(gt, RESFIX_DONE);
+
 	spin_lock_irq(&gt->sriov.vf.migration.lock);
 	if (gt->sriov.vf.migration.recovery_queued)
 		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
index 2ed5b6780d30..507718326e1f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -69,4 +69,16 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	vfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
+
+	/*
+	 *      /sys/kernel/debug/dri/BDF/
+	 *      ├── tile0
+	 *          ├── gt0
+	 *              ├── vf
+	 *                  ├── resfix_stoppers
+	 */
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		debugfs_create_x8("resfix_stoppers", 0600, vfdentry,
+				  &gt->sriov.vf.migration.debug.resfix_stoppers);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index db2f8b3ed3e9..510c33116fbd 100644
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

