Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB0FCF64A1
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744BF10E2CC;
	Mon, 30 Sep 2024 05:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXQ0u1tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4469E10E05C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673224; x=1759209224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7UfHNC0PCC764YqzyYtTmVv5XJ17pqiwzBq1tpPMqvI=;
 b=kXQ0u1tf3TjK3BD0ZaEZLO3KREKDYZza6STs8NbVVJ5QZrJsXA9S+/pf
 xXZmpG7YJ0O9bbtLE1euyOTv94gdnEnkJCZc3LVaZy2DmnA7P7EFN1CBb
 b1JxgVgas3hcd+JDiEZS12CAobH23umsjlXVZImq0/2PHaRZQWCZ82xiU
 q7JknADqUpYmmT6yO399fweQgZPA0zeao449XPUVRUhIJ6+hIrLlQ9lz6
 6ZKiUuk3mJ/LcL2nr9/BcsbO9jYWWGyQu3jGSdWSLh6dsRNwbD836JpHB
 HB9I5m+2AsNURctqA0RNHERvB/SFKx5qfdp5aKqljxW4cUOCMpNYxwe41 A==;
X-CSE-ConnectionGUID: 5bajHpn4RXy5noJXsPEYhg==
X-CSE-MsgGUID: noy+i9vMSFiBz7CIlET6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367964"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:44 -0700
X-CSE-ConnectionGUID: UV18ckiNQLSL9G4D5a+Dqg==
X-CSE-MsgGUID: 2gTGTp+MSbWU+FW2+NV0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752166"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 09/25] drm/xe/xe_gt_idle: Update handling of
 xe_force_wake_get return
Date: Mon, 30 Sep 2024 11:01:33 +0530
Message-Id: <20240930053149.1246339-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v4
- Rebase fix

v5
- return unsigned int for xe_force_wake_get()
- Remove reudandant WARN calls.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 531924b6c0a1..125db68d9e67 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -106,6 +106,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
+	unsigned int fw_ref;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -132,7 +133,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (xe->info.skip_guc_pc) {
 		/*
 		 * GuC sets the hysteresis value when GuC PC is enabled
@@ -143,12 +144,13 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
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
@@ -156,9 +158,9 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	gtidle->powergate_enable = 0;
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -177,7 +179,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	int err, n;
+	unsigned int fw_ref;
+	int n;
 	/*
 	 * Media Slices
 	 *
@@ -213,14 +216,14 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
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
@@ -303,13 +306,14 @@ static void gt_idle_fini(void *arg)
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

