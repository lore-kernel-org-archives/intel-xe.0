Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A729C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C3E10E100;
	Tue, 21 Mar 2023 22:06:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0B810E090
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436380; x=1710972380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wwovUL5PRCFZwNHYy/guFHmE7s5bGtrTEg1hrU4xYDQ=;
 b=U+aBebDMJJ92kEgnfHweuJXhB7iskSDD1Az57+lCAzkurZvzIhrj6xDD
 dJjB164HqtgbnrKYYLxDkWBCi9NsLWhu5r8dM+PoonWOrfUNwlQbSHwT/
 Jnn11s4pQabNzYwxsjyVar6FmFp9Wd+dlH2u5/IkQUyTYWt3cNXCjcFEj
 bkew+F6G71fex3TygeWTC6G5mUCOltl04r1OeCmXRqNQp8LYlS5LvFC6w
 SfKRatMugCume4PUwuJwAVPwKZHdKqT2ebKyfPH7GzcoN2Oomwek5JFju
 uv4gyb/sD2OqISoTGG035nPbiGZjOUYARGsgIv9FEazKHq4xAWxTQH8WW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109500"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109500"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065706"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065706"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:24 -0700
Message-Id: <20230321220527.595462-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe: Use XE_KUNIT for symbol namespace
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of simply using EXPORT_SYMBOL() so the functions can be called
across modules, use EXPORT_SYMBOL_NS_GPL() with a private XE_KUNIT
namespace. This avoids accidentally "leaking" these functions and letting
them be called from outside the kunit tests. Use the _GPL() variant
since it's the license declared for the test modules.  If these
functiosn are accidentally called from another module, they would
receive a modpost error like below:

	ERROR: modpost: module XXXXXXX uses symbol
	xe_ccs_migrate_kunit from namespace XE_KUNIT, but does not
	import it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c           | 4 ++--
 drivers/gpu/drm/xe/tests/xe_bo_test.c      | 1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      | 2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c | 1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 2 +-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c | 1 +
 drivers/gpu/drm/xe/tests/xe_rtp.c          | 6 +++---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c     | 1 +
 8 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index aa433a7b59b7..345956b43e8d 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -166,7 +166,7 @@ void xe_ccs_migrate_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(ccs_test_run_device);
 }
-EXPORT_SYMBOL(xe_ccs_migrate_kunit);
+EXPORT_SYMBOL_NS_GPL(xe_ccs_migrate_kunit, XE_KUNIT);
 
 static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
 {
@@ -304,4 +304,4 @@ void xe_bo_evict_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(evict_test_run_device);
 }
-EXPORT_SYMBOL(xe_bo_evict_kunit);
+EXPORT_SYMBOL_NS_GPL(xe_bo_evict_kunit, XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
index 92dda4fca21b..f51835cd461f 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
@@ -22,3 +22,4 @@ kunit_test_suite(xe_bo_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index cf9dddf1a8d7..39a2b8d5755f 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -259,4 +259,4 @@ void xe_dma_buf_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(dma_buf_run_device);
 }
-EXPORT_SYMBOL(xe_dma_buf_kunit);
+EXPORT_SYMBOL_NS_GPL(xe_dma_buf_kunit, XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
index a1adfd1e1605..9430ec58ecfb 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
@@ -21,3 +21,4 @@ kunit_test_suite(xe_dma_buf_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index d410305c9b59..d6d815f419af 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -407,4 +407,4 @@ void xe_migrate_sanity_kunit(struct kunit *test)
 {
 	xe_call_for_each_device(migrate_test_run_device);
 }
-EXPORT_SYMBOL(xe_migrate_sanity_kunit);
+EXPORT_SYMBOL_NS_GPL(xe_migrate_sanity_kunit, XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
index d6be360c3b6d..5f704be2ad33 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
@@ -21,3 +21,4 @@ kunit_test_suite(xe_migrate_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
index 92e2c2b8b44d..3076f17d6497 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
@@ -102,7 +102,7 @@ void xe_rtp_process_basic(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry->clr_bits);
 	KUNIT_EXPECT_EQ(test, set_bits, sr_entry->set_bits);
 }
-EXPORT_SYMBOL(xe_rtp_process_basic);
+EXPORT_SYMBOL_NS_GPL(xe_rtp_process_basic, XE_KUNIT);
 
 /*
  * Duplicate entries - same register register, only one action,
@@ -148,7 +148,7 @@ void xe_rtp_process_dup(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, count, 1);
 	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
 }
-EXPORT_SYMBOL(xe_rtp_process_dup);
+EXPORT_SYMBOL_NS_GPL(xe_rtp_process_dup, XE_KUNIT);
 
 /*
  * Incompatible types: same register register, but entries trying to set the
@@ -198,4 +198,4 @@ void xe_rtp_process_incompat_types(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, count, 1);
 	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
 }
-EXPORT_SYMBOL(xe_rtp_process_incompat_types);
+EXPORT_SYMBOL_NS_GPL(xe_rtp_process_incompat_types, XE_KUNIT);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 4a12aad3f759..bb633dd09a76 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -62,3 +62,4 @@ kunit_test_suite(xe_rtp_test_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(XE_KUNIT);
-- 
2.39.0

