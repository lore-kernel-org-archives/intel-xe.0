Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F11DC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0F10E4E6;
	Tue, 20 Aug 2024 08:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6rsuIq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC6C10E4E6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141387; x=1755677387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wANK5BAIxNn4/eXgrpWJiGLBvtU4aY4AQEPNttTfoPo=;
 b=d6rsuIq4BtNaPLONPVSFXxzzC/x491cTXmTAmabptqeLDF6iJPTNFaE4
 9R+lFfXtf3mls/6eGsMUru+Dq8VOSPK4MosNvv5SH+asdvUKMImEbjeXB
 CSkskx2dZUyONURAStS1ymsMmuOyfUHXXNKXLRSy/BNl/bkLexIi1/e1I
 b6LTPFjtPZ9slzyUFzrlUqEMKW2ZLygp8uKrENnKkBQQctcbteydHjZ7y
 k2dy11Q14j48en9RVzW00eCXQ5h8BvBKdFQo6YZn9nSjCDOUoW1eU5GCL
 oYj/qpaJt5x0A5IPZt2mwejUkIcubv/XHuVLfXWq4B1OmPzfZy/+MXMkp w==;
X-CSE-ConnectionGUID: 68Vp7Ly7TiCz8ji9VRZ6+Q==
X-CSE-MsgGUID: 8K4paAhERHW7cDJ9t9kauw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26291064"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26291064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:09:31 -0700
X-CSE-ConnectionGUID: DKpq6R7IRJyuiwK2R9RW9g==
X-CSE-MsgGUID: RvVXe3VYS6KAIj8p5RBSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60350154"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 01:09:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/2] drm/xe: Remove extra dma_fence_put on
 xe_sync_entry_add_deps failure
Date: Tue, 20 Aug 2024 13:57:12 +0530
Message-Id: <20240820082713.3257455-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

drm_sched_job_add_dependency() drops references even in case of error,
no need for caller to call dma_fence_put.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index ca826aeb41ea..a0675f57a398 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -206,16 +206,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
-	int err;
-
-	if (sync->fence) {
-		err = drm_sched_job_add_dependency(&job->drm,
-						   dma_fence_get(sync->fence));
-		if (err) {
-			dma_fence_put(sync->fence);
-			return err;
-		}
-	}
+	if (sync->fence)
+		return  drm_sched_job_add_dependency(&job->drm,
+						     dma_fence_get(sync->fence));
 
 	return 0;
 }
-- 
2.34.1

