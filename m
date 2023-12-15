Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0494C46CA2
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70E810EA4C;
	Fri, 15 Dec 2023 16:25:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897FB10EA72
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657524; x=1734193524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X+yGBJsS1l1nOfbhPdibwlA7J56yFOg4ivNbg0wV79k=;
 b=A7SelukiJh1OsaYBiFOLJRDh5FDgiEa8GqkaN43tTIDTE7PnkGmjOn9H
 YCiNOtI0hh9Ujk5zfgpBcWjm4BYGyiTyrI6zbqFeVE7OO+eFOmz6qimak
 DiMOZQcycVo6Jg6DmWEyVVNnSmB68VWPf5yrxB+viHdeOcfi1lYZKtDLK
 Bd0L0xx+XyVUN9Nq+Ttxnc7awvD11p6qyfyZuvAo9qG4pzLClk3PwfvjF
 xTOapoDifY1OF+Is7E7wfyGRbOc/6R+2rdx9GrFzFhHKcnGqB+tCXgH4V
 hY/8YwtAf7fMRCsH1C0OUOsRs3X4iADLk8Eo9nl5Rzg2xA3iTyC/TGduW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459617437"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459617437"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021984120"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="1021984120"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.144.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:23 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 07/10] drm/xe/kunit: Use xe kunit helper in RTP test
Date: Fri, 15 Dec 2023 17:24:59 +0100
Message-Id: <20231215162502.1879-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231215162502.1879-1-michal.wajdeczko@intel.com>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace drm_kunit_helper_alloc_drm_device with xe helper.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: keep compose paradigm (Lucas)
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 4a6972897675..21e77026518b 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -15,6 +15,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
@@ -276,9 +277,7 @@ static int xe_rtp_test_init(struct kunit *test)
 	dev = drm_kunit_helper_alloc_device(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
-	xe = drm_kunit_helper_alloc_drm_device(test, dev,
-					       struct xe_device,
-					       drm, DRIVER_GEM);
+	xe = xe_kunit_helper_alloc_xe_device(test, dev);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
 
 	/* Initialize an empty device */
-- 
2.25.1

