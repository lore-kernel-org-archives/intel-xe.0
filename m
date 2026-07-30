Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F92EC55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D810EEB6;
	Thu, 30 Jul 2026 11:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loWoljk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07A10EEB6
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409615; x=1816945615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4b8nZzwt2AF0+Qb1fR6DZGb5X1VLWNWb6cNua9Mfues=;
 b=loWoljk4/uTy+Fp90xQIjoiettQu3k+7RxqHreqk02nVux7FIyd8oEUu
 slZZ1vCL/Ko8p3t6Qc/ThBqCceMmv3XFAUslgp9KsjXtXCXMcsbR9jqRU
 YPwSvis+qO4WZcZHdjzdIen4wjjYHUUCu9FCSat2R9LBt7V/FlLH15/T+
 F8FkwFGPES7YQ5Eo2NAQMjEE1uMj8xdL92KxoGAvgtS02dtc78oqwKJt4
 16YEQax+adQZ3uH08YrkAwUSZOq/u7R8DrL1HVIAyUjNjTKhyTFaHG25V
 jRuHZyWTKkjkci/lmWP/EN0kn+GWGpY/14Q4LTBJod1ZRSkP5XOSS85su A==;
X-CSE-ConnectionGUID: FcQYxrbTS+mN7WbOFI7waw==
X-CSE-MsgGUID: yfnXOGBcQmG7lxJTuCjNjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96612360"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="96612360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:06:55 -0700
X-CSE-ConnectionGUID: wR9u9P+DSMaNZATVEs8+dQ==
X-CSE-MsgGUID: LyY+PHDbQpGaoRFvjeSysQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="253944252"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2026 04:06:53 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/ras: Fix boot-time ras error processing
Date: Thu, 30 Jul 2026 16:36:34 +0530
Message-ID: <20260730110635.925537-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently, we xe_ras_process_errors() inside xe_ras_init() to handle boot
time errors. But this can potentially result in declaring the device as
wedged quite early in the driver load sequence, which is problematic due to
the lack of registered drm device or required wedged cleanup hooks at this
point.

Call xe_ras_process_errors() only after the prerequisites are available.

Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 ++++++
 drivers/gpu/drm/xe/xe_ras.c    | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 03e6177a1d4c..47e1638d2ab3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1149,6 +1149,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	/*
+	 * Process and log any errors detected by hardware. Possible results can
+	 * include declaring the device as wedged, which must be done only after
+	 * xe_device_wedged_fini() is registered.
+	 */
+	xe_ras_process_errors(xe);
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 28123f08e513..db8bd19ad28b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -827,12 +827,6 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
-	/*
-	 * During probe, process and log any errors detected by firmware while the driver was not
-	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
-	 * causing the driver to enter survivability mode.
-	 */
-	xe_ras_process_errors(xe);
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
-- 
2.43.0

