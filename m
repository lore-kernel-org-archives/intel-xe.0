Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5820C88CB9
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 18:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B60F10E8E5;
	Fri,  1 Aug 2025 18:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HObPoWMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B8B10E8DE
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 18:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072046; x=1785608046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoACZlo19vnvTfz+7milSWEYjSUWx2wr2ir6kmMMT4w=;
 b=HObPoWMD/DIXkKC+QQepMRL5KATlPoxJiZ9hJ/nw0qAJKt+/MLmrozX6
 vVXm0h3HXHkmJsOikRnx+GlBwNLrIAMbDSmyf41v/bKgC8KGIAfs6KImj
 SOi/oPd+QN3tJ5FCHD1gvk45Sb4CcAIuN91/xFxSrpXh6KBZUbxX8J0Sf
 2mueR4DYCO/WlMp8TFCKLTwkq0Mv+oe5hB7o3Qwx+beDHAx32WsLT+AK4
 NfHYYJqrsECefiKy1I/Sb1JbLQ4WFkeC6uXpHuIoPY/5KYlWWilGN5cmg
 kTf66EE9HLBQeH1ubqlhdJwTzuIDL0JOevEeDxUi97W+wie/Se+YyF5ca w==;
X-CSE-ConnectionGUID: 6hsOGBNVQM2xotFx7p9mLA==
X-CSE-MsgGUID: Qd/Ycw3eTdaCuorpKHhqRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56315576"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56315576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:05 -0700
X-CSE-ConnectionGUID: klJnqxY2RkCmCfYf9fI6kw==
X-CSE-MsgGUID: peqp2/vsTr6rgUHxTo/+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163553814"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/6] drm/xe/kunit: Promote fake platform parameter list
Date: Fri,  1 Aug 2025 20:13:48 +0200
Message-ID: <20250801181350.180780-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801181350.180780-1-michal.wajdeczko@intel.com>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
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

The list of all known representative platforms defined in xe_wa
could be used in more places by othere test suites.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 68 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 +
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 54 +-------------------
 3 files changed, 70 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 5c6403785984..e78d10df8359 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,6 +12,74 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+#define PLATFORM_CASE(platform__, graphics_step__)					\
