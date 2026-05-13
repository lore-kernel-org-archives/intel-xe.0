Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A4CCD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C6B10F08F;
	Wed, 13 May 2026 21:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4Bhskmd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9CF10E09B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778707323; x=1810243323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4SO1Wb1SE2+bsx+CiTaf+MBfnXVQk3lrhDt9sdHCnaM=;
 b=K4Bhskmdt/+iyzKC/kuiI0y1AtAhzAVicz1r5CaIkucYazFAGVvJNNog
 lqWX0uQmq8R31Km6+n1U/fjtsp9ixc5YPeAy8fRklRdQTKJ28hADzsHgM
 gXjBSe9G61ETB7j+mmazzX9xsK0ASmDZTWItTuSJNiJiQaG5AdvlfH18s
 pB04nZxhjmiObNh7Scn+K7AZBhDBfRkSIbjKFRIistXjIrJEbYMRXm2yk
 ivdrY1pLuBEo/omXc9xpmK2mgCuOQKTWuUnhwDsqMZjNZ7Vp86JimeTSX
 vvgBcF1UXmYl9IPm2sr8Ide9jYCNDs8Xy697ZF/UMTkysX+Yajaw6l7zM w==;
X-CSE-ConnectionGUID: aumWJGZXRLOPsWT0nbyPjA==
X-CSE-MsgGUID: SJFK5D+9R9Wx6oZDWdHARA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79679042"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79679042"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
X-CSE-ConnectionGUID: jPsVv7DrSaCtW4X9s0TC/A==
X-CSE-MsgGUID: TOjBw2aHRvS87XEZ1l9WPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="276295794"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 14:22:03 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH 3/4] drm/xe/rtp: Add OOB WAs rule checking
Date: Wed, 13 May 2026 14:21:27 -0700
Message-ID: <20260513212129.691628-9-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513212129.691628-6-violet.monti@intel.com>
References: <20260513212129.691628-6-violet.monti@intel.com>
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
the scope of testing to include the OOB workaround list. The added test
checks for workarounds with an engine_class rule, and raises an expectation
failure if any are found. Unlike the GT workarounds, there are no flags
within this workaround list, so all engine_class rules will fail.

This test prevents future implementation of rules that would apply an
engine_class rule without an active engine in context, preventing rule
errors or mishaps.

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 20 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
 drivers/gpu/drm/xe/xe_wa.h                    |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index 100cac379b08..eae3262775bb 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -24,6 +24,18 @@ static void xe_rtp_table_gt_test(struct kunit *test)
 	}
 }
 
+static void xe_rtp_table_oob_test(struct kunit *test)
+{
+	const struct xe_rtp_entry *param = test->param_value;
+
+	for (int i = 0; i < param->n_rules; i++) {
+		KUNIT_EXPECT_NE_MSG(test, param->rules[i].match_type,
+				    XE_RTP_MATCH_ENGINE_CLASS,
+				    "OOB_WA %s has an engine class rule",
+				    param->name);
+	}
+}
+
 static int xe_rtp_table_test_init(struct kunit *test)
 {
 	struct xe_device *xe;
@@ -61,8 +73,16 @@ static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, char *desc)
 
 RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
 
+static void rtp_table_oob_test_desc(const struct xe_rtp_entry *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+RTP_KUNIT_ARRAY_PARAM(rtp_table_oob, oob_was, rtp_table_oob_test_desc);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, rtp_table_oob_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 285072fe0a47..5744bd3f8be9 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -802,7 +802,7 @@ static const struct xe_rtp_entry oob_was_entries[] = {
 
 static_assert(ARRAY_SIZE(oob_was_entries)  == _XE_WA_OOB_COUNT);
 
-static __maybe_unused const struct xe_rtp_table oob_was = {
+VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was = {
 	.entries = oob_was_entries,
 	.n_entries = ARRAY_SIZE(oob_was_entries),
 };
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 17dff615e507..7ac6d365b65f 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -27,6 +27,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
+extern VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was;
 #endif
 
 /**
-- 
2.43.0

