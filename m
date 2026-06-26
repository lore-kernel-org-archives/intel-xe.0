Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE36C43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 16:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3430410E3C5;
	Fri, 26 Jun 2026 16:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcYYrth5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FA810E3C5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782490727; x=1814026727;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=ry5TWwZMGWEX4AKGKNbprVhSPzTBobnKnj+pK8Jtgxg=;
 b=dcYYrth5omc2XNVLWsk7u65sC0uhZQISnc8tmXrGMlqf725dnUdl3QRy
 dSo5stJAvVpVLOd6CyPeh26bI9Bu8IWnn5u1vb0uQRGxq3IrB2+JWAMqc
 l3aubTG2cXtvPGZnPXqh75lE26yGviuc5YHAiqJ6Qin6yMghOl3YVXxuT
 Ol8z9GLy/3znvPJRNuWKAFRyi2OqNJPFRU9x6cBG9lbe1nb5As9Ci/GTK
 r49dtM1giZhEnpCdVzvnvhWRGgGbhJaF56+4InsLwRfeCFAAqyjK3ILqM
 9vvs4pO5G5RUtQyyOBxwcYzqHDuFv8tcS0yqwGoaXPn6pXhqHRBpSoEHy A==;
X-CSE-ConnectionGUID: m5dSH/PMREmusJUY407iJg==
X-CSE-MsgGUID: BWKlybWaR8GBXX+TVJ6ayg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="85835665"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="85835665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 09:18:46 -0700
X-CSE-ConnectionGUID: xkg8AL9qQW2dQ4EJJMolLQ==
X-CSE-MsgGUID: lLqhz1tVTtyewfeYWv/rGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="244964027"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 09:18:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 26 Jun 2026 09:18:23 -0700
Subject: [PATCH v2] drm/xe/tests/rtp: Add kunit test for whitelist upper bounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kunit_whitelist_bounds-v2-1-223dc3699734@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ7CIBREr9L8tRggUtFV72GapoWP/VHBAK2ap
 ncXewGXbzLzZoGEkTDBuVog4kyJgi8gdxWYsfdXZGQLg+Sy5rVU7DZ5yt1rpIx3SrkbwuRtYr3
 Wh5NCZcxxgDJ+RnT03sSXtvBYuiF+tp9Z/NK/ylkwwax2ynGlnHC8IV8aexMe0K7r+gXJd+hxv
 AAAAA==
X-Change-ID: 20260625-kunit_whitelist_bounds-a88495e5cc7b
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4791;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=ry5TWwZMGWEX4AKGKNbprVhSPzTBobnKnj+pK8Jtgxg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqPqZmc46tdmh/UQaTDkzhBmYQ5aWnOCQGIHMmR
 A1wiO/fQpuJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaj6mZgAKCRBNeSQFyHKQ
 BGIWD/4oKqtOZusmaO4n+e5xG6R7zOoXdjuyCJtiA6PjVGj+YVtPBufFRNecmnSySd9C+5nmPJK
 cYNDFluRNDBFRVrdZIz7APRMlXW9aoyekPXi1KHPTdGbja0J8bFCt5JmUgpybIKAwy/hXpZG16f
 Jh9zn1/5nOcezy6JKe7zfAlSTEwgA/V4NRUwsiUXzmDYPMWtVO3y2R5bO8rNfw7GDguAYYQXNdI
 q/lHrm6L2F7t3vLGwF956VeQBRRAHu8xconcW2pPVY65yZLncj0xHwn5ZfjuvbANttiY08+G8i4
 dmNGmHbgVpMV/JbsJEY1KmZOG8gsK9An16f+WeMf9drgP5RqTmydNCjqlCG9Ox+SRUcTVoBr1R+
 Tw1LpSMyFmzPrEUm7HJBltEOPvM4XGUn8vE/cGtdmQsdsgsXhp/ND3G11b75hzolDjP5Rg494UL
 fOU0cKk0h1GRKAITQY//yNQ8fM5OXB9LVpx9dAI6Dox5Q6nAShEaZQ1oUmbQFGU9kHjY0ErxuiF
 QVNkgNDz3UgYXCFmi7FRNY4gQnQTrOdQJ9QR5L0088UfP8e41yOewanIn8YIyDRXX9sR9zMIQKM
 QOHiK5D/87DD0cr5CbwYP74tqfNtFRQ0FTSGbUwUeWB0zJrNR1hcGRPJJ1VgM5MfsS+PLyk3Gex
 mZOPRfvdF96+V8A==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Xe must only add registers to the GT whitelist if they are listed in the
