Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18A3CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAEB10F09A;
	Wed, 13 May 2026 21:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/HHoY/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C838E10F08F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778707323; x=1810243323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URvC7t+lUYdDYwtDUl5k3dfjOEymv10yzGsqiFRyIpM=;
 b=e/HHoY/a/bxBNS4TDlwA/pzRxaCHEwl0WM7/7sijup5huzdS3/o97LKG
 M60NcuS9vV6lbtEP5GFh5aTvZsmFHba4wyYLJLtkk122OqTsDqbXcXZzY
 CKGLByLNvC98KoEyMs3tmJBsgTUrCvgU+1J2u0w2jKSq4qMWietp677jz
 OLqdNRjBQuyFTrBYWDKCpZr1K7FPFXIHYcxq0QpBaam6w87E9X2k+ca5x
 dzju1b2Tcqp26rQkz9s8jc8YJzBf82u2k1g9pTNjLTkJ0r/wJOc9wi7/H
 5SqrPSMPqNyLETb2/t7SfSOVWsywZ4VKeSEKCurhmSW+nryCuhKchXtdb Q==;
X-CSE-ConnectionGUID: D2YgHO5uSIedas80r4ramA==
X-CSE-MsgGUID: ScJwR7n7TPerpqJGx0/7tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79679044"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79679044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
X-CSE-ConnectionGUID: 6zrbDawiRgGy8K8aYkMqrQ==
X-CSE-MsgGUID: SkuLAyuNR0mDf5btZlQU3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276295796"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH 4/4] drm/xe/rtp: Add Device OOB WA checks
Date: Wed, 13 May 2026 14:21:28 -0700
Message-ID: <20260513212129.691628-10-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513212129.691628-6-violet.monti@intel.com>
References: <20260513212129.691628-6-violet.monti@intel.com>
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

This commit builds on the implementation of the GT WA testing, increasing
the scope of testing to include the device OOB workaround list. The added
test checks for workarounds with an engine_class rule, and raises an
expectation failure if any are found. Unlike the GT workarounds, there are
no flags within this workaround list, so all engine_class rules will fail.
The device OOB is also more strict, and requires IP rules to be
invalidated as well (MEDIA_* and GRAPHICS_* rules).

This test prevents future implementation of rules that would go against
known contexts for the workarounds implementations.

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 37 +++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h | 17 +++++++--
 drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_wa.h                    |  1 +
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index eae3262775bb..ae228a40fd52 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -36,6 +36,35 @@ static void xe_rtp_table_oob_test(struct kunit *test)
 	}
 }
 
+static void xe_rtp_table_dev_oob_test(struct kunit *test)
+{
+	bool match;
+	int test_matches[] = {
+		XE_RTP_MATCH_ENGINE_CLASS,
+		XE_RTP_MATCH_GRAPHICS_VERSION,
+		XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
+		XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
+		XE_RTP_MATCH_GRAPHICS_STEP,
+		XE_RTP_MATCH_MEDIA_VERSION,
+		XE_RTP_MATCH_MEDIA_VERSION_RANGE,
+		XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,
+		XE_RTP_MATCH_MEDIA_STEP,
+	};
+	int size = ARRAY_SIZE(test_matches);
+	const struct xe_rtp_entry *param = test->param_value;
+
+	for (int i = 0; i < param->n_rules; i++) {
+		for (int j = 0; j < size; j++) {
+			KUNIT_EXPECT_NE_MSG(test,
+					    param->rules[i].match_type,
+					    test_matches[j],
+					    "Device OOB WA %s has an invalid rule (type: %d)",
+					    param->name,
+					    j);
+		}
+	}
+}
+
 static int xe_rtp_table_test_init(struct kunit *test)
 {
 	struct xe_device *xe;
@@ -80,9 +109,17 @@ static void rtp_table_oob_test_desc(const struct xe_rtp_entry *t, char *desc)
 
 RTP_KUNIT_ARRAY_PARAM(rtp_table_oob, oob_was, rtp_table_oob_test_desc);
 
+static void rtp_table_dev_oob_test_desc(const struct xe_rtp_entry *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+RTP_KUNIT_ARRAY_PARAM(rtp_table_dev_oob, device_oob_was, rtp_table_dev_oob_test_desc);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, rtp_table_oob_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_table_dev_oob_test, rtp_table_dev_oob_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
index 3e91dd08f854..e7f1d73b44c3 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
@@ -3,9 +3,20 @@
  * Copyright © 2026 Intel Corporation
  */
 
-// The "gen_params" function functionality does not work to dynamically collect the size
-// of the WA array, even with the new n_entries pointer. This addition builds on that framework
-// to allow dynamic sizing
+/**
+ * The "KUNIT_ARRAY_PARAM()" function functionality does not work to dynamically collect the
+ * size of the WA array, even with the new n_entries value. This addition builds on that
+ * framework to utilize these new values.
+ */
+
+/**
+ * RTP_KUNIT_ARRAY_PARAM() - Define test parameter generator from an array.
+ * @name:  prefix for the test parameter generator function.
+ * @array: array of test parameters which includes a n_entries value
+ * @get_desc: function to convert param to description; NULL to use default
+ *
+ * Define function @name_gen_params which uses @array to generate parameters.
+ */
 #define RTP_KUNIT_ARRAY_PARAM(name, array, get_desc)						\
 	static const void *name##_gen_params(struct kunit *test,				\
 					     const void *prev, char *desc)			\
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5744bd3f8be9..0a4cf6d6c468 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -813,7 +813,7 @@ static const struct xe_rtp_entry device_oob_was_entries[] = {
 
 static_assert(ARRAY_SIZE(device_oob_was_entries) == _XE_DEVICE_WA_OOB_COUNT);
 
-static __maybe_unused const struct xe_rtp_table device_oob_was = {
+VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was = {
 	.entries = device_oob_was_entries,
 	.n_entries = ARRAY_SIZE(device_oob_was_entries),
 };
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 7ac6d365b65f..568e05e49bf9 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -28,6 +28,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
 extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was;
+extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was;
 #endif
 
 /**
-- 
2.43.0

