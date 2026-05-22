Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66581CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 18:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBEF10F5DE;
	Fri, 22 May 2026 18:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYfmTvIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8243710E66F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779476185; x=1811012185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xn9jrJtbCrBnorTTF0+ZM0+I7BJrxu3pvWkhiqzbh/Y=;
 b=XYfmTvItrQ/0DvUEyGrwlKC2ifmjkdbT0Q54q5kECJyJ4fO6ZtXtTYRF
 jg/+lEJe7qhwiEAiuOikADom2Q+IqYJTbLbuEgblhoWcQNcSaqjbs4pKf
 jUfRemaK6rqucoq67WvceGtKxxRvze/TYpXqojpOCB1vJvHoiZ69eROB5
 OjyxcEeXg+N6YP4p66qIELlIDEPNJfk3e1jlNpp1cATsDkYtZLsqcMvPl
 bZbpR0hR5CD9l593l9HnkUaSyyMwSbTB41WvLPmrZGIA/DQuUYU0blCdb
 WNTIGoEvxtOWmbTd3bu26KMBfTrBcf2uv4ndUV87WFig2JqmHK1wcBHvr g==;
X-CSE-ConnectionGUID: kGL8VvXaTnejJZ6kCnZdnw==
X-CSE-MsgGUID: VCuwwpAvR32sh+HljWtWGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84028466"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84028466"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:56:24 -0700
X-CSE-ConnectionGUID: fiH/NoIqRo+4QUGKgYxgnA==
X-CSE-MsgGUID: MeACdW6gS7Sh/vALZccwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246061212"
Received: from vmonti-desk.jf.intel.com ([10.88.27.136])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 11:56:23 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 3/4] drm/xe/rtp: Ensure oob_was does not evaluate engine
 type rules
Date: Fri, 22 May 2026 11:56:12 -0700
Message-ID: <20260522185609.2252126-9-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522185609.2252126-6-violet.monti@intel.com>
References: <20260522185609.2252126-6-violet.monti@intel.com>
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

