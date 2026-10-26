Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65201606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fpe+pymi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A22110EA8B;
	Mon, 26 Oct 2026 06:05:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4A510EA8B
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994728; x=1824530728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mvvd+31Zx50DE03S1hNdlUyTSUZKXcE/e5ukO5pWMDw=;
 b=Fpe+pymikT1minmaJwqhM8tryzoCzpAMKwL90kBQbZX3fzipl7NAMf+T
 989yDyHyyXMVcwlISmlXKj5s5E9xf4gV2rGeUBxp+7nVfUqBTAaHhTeGW
 lkWMczIZ2T4F6T6swimP8YJfSw2tjTTZ6Nkp6eQMGiiqmfAQIMY994lg5
 8cttQ3IBgEC/GErmqWBDh6iJoFpm+JtK09HqVqoeRYoShz2sAlAWk7mr2
 HGhz6PI9tG5TsMQwyTRfqITGer3TmUFscE7yWhU7EOxBgmMKlVY8PHBt8
 q+GudPXN6htfnO2KtJ9i13R6P3GnEwyrQCCZ1utPz487LuDmY6qHR446k Q==;
X-CSE-ConnectionGUID: 7A2xTj6PQ1+Fm3FpTuRmcg==
X-CSE-MsgGUID: zqmSv1t+TiKq6iSlMYh3jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531025"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:28 -0700
X-CSE-ConnectionGUID: mnQ1u4RJTXKCMF6kCwByog==
X-CSE-MsgGUID: eRugv7B/TOCUnlnV0vjBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557327"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:25 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed via
 direct IRQ
Date: Mon, 26 Oct 2026 11:35:03 +0530
Message-ID: <20261026060459.771448-15-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Process, log and recover non-fatal errors routed via direct IRQ.
Double-bit ecc errors belong to non-fatal error category and are reported
via irq. For pages that belong to critical BO, wedge the device with
bus-reset as the recovery action.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ras.c      |  9 +++++++-
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index f7799c3c08aa..269ce6a19a80 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -5,6 +5,8 @@
 
 #include <linux/bitmap.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -15,7 +17,9 @@
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wa.h"
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
 #define HEC_UNCORR_FW_ERR_BITS			4
@@ -166,12 +170,36 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
 						 pvc_master_local_fatal_err_reg : \
 						 pvc_master_local_nonfatal_err_reg)
 
+static const char *hw_err_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return "Correctable";
+	case HARDWARE_ERROR_NONFATAL:
+		return "Non-Fatal";
+	case HARDWARE_ERROR_FATAL:
+		return "Fatal";
+	default:
+		return "Unknown";
+	}
+}
+
 static void hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work.work);
 	struct xe_device *xe = tile_to_xe(tile);
 
 	guard(xe_pm_runtime)(xe);
+
+	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
+		/* If the device is in reset in AER path, skip processing hardware errors */
+		if (xe_device_is_in_reset(xe))
+			return;
+
+		xe_ras_process_errors(xe);
+		return;
+	}
+
 	xe_survivability_mode_runtime_enable(xe);
 }
 
@@ -433,12 +461,13 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		return;
 
 	/*
-	 * Hardware errors are reported through System Controller on the platforms that
-	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
-	 * here for those platforms.
+	 * Non fatal errors are routed as a direct IRQ on platforms that support
+	 * system controller.
 	 */
 	if (xe->info.has_sysctrl) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
+		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n", hw_err_to_str(hw_err),
+				    severity_str);
+		schedule_delayed_work(&tile->hw_error_work, msecs_to_jiffies(MSEC_PER_SEC));
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index db3cbc186a51..e6a0ee468b17 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -628,8 +628,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
 		ret = handle_page_offline(xe, info->sw_address, true);
-		if (ret)
+		/*
+		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
+		 * Wedge the device with a bus reset for errors that require SBR to recover.
+		 * TODO: Trigger SBR using pci_reset_bus
+		 */
+		if (ret) {
+			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
 			return XE_RAS_RECOVERY_ACTION_RESET;
+		}
 		break;
 	default:
 		return XE_RAS_RECOVERY_ACTION_RESET;
-- 
2.47.1

