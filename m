Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E729C7114A
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 18:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DAC10E153;
	Sat, 14 Jun 2025 18:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIHqzeaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAD10E153
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749925537; x=1781461537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hAsPO4+/6qnEta2olqy69MP/NnCX/k5kcckuXRSFqIo=;
 b=GIHqzeaIfDtTHMn1rtSYiTZQo3LJTwKviSmUc7707mQywanr9sE1kvhV
 6EmWc5gf/Kq42GBIkiCS2FHytOzRu/jk4Qc0R5jLvt29JtXfRZ3L72jY2
 uD3BDZXgnjPf1MPljczKE3fjG1gbl54QAgK/5UplqRRHh4xgtD+QK/XQg
 M2V1CYwO8xiUyiItU9112k56cpmtfkDOH9HUcV6+/fkilP5bF64jagYny
 Upe5sUB30/fUfJ4TiZdPXOSzsU4nhNsCUf7XZ3nES+YHxuPBz9CM1C5NY
 2PY7HwXTb1SbYm+s4/sGTGKVVN4I7G+vjLylZq18YxyC7GTomyDkn+c1h Q==;
X-CSE-ConnectionGUID: x0L8KXLmR3SHe0nMoyiThw==
X-CSE-MsgGUID: t3YwcNyjQ8e4rUGCBDet0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69695306"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; d="scan'208";a="69695306"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 11:25:34 -0700
X-CSE-ConnectionGUID: Aav21AIeSzGmKBWagieJjA==
X-CSE-MsgGUID: kaPHJSkMRuSkTGcp2YEwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; d="scan'208";a="147991004"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 11:25:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/2] drm/xe/tests: Convert xe_pci tests to parametrized
 tests
Date: Sat, 14 Jun 2025 20:24:46 +0200
Message-Id: <20250614182446.2024-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250613191938.1980-3-michal.wajdeczko@intel.com>
References: <20250613191938.1980-3-michal.wajdeczko@intel.com>
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

Instead of looping over known IP descriptors within single test
case, without any diagnostics which IP descriptor is eventually
broken, define kunit parameter generators with IP descriptors,
and make existing xe_pci tests fully parametrized:

 [ ] =================== xe_pci (2 subtests) ====================
 [ ] ==================== check_graphics_ip  ====================
 [ ] [PASSED] 12.70 Xe_LPG
 [ ] [PASSED] 12.71 Xe_LPG
 [ ] [PASSED] 12.74 Xe_LPG+
 [ ] [PASSED] 20.01 Xe2_HPG
 [ ] [PASSED] 20.04 Xe2_LPG
 [ ] [PASSED] 30.00 Xe3_LPG
 [ ] [PASSED] 30.01 Xe3_LPG
 [ ] ================ [PASSED] check_graphics_ip ================
 [ ] ===================== check_media_ip  ======================
 [ ] [PASSED] 13.00 Xe_LPM+
 [ ] [PASSED] 13.01 Xe2_HPM
 [ ] [PASSED] 20.00 Xe2_LPM
 [ ] [PASSED] 30.00 Xe3_LPM
 [ ] ================= [PASSED] check_media_ip ==================
 [ ] ===================== [PASSED] xe_pci ======================

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2: restore struct xe_device forward decl (CI)
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 63 +++++++++++++-------------
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 24 ++++------
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 10 +---
 3 files changed, 41 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 1d3e2e50c355..baccb657bd05 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,49 +12,48 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
+		 param->verx100 / 100, param->verx100 % 100, param->name);
+}
+
+KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
+KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
+
 /**
- * xe_call_for_each_graphics_ip - Iterate over all recognized graphics IPs
- * @xe_fn: Function to call for each device.
+ * xe_pci_graphics_ip_gen_param - Generate graphics struct xe_ip parameters
+ * @prev: the pointer to the previous parameter to iterate from or NULL
+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
+ *
+ * This function prepares struct xe_ip parameter.
+ *
+ * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
  *
- * This function iterates over the descriptors for all graphics IPs recognized
- * by the driver and calls @xe_fn: for each one of them.
+ * Return: pointer to the next parameter or NULL if no more parameters
  */
