Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3EDCD129C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9510EB89;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcPEKv+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C36810EB84
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kb3sNxD5GPCwOhxc8RxXcNbfVmkdZz9bRGWXXoFUXUY=;
 b=dcPEKv+h044NqJI1UKjrxEfKd1z3gK1Ti0+NIU0AwY/FltbcROeEJyKL
 I/Nn1AA9QYa7prxgsCFvpN7frF9vHVGBWrDx6vw5Pf3F1l1Za4SSj9VGu
 WrZJPaSxG4kqan+vnsgWQyhJaS1K8IuC3bxQHSPAh0N5JTu2z5M0uUz30
 55abRmbz9M3Bjl9JNtTRvFzUikPVQxHGKDFfS2UpifRtmGLPOmu2/bfmR
 ZfJX0YmKaXTKInosSeCxeaLeZSBUWnVc3Qo1wmc0xbqIdynConRhZE/Lz
 E7zd/XdycqIVU1QGYDsjL4Rcg3BvWC/kUlbvsVFXcMlZGPKzPpApLS1ND w==;
X-CSE-ConnectionGUID: U20CsWOrR9KLPkwkiamDrg==
X-CSE-MsgGUID: nF5lcXzAQxS7iNFaD6J8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733156"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733156"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: VuTVPxxkTu2KsLTCdA6+Rw==
X-CSE-MsgGUID: kwQATXJ1QO6W1voMc1LSkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271218"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 22/33] drm/xe/gt_debugfs: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:38 -0800
Message-ID: <20251107181315.631642-57-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 0b2c5d3ff8bb..e6dacf7fd842 100644
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
-	struct xe_force_wake_ref fw_ref;
-	int ret = 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		ret = -ETIMEDOUT;
-		goto fw_put;
-	}
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		return -ETIMEDOUT;
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
-fw_put:
-	xe_force_wake_put(fw_ref);
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

