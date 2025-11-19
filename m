Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CA9CF58E8
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 20:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBBE10E672;
	Wed, 19 Nov 2025 20:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7Sa5CqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89AE10E262
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763584305; x=1795120305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Arymk1lhqX2c9bdWgcH/SqT5jOx2eNqwu3oUjIcFoKs=;
 b=V7Sa5CqZAk0uohJluXqSA7UJo6b3iQFQEphAob5SGcHqTBzzNDeqPmCi
 KIrvrK6gbyj1sJqAP6dv9VgzxvYFtqw/t6rb1+4rwz6n71FNS2lsQkkpl
 QLfZTUZindQz1h2ZcqJChETeFMFyhJyJaf3NTVHlZ4McJZlU6YyC7YIz2
 Jrq0QPpZ2y7404xD6hogdc5mwL4RJkmJahwRLc5dsKbBvVleXxc5rds6O
 xHpFdCddNx7OIqqI+QvO8q6SVXjPBBC7e21q7IbIMAywVwPkts+gRaRiJ
 fzJjjgqVcZtgCSxS334y3EuDs7hq0h26+4lcVLLGwLrfwaOy7wtt9TSYV Q==;
X-CSE-ConnectionGUID: Xip090MRSQqFjoH2wRff+Q==
X-CSE-MsgGUID: FkAaHIlARyiBz8ybR052CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77107368"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="77107368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:31:45 -0800
X-CSE-ConnectionGUID: CEittUBDRLanhZpJzgMuqw==
X-CSE-MsgGUID: l8guB4I3ROmXbKClTHlb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="221809032"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.19])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:31:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/migrate: fix job lock assert
Date: Wed, 19 Nov 2025 20:30:34 +0000
Message-ID: <20251119203031.267625-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119203031.267625-4-matthew.auld@intel.com>
References: <20251119203031.267625-4-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f3b66b55acfb..2ed8ee32b5cf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2481,7 +2481,7 @@ void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 	else
-		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
 }
 
 /**
@@ -2499,7 +2499,7 @@ void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 	else
-		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
 }
 
 #if IS_ENABLED(CONFIG_PROVE_LOCKING)
-- 
2.51.1

