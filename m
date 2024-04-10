Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9194FCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 09:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BFB10E869;
	Wed, 10 Apr 2024 09:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs8G9jnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7505A10E5C7;
 Wed, 10 Apr 2024 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712741261; x=1744277261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OINPhtRBxrjwl34cXdmZuj0Rdu4oeFqzELqtiE0sV54=;
 b=Cs8G9jnlzhGrrrp275Gm4tCeEbe1p3O4dcaQyCyU/9wS3zpubZRVRCWe
 SOMcphgsAxuMeWFjYJXMGjsM8dRUjTsdaRg9hWfJBTNjJsyznpRncdJS1
 WBsUFd8O1hwPk4MJASZU+qO0jAHocTf7AHr4CKjAMjcyz91HlqztJ7OJz
 17Z5S0r1xtHXnXUL0hU/Te65PEa+cm+mgJzGlfuQhMUgdy29N4Wec6NmL
 oqpinBwDxi/qV2uEvZ56ddYp8Y2tlXkhFtPfqh5TO7LYoqHTpg+hAlqyL
 j1WRWA7WEEODKRi1/HzNLxEhApsUZe5LRfVy9oPscvtA6U3FNxlNE12oh A==;
X-CSE-ConnectionGUID: qeni6bi3TfKB4iSAgP5bQg==
X-CSE-MsgGUID: gwC28GlqT8uRCn/p0HhdgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19481029"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19481029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 02:27:40 -0700
X-CSE-ConnectionGUID: mRRr/N3NS9acSiv/SH/X4w==
X-CSE-MsgGUID: ht/EjKWbR769FYn2Rvt0vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25280157"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005.jf.intel.com with ESMTP; 10 Apr 2024 02:27:38 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 i-g-t] tests/xe_exec_threads: Make hang tests reset domain
 aware
Date: Wed, 10 Apr 2024 15:10:52 +0530
Message-Id: <20240410094052.1033721-1-tejas.upadhyay@intel.com>
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

V3:
  - Check victimization reset domain wise irrespective of platform - Lucas/MattR
V2:
  - Add error details

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_exec_threads.c | 43 ++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 8083980f9..24eac39de 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -710,6 +710,24 @@ static void *thread(void *data)
 	return NULL;
 }
 
+static bool is_engine_contexts_victimized(__u16 eclass, unsigned int flags,
+					  bool has_rcs, bool multi_ccs,
+					  bool *ccs0_created)
+{
+	if (!(eclass == DRM_XE_ENGINE_CLASS_COMPUTE && flags & HANG))
+		return false;
+	if (has_rcs) {
+		return true;
+	} else if (multi_ccs) {
+		/* In case of multi ccs, allow only 1 ccs to run HANG test*/
+		if (*ccs0_created)
+			return true;
+		*ccs0_created = true;
+	}
+
+	return false;
+}
+
 /**
  * SUBTEST: threads-%s
  * Description: Run threads %arg[1] test with multi threads
@@ -955,9 +973,20 @@ static void threads(int fd, int flags)
 	bool go = false;
 	int n_threads = 0;
 	int gt;
+	bool has_rcs = false;
+	bool multi_ccs = false, has_ccs = false, ccs0_created = false;
 
-	xe_for_each_engine(fd, hwe)
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
+			has_rcs = true;
+		} else if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+			if (has_ccs)
+				multi_ccs = true;
+			else
+				has_ccs = true;
+		}
 		++n_engines;
+	}
 
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
@@ -990,6 +1019,18 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
+		/* RCS/CCS sharing reset domain hence dependent engines.
+		 * When CCS is doing reset, all the contexts of RCS are
+		 * victimized. Also in case of multiple CCS instances
+		 * contexts running on other CCS engine are victimized.
+		 * so skip the compute engine avoiding parallel execution
+		 * with RCS and other CCS.
+		 */
+		if (is_engine_contexts_victimized(hwe->engine_class, flags,
+						  has_rcs, multi_ccs,
+						  &ccs0_created))
+			continue;
+
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
-- 
2.25.1

