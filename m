Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC326C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8410E46B;
	Tue,  4 Jun 2024 11:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoJsFA9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3667A10E461
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499846; x=1749035846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrnJCy74LsIzZO+6SHLmgtoxgP37KNROMCKLNFn6HSg=;
 b=hoJsFA9h0TvG6C3bsrWL06s+tcmxKsDE0nYovgMrJdv1XOurIZRy3KKG
 NOwPL43J9pRERhRcwb2k1UlWlsCLjjn8To6PcjtmCcNYQRY31lSWduA3O
 PC5KMJyNjasLvCPvj6RqUd7qfO0Z0FfQytOkkvCHMgdWgBpFPgStpqhxs
 SNm7hnadbL6MiQBp516pZZxaLeW+fJn5hvk01iAis6SxkNJG5MEVtTI+Q
 GcO6f+SoWpUeYshx3T3xc15uFBRpHY7s+B+IkbcyP1LBAtrRi43oQtkuM
 tqdgdzzD9ZybGAeb4qNtnidvGDEOqM35ESuEoBLCsYXTz5WjDzkZOcfXv A==;
X-CSE-ConnectionGUID: hJr4CYCcS5ul1lEjAdMZGw==
X-CSE-MsgGUID: hNPV35j9R9Kl3/c1aocJGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701857"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:26 -0700
X-CSE-ConnectionGUID: o0fkvuaOQnap2nAfB05gVQ==
X-CSE-MsgGUID: 7jaw3NL9Qh2BbY7WbuUhiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669702"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:25 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 7/9] drm/xe: Use xe_force_wake_tryget when possible
Date: Tue,  4 Jun 2024 13:02:23 +0200
Message-ID: <20240604110225.29495-8-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() increments the domain ref regardless of success
or failure so call xe_force_wake_tryget() to ensure xe_force_wake_put
is called even on failure to keep ref count value accurate.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 drivers/gpu/drm/xe/xe_guc.c    | 2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
 drivers/gpu/drm/xe/xe_huc.c    | 2 +-
 drivers/gpu/drm/xe/xe_query.c  | 2 +-
 drivers/gpu/drm/xe/xe_vram.c   | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94dbfe5cf19c..0ff57b3dd0c1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -527,7 +527,7 @@ static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
 
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	err = xe_force_wake_tryget(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
 
@@ -756,7 +756,7 @@ void xe_device_td_flush(struct xe_device *xe)
 		if (xe_gt_is_media_type(gt))
 			continue;
 
-		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+		if (xe_force_wake_tryget(gt_to_fw(gt), XE_FW_GT))
 			return;
 
 		xe_mmio_write32(gt, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 086a048876ba..728a20aa0700 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1137,7 +1137,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_uc_fw_print(&guc->fw, p);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	err = xe_force_wake_tryget(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index ab207a11ac0f..09962634e519 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -394,7 +394,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	ret = xe_force_wake_tryget(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
 		return ret;
 
@@ -762,7 +762,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	ret = xe_force_wake_tryget(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
 		return ret;
 
@@ -823,7 +823,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	ret = xe_force_wake_tryget(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index b039ff49341b..1d300eea97da 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -310,7 +310,7 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	err = xe_force_wake_tryget(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 995effcb904b..55253b0e6490 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -149,7 +149,7 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
+	if (xe_force_wake_tryget(gt_to_fw(gt), XE_FORCEWAKE_ALL))
 		return -EIO;
 
 	__read_timestamps(gt,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 5bcd59190353..5cf8ac8025ef 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -238,7 +238,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		return 0;
 	}
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	err = xe_force_wake_tryget(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
 
-- 
2.42.0

