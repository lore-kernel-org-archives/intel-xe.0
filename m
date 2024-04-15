Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D78C04FF8
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DEF11265C;
	Mon, 15 Apr 2024 15:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoCGvAP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEEB112660
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713193605; x=1744729605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5BRzeTxoGqIS2h+lRQuzwuhfnPtP1s266wl8WGgB7pc=;
 b=QoCGvAP4CvK2QD8l1stXlSvBYQHJIr/acFgVt2vraWc7Zm/rYyRMdB1B
 g9cKqMfLNvh48Nfl5UKpiGdEr0ZZLjqQc5SosUatHjO/ZlZerHzhyUHkt
 33wxY9UsvIzJPKwu6YWV4d237bOXCm/ljOkuigVlkfyu0Bi6WH02al8jd
 eq1G5/l7oenn3AOJ84SMEZrNFJTJ5IHKbJBPXaNTeCSA0GJ7CiYG+xLaY
 csQLBTsGHf28dT48B3fCVQ2jt96ZNF3MVD5SWjnTce6zI3GoDR07jEk73
 Fb24GrryWcjayLSqeWFgX4GVHVP0yLugP7qBndY+PJo6XXONvSYCXZsB6 A==;
X-CSE-ConnectionGUID: OfQw8TPfSjOTDqXFYPZ/6g==
X-CSE-MsgGUID: lSqUtyMFRoepymqLIWYJkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20013314"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="20013314"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:44 -0700
X-CSE-ConnectionGUID: fh6WvOINT0ey4e2TrI3tIA==
X-CSE-MsgGUID: ycGpehSHS56TgsFQv6YjbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22414859"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:44 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 4/7] drm/xe: Move vm bind bo validation to a helper function
Date: Mon, 15 Apr 2024 16:52:11 +0200
Message-ID: <20240415145214.25641-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Move vm bind bo validation to a helper function to make the
xe_vm_bind_ioctl() more readable.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 77 +++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b1dcaa35b6cc..8380f1d23074 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2872,6 +2872,46 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	return err;
 }
 
+static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
+					u64 addr, u64 range, u64 obj_offset,
+					u16 pat_index)
+{
+	u16 coh_mode;
+
+	if (XE_IOCTL_DBG(xe, range > bo->size) ||
+	    XE_IOCTL_DBG(xe, obj_offset >
+			 bo->size - range)) {
+		return -EINVAL;
+	}
+
+	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
+		if (XE_IOCTL_DBG(xe, obj_offset &
+				 XE_64K_PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
+			return  -EINVAL;
+		}
+	}
+
+	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+	if (bo->cpu_caching) {
+		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
+				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
+			return  -EINVAL;
+		}
+	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
+		/*
+		 * Imported dma-buf from a different device should
+		 * require 1way or 2way coherency since we don't know
+		 * how it was mapped on the CPU. Just assume is it
+		 * potentially cached on CPU side.
+		 */
+		return  -EINVAL;
+	}
+
+	return 0;
+}
+
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -2955,7 +2995,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 obj = bind_ops[i].obj;
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u16 pat_index = bind_ops[i].pat_index;
-		u16 coh_mode;
 
 		if (!obj)
 			continue;
@@ -2967,40 +3006,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 		bos[i] = gem_to_xe_bo(gem_obj);
 
-		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
-		    XE_IOCTL_DBG(xe, obj_offset >
-				 bos[i]->size - range)) {
-			err = -EINVAL;
-			goto put_obj;
-		}
-
-		if (bos[i]->flags & XE_BO_FLAG_INTERNAL_64K) {
-			if (XE_IOCTL_DBG(xe, obj_offset &
-					 XE_64K_PAGE_MASK) ||
-			    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
-			    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
-				err = -EINVAL;
-				goto put_obj;
-			}
-		}
-
-		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
-		if (bos[i]->cpu_caching) {
-			if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
-					 bos[i]->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
-				err = -EINVAL;
-				goto put_obj;
-			}
-		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
-			/*
-			 * Imported dma-buf from a different device should
-			 * require 1way or 2way coherency since we don't know
-			 * how it was mapped on the CPU. Just assume is it
-			 * potentially cached on CPU side.
-			 */
-			err = -EINVAL;
+		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
+						   obj_offset, pat_index);
+		if (err)
 			goto put_obj;
-		}
 	}
 
 	if (args->num_syncs) {
-- 
2.42.0

