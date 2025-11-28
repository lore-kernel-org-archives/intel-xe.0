Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7A8CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 15:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E35710E6E8;
	Fri, 28 Nov 2025 15:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckMLzwoM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1990210E6E8
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764342071; x=1795878071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=06ZjRI6yfMwdx8WCui8dE9haeKOsAxwE6OybFaF4khQ=;
 b=ckMLzwoMnKDqRpvDxx2CzuaDBHCuaBN81RwoBFuedcjy79976mZAb4N3
 E5320DjRGrul0Pdp0eXGHO0wo2adlrWRIuWN3Ll5loLua6gnkN2+Dxb67
 RJU4el+VnGnzv6Mf19SaDwJo5dWjxRK7Bf3WJ+bc9zLrpmtikmc670VyC
 3II4Rnk8KKPNaT4eMhAm533iYkeKaWa1oYeufVBUTrC/BN3Xd+/FBjPyM
 jFp3nU9K2vKI7o35TlZawf/ewAwNxNX+fVIM+pkYCoZ4tRnYeUkJ+i429
 Z5wZ7s9S3CtnKCk1RFAk2NeT8cFmMLeMOuhg6EA2V7B6W38/yoqS/1i8X A==;
X-CSE-ConnectionGUID: +lgbkE6TQJqIcLdN16n9UA==
X-CSE-MsgGUID: R9XQsRzzShmWAnp78zk+5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77734794"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="77734794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 07:01:10 -0800
X-CSE-ConnectionGUID: kporFnuXTju/Dlfq3K3Kbg==
X-CSE-MsgGUID: KKuxF+BaQ46S1nVeT3W7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="192597563"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa006.jf.intel.com with ESMTP; 28 Nov 2025 07:01:10 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 stuart.summers@intel.com, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8] drm/xe/uc: Add stop on hardware initialization error
Date: Fri, 28 Nov 2025 10:01:09 -0500
Message-Id: <20251128150109.3064876-1-zhanjun.dong@intel.com>
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
change xe_guc_submit_pause_abort to xe_guc_submit_clear_all to free all
contexts.

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
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
 drivers/gpu/drm/xe/xe_guc.c         | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c  | 7 +++----
 drivers/gpu/drm/xe/xe_guc_submit.h  | 2 +-
 drivers/gpu/drm/xe/xe_uc.c          | 8 +++++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4c73a077d314..04f7f5ac0028 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1180,7 +1180,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 
 	wake_up_all(&gt->sriov.vf.migration.wq);
 
-	xe_guc_submit_pause_abort(&gt->uc.guc);
+	xe_guc_submit_clear_all(&gt->uc.guc);
 }
 
 static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d6672cf30d3e..d8235ae69988 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -662,6 +662,12 @@ static void guc_fini_hw(void *arg)
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
 
+	if (guc->submission_state.initialized) {
+		xe_guc_reset_prepare(guc);
+		xe_guc_stop(guc);
+		xe_guc_submit_clear_all(guc);
+	}
+
 	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL)
 		xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e0882074a99..1bb9c03ba1d7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2353,10 +2353,10 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 }
 
 /**
- * xe_guc_submit_pause_abort - Abort all paused submission task on given GuC.
+ * xe_guc_submit_clear_all - Clear all paused submission task on given GuC.
  * @guc: the &xe_guc struct instance whose scheduler is to be aborted
  */
-void xe_guc_submit_pause_abort(struct xe_guc *guc)
+void xe_guc_submit_clear_all(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -2370,8 +2370,7 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
 			continue;
 
 		xe_sched_submission_start(sched);
-		if (exec_queue_killed_or_banned_or_wedged(q))
-			xe_guc_exec_queue_trigger_cleanup(q);
+		guc_exec_queue_kill(q);
 	}
 	mutex_unlock(&guc->submission_state.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b49a2748ec46..ab794ee9ca8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -23,7 +23,7 @@ int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
 void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
-void xe_guc_submit_pause_abort(struct xe_guc *guc);
+void xe_guc_submit_clear_all(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 40aed4a66bac..726bd1bf7e30 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -173,6 +173,9 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	/* Stop guc submission */
+	atomic_fetch_or(1, &uc->guc.submission_state.stopped);
+	xe_uc_stop(uc);
 	xe_guc_sanitize(&uc->guc);
 	return err;
 }
@@ -231,7 +234,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
+	/* Stop guc submission */
+	atomic_fetch_or(1, &uc->guc.submission_state.stopped);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
 	return ret;
 }
 
-- 
2.34.1

