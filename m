Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE2EE4983
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 09:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114610E97E;
	Wed, 11 Sep 2024 09:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbR2rF7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1252B10E97E
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726047189; x=1757583189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n4GVUMDj+MR07pejmMHjB5SDS+2cNJyAjgJgxqhDNy4=;
 b=fbR2rF7+pbaASCr4jcCIblB+TjcZL43lhr7zRbGuCRYesdlEETIDPVfi
 8xBWEKF2amzZbpVroh+fGhZJ561HulaLtmihkP1j3vezjetTupEasx98I
 ht5XD4P6UA+Nt7Wc1ON1MAnbDYzUVlTMRJVmHVw98dzjgVOYtLEqOnweh
 SkTUFONIodawOHB35J+iO98e4FFc2nZlo0vSUnW0IeVeMfuyk7Him5c6N
 HaNu34MwR4XjpjMCYGueow7SS67FYYJTLapfLNtWO1MObHGT8jxyTGYJz
 5c7HXBPWBocQprDom5Fp1KKS4skYN23plimABFR05grj2nYR7H1VRpbtH g==;
X-CSE-ConnectionGUID: qO8jPbQRSOaxjGDK2dvzlw==
X-CSE-MsgGUID: 6m3vP5IWSlK4McF5ATTN1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36188653"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="36188653"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 02:32:55 -0700
X-CSE-ConnectionGUID: WWEH475RQ+q2dDlLEax0Ow==
X-CSE-MsgGUID: QREL6L5bShCSdoheqvz9qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="66938229"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2024 02:32:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Date: Wed, 11 Sep 2024 15:00:25 +0530
Message-ID: <20240911093026.643605-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
funtions to avoid cirular locking dependency because of locks
being taken in intel_fbdev, intel_dp_mst_mgr suspend and resume
functions.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a3d1509066f7..7f33e553728a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -363,6 +363,18 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
+	/*
+	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
+	 * also checks and delets bo entry from user fault list.
+	 */
+	mutex_lock(&xe->mem_access.vram_userfault.lock);
+	list_for_each_entry_safe(bo, on,
+				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
+		xe_bo_runtime_pm_release_mmap_offset(bo);
+	mutex_unlock(&xe->mem_access.vram_userfault.lock);
+
+	xe_display_pm_runtime_suspend(xe);
+
 	/*
 	 * The actual xe_pm_runtime_put() is always async underneath, so
 	 * exactly where that is called should makes no difference to us. However
@@ -386,18 +398,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	xe_rpm_lockmap_acquire(xe);
 
-	/*
-	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
-	 * also checks and delets bo entry from user fault list.
-	 */
-	mutex_lock(&xe->mem_access.vram_userfault.lock);
-	list_for_each_entry_safe(bo, on,
-				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
-		xe_bo_runtime_pm_release_mmap_offset(bo);
-	mutex_unlock(&xe->mem_access.vram_userfault.lock);
-
-	xe_display_pm_runtime_suspend(xe);
-
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
@@ -438,8 +438,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	xe_rpm_lockmap_acquire(xe);
-
 	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
@@ -463,6 +461,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_display_pm_runtime_resume(xe);
 
+	xe_rpm_lockmap_acquire(xe);
+
 	if (xe->d3cold.allowed) {
 		err = xe_bo_restore_user(xe);
 		if (err)
-- 
2.43.2

