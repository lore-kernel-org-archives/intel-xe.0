Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32028C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 08:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56B410E340;
	Wed,  1 Jul 2026 08:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euRB8Cde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5D710EE4F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782894960; x=1814430960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kxiPbA32Hqjgjmvyg2MnobMYeQqAxtjspLsCrPTalT4=;
 b=euRB8Cdel/7ySp6lMGqS77ljeBaYhaMpw7zIsgmdVVPfyyTNmGyTHpGN
 8hSUzRJu/cvkE+j32xwpyJIlNDMVjPHS0B+liONnJbSjum81n5wglLyga
 ZfGcRu6DhSx/EqbAnv2Ls7TFv0djVEqwuJScJO40sSA+6Qb41ThAwwfmX
 +N1bHmnpp+9a6daLmT3HLrRc542XcSJZgQnfc2sP2nrSlVZZrPTYsZfoN
 D+m0rWgY7uzs3Gm6/YKoYsOdlszIm9f3BiVPD7S8MMgyRKq80Twim4dI7
 g7dpIfXCdMVuomnEGfPoo1hLsBptarXBZdNPur+T5MjfjWPHuaaVkWExz g==;
X-CSE-ConnectionGUID: IAmmQetDSEy4+K2LUR0OeQ==
X-CSE-MsgGUID: tcRGNhVKRB6cWlykd8w8AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83493043"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83493043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:35:59 -0700
X-CSE-ConnectionGUID: YdLR5HL9T7u4In/rQqGOAA==
X-CSE-MsgGUID: OpWOhdkmTueAwi0yD5qcOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="276806214"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 01:35:53 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>, Varun Gupta <varun.gupta@intel.com>
Subject: [PATCH v9 04/10] drm/xe/bo_evict: Introduce xe_bo_restore_map()
Date: Wed,  1 Jul 2026 13:59:28 +0530
Message-ID: <20260701083051.450259-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701083051.450259-1-raag.jadav@intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
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
Reviewed-by: Varun Gupta <varun.gupta@intel.com>
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

