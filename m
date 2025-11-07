Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7578CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 13:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3AA10EACE;
	Fri,  7 Nov 2025 13:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBgi20R5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5403510EACE
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762523577; x=1794059577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXoR+Cv8ZhMwy4WQjy/yigXaOY0PxZ1vife6cJ8zH04=;
 b=HBgi20R5qnggw7qBOVKVuZi6z3GZJykNbLfJxcx6LXAGLRnUw4GqnuwV
 qnV6DghtdcObKBXZLu3TusPgCg6Ts1ZfZ5JRUef2lrGZzxtZPZuvEa+5z
 HA4GrvK9D0fd/xy35X6cCfeMXwxCVKGyQCw1Tpm2qry6ppL+iCyljk2x0
 nUldVM7SVlHBXRXtxLCKJOJIlA1Q7a8MbUuu32/hECcFxuMUpo0IdYB+M
 3eD5p4Z2eGDqELUKVKjRXyxrezLw+oZTwfQpHXByzSC+6TLNqycv3D7kS
 +bYErn8t4pz6+m0/1La9IJQVXXw8LdiQ3/QQQZw3uGFizHjqaPA4+F7Yb g==;
X-CSE-ConnectionGUID: z6lN75OZTe6JqQHut0WRPQ==
X-CSE-MsgGUID: gZoNKyAITU+QohK4XFE0Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64826574"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64826574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:52:57 -0800
X-CSE-ConnectionGUID: KOizxLkbQLiQUxCJGRjXtA==
X-CSE-MsgGUID: rogVMZczTp+6X2dVlUnugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192135416"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2025 05:52:56 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v3 2/2] drm/xe/vf: Add debugfs entries to test VF double
 migration
Date: Fri,  7 Nov 2025 19:40:16 +0530
Message-ID: <20251107141015.29051-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
References: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
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
  │   ├── vf
  │   │   ├── resfix_start_delay_ms

- resfix_start_delay_ms: delay after sending RESFIX_START marker

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V2 -> V3:
- New commit

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 17f06cd63527..6443997a1408 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bsearch.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -1278,6 +1279,16 @@ static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
 	return ++gt->sriov.vf.migration.resfix_marker;
 }
 
+static inline void vf_post_migration_inject_delay(struct xe_gt *gt)
+{
+	ulong delay_ms = gt->sriov.vf.migration.debug.resfix_start_delay_ms;
+
+	if (delay_ms && vf_resfix_start_marker_supported(gt)) {
+		xe_gt_sriov_dbg(gt, "Post migration delayed %lu msec", delay_ms);
+		msleep(delay_ms);
+	}
+}
+
 static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -1315,6 +1326,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_inject_delay(gt);
+
 	vf_post_migration_rearm(gt);
 
 	err = vf_post_migration_notify_resfix_done(gt, marker);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
index 2ed5b6780d30..2928c65afd15 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
@@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	vfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		debugfs_create_ulong("resfix_start_delay_ms", 0600, root,
+				     &gt->sriov.vf.migration.debug.resfix_start_delay_ms);
+	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 5707bb808d80..9f4a51cbe38e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @debug: Debug hooks for delaying migration */
+	struct {
+		/**
+		 * @debug.resfix_start_delay_ms: Delay in msec
+		 * after RESFIX_START marker is sent to GUC.
+		 */
+		ulong resfix_start_delay_ms;
+	} debug;
 	/**
 	 * @resfix_marker: Marker sent to Guc prior to starting the
 	 * post‑migration.
-- 
2.51.0

