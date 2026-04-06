Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C55F46C44
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427FB10E24D;
	Mon,  6 Apr 2026 14:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9o8BpCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C170510E24D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775484721; x=1807020721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XpmPSLkoEllkqm+6wTSVu2sVPiLApV67vzNYfrsfRvQ=;
 b=I9o8BpCi6JLwLUHNOifmnZpzF8mepm9OkO8f0KB9e4vzWtW6s8T3SJYN
 r8NuCDMi4YZKgurnhjZk4EhRBvwVpbXV9iOX8KwKtgT9ukP/Lddcb+Bla
 3SWOOco6qNH+Ignmh8+zc6wsjVcowVQK2UbI/12MKnLwCkqMIWeBPJAui
 fz+4+2TBe15NdJmSk9ZU3IG4lefmgSet8DZq19RlnBmdLgqW4Nhix9JCe
 lYV8E9P35yVOR4j+UGD5OHQLBUc9eLEDuqNfM5UZo9EwvqsC2kJPzFsGW
 688MlVfTKsb08de5TYbRNfEoTQtTlzm1SyaA/KKDK+/8b8giSF3U/5oDs w==;
X-CSE-ConnectionGUID: xfyV1v4VSomOsZgz2rHsxg==
X-CSE-MsgGUID: tO50YKd9QPGnI/Z+J1i8uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76443887"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76443887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:12:01 -0700
X-CSE-ConnectionGUID: eCYkhTLoQqC5S9UmtcSWzg==
X-CSE-MsgGUID: oP/o/2/xS+iw4qhgt3Jm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227788260"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 07:11:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 5/9] drm/xe: Introduce xe_device_assert_lmem_ready()
Date: Mon,  6 Apr 2026 19:37:18 +0530
Message-ID: <20260406140722.154445-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406140722.154445-1-raag.jadav@intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
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
index cbce1d0ffe48..5efa10e67543 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -649,7 +649,13 @@ static int xe_set_dma_info(struct xe_device *xe)
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
@@ -737,7 +743,7 @@ int xe_device_probe_early(struct xe_device *xe)
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

