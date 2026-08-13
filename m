Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE5CC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402BE10F349;
	Thu, 13 Aug 2026 13:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UC44CNxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB34410F349
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627877; x=1818163877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dNbXPpwVSBsDMOmbfSnRjOJN2huzE9neeSV9w8jt/rQ=;
 b=UC44CNxrnMYQ6ADvUoXHnIC2sXnZqA4Vl4G0en+aIFRJqAZ2MRxWbIz+
 D3rFkGqjt0Np6h8Kvriejc+dcvPUAYo35+eiRPjxmF54OZqGud/B3R7ap
 LcSg/u+5cSUy3NYmwc4ie+BgDRud1mbrig71AzQapW/KwUiehh6qIvIM3
 lfmZGCK2etnPTfmTwknmTFE4Zk1ASTjYK3HfrbFENhhHI8KnhkuEWWb5w
 U48aTUxGLHUTHIrcmFKeHMiDtV4DCKPIESbPdY/tg9eiQCoiCRygUHy8G
 RvDXI4a1jPqnRO2ea8sy8xmvRrRLDM1Bw/G7Jd+lmUVaKLB0zBIGMlOen g==;
X-CSE-ConnectionGUID: KJ61GByDQXybaX2+Liia5Q==
X-CSE-MsgGUID: sgK/h9DCRzy4JZ47XWZ0vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547721"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:17 -0700
X-CSE-ConnectionGUID: 53UIg3lUSOefdUKaNM0hhg==
X-CSE-MsgGUID: YRPoQwZvQKqvypuTbT2ffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207358"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:15 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 4/6] drm/xe: dump GAM page fault report registers in
 devcoredump
Date: Thu, 13 Aug 2026 19:00:35 +0530
Message-ID: <20260813133037.2912699-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

Add PAGE_FLTRPTQ_HEAD_GAMCTRL and PAGE_FLTRPTQ_TAIL_GAMCTRL to the Xe
register definitions and capture them as part of the devcoredump
snapshot.

Include the register dump in the devcoredump output and release the
snapshot during cleanup so page fault report state is available for
post-mortem debugging.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 +++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 25 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 959b1129fd50..25014bccd3a6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -505,6 +505,9 @@
 #define   LMEM_EN				REG_BIT(31)
 #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
 
+#define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
+#define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index b339d4035628..6cc4e3969417 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -128,6 +128,11 @@ static const struct xe_reg_desc xe3p_media_gt_fuse_reglist[] = {
 	{ RPM_GCD_MEDIA, "RPM_GCD_MEDIA" },
 };
 
+static const struct xe_reg_desc xe3p_gam_pf_reglist[] = {
+	{ PAGE_FLTRPTQ_HEAD_GAMCTRL, "PAGE_FLTRPTQ_HEAD_GAMCTRL"},
+	{ PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"},
+};
+
 /**
  * struct xe_reg_desc_list - Struct for register descriptor list
  *
@@ -248,6 +253,19 @@ static struct xe_dbg_reg_snapshot *xe_media_gt_guc_reg_snapshot_capture(struct x
 	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
 }
 
+static struct xe_dbg_reg_snapshot *xe_gam_pf_report_capture(struct xe_gt *gt)
+{
+	struct xe_reg_desc_list reg_list;
+
+	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	reg_list.regs = xe3p_gam_pf_reglist;
+	reg_list.num_regs = ARRAY_SIZE(xe3p_gam_pf_reglist);
+
+	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -308,6 +326,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
+	drm_printf(&p, "\n**** GAM PF Report ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->gam_pf_report);
+
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
@@ -354,6 +375,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
+	ss->gam_pf_report = NULL;
+
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
 
@@ -557,6 +581,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->media_gt_guc_reg = xe_media_gt_guc_reg_snapshot_capture(q->gt);
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+	ss->gam_pf_report = xe_gam_pf_report_capture(q->gt);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 	if (job)
 		ss->job = xe_sched_job_snapshot_capture(job);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 28b505176657..893eadd68a3d 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -86,6 +86,9 @@ struct xe_devcoredump_snapshot {
 		struct xe_guc_log_snapshot *log;
 	} guc;
 
+	/** @gam_pf_report: GAM PF report snapshot */
+	struct xe_dbg_reg_snapshot *gam_pf_report;
+
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 
-- 
2.43.0

