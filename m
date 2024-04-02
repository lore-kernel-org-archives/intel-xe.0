Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2913C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7219210FCBF;
	Tue,  2 Apr 2024 12:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbsUc2sa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0E10FCC3;
 Tue,  2 Apr 2024 12:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712059762; x=1743595762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KpXi4HJNf3mrlF0RgrYF7o9caqIeTsItHLAEgbLVq0A=;
 b=cbsUc2sa1q7lbumfkCFhs6yu1r9xLFzlzPh8lEdmSEHcpw+FQoFod0YM
 MqkLbyqTOFTOZABPpoN7ujDa5K5WNPsJ5mpILB7IYYmeVh7soFZJMeXDp
 W3KZULVWEEhCOqLXxfKWQDOT0JKKcXE00Qmj8gI8i8nUw94jKevIacYzz
 r77hNvVtGx3lZzlsxSRulFF2VCfzHhuDmBA4yEntiVu9DnUHieAw/k9zL
 BbPcHttKS9/RyYI9l9dBjxOr+EcOGS82gH9IMT5ZHhFlxU4ikA8Hs0DVC
 UThznKH9e9rV6bbdYg+JQnBA3L1qXWqs1owhCNZI6KLvxsOQ2JINKoG0N Q==;
X-CSE-ConnectionGUID: 7oan/BMnT9yXt8wB04Ppng==
X-CSE-MsgGUID: WxB7I2cfTYm2GmrzKj4N7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17842558"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17842558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:09:20 -0700
X-CSE-ConnectionGUID: DmiBAnHGQQa++1+cy7zqvA==
X-CSE-MsgGUID: 7GSKuqCpRUG+HBuEn7Dn3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="22702582"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2024 05:09:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset domain
 aware
Date: Tue,  2 Apr 2024 17:52:23 +0530
Message-Id: <20240402122223.643413-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

RCS/CCS are dependent engines as they are sharing reset
domain. Whenever there is reset from CCS, all the exec queues
running on RCS are victimised mainly on Lunarlake.

Lets skip parallel execution on CCS with RCS.

It helps in fixing following errors:
1. Test assertion failure function test_legacy_mode, file, Failed assertion: data[i].data == 0xc0ffee

2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0, error: -125 != 0

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 8083980f9..31af61dc9 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -710,6 +710,17 @@ static void *thread(void *data)
 	return NULL;
 }
 
+static bool is_engine_contexts_victimized(int fd, unsigned int flags)
+{
+	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
+		return false;
+
+	if (flags & HANG)
+		return true;
+
+	return false;
+}
+
 /**
  * SUBTEST: threads-%s
  * Description: Run threads %arg[1] test with multi threads
@@ -955,9 +966,13 @@ static void threads(int fd, int flags)
 	bool go = false;
 	int n_threads = 0;
 	int gt;
+	bool has_rcs = false;
 
-	xe_for_each_engine(fd, hwe)
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
+			has_rcs = true;
 		++n_engines;
+	}
 
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
@@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
+		/* RCS/CCS sharing reset domain hence dependent engines.
+		 * When CCS is doing reset, all the contexts of RCS are
+		 * victimized, so skip the compute engine avoiding
+		 * parallel execution with RCS
+		 */
+		if (has_rcs && hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
+		    is_engine_contexts_victimized(fd, flags))
+			continue;
+
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
-- 
2.25.1

