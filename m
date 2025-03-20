Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4213C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E0210E6A2;
	Thu, 20 Mar 2025 21:16:25 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4A10E6C6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:16:22 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/2] drm/xe: Remove extra spaces in xe_vm.c
Date: Thu, 20 Mar 2025 22:15:18 +0100
Message-ID: <20250320211519.632432-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3dbd3d38008a5..fed4b97d1882d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2980,7 +2980,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 				 XE_64K_PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
-			return  -EINVAL;
+			return -EINVAL;
 		}
 	}
 
@@ -2988,7 +2988,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 	if (bo->cpu_caching) {
 		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
-			return  -EINVAL;
+			return -EINVAL;
 		}
 	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
 		/*
@@ -2997,7 +2997,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		 * how it was mapped on the CPU. Just assume is it
 		 * potentially cached on CPU side.
 		 */
-		return  -EINVAL;
+		return -EINVAL;
 	}
 
 	/* If a BO is protected it can only be mapped if the key is still valid */
-- 
2.45.2

