Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F31D6AAF4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 17:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1210EFC7;
	Thu,  2 Apr 2026 17:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LycAGb+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F2B10EFC7
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775152003; x=1806688003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=22WM9SXfr67dZ1Q2w80OT+RV0uDchw2fYthXoMJnKdo=;
 b=LycAGb+aROp1rbp5ei6CH4Sk1VQQtBHG8Ymhq8Bt25PejCsP8ODIODy7
 pKcmSM67mWOFUfwCpSdkUlW3gh5cuv6kqZekndPHIfpi6LKmE/Lah6ap1
 2vQxX5Md3WITY+AmGvGUR5kiZcSpxgO5wryiHpTzWaZftBzQOA+Zof9p4
 0F67CEZkRrReD8kSm0GjZBYNi+sv6lNcpQ+KlO0szf93WIQzRJzM4dod6
 R03Sh95gbVRmzqsoc8e9kP17Pg1lhgX6jtVXGfLaRzIu3mKLVDpNuenRA
 UP7b28ud/hZpFvutfAp/8XnuT28eDj8T0thnEeO2Am6twv921ooDSukgZ Q==;
X-CSE-ConnectionGUID: hjDn1AD5Q2eiLiWwsuvHdg==
X-CSE-MsgGUID: 33MTLxyARGOwiy4wfHwAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93612081"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93612081"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 10:46:30 -0700
X-CSE-ConnectionGUID: FzwOlRoVTD+VsNUuiUArXw==
X-CSE-MsgGUID: ww7zGLCVTKGJqNUGZfZhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226209491"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 02 Apr 2026 10:46:28 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/4] drm/xe/hw_error: Setup hardware error routing
Date: Thu,  2 Apr 2026 23:12:26 +0530
Message-ID: <20260402174229.1062874-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402174229.1062874-1-raag.jadav@intel.com>
References: <20260402174229.1062874-1-raag.jadav@intel.com>
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

Hardware errors are reported through System Controller on the platforms
that support it. This requires that they are routed as PCIe errors
instead of direct IRQ to SGUnit, but this routing prevents the user from
investigating those errors in case it is needed for debug cases.

Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
which bypasses the System Controller and allows the user to investigate
errors without System Controller involvement.

                 default   with NO_RESET   w/o NO_RESET
                 -------   -------------   ------------
        fatal      PCIe         IRQ            PCIe
    non-fatal      IRQ          IRQ            PCIe
  correctable      IRQ          IRQ            PCIe

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Explain the usecase (Matt Roper)
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_hw_error.c           | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index 046e1756c698..247906ae2227 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -44,6 +44,11 @@
 #define   XE_SOC_ERROR					16
 #define   XE_GT_ERROR					0
 
+#define DEV_ERR_ROUTING_CTRL				XE_REG(0x100170)
+#define   FATAL_ERR_ROUTING				BIT(2)
+#define   NONFATAL_ERR_ROUTING				BIT(1)
+#define   CORR_ERR_ROUTING				BIT(0)
+
 #define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
 #define ERR_STAT_GT_FATAL_VECTOR_1			0x100264
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2a31b430570e..28ad5c15685e 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -526,6 +526,26 @@ static int hw_error_info_init(struct xe_device *xe)
 	return xe_drm_ras_init(xe);
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
+	if (!xe->info.has_sysctrl)
+		return;
+
+	for_each_tile(tile, xe, id)
+		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
+}
+
 /*
  * Process hardware errors during boot
  */
@@ -563,5 +583,6 @@ void xe_hw_error_init(struct xe_device *xe)
 	if (ret)
 		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
 
+	xe_hw_error_irq_route(xe);
 	process_hw_errors(xe);
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

