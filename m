Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2E710F286F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E704B10EDBB;
	Fri, 27 Mar 2026 20:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2xXui5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072CD10EE99
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774644000; x=1806180000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Fx91a8QS6OBQXUYblM6x9QL5OcrZ/9kLSISI0g/J30=;
 b=X2xXui5M0+U4xJhlqKOIk5NOENWkIeXO+C6Q1Ah0xBqzKPOYIcNJr8VV
 e+06gljWOzkW+aHfyCFl/FE/2ZFJaCtldqs6+XpfFH6/gVoKcXem1dWXd
 Z99lK2bGdrkTmB2xPObe1QLiRldPysxfbWbwLJUfu0AV26u3vdcrAwRMV
 BhPmilcRSEpIFDPtIqT49PFivffGHIN4j+3a+ilKhgHU2mXltT0zWX25+
 2DHgdjmyV2RNq+smFiheCEpgo9k0jobIdy+eNwDehpJmpNp604I0lnzxn
 cV0n0alR6p0ue3Y5TWWWfHf+Rx49mu7BqagBxT9vylxMXjSY3AHL10l/W A==;
X-CSE-ConnectionGUID: kYvoQ2LeT9KqgEOe2d1vng==
X-CSE-MsgGUID: jYi76EmnQD+nuSZdJ2ttIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93110343"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="93110343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:39:59 -0700
X-CSE-ConnectionGUID: fE/RjgXwSW2Ta5/8OCrCNA==
X-CSE-MsgGUID: TPex2P09S9SOTOjggZXpxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="218794367"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 13:39:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 5/9] drm/xe: Introduce xe_device_assert_lmem_ready()
Date: Sat, 28 Mar 2026 02:06:16 +0530
Message-ID: <20260327203620.809353-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327203620.809353-1-raag.jadav@intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
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

In preparation of usecases which require verifying LMEM readiness after
PCIe FLR, introduce xe_device_assert_lmem_ready() helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add kernel doc (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_device.c | 10 ++++++++--
 drivers/gpu/drm/xe/xe_device.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9b0540e3e289..7e58b01dfb9b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -648,7 +648,13 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static void assert_lmem_ready(struct xe_device *xe)
+/**
+ * xe_device_assert_lmem_ready() - Verify LMEM readiness
+ * @xe: xe device instance
+ *
+ * Verify LMEM readiness and assert on failure.
+ */
+void xe_device_assert_lmem_ready(struct xe_device *xe)
 {
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
@@ -736,7 +742,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	 * is flagged after full initialization is complete. Assert if lmem is
 	 * not initialized.
 	 */
-	assert_lmem_ready(xe);
+	xe_device_assert_lmem_ready(xe);
 
 	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
 			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e4b9de8d8e95..6e9a478c3b7a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -144,6 +144,7 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->pm.fw;
 }
 
+void xe_device_assert_lmem_ready(struct xe_device *xe);
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
-- 
2.43.0

