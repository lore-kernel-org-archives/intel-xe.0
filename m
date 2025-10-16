Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4F2CCD19A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 17:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2970310E311;
	Thu, 16 Oct 2025 17:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4URZsJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8699410E311
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760637026; x=1792173026;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MWPZx95feTHuGgrqXQ0lrw8g6286/jGwEDOd0J8TAIA=;
 b=O4URZsJbCWcWWd8XjWexBopBpf21PeeMhaOiaoO1HQ5zjjSafjRCAtOv
 3r1cMjWlRIxQg8ol0PmxBKYh9vs/9EOqBj/6TjNOEfwxXyYSHO42VhUwf
 cfzdlbm9Y8sqhHfWRSAYW3XFo7kASN+PvFY8RBecvP3Vm1PWZ3uNsCt92
 CVfToICerpawcCnffXHIOyDBlKI4QDBqBqyndTshdiBG4oU+k7fGqwo3y
 vTMRef8sYeLdmGu34XImwBQ2pEuLVb3eXvoTv2+BXcoiqDlrmae7EVSaw
 MwHHyvI2BvDW2miq05P/ZMBkPyPl0vS9RxRb08avqtLRrf7tN6MJFLTDl w==;
X-CSE-ConnectionGUID: yUNsb9o/QOyRF2PKpCF4SA==
X-CSE-MsgGUID: iWp6ZeR/SEuBvGcG9vvwsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73512593"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73512593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:26 -0700
X-CSE-ConnectionGUID: /k0NpXcwSXO/9lDuoT3NGw==
X-CSE-MsgGUID: MA3xmrsiSUKh0aIwos6mKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182997792"
Received: from ldmartin-desk2.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.131])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:25 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 16 Oct 2025 14:49:56 -0300
Subject: [PATCH 1/2] drm/xe/tests/pci: Convert GT count check to general
 device check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-1-d0886d97121d@intel.com>
References: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
In-Reply-To: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

We already have check_graphics_ip() and check_media_ip() as general
functions to check the IP descriptors.  The check in
check_platform_gt_count() is simple enough such that we can convert the
function to a more general device check.  In an upcoming change, we will
also add some checks for other members of struct xe_device_desc.

As such, rename check_platform_gt_count() to check_platform_desc().
While at it, use inline (int) casting of max_gt_per_tile to keeps checks
for each member localized.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci_test.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 37b344df2dc3..f09efb523b7e 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -44,21 +44,20 @@ static void check_media_ip(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, mask, 0);
 }
 
-static void check_platform_gt_count(struct kunit *test)
+static void check_platform_desc(struct kunit *test)
 {
 	const struct pci_device_id *pci = test->param_value;
 	const struct xe_device_desc *desc =
 		(const struct xe_device_desc *)pci->driver_data;
-	int max_gt = desc->max_gt_per_tile;
 
-	KUNIT_ASSERT_GT(test, max_gt, 0);
-	KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
+	KUNIT_ASSERT_GT(test, (int)desc->max_gt_per_tile, 0);
+	KUNIT_ASSERT_LE(test, (int)desc->max_gt_per_tile, XE_MAX_GT_PER_TILE);
 }
 
 static struct kunit_case xe_pci_tests[] = {
 	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
 	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
-	KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
+	KUNIT_CASE_PARAM(check_platform_desc, xe_pci_id_gen_param),
 	{}
 };
 

-- 
2.51.0

