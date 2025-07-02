Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6438C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A188310E71B;
	Wed,  2 Jul 2025 13:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JozgGACt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E8010E712
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751464021; x=1783000021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MSDefot7apAqwV955TYz2uw3WTj0+AGRFPKUeopFpso=;
 b=JozgGACtN68UOkfi3+p9mTZbXWpbpVlzfO02QNQfL0mSnGfCTAMZ2+3D
 tYi5I260tWI0A8a/TH+EsEOSg8CnHEEIbdFFmOtCzLx93Z90xKkPMKEyA
 s3E3plUUxiI9PF0JPq8S9tNPgOy2VjoLxtgdhasOkeQMyxpns5TstEAPJ
 xBvAb92UTr9BW5FVQbDbgu7cDPiYHeNCVNRT/ntzEoeBqXsuD49ENpBb+
 8Z8nnVjh5SLYh9xqATvnIQ5RMKHHkJVX+nKiUvMVmCBRvaBFTHjFFid3t
 4TX0NknEKntT1pUnnycxK5E9qI09DuVYGmG9QaE/NPielOflE2dUAnN6X Q==;
X-CSE-ConnectionGUID: Lw8hpFtzT/23cJfExePHMQ==
X-CSE-MsgGUID: rJEsb+FbQSWzjYL1w7CoCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71186087"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71186087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:47:01 -0700
X-CSE-ConnectionGUID: lxqHQ/ecRh+62lP6HvHkKA==
X-CSE-MsgGUID: zaOUKqa7Rze6s+ixTnWRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177756005"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v3 4/7] drm/xe/doc: Document device wedged and runtime
 survivability
Date: Wed,  2 Jul 2025 19:41:14 +0530
Message-ID: <20250702141118.3564242-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702141118.3564242-1-riana.tauro@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
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

Add documentation for vendor specific device wedged recovery method
and runtime survivability.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/xe/index.rst             |  1 +
 Documentation/gpu/xe/xe_device.rst         | 10 +++++++
 Documentation/gpu/xe/xe_pcode.rst          |  6 +++--
 drivers/gpu/drm/xe/xe_device.c             | 16 +++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 31 +++++++++++++++++-----
 5 files changed, 56 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_device.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 42ba6c263cd0..88b22fad880e 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -25,5 +25,6 @@ DG2, etc is provided to prototype the driver.
    xe_tile
    xe_debugging
    xe_devcoredump
+   xe_device
    xe-drm-usage-stats.rst
    xe_configfs
diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
new file mode 100644
index 000000000000..f9b962169919
--- /dev/null
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+.. _xe-device-wedging:
+
+==================
+Xe Device Wedging
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
+   :doc: Device Wedging
diff --git a/Documentation/gpu/xe/xe_pcode.rst b/Documentation/gpu/xe/xe_pcode.rst
index 5937ef3599b0..2a43601123cb 100644
--- a/Documentation/gpu/xe/xe_pcode.rst
+++ b/Documentation/gpu/xe/xe_pcode.rst
@@ -13,9 +13,11 @@ Internal API
 .. kernel-doc:: drivers/gpu/drm/xe/xe_pcode.c
    :internal:
 
+.. _xe-survivability-mode:
+
 ==================
-Boot Survivability
+Survivability Mode
 ==================
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_survivability_mode.c
-   :doc: Xe Boot Survivability
+   :doc: Survivability Mode
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5defa54ccd26..d6b680abc3ae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1119,6 +1119,22 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 	xe_pm_runtime_put(xe);
 }
 
+/**
+ * DOC: Device Wedging
+ *
+ * Xe driver uses device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
+ *
+ * When device is in wedged state, every IOCTL will be blocked and GT cannot be
+ * used. Certain critical errors like gt reset failure, firmware failures can cause
+ * the device to be wedged. The default recovery mechanism for a wedged state
+ * is re-probe (unbind + bind)
+ *
+ * However, CSC firmware errors require a firmware flash to restore normal device
+ * operation. Since firmware flash is a vendor-specific action ``WEDGED=vendor-specific``
+ * recovery method along with :ref:`runtime survivability mode <xe-survivability-mode>`
+ * is used to notify userspace.
+ */
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index e1adcb33c9b0..0dc8fd77a9f4 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -21,15 +21,18 @@
 #define MAX_SCRATCH_MMIO 8
 
 /**
- * DOC: Xe Boot Survivability
+ * DOC: Survivability Mode
  *
- * Boot Survivability is a software based workflow for recovering a system in a failed boot state
+ * Survivability Mode is a software based workflow for recovering a system in a failed boot state
  * Here system recoverability is concerned with recovering the firmware responsible for boot.
  *
- * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
- * to be flashed through mei and collect telemetry. The driver's probe flow is modified
- * such that it enters survivability mode when pcode initialization is incomplete and boot status
- * denotes a failure.
+ * Boot Survivability
+ * ===================
+ *
+ * Boot Survivability is implemented by loading the driver with bare minimum (no drm card) to allow
+ * the firmware to be flashed through mei and collect telemetry. The driver's probe flow is
+ * modified such that it enters survivability mode when pcode initialization is incomplete and boot
+ * status denotes a failure.
  *
  * Survivability mode can also be entered manually using the survivability mode attribute available
  * through configfs which is beneficial in several usecases. It can be used to address scenarios
@@ -55,6 +58,22 @@
  *	Provides history of previous failures
  * Auxiliary Information
  *	Certain failures may have information in addition to postcode information
+ *
+ * Runtime Survivability
+ * =====================
+ *
+ * Certain runtime firmware errors can cause the device to enter a non-recoverable state
+ * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
+ * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
+ * is indicated by the presence of survivability mode sysfs::
+ *
+ *	/sys/bus/pci/devices/<device>/surivability_mode
+ *
+ * Survivability mode sysfs provides information about the type of survivability mode.
+ *
+ * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
+ * survivability mode. User can then initiate a firmware flash to restore device to normal
+ * operation.
  */
 
 static u32 aux_history_offset(u32 reg_value)
-- 
2.47.1