"Software Allowlist" section of the bspec.  These registers have been
carefully reviewed by the architecture/security teams to ensure that
they are safe to whitelist from a security perspective.  The list of
allowed registers changes from platform to platform, and it is not safe
to assume that a register is safe to whitelist on a new platform/IP just
because it was whitelisted on older ones.  This means that whitelist
entries in the driver that used undefined upper bounds
(XE_RTP_END_VERSION_UNDEFINED) for their version ranges should always be
considered illegal since they could potentially open unexpected security
holes on future platforms.  Add a kunit test to scan the whitelist RTP
table and ensure that all entries have well-defined upper bounds on IP
version ranges.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v2:
- Add missing EXPORT_SYMBOL_IF_KUNIT(register_whitelist)
- Link to v1: https://lore.kernel.org/r/20260625-kunit_whitelist_bounds-v1-1-d8f5f055f1f0@intel.com
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |  5 ++++-
 drivers/gpu/drm/xe/xe_reg_whitelist.h         |  4 ++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index ef379cbb6a86..72ae1c13ad72 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -5,6 +5,7 @@
 
 #include <kunit/test.h>
 
+#include "xe_reg_whitelist.h"
 #include "xe_rtp_types.h"
 #include "xe_tuning.h"
 #include "xe_wa.h"
@@ -75,11 +76,30 @@ static void xe_rtp_table_dev_oob_test(struct kunit *test)
 
 RTP_TABLE_PARAM(device_oob_was);
 
+static void xe_rtp_table_missing_upper_bound_test(struct kunit *test)
+{
+	const struct xe_rtp_entry_sr *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++) {
+		u8 match_type = entry->rules[i].match_type;
+
+		if (match_type != XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&
+		    match_type != XE_RTP_MATCH_MEDIA_VERSION_RANGE)
+			continue;
+
+		KUNIT_EXPECT_NE(test, entry->rules[i].ver_end, XE_RTP_END_VERSION_UNDEFINED);
+	}
+}
+
+RTP_TABLE_PARAM(register_whitelist);
+
 static struct kunit_case xe_rtp_table_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_tunings_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, oob_was_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_table_dev_oob_test, device_oob_was_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_table_missing_upper_bound_test,
+			 register_whitelist_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 3d9e3daab01a..fe996d23007b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -5,6 +5,8 @@
 
 #include "xe_reg_whitelist.h"
 
+#include <kunit/visibility.h>
+
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
@@ -41,7 +43,7 @@ static bool match_multi_queue_class(const struct xe_device *xe,
 	return xe_gt_supports_multi_queue(gt, hwe->class);
 }
 
-static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(PS_INVOCATION_COUNT,
@@ -104,6 +106,7 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 );
+EXPORT_SYMBOL_IF_KUNIT(register_whitelist);
 
 static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
 
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
index e1eb1b7d5480..c0248063d515 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
@@ -14,6 +14,10 @@ struct xe_hw_engine;
 struct xe_reg_sr;
 struct xe_reg_sr_entry;
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+extern const struct xe_rtp_table_sr register_whitelist;
+#endif
+
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
 
 void xe_reg_whitelist_oa_regs(struct xe_gt *gt);

---
base-commit: c04e038b8787434bf489ea6de4ab2e2d936083c7
change-id: 20260625-kunit_whitelist_bounds-a88495e5cc7b

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

