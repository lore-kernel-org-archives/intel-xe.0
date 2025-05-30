Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A0BC5B552
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 09:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FC610E052;
	Fri, 30 May 2025 09:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncwrFjB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7B89C83
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748596824; x=1780132824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IirqSX6xi8sFfhF2hXbVKRpc4vJJx1a65CXNntbGqg0=;
 b=ncwrFjB4z1X5k+5UMz5HBXTsUbq5saCSHjDqh2LebVTCkdOSzHZoxzfj
 KtVxzGwSs9HBY0PxVqbOcA+B24tdwMaeHZaKqfBSIrONxtrjhNrbhHzpI
 wrM8A6Es+zp/3ZjGQ8eNFn+hXOEIKnJi2oze/cAE8nraXE1JdrLqLjNt2
 xdTLujmQtOjQrS17o71o39P0FluYR8lyro48Z/AA9FnDWKUhjR9MiKB9P
 np7lgzfqqrm86kbgaQbyud/3kZDdISw0mCRMs3hSs1knkgTQCIKOwAluA
 pvtSDMKMEOoJS3Vsol+fXt6YxNVsPPRVSWQHddeNUGuOpk6gagMutVuhQ w==;
X-CSE-ConnectionGUID: jibapjn/QCS18up1QtMHvw==
X-CSE-MsgGUID: cgCsaAS8T/uQxNkCcgEwOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50830502"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50830502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 02:20:24 -0700
X-CSE-ConnectionGUID: wLRoNyf9RMuTGJbOMH1QMQ==
X-CSE-MsgGUID: 65aPUp9ETROHrKlW19tjNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="174826507"
Received: from dev.igk.intel.com ([10.211.135.225])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 02:20:23 -0700
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from
 __xe_exec_queue_init()
Date: Fri, 30 May 2025 10:48:56 +0200
Message-Id: <20250530084856.2612849-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.35.0
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

There is unmatched xe_vm_unlock() in the __xe_exec_queue_init().
Leftover from fbeaad071a98 ("drm/xe: Create LRC BO without VM")

Fixes: fbeaad071a98 ("drm/xe: Create LRC BO without VM")
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 32c6923df7c3..fee22358cc09 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -114,7 +114,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_vm *vm = q->vm;
 	int i, err;
 	u32 flags = 0;
 
@@ -136,7 +135,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
-			goto err_unlock;
+			goto err_lrc;
 		}
 	}
 
@@ -146,9 +145,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 
 	return 0;
 
-err_unlock:
-	if (vm)
-		xe_vm_unlock(vm);
 err_lrc:
 	for (i = i - 1; i >= 0; --i)
 		xe_lrc_put(q->lrc[i]);
-- 
2.35.0

