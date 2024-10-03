Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059F0CF854C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123D10E79F;
	Thu,  3 Oct 2024 00:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCFcmaDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A2810E07D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727916373; x=1759452373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SdSVNSQfKK53W0QGpaAEYbV9ISepnM6Gb1C0AkbPTQ=;
 b=fCFcmaDIQgBFDkIYWactFmXDLzdkCzzY6NTszzNV05EFI7gvifQdx6JH
 YwtKl4CTdfxJpNPQMxIZXvq9WB4X+JdrAfugq2azoqnisuoJ5XFMI+2BF
 0ZnMskg9NFNzdRllAaGmywvfx44RNEF0CBDcTuAIPlEDOnGgkh/R9dwGT
 40TlcpLmYdlMauhAnlLsYfVsvNQKnACBYICDyQiUhf+gAtsGnZJteXpyT
 zpnIRHSYdITQyLZEK6Ub67EZ3em+GgD/agfWRH+jqgk5CxHx0eRY+JyAl
 x3ZxKFN8O2pVbJvySuyaIDzMJaPaV8M8JZi2crKfUx79bn8wPdlkdodCI A==;
X-CSE-ConnectionGUID: JBtYyv7HQdOEzCQD/3ZHpQ==
X-CSE-MsgGUID: ElY06IbKSiC2AsRILjDRow==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38460022"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38460022"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:46:12 -0700
X-CSE-ConnectionGUID: pvFWscYTR5SjhKiZAGYdcg==
X-CSE-MsgGUID: Uj/0U9fSRr+0LTzcfNTBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="97514737"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 17:46:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and add
 tile info
Date: Wed,  2 Oct 2024 17:46:03 -0700
Message-ID: <20241003004611.2323493-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
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
index 09a7ad830e69..030cf703e970 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -961,6 +961,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 
 	for_each_gt(gt, xe, id) {
 		drm_printf(p, "GT id: %u\n", id);
+		drm_printf(p, "\tTile: %u\n", gt->tile->id);
 		drm_printf(p, "\tType: %s\n",
 			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
 		drm_printf(p, "\tIP ver: %u.%u.%u\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0ac4a19ec9cc..8690df699170 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2240,7 +2240,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	if (!snapshot)
 		return;
 
-	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
 	drm_printf(p, "\tName: %s\n", snapshot->name);
 	drm_printf(p, "\tClass: %d\n", snapshot->class);
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ea6d9ef7fab6..6c9c27304cdc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1084,7 +1084,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
-	drm_puts(p, "\n");
 }
 
 /**
-- 
2.46.0

