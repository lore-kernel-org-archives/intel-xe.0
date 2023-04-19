Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAC6C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFF310EA39;
	Wed, 19 Apr 2023 17:55:10 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6596B10E1D2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681926904; x=1713462904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wqWVI27lyDETghQL9wp30fxJQwTVMnpxUJlixvyHgvI=;
 b=QSXzwhbGIMa/Lax86FMKmTx2/EPm5uMvcEVwFrxNUezztoyk4iTfdYpW
 ecdvrFO2Lb60vYhNhe+mbRlMpyH0TrXUWb+X2z9MRM7wXyHWiKjB/C5/m
 f50N4quSUyToAH6UWWuXsejouDZBAP/T7cYRmz3c8S9e0Xw1e6aiZYrSg
 xrvtkUxX027SaEt3fX7TJc01Qm0CZbwhY7dBqmlORBcwosXhf/L/pGOF8
 89R5Q5/ySBsbiXiBFv4iC149NiNiDJID95Ue6f45uGl+QdC3bXd2LnDsD
 +HBV18pOh4IpwcuunbxY5Bs5TFgGnhNBFydzrZcI1gFjjjxXmwW7No7Ha A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408429379"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408429379"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722022440"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="722022440"
Received: from dut125tglh.fm.intel.com ([10.105.23.23])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 10:55:02 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Wed, 19 Apr 2023 17:54:58 +0000
Message-Id: <20230419175501.155319-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.38.1.143.g1fc3c0ad40
In-Reply-To: <20230419175501.155319-1-stuart.summers@intel.com>
References: <20230419175501.155319-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Refactor early device init
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split the early device initialization sequence into
an early device_info definition and an integration
with the rest of drm (ttm, etc) a little later. This
Allows the device info to be used early from the
hard coded structures in xe_pci.c.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 19 +++++++++++++------
 drivers/gpu/drm/xe/xe_device.h |  4 ++--
 drivers/gpu/drm/xe/xe_pci.c    |  6 +++++-
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a79f934e3d2d..867051d74eea 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -162,8 +162,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
-struct xe_device *xe_device_create(struct pci_dev *pdev,
-				   const struct pci_device_id *ent)
+struct xe_device *xe_device_create(struct pci_dev *pdev)
 {
 	struct xe_device *xe;
 	int err;
@@ -180,14 +179,22 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (IS_ERR(xe))
 		return xe;
 
+	xe->info.devid = pdev->device;
+	xe->info.revid = pdev->revision;
+
+	return xe;
+}
+
+int xe_device_init(struct xe_device *xe)
+{
+	int err;
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
 	if (WARN_ON(err))
 		goto err_put;
 
-	xe->info.devid = pdev->device;
-	xe->info.revid = pdev->revision;
 	xe->info.enable_guc = enable_guc;
 	xe->info.enable_display = enable_display;
 
@@ -216,12 +223,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err_put;
 
-	return xe;
+	return 0;
 
 err_put:
 	drm_dev_put(&xe->drm);
 
-	return ERR_PTR(err);
+	return err;
 }
 
 static void xe_device_sanitize(struct drm_device *drm, void *arg)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d277f8985f7b..c9ad7d20dc22 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -31,8 +31,8 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
-struct xe_device *xe_device_create(struct pci_dev *pdev,
-				   const struct pci_device_id *ent);
+struct xe_device *xe_device_create(struct pci_dev *pdev);
+int xe_device_init(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91fed9d3105e..c968c9a19de3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -402,7 +402,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
-	xe = xe_device_create(pdev, ent);
+	xe = xe_device_create(pdev);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
@@ -452,6 +452,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	xe_display_info_init(xe);
 
+	err = xe_device_init(xe);
+	if (err)
+		return err;
+
 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
 		desc->platform_name, spd ? spd->name : "",
 		xe->info.devid, xe->info.revid,
-- 
2.38.1.143.g1fc3c0ad40

