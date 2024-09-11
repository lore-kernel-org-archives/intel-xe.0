Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6CCEE0213
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB36D10EA3E;
	Wed, 11 Sep 2024 15:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OshzWfVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB010EA3A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726070155; x=1757606155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9I4hs2RGNU1wEtnB1Vsy7zguFyf2+GDIVPWdJtcovI=;
 b=OshzWfVawRpFFeI6xr7UYDRYgu+5guaQ6XSVXyPdCtQh3+MZs1oGBRKR
 rHCOyjq0YBuGKivbjvL4mCd1UJwdAn/Y13fxlheKlWvp6pN17U5ukZDCQ
 wO12/yfV5Dg+B2wMdyFtx1pFL+drwebVXpijcQwcWTg9Hpbf1LmTyObJY
 u5UIi1P0FCSXVWVSWMBv1cLy5dKz4+efNS7PjcbcBy3dU/FsCBdoO1UQ+
 m0XaOGleIPeoWw2Uzhoeu8orLuY/5qz4Z6DjwRk3upTws+0bgVhD56sQn
 Xbz+wFRSQyV0CDbJ4i+M56sMkporrDE7mvRJ9i2EtXEHYsuQ148AhBnIc Q==;
X-CSE-ConnectionGUID: e2IUULxYQE6PCvnUbALaXw==
X-CSE-MsgGUID: 8d/ck/rCRDetqOBHe1ZSyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24703348"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24703348"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:55 -0700
X-CSE-ConnectionGUID: T5XUHCsQSSGbDtdwHpKfsQ==
X-CSE-MsgGUID: 9Mb7/9gVS9ePdc0L1RQXgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67257855"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:55:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] drm/xe/bo: add some annotations in bo_put()
Date: Wed, 11 Sep 2024 16:55:30 +0100
Message-ID: <20240911155527.178910-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911155527.178910-5-matthew.auld@intel.com>
References: <20240911155527.178910-5-matthew.auld@intel.com>
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

If the put() triggers bo destroy then there is at least one potential
sleeping lock. Also annotate bos_lock and ggtt lock.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  6 +-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a4dadd5a424c..5f2f1ec46b57 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2350,6 +2350,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
 		drm_gem_object_free(&bo->ttm.base.refcount);
 }
 
+void xe_bo_put(struct xe_bo *bo)
+{
+	might_sleep();
+	if (bo) {
+#ifdef CONFIG_PROC_FS
+		if (bo->client)
+			might_lock(&bo->client->bos_lock);
+#endif
+		if (bo->ggtt_node && bo->ggtt_node->ggtt)
+			might_lock(&bo->ggtt_node->ggtt->lock);
+		drm_gem_object_put(&bo->ttm.base);
+	}
+}
+
 /**
  * xe_bo_dumb_create - Create a dumb bo as backing for a fb
  * @file_priv: ...
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dbfb3209615d..6e4be52306df 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
 	return bo;
 }
 
-static inline void xe_bo_put(struct xe_bo *bo)
-{
-	if (bo)
-		drm_gem_object_put(&bo->ttm.base);
-}
+void xe_bo_put(struct xe_bo *bo);
 
 static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
 {
-- 
2.46.0

