Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E1BC2BB85
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E8110E771;
	Tue, 18 Jun 2024 17:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9Mx76eP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D06C10E769;
 Tue, 18 Jun 2024 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718732812; x=1750268812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QkoqZAMAq/q3T/tF7cORjXPjeB5HXAtymHB7/mDFirM=;
 b=M9Mx76ePg/z4hPXM6I1TF+3nhKXcVsK8YDxDDJ2pdQaCOU0BJ3KH05Kk
 90P+21VvmE6bwlDZXeJFmoH3wGVQ9fotbOIM6WJJtSpsZfHlWYQFO56cj
 pvvDdT4DvmF9W3eFGpOtNOiTWVaSMhcI8BEFGlcBY8mGVIBRXNYSSnWjK
 bTDwZ0FAj+La6xUYsO+a8HWPZ5m37GtzwwSCVe3MsOplHhbBPaP3NjgTe
 PKlFDItBBcNrXJ1VcUPW3K/JgquG99TrVf3dZvwVGrsnoLpWt8dz8L3rJ
 J23dT6ftomckHnGtbUbKFJacP4NLJjIlsNsGhBRkFtfHmekhEoa9l10wc w==;
X-CSE-ConnectionGUID: ZiQtWgejR2uZadmV0AJ6CA==
X-CSE-MsgGUID: vhplU4XVTJW4xSK2AM9pgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15603469"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15603469"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:46:52 -0700
X-CSE-ConnectionGUID: E8MyB6GYRYSULntRZBRk+Q==
X-CSE-MsgGUID: r2Wer4AJQ1a0LCJ55YhERw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46004931"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:46:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH i-g-t v3 2/2] xe_exec_reset: Add timeslice preempt test
Date: Tue, 18 Jun 2024 10:47:28 -0700
Message-Id: <20240618174728.3336865-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618174728.3336865-1-matthew.brost@intel.com>
References: <20240618174728.3336865-1-matthew.brost@intel.com>
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

Add tests in which submit multiple preemptable spinners to same hardware
engine ensuring a cumulative longer timeout and validating the restart
paths in the DRM scheduler TDR (Timeout Detection and Recovery).

v3:
 - Spell out TDR (Kamal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_reset.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 5e9e48adda..144e3b3884 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -100,6 +100,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 #define PARALLEL			(0x1 << 4)
 #define CAT_ERROR			(0x1 << 5)
 #define PREEMPT				(0x1 << 6)
+#define CANCEL				(0x1 << 7)
 
 /**
  * SUBTEST: %s-cat-error
@@ -287,6 +288,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: cancel-preempt
  * Description: Test job cancel with a preemptable job
  *
+ * SUBTEST: cancel-timeslice-preempt
+ * Description: Test job cancel with 2 preemptable jobs
+ *
+ * SUBTEST: cancel-timeslice-many-preempt
+ * Description: Test job cancel with many preemptable jobs
+ *
  * SUBTEST: gt-reset
  * Description: Test GT reset
  *
@@ -361,7 +368,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i) {
+		if (!i || flags & CANCEL) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -411,7 +418,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	if (!(flags & GT_RESET)) {
+	if (!(flags & (GT_RESET | CANCEL))) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
@@ -746,6 +753,18 @@ igt_main
 			break;
 		}
 
+	igt_subtest("cancel-timeslice-preempt")
+		xe_for_each_engine(fd, hwe) {
+			test_legacy_mode(fd, hwe, 2, 2, CANCEL | PREEMPT);
+			break;
+		}
+
+	igt_subtest("cancel-timeslice-many-preempt")
+		xe_for_each_engine(fd, hwe) {
+			test_legacy_mode(fd, hwe, 4, 4, CANCEL | PREEMPT);
+			break;
+		}
+
 	igt_subtest("gt-reset")
 		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
-- 
2.34.1

