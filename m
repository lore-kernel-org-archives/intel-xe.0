Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D9606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FlTpXQFH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D3B10F361;
	Tue,  3 Nov 2026 06:10:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A610F378
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686205; x=1825222205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5bnTdprw0LeQ5HS+6xrHQBPq+qAVAW35TG2Irhz5NcM=;
 b=FlTpXQFHurtZnLs3azfjjrArZV9CJzLXgyyCIunw1udcj7ZjBJDBRLp3
 kRad10JUXLoYfK7nI+8vdP0E3xEm/mZrmbPyfo8okV6xyksDFQcKYWYaW
 jdMhI8a4gUhyl87acKjPfs8LbRqBYJs2L9ZBmRsin0XJisQwa86bbiHeu
 PdAo/63ROQTTdcsHSdFdAzCvaLsHTrtIP5CvoSCc0v7eVcImav+8Xgjis
 Nd1/99+j1x7dKWtjMaMsny71pT6nBcdrI+BIjpovXj7D8WY+HmmGPzbqr
 /ovQ44AmfVrt9f6UaxyYxUsBxBcJG7ESGoqeYpouBopJ2X0G+9PdarjUi Q==;
X-CSE-ConnectionGUID: lka7I40fSyCJ/sBod4KQ9A==
X-CSE-MsgGUID: qsIDZXAGR8eN+I6fOToDSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276729"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:10:05 -0800
X-CSE-ConnectionGUID: wIxo+RUzSC+YFGbK0kF1XA==
X-CSE-MsgGUID: rQUx3+8LS9u271NKdgLLbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446391"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:10:02 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 6/7] drm/xe: Add support for wa_14028434957
Date: Tue,  3 Nov 2026 11:39:36 +0530
Message-ID: <20261103060929.1586783-15-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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

Add support for wa_14028434957 on platform CRI.

Non-fatal device errors are reported via a direct IRQ, while fatal
device errors are downgraded to non-fatal uncorrectable internal
errors and reported via AER.

Add support to process and log non-fatal errors routed via the direct
IRQ path. Most non-fatal errors require no reset, except double-bit
ECC errors affecting a critical BO, for which the device is wedged
with a bus reset as the recovery action.

For uncorrectable internal errors reported via AER, request a
secondary bus reset to recover. To avoid a race between the two
paths, if non-fatal error processing is in progress when an
uncorrectable internal error occurs, flush and disable the worker
to prevent further processing, since a reset is
imminent.

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: use platform instead of graphics version (Gustavo)
    combine patches (Tejas, Mallesh)
    remove 1sec delayed worker (Andi)
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c          | 31 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pci_error.c         | 12 ++++++++-
 drivers/gpu/drm/xe/xe_ras.c               | 21 +++++++++++++--
 4 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 356b4707dafe..3a8ef8abafc5 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -6,3 +6,4 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+14028434957	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 39ff1e8cc156..2ab49ffdf49f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -5,6 +5,8 @@
 
 #include <linux/bitmap.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -15,7 +17,11 @@
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wa.h"
+#include "xe_wedge.h"
+
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
 #define HEC_UNCORR_FW_ERR_BITS			4
@@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
+	/* Skip hw error processing if device is already wedged */
+	if (xe_wedged(xe))
+		return;
+
 	guard(xe_pm_runtime)(xe);
+
+	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
+		/*
+		 * Skip handling if an uncorrectable internal error is reported as
+		 * reset is imminent
+		 */
+		if (xe_ras_is_aer_internal_error(xe))
+			return;
+
+		xe_ras_process_errors(xe);
+		return;
+	}
+
 	xe_survivability_mode_runtime_enable(xe);
 }
 
@@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		return;
 
 	/*
-	 * Hardware errors are reported through System Controller on the platforms that
-	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
-	 * here for those platforms.
+	 * Non-fatal errors are routed as a direct IRQ on platforms that support
+	 * system controller.
 	 */
 	if (xe->info.has_sysctrl) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
+		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
+		schedule_work(&tile->hw_error_work);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 4ade392b47be..c27fd22e28ac 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -5,14 +5,18 @@
 
 #include <linux/pci.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_hw_error.h"
 #include "xe_log.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wa.h"
 #include "xe_wedge.h"
 
 static void prepare_device_for_reset(struct pci_dev *pdev)
@@ -90,8 +94,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
-	if (is_aer_internal_error(pdev))
+	/*
+	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
+	 * flush and disable the worker to prevent further processing, as a reset is imminent.
+	 */
+	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
 		xe_ras_set_aer_internal_error(xe);
+		xe_hw_error_work_disable(xe);
+	}
 
 	switch (state) {
 	case pci_channel_io_normal:
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 58a0b5fa676d..1809c3c893de 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -5,6 +5,8 @@
 
 #include <linux/bitfield.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
@@ -23,6 +25,7 @@
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wa.h"
 #include "xe_wedge.h"
 
 /* Any non-null entry marks the page as offlined by firmware */
@@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
 			    "Double-bit ECC error detected at sw address 0x%llx\n",
 			    info->sw_address);
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
 		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
@@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 		return XE_RAS_RECOVERY_ACTION_RECOVERED;
 
 	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
-	/* Default action */
+	/* Default action for PCIe bus errors */
 	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
 
+	/*
+	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
+	 * internal error. Set the default action to reset.
+	 */
+	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
+		final_action = XE_RAS_RECOVERY_ACTION_RESET;
+
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
 				  NULL, 0, &response, sizeof(response));
 
-- 
2.47.1