+	{										\
+		.platform = XE_ ## platform__,						\
+		.subplatform = XE_SUBPLATFORM_NONE,					\
+		.step = { .graphics = STEP_ ## graphics_step__ }			\
+	}
+
+#define SUBPLATFORM_CASE(platform__, subplatform__, graphics_step__)			\
+	{										\
+		.platform = XE_ ## platform__,						\
+		.subplatform = XE_SUBPLATFORM_ ## platform__ ## _ ## subplatform__,	\
+		.step = { .graphics = STEP_ ## graphics_step__ }			\
+	}
+
+#define GMDID_CASE(platform__, graphics_verx100__, graphics_step__,			\
+		   media_verx100__, media_step__)					\
+	{										\
+		.platform = XE_ ## platform__,						\
+		.subplatform = XE_SUBPLATFORM_NONE,					\
+		.graphics_verx100 = graphics_verx100__,					\
+		.media_verx100 = media_verx100__,					\
+		.step = { .graphics = STEP_ ## graphics_step__,				\
+			   .media = STEP_ ## media_step__ }				\
+	}
+
+static const struct xe_pci_fake_data cases[] = {
+	PLATFORM_CASE(TIGERLAKE, B0),
+	PLATFORM_CASE(DG1, A0),
+	PLATFORM_CASE(DG1, B0),
+	PLATFORM_CASE(ALDERLAKE_S, A0),
+	PLATFORM_CASE(ALDERLAKE_S, B0),
+	PLATFORM_CASE(ALDERLAKE_S, C0),
+	PLATFORM_CASE(ALDERLAKE_S, D0),
+	PLATFORM_CASE(ALDERLAKE_P, A0),
+	PLATFORM_CASE(ALDERLAKE_P, B0),
+	PLATFORM_CASE(ALDERLAKE_P, C0),
+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
+	SUBPLATFORM_CASE(DG2, G10, C0),
+	SUBPLATFORM_CASE(DG2, G11, B1),
+	SUBPLATFORM_CASE(DG2, G12, A1),
+	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
+	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
+	GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
+	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
+	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
+	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
+};
+
+KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
+
+/**
+ * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
+ * @prev: the pointer to the previous parameter to iterate from or NULL
+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
+ *
+ * This function prepares struct xe_pci_fake_data parameter.
+ *
+ * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
+ *
+ * Return: pointer to the next parameter or NULL if no more parameters
+ */
+const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
+{
+	return platform_gen_params(prev, desc);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
+
 static const struct xe_device_desc *lookup_desc(enum xe_platform p)
 {
 	const struct pci_device_id *ids = pciidlist;
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 1195839999ab..5e9a7ffc747f 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -24,6 +24,7 @@ struct xe_pci_fake_data {
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
+const void *xe_pci_fake_data_gen_params(const void *prev, char *desc);
 void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc);
 
 const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 391f9597f74c..d67bfa3ec494 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -15,58 +15,6 @@
 #include "xe_tuning.h"
 #include "xe_wa.h"
 
-#define PLATFORM_CASE(platform__, graphics_step__)				\
-	{									\
-		.platform = XE_ ## platform__,					\
-		.subplatform = XE_SUBPLATFORM_NONE,				\
-		.step = { .graphics = STEP_ ## graphics_step__ }		\
-	}
-
-
-#define SUBPLATFORM_CASE(platform__, subplatform__, graphics_step__)			\
-	{										\
-		.platform = XE_ ## platform__,						\
-		.subplatform = XE_SUBPLATFORM_ ## platform__ ## _ ## subplatform__,	\
-		.step = { .graphics = STEP_ ## graphics_step__ }			\
-	}
-
-#define GMDID_CASE(platform__, graphics_verx100__, graphics_step__,		\
-		   media_verx100__, media_step__)				\
-	{									\
-		.platform = XE_ ## platform__,					\
-		.subplatform = XE_SUBPLATFORM_NONE,				\
-		.graphics_verx100 = graphics_verx100__,				\
-		.media_verx100 = media_verx100__,				\
-		.step = { .graphics = STEP_ ## graphics_step__,			\
-			   .media = STEP_ ## media_step__ }			\
-	}
-
-static const struct xe_pci_fake_data cases[] = {
-	PLATFORM_CASE(TIGERLAKE, B0),
-	PLATFORM_CASE(DG1, A0),
-	PLATFORM_CASE(DG1, B0),
-	PLATFORM_CASE(ALDERLAKE_S, A0),
-	PLATFORM_CASE(ALDERLAKE_S, B0),
-	PLATFORM_CASE(ALDERLAKE_S, C0),
-	PLATFORM_CASE(ALDERLAKE_S, D0),
-	PLATFORM_CASE(ALDERLAKE_P, A0),
-	PLATFORM_CASE(ALDERLAKE_P, B0),
-	PLATFORM_CASE(ALDERLAKE_P, C0),
-	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
-	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
-	SUBPLATFORM_CASE(DG2, G10, C0),
-	SUBPLATFORM_CASE(DG2, G11, B1),
-	SUBPLATFORM_CASE(DG2, G12, A1),
-	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
-	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
-	GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
-	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
-	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
-	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
-};
-
-KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
-
 static int xe_wa_test_init(struct kunit *test)
 {
 	const struct xe_pci_fake_data *param = test->param_value;
@@ -119,7 +67,7 @@ static void xe_wa_gt(struct kunit *test)
 }
 
 static struct kunit_case xe_wa_tests[] = {
-	KUNIT_CASE_PARAM(xe_wa_gt, platform_gen_params),
+	KUNIT_CASE_PARAM(xe_wa_gt, xe_pci_fake_data_gen_params),
 	{}
 };
 
-- 
2.47.1

