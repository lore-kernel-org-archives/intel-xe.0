Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB396C3601B
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD19D10E990;
	Thu,  3 Apr 2025 10:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVYtT/Cd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B350D10E990
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743674658; x=1775210658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6e8aV8576AzopTuEzJWDFaTosdiEOMVFbiE6O02n3s=;
 b=aVYtT/Cddajo8e0/TC6E82Lm4Gu3n3Kj7aWadzCJIoxT9MTRehW+llxX
 MyF2xi5XJ6SCxAQnGU7tScPXw5v6iNh5lV8V0iGhrvWOLKqJdCWZSex/z
 3L0XZlkl0lz3bwXokvI9VRXdGBsTCPX3HSZ7772PJNR4mJewY3r/HizZH
 4auFwHwxbwu18FtV0JRe0AuWnOVe92dYiOah3NRgdLsd2BO2zNGaaCCNc
 jkYLnsUtMDRsDfzsOgHsSyTfir3Y82M34Jil+1BwslGiF/bf1poSSjq7A
 pcI099lCVMPp0GT2agGItqQJfjZpT+k/jpvHVR3w2ib2jvFc6lQsDs3rK A==;
X-CSE-ConnectionGUID: nB266da8RyyfD+gkUBdrww==
X-CSE-MsgGUID: HlOnZ8NNRD2odCaxfG5H2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44224420"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44224420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:04:18 -0700
X-CSE-ConnectionGUID: DGP8RemdTUWDREqJE1zRgw==
X-CSE-MsgGUID: zcpSVvlrT6O+I7Ud68AYsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127470129"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:04:15 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH v3 2/3] drm/xe: add documentation for survivability mode
Date: Thu,  3 Apr 2025 15:55:52 +0530
Message-ID: <20250403102555.1265786-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403102555.1265786-1-riana.tauro@intel.com>
References: <20250403102555.1265786-1-riana.tauro@intel.com>
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

Add survivability mode document to pcode document

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/xe/xe_pcode.rst          |  7 +++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 36 +++++++++++++++-------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/xe/xe_pcode.rst b/Documentation/gpu/xe/xe_pcode.rst
index d2e22cc45061..5937ef3599b0 100644
--- a/Documentation/gpu/xe/xe_pcode.rst
+++ b/Documentation/gpu/xe/xe_pcode.rst
@@ -12,3 +12,10 @@ Internal API
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_pcode.c
    :internal:
+
+==================
+Boot Survivability
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_survivability_mode.c
+   :doc: Xe Boot Survivability
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index cb813b337fd3..3d59753eae34 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -28,20 +28,34 @@
  * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
  * to be flashed through mei and collect telemetry. The driver's probe flow is modified
  * such that it enters survivability mode when pcode initialization is incomplete and boot status
- * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
- * survivability mode and provides additional information required for debug
+ * denotes a failure.
  *
- * KMD exposes below admin-only readable sysfs in survivability mode
+ * Survivability mode can also be entered manually using the survivability mode attribute available
+ * through configfs which is beneficial in several usecases. It can be used to address scenarios
+ * where pcode does not detect failure or for validation purposes. It can also be used in
+ * In-Field-Repair (IFR) to repair a single card without impacting the other cards in a node.
  *
- * device/survivability_mode: The presence of this file indicates that the card is in survivability
- *			      mode. Also, provides additional information on why the driver entered
- *			      survivability mode.
+ * Use below command enable survivability mode manually
+ * ::
  *
- *			      Capability Information - Provides boot status
- *			      Postcode Information   - Provides information about the failure
- *			      Overflow Information   - Provides history of previous failures
- *			      Auxiliary Information  - Certain failures may have information in
- *						       addition to postcode information
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
+ *
+ * Refer :ref:`xe_configfs` for more details on how to use configfs
+ *
+ * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
+ * debug information
+ * ::
+ *
+ *	/sys/bus/pci/<device>/surivability_mode
+ *
+ * Capability Information:
+ *	Provides boot status
+ * Postcode Information:
+ *	Provides information about the failure
+ * Overflow Information
+ *	Provides history of previous failures
+ * Auxiliary Information
+ *	Certain failures may have information in addition to postcode information
  */
 
 static u32 aux_history_offset(u32 reg_value)
-- 
2.47.1

