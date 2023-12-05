Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57C3C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 13:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A2210E531;
	Tue,  5 Dec 2023 13:40:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A6410E509
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701783601; x=1733319601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Sdw+JiOWyDPAjpP7l4doFM9nB0VyO+EBwsuJJIpJto=;
 b=mAUrJufTHb7Sp4grLnQdFhjrkV9LFz8afdJvRWufsQENgDFLkTxaRiOc
 /SqtaoBUYADRqjvGT2qIxMPKtDdJUzWHj+b+1cMH6r2o124/T/+6VxnIu
 EONAsi1GORpCbeCyheTvmiNVXHT5Gugd64o82oL9sll10AvccYvtEGcsj
 mTEX2GOcExMgqAF61v50hklQ0gVst5ZB78qmWuFLdHp7Qj/YU0ZVW7ks+
 UbdjlQhpOheVdQGmQeYsb4YpARNlIyoH/t9Scu6U6BAgMikWpYghK+5og
 2eIWBbnTzAQGPGUic7L2YzO5tWqLHCwlGEabtG/OAonNnbEdYH8xN98IH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12610417"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="12610417"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720701174"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="720701174"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:40:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 05:39:51 -0800
Message-Id: <20231205133954.2089546-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 1/4] drm/xe/kunit: Remove handling of
 XE_TEST_SUBPLATFORM_ANY
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only user passing XE_TEST_SUBPLATFORM_ANY is
xe_pci_fake_device_init_any(), but then the function would return
earlier when handling XE_TEST_PLATFORM_ANY. Platforms without a
subplatform use XE_SUBPLATFORM_NONE.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231129232807.1499826-3-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index d850dca85af1..c1aa785cac18 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -128,11 +128,6 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 	if (!ent->device)
 		return -ENODEV;
 
-	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
-		subplatform_desc = desc->subplatforms;
-		goto done;
-	}
-
 	for (subplatform_desc = desc->subplatforms;
 	     subplatform_desc && subplatform_desc->subplatform;
 	     subplatform_desc++)
-- 
2.40.1

