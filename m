Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F9CEB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 13:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DDC10E7BF;
	Tue, 10 Sep 2024 13:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtnD7CVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B96310E7BF
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973925; x=1757509925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qjWUbGIb4iAWMs+pKEn7wrq8YkJG7yo7hs9l+w6fUG0=;
 b=LtnD7CVv07NMYDFsC8g+QHNJnXDVYR5Vf+gD4iLZyK7k/KdQNraOKDrZ
 C9S5+BjL0Yqp2sMCqtvFp/VDbtHBLlfptmqJ9oh0lKISO+PpfTdb44iy8
 6HYdNMWVtOxlJXK5YVP1xUSn/ffVGYr50x6YI6NxeD/skhVReOBEiT4GK
 kc0bN4wXDC17Stk7nu4rCtvGvrxZIaYYp9guUUu9Y/y8lhcf5kPbxpa0S
 iM06l92ecXfYoPWvUZ08iqqbycknehfc8lWTs2I2wTkW0rPk5sEWqPJp9
 y6XL93BYuNx4Kc4mx3yEeTC3nXT4jJUqd8BYtvDgC2J7SmGxwtv3uCnLx w==;
X-CSE-ConnectionGUID: 6yIrD60mSUSTRLE0QXalkQ==
X-CSE-MsgGUID: wnZhKg+qTK6d2Uojqc95qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24861242"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24861242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:12:04 -0700
X-CSE-ConnectionGUID: 1ZxR2oUFSSaPJPt6Ojanig==
X-CSE-MsgGUID: ZwVh8ikzQmaj5/tpvOWRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67037976"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.215])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:12:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Date: Tue, 10 Sep 2024 14:11:49 +0100
Message-ID: <20240910131145.136984-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910131145.136984-5-matthew.auld@intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  6 +-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 53948a965404..4176b302c38d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
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

