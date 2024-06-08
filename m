Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251EBC27C55
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9433A10E232;
	Sat,  8 Jun 2024 00:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPFwaSra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA7610E013;
 Sat,  8 Jun 2024 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717805499; x=1749341499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dut9oLJfGzvU6gTv6T0ojK0p734+d8g9GkFb/WfwI08=;
 b=gPFwaSrabktqhMoVUKFfcZ4gUUQfuL0E/0HkaQPK2unUyeOEvVysWGyU
 dwtq69gpFV2Dx3jJHmoMP/ULsIDPHteKzL+4gAd7Sq841R/PRi1qQjcT1
 3LYoZzX+HkJu85R9ZpLRl9CEYMQUvSYeZELlCUFh9F1bEGmMRM9qi7NAP
 nqFFh4Hi5c5tyKmtpyD41j5HNvnRnqfj+4PFn/zZxbTV/jQBAazrHcUy7
 42QYcgVjACzAVuTvBYaEku4a+68GzcMw3q7xLWT+SeOSnw072q+j8jcdJ
 T8mTLz8azry6cMrDPqBTY7jAaNjU96p9g1moU0GPjJwnW24zr8raIF1vo A==;
X-CSE-ConnectionGUID: H6g7CSQRRPSat09Tvj1Qjg==
X-CSE-MsgGUID: hmmy5FnwRheM/72btb558w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11971594"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="11971594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:11:38 -0700
X-CSE-ConnectionGUID: MoIqtsJlRnmdwwlWpOeyfA==
X-CSE-MsgGUID: LJQ5tlD1RxqNroI1D4rWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38425423"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:11:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/2] xe_exec_reset: Add timeslice preempt test
Date: Fri,  7 Jun 2024 17:12:11 -0700
Message-Id: <20240608001211.2365347-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608001211.2365347-1-matthew.brost@intel.com>
References: <20240608001211.2365347-1-matthew.brost@intel.com>
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
paths in the TDR.

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

