Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6891DCF58C2
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 03:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360E510E799;
	Fri, 20 Sep 2024 03:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vm0JLBy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31E10E785
 for <Intel-Xe@lists.freedesktop.org>; Fri, 20 Sep 2024 03:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802470; x=1758338470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgTYRvbNN6vtdOgxWqXoi+clJRO6dmTcyaYBqjo+4BA=;
 b=Vm0JLBy0FhsasFnzUv51F+0aiJReunIRMq0MkrJ1+QPPDn7/DYtylNpH
 wRALY1Y9/xQ7tLWYGXyT8vSSugYPC/qFbYJO2gPuLxU9K6iTV2kpHtq7V
 ZDLCfkgVvQMgxKIisR8xKOlTRwRvYxzWlf6RtlOVdG0hoyknxv6zxge0R
 k5DMPFw8Exmk1dAkQkEbOMoSYpsCS485pwCvL5J52zMqCUMek0Om90kBr
 YRLlCGsM94eZZJl31GAOLnoe9eb+lQ2WsK4N8OW4U8yYLOmyFSacEA5Z0
 +5CQ8Uokgzrp1NTFbz6pT+apTq/tobRHju57nNECB7d3aUVubFjQq1SrA Q==;
X-CSE-ConnectionGUID: t9LDsoX0TIW7DgkMcRnQ6Q==
X-CSE-MsgGUID: gsGPparBQC65N3gwmYBxfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25983960"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25983960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:21:10 -0700
X-CSE-ConnectionGUID: NBjA8m4nSnKnNF4KJCWJCg==
X-CSE-MsgGUID: SzRjpXKyRnSWU3ohYh46dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="74504446"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2024 20:21:09 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v8 03/11] drm/xe/devcoredump: Improve section headings and add
 tile info
Date: Thu, 19 Sep 2024 20:21:00 -0700
Message-ID: <20240920032108.629796-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920032108.629796-1-John.C.Harrison@Intel.com>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The xe_guc_exec_queue_snapshot is not really a GuC internal thing and
is definitely not a GuC CT thing. So give it its own section heading.
The snapshot itself is really a capture of the submission backend's
internal state. Although all it currently prints out is the submission
contexts. So label it as 'Contexts'. If more general state is added
later then it could be change to 'Submission backend' or some such.

Further, everything from the GuC CT section onwards is GT specific but
there was no indication of which GT it was related to (and that is
impossible to work out from the other fields that are given). So add a
GT section heading. Also include the tile id of the GT, because again
significant information.

Lastly, drop a couple of unnecessary line feeds within sections.

v2: Add GT section heading, add tile id to device section.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 5 +++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 ++-
 drivers/gpu/drm/xe/xe_device.c            | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c        | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         | 1 -
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d23719d5c2a3..2690f1d1cde4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -96,8 +96,13 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
+	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
+	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
+
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->ct, &p);
+
+	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
 	drm_puts(&p, "\n**** Job ****\n");
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 440d05d77a5a..3cc2f095fdfb 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -37,7 +37,8 @@ struct xe_devcoredump_snapshot {
 	/* GuC snapshots */
 	/** @ct: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
-	/** @ge: Guc Engine snapshot */
+
+	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 
 	/** @hwe: HW Engine snapshot array */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..178e5346979c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -955,6 +955,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 
 	for_each_gt(gt, xe, id) {
 		drm_printf(p, "GT id: %u\n", id);
+		drm_printf(p, "\tTile: %u\n", gt->tile->id);
 		drm_printf(p, "\tType: %s\n",
 			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
 		drm_printf(p, "\tIP ver: %u.%u.%u\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a98b85129076..4bc5793f627b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2209,7 +2209,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	if (!snapshot)
 		return;
 
-	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
 	drm_printf(p, "\tName: %s\n", snapshot->name);
 	drm_printf(p, "\tClass: %d\n", snapshot->class);
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a7abc4b67e67..3ae3713f503b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1057,7 +1057,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
-	drm_puts(p, "\n");
 }
 
 /**
-- 
2.46.0

