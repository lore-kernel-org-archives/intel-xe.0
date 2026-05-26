Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F0CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 17:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7DC10E502;
	Tue, 26 May 2026 17:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="No6Muyco";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA1D10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779816667; x=1811352667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4RdCnGClSXT5xTKz2rb7yW94D6+BjTvu8SeTMMr4z8=;
 b=No6MuycoHiJKbVEh85doBW+APJH2O+yPM1YVbz5ypX4/xtzbPXkQOkOb
 n47rV8AFHSuKWyQM8QmtKXHm+9YBgpXeguBrhY82D1Cl0Bsaf4EbgAlM0
 jhwvFUA7a+HvokoKeB5j/XCcRUSaHgvb6FW0Yc8XNWAPA4386FLzDzUVA
 P3Wsr3BjKXjHixkUqqpoarBR4+RTukkHvYvjW1GPc5Mta40ZrBe4NQpxn
 teDMH74Y5p+nsWk1DjMYR5tzZiVsS7CoyDN1ZZDFjKhJSSDuaJwgMDxmT
 MsZ2A7BsEQIs1cveAAueXwzJQSyoYBZcZod9JXyd0MwZZijGDL7g8axbh A==;
X-CSE-ConnectionGUID: Y9OPyLiJSm+BDUZ7LTOcyw==
X-CSE-MsgGUID: fRyO0fp8RIGJHH0GUw/kDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80751040"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80751040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 10:31:06 -0700
X-CSE-ConnectionGUID: HG1zEX0URIqWBQ63+zgHrA==
X-CSE-MsgGUID: xrs48JDkTeq5KFRLN+wr3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246954111"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 10:31:06 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 3/4] drm/xe/rtp: Ensure oob_was does not evaluate engine
 type rules
Date: Tue, 26 May 2026 10:30:59 -0700
Message-ID: <20260526173056.967215-9-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526173056.967215-6-violet.monti@intel.com>
References: <20260526173056.967215-6-violet.monti@intel.com>
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
checks for workarounds with XE_RTP_ENGINE_CLASS() rules and raises an
expectationfailure if any are found. Unlike the GT workarounds, there are
no flags within this workaround list, so all invalid rules will fail.

v4:
    - No change

v3:
    - Removed VISIBLE_IF_KUNIT keyword from xe_wa.h
    - Reworked KUNIT_EXPECT_TRUE for easier decoding of errors

v2:
    - Changed xe_rtp_table_oob_test() to follow format of
      xe_rtp_table_gt_test
    - Changed oob_was generated params to follow format of gt_was
      generated params

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c                    |  3 ++-
 drivers/gpu/drm/xe/xe_wa.h                    |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index fc707d972249..e37bf896e8fe 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -41,9 +41,24 @@ static void xe_rtp_table_gt_test(struct kunit *test)
 RTP_TABLE_PARAM(gt_was);
 RTP_TABLE_PARAM(gt_tunings);
 
+static void xe_rtp_table_oob_test(struct kunit *test)
+{
+	const struct xe_rtp_entry *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++) {
+		u8 match_type = entry->rules[i].match_type;
+
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_ENGINE_CLASS);
+		KUNIT_EXPECT_NE(test, match_type, XE_RTP_MATCH_NOT_ENGINE_CLASS);
+	}
+}
+
+RTP_TABLE_PARAM(oob_was);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_tunings_gen_params),
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
index 8784b491dde7..c5cc260621cd 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -27,6 +27,7 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 extern const struct xe_rtp_table_sr gt_was;
+extern __maybe_unused const struct xe_rtp_table oob_was;
 #endif
 
 /**
-- 
2.43.0

