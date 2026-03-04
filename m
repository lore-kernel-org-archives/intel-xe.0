Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C083DEF8FF2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 14:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCD110EA2C;
	Wed,  4 Mar 2026 14:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGxowV9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3F10EA2C;
 Wed,  4 Mar 2026 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772635290; x=1804171290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7CNAZKJ4LJXr9X7pkHlMpWnZO+2aJ+BHZi6Te7Ydf0A=;
 b=gGxowV9P0sZoIFJC7WFvuZ5yTFfq86TBJ4l0UDN4AzqcWblwwEy3N1ZE
 dfpmBsf4ilI2q7gHEJqO5zkEvGwkiKrae5BgCvRvi64aNeUZBgRqUQazL
 w5017e0QA6NXzeDCwidQRg+oJRzwHLq85f8qADBnNDnlfGG74lbGlykCo
 aRZYTYgJYvEVS1V1Gx4/jO30/wC+fjz7YFu39i6YAeMfZ40K+woGcm5Fy
 ESuOA1Q+RRehbgsn32Eh2zDdREIY/2K/SSHN9Ve5rz0VLCI8jkCok3Wbn
 ATiJx5zkr5Pja/TbfD0jPAYiwWzoCKekzBl9isQ2YqKjaNp2nubpqE93E A==;
X-CSE-ConnectionGUID: Aw3LMxVKR22mQJcmpMqtvw==
X-CSE-MsgGUID: nvl3QohURI+SkazUDgo0Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84330071"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84330071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:29 -0800
X-CSE-ConnectionGUID: 1826xYVATZO47Fk4PQ0QBg==
X-CSE-MsgGUID: N+t61tpOREanzoA04H3PLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218479421"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:41:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 6/8] drm/xe/step: switch to the shared step definitions with
 i915
Date: Wed,  4 Mar 2026 16:40:51 +0200
Message-ID: <a24789601b74cccdcb2f57b19ea6a609b8e53e16.1772635152.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use the shared stepping enums from include/drm/intel/step.h.

For now, define xe_step as intel_step to avoid mass renames at the same
time. For compat, we can remove the reverse macro.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_step.h   |  4 +-
 drivers/gpu/drm/xe/xe_step_types.h            | 63 ++-----------------
 2 files changed, 5 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
index 0eabe2866f5f..cb55a659856b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
@@ -6,8 +6,6 @@
 #ifndef __INTEL_STEP_H__
 #define __INTEL_STEP_H__
 
-#include "xe_step_types.h"
-
-#define intel_step xe_step
+#include <drm/intel/step.h>
 
 #endif /* __INTEL_STEP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
index d978cc2512f2..bc3ed5a8282a 100644
--- a/drivers/gpu/drm/xe/xe_step_types.h
+++ b/drivers/gpu/drm/xe/xe_step_types.h
@@ -8,69 +8,14 @@
 
 #include <linux/types.h>
 
+#include <drm/intel/step.h>
+
+#define xe_step intel_step
+
 struct xe_step_info {
 	u8 graphics;
 	u8 media;
 	u8 basedie;
 };
 
-#define STEP_ENUM_VAL(name)  STEP_##name,
-
-/*
- * Always define four minor steppings 0-3 for each stepping to match GMD ID
- * spacing of values. See xe_step_gmdid_get().
- */
-#define STEP_NAME_LIST(func)		\
-	func(A0)			\
-	func(A1)			\
-	func(A2)			\
-	func(A3)			\
-	func(B0)			\
-	func(B1)			\
-	func(B2)			\
-	func(B3)			\
-	func(C0)			\
-	func(C1)			\
-	func(C2)			\
-	func(C3)			\
-	func(D0)			\
-	func(D1)			\
-	func(D2)			\
-	func(D3)			\
-	func(E0)			\
-	func(E1)			\
-	func(E2)			\
-	func(E3)			\
-	func(F0)			\
-	func(F1)			\
-	func(F2)			\
-	func(F3)			\
-	func(G0)			\
-	func(G1)			\
-	func(G2)			\
-	func(G3)			\
-	func(H0)			\
-	func(H1)			\
-	func(H2)			\
-	func(H3)			\
-	func(I0)			\
-	func(I1)			\
-	func(I2)			\
-	func(I3)			\
-	func(J0)			\
-	func(J1)			\
-	func(J2)			\
-	func(J3)
-
-/*
- * Symbolic steppings that do not match the hardware. These are valid both as gt
- * and display steppings as symbolic names.
- */
-enum xe_step {
-	STEP_NONE = 0,
-	STEP_NAME_LIST(STEP_ENUM_VAL)
-	STEP_FUTURE,
-	STEP_FOREVER,
-};
-
 #endif
-- 
2.47.3

