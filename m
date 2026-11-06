Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07671606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4mWblwi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD0C10ED60;
	Fri,  6 Nov 2026 07:20:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BFA10EC81
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793949615; x=1825485615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tdJL/yP80LhGIUYSOncyV9CfxRYBv6APJAEtZTCrgec=;
 b=l4mWblwi+uvTZhvtzB3XB55bi3BnVhamp31VKxv3SPy5jOvF6K1tltAx
 FoC8f2LKywDK3fvniNS6a+eEACnY/OS65s0PLE+1MSrD8mtk5pK1qc4Ea
 H56NSma9OwjHo+k3oI75ErSKHW8EAU/MW5eKa1lzuBxD0oBSCioe4RdnU
 vxOCEOjFq5ni568xB/bNUjciMCpwsLmx8VtcLULXfme4t36gYpe+gSUQu
 za6P2ZMvzJEhS0Oe7z7SdEFfaAAcRqCEwsrChIZwDnp311OMvn4PIZg2H
 REv6mBCgXfMaIFGXSUsfQrhdUVHWc1VWYbJ5uKwacDVH9z+4htYlMwAq2 w==;
X-CSE-ConnectionGUID: TU2GF8O+RV6g7rUeXvCs9w==
X-CSE-MsgGUID: VN7LTab7SomDcLTfed20QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659346"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659346"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:15 -0800
X-CSE-ConnectionGUID: Y8XKsuUgQjyS0nLFtbKXPQ==
X-CSE-MsgGUID: ajNv7GK3Q2+OrD4IDiRTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7549019"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:12 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
Date: Fri,  6 Nov 2026 12:49:48 +0530
Message-ID: <20261106071944.2693854-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
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

Runtime surivability mode creates sysfs and declares the device as
wedged in a worker thread. This can race with unbind.

During unbind, devres actions such as disabling the worker run as part of
teardown. A runtime survivability enable that is still in flight or gets
scheduled in that window can create the survivability sysfs entries while
the device is being removed. This is incorrect, as runtime survivability mode 
must not be entered once during devres teardown.

Use the DRM device enter/exit protection so that the enable path
synchronizes with device unplug and returns early if the device is
already being unbound.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index d73cdad0b3a9..e8d618b47322 100644
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

