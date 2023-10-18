Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12433CDB485
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 02:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C019B10E363;
	Wed, 18 Oct 2023 02:51:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146D110E363
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 02:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697597485; x=1729133485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQYmFUd+nvmyYe/0GsPMpgTKBqB3k2Gqzz8ItCYBmD0=;
 b=VIZ47CqptbhnKJenfjwn1M0szVJJ3zYGhqVCpPYsdr9lDXKldLJmmw1n
 Pnsphrdat40I0lXcY9dECREFutm+Mbr+YRlDC25V6J32niBbE2UlRWNsL
 vIvNEwvjIsrrspEPB3idSeHoOmqqMOgplMC/n0G34mFp8VMJF87ysOeXA
 9vjHVOCIpTuInFl1HK8icIHtNNzZ0bPg6YtGvk0OGbQ2NZN5Z3Fk6BSFa
 4p5pBDeLqt6dDxlJlXklzKWXwI+XuryIqeWua2pFqVLb3I1FEC2K4g2IV
 pfr/9oRVHTAHWmQYAJWFUqyylnrG1pSqRpogLp4NCwiHdORzlf1IkvdZY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366180560"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="366180560"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 19:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="732967431"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="732967431"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 17 Oct 2023 19:51:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 08:27:48 +0530
Message-Id: <20231018025748.1225528-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018025748.1225528-1-himal.prasad.ghimiray@intel.com>
References: <20231018025748.1225528-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 10/10] drm/xe: Clear all SoC errors post warm
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

v3
- Limit check to PVC.

v4
- Fix check

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 40 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c      |  1 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5700f708425f..381bd7180b80 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -519,6 +519,46 @@ xe_gt_hw_error_log_vector_reg(struct xe_gt *gt, const enum hardware_error hw_err
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
+	if (xe->info.platform != XE_PVC)
+		return;
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

