Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4693C001DE
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 17:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B43610E372;
	Mon,  7 Aug 2023 17:35:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366810E372
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691429706; x=1722965706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G3Rd5KgYevUS0OmSNCToyxewEqssLxph9T4v59Bx3OM=;
 b=hMBSshbkmuXBeAe6ugRNRP8wjSB21GQ1Bdn/Yo/X8Tqar24rUP5V2QAk
 czZ3B6XFCNw2OiHuZVG47CuVuB9zoe3YbpOXXtgtmjTKEzX5mAA8OqNsI
 viZdjoAUWxIhhLg/LGsCkVE0lgiSoY3zo9+8ucK70M2W1Zmyg0xWaWT4v
 a41aodL8hSJahe14kRaoO2Ihfl39i8pp/hDI96AvBPwYjTWSnq7wcn7ei
 /unaj8KY5XqYChrG37Vw5eXPH4+C4KFYfVLSbc26QZHzJhAVwx2h2s8MU
 JOTfsqZGDUZnczcd7Nk63ewPmkFHhpgwEwaj4XezfX2HSE5woaJKsNIh6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="436938525"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="436938525"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 10:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734170617"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="734170617"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.145.2])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 10:35:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  7 Aug 2023 19:34:46 +0200
Message-Id: <20230807173446.2039-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As we are moving away from the controversial XE_BUG_ON macro,
relying just on WARN_ON or drm_err does not cover the cases
where we want to annotate functions with additional detailed
debug checks to assert that all prerequisites are satisfied,
without paying footprint or performance penalty on non-debug
builds, where all misuses introduced during code integration
were already fixed.

Introduce family of xe_ASSERT macros that try to follow classic
assert() utility and can be compiled out on non-debug builds.

Macros are based on drm_WARN, but unlikely to origin, disallow
use in expressions since we will compile that code out.

As we are operating on the xe pointers, we can print additional
information about the device, like tile or GT identifier, that
is not available from generic WARN report:

[ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
    platform: 1 subplatform: 1
    graphics: Xe_LP 12.0 step B0
    media: Xe_M 12.0 step B0
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
new file mode 100644
index 000000000000..7ea295b7091c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_ASSERT_H__
+#define __XE_ASSERT_H__
+
+#include <linux/string_helpers.h>
+#include <drm/drm_print.h>
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
+ * of ASSERT macros that try to follow classic assert() utility and can be
+ * compiled out on non-debug builds:
+ *
+ *  * &xe_ASSERT
+ *  * &xe_tile_ASSERT
+ *  * &xe_gt_ASSERT
+ *
+ * These macros are based on &drm_WARN, but unlikely to the origin, we disallow
+ * use of them in an expressions since we will compile that code out.
+ *
+ * Note that these macros shall not be used to cover known gaps in the
+ * implementation, for such cases use &drm_WARN or &drm_err and provide valid
+ * safe fallback.
+ *
+ * Below code shows how asserts could help in debug to catch unplanned use::
+ *
+ *	static void one_igfx(struct xe_device *xe)
+ *	{
+ *		xe_ASSERT(xe, xe->info.is_dgfx == false);
+ *		xe_ASSERT(xe, xe->info.tile_count == 1);
+ *	}
+ *
+ *	static void two_dgfx(struct xe_device *xe)
+ *	{
+ *		xe_ASSERT(xe, xe->info.is_dgfx);
+ *		xe_ASSERT(xe, xe->info.tile_count == 2);
+ *	}
+ *
+ *	void foo(struct xe_device *xe)
+ *	{
+ *		if (xe->info.dgfx)
+ *			return two_dgfx(xe);
+ *		return one_igfx(xe);
+ *	}
+ */
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
+	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
+		       __stringify(condition), ## arg);						\
+})
+#else
+#define __XE_ASSERT_MSG(xe, condition, msg, arg...) ({						\
+	typecheck(struct xe_device *, xe);							\
+	BUILD_BUG_ON_INVALID(condition);							\
+})
+#endif
+
+/**
+ * xe_ASSERT - warn if condition is false when debugging.
+ * @xe: the &struct xe_device pointer to which &condition applies
+ * @condition: condition to check
+ *
+ * xe_ASSERT() uses &drm_WARN to emit a warning and print additional information
+ * that could be read from the &xe pointer if provided &condition is false.
+ *
+ * Contrary to &drm_WARN, xe_ASSERT() is effective only on debug builds
+ * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
+ * or as a condition.
+ *
+ * See `Xe ASSERTs`_ for general usage guidelines.
+ */
+#define xe_ASSERT(xe, condition) xe_ASSERT_MSG((xe), condition, "")
+#define xe_ASSERT_MSG(xe, condition, msg, arg...) ({						\
+	struct xe_device *__xe = (xe);								\
+	__XE_ASSERT_MSG(__xe, condition,							\
+			"platform: %d subplatform: %d\n"					\
+			"graphics: %s %u.%u step %s\n"						\
+			"media: %s %u.%u step %s\n"						\
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
+ * xe_tile_ASSERT - warn if condition is false when debugging.
+ * @tile: the &struct xe_tile pointer to which &condition applies
+ * @condition: condition to check
+ *
+ * xe_tile_ASSERT() uses &drm_WARN to emit a warning and print additional
+ * information that could be read from the &tile pointer if provided &condition
+ * is false.
+ *
+ * Contrary to &drm_WARN, xe_tile_ASSERT() is effective only on debug builds
+ * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
+ * or as a condition.
+ *
+ * See `Xe ASSERTs`_ for general usage guidelines.
+ */
+#define xe_tile_ASSERT(tile, condition) xe_tile_ASSERT_MSG((tile), condition, "")
+#define xe_tile_ASSERT_MSG(tile, condition, msg, arg...) ({					\
+	struct xe_tile *__tile = (tile);							\
+	char __buf[10];										\
+	xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
+		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
+})
+
+/**
+ * xe_gt_ASSERT - warn if condition is false when debugging.
+ * @gt: the &struct xe_gt pointer to which &condition applies
+ * @condition: condition to check
+ *
+ * xe_gt_ASSERT() uses &drm_WARN to emit a warning and print additional
+ * information that could be safetely read from the &gt pointer if provided
+ * &condition is false.
+ *
+ * Contrary to &drm_WARN, xe_gt_ASSERT() is effective only on debug builds
+ * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
+ * or as a condition.
+ *
+ * See `Xe ASSERTs`_ for general usage guidelines.
+ */
+#define xe_gt_ASSERT(gt, condition) xe_gt_ASSERT_MSG((gt), condition, "")
+#define xe_gt_ASSERT_MSG(gt, condition, msg, arg...) ({						\
+	struct xe_gt *__gt = (gt);								\
+	xe_tile_ASSERT_MSG(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
+			   __gt->info.id, __gt->info.type, ## arg);				\
+})
+
+#endif /* __XE_ASSERT_H__ */
-- 
2.25.1

