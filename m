Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29120FD9E2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 01:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F0C10E0D2;
	Fri, 27 Feb 2026 01:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV2IRe9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E0610E0C4
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 01:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772157152; x=1803693152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L5F9A+FsGe841uZMlWDyMzsG07L5fZRaqsw4/NE32XY=;
 b=AV2IRe9BJ+1Tk3nnNdM0BDqvj3EC4/U+z7Pc2k2Sc4ut6/VtlCJMXLk/
 hq4Ve/7nmO9tqDYqSXcm9nuU8ozuwEjjuQ0WdY75FaiHuCGjKB/NMSUw+
 bszoByhGlPgJtrlavXA2nmT3Gh3+ip4kgMF7DbZRJrpnffCir1z0vOym9
 4yBkOs+qr9WJRqaVGfrE8eUAYgtZ2mkBKeEyX7WdA8MZ8pz9LUb4Dkftu
 LtMenuk+lp+eTIqgNamtHRanvZg7izaBYqGWiA7YsUTuPPpzOa2e7I8f/
 4YMMRCAEFt9YPj+PkOYZOT0yC9s+bX6imoeLuj9F2RnKrLI2AbTZVed15 g==;
X-CSE-ConnectionGUID: M1sN4QCnRGuDLL4BZQT+aQ==
X-CSE-MsgGUID: VURiesLLRh+cOq2kQtnRrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72268414"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="72268414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 17:52:31 -0800
X-CSE-ConnectionGUID: JfDdRbvMQliV9W4qSSj2gg==
X-CSE-MsgGUID: ZEvMzPkzQn64vh2USNBI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="239739765"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 17:52:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/xe: Disable garbage collector work item on SVM close
Date: Thu, 26 Feb 2026 17:52:25 -0800
Message-Id: <20260227015225.3081787-1-matthew.brost@intel.com>
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

When an SVM is closed, the garbage collector work item must be stopped
synchronously and any future queuing must be prevented. Replace
flush_work() with disable_work_sync() to ensure both conditions are
met.

Fixes: 63f6e480d115 ("drm/xe: Add SVM garbage collector")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 002b6c22ad3f..f8b57eca76fd 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -903,7 +903,7 @@ int xe_svm_init(struct xe_vm *vm)
 void xe_svm_close(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
-	flush_work(&vm->svm.garbage_collector.work);
+	disable_work_sync(&vm->svm.garbage_collector.work);
 	xe_svm_put_pagemaps(vm);
 	drm_pagemap_release_owner(&vm->svm.peer);
 }
-- 
2.34.1

