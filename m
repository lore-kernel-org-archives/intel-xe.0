Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C7A1049524
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 09:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3A010E87B;
	Wed, 11 Mar 2026 09:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdrmnpjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC7A10E87B;
 Wed, 11 Mar 2026 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773223122; x=1804759122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RuYiny3Cp1A4JUEO2ozaBp/vHAs+bhA6FKWcW5Ei1Fo=;
 b=bdrmnpjXZdT/PnbtQasqIcoCTyEWoNujfjRWjGiVW1nU4Y9eNlYIDaXE
 J40oUte9A52OqmUnMM50aBD6KDB1xNbczmXFMxw1u1msHTcW1LIZfv21O
 dMJVBhija0jkYfX/9dpC1FVjsB7J6iulQAVj/jOZirxn/H7kVQY3diaAO
 8wumwyq0MidkRE/xC/F+ODV+5Vo02/kk4/6pVtOZpRnwrG63tFG/iJu7V
 EMdkuUlD3oaXIrWt7JtaxktE/xkL/iJocDgnwQaDLn+MMRZZn8jeGdyTJ
 U3LJOcfbKAOjoosGV9llP+Lhy7akrHFXEbTFH9Gp22EztlP4iWzNreX9K A==;
X-CSE-ConnectionGUID: 2155v9cJR7OnbUHXM4OInw==
X-CSE-MsgGUID: 9fudERbGTWy+64HLTwKQbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74326077"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74326077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:58:42 -0700
X-CSE-ConnectionGUID: FCvhTMY5RuyFMSxFtU5lLw==
X-CSE-MsgGUID: Qtj+K7zMQyWy0VFLp9RdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217095871"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:58:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 maarten.lankhorst@linux.intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 4/4] drm/xe/xe_drm_ras: Add error-event support in XE DRM RAS
Date: Wed, 11 Mar 2026 15:59:18 +0530
Message-ID: <20260311102913.3387468-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260311102913.3387468-6-riana.tauro@intel.com>
References: <20260311102913.3387468-6-riana.tauro@intel.com>
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

Add error-event support in XE DRM RAS to notify userspace
whenever a GT or SoC error occurs.

$ sudo ynl --family drm_ras --subscribe error-notify
{'msg': {'error-id': 1, 'node-id': 1}, 'name': 'error-event'}

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras.c  | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h  |  7 +++++++
 drivers/gpu/drm/xe/xe_hw_error.c |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index c21c8b428de6..47c040c80175 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -181,6 +181,23 @@ static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
 	}
 }
 
+/**
+ * xe_drm_ras_notify() - Notify userspace of an error event
+ * @ras:  ras structure
+ * @error_id: error id
+ * @severity: error severity
+ * @flags: flags for allocation
+ *
+ * Notifies userspace of an error.
+ */
+void xe_drm_ras_notify(struct xe_drm_ras *ras, u32 error_id,
+		       const enum drm_xe_ras_error_severity severity, gfp_t flags)
+{
+	struct drm_ras_node *node = &ras->node[severity];
+
+	drm_ras_error_notify(node, error_id, flags);
+}
+
 /**
  * xe_drm_ras_init() - Initialize DRM RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
index 5cc8f0124411..ac347d0d63eb 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras.h
@@ -5,11 +5,18 @@
 #ifndef XE_DRM_RAS_H_
 #define XE_DRM_RAS_H_
 
+#include <linux/types.h>
+
+#include <drm/xe_drm.h>
+
 struct xe_device;
+struct xe_drm_ras;
 
 #define for_each_error_severity(i)	\
 	for (i = 0; i < DRM_XE_RAS_ERR_SEV_MAX; i++)
 
 int xe_drm_ras_init(struct xe_device *xe);
+void xe_drm_ras_notify(struct xe_drm_ras *ras, u32 error_id,
+		       const enum drm_xe_ras_error_severity severity, gfp_t flags);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2a31b430570e..17424e07e72c 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -332,6 +332,8 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 
 		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
 	}
+
+	xe_drm_ras_notify(ras, error_id, severity, GFP_ATOMIC);
 }
 
 static void soc_slave_ieh_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 error_id)
@@ -368,6 +370,7 @@ static void soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
 	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_drm_ras *ras = &xe->ras;
 	struct xe_mmio *mmio = &tile->mmio;
 	unsigned long master_global_errstat, master_local_errstat;
 	u32 master, slave, regbit;
@@ -418,6 +421,8 @@ static void soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 	for (i = 0; i < XE_SOC_NUM_IEH; i++)
 		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master, slave, i),
 				(HARDWARE_ERROR_MAX << 1) + 1);
+
+	xe_drm_ras_notify(ras, error_id, severity, GFP_ATOMIC);
 }
 
 static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
-- 
2.47.1

