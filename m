Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68367EDA689
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974410E82C;
	Tue,  3 Mar 2026 15:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3M0Y4Ke";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE910E839
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551255; x=1804087255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pi2oa1LUcXXrsDy9EcCXMREU08f+dqxQ3mt1/wBtp6Q=;
 b=W3M0Y4KewC57qhIOp3JZGLKZR+7s5Mml+BRfSullyZvGy8k4lmguTFD/
 4k6s+QiYl9jdHCe1JsNOszDidD16t4zJ8bY4z2DgxpVRhVofkgrjJdgkY
 aPy2M1BOiUBdu8OrBWUosY2lHi5BftAXo4PdmPSBiAqgnTPPXDrAIvAIB
 hbWzIMbOuHVw+ysWo3HvV9YuepmvqbsfeGGnE/z2c+MLZp2nqRlb5HFLo
 VjxyCeUAMB8elRUSe3rCJAzKA7RCTV5m3SaN4yOvrBt0brja8W3XUS2KX
 pSRAv5OKeV8uZZwTsLIbJfPIJJLGbNOrVWTD0BZvsYPQRBrj5A1DsHI0P A==;
X-CSE-ConnectionGUID: 21Cm7xDxT1WfyROKlM5+Bg==
X-CSE-MsgGUID: gJI/t6wUS0WQub5zNuaVyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655944"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655944"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:55 -0800
X-CSE-ConnectionGUID: 0de0lwRHSZaibWgEkaXpCA==
X-CSE-MsgGUID: viYGmj1ITU2avOml+5is4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506927"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:54 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
Date: Tue,  3 Mar 2026 20:50:04 +0530
Message-ID: <20260303152015.3499248-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152015.3499248-1-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
DONTNEED BOs can have their contents discarded at any time, making
CPU access undefined behavior. PURGED BOs have no backing store and
are permanently invalid.

Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
-EINVAL for purged BOs (permanent, no backing store).

The mmap offset ioctl now checks the BO's purgeable state before
allowing userspace to establish a new CPU mapping. This prevents
the race where userspace gets a valid offset but the BO is purged
before actual faulting begins.

Existing mmaps (established before DONTNEED) may still work until
pages are purged, at which point CPU faults fail with SIGBUS.

v6:
- Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
  with the rest of the series (Thomas, Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d05a73756905..3a4965bdadf2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3396,6 +3396,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct drm_xe_gem_mmap_offset *args = data;
 	struct drm_gem_object *gem_obj;
+	struct xe_bo *bo;
+	int err;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
@@ -3425,11 +3427,35 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
 
+	bo = gem_to_xe_bo(gem_obj);
+
+	/*
+	 * Reject new mmap to purgeable BOs. DONTNEED BOs can be purged
+	 * at any time, making CPU access undefined behavior. Purged BOs have
+	 * no backing store and are permanently invalid.
+	 */
+	xe_bo_lock(bo, false);
+	if (xe_bo_madv_is_dontneed(bo)) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+
+	if (xe_bo_is_purged(bo)) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+	xe_bo_unlock(bo);
+
 	/* The mmap offset was set up at BO allocation time. */
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	xe_bo_put(bo);
 
-	xe_bo_put(gem_to_xe_bo(gem_obj));
 	return 0;
+
+out_unlock:
+	xe_bo_unlock(bo);
+	xe_bo_put(bo);
+	return err;
 }
 
 /**
-- 
2.43.0

