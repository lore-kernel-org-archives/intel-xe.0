Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F66C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1E10E279;
	Mon, 18 Dec 2023 19:07:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678CC10E37D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926406; x=1734462406;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9wXxOP0OKExcz8AcCoVQbVce90LjHq3TCVy//xKmfPc=;
 b=S/mB+SPfkazHIe8RWk2H8VcMRIeuGK3xwKrfKtEzljH3D0MfFwfROvr3
 vMC1/M/XXJGP6LvuggvyzsHNg69OkxhXT9BrDjjuvJadFBMoMOxLo/d3k
 7ksDD4d0xau1WOWBDXCATZeOysfU8RuJvRubSn6xUD19hNa6Va5j3LafJ
 ArlgVLXsbvpuRxqohxHQWr8AGNiR3h+EsSslaG0lFg8z6Ercr4JYqDnM2
 qJpX2Vl8wqHGpFKNbrhwzO9fE7hF0A6KajJ1VS6d3RepYHzJLeYxDFx6U
 fcvLbJR4/z5szfETYHC9uStfweTfuDrmPLdHwcF1kY1j7D2WNLtpTasop w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="399382199"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="399382199"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866330883"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="866330883"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 08/10] drm/xe/kunit: Use xe kunit helper in WA test
Date: Mon, 18 Dec 2023 20:06:27 +0100
Message-Id: <20231218190629.502-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

Use xe helper code to allocate fake xe device.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index a53c22a19582..3d7f3ef62ae9 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -9,6 +9,7 @@
 #include <kunit/test.h>
 
 #include "xe_device.h"
+#include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_tuning.h"
@@ -108,9 +109,7 @@ static int xe_wa_test_init(struct kunit *test)
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
-	xe = drm_kunit_helper_alloc_drm_device(test, dev,
-					       struct xe_device,
-					       drm, DRIVER_GEM);
+	xe = xe_kunit_helper_alloc_xe_device(test, dev);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 
 	test->priv = &data;
-- 
2.25.1

