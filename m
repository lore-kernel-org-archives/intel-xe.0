Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D4606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlCYmQnc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EED10E513;
	Thu, 12 Nov 2026 06:07:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5110E4D9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794463644; x=1825999644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VKbuGdV9J9AtjSSzMDiZSMXNC3mHqP4/CwWs3QQrwT8=;
 b=AlCYmQncSB1sGIZLMky3e+IZOTfkr71A+rRe5/tzNU406ilvyuKjkDvj
 oI7AVso0RTprTOzJVJ2dQSduAUQ9ZEXTdpsJjNhQmhk8bhd8iLqaAB161
 vOLP+kWw8TPNYjddEBgq0K42LtnVRvofmRrqTDL/felTDntOkcFi+cssY
 Yl7g4x5V36hZ3++QIjJJiWSGDeWc3RhHVW/aR3N98aYPIFQHEYgluBGqT
 o0G2Ul+VJXblMkie4Si0EUduYzajJOOSYQ99MSsGGAiMISu7+2Bzoh0Nd
 c9JdeeSZCp5vmAyxKrwJ+vFq10X0/UVkiuqB2E9pYwz+PChT9Yz4PEeN3 w==;
X-CSE-ConnectionGUID: lulKx368SQywW7YCV2i7Mg==
X-CSE-MsgGUID: 00CyrHYLRVq3BZBlxxjQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3265005"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3265005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:24 -0800
X-CSE-ConnectionGUID: UJLs++9fRnmAplsyFHDFBg==
X-CSE-MsgGUID: YV3t94qPSyOjqB3EC37N1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8576215"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:21 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v5 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
Date: Thu, 12 Nov 2026 11:37:05 +0530
Message-ID: <20261112060701.3327125-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112060701.3327125-10-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
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

Runtime survivability mode creates sysfs and declares the device as
wedged in a worker thread. This can race with unbind.

During unbind, devres actions such as disabling the worker run as part of
teardown. A runtime survivability enable that is still in flight or gets
scheduled in that window can create the survivability sysfs entries while
the device is being removed. This is incorrect, as runtime survivability
mode must not be entered once during devres teardown.

Use the DRM device enter/exit protection so that the enable path
synchronizes with device unplug and returns early if the device is
already being unbound.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: fix typo (Mallesh)
    fix checkpatch
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index d73cdad0b3a9..91a0680e449b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -10,6 +10,8 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include <drm/drm_drv.h>
+
 #include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_heci_gsc.h"
@@ -435,12 +437,18 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int idx;
+
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
 		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
 		return;
 	}
 
+	/* Synchronize with unbind, do not enter runtime survivability mode during unbind */
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return;
+
 	populate_survivability_info(xe);
 	create_survivability_sysfs(pdev);
 
@@ -452,6 +460,8 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
 	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
 		xe->info.platform_name);
+
+	drm_dev_exit(idx);
 }
 
 /**
-- 
2.47.1

