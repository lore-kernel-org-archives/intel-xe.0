Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8FFD767DD
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432EF10E8CE;
	Thu, 31 Oct 2024 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nb8hrwZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4259910E40E
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730387869; x=1761923869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qrm+8h5lY8Zh37JnLe6V1YqufGik2ZojxmLkcAUQWoI=;
 b=Nb8hrwZnB8hCLz70S3Cf6acWxZ93Ddm0wOWZfRg3vt5LKQtQDgaCiGtM
 wD2DaUjIFZl5IuUGaxd11d9MPNofZpoRWECquiJRCf5fjDjvOUl71FTOh
 9R9l3AJHmNIpSR7jBzs2CyQpLZNFwaEmyLp9C6n/HO9hlBMD/p+6HrRJx
 RlrOtlM4EtDPFRynhR+pB0gJUENFRIKWn4p1e4qI4EbYixiYxwYU29EJ2
 EaZI4z/YuCdWyu51AoeXFDkpfBNuHvcmG6DsginCQ2yjT9TjYz8HXiij/
 t93s2GCyeO+D7FyhtPy8xPPdZt4CigJbKAnwMxDx1gwlJy7J5NdGcSGbJ w==;
X-CSE-ConnectionGUID: QYkwZA/oSBy555ukUfinhg==
X-CSE-MsgGUID: hN6IB6dWRV6n+ZwANCAJIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29568930"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29568930"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:41 -0700
X-CSE-ConnectionGUID: t6YNje9aTpS8eo88JMY5fA==
X-CSE-MsgGUID: DzqCf5WNSLC5bdH9/bJBLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87798887"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:17:40 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 2/4] drm/xe/bo: Add trylock helper for buffer objects
Date: Thu, 31 Oct 2024 16:17:23 +0100
Message-Id: <20241031151725.28315-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241031151725.28315-1-lukasz.laguna@intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
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

Wrap dma_resv_trylock() for convenient use with buffer objects.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 16 +++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..6af7bc586f1c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2168,11 +2168,25 @@ int xe_bo_lock(struct xe_bo *bo, bool intr)
 	return 0;
 }
 
+/**
+ * xe_bo_trylock() - Trylock the buffer object's dma_resv object
+ * @bo: The struct xe_bo whose lock is tried to be taken.
+ *
+ * Tries to lock the buffer object's dma_resv object.
+ *
+ * Return: true if the lock was acquired, false otherwise.
+ */
+bool xe_bo_trylock(struct xe_bo *bo)
+{
+	return dma_resv_trylock(bo->ttm.base.resv);
+}
+
 /**
  * xe_bo_unlock() - Unlock the buffer object's dma_resv object
  * @bo: The struct xe_bo whose lock is to be released.
  *
- * Unlock a buffer object lock that was locked by xe_bo_lock().
+ * Unlock a buffer object lock that was locked by xe_bo_lock() or
+ * xe_bo_trylock().
  */
 void xe_bo_unlock(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7fa44a0138b0..83992471c510 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -147,7 +147,7 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
 }
 
 int xe_bo_lock(struct xe_bo *bo, bool intr);
-
+bool xe_bo_trylock(struct xe_bo *bo);
 void xe_bo_unlock(struct xe_bo *bo);
 
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
-- 
2.40.0

