Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3DFE9B249
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBF310E53A;
	Tue, 24 Feb 2026 10:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KU2Ryksf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D7E10E539
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929030; x=1803465030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ka8z/QSnU8UE+GP2Pj+fy4dCMM3dchAUseE7ewAxyCU=;
 b=KU2Ryksf2f5m1CPXVMmNA5MoF6mDZ26JORI0tN0sgbU+zOREYoiNeu1W
 GRTwtMSxDyIbClCgYpjx2NxzZUIUWajj1K0VfQL7VD+NgplS7xlP+d8xC
 Y+cOeo/vsuA4H13KaR+04CDAYTxc7QAcepGhLuVL1ysrdIz4kTMPdW7Km
 tVLi+BHBWJ83yW/TPPH8aXzGCLGVlXp213OVgMppsvRxeUH89KQJykPLG
 R1XfoFkiXEyUCxF4KhcEuxiUzo5GO8dkjYkyyRjItNqGnoh5r3PF3o/BG
 D1uGIdviaVqUdikMG151tiNuViG06t4TdUFv5VhdlE7UYt0DDSnXF48/G A==;
X-CSE-ConnectionGUID: 1JVjM4/wRoWbofmui33XHA==
X-CSE-MsgGUID: 8dtaU1/xTcOYuf8VxK8urA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046394"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046394"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:30 -0800
X-CSE-ConnectionGUID: TWrjY7/YTfu9lCWju/ZfoA==
X-CSE-MsgGUID: AmwLOaTkSmOhrv5bJyIP4w==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 02:30:27 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 5/6] drm/xe/bo_evict: Introduce xe_bo_restore_map()
Date: Tue, 24 Feb 2026 15:55:18 +0530
Message-ID: <20260224102618.3105171-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
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

In preparation of usecases which require remapping kernel bos after FLR,
introduce xe_bo_restore_map() helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 34 ++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo_evict.h |  2 ++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..0624c3039cd7 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -189,14 +189,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 				     xe_bo_evict_pinned);
 }
 
-static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
+static int xe_bo_map_ggtt(struct xe_bo *bo)
 {
-	int ret;
-
-	ret = xe_bo_restore_pinned(bo);
-	if (ret)
-		return ret;
-
 	if (bo->flags & XE_BO_FLAG_GGTT) {
 		struct xe_tile *tile;
 		u8 id;
@@ -212,6 +206,30 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 	return 0;
 }
 
+int xe_bo_restore_map(struct xe_device *xe)
+{
+	int ret;
+
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
+				    &xe->pinned.early.kernel_bo_present, xe_bo_map_ggtt);
+	if (!ret)
+		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+					    &xe->pinned.late.kernel_bo_present, xe_bo_map_ggtt);
+
+	return ret;
+}
+
+static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
+{
+	int ret;
+
+	ret = xe_bo_restore_pinned(bo);
+	if (ret)
+		return ret;
+
+	return xe_bo_map_ggtt(bo);
+}
+
 /**
  * xe_bo_restore_early - restore early phase kernel BOs to VRAM
  *
@@ -270,7 +288,7 @@ int xe_bo_restore_late(struct xe_device *xe)
 	return ret;
 }
 
-static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
+void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
 {
 	struct xe_tile *tile;
 	unsigned int id;
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index e8385cb7f5e9..d4f5b87243e7 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -14,7 +14,9 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe);
 void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
 int xe_bo_restore_early(struct xe_device *xe);
 int xe_bo_restore_late(struct xe_device *xe);
+int xe_bo_restore_map(struct xe_device *xe);
 
+void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
 
 int xe_bo_pinned_init(struct xe_device *xe);
-- 
2.43.0

