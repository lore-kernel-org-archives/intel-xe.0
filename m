Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C6FE810D4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B2910E4E8;
	Wed, 27 Sep 2023 11:40:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756E10E4E6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814830; x=1727350830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PHJm45eQ/Kk774iJjZRAQsreNwd+pYO7NYPrKk8mgPI=;
 b=jDR3OyGXGKwxyeeosdVxwqY8ecpCcoNnJI1Pq3jTOCJd1u/VJoFxAR/e
 1NJZYr4SRHDx/zfxQmmm9Ma6QAyoyLfhNJbiRj/okCiqCZvTw3lEic6ll
 0U7lKLAbbWCuq1RzxWpxiTSP54QcOCAhIu40idRD/zx4qLGklHsd35ez2
 7zvTfZKRdAIrZMYO4kh1UqewJ8nf/d+Mz7zAqgkx3ZLBYP94SkPUhCpHW
 zsLbSbZwc1Ie92QflsreJlIE3I6RwQxd/BO1I3rc7bV/iE76SIr3d+6GO
 2lFia//QDHhrPwRI/H4iuySlricfzoWqlgmqqyaJB5lvT3ft21H4NLxhC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863228"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855698"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855698"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:28 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:27 +0530
Message-Id: <20230927114627.136925-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/11] drm/xe: Clear all SoC errors post warm
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

There are scenarios where there are no fatal errors reported
but Non-fatal/correctable errors being reported from the SoC
uncore to IEH and not propogated to SG unit. Clear all previous
SoC errors post warm reset.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c      |  1 +
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 0bcb1bea7ffb..a777c887a7be 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -366,6 +366,43 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
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
+			for (i = 0; i < PVC_NUM_IEH; i++)
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
+		for (i = 0; i < PVC_NUM_IEH; i++)
+			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+					(HARDWARE_ERROR_MAX << 1) + 1);
+	}
+}
+
 static void
 xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index a458a90b34a2..7ada7c97c939 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -219,4 +219,5 @@ struct xe_tile;
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
 void xe_process_hw_errors(struct xe_device *xe);
 void xe_gsc_hw_error_work(struct work_struct *work);
+void xe_clear_all_soc_errors(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 285c657cc789..42a6bb45acba 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -597,6 +597,7 @@ int xe_irq_install(struct xe_device *xe)
 	}
 
 	xe_process_hw_errors(xe);
+	xe_clear_all_soc_errors(xe);
 
 	xe->irq.enabled = true;
 
-- 
2.25.1

