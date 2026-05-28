Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED75CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 16:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDB610F483;
	Thu, 28 May 2026 16:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJh6i2Wy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE9D10F460
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779986294; x=1811522294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VULbxVVy1PUE1idmS95E5dbX9WNuf3faUDL6pdHmV3Y=;
 b=cJh6i2WywCOEMMXBiv/RVgPRFXUYuTVy69Sw7ywDriYUJYFAly/SDldd
 qDE6nWxE2K/ruuUlZWymG+su3Ex8s040nQEoCS3Cvqsp3GprDsGlEPTeI
 Cn9J+Rrcjv5MoZA6PPhzC02kigq034y/q9Duwi/wZHyBS5HdXIqW2CC3y
 cxs3l7t4spm6LQ8Hp2wRVs3QFz+5BIO4r+rXqQBbIHUk8jPVxGGHcPrxU
 aeTfD9yR+l4herPs1+WhSI2t268YiWtyuYXbgJUe4j+vZxt1VTRfRnzmT
 58n8rUFVArH8FHTRoVRgZ87RmpriihvuVBkkMVwtM4KmhynS6HTS48kjF w==;
X-CSE-ConnectionGUID: bM6+fnehTvWLZqZwe8cCCQ==
X-CSE-MsgGUID: aZLqrmqETKq8/wNNPbOMpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84721987"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84721987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 09:38:14 -0700
X-CSE-ConnectionGUID: WAXBLeM7SSmo5O/kSink0w==
X-CSE-MsgGUID: ZGXwO6yBQBCLiClPMIWung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="244418656"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 09:38:13 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 4/4] drm/xe/rtp: Ensure device_oob_was only evaluates
 correct rules
Date: Thu, 28 May 2026 09:35:35 -0700
Message-ID: <20260528163531.834721-10-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528163531.834721-6-violet.monti@intel.com>
References: <20260528163531.834721-6-violet.monti@intel.com>
MIME-Version: 1.0
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
the scope of testing to include the device OOB workaround list. As well
as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
derivatives.

This test will raise expectation fails for any workarounds in the
device_oob_was list that has an invalid rule type, preventing evaluation
or inclusion of rules that could be applied in the wrong context.

v5:
    - No change

v4:
    - No change

v3:
    - Removed "VISIBLE_IF_KUNIT" keyword from xe_wa.h
    - Heavily reworked rule checking within _dev_oob_test() function for
      easier understanding and interpreting of errors

v2:
    - Changed xe_rtp_table_dev_oob_test() to follow format of
      xe_rtp_table_gt_test
    - Changed device_oob_was generated params to follow format of
      gt_was

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 23 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  3 ++-
 drivers/gpu/drm/xe/xe_wa.h                    |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index ff6ff2d49ad7..ef379cbb6a86 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -53,10 +53,33 @@ static void xe_rtp_table_oob_test(struct kunit *test)
 
 RTP_TABLE_PARAM(oob_was);
 
+static void xe_rtp_table_dev_oob_test(struct kunit *test)
+{
+	const struct xe_rtp_entry *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++) {
+		u8 match_type = entry->rules[i].match_type;
+
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_ENGINE_CLASS);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_NOT_ENGINE_CLASS);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_GRAPHICS_VERSION);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_GRAPHICS_VERSION_RANGE);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_GRAPHICS_STEP);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_MEDIA_VERSION);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_MEDIA_VERSION_RANGE);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_MEDIA_VERSION_ANY_GT);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_MEDIA_STEP);
+	}
+}
+
+RTP_TABLE_PARAM(device_oob_was);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_tunings_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, oob_was_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_table_dev_oob_test, device_oob_was_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 410099545f4e..635d5461f712 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -815,10 +815,11 @@ static const struct xe_rtp_entry device_oob_was_entries[] = {
 
 static_assert(ARRAY_SIZE(device_oob_was_entries) == _XE_DEVICE_WA_OOB_COUNT);
 
-static __maybe_unused const struct xe_rtp_table device_oob_was = {
+VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was = {
 	.entries = device_oob_was_entries,
 	.n_entries = ARRAY_SIZE(device_oob_was_entries),
 };
+EXPORT_SYMBOL_IF_KUNIT(device_oob_was);
 
 __diag_pop();
 
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index c5cc260621cd..f4da2b271396 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -28,6 +28,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 extern const struct xe_rtp_table_sr gt_was;
 extern __maybe_unused const struct xe_rtp_table oob_was;
+extern __maybe_unused const struct xe_rtp_table device_oob_was;
 #endif
 
 /**
-- 
2.43.0

