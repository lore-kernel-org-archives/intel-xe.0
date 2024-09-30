Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80046CF649D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4989A10E2CB;
	Mon, 30 Sep 2024 05:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAwl9Z13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26A110E2CA
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673216; x=1759209216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AnirSUMJ55FucRVaeASp0EtW10sYch8ludScZyoe+Uw=;
 b=EAwl9Z136WwvQWX8sy9xEC82Vex153yAKDyfbs4aR991XHCMtEvhUQyo
 S2TF7ZLIO/vqi0J+SxrHL96bvPYxhQ5kN0yTqffj512M/FxkFImJUw6Lz
 sWzAacECfkDJZMqZbSyBb8w5Z44BIqdO/S8LP56WXo+tDFraTKRC+sJst
 Vo+ryEGquDBCr6jbC+ieC79jQ+PRh8C/NJfPJAnteiq29K7J1x1boGtNh
 8WtQOw6fRD/y8/WREXxw0D4URQ2Ll+eu+QfVtdM7aJGPT1UTnQG6jSqYM
 uXIPkajYEiWOXc6hJlazNnbz3+ZCwE2Wpi8Pki91oqewqBrX8iqfM7y0Y A==;
X-CSE-ConnectionGUID: taXofja2RVybec/IOEaTqw==
X-CSE-MsgGUID: MuBLDrzDRtK+7tjfcys67A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367957"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367957"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:36 -0700
X-CSE-ConnectionGUID: r/iDH2PIQhGI7a+jhG4D+g==
X-CSE-MsgGUID: /TP0UqebSVyrRvn8zSnnIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752137"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 05/25] drm/xe/device: Update handling of xe_force_wake_get
 return
Date: Mon, 30 Sep 2024 11:01:29 +0530
Message-Id: <20240930053149.1246339-6-himal.prasad.ghimiray@intel.com>
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
mask, the return value will be 0 for single domains (excluding
XE_FORCEWAKE_ALL) in the event of a failure. Modify the return handling
of xe_force_wake_get() accordingly and pass the return value as input to
xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be escalated/considered as
probing error. It internally WARNS on domain ack failure.

v5
- return unsigned int xe_force_wake_get()

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8e9b551c7033..e885edacf39f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -600,8 +600,8 @@ int xe_device_probe_early(struct xe_device *xe)
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
+	unsigned int fw_ref;
 	u32 reg;
-	int err;
 
 	/* Always enabled/disabled, no runtime check to do */
 	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
@@ -609,9 +609,9 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 
 	gt = xe_root_mmio_gt(xe);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return err;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
 	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
@@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 int xe_device_probe(struct xe_device *xe)
@@ -871,6 +872,7 @@ void xe_device_wmb(struct xe_device *xe)
 void xe_device_td_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
+	unsigned int fw_ref;
 	u8 id;
 
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
@@ -885,7 +887,8 @@ void xe_device_td_flush(struct xe_device *xe)
 		if (xe_gt_is_media_type(gt))
 			continue;
 
-		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
 			return;
 
 		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
@@ -900,22 +903,22 @@ void xe_device_td_flush(struct xe_device *xe)
 				   150, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
 
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	int err;
+	uint fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
 
 	if (!XE_WA(gt, 16023588340))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		return;
 
 	spin_lock(&gt->global_invl_lock);
@@ -925,7 +928,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 	spin_unlock(&gt->global_invl_lock);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
-- 
2.34.1

