Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE38CD8C80
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A49F11A670;
	Fri,  5 Jun 2026 09:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gB3IusLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426A11A670
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652152; x=1812188152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mDmf1zDBaSLQKdUtwNaZHubuaiCOUfx6y9XeN3ePIIQ=;
 b=gB3IusLAWo2ImeYli51edTqAww450z3Fcqo1FHX3KYzV1qK0AoM3bnaB
 /FAvOZUa5ucUDdGyDBH5URw+39dN2GSrVkKJoj2cQ0rWmluUmZNbCf7mK
 dHORJ3aoCZ8IZFulFB0zwm3BWcPMXBKPV5lnGAzpSY4rGx2pLGmeQJDQx
 dI4GJm3TeLO2GwOty2G7sDUwW76q4/xGwWKOri4sBGhqbQgyAL2gZuxVP
 YumYGnc7t5m+NIgqcHOtc5meX27p0m1pGAkg+4OEiOBndLveSQSseVdMa
 NR139kuCHX+W9umBy//DD4KDdU2s45dn6Sr1sv2icyQYcwvJS6y9Tg8KQ Q==;
X-CSE-ConnectionGUID: Ypz7FIDKTMCNJPGfEtj2Cg==
X-CSE-MsgGUID: DRm2JScMS5iflBYoZ5P31A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98904010"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98904010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:52 -0700
X-CSE-ConnectionGUID: kaEzoz75ROqMSBJj8z/gig==
X-CSE-MsgGUID: PRq133enRZmt6jhlL7pdZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133708"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v7 12/15] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Fri,  5 Jun 2026 15:04:58 +0530
Message-ID: <20260605093446.4189929-29-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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

Query system controller when any non fatal error occurs to check
the type of the error, contain and recover.

The system controller is queried in the mmio_enabled callback.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: use ras recovery enum (Raag)

v3: add comment for mapping
    use const (Mallesh)

v4: use switch (Raag, Anshuman)

v5: call pci_prepare_reset() before requesting SBR

v6: rebase
---
 drivers/gpu/drm/xe/xe_pci_error.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index ab17418aa164..b08601f470d6 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,6 +9,7 @@
 #include "xe_gt.h"
 #include "xe_pci.h"
 #include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 
 static void prepare_device_for_reset(struct pci_dev *pdev)
@@ -28,6 +29,21 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u32 action)
+{
+	switch (action) {
+	case XE_RAS_RECOVERY_ACTION_RECOVERED:
+		return PCI_ERS_RESULT_RECOVERED;
+	case XE_RAS_RECOVERY_ACTION_RESET:
+		prepare_device_for_reset(pdev);
+		return PCI_ERS_RESULT_NEED_RESET;
+	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
+		return PCI_ERS_RESULT_DISCONNECT;
+	default:
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+}
+
 static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -56,11 +72,13 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	enum xe_ras_recovery_action action;
 
 	xe_err(xe, "PCI error: MMIO enabled\n");
 
-	/* TODO: Query system controller for the type of error and take appropriate action */
-	return PCI_ERS_RESULT_RECOVERED;
+	action = xe_ras_process_errors(xe);
+
+	return ras_action_to_pci_result(pdev, action);
 }
 
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
-- 
2.47.1

