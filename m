Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2906606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCj0xLbf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A8B10F362;
	Tue,  3 Nov 2026 06:09:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BEB10F362
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686191; x=1825222191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CheqQpUr28qorw5N+wHpDfH8VPS0G1gXB+AFB0DVSPo=;
 b=MCj0xLbfDZpK3ObGv4CvVN6v0ES7wGHWGk1+SrHAq9YIAId2xKTsahCr
 LCk21pFXpGnflJ4U4L+gN5VcT477p64Y9lXoP2V4deJmPAFK3bCMxEUjX
 xqsfUMqxK1n5VwTP2CcsM8qFiL3tUm+0sI8N2EbY9Os7oUd2/CFGRZMsw
 FoSKUSC/i7nZIK/quaVPU2mALyHkx18s6/J3tNTW4GclIutmmhDrshM8v
 sm2VNvgHFTgNH4gTgCZwUPU2hJ63d7kITqBrDdtTWC6xdXlFdUIHrt3dZ
 xmrjy35D9Hd0uRVfUeq3k8dbKaNIhXAKx2RArt0yQtqrlcx6jmEQ6CqKE A==;
X-CSE-ConnectionGUID: b+gjeCUARqy/9X946E4dWA==
X-CSE-MsgGUID: dRavoInJTFa06ShEXAvl4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276700"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:51 -0800
X-CSE-ConnectionGUID: 4Y1YdxZ+RZG4gU5zXoLpmQ==
X-CSE-MsgGUID: tIxCciKuRty6M1PamoDqmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446344"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:48 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v3 2/7] drm/xe/hw_error: Initialize hw_error_work per tile
Date: Tue,  3 Nov 2026 11:39:32 +0530
Message-ID: <20261103060929.1586783-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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

Since hw_error_work is now being reused generically, initialize it per tile
so that we don't hit uninitialized work for non-root tile. While at it,
disable hw_error_work on remove to prevent UAF during unwind.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: move disable work to xe_device_remove
    add dgfx and sriov check (Sashiko)
---
 drivers/gpu/drm/xe/xe_device.c   |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 07a7ab6ac083..8f498e3e3e58 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,6 +45,7 @@
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
 #include "xe_hw_engine_group.h"
+#include "xe_hw_error.h"
 #include "xe_hwmon.h"
 #include "xe_i2c.h"
 #include "xe_irq.h"
@@ -1118,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_hw_error_work_disable(xe);
+
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index a934b649575c..aaa2437d40bf 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -537,6 +537,24 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_hw_error_work_disable - Disable hw error work
+ * @xe: xe device instance
+ *
+ * This function disables work for hardware error handling for all tiles.
+ */
+void xe_hw_error_work_disable(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
+
+	for_each_tile(tile, xe, id)
+		disable_work_sync(&tile->hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -546,12 +564,14 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 5e3a11424108..944699331a93 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -12,4 +12,5 @@ struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
 void xe_hw_error_init(struct xe_device *xe);
+void xe_hw_error_work_disable(struct xe_device *xe);
 #endif
-- 
2.47.1

