Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0819EC5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 14:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1A910E821;
	Fri, 30 May 2025 14:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eo8dDi1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A1E10E821
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748615264; x=1780151264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgRBuT+1FzTnaq3j9Xaph3AMGtKzXzqPF7LO2sjFCgY=;
 b=Eo8dDi1VjjtB60+xpSOz+Ftw/00CM73iSYSsVn1jkZyMfS1Icd3XQb5N
 fOjG56RhSHzfDBIo/FWR/pZj487QDccq2xTH4DcZpSxbPnsYs//TCvl8j
 xvHdvo7hiRL5L+pDlCu2k4wRfio+NoY76aLB+m0kcYLUbyTf8z7++b/vy
 MWa9xnRq/OZ0hfrkYPcukZG7F1K0hZE8QX+etloyfwmHlEbH78KxqQH1A
 OZryvWsWs4quKxJPI3fPeRuw+9EsT2x+HQlnIXhLdYHspGVMMdm+agKNS
 DuKictvBV1JmZDOEcwK5ClmXr88yuzgAwVZ4tyJ02spuET6JHK733PWoJ g==;
X-CSE-ConnectionGUID: zwU6ZfQNRYCxoX2IP9KUwA==
X-CSE-MsgGUID: 1N4cMFZeTy+JiCl1eD3W6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68135142"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="68135142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:27:39 -0700
X-CSE-ConnectionGUID: WJz0rZmoSnCz2HD1Afs+hg==
X-CSE-MsgGUID: oJUfqXjfT86AsxIoUYxiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="148676926"
Received: from dev.igk.intel.com ([10.211.135.225])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:27:38 -0700
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, jonathan.cavitt@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from
 __xe_exec_queue_init()
Date: Fri, 30 May 2025 15:56:27 +0200
Message-Id: <20250530135627.2821612-1-maciej.patelczyk@intel.com>
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
Leftover from commit fbeaad071a98 ("drm/xe: Create LRC BO without VM")

Fixes: fbeaad071a98 ("drm/xe: Create LRC BO without VM")
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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

