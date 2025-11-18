Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2473CED617
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 11:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E1F10E488;
	Tue, 18 Nov 2025 11:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUwMlW0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2110910E488
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763466086; x=1795002086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sw/dv7IwgesHbckbgK0PX8C9v/SR+elMfE45CMmsI9w=;
 b=aUwMlW0EDUGrSXkrcLPFrE/4UwDx80L4pi3ezGWCeBfRG7wPrMiiP1hP
 vmvFJk3t65tSpNG9SDjmhMb2NKsZO6QgdqImnYYk0K3VIQM1IQItZYFVW
 bbPHQfphf4SqsAFdaZKY7y26obGq626xzYY23H1fyMC2nnj/DkQI81eBt
 LBQ2+0IWiBOjf46kHJzv0Pp5cR+c5qrGiKTigcpfvC4ksYhBlQYn4mAKT
 Cd4PGGx4bYvDHAQHtVC/pCY5drVzf5HHSZ3jXNVdhkbf7Q95RDbELBpoZ
 edW1yyHvgQ0LCgWOC6YS9/gnCK6dK0P0WEHLe3Z3MCC3i71NNAmA23b// A==;
X-CSE-ConnectionGUID: 488Wpu5+SL2Zaf1y8AggEA==
X-CSE-MsgGUID: F9I/0ouETCGXHMy2y/Ztsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76163444"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76163444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:41:26 -0800
X-CSE-ConnectionGUID: LxsyOQcNToiotRYE8nr5XA==
X-CSE-MsgGUID: ZC4pKPsPR1+QFrEwAmPl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190763778"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 03:41:24 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v4 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
Date: Tue, 18 Nov 2025 11:41:16 +0000
Message-ID: <20251118114116.3429730-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
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
	│   │   ├── resfix_delay_ms

- resfix_delay_ms: delay after sending RESFIX_START marker

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V3 -> V4:
- New commit

V2 -> V3:
- None.

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 08c00b773a13..13ae71dca208 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bsearch.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -1234,6 +1235,16 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
 	return vf_notify_resfix_done(gt, marker);
 }
 
+static inline void vf_post_migration_inject_delay(struct xe_gt *gt)
+{
+	ulong delay_ms = gt->sriov.vf.migration.debug.resfix_delay_ms;
+
+	if (delay_ms) {
+		xe_gt_dbg(gt, "*TESTING* injecting %lu ms delay ...\n", delay_ms);
+		msleep(delay_ms);
+	}
+}
+
 static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -1275,6 +1286,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_inject_delay(gt);
+
 	vf_post_migration_rearm(gt);
 
 	err = vf_post_migration_notify_resfix_done(gt, marker);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
index 2ed5b6780d30..33d6f37d8dd6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	vfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		debugfs_create_ulong("resfix_delay_ms", 0600, vfdentry,
+				     &gt->sriov.vf.migration.debug.resfix_delay_ms);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 66c0062a42c6..e7244e9fd406 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @debug: Debug hooks for delaying migration */
+	struct {
+		/**
+		 * @debug.resfix_delay_ms: Delay in msec after RESFIX_START
+		 * marker is sent to GUC.
+		 */
+		ulong resfix_delay_ms;
+	} debug;
 	/**
 	 * @resfix_marker: Marker sent on start and on end of post-migration
 	 * steps.
-- 
2.43.0

