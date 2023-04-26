Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7054C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7708A10EA56;
	Wed, 26 Apr 2023 21:33:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890A10E335
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544777; x=1714080777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=icPEAZbOonAullGTrMwP0F3WtIFH6J3WHudz5fg+CuQ=;
 b=BPyvF7hl1yyqSID6xlTN/TJVYhynuWZMKI2++54oxcH8hxasuYFWp/lE
 GHPVF5JAAum06Kq6DhchCuKbgRf5BPLeJV1BH4aoExKLpvnA2mqL1lLGf
 AXWTVl/PXuMowPiA8JHEgW2iPJUkE/6VDwHF7P6B2Ih9ytA+pfWmxlo1U
 2zLZYBsl/vIOABUYjIyC8CI7CSE9bXGqdeEODwKAbmgvUBfEtj4Qxmu+g
 KoQZsDTKL1yEe4wSXdY7q1pKEsYVPc4yP0OjmmOpLy14aRgflzD9XY+Y+
 Gw/QbQlWm+HGZ2Zp7McPr7yVjFZ9bWx9WVSrarVOfMN+Bxh4yOaLgZrB8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213100"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213100"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415203"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415203"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:42 -0700
Message-Id: <20230426213242.1315119-18-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 17/17] drm/xe: Move helper macros to separate
 header
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The macros to handle the RTP tables are very scary, but shouldn't be
used outside of the header adding the infra. Move it to a separate
header and make sure it's only included when it can be.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/Makefile         |  7 +--
 drivers/gpu/drm/xe/xe_rtp.h         | 75 ++------------------------
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 81 +++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ee4a95beec20..74a84080f242 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -209,13 +209,14 @@ endif
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
+# header test
+hdrtest_find_args := -not -path xe_rtp_helpers.h
 ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
-	skipdisplay:=-not -path display/\* -not -path compat-i915-headers/\* -not -path xe_display.h
+	hdrtest_find_args += -not -path display/\* -not -path compat-i915-headers/\* -not -path xe_display.h
 endif
 
-# header test
 always-$(CONFIG_DRM_XE_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(skipdisplay)))
+	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(hdrtest_find_args)))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) $(cflags-display) -S -o /dev/null -x c /dev/null -include $<; touch $@
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4a333b9792ac..8bc946694bfc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -9,8 +9,13 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 
+#define _XE_RTP_INCLUDE_PRIVATE_HELPERS
+
+#include "xe_rtp_helpers.h"
 #include "xe_rtp_types.h"
 
+#undef _XE_RTP_INCLUDE_PRIVATE_HELPERS
+
 /*
  * Register table poke infrastructure
  */
@@ -19,76 +24,6 @@ struct xe_hw_engine;
 struct xe_gt;
 struct xe_reg_sr;
 
-/*
- * Helper macros - not to be used outside this header.
- */
-#define _XE_ESC(...) __VA_ARGS__
-#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
-#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
-
-#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
-#define __XE_FIRST(x_,...) x_
-#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
-#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
-
-#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
-
-#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
-#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
-
-#define __XE_RTP_PASTE_SEP_COMMA		,
-#define __XE_RTP_PASTE_SEP_BITWISE_OR		|
-
-/*
- * XE_RTP_PASTE_FOREACH - Paste XE_RTP_<@prefix_> on each element of the tuple
- * @args, with the end result separated by @sep_. @sep must be one of the
- * previously declared macros __XE_RTP_PASTE_SEP_*, or declared with such
- * prefix.
- *
- * Examples:
- *
- * 1) XE_RTP_PASTE_FOREACH(TEST_, COMMA, (FOO, BAR))
- *    expands to:
- *
- *	XE_RTP_TEST_FOO , XE_RTP_TEST_BAR
- *
- * 2) XE_RTP_PASTE_FOREACH(TEST2_, COMMA, (FOO))
- *    expands to:
- *
- *	XE_RTP_TEST2_FOO
- *
- * 3) XE_RTP_PASTE_FOREACH(TEST3, BITWISE_OR, (FOO, BAR))
- *    expands to:
- *
- *	XE_RTP_TEST3_FOO | XE_RTP_TEST3_BAR
- *
- * 4) #define __XE_RTP_PASTE_SEP_MY_SEP	BANANA
- *    XE_RTP_PASTE_FOREACH(TEST_, MY_SEP, (FOO, BAR))
- *    expands to:
- *
- *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
- */
-#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
-#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
-#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
-
-
-/*
- * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
- *
- * Example:
- *
- *	#define foo(a_)	((struct foo){ .a = a_ })
- *	XE_RTP_DROP_CAST(foo(10))
- *	expands to:
- *
- *	{ .a = 10 }
- */
-#define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
-
-
 /*
  * Macros to encode rules to match against platform, IP version, stepping, etc.
  * Shouldn't be used directly - see XE_RTP_RULES()
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
new file mode 100644
index 000000000000..1beea434d52d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_RTP_HELPERS_
+#define _XE_RTP_HELPERS_
+
+#ifndef _XE_RTP_INCLUDE_PRIVATE_HELPERS
+#error "This header is supposed to be included by xe_rtp.h only"
+#endif
+
+/*
+ * Helper macros - not to be used outside this header.
+ */
+#define _XE_ESC(...) __VA_ARGS__
+#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
+#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
+
+#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
+#define __XE_FIRST(x_,...) x_
+#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
+#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
+
+#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
+
+#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
+#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
+
+#define __XE_RTP_PASTE_SEP_COMMA		,
+#define __XE_RTP_PASTE_SEP_BITWISE_OR		|
+
+/*
+ * XE_RTP_PASTE_FOREACH - Paste XE_RTP_<@prefix_> on each element of the tuple
+ * @args, with the end result separated by @sep_. @sep must be one of the
+ * previously declared macros __XE_RTP_PASTE_SEP_*, or declared with such
+ * prefix.
+ *
+ * Examples:
+ *
+ * 1) XE_RTP_PASTE_FOREACH(TEST_, COMMA, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST_FOO , XE_RTP_TEST_BAR
+ *
+ * 2) XE_RTP_PASTE_FOREACH(TEST2_, COMMA, (FOO))
+ *    expands to:
+ *
+ *	XE_RTP_TEST2_FOO
+ *
+ * 3) XE_RTP_PASTE_FOREACH(TEST3, BITWISE_OR, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST3_FOO | XE_RTP_TEST3_BAR
+ *
+ * 4) #define __XE_RTP_PASTE_SEP_MY_SEP	BANANA
+ *    XE_RTP_PASTE_FOREACH(TEST_, MY_SEP, (FOO, BAR))
+ *    expands to:
+ *
+ *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
+ */
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+
+/*
+ * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
+ *
+ * Example:
+ *
+ *	#define foo(a_)	((struct foo){ .a = a_ })
+ *	XE_RTP_DROP_CAST(foo(10))
+ *	expands to:
+ *
+ *	{ .a = 10 }
+ */
+#define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
+
+#endif
-- 
2.40.1

