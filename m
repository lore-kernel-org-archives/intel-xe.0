Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B763CCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8011810E1F1;
	Fri, 29 Aug 2025 17:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TspsrJyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FCE10E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487996; x=1788023996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6ZXNHKpCDSvmX/e4DmtJnyzqcsxfSb7/lYXM6oFca4=;
 b=TspsrJyVHqBb+7jZ+xaU6OfVfHgxJnDkuDrlAX0A/oWTmXXgrvhm+J7L
 bBM1AbuLqMqgUmPMA4ynpUfiETr2YDoXsGmvp2ehYPH7LacpUo+EkRfEP
 IWIvzK31YegNn/hLMqQzgUqQjFe6H/rZ1ILyT1AE6OYE4Y0WlOiXPoami
 mGhgKAqjlmy/fPctH8+lZl6ob/4y+1wRnA3ZJvw1Vulf7rDiFpYXQBWRA
 BIZRjB/KV6UoTf1vKCcdDvpNQkUhOCtvE3UR6AknCPlxWXXoTYdeHzRoR
 dZ0sIzBMhGKX0E3NVJ6jT26NPlD0xycIAxtX6tBMylUZpl9rYxdb2zuE1 g==;
X-CSE-ConnectionGUID: 6vqk8kc4SbO8dGuweoK/qw==
X-CSE-MsgGUID: uq7NLjGFRpmHqZCaYBxNNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212765"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:55 -0700
X-CSE-ConnectionGUID: GtTftIhXRke2qLOL8+c7bQ==
X-CSE-MsgGUID: rtV5Df9yQweQZ7JLFCFtgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818338"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/7] drm/xe/kunit: Promote fake platform parameter list
Date: Fri, 29 Aug 2025 19:19:20 +0200
Message-ID: <20250829171922.572-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829171922.572-1-michal.wajdeczko@intel.com>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
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
could be used in more places by other test suites.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 69 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 +
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 55 +-------------------
 3 files changed, 71 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a8b35439131f..f19b1a64128b 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,6 +12,75 @@
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
+	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),
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
 	const struct xe_device_desc *desc;
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
index 7bf34fd0d189..d67bfa3ec494 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -15,59 +15,6 @@
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
-	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),
-};
-
-KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
-
 static int xe_wa_test_init(struct kunit *test)
 {
 	const struct xe_pci_fake_data *param = test->param_value;
@@ -120,7 +67,7 @@ static void xe_wa_gt(struct kunit *test)
 }
 
 static struct kunit_case xe_wa_tests[] = {
-	KUNIT_CASE_PARAM(xe_wa_gt, platform_gen_params),
+	KUNIT_CASE_PARAM(xe_wa_gt, xe_pci_fake_data_gen_params),
 	{}
 };
 
-- 
2.47.1

