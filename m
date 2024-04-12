Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E84C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 11:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D504410E1F4;
	Fri, 12 Apr 2024 11:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLHmGGnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55710E1F4
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712922512; x=1744458512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HH2jNy9F/hT4Log4+vHV8EFrbonkxBmIyYIsQoBMXyc=;
 b=ZLHmGGnJIe1FQPbb1gy9LqEvr0LrNH0js7bB6Y6K6+bnXOaWupRYVrSn
 vRx2CT1g5cYq8ZJRwlRCzUTr9xyrWcaZKsB3B11nMshtOpCq9cPB8Fec4
 NPJ3351hz6psINQ+42JQ+sUyUpBaV+mNKgQvoxZF+LgqOpMdfsYl4UKzg
 jeDCnmsbZ5w0+f+FO/li9CN0ePFI06SnIkJRP0g++iYq0e7d2O7xcfVj8
 xdl1xRhVgTJ/c1Sz07DMq5/KnskN4Kp+4xS41aKXVbfsKTYZyv5wTsOso
 9EbamwcQSgxXsgt4TUc09dhZobEjA0MOocIbDxinUDrru7znygtL95O0N Q==;
X-CSE-ConnectionGUID: TUQn5uyST4KGybz/kNnOkg==
X-CSE-MsgGUID: mZVt1EcvR9SCMGGr5DVerg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18930668"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="18930668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:48:30 -0700
X-CSE-ConnectionGUID: 3pLEWohmRrCL3bXVylVcrQ==
X-CSE-MsgGUID: Xqmp2MiMQV6R89zbS1C+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21705822"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:48:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Use drm_sched_priority enum instead of 0
Date: Fri, 12 Apr 2024 13:34:26 +0200
Message-ID: <20240412113426.12518-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Use enum drm_sched_priority, DRM_SCHED_PRIORITY_KERNEL
instead of 0.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c      | 3 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c..a8c83b36289f 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -341,7 +341,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
+	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_KERNEL,
+				    &sched, 1, NULL);
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
2.42.0

