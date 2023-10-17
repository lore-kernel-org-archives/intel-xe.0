Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5ACCDB482
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 04:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D34710E268;
	Tue, 17 Oct 2023 04:09:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03B10E264
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 04:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697515770; x=1729051770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4sSvch5YTPiVr7z59eT+bQkHmaotxnFTrsWfUjzkCyg=;
 b=OsaJ/TzBSmJk64jxvr7SBfbN+q3xi5X1nN1WmcHL5idW7fml/RjpNAsG
 VeSY0Z29f0wq1Xlc54F1+GO2XJiSg72UrxERw4sxq7lClW2ZNY2L9DmWy
 cEUmQtkgBA1Gl9Q8p9+41XtMvWkqG2PogUXLmglWSTA5TCmf8+HOQGj9v
 nuPcbwElmFO1Kp/vNprNMQwKH2SmZ9Oy38Bx362XOgro1c1oTw/MimU19
 FXOaV4sxy+AO3kxN9fthX8wCjtl5KGGJaW2rDOXcxKV8XSNL3QkQuMDZM
 SZxK5e++1zgT/fx/nK1KS02pb1rqpGKHTBJxDMcVZxBld3ppdMiWOdx4u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416769962"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="416769962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 21:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="791073937"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="791073937"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga001.jf.intel.com with ESMTP; 16 Oct 2023 21:09:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 09:45:50 +0530
Message-Id: <20231017041550.1172643-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
References: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/10] drm/xe: Clear all SoC errors post warm
 reset.
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

There are scenarios where there are errors being reported from the SoC
uncore to IEH and not propagated to SG unit. Since these errors are not
propagated to SG unit, driver won't be able to clean them as part of
xe_process_hw_error. Hence clear all SoC register post xe_process_hw_error
during the driver load.

v2
- Fix commit message.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c      |  1 +
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index fbadaf307a92..6c6806184b5e 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -519,6 +519,43 @@ xe_gt_hw_error_log_vector_reg(struct xe_gt *gt, const enum hardware_error hw_err
 	}
 }
 
+void xe_clear_all_soc_errors(struct xe_device *xe)
+{
+	enum hardware_error hw_err;
+	u32 base, slave_base;
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+	unsigned int i;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+
+	hw_err = HARDWARE_ERROR_CORRECTABLE;
+
+	for_each_tile(tile, xe, i) {
+		gt = tile->primary_gt;
+
+		while (hw_err < HARDWARE_ERROR_MAX) {
+			for (i = 0; i < XE_SOC_NUM_IEH; i++)
+				xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+						~REG_BIT(hw_err));
+
+			xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
+					REG_GENMASK(31, 0));
+			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
+					REG_GENMASK(31, 0));
+			xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+					REG_GENMASK(31, 0));
+			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+					REG_GENMASK(31, 0));
+			hw_err++;
+		}
+		for (i = 0; i < XE_SOC_NUM_IEH; i++)
+			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+					(HARDWARE_ERROR_MAX << 1) + 1);
+	}
+}
+
 static void
 xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 59b331f52783..f27c166455da 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -206,4 +206,5 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
 void xe_assign_hw_err_regs(struct xe_device *xe);
 void xe_process_hw_errors(struct xe_device *xe);
 void xe_gsc_hw_error_work(struct work_struct *work);
+void xe_clear_all_soc_errors(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index bc0f01a2abc1..93cb948de516 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -626,6 +626,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_assign_hw_err_regs(xe);
 	xe_process_hw_errors(xe);
+	xe_clear_all_soc_errors(xe);
 
 	xe_irq_reset(xe);
 
-- 
2.25.1

