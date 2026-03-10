Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD4CFCC9A4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 00:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C40A10E607;
	Tue, 10 Mar 2026 00:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb4kFzMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE17210E5FA
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 00:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773103380; x=1804639380;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7tU7/oz3OeDRjjQ7yPtWicv+YW37HL/wyxDURMf47uE=;
 b=Yb4kFzMz3XmCpuV6kzG4nfmSJbTJ1E0Jo03oTJQAwci5X8bqFu76EF0l
 tZ33MAt0tsYWKj6i/54/NIGKij/OkSeylRk8pXkJqfWgZSYdutLjcz8PD
 Q5xTcv1mm8t1qNmFfwrSdevGpPTnpSAYvBAEAbqHY23ot0hKyE1HbbgPg
 u+8vbmDUAYNq8ip3jX/+xLxNA2NjFQhocwfvEiFPPzFachAwymsOuKyZr
 1RNIXkKdP3bWNziiu+t6B5NRs2hgRqfDTdMD9R3ulw1t4dd/s3yZ/qhvQ
 2stANgDLSvzOjGBjQ1dlABlKeglG5uzt+GHdKCP3ofiqW77STk93UUiac A==;
X-CSE-ConnectionGUID: Qa/fkYK+T62gd1LgjVj86A==
X-CSE-MsgGUID: vmSjrmWHQXm1x71QTXeArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74183486"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74183486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:00 -0700
X-CSE-ConnectionGUID: FQBdR2ywTdGcp/43I+5H9w==
X-CSE-MsgGUID: 88xDrNX0RhqOMRnLk4iRdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219063539"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:42:59 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 21:42:08 -0300
Subject: [PATCH v5 3/7] drm/xe/nvlp: Read platform-level stepping info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v5-3-be9c902ee34e@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

There will be a NVL-P workaround for which we will need to know the
platform-level stepping information in order to decide whether to apply
it or not.

While NVL-P has a nice mapping between the PCI revid and our symbolic
stepping enumeration, not all platforms are like that: (i) Some
platforms will have a single PCI revid used for a set platform level
steppings (ii) and some might even require specific mappings.

To make things simpler, let's include stepping information in the device
info only on demand, for those platforms where it is needed for
workaround checks.

v2:
  - Call xe_step_platform_get() very early, to allow device workarounds
    to use it in early stages of device initialization. (Matt)

Bspec: 74201
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v1
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        |  2 ++
 drivers/gpu/drm/xe/xe_step.c       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_step.h       |  2 ++
 drivers/gpu/drm/xe/xe_step_types.h |  1 +
 4 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 72d4131e9775..189e2a1c29f9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -780,6 +780,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
 	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
+	xe_step_platform_get(xe);
+
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 064b604b5b94..d0f888c31831 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -108,6 +108,28 @@ static const int pvc_basedie_subids[] = {
 
 __diag_pop();
 
+/**
+ * xe_step_platform_get - Determine platform-level stepping from PCI revid
+ * @xe: Xe device
+ *
+ * Convert the PCI revid into a platform-level stepping value and store that
+ * in the device info.
+ */
+void xe_step_platform_get(struct xe_device *xe)
+{
+	/*
+	 * Not all platforms map PCI revid directly into our symbolic stepping
+	 * enumeration. Some platforms will have a single PCI revid used for a
+	 * range platform level steppings and some might even require specific
+	 * mappings. So prefer to err on the side of caution and include only
+	 * the platforms from which we need the stepping info for workaround
+	 * checks.
+	 */
+
+	if (xe->info.platform == XE_NOVALAKE_P)
+		xe->info.step.platform = STEP_A0 + xe->info.revid;
+}
+
 /**
  * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
  * @xe: Xe device
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 6febb7fac476..41f1c95c46e5 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -12,6 +12,8 @@
 
 struct xe_device;
 
+void xe_step_platform_get(struct xe_device *xe);
+
 void xe_step_pre_gmdid_get(struct xe_device *xe);
 void xe_step_gmdid_get(struct xe_device *xe,
 		       u32 graphics_gmdid_revid,
diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
index d978cc2512f2..43ca73850739 100644
--- a/drivers/gpu/drm/xe/xe_step_types.h
+++ b/drivers/gpu/drm/xe/xe_step_types.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct xe_step_info {
+	u8 platform;
 	u8 graphics;
 	u8 media;
 	u8 basedie;

-- 
2.52.0

