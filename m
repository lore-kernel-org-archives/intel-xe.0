Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBC9C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 14:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EEA10E34D;
	Tue,  6 May 2025 14:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WV5hr5Jz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D806310E34D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746540898; x=1778076898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZkhoizuiUkvgjK7bMppvd3+R+JDeLtPvVlaVScQinsM=;
 b=WV5hr5Jz1tYwsAQgOZOPndlXSBxoKaKzXZ7ld7kasbtdQFiIlwYMDHj5
 u0kSjheooKcmSsB00eW/ijj6yn3p2HK5GdxDgx2e6mEgUZFWfxl79qtXq
 pbpuHzr9LFy4Mjr8eFsIzMIM+h+6hJKR6bim4G9lQIKF3/P6lmshLRhDm
 KLAV2XDV4zC21HfV62lrHGvIVKD4xzbRqOx5FV/b2kMtCDuVAAIA4xqug
 u9OOim1qrhv8l81PpXwnBaXS8trjS5101TmGMmgMvFx475RulSFpN8e2r
 WWWIR2ORNweO3whHCjcTui4a61G6VH6oUwW1rUDCxGsDRALX+0dThd17T A==;
X-CSE-ConnectionGUID: wcvV2RRCQQOa/dyfLW9jTg==
X-CSE-MsgGUID: Zb2CMyD1QpSM/RgX1fwi0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65622496"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="65622496"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:14:46 -0700
X-CSE-ConnectionGUID: nWMoklzGQIqfT3m47pSEaw==
X-CSE-MsgGUID: 62CQgAd7TTOphzyaViMyWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136581045"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:14:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/mocs: Check if all domains awake
Date: Tue,  6 May 2025 19:53:00 +0530
Message-Id: <20250506142300.1865783-1-tejas.upadhyay@intel.com>
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

Check if all domains are awake specially for
LNCF regs

Fixes: 1182bc74b39b ("drm/xe: Fix MOCS debugfs LNCF readout")
Improvements-suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 31dade91a089..0c737413fcb6 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -775,22 +775,23 @@ void xe_mocs_init(struct xe_gt *gt)
 void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	enum xe_force_wake_domains domain;
 	struct xe_mocs_info table;
 	unsigned int fw_ref, flags;
 
 	flags = get_mocs_settings(xe, &table);
 
+	domain = flags & HAS_LNCF_MOCS ? XE_FORCEWAKE_ALL : XE_FW_GT;
 	xe_pm_runtime_get_noresume(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt),
-				   flags & HAS_LNCF_MOCS ?
-				   XE_FORCEWAKE_ALL : XE_FW_GT);
-	if (!fw_ref)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), domain);
+
+	if (!xe_force_wake_ref_has_domain(fw_ref, domain))
 		goto err_fw;
 
 	table.ops->dump(&table, flags, gt, p);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

