Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB34FC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814A910E516;
	Wed, 10 May 2023 19:54:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBC710E513
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683748488; x=1715284488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HrlmtEd8wujB7Lz7B1Y8lQGsxEo3PPpSZvzy8p/Z1Q=;
 b=TrQDc36T/ufoBWsVTE7DgKkFxXp/MKvOZEG+m3QqkZronbh8Ea20g88n
 68s5NaloXwEVFSXNqtkaI0upyKSYHZQ5uVf7/Qg2l6a7X1AMyc+EdKgMi
 AaFzYKj9a+WzuksvESK1Hpg4i7YNowASzM4YaB9rBjtb66GlJNwEO+Atc
 hfc21D8m+jDk7GtCHJrdlYt4/Z7YktxPNzajE5fuaJugVF/rK0nzGdoCZ
 Yl4aSK7GwqsohhGw4QkJNK4gPtm/V0hDRqYzLlOZ/Ttqe3aUhotktgmD1
 TiHQEn6f13MsWzY8/TTmAXKCwZwY7iLUBmmGSbqnMBB0Z+8sO/codclfw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350336276"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="350336276"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730056891"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="730056891"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 12:54:23 -0700
Message-Id: <20230510195424.3045127-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510195424.3045127-1-lucas.demarchi@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Stop the dance of enabling the display-related driver_features to later
disable them on display info init if the platform doesn't have display
IP. Besides being needless work, it wasn't covering the ATS-M case that
is the same platform as DG2, but without display.

Since now the display is created after the complete device info is
populated, the new has_display flag can be consider to enable it.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/265
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  | 1 -
 drivers/gpu/drm/xe/xe_display.c | 6 ++++--
 drivers/gpu/drm/xe/xe_pci.c     | 6 +++++-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 32cc83c43b2a..1daacc533083 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -192,7 +192,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.enable_guc = enable_guc;
-	xe->info.enable_display = enable_display;
 
 	spin_lock_init(&xe->irq.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 77a158ecf4cb..43c5af1ff80e 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -487,8 +487,10 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 void xe_display_info_init(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.enable_display) {
+		unset_driver_hooks(xe);
 		return;
+	}
 
 	switch (xe->info.platform) {
 	case XE_TIGERLAKE:
@@ -535,7 +537,7 @@ void xe_display_info_init(struct xe_device *xe)
 		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
 		break;
 	default:
-		drm_dbg(&xe->drm, "No display IP, skipping\n");
+		drm_warn(&xe->drm, "Unknown display IP\n");
 		xe->info.enable_display = false;
 		unset_driver_hooks(xe);
 		return;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7dfbc4fa138a..3fa3e8706d98 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -529,6 +529,9 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
 
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_DISPLAY) && \
+				  enable_display && \
+				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -629,7 +632,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	xe_display_info_init(xe);
 
-	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
+	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d",
 		desc->platform_name,
 		subplatform_desc ? subplatform_desc->name : "",
 		xe->info.devid, xe->info.revid,
@@ -640,6 +643,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe->info.media_name,
 		xe->info.media_verx100 / 100,
 		xe->info.media_verx100 % 100,
+		str_yes_no(xe->info.enable_display),
 		xe->info.dma_mask_size, xe->info.tile_count);
 
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
-- 
2.40.1

