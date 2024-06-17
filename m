Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38209C2BA18
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A1210E3DC;
	Mon, 17 Jun 2024 14:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCOzZXER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A52110E3DB
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718632900; x=1750168900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXec+C+W2El+j4GK6Q6Hk2G1UjD8vqV+wikjbznrjzw=;
 b=VCOzZXERKMLzEoo0ViPjaWNMit+21zOw99Z6jG6+dYsLBZ6fjanD1Swy
 uMeTYPatEMNbjqyo+8iIGENDLQX/Aeu3YaZ42ScrvgOxoV7fk+n675/rp
 pBp4VuSDronOnXwqoxKH9IQ4l+IwGG7W4qfI+lZftNEIz95Sz9VLtKz+3
 grGUPyqLkEJIvL/i4DKtASBDFjpOCrRzVyFM3iuR6oajhMXwxDAAd8EHR
 cey2iY/AOt4afqmPQIaEJWri0nxPojhIg+pTIWil2cXjBfT52GzDUeuyN
 7XHRScVcwpHafe2JDnlnb9G5u+6hzA5YGdWzKl0Wv94qdT9iuw8jCzwjj Q==;
X-CSE-ConnectionGUID: oxZsN5AFRFi9Frtfv4Kemg==
X-CSE-MsgGUID: 9NBTISAKTmuue2ayWW7saw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12109877"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="12109877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:01:39 -0700
X-CSE-ConnectionGUID: QQbOyCrPT3+s4Q/SUsWIkA==
X-CSE-MsgGUID: nFyAOM/PR86BinbFzwI2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41142200"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:01:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [RFC 2/2] drm/xe: Use new PM guard in xe_gt_debugfs.c
Date: Mon, 17 Jun 2024 16:01:20 +0200
Message-Id: <20240617140120.597-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240617140120.597-1-michal.wajdeczko@intel.com>
References: <20240617140120.597-1-michal.wajdeczko@intel.com>
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

Start using new PM guard to minimize risk of leaking PM references.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 91 +++++++++++-------------------
 1 file changed, 34 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..6973953a709c 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -88,39 +88,31 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err;
+	CLASS(xe_pm, guard)(xe);
 
-	xe_pm_runtime_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (err) {
-		xe_pm_runtime_put(xe);
+	if (err)
 		return err;
-	}
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_pm_runtime_put(xe);
-	if (err)
-		return err;
-
-	return 0;
+	return err;
 }
 
 static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_reset_async(gt);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_gt_reset_async(gt);
 
 	return 0;
 }
 
 static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_reset_async(gt);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_gt_reset_async(gt);
 
 	flush_work(&gt->reset.worker);
 
@@ -131,39 +123,35 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 
-	xe_pm_runtime_get(gt_to_xe(gt));
-	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
-				     tile->mem.kernel_bb_pool->gpu_addr);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
+					     tile->mem.kernel_bb_pool->gpu_addr);
 
 	return 0;
 }
 
 static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_topology_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_gt_topology_dump(gt, p);
 
 	return 0;
 }
 
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_mcr_steering_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_gt_mcr_steering_dump(gt, p);
 
 	return 0;
 }
 
 static int ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
-	int ret;
+	int ret = -EIO;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
-	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, p);
 
 	return ret;
 }
@@ -172,8 +160,7 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
-
-	xe_pm_runtime_get(gt_to_xe(gt));
+	CLASS(xe_pm, var)(gt_to_xe(gt));
 
 	xe_reg_sr_dump(&gt->reg_sr, p);
 	drm_printf(p, "\n");
@@ -192,79 +179,69 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_whitelist_dump(&hwe->reg_whitelist, p);
 
-	xe_pm_runtime_put(gt_to_xe(gt));
-
 	return 0;
 }
 
 static int workarounds(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_wa_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_wa_dump(gt, p);
 
 	return 0;
 }
 
 static int pat(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_pat_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_pat_dump(gt, p);
 
 	return 0;
 }
 
 static int mocs(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_mocs_dump(gt, p);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_mocs_dump(gt, p);
 
 	return 0;
 }
 
 static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
 
 	return 0;
 }
 
 static int ccs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
 
 	return 0;
 }
 
 static int bcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
 
 	return 0;
 }
 
 static int vcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
 
 	return 0;
 }
 
 static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	scoped_guard(xe_pm, gt_to_xe(gt))
+		xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 
 	return 0;
 }
-- 
2.43.0

