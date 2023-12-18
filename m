Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BE6C46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DD010E381;
	Mon, 18 Dec 2023 19:06:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2810E371
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926405; x=1734462405;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vqjoZz2RmDcJ01z39UnuV3KASZO6vrWxNDtiFHGLKEU=;
 b=e7WhVu8Pa43DQNyHiUKTjwR4e4rqfyOgW/3Z0SV5u3UvV6F4uAUnmaDK
 BPwWRocWnEJVyJgwJ7yxlPnUYVpmy7uUtqW4xUB07GoQkIzdt+2PWvAMO
 HW6Ors6oJOCZubehbDIUZI+Uf6Q6LKiWoGDTb56Y+2QyEAYlQhEUREJEe
 mZFH0Aw6RY9iWRXK2lYi4bsAyBU7Zra9H2oAMQgmn6dWUS7Vb68JPJqYR
 KGsS1AFtmLWxRIJREaCBe51BA2yI89Acb0FC5NogWgKNsIfKsEjPpvo7y
 gS0mQVRbXcN13NjbKT3SIU7np1S9QGZe3x45K5tDPamE4LOmrei6Zy7IR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="399382196"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="399382196"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866330881"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="866330881"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 11:06:44 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 07/10] drm/xe/kunit: Use xe kunit helper in RTP test
Date: Mon, 18 Dec 2023 20:06:26 +0100
Message-Id: <20231218190629.502-8-michal.wajdeczko@intel.com>
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

Replace drm_kunit_helper_alloc_drm_device with xe helper.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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

