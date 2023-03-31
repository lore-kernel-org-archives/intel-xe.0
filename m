Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAE5C761AF
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 10:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297910F1CA;
	Fri, 31 Mar 2023 10:24:26 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D732E10F1CA
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 10:24:24 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 12:24:14 +0200
Message-Id: <20230331102419.521392-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe: Fix meteorlake stolen memory
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

MTL should use bar2 to access stolen memory, not the physical addresses
directly. Correct the GPU address to point to stolen base, and set the
VRAM flag to indicate it's in device memory.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             | 3 ++-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e4d079b61d52..9b2f95f3ce49 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -47,7 +47,8 @@ bool mem_type_is_vram(u32 mem_type)
 
 static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
 {
-	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
+	return res->mem_type == XE_PL_STOLEN &&
+	       (IS_DGFX(xe) || !xe_ttm_stolen_cpu_access_needs_ggtt(xe));
 }
 
 static bool resource_is_vram(struct ttm_resource *res)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 31887fec1073..bd1b73fa84a5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -94,7 +94,8 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
 		return 0;
 
-	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
+	mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
+	mgr->stolen_base = SZ_8M;
 
 	/* return valid GMS value, -EIO if invalid */
 	gms = REG_FIELD_GET(GMS_MASK, ggc);
-- 
2.34.1

