Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56698C27C65
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A1710E1CF;
	Sat,  8 Jun 2024 00:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEZQcNg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3619410E043;
 Sat,  8 Jun 2024 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717805499; x=1749341499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C36sOMc8pqHHaYzfgFMAH5KJg3ux7ZPafsPhcwAcoLc=;
 b=FEZQcNg/xRPAWzORMjwqRzXZrznOnj9CmLTZvzXMiPfbCeTcthXck4H8
 TgLr7ZbzXukv5GosM1vqy305C/cvisCt+HALHDPC2MfnQ+z+AfL9deU9D
 lUnW8GolWpwEJM2NbOYkOyYmnBDA4gCxrhBwkrZN9b9PYxZpk3j28zA2C
 CFRj+417fLV/Ocl1hScbsvrNkrMMbVxAeG4kcJU3J4DZfMEdU83ffadjy
 vNUnGU2WXy2P7mYXcG0zcjOJ6p80Cq6vqkILZozp/JE5evIcGDOUeMbFc
 15XMMjI1iUI/I9aoTR4HRGNtdMF4PAIJ/haLh302HXPNo0PKm9usVhn9r g==;
X-CSE-ConnectionGUID: 3mv9FT5BTMqWRVYJj/mk7w==
X-CSE-MsgGUID: qS6K0+qxTyW9wg+chfLqQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11971593"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="11971593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:11:38 -0700
X-CSE-ConnectionGUID: V7THm297SCG6tQOdsmnfDA==
X-CSE-MsgGUID: VUDvKZ5gRNeq8VOo0WzNqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38425421"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:11:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/2] xe_exec_reset: Add job cancel tests
Date: Fri,  7 Jun 2024 17:12:10 -0700
Message-Id: <20240608001211.2365347-2-matthew.brost@intel.com>
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

This test has pulled out when the ability to set the job timeout via
IOCTL was removed from the uAPI while upstreaming Xe. Add this coverage
back in but only run on a single hardware engine given by default jobs
take 5 seconds to timeout.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_reset.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 8d731e6893..5e9e48adda 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -99,6 +99,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 #define VIRTUAL				(0x1 << 3)
 #define PARALLEL			(0x1 << 4)
 #define CAT_ERROR			(0x1 << 5)
+#define PREEMPT				(0x1 << 6)
 
 /**
  * SUBTEST: %s-cat-error
@@ -280,6 +281,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: cat-error
  * Description: Test cat error
  *
+ * SUBTEST: cancel
+ * Description: Test job cancel
+ *
+ * SUBTEST: cancel-preempt
+ * Description: Test job cancel with a preemptable job
+ *
  * SUBTEST: gt-reset
  * Description: Test GT reset
  *
@@ -318,7 +325,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = false };
+	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
 	int i, b;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
@@ -727,6 +734,18 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
 
+	igt_subtest("cancel")
+		xe_for_each_engine(fd, hwe) {
+			test_legacy_mode(fd, hwe, 1, 1, 0);
+			break;
+		}
+
+	igt_subtest("cancel-preempt")
+		xe_for_each_engine(fd, hwe) {
+			test_legacy_mode(fd, hwe, 1, 1, PREEMPT);
+			break;
+		}
+
 	igt_subtest("gt-reset")
 		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
-- 
2.34.1

