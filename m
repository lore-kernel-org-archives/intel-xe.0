Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF75C001E0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 19:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0DE10E781;
	Fri, 28 Jul 2023 19:25:39 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5B410E781
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690572337; x=1722108337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H98Cvbb1dAgjKImQ/kj42xXJWcuZQOXE+gaMaiyBzj4=;
 b=GDnLWUNrtxjJZuVjX/McMQMTLjiNUFqKz85o2faGtk9fsaGQXcWRpcpZ
 lfzZiNC7r5XOxgROaXyzKahDmbIcjffN2bempEoXsRAIfo0n3ZRCdhGaA
 tGmhHZqp4rE2BZm02PQXZdJ/dZarUqUyXYkbhdmvBdNfEnmdYx9bjuaQH
 mhx3g689TduM+XZIiJtdol60F8CS3iX5qW4qmxxtfG3viBha8SNLIQOTY
 WM3GHAQMstVOQMlF4k7Kwu5ThcROMekiSeNYX/CYaBLaa3ePPmw+Oo495
 fMpknq9UaFSKN06astsgtoh/H5zPMwhfWvvB4b+Y2nNEE+L+qRuWhzxM/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348957808"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="348957808"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 12:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="797528454"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="797528454"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.133.86])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 12:25:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Jul 2023 21:25:18 +0200
Message-Id: <20230728192518.1951-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe: Introduce xe_ASSERT macros
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

[ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
    graphics: Xe_LP 12.0 media: Xe_M 12.0 GT0
[ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280 xe_device_probe+0x2f5/0x4a0 [xe]
[ ] RIP: 0010:xe_device_probe+0x2f5/0x4a0 [xe]

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
new file mode 100644
index 000000000000..65306768d637
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_ASSERT_H__
+#define __XE_ASSERT_H__
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+
+#define xe_ASSERT_MSG(xe, condition, fmt, arg...) ({						\
+	struct xe_device *__xe = (xe);								\
+	int __passed = !!(condition);								\
+	drm_WARN(&__xe->drm, !__passed, "[" DRM_NAME "] Assertion `%s` failed!\n"		\
+		 "graphics: %s %u.%u media: %s %u.%u " fmt,					\
+		 __stringify(condition),							\
+		 __xe->info.graphics_name,							\
+		 __xe->info.graphics_verx100 / 100, __xe->info.graphics_verx100 % 100,		\
+		 __xe->info.media_name,								\
+		 __xe->info.media_verx100 / 100, __xe->info.media_verx100 % 100,		\
+		 ## arg);									\
+	(void)(__passed);									\
+})
+
+#else
+
+#define xe_ASSERT_MSG(xe, condition, fmt, arg...) ({						\
+	typecheck(struct xe_device *, xe);							\
+	BUILD_BUG_ON_INVALID(condition);							\
+})
+
+#endif
+
+#define xe_ASSERT(xe, condition) \
+	xe_ASSERT_MSG((xe), condition, "")
+
+#define xe_tile_ASSERT(tile, condition) ({							\
+	struct xe_tile *__tile = (tile);							\
+	xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile%u ", __tile->id);			\
+})
+
+#define xe_gt_ASSERT(gt, condition) ({								\
+	struct xe_gt *__gt = (gt);								\
+	xe_ASSERT_MSG(gt_to_xe(__gt), condition, "GT%u ", __gt->info.id);			\
+})
+
+#endif /* __XE_ASSERT_H__ */
-- 
2.25.1

