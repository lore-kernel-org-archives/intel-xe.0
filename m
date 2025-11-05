Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2DCCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079E210E7D1;
	Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIiY8kd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106A010E7D0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762386481; x=1793922481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vNQJGf7VIq05f+i0Cf/GYwUTnszi87SOIKGHYkuU4Do=;
 b=ZIiY8kd/D+0h/Xpl+B9gTDFZuhiEw4TVPeERP2r8LWNK/cUPIQplEZhz
 VPq+OcXxdAZkA9YJbq/tO0Jt5ZrRIKuMBPsfjDVJWz0NQkErQ3l2UznoC
 m2rvmv5AA70MCdJmX2zEmRyeUuPT/0pRTQSX3uuBscRubtw2GfWit/2gM
 hlDo9DN8XGGOIQbV+NFjtwhRYohnKkhk1GAEnhty5gTB08sf8ISMlzd97
 toNwyAPqDMEtcE0iXjT0jfuV5SnrMzZSkr37lazQaUsPwLXCAbI88kcbC
 U8LQICAhhcWXXFNWHjHulGj2/ZhIDZ9xgL7HFRUeAlHHzSszwg4+p4MCm A==;
X-CSE-ConnectionGUID: vy68OcNDT6G5zLTLmKBdgQ==
X-CSE-MsgGUID: jondSxT6QdS2aF5440qTdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="89980378"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="89980378"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
X-CSE-ConnectionGUID: qiISoxukTfegMIi4EkGO3Q==
X-CSE-MsgGUID: 2TRzedy5RoiaS2YckBGw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="188319626"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	badal.nilawar@intel.com
Subject: [PATCH 2/4] drm/xe/remapper: Add lock to serialize access to remapper
 index registers
Date: Wed,  5 Nov 2025 15:47:56 -0800
Message-ID: <20251105234753.603647-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
References: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

The index register provides bit fields for different MMIO ranges that
may be driven by different child drivers. Add some internal APIs to
serialize access to the index register.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_remapper.c     | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_remapper.h     |  1 +
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 47f5391ad8e9..3c5c5e4184c7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -59,6 +59,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_remapper.h"
 #include "xe_shrinker.h"
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
@@ -905,6 +906,7 @@ int xe_device_probe(struct xe_device *xe)
 		return err;
 
 	xe_nvm_init(xe);
+	xe_remapper_init(xe);
 
 	err = xe_heci_gsc_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index dc17f63f9353..72a251204fe3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -536,6 +536,12 @@ struct xe_device {
 		struct mutex lock;
 	} pmt;
 
+	/* @remapper: SoC remapper object */
+	struct {
+		/* Serialize access to SoC Remapper's index registers */
+		spinlock_t lock;
+	} remapper;
+
 	/**
 	 * @pm_callback_task: Track the active task that is running in either
 	 * the runtime_suspend or runtime_resume callbacks.
diff --git a/drivers/gpu/drm/xe/xe_remapper.c b/drivers/gpu/drm/xe/xe_remapper.c
index 1374fc2f4dda..fc67efcf6709 100644
--- a/drivers/gpu/drm/xe/xe_remapper.c
+++ b/drivers/gpu/drm/xe/xe_remapper.c
@@ -3,14 +3,27 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/spinlock.h>
+
 #include "regs/xe_remapper_regs.h"
 #include "xe_mmio.h"
 #include "xe_remapper.h"
 
 void xe_remapper_set_telem_region(struct xe_device *xe, u32 index)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&xe->remapper.lock, flags);
+
 	xe_mmio_rmw32(xe_root_tile_mmio(xe),
 		      SG_REMAP_INDEX1,
 		      SG_REMAP_TELEM_BITS,
 		      REG_FIELD_PREP(SG_REMAP_TELEM_BITS, index));
+
+	spin_unlock_irqrestore(&xe->remapper.lock, flags);
+}
+
+void xe_remapper_init(struct xe_device *xe)
+{
+	spin_lock_init(&xe->remapper.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_remapper.h b/drivers/gpu/drm/xe/xe_remapper.h
index df6b726a97a7..4deb8ad3c69c 100644
--- a/drivers/gpu/drm/xe/xe_remapper.h
+++ b/drivers/gpu/drm/xe/xe_remapper.h
@@ -10,6 +10,7 @@
 
 #include "xe_device_types.h"
 
+void xe_remapper_init(struct xe_device *xe);
 void xe_remapper_set_telem_region(struct xe_device *xe, u32 index);
 
 #endif
-- 
2.43.0

