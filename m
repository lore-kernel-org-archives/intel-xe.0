Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C10C369A7
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 21:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CFE10E763;
	Tue,  8 Apr 2025 21:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsYVzSvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75F210E761
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744147919; x=1775683919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O9MF36LVS9rmeHOCIYFIqq6QLrNBcJkgLZ2Z0JZy2H4=;
 b=XsYVzSvWpMPuIuIH4VIX6pfBdJwVKW+Vp0y6jjJL70zYQBD7llZYaUPW
 JUKRZ65KSM5lLqnCOZAN2fYU511ynskIwS8ypPtpZ7IEbrnngwNNc1Vtx
 rYBB4sWgpvTNmmF2a1MUK6DPOIPEdbEBLFlKkDpDNrkn/HzfSjaYrAI5j
 bqZbktoxvE+pBrVtev9hVO69FP4+d/Lha5LA1UhM16ZIyNGrWJ1SwmSG3
 0uLWR/ROJFAkTdDLw2HaV+wNZNugnQ93vxFIyZBBoX4fKxnS+77mt08Fk
 KIJaWxf9tSAY/H/AvpNqHkLDcOGGA+swzEhaVBvvup+lSi69gvf2vb2Q7 g==;
X-CSE-ConnectionGUID: Q4hyEC56RQ2tT1Ut+D9FrA==
X-CSE-MsgGUID: 4Jb4KdGuSRWg8nOMqglCJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44851479"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="44851479"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 14:31:59 -0700
X-CSE-ConnectionGUID: dbwsr6LVTrKnyskTma4Pww==
X-CSE-MsgGUID: Er2j+PrmTCyKor4b8l9AfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128923608"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 14:31:58 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Fix guc_info debugfs for VFs
Date: Tue,  8 Apr 2025 14:31:46 -0700
Message-ID: <20250408213146.793855-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
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

The guc_info debugfs attempta to read a bunch of registers that the VFs
doesn't have access to, so fix it by skipping the reads.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 38866135c019..17932006619a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1509,30 +1509,32 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_uc_fw_print(&guc->fw, p);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return;
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return;
+
+		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+
+		drm_printf(p, "\nGuC status 0x%08x:\n", status);
+		drm_printf(p, "\tBootrom status = 0x%x\n",
+			   REG_FIELD_GET(GS_BOOTROM_MASK, status));
+		drm_printf(p, "\tuKernel status = 0x%x\n",
+			   REG_FIELD_GET(GS_UKERNEL_MASK, status));
+		drm_printf(p, "\tMIA Core status = 0x%x\n",
+			   REG_FIELD_GET(GS_MIA_MASK, status));
+		drm_printf(p, "\tLog level = %d\n",
+			   xe_guc_log_get_level(&guc->log));
+
+		drm_puts(p, "\nScratch registers:\n");
+		for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
+			drm_printf(p, "\t%2d: \t0x%x\n",
+				   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		}
 
-	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
-
-	drm_printf(p, "\nGuC status 0x%08x:\n", status);
-	drm_printf(p, "\tBootrom status = 0x%x\n",
-		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
-	drm_printf(p, "\tuKernel status = 0x%x\n",
-		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
-	drm_printf(p, "\tMIA Core status = 0x%x\n",
-		   REG_FIELD_GET(GS_MIA_MASK, status));
-	drm_printf(p, "\tLog level = %d\n",
-		   xe_guc_log_get_level(&guc->log));
-
-	drm_puts(p, "\nScratch registers:\n");
-	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
-		drm_printf(p, "\t%2d: \t0x%x\n",
-			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	drm_puts(p, "\n");
 	xe_guc_ct_print(&guc->ct, p, false);
 
-- 
2.43.0

