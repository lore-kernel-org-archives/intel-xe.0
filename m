Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD0D1AD39
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D0110E6E7;
	Wed, 16 Oct 2024 09:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beUlLMan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7A310E011
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729072685; x=1760608685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qrm+8h5lY8Zh37JnLe6V1YqufGik2ZojxmLkcAUQWoI=;
 b=beUlLManDdeVKV32kYmNpnWegk14p26IdNHfXPo10pPZ5+NTYeuwKBz3
 JpyMEXNPRVOEtzRYyeAnZCGLnLIZatL4lYwZHVWRV1twBnG4F9m3WXitd
 H9pObjIRvnXpVf/uOq3CjMjmqs9QwQjpy5p7NInEYOXaG8NMj2GMqeZaW
 9FEfhABot0AalA5/2PKbBf5eUYL7cR7cRY1QbDUKihzaUIFIFcotqo0Uc
 RxxfERfXmitTxAV3ax7jI0B6o2qblOv1dfMY6Yrk/sE5F50mTZFcKI/Ly
 IStRe3qrRsezxn3j9IXr5uQyX9E+QSSZ8XVbnzDsc5w5YInn+n3q7XJUs A==;
X-CSE-ConnectionGUID: UmTS1J+cTy+S4RAHPmVW9Q==
X-CSE-MsgGUID: 05gZ38gMQ5Oxuz/kfjIu9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="27951158"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27951158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:58:02 -0700
X-CSE-ConnectionGUID: g6qqPv5OQgmfZNTR3qqGZQ==
X-CSE-MsgGUID: 4kOM01rwRKSVu+734gF/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78201588"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:58:01 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v1 2/3] drm/xe/bo: Add trylock helper for buffer objects
Date: Wed, 16 Oct 2024 11:57:44 +0200
Message-Id: <20241016095745.7477-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241016095745.7477-1-lukasz.laguna@intel.com>
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
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

