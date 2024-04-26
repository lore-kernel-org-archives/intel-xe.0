Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166F1C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C8D10F282;
	Fri, 26 Apr 2024 09:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kh/QkFQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB2010F282
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714124141; x=1745660141;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HGRfUaI2mFidMOBWn3N7bksbEWI5ZXfKQCMvu7Dq3qY=;
 b=Kh/QkFQBfzGOZGfuhfe7RbewzX+rKRbmXV1Nn4wUKzq9gZF6+l6G1JjI
 UDXTafIyuniEb2jKIL3aGyGbhr/z4VwX6Nbm6L4DvqXZe1Siklm3qb3At
 RIFyXWh/Lz6sXpNTUwwjAjM5zbkglBRPneLo0S1Uzic4fn1nWQAoEgWK4
 LGK3A87UqCUdYtdS5SFe6BibqyOxpLo5Ab7VyaGAAA2yXLx8I+hX+GssY
 aEdo2zj9cMUdS0Jj4pYDe4kEzpiFs+PCYq8pvhJ6mgpUape7a+ygmn7oq
 uypvTlSTOwMewKjaUTxbYMUkOr/2G3dXvjz2FmJ2LjEaq8yjBIVVqeF3V A==;
X-CSE-ConnectionGUID: 8+Z8WRnaRuaLcd8y7qcl7A==
X-CSE-MsgGUID: JcpU3Ne9RnO510d1RSt/yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20467098"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="20467098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:35:40 -0700
X-CSE-ConnectionGUID: UNcnJS1uRbyNmLkuWrjC5Q==
X-CSE-MsgGUID: xdmpHtjJStud9Lw86CKv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25373012"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:35:40 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/5] drm/xe: Move vm bind bo validation to a helper function
Date: Fri, 26 Apr 2024 11:20:50 +0200
Message-ID: <20240426092053.2863-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240426092053.2863-1-nirmoy.das@intel.com>
References: <20240426092053.2863-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
    Remove redundant coh_mode param.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 77 +++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ae2b0300db6..e41345c1627d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2859,6 +2859,46 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
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
@@ -2942,7 +2982,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 obj = bind_ops[i].obj;
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u16 pat_index = bind_ops[i].pat_index;
-		u16 coh_mode;
 
 		if (!obj)
 			continue;
@@ -2954,40 +2993,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

