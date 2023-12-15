Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D483DC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E19410EA59;
	Fri, 15 Dec 2023 16:25:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFC810EA72
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657525; x=1734193525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nf462SIFv8Kqk2ygkwcxBUwx4T4CZrWMQSHs0YG1FtQ=;
 b=ibnb5NoDRWUA9bmV+WrP18XisoASLhpbjNzKVvN6Lupxaydq4BCdDtXC
 +86JxMTVxe6WODSZhFFEmNuyKEsEj5c066Y0lLmuWb28dAltHVrJGBs67
 PITy7zfgI/8Gx5G/ASRF4Y22SZlsjpGyT/bgFMhuBRIq2wtVEPS9F7nMF
 v2Rl0w13HBMGK8apA/wJdNGTt7Q1DBcb+nfO5JU8n1BTwcQmyb7tT/tVv
 qByXUZoLVCkJflJaxBxlkZ7yK7gSfJX27vIWkm417kMJ24MgVzZlJna20
 9R6Bm90Y3sNCi9qPw6qmk+ph4Mec9qAvJcU36+XaO1hujGya29vzyS98c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459617442"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459617442"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021984123"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="1021984123"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.144.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:24 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 08/10] drm/xe/kunit: Use xe kunit helper in WA test
Date: Fri, 15 Dec 2023 17:25:00 +0100
Message-Id: <20231215162502.1879-9-michal.wajdeczko@intel.com>
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

Use xe helper code to allocate fake xe device.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: keep compose paradigm (Lucas)
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

