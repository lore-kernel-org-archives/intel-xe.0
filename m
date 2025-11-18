Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1630ACEDDA4
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC28B10E502;
	Tue, 18 Nov 2025 16:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Le038WuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4C10E4F9
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTiodkD1mtzZA9oyKa/nUvLFN/8oMChwznIkntTUa30=;
 b=Le038WuAgRS9M/lqCPnwZJXe4HJWwHpy8+GELbnn/gEQ5hpqb5z3tiep
 f82ZGvVZkYKIA2Tg8ZKcks40AxVuHuqOVwHsSLcFHDrwuHiPqo584f8lv
 Dt3JUX3pXrOxQiY67qalfAj4QfTZ7umK4IlP9uhVazj9BxsHZNyPHzjMS
 gm7XbZQmr1uUFNn9YAbNUTJWrR/H472YjLOGxLxu6XInKNoQh2xWf01SU
 fbtgZ8Zrp9M0r/TrnTSedtM5pbIZlFFX1DZVniLcYLaWsdWPNevmNqnve
 N6890E6bpj9c7KsfRskpQ2Nsl4HWsYqDpqeOIevy+I57LxmosNlR58qJ3 A==;
X-CSE-ConnectionGUID: lUn1epO1Tfa9zjPGAPISVg==
X-CSE-MsgGUID: HCdK7opUTqeqQIeEgn+Bpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544779"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544779"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: sdugIETjT3W5fsYdHhXj8A==
X-CSE-MsgGUID: 4g+0H+OLRuStQAkmRnHpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952246"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 16/27] drm/xe/gt_debugfs: Use scope-based cleanup
Date: Tue, 18 Nov 2025 08:43:55 -0800
Message-ID: <20251118164338.3572146-45-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Use scope-based cleanup for forcewake and runtime PM to simplify the
debugfs code slightly.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index e4fd632f43cf..7c3de6539044 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -105,35 +105,24 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
 	struct drm_info_node *node = m->private;
 	struct xe_gt *gt = node_to_gt(node);
 	struct xe_device *xe = gt_to_xe(gt);
-	int ret;
 
-	xe_pm_runtime_get(xe);
-	ret = xe_gt_debugfs_simple_show(m, data);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+	guard(xe_pm_runtime)(xe);
+	return xe_gt_debugfs_simple_show(m, data);
 }
 
 static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
-	unsigned int fw_ref;
-	int ret = 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		ret = -ETIMEDOUT;
-		goto fw_put;
-	}
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+		return -ETIMEDOUT;
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
-fw_put:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return ret;
+	return 0;
 }
 
 static int steering(struct xe_gt *gt, struct drm_printer *p)
@@ -269,9 +258,8 @@ static void force_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	xe_gt_reset_async(gt);
-	xe_pm_runtime_put(xe);
 }
 
 static ssize_t force_reset_write(struct file *file,
@@ -297,9 +285,8 @@ static void force_reset_sync(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	xe_gt_reset(gt);
-	xe_pm_runtime_put(xe);
 }
 
 static ssize_t force_reset_sync_write(struct file *file,
-- 
2.51.1

