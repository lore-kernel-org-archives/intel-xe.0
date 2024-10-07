Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06479CFB442
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C686F10E30A;
	Mon,  7 Oct 2024 06:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6TQ/HiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBA610E30A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283329; x=1759819329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gtsAsqD60YxpaW/0FXm/RQ+4jIRaQx0qLCzq2kvTdk=;
 b=O6TQ/HiQlaj/sPDxsAPUzSz31WB3C9pvApHGArDWvoIM+9j0DAqm50NU
 p/R7KHETwx15EHzP+bLyASLRE0cRWXUtYldYoCV36J5b6jiX1MVRoVfzH
 sFSa01amVt6G4owxT/dMIlAju7MiE7TTqPlaGSQ5asXsMlwGte4V3yNlM
 9lr1GSS+0+sF+qfMgtyXBVWH0316wbDfpLIeiDyliu0+STOZCU6bqkrfj
 QYuk7BbIGg/2sbSVvIeDBll1ps6jfua97Af8IqsIkp+oOydG4jowp50/A
 GbiEsiShpGXaaDAkO4Ct9W27Qz3hPELuvN6EgKp7frxhLAYf1YrMREh6v Q==;
X-CSE-ConnectionGUID: 9sXhZCw/TmKhXMpUf+CGLw==
X-CSE-MsgGUID: js+eGjrsTFKOyBU9D0Ycwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548444"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:09 -0700
X-CSE-ConnectionGUID: evj14+SmQgqUb1Zi4tI83g==
X-CSE-MsgGUID: mCXF2C3rTFGT7owIRuj7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842425"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 10/26] drm/xe/xe_gt_idle: Update handling of
 xe_force_wake_get return
Date: Mon,  7 Oct 2024 12:30:01 +0530
Message-Id: <20241007070017.1732886-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v4
- Rebase fix

v5
- return unsigned int for xe_force_wake_get()
- Remove reudandant WARN calls.

v7
- Fix commit message

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 746812aee8ff..fd80afeef56a 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -101,6 +101,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
+	unsigned int fw_ref;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -127,7 +128,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (xe->info.skip_guc_pc) {
 		/*
 		 * GuC sets the hysteresis value when GuC PC is enabled
@@ -138,12 +139,13 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
 	struct xe_gt_idle *gtidle = &gt->gtidle;
+	unsigned int fw_ref;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
@@ -151,9 +153,9 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	gtidle->powergate_enable = 0;
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -172,7 +174,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	int err, n;
+	unsigned int fw_ref;
+	int n;
 	/*
 	 * Media Slices
 	 *
@@ -208,14 +211,14 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
 	/* Do not wake the GT to read powergating status */
 	if (state != GT_IDLE_C6) {
-		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (err)
-			return err;
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return -ETIMEDOUT;
 
 		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
@@ -298,13 +301,14 @@ static void gt_idle_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	unsigned int fw_ref;
 
 	xe_gt_idle_disable_pg(gt);
 
 	if (gt_to_xe(gt)->info.skip_guc_pc) {
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 		xe_gt_idle_disable_c6(gt);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	sysfs_remove_files(kobj, gt_idle_attrs);
-- 
2.34.1

