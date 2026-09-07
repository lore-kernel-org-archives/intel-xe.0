Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3250C79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690E710E462;
	Mon,  7 Sep 2026 08:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn6IdwmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE54E10E6E7
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770181; x=1820306181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EchQ2DfqtqHyxXhk4QEOPpxbYYxAraMBzaOBp2SSBPE=;
 b=Nn6IdwmFPkZoyHzidpBt/2QKLIekiOseVa24owcjH/3wZSjOivRw+77H
 be88nk6BOUNOwFcCuBvK4jG+8fzM8g8wK/8WNwojKm1WD3JlokjwqYRj4
 o7nWpsG9ohmx9ZpjAwAlPQX0ITFn5RMBaRPhSUku9Kko6x1kT/emFkrDj
 lgt6FHGDN7qTHHk7IomzSQKEMuXARlCX74becMIWH44s+0EDAGu2mNtEe
 DqymFgY2HtIh/6o/ttb9jkRhQm9xhZJhF+DV48GoLE0ATVLdhj3Y8kIBZ
 reeB+vfQJqfAQ8q+KvnTY0ittguXTLUDFbcGxkP7AjI2IOTa2MrxVMVwp w==;
X-CSE-ConnectionGUID: JBF8BrPPQ5uK+ep1M7v4xw==
X-CSE-MsgGUID: X4apOewGTQ6VFGQWzBgzZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76725985"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76725985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:21 -0700
X-CSE-ConnectionGUID: cTltbmE9S32z/9vxvwtUdg==
X-CSE-MsgGUID: 6grHJo1oQnaozlMZCFVeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274451053"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 01:36:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 5/5] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
Date: Mon,  7 Sep 2026 14:04:40 +0530
Message-ID: <20260907083541.2194747-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907083541.2194747-1-raag.jadav@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
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

With xe_wedge_fini() now moved to xe_wedge and registered as part of
xe_device_probe_early(), it is safe to move xe_ras_process_errors() back
to xe_ras where it belongs. This essentially reverts commit 20bc4883c7c0
("drm/xe/ras: Fix boot-time ras error processing") which was added to
prevent PM reference leak in case of early wedging in probe sequence.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 7 -------
 drivers/gpu/drm/xe/xe_ras.c    | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 12279ed27629..8b0ea8a48d57 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1148,13 +1148,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
-	/*
-	 * Process and log any errors detected by hardware. Possible results can
-	 * include declaring the device as wedged, which must be done only after
-	 * xe_wedge_fini() is registered.
-	 */
-	xe_ras_process_errors(xe);
-
 	err = devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2e8eb8856f97..abf4800ff1e3 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -933,6 +933,13 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	/*
+	 * During probe, process and log any errors detected by firmware while the driver was not
+	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
+	 * causing the driver to enter survivability mode.
+	 */
+	xe_ras_process_errors(xe);
+
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
-- 
2.43.0

