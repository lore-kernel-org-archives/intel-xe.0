Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B397C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 15:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437EC10E778;
	Tue, 17 Jun 2025 15:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="am7C7m4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589A910E36D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750174581; x=1781710581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5933w4hK3A5bdWrbFXPPmR3ZJBH91bAX51IYhxzG6fA=;
 b=am7C7m4yIOXYB8f0lqSS6QlWDItF1qbLxZd9dfoBHChoHQcj+6uHv0Ku
 jX7LO/hSVeevYtdQZNu7wbdKDyAG6Tca2mszS/Yjyfsx0EivYjjQhABX7
 qQ07tCVnjby0tpqbKDKA22vEPSl7cglmUQ+wK+3CE8H2xIJuYoaRvIIAc
 +lpit3iX2eNiTaEp+nL2smsK2O8YC+80oK9/ywfWCCMWN3fvn6LU0PnK3
 nyxbLzsrG/E1iMXx/pSNn1r8YRH3gSti2xOGb7D3PN2BkNEA2lLfUcgwk
 Jk4Bhbo0vg3HeIyq66eUy+Rhpkl4Suab4wIver8dO9HrvYFA4Ko6bXhSc w==;
X-CSE-ConnectionGUID: f0lFX4bxT+umV/ln2FaoIA==
X-CSE-MsgGUID: cqL9VSBJTrSwKJqxU4P2Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52230875"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52230875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:36:14 -0700
X-CSE-ConnectionGUID: Sqvgwi47QsWjsGYpeKm4AQ==
X-CSE-MsgGUID: 3sNoV3m1TM+dxuRiPcNW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148667730"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:35:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 4/6] drm/xe: Add xe_migrate_job_lock/unlock helpers
Date: Tue, 17 Jun 2025 08:37:28 -0700
Message-Id: <20250617153730.2136174-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617153730.2136174-1-matthew.brost@intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
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

Add xe_migrate_job_lock/unlock helpers is used ensure ordering when
issuing GT TLB invalidation jobs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 38 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  4 ++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9c246a3ee610..2f2ac8a44290 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1915,6 +1915,44 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
 }
 
+/**
+ * xe_migrate_job_lock() - Lock migrate job lock
+ * @m: The migration context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Lock the migrate job lock if the queue is a migration queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	bool is_migrate = q == m->q;
+
+	if (is_migrate)
+		mutex_lock(&m->job_mutex);
+	else
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be
+						   locked */
+}
+
+/**
+ * xe_migrate_job_unlock() - Unlock migrate job lock
+ * @m: The migration context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Unlock the migrate job lock if the queue is a migration queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	bool is_migrate = q == m->q;
+
+	if (is_migrate)
+		mutex_unlock(&m->job_mutex);
+	else
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be
+						   locked */
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fb9839c1bae0..e9d83d320f8c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -134,4 +134,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
+void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
+void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
+
 #endif
-- 
2.34.1

