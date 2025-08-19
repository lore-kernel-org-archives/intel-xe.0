Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECAFCA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 18:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC35210E64C;
	Tue, 19 Aug 2025 18:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLDvrgrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5A10E64C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 18:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755629057; x=1787165057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omG5icYrhGLPisdp81DkakML15Xpln8tYe7Lnm5uZUU=;
 b=MLDvrgrDKX4T2SK0mkaOEsUR0AGBInUaPb/x4LBHMNnkJYYY5rFd7R5R
 ep5S9HKRWEzMRUf3CGnhdRWw3zFCvPVsNPt/hn9RP+YKTc4p9lF3cK4Yv
 0W7v3kYX6+xJlNPQ25pdi9PpK9Oa97lyslaMgGIZFGbOTummdofSM/r+d
 IDE1GhLYSE4u5l0IkwIBDoaWd8qD49hZBgPVweoZN2b/6bivxZnjxaTRG
 VlksDBeY1rxGMWA4wvOzY1evlQaBtk/rPx4omb08vqM5Y537Wbow5N0JJ
 ZXIN0ieN186AIWdFnBxaw17tPAb6Upc92x6RQ/ZqmYGVjgqw4xUk2LBrA A==;
X-CSE-ConnectionGUID: 1lf+gpDYQB2wRItwzeUINw==
X-CSE-MsgGUID: gUHZgBU+SDuKOW0IKq1w2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75338165"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="75338165"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:44:17 -0700
X-CSE-ConnectionGUID: X7gj6Tx0QmqZ7PQGjMB0tA==
X-CSE-MsgGUID: ZzezYbSXRTuWmCOQgSZuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="191615694"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:44:15 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/1] Fix user-fence race issue
Date: Tue, 19 Aug 2025 20:44:03 +0200
Message-ID: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

I'm adding this cover-letter to explain the reproduction path which
might be useful for reviewers.

Following patch immediately triggers the race. Delay introduced after
writing to signal user-fence reveals it influences on next vm-bind
operation, especially if it is in a sequence:

vm-bind(MAP, addr, ..., ufence)
wait_ufence(ufence)
vm-bind(UNMAP, addr, ..., NULL)

UNMAP operation may start before ufence is released (because it is
part of user_fence_worker()) so we get -EBUSY trying to operate on
same vma (this happens on MAP).

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 8becc3755649..d980b447b014 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -9,6 +9,7 @@
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
+#include <linux/delay.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
@@ -81,6 +82,7 @@ static void user_fence_worker(struct work_struct *w)
                kthread_use_mm(ufence->mm);
                if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
                        XE_WARN_ON("Copy to user failed");
+               usleep_range(25000, 30000);
                kthread_unuse_mm(ufence->mm);
                mmput(ufence->mm);
        } else {

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (1):
  drm/xe/xe_sync: avoid race during ufence signaling

 drivers/gpu/drm/xe/xe_sync.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.43.0

