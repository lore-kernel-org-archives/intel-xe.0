Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FEEEDA687
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 15:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822110E830;
	Tue,  3 Mar 2026 15:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgs3690G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291FE10E830
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551257; x=1804087257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mR/1Ag8nxabknfDREChp/hbY7uHHGnWSJEFWCvXD7zU=;
 b=hgs3690GClxf+QrrDWSXfuN2D6A6m9bmTZk0MEh6+cLrECIERCDLzfbP
 wwMiL3JOVuK3yYFSQeqJF2toCOGwvpnlyE8cZZ0RH0u0i6nzZDbUb/1IE
 BNV+vNE8bo8eknR5xOZUhb5MosGoAvtDJP+f7u55lgg3V1xRvWDI6ISlY
 i3/TbRQsp0Zw1Q18Gre/lZbkwckrL8/UKdKTMhcqFkL6dWzpQomJ+pPUv
 4uOjgkZ2TBYjV+BaJG6U3yhIsXH6su75olPQhjbvBOdWo5h//7myJUFZJ
 U23lRhrQ2W6+aOkVeeoIwsqLsnIIuUnqMK5VFBqRE+GemoU1ju9avti08 Q==;
X-CSE-ConnectionGUID: 4cV31B5lT3elqkHag8KqTA==
X-CSE-MsgGUID: 10TnVO82TLaL+W9z74212w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73655964"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73655964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:57 -0800
X-CSE-ConnectionGUID: cUQBMPy6TOaVR9XVvKC7cw==
X-CSE-MsgGUID: C5IX3G+iQCalHaFFhtgG2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222506941"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:20:56 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v6 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged BOs
Date: Tue,  3 Mar 2026 20:50:05 +0530
Message-ID: <20260303152015.3499248-10-arvind.yadav@intel.com>
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

Don't allow exporting BOs marked DONTNEED or PURGED as dma-bufs.
DONTNEED BOs can have their contents discarded at any time, making
the exported dma-buf unusable for external devices. PURGED BOs have
no backing store and are permanently invalid.

Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
-EINVAL for purged BOs (permanent, no backing store).

The export path now checks the BO's purgeable state before creating
the dma-buf, preventing external devices from accessing memory that
may be purged at any time.

v6:
- Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
  with the rest of the series (Thomas, Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index ea370cd373e9..aba6b9696030 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -223,6 +223,23 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 	if (bo->vm)
 		return ERR_PTR(-EPERM);
 
+	/*
+	 * Reject exporting purgeable BOs. DONTNEED BOs can be purged
+	 * at any time, making the exported dma-buf unusable. Purged BOs
+	 * have no backing store and are permanently invalid.
+	 */
+	xe_bo_lock(bo, false);
+	if (xe_bo_madv_is_dontneed(bo)) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	if (xe_bo_is_purged(bo)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	xe_bo_unlock(bo);
+
 	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
 	if (ret)
 		return ERR_PTR(ret);
@@ -232,6 +249,10 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 		buf->ops = &xe_dmabuf_ops;
 
 	return buf;
+
+out_unlock:
+	xe_bo_unlock(bo);
+	return ERR_PTR(ret);
 }
 
 static struct drm_gem_object *
-- 
2.43.0

