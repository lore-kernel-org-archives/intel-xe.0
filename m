Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9C4C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623FC10EF2A;
	Fri, 12 Apr 2024 09:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGFDFUJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2EC89067
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914641; x=1744450641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jYbmM0P4UftE6JP4lhYGRmMLFV5rKF078HpFnAKErHk=;
 b=iGFDFUJ+se2Tr2R0w/9WkDTBws5mwej2Loqz0lD+tRCdWwvc3HR964zN
 idiNkJUDKPBEivUtlGMVgG1QHL1LhMYE0VZKTL5AT1ppIQJAAZU2W83Sr
 hBbcVecKuVUUkaXLauiedTTSRP4iirMrk8E89Eaagtdu8yOKc0DlHv9cq
 GgZdwDnXbk4dc2vsaa8fXAZTLknppURvOQE3LSp6vj5e7APZmw0mip5dT
 +HOf89XstOCcPLPR5VIqPZRTGZYxaglqwwWblEOMEkHJlt9Y64TX9bpzG
 4i03sVvCARSQuBM9nUy3KiDwVLTQKP77Dd4ro4i1kTtYstbkCfs55Iclg w==;
X-CSE-ConnectionGUID: cFrs1irZSIy/ZQhdY1pCVw==
X-CSE-MsgGUID: X/kmLzaUT7e5hg6PeFd1Iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075950"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:02 -0700
X-CSE-ConnectionGUID: CnCReO9aQ4KPwKQFaoFgcA==
X-CSE-MsgGUID: S4cFvTiyR6CXuYPssprdSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342159"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:01 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 4/7] drm/xe: Move vm bind bo validation to a helper function
Date: Fri, 12 Apr 2024 11:22:46 +0200
Message-ID: <20240412092249.3636-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c | 73 +++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7991d88fba22..5e633014f017 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2972,6 +2972,44 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	return err;
 }
 
+static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
+					u64 addr, u64 range, u64 obj_offset,
+					u16 coh_mode, u16 pat_index)
+{
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
@@ -3067,40 +3105,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 		bos[i] = gem_to_xe_bo(gem_obj);
 
-		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
-		    XE_IOCTL_DBG(xe, obj_offset >
-				 bos[i]->size - range)) {
-			err = -EINVAL;
+		if (xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
+						 obj_offset, coh_mode,
+						 pat_index))
 			goto put_obj;
-		}
 
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
-			goto put_obj;
-		}
 	}
 
 	if (args->num_syncs) {
-- 
2.42.0

