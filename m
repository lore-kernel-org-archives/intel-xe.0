Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D736C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 03:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B7A10E69B;
	Fri, 22 Mar 2024 03:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAkHfTNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6F010E645
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711076571; x=1742612571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y/2OuYFzEjBENvYjgeYMbQih8+/WkNtK/O+XEpRCm2k=;
 b=RAkHfTNPKJ3uno7/1QweBbKf7mY3AhvGIal4L1QXGilt2NwZfk5LjCA5
 yyYfdF1rwQV5fZ8SyC3CyI2kT6S6mKl2Po7wp4C9t3KpyYxLW0AIaG999
 VFh8dAyZp6RPJcLuStO8OBhECPXaupP5l0S3zh+V1iGsaGwEbV2SvFGxE
 c8UxHFqklh3TRRrmdDAUnY6Ezmc8Cs1+gwHs63kE5LgtjwkAsRqNwJput
 kHqWgkU0dWzJal3sEQL1dLQNz4sdhWqL97Iz7qWm5Z7rf/EWo20XZP89v
 HUleBtvcq48xGYnk7HrrtEiKkITk9yx100/qAmGHeb4EdyZocC/YQc5pB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6717930"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="6717930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="19440030"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa003.jf.intel.com with ESMTP; 21 Mar 2024 20:02:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe: Use enum instead of hard coding
Date: Fri, 22 Mar 2024 08:45:58 +0530
Message-Id: <20240322031558.3343719-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Instead of hardcoding the value 0, pass DRM_SCHED_PRIORITY_KERNEL as an
argument to drm_sched_entity_init.

v2
- Make changes in xe_execlist too. (Rodrigo)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c..57d3c11da591 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -341,7 +341,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
+	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_KERNEL, &sched, 1, NULL);
 	if (err)
 		goto err_sched;
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..1f712f4fc76a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,7 @@ static inline int
 xe_sched_entity_init(struct xe_sched_entity *entity,
 		     struct xe_gpu_scheduler *sched)
 {
-	return drm_sched_entity_init(entity, 0,
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
 				     (struct drm_gpu_scheduler **)&sched,
 				     1, NULL);
 }
-- 
2.25.1

