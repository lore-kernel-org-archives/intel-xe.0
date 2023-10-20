Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D46CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DCE10E585;
	Fri, 20 Oct 2023 04:49:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42710E585
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777354; x=1729313354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ut3FkdNsqB3FpxPKp4Skr/EUoeP1wU/FiCTu3+uGFeA=;
 b=I23mzmsDRhnL1cwMb1KB1QnlD980I6VzDgnjvLyhiEvXfrEblXzxuosy
 xUFmYgeoS+17gUjXacC+9Fv3ENnpvHRbM7nItC3VStx0hFtb9KO7uCuiJ
 82BdriWmY5A0zlSLk6JaPQW1DrRqk2NZDR8JESJo75CJZSqwHr3EvSxM1
 8Pc8JThLHhKMLsau9s8gV3TRcqeraNf04niiFPnMxmFifmUt4CgZVwI18
 0KvuHiDW6POgbqx/Jiy9h9LXnUm2Y2n3aXc+SElNi3dOx1mMVyMMaNkIO
 0B2MCpyo5pWduzgFonPWVGT5pTAUwHp0rGgn/rGEtrfUJA1pt3ZcEo0ZT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390310843"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390310843"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847959889"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847959889"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 21:49:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 10:25:33 +0530
Message-Id: <20231020045533.1425375-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 12/12] drm/xe: Clear all SoC errors post warm
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

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 40 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c      |  1 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index a4dd2844d63d..bab6d4cf0b69 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -510,6 +510,46 @@ xe_gt_hw_error_log_vector_reg(struct xe_gt *gt, const enum hardware_error hw_err
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
index 3fab65291222..990f1928a18d 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -194,4 +194,5 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
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

