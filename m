Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9709606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lAs8qSZa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB694112730;
	Thu, 26 Nov 2026 21:28:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A31311272D;
 Thu, 26 Nov 2026 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728482; x=1827264482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bmhEm4smvclAg7EDy2qOZ+JA+1N6/ISnTxZ0/WCWqCc=;
 b=lAs8qSZaNOQhawWBP55lUc6ju4vGZWk+NpmRrL6Pr0l8fbzizRMqMU7j
 Lb3h2u+5PgxzUKduUUhDMqzHOb0pIv7OtigVHUI7s7nU0KtaqF4nDxA/d
 VAYLKpeZ83MMAzpYJb8rBI4Hfi3YK68zbSZ6Gnmrh+GEGu6emAcO95Ot/
 c5okLOw2TWd+ycBHSFbJeJnobLh5fkZPtltxnRLjOzVQNe8+rhTYYqDOs
 inl+GlbhtB2yoxPtawCmq1ZF1xDrS9twTP7Xo+Daor00vd7qtf55A/YLw
 NRtXyO3NCp7/ajrBfSyf2cI4gMKZ2ouLNWYb1dDtqB5TYJs8I2RqdpYZN w==;
X-CSE-ConnectionGUID: NaUvxGsJTouEVh++T8zgpA==
X-CSE-MsgGUID: KI6g00y4TvyLDnTaEubD7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4537102"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4537102"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:28:02 -0800
X-CSE-ConnectionGUID: C0E2MCt5SIunGd9MpzHw3w==
X-CSE-MsgGUID: wElGjv10TVeC+Lud2yOJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="13933852"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:28:00 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/xe: Nuke the compat uncore stuff
Date: Thu, 26 Nov 2026 23:27:27 +0200
Message-ID: <20261126212728.9034-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The display code no longer uses any uncore stuff, so nuke the
compatibility layer from xe.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 66 -------------------
 drivers/gpu/drm/xe/display/xe_display.c       |  3 -
 drivers/gpu/drm/xe/xe_device_types.h          | 13 ----
 3 files changed, 82 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
deleted file mode 100644
index 707f7ad0378d..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef __INTEL_UNCORE_H__
-#define __INTEL_UNCORE_H__
-
-#include "i915_reg_defs.h"
-#include "xe_device.h"
-#include "xe_device_types.h"
-#include "xe_mmio.h"
-
-static inline struct intel_uncore *to_intel_uncore(struct drm_device *drm)
-{
-	return &to_xe_device(drm)->uncore;
-}
-
-static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncore)
-{
-	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
-
-	return xe_root_tile_mmio(xe);
-}
-
-static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
-				    i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
-}
-
-static inline void intel_uncore_write8(struct intel_uncore *uncore,
-				       i915_reg_t i915_reg, u8 val)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	xe_mmio_write8(__compat_uncore_to_mmio(uncore), reg, val);
-}
-
-static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
-				      i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
-}
-
-static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
-				       i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
-}
-
-static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
-					 i915_reg_t i915_reg, u32 val)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
-}
-
-#endif /* __INTEL_UNCORE_H__ */
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 5ace8295b498..6a179d0683e5 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -85,9 +85,6 @@ int xe_display_init_early(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return 0;
 
-	/* Fake uncore lock */
-	spin_lock_init(&xe->uncore.lock);
-
 	intel_display_driver_early_probe(display);
 
 	intel_display_device_info_runtime_init(display);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9e0d7d3d07d5..abc70c949b2c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -649,19 +649,6 @@ struct xe_device {
 #endif
 
 	/* private: */
-
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	/*
-	 * Any fields below this point are the ones used by display.
-	 * They are temporarily added here so xe_device can be desguised as
-	 * drm_i915_private during build. After cleanup these should go away,
-	 * migrating to the right sub-structs
-	 */
-
-	struct intel_uncore {
-		spinlock_t lock;
-	} uncore;
-#endif
 };
 
 /**
-- 
2.56.1

