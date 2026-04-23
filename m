Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F12F99363
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0395B10E330;
	Thu, 23 Apr 2026 10:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSFgkkkK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A22110F054
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776938615; x=1808474615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SjKB7hcU0jVavlFwyBxJENIes9evQ/4KufW6V1ZBMn8=;
 b=JSFgkkkKIfb3OujGndUxodDQxb++onBUB3ffXsFtmK7jBO00E4tSC/pC
 73jYoofn8OJ1cAID8dej9J57p8ZZiAeYffxNaoRlW1O2ItT6Mtqc77eXT
 +CQiuQGNN+lYficy13OJZesL2B1pE3conMArk6QWYVIQG/EJioxux9B4s
 Z4t8SISOcZXZ5qHPXxjEyDL1ptq3fU9R8IDGpbqs3iwS7j3sTeWWyj/iR
 vRQeXdSP16CzKSCJJT+lGkxfZNtrQGoUtUw3WabuyNyYahltZxmA3OTvn
 ZpRhtvF7gxo1KBQ7ucOgPfRrKWHC4KOI9vSVCVg7y3Z06qDGrqqygJlvM Q==;
X-CSE-ConnectionGUID: Aswevo73SZ2ZAus/Vf84Sg==
X-CSE-MsgGUID: IC8wAMk1QcOrJgXtodx+EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88600285"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88600285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:03:35 -0700
X-CSE-ConnectionGUID: 9DUV0YFmRJGRZHgAI7Pfjw==
X-CSE-MsgGUID: ceK8cR9xSTi2oh3IL9dGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232522850"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 23 Apr 2026 03:03:31 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 4/8] drm/xe/bo_evict: Introduce xe_bo_restore_map()
Date: Thu, 23 Apr 2026 15:30:13 +0530
Message-ID: <20260423100017.1051587-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423100017.1051587-1-raag.jadav@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
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

PCIe FLR clears all hardware state along with GGTT mappings of all
existing bos. Iterate over early and late kernel bo list and restore
their GGTT mappings in hardware, so that driver can make use of them
during re-initialization after PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: Add kernel doc (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 51 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_bo_evict.h |  2 ++
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..fa75140c88fe 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -189,14 +189,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 				     xe_bo_evict_pinned);
 }
 
-static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
+static int xe_bo_map_ggtt(struct xe_bo *bo)
 {
-	int ret;
-
-	ret = xe_bo_restore_pinned(bo);
-	if (ret)
-		return ret;
-
 	if (bo->flags & XE_BO_FLAG_GGTT) {
 		struct xe_tile *tile;
 		u8 id;
@@ -212,6 +206,41 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 	return 0;
 }
 
+/**
+ * xe_bo_restore_map() - Restore GGTT mappings of kernel bos
+ * @xe: xe device
+ *
+ * PCIe FLR clears all hardware state along with GGTT mappings of all
+ * existing bos. Iterate over early and late kernel bo list and restore
+ * their GGTT mappings in hardware, so that driver can make use of them
+ * during re-initialization after PCIe FLR.
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_bo_restore_map(struct xe_device *xe)
+{
+	int ret;
+
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
+				    &xe->pinned.early.kernel_bo_present, xe_bo_map_ggtt);
+	if (!ret)
+		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+					    &xe->pinned.late.kernel_bo_present, xe_bo_map_ggtt);
+
+	return ret;
+}
+
+static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
+{
+	int ret;
+
+	ret = xe_bo_restore_pinned(bo);
+	if (ret)
+		return ret;
+
+	return xe_bo_map_ggtt(bo);
+}
+
 /**
  * xe_bo_restore_early - restore early phase kernel BOs to VRAM
  *
@@ -270,7 +299,13 @@ int xe_bo_restore_late(struct xe_device *xe)
 	return ret;
 }
 
-static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
+/**
+ * xe_bo_pci_dev_remove_pinned() - Unmap external bos
+ * @xe: xe device
+ *
+ * Drop dma mappings of all external pinned bos.
+ */
+void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
 {
 	struct xe_tile *tile;
 	unsigned int id;
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index e8385cb7f5e9..d4f5b87243e7 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -14,7 +14,9 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
 void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
 int xe_bo_restore_early(struct xe_device *xe);
 int xe_bo_restore_late(struct xe_device *xe);
+int xe_bo_restore_map(struct xe_device *xe);
 
+void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
 
 int xe_bo_pinned_init(struct xe_device *xe);
-- 
2.43.0

