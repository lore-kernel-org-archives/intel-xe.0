Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8222D2ED0F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 11:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2A410E5C1;
	Tue, 20 Jan 2026 11:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSHKIiI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FDE10E5BF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768907192; x=1800443192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d2X2dMyFyCaE/2/Nx6aXk0SmTi7ReK/uNWdg25Q9XFU=;
 b=mSHKIiI44yemtEPuV2uHGaFBLNLwecskqPRg8hvQedF+hZi2350HWOKs
 MMKCT+Fp+e7ayaTrSY1324bt1dqHdtVna7Jcs5cjWDcs50/Oscg+I9Wpg
 KXqo850OAYrn7giFcHxaBTOjcyNiF5d10ZNvK+mvMHVROn1TdEljtd3cs
 C0P1f/lxnYuqmJszYbK9jexHIh77maW3vZ8VWE5LxE3moZ7HOf6zmMl2n
 79G1lvR3W8tHvaXmvYAi8kM1GH8nQNSsjH6hS9Hj8KAL+JD1utdLIZscP
 lLZi30X5rKdAsM9/2Bl8lms2eg5XvDj9QfJvplG2jlHmfDCLLwwqNZhTs A==;
X-CSE-ConnectionGUID: dQVhZww3RBSU2/ibrWLcpw==
X-CSE-MsgGUID: rUywVzPESPq7e2TnmvWn9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80833558"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="80833558"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:06:32 -0800
X-CSE-ConnectionGUID: KVH3/IusTLS4274dCfI/DA==
X-CSE-MsgGUID: 1MlqjaNKQaeDvrVHM3RFkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="229029119"
Received: from amilburn-desk.amilburn-desk (HELO mwauld-desk.intel.com)
 ([10.245.244.235])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:06:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [CI 2/2] drm/xe/migrate: fix job lock assert
Date: Tue, 20 Jan 2026 11:06:11 +0000
Message-ID: <20260120110609.77958-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120110609.77958-3-matthew.auld@intel.com>
References: <20260120110609.77958-3-matthew.auld@intel.com>
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

We are meant to be checking the user vm for the bind queue, but actually
we are checking the migrate vm. For various reasons this is not
currently firing but this will likely change in the future.

Now that we have the user_vm attached to the bind queue, we can fix this
by directly checking that here.

Fixes: dba89840a920 ("drm/xe: Add GT TLB invalidation jobs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 00eef41a9e36..6e202428aac2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2499,7 +2499,7 @@ void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 	else
-		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
 }
 
 /**
@@ -2517,7 +2517,7 @@ void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 	else
-		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
 }
 
 #if IS_ENABLED(CONFIG_PROVE_LOCKING)
-- 
2.52.0

