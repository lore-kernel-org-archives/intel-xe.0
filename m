Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5483CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8856310E2C7;
	Thu, 25 Jun 2026 23:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ+P1HJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDB810E2C7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782430699; x=1813966699;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=C+dsS6RJueBViAuKK7wFhltpTfP/yAA3YfEz7HhInz4=;
 b=YQ+P1HJe/LadwP3YHFtIoQxMCZN9d6Sqw+EhzPxtfHnz3DtmUFZ8fZr0
 sPjn/NAkQVjF2qqJsTX5XWHxOUhMQQOLyagcGsWIhsuorAD0NGPGpSJt1
 v+ykta8pii5Ild4oXSciNYOhIK/q/xPu7xe2wOjTdaT3ZCa6uXNEexNBb
 R6OmPll8v5jXW52QPb7sgZhuQCYTTjNEARulyGFK0Glw7QGQaAPDzO1XP
 Ux7GzDs7+2kdr9HIaFpDsT7U9XrdPV06G1lZBrW9IZOYSmfIovHkJrniP
 Ups27Cdqo79f1qaERKS70YrJ2KQHRtN5JRZW9EYz8kxpWZhCy9V3gOD2w Q==;
X-CSE-ConnectionGUID: PNUx5jO1Q6q9ChneM8uE0g==
X-CSE-MsgGUID: H5WYUtwFR4evCnpBx5hDFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83353187"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83353187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:38:19 -0700
X-CSE-ConnectionGUID: J5E5vvjzQBKr/XlGguPWiQ==
X-CSE-MsgGUID: 8eVs8wDwSe2uIjeGxlQG0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="251311826"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:38:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 25 Jun 2026 16:37:54 -0700
Subject: [PATCH] drm/xe/tests/rtp: Add kunit test for whitelist upper
 bounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-kunit_whitelist_bounds-v1-1-d8f5f055f1f0@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrDWhUX9XERFqMCElnRaJuLvG8
 lu89wCjJWSoowcsnsS0m4A0jkAvvZlR0BgMMpF5kkslVm/IdddCDjdi1w27NyOLviyzSqHSuhg
 gxIfFie5/3LTv+wHL2qo3aAAAAA==
X-Change-ID: 20260625-kunit_whitelist_bounds-a88495e5cc7b
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4339;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=C+dsS6RJueBViAuKK7wFhltpTfP/yAA3YfEz7HhInz4=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqPbvq68nmh0bHNnk08YKqe3MEvX6gFlGddxhTx
 5zjBUivUvmJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaj276gAKCRBNeSQFyHKQ
 BKInD/9SU14PHKGwWoaCU4YhEQeY1pxy+QWTH1NXRW5J7zDiMx8G2AFf+64Waf+aL/2lEEFQfCj
 kdIvjeNp0qtZidegGjUVqxam9kRumLSPyX2+3qJuaNLTXHuSBvEq6x45cohiG6nWlybBfgaIeyp
 uzMg8/AyWv4hJcbcO5x3wGGdAxOmHmvZd4nn2Wa1/Lh9qKGOt/UclkIRMdg4oEtmIpOTelqK/8O
 LzDSadDBCHe+WqPE403pKdDulczmD/mcTxYU0RrDIF3RYYm3MtV4p12bwASyLhVsk5FaY/pytW2
 3GCV2gatd2NKLF/J/iYhYaEgCAkX7wwu5U/qNs0UhOKr96n0IibQFif8Fj6DvT9fB/yogaBHvol
 oT84OsSgBDCrV+CtvLIQ3jQadF1CqKAWQY/DwWlhesXlc1O/pirc+ON5PfnF8R2HoH2nyiPZPxw
 k/Ru2nRTmgKt+tpoSEpZ9d2E5+jpfQi+xzp6VcSSvJ1uIJqojWNv8mYRBjjgTwJj+X4reV4eXpn
 3vd9GWehmWRxb7G+/dJ7+tM8vc2e+EyyD+zIOJ9BxpDo08UwuLoiHn/dYow8SmCN26nxE1Orz/X
 eaXlMUxrUW9s1mj0FnwiUEdQUbMle+6MHiWeniXWsNcPUoXiihDGR8U6xpk+fbT8ui0jE9M58MD
 nhzaFx7DTgVlQog==
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
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |  4 +++-
 drivers/gpu/drm/xe/xe_reg_whitelist.h         |  4 ++++
 3 files changed, 27 insertions(+), 1 deletion(-)

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
index 3d9e3daab01a..f03b6cc92c49 100644
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

