Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66578D767CB
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 10:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD3A10E46E;
	Fri, 19 Dec 2025 10:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXPeWB1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29E810E46E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 10:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766141361; x=1797677361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OR1k4o3dsDcWLutPkGyvrr5+FGt4PGDtU14zvSX6DBI=;
 b=NXPeWB1xkZXqi4O4WuHBHQuJ1NZ/1Bm4yJl2sbDCbbKNyJfoIZDKdMTC
 bOtBaY7YyA0eXRXmlGL4Wr9bRvk+bBXqeP7GALdwsMGH/2p5I7+a89Q9/
 kWoCxF1/y5q/4n7Ie0m4nI3Vod99r4dRk02c/kaHL8GQ8s6Khg8cHXGra
 L28aaUM27hjLHHzQZMMhRDi6qiYxoLTBERSUXpZxADWLjLRL9Dx2vraex
 VmiAHMBNJZ6T/cJEeHFZBWFNAPoQmili97ogxgd2OI3vbB3/sa+4JeicE
 0+MO8HvzpAUar0SoaSPHh2w5Rs666Gdn4EAES9Muq70jH7/EGy9Qh4UWM w==;
X-CSE-ConnectionGUID: GU9gOMZGS5KXkWB1oAF+Eg==
X-CSE-MsgGUID: 5KW3I6aAR6alsH8MquDkyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79469806"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79469806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:49:21 -0800
X-CSE-ConnectionGUID: Ey/IYvfcSReRlKCjc1x55w==
X-CSE-MsgGUID: 6ue5WZIhTKOz7OFcxU584g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="197981602"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.207])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:49:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC v1] drm/xe/migrate: Configure migration queue as low latency
Date: Fri, 19 Dec 2025 11:49:03 +0100
Message-ID: <20251219104903.291774-1-francois.dugast@intel.com>
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

Commit 5488bec96bcc ("drm/xe/uapi: Use hint for guc to set GT frequency")
introduced low latency hint for use by user space when creating an exec
queue. This instructs SLPC to ramp the GT frequency aggressively.

SVM relies on an internal exec queue to migrate memory upon page faults.
This change creates this exec queue with the low latency hint to speed up
migration.

This should not impact systems where GT frequency is set over sysfs, or
with long running workloads which give enough time for the frequency to
ramp up. An example of memory access pattern that shows an improvement of
SVM performance is running hundreds of times IGT eu-fault-2m-once-device
in xe_exec_system_allocator. The copy duration provided by GT stats in
svm_2M_device_copy_us shows per GPU page fault:
    ~ 165 μs without low latency hint
    ~ 130 μs with low latency hint

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f3b66b55acfb..878b13f27be4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -471,7 +471,8 @@ int xe_migrate_init(struct xe_migrate *m)
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
 					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
-					    EXEC_QUEUE_FLAG_MIGRATE, 0);
+					    EXEC_QUEUE_FLAG_MIGRATE |
+					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
 	} else {
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
-- 
2.43.0

