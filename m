Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C6CCD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 18:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C0610F6CB;
	Fri, 22 May 2026 18:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBXAIkX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587CA10E27F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779476185; x=1811012185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SD64Z4rosHYIDME+O81KlcSCRaqXPoD/U6QTHP2Wz5k=;
 b=nBXAIkX7CIWVgxiiVQMDCywpCdga+OgLJnFrZpyFl2/Gs6XRA17UdSPc
 jE2x/2gOSljt0/io6pJRU/PG4pnSPXFAcqM0Nx7agQnoqawu5CsKQV/BC
 CM3rjXRIJQwmCj16A6HT+7oRkhXB6iaxsAaXeFLmL8SnGq0cmJIdocuC0
 Gfy0Eg7kLQ0MIUIWGlHeE9eKonYTtONH0Z13Z9lT0Et+7SsMKaLJNgNfo
 8489l7wpopubsoGloQjPkvXW+vejcr8/OhSEHWYpRlrlE4Yq+0qFcvYfC
 J5VDX+6l3K0OgWc+4q4Thl/cosAc1E6JWZhTXtyidQ1SFGIk7mkuSn2f6 g==;
X-CSE-ConnectionGUID: U/vbokFVSr2to2ML/z/1mw==
X-CSE-MsgGUID: 7AbdwwhaS4SgWTrhsdZFBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84028465"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84028465"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:56:24 -0700
X-CSE-ConnectionGUID: TRT6UQeFSYaKm0SaFv/3Aw==
X-CSE-MsgGUID: FOcCzpLhTyW6daa2c00YSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246061209"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:56:23 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v3 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules with
 engine types
Date: Fri, 22 May 2026 11:56:11 -0700
Message-ID: <20260522185609.2252126-8-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522185609.2252126-6-violet.monti@intel.com>
References: <20260522185609.2252126-6-violet.monti@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It is currently possible for a RTP rule, and subsequently a workaround,
to expect contexts that may not be present when the workaround is
applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa.c
expect an engine entity to be active. Conversely, the gt_was[] is not
depending on an engine entity to implement its workarounds. This kunit
test addition checks the gt_was[] workaround list for any workarounds
with XEP_RTP_ENGINE_CLASS() rules. If a workaround does have one of
these rules, the workaround is then checked for the "FOREACH_ENGINE" flag,
which ensures the workaround is implemented properly.

The result of this test is an expectation failure if a workaround has an
improper XE_RTP_ENGINE_CLASS() rule setup, and aims to prevent future
issues of gt_was workarounds being applied without proper contexts.

The gt_tunings[] RTP table has the same functional layout and
requirements as gt_was[], so it shares the same kunit test function,
minimizing excessive code.

v3:
    - Removed "VISIBLE_IF_KUNIT" keyword from xe_wa.h
    - Added gt_tunings[] for testing
    - Reworked KUNIT_EXPECT_TRUE() for easier parsing of errors

v2:
    - Moved contents of xe_rtp_tables_test.h to .c and removed file
    - Renamed macro RTP_KUNIT_ARRAY_PARAM to RTP_TABLE_PARAM
    - Removed unnecessary functions and iterative components from
      generated _gen_params functions and implemented usage of table
      name and WA number as entry name
    - Condensed xe_rtp_table_gt_test() to use KUNIT_EXPECT_TRUE with no
      message statement
    - Removed xe_rtp_table_test_init() and xe_rtp_table_test_exit() as
      fake device initialization is not necessary

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/Makefile             |  1 +
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 55 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tuning.c                |  3 +-
 drivers/gpu/drm/xe/xe_tuning.h                |  6 ++
 drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
 drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
 6 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 0e3408f4952c..f7aa47f11a36 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
 	xe_args_test.o \
 	xe_pci_test.o \
+	xe_rtp_tables_test.o \
 	xe_rtp_test.o \
 	xe_wa_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
new file mode 100644
index 000000000000..fc707d972249
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_kunit_helpers.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+#include "xe_rtp.h"
+#include "xe_tuning.h"
+#include "xe_wa.h"
+
+#define RTP_TABLE_PARAM(table)									\
+	static const void *table##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
+	{											\
+		typeof((table.entries)[0]) *__next = prev ?					\
+			((typeof(__next))prev) + 1 : (table.entries);				\
+		if (__next - table.entries < table.n_entries) {					\
+			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	\
+			return __next;								\
+		}										\
+		return NULL;									\
+	}
+
+static void xe_rtp_table_gt_test(struct kunit *test)
+{
+	const struct xe_rtp_entry_sr *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++) {
+		KUNIT_EXPECT_TRUE(test,
+				  entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS ||
+				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
+		KUNIT_EXPECT_TRUE(test,
+				  entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS ||
+				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
+	}
+}
+
+RTP_TABLE_PARAM(gt_was);
+RTP_TABLE_PARAM(gt_tunings);
+
+static struct kunit_case xe_rtp_table_tests[] = {
+	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_tunings_gen_params),
+	{}
+};
+
+static struct kunit_suite xe_rtp_tables_test_suite = {
+	.name = "xe_rtp_tables_test",
+	.test_cases = xe_rtp_table_tests,
+};
+
+kunit_test_suite(xe_rtp_tables_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index bf3fad9cdbef..bcec40ca2d35 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -20,7 +20,7 @@
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
-static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
 	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
@@ -101,6 +101,7 @@ static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
 				   BANK_HASH_4KB_MODE))
 	},
 );
+EXPORT_SYMBOL_IF_KUNIT(gt_tunings);
 
 static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(
 	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index d18e187debf6..869564e3e992 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -6,6 +6,8 @@
 #ifndef _XE_TUNING_H_
 #define _XE_TUNING_H_
 
+#include <kunit/visibility.h>
+
 struct drm_printer;
 struct xe_gt;
 struct xe_hw_engine;
@@ -16,4 +18,8 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe);
 void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
 int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+extern const struct xe_rtp_table_sr gt_tunings;
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index b9d9fe0801aa..1a1e04215f21 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -130,7 +130,7 @@
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
-static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	/* Workarounds applying over a range of IPs */
 
 	{ XE_RTP_NAME("14011060649"),
@@ -307,6 +307,7 @@ static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
 	},
 );
+EXPORT_SYMBOL_IF_KUNIT(gt_was);
 
 static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
 	/* Workarounds applying over a range of IPs */
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index a5f7d33c1b32..8784b491dde7 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -6,6 +6,7 @@
 #ifndef _XE_WA_H_
 #define _XE_WA_H_
 
+#include <kunit/visibility.h>
 #include "xe_assert.h"
 
 struct drm_printer;
@@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
 void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
 int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+extern const struct xe_rtp_table_sr gt_was;
+#endif
+
 /**
  * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as needed.
  * @gt__: gt instance
-- 
2.43.0

