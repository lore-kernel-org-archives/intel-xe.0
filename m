Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032B9CD342D
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 23:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12C110E091;
	Wed, 12 Nov 2025 23:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kt0oONfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37B10E091
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 23:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762991905; x=1794527905;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MRK+y9CJ33fJHkMnXEW9hKIUIomLCkog1CDLPYzhATk=;
 b=Kt0oONflvLof0h43tcn5SNr4xn3VVsEJJ2+//ZopvUrw3WSYN3kwMBnQ
 2ar9D3Mk7mpa/6tlYpAtV+QuwBTO9Tutp3DNymNvftroLxqRBabjRupiu
 BrGMiD+ehKa+ztuCYuLp04K3PTo2eOy8Zai41VgSvjE41uqyF+Mp+OM2j
 8suY5FMdYPmFF9dDXxoOAjCgvHMzB0JsluS+GSdtM4dedmWNY9CJZSDxW
 FRo7urdWDze/vacIRArfh36rs9f2NUiKyrmlMmq8YIPCkya5jDq2uH5ek
 CqBzZRfAXbw0eJT2Tg5gZJ1QkQnjDOiC0nJEQpiz55+pPoqY9Reo+ig83 A==;
X-CSE-ConnectionGUID: xa3Jp2q3Q+SJgGuzl+mhmg==
X-CSE-MsgGUID: VmY6vSDnQe+KiDICqSEvNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76413582"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="76413582"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:58:25 -0800
X-CSE-ConnectionGUID: BG0nnzSnQ/OvQN5Mva1nFw==
X-CSE-MsgGUID: tRJOdtiJQqizLHlUpT0w7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189535586"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa008.jf.intel.com with ESMTP; 12 Nov 2025 15:58:25 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4] drm/xe/uc: Add stop on hardware initialization error
Date: Wed, 12 Nov 2025 18:44:53 -0500
Message-Id: <20251112234453.1871032-1-zhanjun.dong@intel.com>
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
v4: Add memory leak fix
    Switch to xe_uc_stop
v3: Switch to xe_guc_stop
v2: Switch to xe_guc_ct_stop
---
 drivers/gpu/drm/xe/xe_guc.c | 3 ++-
 drivers/gpu/drm/xe/xe_uc.c  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e..b4c9673f84d6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -661,6 +661,7 @@ static void guc_fini_hw(void *arg)
 	unsigned int fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_guc_stop(guc);
 	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
@@ -1598,7 +1599,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
 void xe_guc_stop(struct xe_guc *guc)
 {
 	xe_guc_ct_stop(&guc->ct);
-
+	xe_guc_submit_reset_prepare(guc);
 	xe_guc_submit_stop(guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..6c72ce305d6c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_uc_stop(uc);
 	xe_guc_sanitize(&uc->guc);
 	return err;
 }
@@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_uc_stop(uc);
 	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
-- 
2.34.1

