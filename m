Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0142CFEFB6A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D8B10EBD4;
	Fri, 27 Feb 2026 17:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZQLbTY0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833B810EBD8
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211808; x=1803747808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SgT4HN0d/8+urBujdv0YIOZxFcoFrISGp1BtY86/GT4=;
 b=TZQLbTY001BHlNcvCsJr0Mqlz4jyFbvKSp3Ok6WQ87AixUb3L0MBr8ST
 gAXxxAzHRfxkzYL37qzv7d81c3wdS9q8yqshEoiWrwI9FS2tRRbmpdAbp
 aQA1Gf8pw9oP0tXRAsrRljUqRT0iioOjmh96WGxqQIvEtyQh/0+9g1GA0
 WAvfb7002EX6V3LvA3COeTlyvKuyMC3f4k/P+Rs0gAZVkqYaJBFzrFpCg
 7pA5kIfIn2azO6LherbCgwtkf0ft81jUsjEeElFOP9WjSlVE4+eNWtEar
 mfj3sZS9eWADFZ5nGFzLLzY4xAQAsev4qtOdaZehR6rN4iStgH9AXZqbz w==;
X-CSE-ConnectionGUID: aiwZ/rJZR1iC1UthIC3Jfg==
X-CSE-MsgGUID: PzjBNqnsTriicUY5VzeQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73169909"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73169909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:03:28 -0800
X-CSE-ConnectionGUID: inX6RVAIT5qQih0YILLgOg==
X-CSE-MsgGUID: Ogtad5DsRzKu5CYCfXmhyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216964736"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 09:03:24 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 4/9] drm/xe: Introduce xe_device_assert_lmem_ready()
Date: Fri, 27 Feb 2026 22:30:44 +0530
Message-ID: <20260227170049.3418863-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227170049.3418863-1-raag.jadav@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
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
index eee183732950..ce79b7cdafeb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -650,7 +650,13 @@ static int xe_set_dma_info(struct xe_device *xe)
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
@@ -738,7 +744,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	 * is flagged after full initialization is complete. Assert if lmem is
 	 * not initialized.
 	 */
-	assert_lmem_ready(xe);
+	xe_device_assert_lmem_ready(xe);
 
 	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
 			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 39464650533b..44db00d0ad55 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -140,6 +140,7 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->pm.fw;
 }
 
+void xe_device_assert_lmem_ready(struct xe_device *xe);
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
-- 
2.43.0

