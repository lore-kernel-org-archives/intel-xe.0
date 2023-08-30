Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100E4C83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 12:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE7C10E523;
	Wed, 30 Aug 2023 12:38:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6995910E51E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693399099; x=1724935099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FhD3DACSWNA4wuDf173DF7kN9iMBDyVbSxOf9+Qx3ng=;
 b=Qs7B1AaNBJvnNcBae1tkS2U3wd39efRusQyFyp7cTwfBe9cB98bwS7oH
 DFE0tx7zqf0YR5OmleTXijGS0nTSZukBb2KLPq++/l0iy3oFvrslx9Xtk
 9TAixLHebzS/N6hE+3j+E9wR7FuLUOE/SqzzxdAriNyCZE9jUolVyrZG9
 PRgYncm8mLHh1JupYMQHvsePqCRyAkU+2BrQG9YevTKX3KtZEasXLCrU5
 41N7dLS/6pQjiRELQst6F4NcL1pOXDfwWtknG4TaxSdXDyUI/QLhj562s
 3//OPVoP363o7R+mwGQqb18GHU/QJ5KQqZjXKDRlZv7esV2ds2lGZx870 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365835578"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="365835578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="688888250"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="688888250"
Received: from cooperst-gp139.amr.corp.intel.com (HELO 01811ef90267.intel.com)
 ([10.251.214.151])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:37:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 12:37:21 +0000
Message-Id: <20230830123722.6-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230830123722.6-1-francois.dugast@intel.com>
References: <20230830123722.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

As we are moving away from the controversial XE_BUG_ON macro,
relying just on WARN_ON or drm_err does not cover the cases
where we want to annotate functions with additional detailed
debug checks to assert that all prerequisites are satisfied,
without paying footprint or performance penalty on non-debug
builds, where all misuses introduced during code integration
were already fixed.

Introduce family of Xe assert macros that try to follow classic
assert() utility and can be compiled out on non-debug builds.

Macros are based on drm_WARN, but unlikely to origin, disallow
use in expressions since we will compile that code out.

As we are operating on the xe pointers, we can print additional
information about the device, like tile or GT identifier, that
is not available from generic WARN report:

[ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
    platform: 1 subplatform: 1
    graphics: Xe_LP 12.00 step B0
    media: Xe_M 12.00 step B0
    display: enabled step D0
    tile: 0 VRAM 0 B
    GT: 0 type 1

[ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
    platform: 7 subplatform: 3
    graphics: Xe_HPG 12.55 step A1
    media: Xe_HPM 12.55 step A1
    display: disabled step **
    tile: 0 VRAM 14.0 GiB
    GT: 0 type 1

[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
[ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
[ ] Call Trace:
[ ]  ? __warn+0x7b/0x160
[ ]  ? xe_device_probe+0x374/0x520 [xe]
[ ]  ? report_bug+0x1c3/0x1d0
[ ]  ? handle_bug+0x42/0x70
[ ]  ? exc_invalid_op+0x14/0x70
[ ]  ? asm_exc_invalid_op+0x16/0x20
[ ]  ? xe_device_probe+0x374/0x520 [xe]
[ ]  ? xe_device_probe+0x374/0x520 [xe]
[ ]  xe_pci_probe+0x6e3/0x950 [xe]
[ ]  ? lockdep_hardirqs_on+0xc7/0x140
[ ]  pci_device_probe+0x9e/0x160
[ ]  really_probe+0x19d/0x400

v2: use lowercase names
v3: apply xe coding style

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
new file mode 100644
index 000000000000..b2d3c9b82b31
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_ASSERT_H_
+#define _XE_ASSERT_H_
+
+#include <linux/string_helpers.h>
+
+#include <drm/drm_print.h>
+
+#include "xe_device_types.h"
+#include "xe_step.h"
+
+/**
+ * DOC: Xe ASSERTs
+ *
+ * While Xe driver aims to be simpler than legacy i915 driver it is still
+ * complex enough that some changes introduced while adding new functionality
+ * could break the existing code.
+ *
+ * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
+ * to undesired increased driver footprint and may impact production driver
+ * performance as this additional code will be always present.
+ *
+ * To allow annotate functions with additional detailed debug checks to assert
+ * that all prerequisites are satisfied, without worrying about footprint or
+ * performance penalty on production builds where all potential misuses
+ * introduced during code integration were already fixed, we introduce family
+ * of Xe assert macros that try to follow classic assert() utility:
+ *
+ *  * &xe_assert
+ *  * &xe_tile_assert
+ *  * &xe_gt_assert
+ *
+ * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
+ * warning is triggered when provided condition is false. Additionally all above
+ * assert macros cannot be used in expressions or as a condition, since
+ * underlying code will be compiled out on non-debug builds.
+ *
+ * Note that these macros are not intended for use to cover known gaps in the
+ * implementation; for such cases use regular &drm_WARN or &drm_err and provide
+ * valid safe fallback.
+ *
+ * Also in cases where performance or footprint is not an issue, developers
+ * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
+ * reports from production builds will contain meagningful diagnostics data.
+ *
+ * Below code shows how asserts could help in debug to catch unplanned use::
+ *
+ *	static void one_igfx(struct xe_device *xe)
+ *	{
+ *		xe_assert(xe, xe->info.is_dgfx == false);
+ *		xe_assert(xe, xe->info.tile_count == 1);
+ *	}
+ *
+ *	static void two_dgfx(struct xe_device *xe)
+ *	{
+ *		xe_assert(xe, xe->info.is_dgfx);
+ *		xe_assert(xe, xe->info.tile_count == 2);
+ *	}
+ *
+ *	void foo(struct xe_device *xe)
+ *	{
+ *		if (xe->info.dgfx)
+ *			return two_dgfx(xe);
+ *		return one_igfx(xe);
+ *	}
+ *
+ *	void bar(struct xe_device *xe)
+ *	{
+ *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
+ *			return;
+ *
+ *		if (xe->info.tile_count == 2)
+ *			return two_dgfx(xe);
+ *		return one_igfx(xe);
+ *	}
+ */
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
+	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
+		       __stringify(condition), ## arg);						\
+})
+#else
+#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
+	typecheck(struct xe_device *, xe);							\
+	BUILD_BUG_ON_INVALID(condition);							\
+})
+#endif
+
+/**
+ * xe_assert - warn if condition is false when debugging.
+ * @xe: the &struct xe_device pointer to which &condition applies
+ * @condition: condition to check
+ *
+ * xe_assert() uses &drm_WARN to emit a warning and print additional information
+ * that could be read from the &xe pointer if provided &condition is false.
+ *
+ * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
+ * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
+ * or as a condition.
+ *
+ * See `Xe ASSERTs`_ for general usage guidelines.
+ */
+#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
+#define xe_assert_msg(xe, condition, msg, arg...) ({						\
+	struct xe_device *__xe = (xe);								\
+	__xe_assert_msg(__xe, condition,							\
+			"platform: %d subplatform: %d\n"					\
+			"graphics: %s %u.%02u step %s\n"					\
+			"media: %s %u.%02u step %s\n"						\
+			"display: %s step %s\n"							\
+			msg,									\
+			__xe->info.platform, __xe->info.subplatform,				\
+			__xe->info.graphics_name,						\
+			__xe->info.graphics_verx100 / 100,					\
+			__xe->info.graphics_verx100 % 100,					\
+			xe_step_name(__xe->info.step.graphics),					\
+			__xe->info.media_name,							\
+			__xe->info.media_verx100 / 100,						\
+			__xe->info.media_verx100 % 100,						\
+			xe_step_name(__xe->info.step.media),					\
+			str_enabled_disabled(__xe->info.enable_display),			\
+			xe_step_name(__xe->info.step.display),					\
+			## arg);								\
+})
+
+/**
+ * xe_tile_assert - warn if condition is false when debugging.
+ * @tile: the &struct xe_tile pointer to which &condition applies
+ * @condition: condition to check
+ *
+ * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
+ * information that could be read from the &tile pointer if provided &condition
+ * is false.
+ *
+ * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
+ * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
+ * or as a condition.
+ *
+ * See `Xe ASSERTs`_ for general usage guidelines.
+ */
+#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
+#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
+	struct xe_tile *__tile = (tile);							\
+	char __buf[10];										\
+	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
+		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
+})
+
+/**
+ * xe_gt_assert - warn if condition is false when debugging.
+ * @gt: the &struct xe_gt pointer to which &condition applies
+ * @condition: condition to check
+ *
+ * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
+ * information that could be safetely read from the &gt pointer if provided
+ * &condition is false.
+ *
+ * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
+ * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
+ * or as a condition.
+ *
+ * See `Xe ASSERTs`_ for general usage guidelines.
+ */
+#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
+#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
+	struct xe_gt *__gt = (gt);								\
+	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
+			   __gt->info.id, __gt->info.type, ## arg);				\
+})
+
+#endif
-- 
2.34.1

