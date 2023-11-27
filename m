Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EB7C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957C510E0CB;
	Mon, 27 Nov 2023 19:59:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9748C10E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701115153; x=1732651153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrtZ1kEMSvNHyvpjsM9jRpSECuhmwCDjGvI7pB22Odk=;
 b=BF9w4AfSc+oL7e5xu4r+oF81c9racZaaVVFylby+rHyd3L3S25kNA5wB
 vi3iOXvm1N5KlFaNxWilmJLekicBndmULh9WY5XRAK1h/kwCo+a50hIPE
 2VbXOvfNqFgOYG4COz1oDgskwzzZi0+iaz2VmpRDm2DBhhZThDwFuVlV3
 tf6G+SZs23XaVZK7wjMsvh44pLLxJSc5xKu0lIfOa14B3vsGcXltaP+SN
 UkD1mOCgSoeVQ9jEb9e1IqQPFAvGsEAM2s5LWrFON5/e6RGD61QYwjeth
 SxWzl8G28+nAv39HPm9s9sRWUJ3DcrIL8lrdRCVO3REUJ3FeLCGQtVjF8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383163977"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="383163977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="16705600"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2023 11:59:13 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:58:54 -0800
Message-Id: <20231127195856.4183070-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
References: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Rename xe_gt_idle_sysfs to xe_gt_idle
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

Prep this file to contain C6 toggling as well instead
of just sysfs related stuff.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile                               | 2 +-
 drivers/gpu/drm/xe/xe_gt.c                                | 2 +-
 drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c}   | 4 ++--
 drivers/gpu/drm/xe/{xe_gt_idle_sysfs.h => xe_gt_idle.h}   | 8 ++++----
 .../xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h}   | 0
 drivers/gpu/drm/xe/xe_gt_types.h                          | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c} (98%)
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.h => xe_gt_idle.h} (52%)
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h} (100%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 551adbc22b5a..18410dd9cb10 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -61,7 +61,7 @@ xe-y += xe_bb.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
-	xe_gt_idle_sysfs.o \
+	xe_gt_idle.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0dddb751c6a4..b3686c34477b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -22,7 +22,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt_clock.h"
-#include "xe_gt_idle_sysfs.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle.c
similarity index 98%
rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
rename to drivers/gpu/drm/xe/xe_gt_idle.c
index 8df9840811cd..e5b7e5d38e76 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -7,14 +7,14 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_idle_sysfs.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 
 /**
  * DOC: Xe GT Idle
  *
- * Provides sysfs entries for idle properties of GT
+ * Contains functions that init GT idle features like C6
  *
  * device/gt#/gtidle/name - name of the state
  * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle.h
similarity index 52%
rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
rename to drivers/gpu/drm/xe/xe_gt_idle.h
index b0973f96c7ab..9b36bf7db3a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -3,11 +3,11 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_GT_IDLE_SYSFS_H_
-#define _XE_GT_IDLE_SYSFS_H_
+#ifndef _XE_GT_IDLE_H_
+#define _XE_GT_IDLE_H_
 
-#include "xe_gt_idle_sysfs_types.h"
+#include "xe_gt_idle_types.h"
 
 void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
 
-#endif /* _XE_GT_IDLE_SYSFS_H_ */
+#endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
similarity index 100%
rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
rename to drivers/gpu/drm/xe/xe_gt_idle_types.h
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..a96ee7d028aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -7,7 +7,7 @@
 #define _XE_GT_TYPES_H_
 
 #include "xe_force_wake_types.h"
-#include "xe_gt_idle_sysfs_types.h"
+#include "xe_gt_idle_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_reg_sr_types.h"
-- 
2.38.1

