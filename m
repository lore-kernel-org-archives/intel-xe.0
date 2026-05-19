Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5A5CD4F5E
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 19:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4E10E3DA;
	Tue, 19 May 2026 19:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyKkLkOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707B10E3DA
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779219220; x=1810755220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wTasgLBb8wJ5axCP/UE6n3yI4V+pE4diVl3ygzPHXFo=;
 b=HyKkLkOlzB6HYAb4C9hUuFYsosvF+UfLR5ulCIhwbLBQGXUxUyRRga9k
 B1sCwlxeG76n7T+/gfwSGXP3jLSq4Eht1KfRj2a7ajp3PF0+6xHQOOutH
 mZwseew/OMjsxprwugwbYF3oKro7s2YCkuRT/uNRNSpYXM8j5L5Tfv15w
 KanB72ZaxuOneU8qz9yJVihbs//IAKCYT3gLbjpuqBjbfkbVP4HRV7QoL
 F1fzXvdVkGC6/6BfD9C1iJUjHeU7rCNrU57Sc1LGf2V4TKQdNYSsAnnex
 L/e5C2YgqlgkxCZM17hMCOtXS4dWmbnGaw3ujwwk+eAh3y02b5PgX/ZZs A==;
X-CSE-ConnectionGUID: DIB7A/ASQ4+l15+Z9jWp1Q==
X-CSE-MsgGUID: AROHU8/0RDmX5ciXJxigqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91214954"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91214954"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:39 -0700
X-CSE-ConnectionGUID: RtSiyPKpQBiuUN1ID/nf+Q==
X-CSE-MsgGUID: Prz8hznSSSuEEbSoRXkW8g==
X-ExtLoop1: 1
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 12:33:04 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>
Subject: [PATCH v2 4/4] drm/xe/rtp: Ensure device_oob_was only evaluates
 correct rules
Date: Tue, 19 May 2026 12:32:16 -0700
Message-ID: <20260519193216.546048-10-violet.monti@intel.com>
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
the scope of testing to include the device OOB workaround list. As well
as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
derivatives.

This test will raise expectation fails for any workarounds in the
device_oob_was list that has an invalid rule type, preventing evaluation
or inclusion of rules that could be applied in the wrong context.

v2:
    - Changed xe_rtp_table_dev_oob_test() to follow format of
      xe_rtp_table_gt_test
    - Changed device_oob_was generated params to follow format of
      gt_was

Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 21 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  3 ++-
 drivers/gpu/drm/xe/xe_wa.h                    |  1 +
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index eb1b3ee075c9..669163e52ebd 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -54,9 +54,30 @@ static void xe_rtp_table_oob_test(struct kunit *test)
 
 RTP_TABLE_PARAM(oob_was);
 
+static void xe_rtp_table_dev_oob_test(struct kunit *test)
+{
+	const struct xe_rtp_entry *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++)
+		KUNIT_EXPECT_TRUE(test,
+				  entry->rules[i].match_type != XE_RTP_MATCH_ENGINE_CLASS &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_NOT_ENGINE_CLASS &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_STEP &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_VERSION &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_VERSION_RANGE &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_VERSION_ANY_GT &&
+				  entry->rules[i].match_type != XE_RTP_MATCH_MEDIA_STEP);
+}
+
+RTP_TABLE_PARAM(device_oob_was);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
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

