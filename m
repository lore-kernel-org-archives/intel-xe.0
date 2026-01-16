Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B033C98308
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D0110E267;
	Fri, 16 Jan 2026 22:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWazibtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9B10E267
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601572; x=1800137572;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YEtTF1endABOTCklkMKSP2IvSNolPAnLq0TDyPE+sEc=;
 b=XWazibtGnR5b/ui0EUBvyOh8YxuYFFXTF+9Po69UJ9zBy92dSKumDFCA
 XggH+JacLwWOiYFRCfQI945kjwgaah7T5F5l96/Acn6XbmkzVAUa5Hv9l
 ZzKzfe6N1wGUoHeAYgAolNwjeyj1/l3AINOGX2xRvRN/x23F7TK0dwR6C
 m+hzkIQ6xEyTRMl1SRBWoxeeFVomGCR2KQ16VuRvexGxPIh3dRTnszCys
 C2JvtVP/hxoGIwsapPn7+l9Xu8qbJmPq5stPv3VgZWZdjqAcrLRYxDjqn
 6S3uYot4epJWyl4D+8i9vJHQhhqOFY9nL3djCnJ8c6N9imx5LhXiS4Bc3 Q==;
X-CSE-ConnectionGUID: rGx5/DCrRRmCyd9UwmqdvA==
X-CSE-MsgGUID: 7iP1VHewSjKUnQyWyjpmtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123029"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:51 -0800
X-CSE-ConnectionGUID: Si4A+NglQ5mSgEm9R3stLQ==
X-CSE-MsgGUID: Shz76GkQRKWLWOdMvp8P+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961812"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:51 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:18 -0300
Subject: [PATCH 10/12] drm/xe/kunit: Include hw_engines in xe_wa test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-10-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

For better coverage, include RTP to register save/store processing for
hw_engines as another xe_wa test case.

Note that, since one of the RTP rules involve calling
xe_rtp_cfeg_wmtp_disabled(), we need to intercept a MMIO read to
XEHP_FUSE4 to allow the test to run without crashing.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 50 ++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 2bf6fab015cd..3311f05a6fc2 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -6,15 +6,34 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
 
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 
+#include "regs/xe_gt_regs.h"
+#include "tests/xe_mmio_intercept.h"
 #include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_hw_engine.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_tuning.h"
 #include "xe_wa.h"
 
+static bool xe_wa_mmio_intercept_read32(struct kunit *test,
+					struct xe_mmio *mmio,
+					struct xe_reg reg,
+					u32 *val)
+{
+	/* For XE_RTP_RULES(...FUNC(xe_rtp_cfeg_wmtp_disabled)...). */
+	if (reg.raw == XEHP_FUSE4.raw) {
+		*val = CFEG_WMTP_DISABLE;
+		return true;
+	}
+
+	return false;
+}
+
 static int xe_wa_test_init(struct kunit *test)
 {
 	const struct xe_pci_fake_data *param = test->param_value;
@@ -33,10 +52,13 @@ static int xe_wa_test_init(struct kunit *test)
 	ret = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	kunit_activate_static_stub(test,
+				   xe_mmio_intercept_read32,
+				   xe_wa_mmio_intercept_read32);
+
 	if (!param->graphics_verx100)
 		xe->info.step = param->step;
 
-	/* TODO: init hw engines for engine/LRC WAs */
 	xe->drm.dev = dev;
 	test->priv = xe;
 
@@ -59,8 +81,34 @@ static void xe_wa_gt(struct kunit *test)
 	}
 }
 
+static void xe_wa_hw_engines(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_gt *gt;
+	int id;
+
+	for_each_gt(gt, xe, id) {
+		struct xe_hw_engine *hwe;
+		int hwe_id;
+
+		/*
+		 * The early initialization also causes RTP processing to build
+		 * up each engine's reg_sr.
+		 */
+		xe_hw_engines_init_early(gt);
+		for_each_hw_engine(hwe, gt, hwe_id)
+			KUNIT_EXPECT_EQ(test, hwe->reg_sr.errors, 0);
+
+		for_each_hw_engine(hwe, gt, hwe_id) {
+			xe_hw_engine_setup_reg_lrc(hwe);
+			KUNIT_EXPECT_EQ(test, hwe->reg_lrc.errors, 0);
+		}
+	}
+}
+
 static struct kunit_case xe_wa_tests[] = {
 	KUNIT_CASE_PARAM(xe_wa_gt, xe_pci_fake_data_gen_params),
+	KUNIT_CASE_PARAM(xe_wa_hw_engines, xe_pci_fake_data_gen_params),
 	{}
 };
 

-- 
2.52.0

