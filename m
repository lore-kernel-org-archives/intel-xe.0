Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E17606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aCyBKGTI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009E11215D;
	Thu, 26 Nov 2026 08:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271E5112158
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795682150; x=1827218150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yxdos4KzqFd/IZa//V3hZdFwIk1axTxzAAVkHvaLfNA=;
 b=aCyBKGTIhrf+YwM5qKmfU43X4r1jkLK1PmMzqiXr+LA5ns7IOwdYZB1M
 oj/dlb94x13COohCB0gaGKjBQt5s230vgoDCV3jyznbbpmBOOFRfWYH76
 8EGGwyJ0+RrdxOf0zeIdPpAFlnsDo0zTNEsIZdUKFWaE2ineadvjLL0KZ
 J9Eov8eSBLw21jr8Qh/VOU021gGKgoiJwm6I6Q8yfsNv6BEWCH9E6aYPS
 Sbjc99tj7pVOEdfw9ldQNw2mzFm48xJqOx6+ES5b5KX8YC+4vbHm54PAj
 JlqvQ+ZvZ1g9M8c7+2gftHbOCVfV5DsJ4pLoHhlzvwNNjkH5E7Gj7leK9 w==;
X-CSE-ConnectionGUID: 4oPV6yWtSquudsBdDQprYA==
X-CSE-MsgGUID: Ssnw6aMST0mPPfqkTqKDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4581243"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4581243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:45 -0800
X-CSE-ConnectionGUID: GZ3xcl2ZRY2A38Gj6CvibA==
X-CSE-MsgGUID: wyJVbvhpQ96aFGfoCfAZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12147448"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:42 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v4 3/3] drm/xe/ras: Skip offline queue processing after device
 unplug
Date: Thu, 26 Nov 2026 14:05:20 +0530
Message-ID: <20261126083516.1932195-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261126083516.1932195-5-riana.tauro@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The system controller worker can drain the offline queue at runtime.
During teardown, devres runs ras_fini() before sysctrl_fini(), so the
worker can still run after the offlined pages XArray is destroyed:

  CPU0 (teardown)                 CPU1 (sysctrl worker)
  ras_fini()
    xa_destroy()
                                  xe_ras_get_offline_queue()
                                    ...
                                      xa_store()
  sysctrl_fini()
    disable_work_sync()

Wrap xe_ras_get_offline_queue() in drm_dev_enter()/drm_dev_exit().
drm_dev_unplug() runs before devres teardown and waits for in-flight
sections, so no queue processing runs after ras_fini().

Assisted-by: LLM
Reported-by: Sashiko
Closes:https://sashiko.dev/#/patchset/20261124134323.1529876-2-riana.tauro%40intel.com
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index e080cbebbdbe..89c2385eabf7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -5,6 +5,8 @@
 
 #include <linux/bitfield.h>
 
+#include <drm/drm_drv.h>
+
 #include <generated/xe_device_wa_oob.h>
 
 #include "xe_assert.h"
@@ -486,9 +488,16 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 void xe_ras_get_offline_queue(struct xe_device *xe)
 {
 	struct xe_ras_offline_common response = {0};
+	int idx;
+
+	/* Unplug waits for this section, so nothing runs after ras_fini() */
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return;
 
 	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
 			      sizeof(response), &response, true);
+
+	drm_dev_exit(idx);
 }
 
 /*
-- 
2.47.1

