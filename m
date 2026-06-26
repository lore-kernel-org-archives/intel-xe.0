Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B03C43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 21:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3074710F721;
	Fri, 26 Jun 2026 21:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CO/0aAa+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163C010F721
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 21:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782510829; x=1814046829;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=9Ef2KBj5SdTKwlQqhQcFZ7QydtzkCEhO5cAwgEWquog=;
 b=CO/0aAa+rk3GlShLPDOjEEHJbezdSbeWz/Xhc+RkjITrftRAwubMGicC
 FUtrkBkk8ND2Th1oaVDCR5cCKl2uxcyYa0pN/WMgXFuEZwlrr2NSzILhp
 5/I9+C1URNLrGoGn6S0VMC3Xq6+V+xB4ynz2x2oG6lf5Z91vPLoZyMs0J
 52QXBdR7gS3mwtypbAax6yXqOngz+k0bX4hlaZ42Ih5GzPeYgsOZTXoSs
 7HcnstNbj2Xk/R/tKppdPeNHW2O8KiTEjLRXVHcdnfmTjkVDHxITdcDc9
 XMOhjLO6emiQeFhzm8eN1cw5SzhvkhssxHjK615LOUElUBEuHmrmGZNE+ A==;
X-CSE-ConnectionGUID: JgWpS7eHSwmKFBNVjpkj7g==
X-CSE-MsgGUID: wGAepOFdRO+M9TWThiYEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="100742085"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="100742085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 14:53:48 -0700
X-CSE-ConnectionGUID: owG6FF0aRSeegxGnJIY0JQ==
X-CSE-MsgGUID: Ui4PZsbhSC2BXeyIL9biBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="253325578"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 14:53:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 26 Jun 2026 14:53:28 -0700
Subject: [PATCH v3] drm/xe/tests/rtp: Add kunit test for whitelist upper bounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kunit_whitelist_bounds-v3-1-aedf0b3adab9@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNyw6CMBAF0F8xXVvTBy3gyv8whkAfMlFb00LVE
 P7dwoqNcXkn956ZUDQBTETH3YSCSRDBuxz4fodU37qrwaBzRowwSSQT+DY6GJpXD4O5Qxyazo9
 OR9xWVVELI5QqO5THz2AsvFf4fMm5z10fPuufRJfrXzJRTLGurLBECEstOYHLjYPyD7SQiW0Z+
 ZNhmWGMa8VlXZe82DLzPH8BxEuyhwMBAAA=
X-Change-ID: 20260625-kunit_whitelist_bounds-a88495e5cc7b
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5168;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=9Ef2KBj5SdTKwlQqhQcFZ7QydtzkCEhO5cAwgEWquog=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqPvTsqcoNXvjIZJcmqHvZZvwjIVGhpzuQ/JcFM
 RypA6VVt3aJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaj707AAKCRBNeSQFyHKQ
 BOqxD/9XdmVcEqqyk2MovKhi83+nNJaIWxUUfY3qgWPpGk9OXpB4OxHnjWF7Ue/MIQ3YRTnC+hZ
 Tdf5allPTDVSxArIMWECdmpJ7wVEOOqTzX56+9O3r2LdTuWVbf7Ll6GleV3iluxnnbA+Sjuck4U
 nExmuhy11jowaJdem3mBVmS0+Kumj5U4l09WqKZ2sQI+oqzBGryuqbBRws6LmQXw6aqcI2dPU0E
 rZxEAViT9xFQfMHnJjE2jd3xtb0JLDiIBT/kqPNV6CRtWEjQW3ll65IH54ojpyvN2cC6jQ+YtCj
 0EVxFoyMVtWH/6wQv6MMigvvzjINKGI4LVeylbqExESeUuL5SQLa+8kfSZLLCEhIYbhnXWAo19e
 s9mMY0P4nRKnEMEXlpIifWGT2HRBNGQIsSQ+Ywt++BN9253yAj/yB3hhTe/tWXS9P6IbU+NGdPs
 JXBA8N229ynB19ItVmAbo0RKQUaPZPJa8RZea+xW4TDk74wBB4Ml3RQZriIoMyXLhqwQUOFMqDN
 w7CDQtho4I+Ey4IvMX8+so5OR3gg9MRNCNitw7Z/O5MPUx1gM+ZYEEbeGv02f3eQPyxDaoxjpre
 uQ8i/sb0BPdoVeqRXMQVKJq3CdlzT88xbHGOH1VvZlNv7apjyciBUp/8t2WzV7H10VzF+dpD9KG
 ljoavioEayuE9Dg==
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v3:
- Restructure assertions so that the output on failures will be more
  understandable/useful.  (Gustavo)
- Link to v2: https://lore.kernel.org/r/20260626-kunit_whitelist_bounds-v2-1-223dc3699734@intel.com

Changes in v2:
- Add missing EXPORT_SYMBOL_IF_KUNIT(register_whitelist)
- Link to v1: https://lore.kernel.org/r/20260625-kunit_whitelist_bounds-v1-1-d8f5f055f1f0@intel.com
---
 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_whitelist.c         |  5 ++++-
 drivers/gpu/drm/xe/xe_reg_whitelist.h         |  4 ++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
index ef379cbb6a86..7e2fc39ac62c 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
@@ -5,6 +5,7 @@
 
 #include <kunit/test.h>
 
+#include "xe_reg_whitelist.h"
 #include "xe_rtp_types.h"
 #include "xe_tuning.h"
 #include "xe_wa.h"
@@ -75,11 +76,31 @@ static void xe_rtp_table_dev_oob_test(struct kunit *test)
 
 RTP_TABLE_PARAM(device_oob_was);
 
+static void xe_rtp_table_missing_upper_bound_test(struct kunit *test)
+{
+	const struct xe_rtp_entry_sr *entry = test->param_value;
+
+	for (int i = 0; i < entry->n_rules; i++) {
+		u8 match_type = entry->rules[i].match_type;
+
+		KUNIT_EXPECT_FALSE(test,
+				   match_type == XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&
+				   entry->rules[i].ver_end == XE_RTP_END_VERSION_UNDEFINED);
+		KUNIT_EXPECT_FALSE(test,
+				   match_type == XE_RTP_MATCH_MEDIA_VERSION_RANGE &&
+				   entry->rules[i].ver_end == XE_RTP_END_VERSION_UNDEFINED);
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

