Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D522C7EE39
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213CE10ED44;
	Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474D110E127
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284188; x=1708820188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEnKO6/qwrheLJRuJUhFAmSjVqnRtGmFMkv9BL0KwJ4=;
 b=TMTK2fBic51HAZ3MX57ISeO2f8oNxvdKhyZRT5FgzLjwW5vi60vvWWn+
 PpYP9NTpekI4cx4PiuhXRlnzVnRbHrKNLyIS417HNZug1Qicu3+7fwreo
 LLANaVPPlfw8cnAMX2G6mFjpms7z02czQ3Su7bZ/xoXn840SkH3CquR6H
 DjHMVBGxeLi2AdFC6k0oMGfHd9p+shqmzBnKa1RStVgKkikS8Uhw4UZtA
 G9ZARDz8QbTfH49U+nt9NWOFniEu8YSduzow+6FrqdaoJo5CHdGuC5NtF
 lDgDhRA4wKVw5hylHVShgyQzfYoN4pw1UaUVOSzS0a8S+MM22Igml8JRd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297353"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297353"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956599"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956599"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:46 -0800
Message-Id: <20230225001548.1743820-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225001548.1743820-1-lucas.demarchi@intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 10/12] drm/xe: Add missing includes for
 i915_reg_defs.h and others
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Several places were missing the i915_reg_defs.h include. Any place using
the i915_reg_t typedef or macros like _MMIO(), FIELD_PREP(), etc should
include the register defining them explicitly.

This has gone unnoticed due to the way the display is integrated. By
including the display headers the i915_reg_defs.h is indirectly
included. Also, although the Makefile tries to add more cflags for the
display part, it fails in doing so: those cflags are actually added to
the entire Makefile (see subdir-ccflags documentation).

This change is obtained by temporarily removing display from xe and
fixing the breakages.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 6 ++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 ++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 2 ++
 drivers/gpu/drm/xe/xe_migrate.c      | 2 ++
 drivers/gpu/drm/xe/xe_pcode_api.h    | 2 ++
 drivers/gpu/drm/xe/xe_step.c         | 2 ++
 6 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45e3c740fda2..8f2b2acd4024 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -31,6 +31,10 @@
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
 
+#include "../i915/i915_reg_defs.h"
+
+#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_file *xef;
@@ -405,8 +409,6 @@ static void device_kill_persitent_engines(struct xe_device *xe,
 	mutex_unlock(&xe->persitent_engines.lock);
 }
 
-#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
-
 void xe_device_wmb(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 0e7047b89a83..19403dbea9f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -20,6 +20,8 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+#include "../i915/i915_reg_defs.h"
+
 struct pagefault {
 	u64 page_addr;
 	u32 asid;
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index c76aaea1887c..264d6429318b 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -10,6 +10,8 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
+#include "../i915/i915_reg_defs.h"
+
 #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6c0033cb238f..d845f7cadbd4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -28,6 +28,8 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+#include "../i915/i915_reg_defs.h"
+
 /**
  * struct xe_migrate - migrate context.
  */
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 0762c8a912c7..2103f684a8b5 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -5,6 +5,8 @@
 
 /* Internal to xe_pcode */
 
+#include "../i915/i915_reg_defs.h"
+
 #define PCODE_MAILBOX			_MMIO(0x138124)
 #define   PCODE_READY			REG_BIT(31)
 #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index ca77d0971529..e5e77cb9ea09 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -8,6 +8,8 @@
 #include "xe_device.h"
 #include "xe_platform_types.h"
 
+#include "../i915/i915_reg_defs.h"
+
 /*
  * Provide mapping between PCI's revision ID to the individual GMD
  * (Graphics/Media/Display) stepping values that can be compared numerically.
-- 
2.39.0

