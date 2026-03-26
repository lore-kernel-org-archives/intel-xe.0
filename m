Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACACD109E557
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 05:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45D10E94D;
	Thu, 26 Mar 2026 05:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtWI/KTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB6C10E950
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 05:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774504304; x=1806040304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMf5pGllPRkLzDQ2VaGx9I3qNZUnGToArK1ctWR3QgI=;
 b=QtWI/KTGVBec8iR4Fn9QVbRxwqzUskwfVy1vdealpn3TtTgxgc6Vkupu
 FsR5/G+sSkxlPYKOUitsz1lN1qsDa4Z2HCp3eEad6X/wtvu4XkRWdjfZs
 T7AId5RNLmPwv7ku+fTsMni/E02mDDM03X/Lli5Uk3U1egwWrllpx+6M1
 iQLWZNwt5uzKvhke3+mUxCKUfEAy8HUpkmuW93HmsmnRHrAXOm/cNco7M
 /FhOWjdg5wKM+/BPZZJvLOMUcQzMzPvDZDvHA3C5EB98bdWW1pbwx2o5B
 ECWM/D1m1jzgWGoL5Q89ZtK8MR/qCD501PiftbjTpQi6SWA0SQ6uivpyB g==;
X-CSE-ConnectionGUID: JoDlpRWuSw+hG7Akq6DEkA==
X-CSE-MsgGUID: /EeE6fzRQm28hMDHuzGgcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87031297"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="87031297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:43 -0700
X-CSE-ConnectionGUID: KNHNH1OiRlCgpxmpE8u7uA==
X-CSE-MsgGUID: BXr4CIZsRS+yXP7rRHImkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221586009"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:51:41 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v8 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged BOs
Date: Thu, 26 Mar 2026 11:21:08 +0530
Message-ID: <20260326055115.3422240-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326055115.3422240-1-arvind.yadav@intel.com>
References: <20260326055115.3422240-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

