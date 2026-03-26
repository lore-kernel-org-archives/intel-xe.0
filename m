Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC2710A62CF
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814910E926;
	Thu, 26 Mar 2026 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I05Pga0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238BA10E2E2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530555; x=1806066555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/Dg6MFr6OXkk1RRB4+hWsCzHq8NX07TuPVxEavrL5I=;
 b=I05Pga0/P8HDOkegt41zl8WAsh6jDMUyo8SaTRuo5DyXkfPv1bWYk5xR
 cY+o7UXze//3AHR4IZcOxtXUdJb5DXumqE8ez7zQv7MrQ8CDQQ/6k57lI
 jJ9+CB2ybi3dd+zB87Nlt5coAqqbf0mcB6sU2xmvpz0QA67JY9Rx6Xpyb
 pVvf0Tshjcht0vBIqvfGYqLKnQNPpnsU7XbTSGSz1/la5m2aNKf7zMsC1
 76jDQBLITOATMTQjNjjFs20LtgrGcQhpGigh7MjsfBHLN0ESb0vKxZGGj
 /NKcXYuK5fAJQ/j+gxstCxkcpcPBjG/Ev5uxSwL+8tEFdZknxvj/RNEIj g==;
X-CSE-ConnectionGUID: m1PvL/YGSEqjJ4//sMVmgw==
X-CSE-MsgGUID: XiJ4zlYQRFqHWLDauhWtzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784786"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:14 -0700
X-CSE-ConnectionGUID: +6Khm/8MQ+CZNIz6V5dCkw==
X-CSE-MsgGUID: qI78hVvHSC+aRxZf9Ac6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070564"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:11 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged BOs
Date: Thu, 26 Mar 2026 18:38:35 +0530
Message-ID: <20260326130843.3545241-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

v7:
- Use Interruptible lock. (Thomas)

v8:
- Check xe_bo_lock() return value and propagate error. (Thomas)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index ea370cd373e9..7f9602b3363d 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -223,6 +223,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 	if (bo->vm)
 		return ERR_PTR(-EPERM);
 
+	/*
+	 * Reject exporting purgeable BOs. DONTNEED BOs can be purged
+	 * at any time, making the exported dma-buf unusable. Purged BOs
+	 * have no backing store and are permanently invalid.
+	 */
+	ret = xe_bo_lock(bo, true);
+	if (ret)
+		return ERR_PTR(ret);
+
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
@@ -232,6 +252,10 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
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

