Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF9C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 22:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490CF10ECEA;
	Thu, 25 Apr 2024 22:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijUzwU38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDF510ECEA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714084728; x=1745620728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HGRfUaI2mFidMOBWn3N7bksbEWI5ZXfKQCMvu7Dq3qY=;
 b=ijUzwU38mijjid9+3s2tqZpfgLLQU7U0wAOVoiD7HE1jHDlO9ilwlX4v
 fT7egpXrHVy6Xg1EZVjcpRutNj6MzPKmoltR9TTiGHsO4Ya+dAHxSTDbD
 NtWc5TnO1aEpDo1jeQGliq1rX3F+hiQ8Rc8ezq+sDQsR/Snajn3Q/5dj8
 G7aV8TUtvSDQ9iLq6/ESFWlNEFqqbpi5rP5+Zu7iuB2VqNsHFuiVTEpM4
 oOjwm1oQj5qkoas3/G9D504Z/+yiwrS393SmsyT+WCnEi228fA0ZUPuF5
 J+uMs4iDTqqXFf1yPV7w/zFJSFQmBhz7JmKVul+V2Y3EiflKdJE7Z1Osm Q==;
X-CSE-ConnectionGUID: cfflKpmGSMu7Z9aql8nheA==
X-CSE-MsgGUID: lE4FmsDtQFyfsqc7Q9A/8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27325056"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="27325056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:38:48 -0700
X-CSE-ConnectionGUID: Xqt5RLt1ShC7SRMy2mEH9Q==
X-CSE-MsgGUID: En485iAqR+2sS2Ctdxzg2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56167318"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:38:47 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v4 2/5] drm/xe: Move vm bind bo validation to a helper function
Date: Fri, 26 Apr 2024 00:23:43 +0200
Message-ID: <20240425222346.13026-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240425222346.13026-1-nirmoy.das@intel.com>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
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

