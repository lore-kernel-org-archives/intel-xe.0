Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D9EC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4596E10EF27;
	Fri, 21 Apr 2023 22:33:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1E010E903
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116395; x=1713652395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/8CP3cKIbHC+AXgkxD3fVsdFcUMCW14h5NxuN2oans=;
 b=a51ClP+KRwKxUYSWed2b521277c/XbTRYYaJVjIQyIDM3kRwkIDbpt6C
 ZUkd1QXEi+YTtoJthaFKOr0uOac6QHFnINJ8YUD7flbJAttyfT6pNXYNF
 B7EoEp82VujbX6Ty/DIW7/5aQG9P0D8UylBbGEsaz9iv7QiQXlpIWZBZS
 7Ua+sAGsVJx6nTOxuFEOs29ys+qjRXtp3LCU3lvqqlSpKCCML+BZO8Ldv
 3A0DVzogvQk7JEjOnNP08wZx0WsE3tgvMOoWV1xcclaAnQIa+Bta0LVDJ
 QyIfE/c7Kaghcxm4nAaV2jfbEs/hqWBYuFiRZJpwngy8pEDGciOn2G6PB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693759"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913778"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913778"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:58 -0700
Message-Id: <20230421223258.128781-18-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile         |  2 +-
 drivers/gpu/drm/xe/xe_rtp.h         | 40 +++--------------------
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 49 +++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ee4a95beec20..24c8232fd0be 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -215,7 +215,7 @@ endif
 
 # header test
 always-$(CONFIG_DRM_XE_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(skipdisplay)))
+	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' -not -path xe_rtp_helpers.h $(skipdisplay)))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) $(cflags-display) -S -o /dev/null -x c /dev/null -include $<; touch $@
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 85b107967eeb..11545bed13ee 100644
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
@@ -19,41 +24,6 @@ struct xe_hw_engine;
 struct xe_gt;
 struct xe_reg_sr;
 
-/*
- * Helper macros - not to be used outside this header.
- */
-#define _XE_ESC(...) __VA_ARGS__
-#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
-#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
-
-#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
-#define __XE_CONCAT(a, b) a ## b
-
-#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
-#define __XE_FIRST(x_,...) x_
-#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
-#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
-
-#define __XE_PASTE_SEP_COMMA		,
-#define __XE_PASTE_SEP_BITWISE_OR		|
-#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
-#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
-#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
-#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
-
-#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
-#define _XE_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
-
-/*
- * Helper macros for concatenating prefix - do not use them directly outside
- * this header
- */
-#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
-#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
-#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
-#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
-
 /*
  * Macros to encode rules to match against platform, IP version, stepping, etc.
  * Shouldn't be used directly - see XE_RTP_RULES()
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
new file mode 100644
index 000000000000..eb9c9538d78c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -0,0 +1,49 @@
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
+ * Helper macros for concatenating prefix - do not use them directly outside
+ * this header
+ */
+#define _XE_ESC(...) __VA_ARGS__
+#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
+#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
+
+#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
+#define __XE_CONCAT(a, b) a ## b
+
+#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
+#define __XE_FIRST(x_,...) x_
+#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
+#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
+
+#define __XE_PASTE_SEP_COMMA		,
+#define __XE_PASTE_SEP_BITWISE_OR		|
+#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
+#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
+#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+
+#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
+#define _XE_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
+
+/*
+ * Helper macros for concatenating prefix - do not use them directly outside
+ * this header
+ */
+#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
+#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
+#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
+#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
+
+#endif
-- 
2.39.0

