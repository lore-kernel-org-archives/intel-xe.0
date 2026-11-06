Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B35606A328
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=isN2x0RP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564EE10F852;
	Fri,  6 Nov 2026 07:40:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E96110F852
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793950820; x=1825486820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJ/2SSaDDsGtKWkqnUC1YshWcC4yNvXYLqSfB34mZrA=;
 b=isN2x0RP31eb90AP8mVO7czY54/wlGY+eU1oYjm0nk+xrfCftuny0Zd0
 UeG2SvUW5F5QE7pabsSjXICpQS6arHclHOJzVSSoNAeSf6yyXLvTL+YMr
 uTTn4iB98yVMo/+7LZfkaKoCwYQQMwYnk7dje11CrxiJhD1WJ4FnwOuPY
 KAiPgg6jbW98GWxnGxL4Hz8arpgAAIj2IYkFoNUkOFGVuj9NpTKGpnwTO
 aZouKiXhWw3b8D7ZVq9uwinl8V/ecCkp8NQQkBz4XHSAmjkpMjizQrViv
 kJSmSol2wUN51GSTQRJhNP52E3cXAE+IxrcAqAzTmcOGWWRhhXJyy4H+l g==;
X-CSE-ConnectionGUID: cPTGlKSYSPun5LwIhifKsQ==
X-CSE-MsgGUID: d7mDVGK3Rz+4e/N3+5f7bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2848260"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2848260"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:40:19 -0800
X-CSE-ConnectionGUID: n/tkhgDgSNinyn96Z9kPeQ==
X-CSE-MsgGUID: EOXHtRTkSHa+iqDxbx6vlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8970465"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 23:40:15 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>,
 Varun Gupta <varun.gupta@intel.com>
Subject: [PATCH v14 04/10] drm/xe/bo_evict: Introduce xe_bo_restore_map()
Date: Fri,  6 Nov 2026 13:08:45 +0530
Message-ID: <20261106073921.1512530-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106073921.1512530-1-raag.jadav@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PCIe FLR clears all hardware state along with GGTT mappings of all
existing bos. Iterate over early and late kernel bo list and restore
their GGTT mappings in hardware, so that driver can make use of them
during re-initialization after PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Varun Gupta <varun.gupta@intel.com>
---
v2: Add kernel doc (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 43 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo_evict.h |  1 +
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..16f8cec4934e 100644
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
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index e8385cb7f5e9..aabba06f0abf 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -14,6 +14,7 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
 void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
 int xe_bo_restore_early(struct xe_device *xe);
 int xe_bo_restore_late(struct xe_device *xe);
+int xe_bo_restore_map(struct xe_device *xe);
 
 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
 
-- 
2.43.0

