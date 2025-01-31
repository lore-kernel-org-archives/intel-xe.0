Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B069C02194
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C17810E265;
	Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWk3xykq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7938510E226
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362718; x=1769898718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eBPiai/R0KqH6OyJp0PxVabUPF6B2kIWDSLBmrYqQcM=;
 b=ZWk3xykqB5laRqpfovS+l583B59qnOkYyEg+yUn2uR5OhYY2DokbVk41
 dELUcI0feGjbTFbzu1yM7IhSOjARpJpW6DnLNOkRNoNecmarGYXYY0klh
 KgTgWmNHElHC2kU2A3AOK2nL0i/rZ1mKY0FbowQHnhWsT5Ay8qFP16m5s
 tz8g3goMY/rzfU6LvU+LYb9XiKZ/YOMaif/hzcslaMRdHnf87XvwA4NBc
 Br3XguBFF89tWKvV93GH8jmi6jCdOmkPihP0mAeXJAofvk2ZQwGnv/6SQ
 fawaEmItLMS29FzOMM+GLHqfYx5zritDvChCr1xg/CSE6PqOfHhNM4Wvq A==;
X-CSE-ConnectionGUID: MxEzX0W5QY+XtPCZYj2UkA==
X-CSE-MsgGUID: MDeKzlfyRwWsCoW03Yf8DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149066"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149066"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
X-CSE-ConnectionGUID: xsNaAktLQAWejBQvYwn5ng==
X-CSE-MsgGUID: F58Wxn2LT4mJm+byhSthMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622319"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/7] drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
Date: Fri, 31 Jan 2025 14:31:37 -0800
Message-ID: <20250131223140.4144292-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Make sure to differentiate normal behavior, e.g. there's no stolen, from
allocation errors or failure to initialize lower layers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c         |  4 +++-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 17 +++++++++--------
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2e874906d4f31..e519f435b1606 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -826,7 +826,9 @@ int xe_device_probe(struct xe_device *xe)
 	}
 
 	/* Allocate and map stolen after potential VRAM resize */
-	xe_ttm_stolen_mgr_init(xe);
+	err = xe_ttm_stolen_mgr_init(xe);
+	if (err)
+		return err;
 
 	/*
 	 * Now that GT is initialized (TTM in particular),
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 423856cc18d40..e1a1200fdf22d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -201,17 +201,16 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 #endif
 }
 
-void xe_ttm_stolen_mgr_init(struct xe_device *xe)
+int xe_ttm_stolen_mgr_init(struct xe_device *xe)
 {
-	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_ttm_stolen_mgr *mgr;
 	u64 stolen_size, io_size;
 	int err;
 
-	if (!mgr) {
-		drm_dbg_kms(&xe->drm, "Stolen mgr init failed\n");
-		return;
-	}
+	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
+		return -ENOMEM;
 
 	if (IS_SRIOV_VF(xe))
 		stolen_size = 0;
@@ -224,7 +223,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
 	if (!stolen_size) {
 		drm_dbg_kms(&xe->drm, "No stolen memory support\n");
-		return;
+		return 0;
 	}
 
 	/*
@@ -240,7 +239,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 				     io_size, PAGE_SIZE);
 	if (err) {
 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
-		return;
+		return err;
 	}
 
 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
@@ -248,6 +247,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 
 	if (io_size)
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
+
+	return 0;
 }
 
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 1777245ff8101..8e877d1e839bd 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -12,7 +12,7 @@ struct ttm_resource;
 struct xe_bo;
 struct xe_device;
 
-void xe_ttm_stolen_mgr_init(struct xe_device *xe);
+int xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
 bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
-- 
2.48.0

