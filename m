Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F6CD4F54
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 19:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887010EE3D;
	Tue, 19 May 2026 19:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/PDM0qe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1823710E304
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779219220; x=1810755220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ZvJoC+LEKuawynknryEBjQztrAN+vkj9GS6Yi7odjk=;
 b=d/PDM0qeryxDBO7YfTesbmDsCbhZBEBBenBYnzyKcB+cCcXL46bDGMd3
 X+JmJ/gMcGpr1mkcdgIwFR/ptoChr87sX9T291wyjaSVWO3rb9RPDUXV8
 eINDtA2mgc2BWEdAckGhgvY55tgS0sWKlQkIUZUpxm1A8xU5TelIXgizo
 Biz6kGZRy9O6dd1SdmjVdogSnwRBTGtMXly4sF38JjIvSUtJDDTZ1WJZ3
 UUp67+lD6ilyfrquWmU1s6hgyHSt3lElhbTyup6qHskRT/1+HB4KGisQ0
 v3PF9lLeOgtRNuisQYCCqiWjjz71hTcSWEAT9zjc4mp5qFG8id52m2wmF w==;
X-CSE-ConnectionGUID: lrJg4yivS9KaMenU3+A07A==
X-CSE-MsgGUID: lzzCCpp2Tay1iV5cyvA7jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91214950"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91214950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:39 -0700
X-CSE-ConnectionGUID: jEtfeUedRy2C776YrRwFTw==
X-CSE-MsgGUID: 6H+/LTZhTrm4fBBv/0Kicg==
X-ExtLoop1: 1
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:04 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v2 3/4] drm/xe/rtp: Ensure oob_was does not evaluate engine
 type rules
Date: Tue, 19 May 2026 12:32:15 -0700
Message-ID: <20260519193216.546048-9-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519193216.546048-6-violet.monti@intel.com>
References: <20260519193216.546048-6-violet.monti@intel.com>
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
checks for workarounds with XE_RTP_ENGINE_CLASS() rules and raises an expectation
failure if any are found. Unlike the GT workarounds, there are no flags
within this workaround list, so all invalid rules will fail.

v2:
    - Changed xe_rtp_table_oob_test() to follow format of
      xe_rtp_table_gt_test
    - Changed oob_was generated params to follow format of gt_was
      generated params

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  3 ++-
 drivers/gpu/drm/xe/xe_wa.h                    |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index 01d2bc6e8aad..eb1b3ee075c9 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -42,8 +42,21 @@ static void xe_rtp_table_gt_test(struct kunit *test)
 
 RTP_TABLE_PARAM(gt_was);
 
+static void xe_rtp_table_oob_test(struct kunit *test)
+{
+	const struct xe_rtp_entry *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++)
+		KUNIT_EXPECT_TRUE(test,
+				  entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS);
+}
+
+RTP_TABLE_PARAM(oob_was);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, oob_was_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 1a1e04215f21..410099545f4e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -803,10 +803,11 @@ static const struct xe_rtp_entry oob_was_entries[] = {
 
 static_assert(ARRAY_SIZE(oob_was_entries)  == _XE_WA_OOB_COUNT);
 
-static __maybe_unused const struct xe_rtp_table oob_was = {
+VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was = {
 	.entries = oob_was_entries,
 	.n_entries = ARRAY_SIZE(oob_was_entries),
 };
+EXPORT_SYMBOL_IF_KUNIT(oob_was);
 
 static const struct xe_rtp_entry device_oob_was_entries[] = {
 #include <generated/xe_device_wa_oob.c>
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