-void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn)
+const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
 {
-	const struct xe_graphics_desc *desc, *last = NULL;
-
-	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
-		desc = graphics_ips[i].desc;
-		if (desc == last)
-			continue;
-
-		xe_fn(desc);
-		last = desc;
-	}
+	return graphics_ip_gen_params(prev, desc);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
 
 /**
- * xe_call_for_each_media_ip - Iterate over all recognized media IPs
- * @xe_fn: Function to call for each device.
+ * xe_pci_media_ip_gen_param - Generate media struct xe_ip parameters
+ * @prev: the pointer to the previous parameter to iterate from or NULL
+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
+ *
+ * This function prepares struct xe_ip parameter.
  *
- * This function iterates over the descriptors for all media IPs recognized
- * by the driver and calls @xe_fn: for each one of them.
+ * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
+ *
+ * Return: pointer to the next parameter or NULL if no more parameters
  */
-void xe_call_for_each_media_ip(xe_media_fn xe_fn)
+const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
 {
-	const struct xe_media_desc *desc, *last = NULL;
-
-	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
-		desc = media_ips[i].desc;
-		if (desc == last)
-			continue;
-
-		xe_fn(desc);
-		last = desc;
-	}
+	return media_ip_gen_params(prev, desc);
 }
-EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
 
 static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 			    u32 *ver, u32 *revid)
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 744a37583d2d..95fed41f7ff2 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -14,9 +14,10 @@
 #include "xe_pci_test.h"
 #include "xe_pci_types.h"
 
-static void check_graphics_ip(const struct xe_graphics_desc *graphics)
+static void check_graphics_ip(struct kunit *test)
 {
-	struct kunit *test = kunit_get_current_test();
+	const struct xe_ip *param = test->param_value;
+	const struct xe_graphics_desc *graphics = param->desc;
 	u64 mask = graphics->hw_engine_mask;
 
 	/* RCS, CCS, and BCS engines are allowed on the graphics IP */
@@ -28,9 +29,10 @@ static void check_graphics_ip(const struct xe_graphics_desc *graphics)
 	KUNIT_ASSERT_EQ(test, mask, 0);
 }
 
-static void check_media_ip(const struct xe_media_desc *media)
+static void check_media_ip(struct kunit *test)
 {
-	struct kunit *test = kunit_get_current_test();
+	const struct xe_ip *param = test->param_value;
+	const struct xe_media_desc *media = param->desc;
 	u64 mask = media->hw_engine_mask;
 
 	/* VCS, VECS and GSCCS engines are allowed on the media IP */
@@ -42,19 +44,9 @@ static void check_media_ip(const struct xe_media_desc *media)
 	KUNIT_ASSERT_EQ(test, mask, 0);
 }
 
-static void xe_gmdid_graphics_ip(struct kunit *test)
-{
-	xe_call_for_each_graphics_ip(check_graphics_ip);
-}
-
-static void xe_gmdid_media_ip(struct kunit *test)
-{
-	xe_call_for_each_media_ip(check_media_ip);
-}
-
 static struct kunit_case xe_pci_tests[] = {
-	KUNIT_CASE(xe_gmdid_graphics_ip),
-	KUNIT_CASE(xe_gmdid_media_ip),
+	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
+	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 65ac0295d435..3a1df7a5e291 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -12,14 +12,6 @@
 #include "xe_sriov_types.h"
 
 struct xe_device;
-struct xe_graphics_desc;
-struct xe_media_desc;
-
-typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
-typedef void (*xe_media_fn)(const struct xe_media_desc *);
-
-void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
-void xe_call_for_each_media_ip(xe_media_fn xe_fn);
 
 struct xe_pci_fake_data {
 	enum xe_sriov_mode sriov_mode;
@@ -33,6 +25,8 @@ struct xe_pci_fake_data {
 
 int xe_pci_fake_device_init(struct xe_device *xe);
 
+const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
+const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
 const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
 
 #endif
-- 
2.47.1

