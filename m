Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BACC7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 12:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5E10E30C;
	Mon, 22 May 2023 12:55:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5510E30C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684760148; x=1716296148;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=164PzhFEqbRn8lsmk6b+7/eMZHiJ31ShJnagLz+Nnag=;
 b=D90ckEu7gA/4GuKSkDRN9I+nwRki6Kr382p5fghB+ldUFz4gOYBbIJt0
 RWXOdfLqPFziGPgzh01cVJq3CgNggwWqXwF8iAwJzVRFnC8cNXO8x9f/z
 c4o0zzPohNWuzwgmv9+EK+kUqwyx3vEwuIsoqGMukZ9pl07wlZQXmlO1t
 qASnt9zs9udUlyfjIgdr8z0YIAbQNxPVeXgHZHlFaiW9nz01L/1IqJerA
 GtNClBXFhbyt38XCIcVYGXMwhdsLSMJyk6PFO1E4lRud/P1eebwICHwRE
 4RGWQsAaZl/KU4DwD+2ZENsrljr2bDWNQjbdiLqCUd2yRfVvgm8QwHUoz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="342362412"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="342362412"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 05:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="815684888"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="815684888"
Received: from rpeachey-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.33.109])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 05:55:46 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 09:55:29 -0300
Message-Id: <20230522125529.52695-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display support
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

Remove the call to drm_aperture_remove_conflicting_pci_framebuffers(),
which is already being done by xe_device_create().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index c122cc4b27c9..1a9e9c78966d 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -10,7 +10,6 @@
 
 #include <linux/fb.h>
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
@@ -199,11 +198,6 @@ int xe_display_init_noirq(struct xe_device *xe)
 
 	intel_device_info_runtime_init(xe);
 
-	err = drm_aperture_remove_conflicting_pci_framebuffers(to_pci_dev(xe->drm.dev),
-							       xe->drm.driver);
-	if (err)
-		return err;
-
 	err = intel_display_driver_probe_noirq(xe);
 	if (err)
 		return err;
-- 
2.40.1

