Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A23C10DC1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 23:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDF910E69C;
	Wed, 29 Nov 2023 23:28:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921E610E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701300515; x=1732836515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EfbeMDeIacxppJ4GyhgK+WKuahGM0vUF0MaaVRdxLQU=;
 b=e7qKGUkDnmobluNIeDkQyyYShqXIOqaZPOzeFqXXP7OAgXVza5zUSbc7
 LlHLt/ZUO5CuPVul/v8LLA368e/suioTMb4VMRkDD9I/QdG2MmxzEeINL
 pom0C9/J8a0baUyitrGrSGWspnV6GktcOcWfIIS0xC15nlgwvgD5CAM0q
 ftM9SBVeyOgeA+0w59bgIe92fPM5Kzc73rQGZt9pCUFP/DoLmqvKI45LK
 ddUPqgFjE7nOMzVuwTrnHYbYiHF5nfo96+Prnk+giHU4ExPjq0QaJUHbi
 QJkHrxONYpitMcNh59rIuFC2ivo2GIYyRcxQRF0lery1gZ16VHHHSY/05 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14797377"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14797377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798088850"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798088850"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 15:28:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 15:28:07 -0800
Message-Id: <20231129232807.1499826-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129232807.1499826-1-lucas.demarchi@intel.com>
References: <20231129232807.1499826-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/5] drm/xe/kunit: Test WAs for MTL and LNL
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

v2: Remove bogus check for setting both media and graphics version in
    test (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 045afae43891..a53c22a19582 100644
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
@@ -78,6 +96,10 @@ static int xe_wa_test_init(struct kunit *test)
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
@@ -95,7 +117,8 @@ static int xe_wa_test_init(struct kunit *test)
 	ret = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	xe->info.step = param->step;
+	if (!param->graphics_verx100)
+		xe->info.step = param->step;
 
 	/* TODO: init hw engines for engine/LRC WAs */
 	xe->drm.dev = dev;
-- 
2.40.1

