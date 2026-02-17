Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DEDE6816B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 11:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD5210E230;
	Tue, 17 Feb 2026 11:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGhOdR+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180EE10E230
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771329062; x=1802865062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q7KLT0w4pGjy/1KRvITT1X+KzYAuc1/7NN4Lu61VUi8=;
 b=kGhOdR+TMZfPisJITKSEhjcTe0WjEqmLIS8iVE8l6iLEDvQcMKwU4GRA
 NLBkNz2XIPHQxu5EAwqCQHD0iVSffBb4grBm4JmLzM0nA7ycBi7tgG4bE
 WfCzG1tXPBzzG+u0Lo4cOm5y+3j0N4HvyTr0jaRipydpMefBQDkI4qkAU
 Eq3dmcAakM5Rcx6W2S51sPhN4VIliMpYuP91BBnGIdFbKC4HaUFhZTIEL
 /Zon0zyG5w9txkKhBlXYw7p2L46vkGiybq1jbhMdt+cyhN0FJAUXc64fH
 4jW4XwrrX4lmWvfjygjjPlYW7tncnLp69SfOB3epZ2c0IUXjCTGxnM84+ w==;
X-CSE-ConnectionGUID: ouFGU30cRumPFqjd+n6OqA==
X-CSE-MsgGUID: /jEJB+LZSLuvyaDUVh1g5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83495355"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83495355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:51:02 -0800
X-CSE-ConnectionGUID: 2Owl8iOjRfW1JqV6K0Nrpw==
X-CSE-MsgGUID: HfelS3pYQcKpffQXXtNOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="251546403"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 17 Feb 2026 03:50:59 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/3] drm/xe/cri: Setup hardware error routing
Date: Tue, 17 Feb 2026 17:16:31 +0530
Message-ID: <20260217114656.2546878-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217114656.2546878-1-raag.jadav@intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
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

Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
which will be used for debug cases on Crescent Island.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_hw_error.c           | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index c146b9ef44eb..88593f0a48fd 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -11,6 +11,11 @@
 
 #define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
 
+#define DEV_ERR_ROUTING_CTRL			XE_REG(0x100170)
+#define   FATAL_ERR_ROUTING			BIT(2)
+#define   NONFATAL_ERR_ROUTING			BIT(1)
+#define   CORR_ERR_ROUTING			BIT(0)
+
 #define DEV_ERR_STAT_NONFATAL			0x100178
 #define DEV_ERR_STAT_CORRECTABLE		0x10017c
 #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..eb557266d083 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -146,6 +146,23 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 			hw_error_source_handler(tile, hw_err);
 }
 
+/**
+ * xe_hw_error_irq_route - irq routing of hw errors
+ * @xe: xe device instance
+ *
+ * Set irq routing of hw errors.
+ */
+void xe_hw_error_irq_route(struct xe_device *xe)
+{
+	u32 mask = CORR_ERR_ROUTING | NONFATAL_ERR_ROUTING | FATAL_ERR_ROUTING;
+	bool irq = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
+}
+
 /*
  * Process hardware errors during boot
  */
@@ -178,5 +195,8 @@ void xe_hw_error_init(struct xe_device *xe)
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
-	process_hw_errors(xe);
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe_hw_error_irq_route(xe);
+	else
+		process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index d86e28c5180c..8f155b66b5f1 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -11,5 +11,6 @@ struct xe_tile;
 struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_hw_error_irq_route(struct xe_device *xe);
 void xe_hw_error_init(struct xe_device *xe);
 #endif
-- 
2.43.0

