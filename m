Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7ADF5513F
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2288D10E09C;
	Sun,  8 Mar 2026 13:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFzOY1wv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D719210E09C
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978306; x=1804514306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swRZlS6hIkRpf2w//hu87TwctGcmCYV6XZA5PEZu128=;
 b=EFzOY1wvz2GJ8YHmlkn8EtM9hEQqAlz594plVg4ZGglNxiDqtuAeu+cM
 X705m5b4SnEiJjSimlPcfgqBEFyHOmOT4YMVpv/TLfv7fTESyJ5TbYOqm
 u+zmdzSi2r23IdDc6neB35eMe1hh/HsnmtooxdRysmwMtxUpcPtaKHO37
 D/XVzkU1ofwLkpUULCGtUPRYzDfgHp55kF9lqXTxKYf/rqSz+JNNh+oJl
 NFi4pzxEPwVk/JQ2WmPtL87fA1kP/Fw4pPbLEqHcZo5LXlfIcRHs1qkOG
 MgIs9NCcZRUvyKUgBAfsB4pbANCXcZtt8a2keISH3ixHjjUTA894fMJ2k w==;
X-CSE-ConnectionGUID: 49aWmy97SoWDh82ZjA3X7g==
X-CSE-MsgGUID: uTtP0DiUTJi8vJe4RC+85g==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934713"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934713"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:26 -0700
X-CSE-ConnectionGUID: rNa7Rj01Quesd+TyFwjUSw==
X-CSE-MsgGUID: 0ocwTNHxQViHrK7xaaCtsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523291"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 06/10] drm/xe: Introduce xe_device_assert_lmem_ready()
Date: Sun,  8 Mar 2026 19:25:32 +0530
Message-ID: <20260308135536.3852304-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308135536.3852304-1-raag.jadav@intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
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
index 31fb1d7afde5..eeb626737760 100644
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

