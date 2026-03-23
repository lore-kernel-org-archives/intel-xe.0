Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95323EC01B6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5976E10E48A;
	Mon, 23 Mar 2026 09:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BijiehHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844D10E349
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258291; x=1805794291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5JtFsKtWaE0IXt17CYcMUMMW4tI0Y8w1E7j1J0Sx9Y=;
 b=BijiehHIs4n/R3hrH48vOajDf72D+Xzfq2g1W7du2ougw2CHYgJAP5GY
 6jtPkcH1/dk1Wq3Xvmc9eZ7/9XhELvCnbU2uRrlGxJNG4AsnPK+zHdqtB
 eevSpztQ33yPk2FJwjJiz/vLuyqN+qmCPapa0/REsN6D2UST3YN0cRrfZ
 iVkY0KHIgnpL5EVRnf3FZ5fLmS/7C/F6YH7dToqH9ukDctFxr1aazR41/
 bI2DJKcYyl7sueSufKZHgB87z4taHGait7VAqAa6JT4Bk5InJC6e1gmzw
 x5JNSBR8Sgfgr2hOAWRzkBOG314I/CyvB3DXmbbCEAg9Hew/5Je784lq5 A==;
X-CSE-ConnectionGUID: 98U6OjYRS8GcOPbKDPqWdg==
X-CSE-MsgGUID: CfnrcDYIQvqrWNymSz+ZMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221767"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:31 -0700
X-CSE-ConnectionGUID: wl1dLexmQfWRb1ungRt9MQ==
X-CSE-MsgGUID: eFhS1OiFQjW5aukvxAOshA==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:29 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged BOs
Date: Mon, 23 Mar 2026 15:00:58 +0530
Message-ID: <20260323093106.2986900-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index ea370cd373e9..4edbe9f3c001 100644
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
+	xe_bo_lock(bo, true);
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

