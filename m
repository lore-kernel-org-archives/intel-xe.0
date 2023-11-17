Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBAC54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 23:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A3910E7A0;
	Fri, 17 Nov 2023 23:14:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CA010E781
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700262866; x=1731798866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LN2v/eiZBLc3W0IbulBOBNH9/hqsCL36nHn9bDu4U34=;
 b=GW7qGeJ8zfUU3+DiCIMN+e/tp8EeUAlUUbkdLBBbcR1UtjnS3X2vmVgu
 uWVR62hCXj6OpCpgEdFp+s1EievbfdioCK9xcn1/fx3naDAYTKa/9HlUc
 3VULGOWtKe07UlgSxL4WUjRpxhznzgedWeWwTnXkAYha9RhXOdxyucCVJ
 0JDbVcvdgnbfh2OwFklcQ6f2r56FFYaJsjz0RpbUDGzMWLZbEbXxRLaSO
 SlV5tDaAiB3RSlHyM0NsIyeWS2gMj3ZHeP7fKf9mHrxt4HTcE1IbUYaBf
 CMgjmWJ8sBNT80HQzbF11AP9GDm3BeveZw1tI3hSKC1Oxsyr1+pgH1MBm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371561522"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371561522"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097236236"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097236236"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:14:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 15:14:11 -0800
Message-Id: <20231117231411.631895-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117231411.631895-1-lucas.demarchi@intel.com>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/kunit: Test WAs for MTL and LNL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that the kunit infra has proper support for GMD_ID platforms, add a
few variants of MTL and LNL.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 34 ++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 9185e520af58..458ad725802d 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -18,6 +18,8 @@ struct platform_test_case {
 	const char *name;
 	enum xe_platform platform;
 	enum xe_subplatform subplatform;
+	u32 graphics_verx100;
+	u32 media_verx100;
 	struct xe_step_info step;
 };
 
@@ -38,6 +40,18 @@ struct platform_test_case {
 		.step = { .graphics = STEP_ ## graphics_step__ }			\
 	}
 
+#define GMDID_CASE(platform__, graphics_verx100__, graphics_step__,		\
+		   media_verx100__, media_step__)				\
+	{									\
+		.name = #platform__ " (g:" #graphics_step__ ", m:" #media_step__ ")",\
+		.platform = XE_ ## platform__,					\
+		.subplatform = XE_SUBPLATFORM_NONE,				\
+		.graphics_verx100 = graphics_verx100__,				\
+		.media_verx100 = media_verx100__,				\
+		.step = { .graphics = STEP_ ## graphics_step__,			\
+			   .media = STEP_ ## media_step__ }			\
+	}
+
 static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(TIGERLAKE, B0),
 	PLATFORM_CASE(DG1, A0),
@@ -63,6 +77,10 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(PVC, B0),
 	PLATFORM_CASE(PVC, B1),
 	PLATFORM_CASE(PVC, C0),
+	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
+	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
+	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
+	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
 };
 
 static void platform_desc(const struct platform_test_case *t, char *desc)
@@ -78,11 +96,24 @@ static int xe_wa_test_init(struct kunit *test)
 	struct xe_pci_fake_data data = {
 		.platform = param->platform,
 		.subplatform = param->subplatform,
+		.graphics_verx100 = param->graphics_verx100,
+		.media_verx100 = param->media_verx100,
+		.graphics_step = param->step.graphics,
+		.media_step = param->step.media,
 	};
 	struct xe_device *xe;
 	struct device *dev;
 	int ret;
 
+	/*
+	 * Make sure graphics/media version are only ever set together - only
+	 * GMDID platforms should have that
+	 */
+	if (param->graphics_verx100) {
+		KUNIT_ASSERT_TRUE(test, param->media_verx100);
+		KUNIT_ASSERT_TRUE(test, param->step.media > STEP_NONE);
+	}
+
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
@@ -95,7 +126,8 @@ static int xe_wa_test_init(struct kunit *test)
 	ret = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	xe->info.step = param->step;
+	if (!param->graphics_verx100)
+		xe->info.step = param->step;
 
 	/* TODO: init hw engines for engine/LRC WAs */
 	xe->drm.dev = dev;
-- 
2.40.1

