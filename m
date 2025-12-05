Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C993D339AA
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 18:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97410E267;
	Fri,  5 Dec 2025 18:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjD49sou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57F710E267
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764958005; x=1796494005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=43P7hEFhrjW7z1aG44SlBtQMs2Avy5M5IxnOezPSE7U=;
 b=AjD49souc4LJO/wVMJd15zWOkd4r13SdogaZyOINQSwCbkaGALxfI4Is
 HneD014yelIi8dfhuwZB8zMEKlRiVPtquvjGP7YUn2avSZgFAO09r01zZ
 wczbfvrRggFh0UfwqDUIxYE+KmL1xOnwYidbVPYGYrDVfENPBmN6NpiRj
 tV0lxswwQNGtsubPV0Abb4/C7L98kA0Cntn91HmHPpnYUR3gNCsLkLd9q
 aQag20jMrD6CcZcPqkhIzw+hT8usBCi6XqYyFd1ixyGy7CWeUgQpGY51t
 awFn9k6LfK5qbnEZ+QySA745bTh4ZCPSJ3vQHZI5juaaZQ+MXX2XQdBSG A==;
X-CSE-ConnectionGUID: bnv5oQSoQAK0xcghl19gIg==
X-CSE-MsgGUID: hbcsZKLwRTaNvWQQuk9A6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="65996892"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="65996892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:06:45 -0800
X-CSE-ConnectionGUID: V42BRLSBRse7CePIv3VhYA==
X-CSE-MsgGUID: Y76srFOYSmC41918RQqLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195174399"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa009.jf.intel.com with ESMTP; 05 Dec 2025 10:06:45 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v10] drm/xe/uc: Add stop on hardware initialization error
Date: Fri,  5 Dec 2025 13:06:42 -0500
Message-Id: <20251205180642.4005099-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

On hardware init fail, the hardware might no longer response, add uc stop
to clean up. At driver unload, all exec_queue items need to be freeed,
change xe_guc_submit_pause_abort to free all contexts.

This will fix memory leak issue like:
[  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 + 00007000]: inserted at
                drm_mm_insert_node_in_range+0x2c0/0x510
                __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
                xe_ggtt_insert_bo+0x1a/0x30 [xe]
                __xe_bo_create_locked+0x1f3/0x930 [xe]
                xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
                xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
                xe_bo_create_pin_map_novm+0x23/0x40 [xe]
                xe_lrc_create+0x1e4/0x17c0 [xe]
                xe_exec_queue_create+0x38a/0x6a0 [xe]
                xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
                xe_uc_load_hw+0xa2/0x290 [xe]
                xe_gt_init+0x357/0xab0 [xe]
                xe_device_probe+0x403/0xa30 [xe]
                xe_pci_probe+0x39a/0x610 [xe]
                local_pci_probe+0x47/0xb0
                pci_device_probe+0xf3/0x260
                really_probe+0xf1/0x3b0
                __driver_probe_device+0x8c/0x180
                device_driver_attach+0x57/0xd0
                bind_store+0x77/0xd0
                drv_attr_store+0x24/0x50
                sysfs_kf_write+0x4d/0x80
                kernfs_fop_write_iter+0x188/0x240
                vfs_write+0x280/0x540
                ksys_write+0x6f/0xf0
                __x64_sys_write+0x19/0x30
                x64_sys_call+0x2171/0x25a0
                do_syscall_64+0x93/0xb80
                entry_SYSCALL_64_after_hwframe+0x7
and:
[  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID manager unclean (1/65535)
[  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1: 	total 65535
[  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1: 	used 1
[  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1: 	range 2..2 (1)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
v10:Add submit initialized helper function (Matthew)
    Call xe_uc_reset_prepare rather than set flag directly (Matthew)
v9: Rebase and keep xe_guc_submit_pause_abort name unchanged
v8: Fix __mutex_lock warning
v7: Clear all queue items by guc_submit_fini/xe_guc_submit_pause_abort (Matthew)
v6: As huc not involved in vf_uc_load_hw, roll back to guc sanitize
v5: Move stop flag set in guc_fini_hw
    Change to uc_sanitize in uc init path
v4: Add memory leak fix
    Switch to xe_uc_stop
v3: Switch to xe_guc_stop
v2: Switch to xe_guc_ct_stop
---
 drivers/gpu/drm/xe/xe_guc.c        |  6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c         |  8 ++++++--
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f0407bab9a0c..3dcf078e111f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -662,6 +662,12 @@ static void guc_fini_hw(void *arg)
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
 
+	if (xe_guc_submit_initialized(guc)) {
+		xe_guc_reset_prepare(guc);
+		xe_guc_stop(guc);
+		xe_guc_submit_pause_abort(guc);
+	}
+
 	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
 		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3f2c8556a66..34c6e8a03013 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -425,6 +425,11 @@ void xe_guc_submit_disable(struct xe_guc *guc)
 	guc->submission_state.enabled = false;
 }
 
+bool xe_guc_submit_initialized(struct xe_guc *guc)
+{
+	return guc->submission_state.initialized;
+}
+
 static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
 {
 	int i;
@@ -992,7 +997,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	 * If device is being wedged even before submission_state is
 	 * initialized, there's nothing to do here.
 	 */
-	if (!guc->submission_state.initialized)
+	if (!xe_guc_submit_initialized(guc))
 		return;
 
 	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
@@ -1994,7 +1999,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
 		return 0;
 
-	if (!guc->submission_state.initialized)
+	if (!xe_guc_submit_initialized(guc))
 		return 0;
 
 	/*
@@ -2418,8 +2423,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 			continue;
 
 		xe_sched_submission_start(sched);
-		if (exec_queue_killed_or_banned_or_wedged(q))
-			xe_guc_exec_queue_trigger_cleanup(q);
+		guc_exec_queue_kill(q);
 	}
 	mutex_unlock(&guc->submission_state.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 100a7891b918..9308da2bd104 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -15,6 +15,7 @@ struct xe_guc;
 int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
+bool xe_guc_submit_initialized(struct xe_guc *guc);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 157520ea1783..60430d56c79c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -173,7 +173,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
+	xe_uc_reset_prepare(uc);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
 	return err;
 }
 
@@ -231,7 +233,9 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
+	xe_uc_reset_prepare(uc);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
 	return ret;
 }
 
-- 
2.34.1

