Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF30E9E2FA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 12:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136D110E1B5;
	Wed, 11 Feb 2026 12:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdNIMWox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B09E10E149;
 Wed, 11 Feb 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811352; x=1802347352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mJ2FRt+KAqqIdRNCITJFHvShYZRmilNw9G2c3LQiAbw=;
 b=LdNIMWoxg5s3wpBz4ZvieWSZ55i0DDcBnSpAsUAzp5Un5zWz5mC0quGq
 dHTw1SBUTr/jPz+mtz7ZR+6jq2OADZtUJk7zlgtMo2p+pYjIe4N4/8YBO
 i7g4oicTIygHx/Oi9b8fAiglnc/rjtFgmg93smEMGDsKy2Oidua0TSnDd
 dUbAVbqjjx2idQ0FZawYglOLPDf/h2dvMNl4U8BuhvecyMhNMliStE1Kw
 SEug439wGXj8OOhizuHzVFJCaMCP/vxsaSI5v6M5GwfpmPVh21KPfMuMX
 qVtRk/r7tRyZzUNVWsR6mGTeSAfFFRR+4r2C05gttvKHe5+hH2cOQFE20 Q==;
X-CSE-ConnectionGUID: OGE4aNCyRjqq49xaOudDGw==
X-CSE-MsgGUID: XM95Dya2TrmJbbThY1Unew==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71854649"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71854649"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:01:58 -0800
X-CSE-ConnectionGUID: 6k4BS2xWTDa61NxksZa6QQ==
X-CSE-MsgGUID: /Nn5RKgyQ6S3cFZ7VbIHCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="235210773"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 04:01:54 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 3/4] drm/xe: Add handler for critical errors which require
 cold-reset
Date: Wed, 11 Feb 2026 17:29:50 +0530
Message-ID: <20260211115946.2014051-9-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
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

This handler is designed to be called when critical errors are detected
that affect device-level state persisting across warm resets. The cold
reset recovery method signals to userspace that only a complete device
power cycle can restore normal operation.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 8c65291f36fc..d7825d6b9703 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -5,6 +5,8 @@
 
 #include <linux/fault-inject.h>
 
+#include <drm/drm_drv.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -162,6 +164,32 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_critical_error_handler - Handler for critical errors
+ * @xe: device instance
+ *
+ * Handles critical errors that affect the device and cannot
+ * be recovered through driver reload, PCIe reset, etc.
+ *
+ * Marks the device as wedged with DRM_WEDGE_RECOVERY_COLD_RESET method
+ * and notifies userspace that a complete device power cycle is required.
+ */
+void xe_critical_error_handler(struct xe_device *xe)
+{
+	drm_err(&xe->drm, "CRITICAL: error detected\n");
+	drm_err(&xe->drm, "Recovery: Device cold reset required\n");
+
+	/* Set cold reset recovery method */
+	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
+
+	if (xe_device_wedged(xe)) {
+		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+	} else {
+		/* Declare device wedged - will trigger uevent with cold reset method */
+		xe_device_declare_wedged(xe);
+	}
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index d86e28c5180c..f824e22655a0 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -11,5 +11,6 @@ struct xe_tile;
 struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_critical_error_handler(struct xe_device *xe);
 void xe_hw_error_init(struct xe_device *xe);
 #endif
-- 
2.34.1

