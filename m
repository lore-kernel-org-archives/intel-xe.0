Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F2CEE35D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 21:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9596610E204;
	Tue, 18 Nov 2025 21:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UISomkY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB23B10E204
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 21:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763503042; x=1795039042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T5innaCdu0f6ag4kGpRSAEtoqJKZtFWN9uZv/kR0gOw=;
 b=UISomkY9ntVafOM4bdOZ67dDya+xhWvDWhjPoSjtNV0w5bDvHw2yQbW6
 VU9BLNncD9P8dzsLNXg+wOV1pM/4/JK8Rk3te9OTsKoi6UQy0Nn+ayE9N
 vYCpizyZd6rngmt6xC3RtDHzgMg+zHU/rxzqU2UTSnZHledE3X54n5RSp
 ZW8dB7A94v71I+umkpa5eIDIAkaAxz9YQ+Iy0bvP+jkcKxSIqZH+8ABb3
 zs93uDE87IyIs3vLQl5BFnDLtCyqV1bHJD7Mb386zTvgiM83X5Tg+lKCy
 e+DHpLNpq1lk/USna7rzVSededafDeut+uo+GoiX2dpz3pINXj0PDDnYY w==;
X-CSE-ConnectionGUID: Cw8N3f8nQVuKQRZZPSXwMg==
X-CSE-MsgGUID: ieACDa8UQrqHHMHka+jKaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65478997"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65478997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:57:21 -0800
X-CSE-ConnectionGUID: Nod7t07BSY2z1I1X2OIDSg==
X-CSE-MsgGUID: MmALfvJlRBmZSvStUWuX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191115793"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2025 13:57:21 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 stuart.summers@intel.com, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6] drm/xe/uc: Add stop on hardware initialization error
Date: Tue, 18 Nov 2025 16:57:19 -0500
Message-Id: <20251118215719.3628026-1-zhanjun.dong@intel.com>
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

On hardware init fail, the hardware might no longer response, add GuC stop
to clean up exec_queue items.
At driver unload path, add call to GuC stop to clean up queue items. This
clean up will fix memory leak issue like:
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
v6: As huc not involved in vf_uc_load_hw, roll back to guc sanitize
v5: Move stop flag set in guc_fini_hw
    Change to uc_sanitize in uc init path
v4: Add memory leak fix
    Switch to xe_uc_stop
v3: Switch to xe_guc_stop
v2: Switch to xe_guc_ct_stop
---
 drivers/gpu/drm/xe/xe_guc.c | 3 +++
 drivers/gpu/drm/xe/xe_uc.c  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index a686b04879d6..48b0aece5020 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -662,6 +662,9 @@ static void guc_fini_hw(void *arg)
 	struct xe_gt *gt = guc_to_gt(guc);
 	unsigned int fw_ref;
 
+	/* Set stop flag, even submission not initialized */
+	atomic_fetch_or(1, &guc->submission_state.stopped);
+	xe_guc_stop(guc);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..ea0c33f4497e 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_uc_stop(uc);
 	xe_guc_sanitize(&uc->guc);
 	return err;
 }
@@ -228,7 +229,8 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
 	return ret;
 }
 
-- 
2.34.1

