Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5BDCD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846AA10F351;
	Thu, 14 May 2026 21:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpaklJ0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDC610E61A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795118; x=1810331118;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hQ2A6D2HJI8lOm/JWkDq/kAN8+b+8wHcNve8wfU6AUI=;
 b=MpaklJ0lTMpQIYvFSSFPtSnC5ATvl1zzixdidOq8epM1GJyjMuJyWwbc
 6a98QfgJPkb2lRaseZwFOR/gMpGbuCOVdsWA3ZthMBtzZjmt7VoCfof4o
 VhCsCwByBD4FO8zyKdy1NRhIPimUA8cZCnZy5gbz2k3tkdVuKHQGONTUZ
 rDpeCs0QoqHH0n77PwQmrUhRgxBI0+DPAxjtts2qd34ma2saBYBw9D+/F
 TBWniX0ZIupiyZCAHiaC/Lis245lC5AUqkWYB3eDY5KoDi4cB2TtxQviY
 THu4PZ4+b+GFRfjtKUqXMr5VG0NPG+mfWRRerVykykBmjrCY65sm/aerB Q==;
X-CSE-ConnectionGUID: Q5GXrKnlRcOJjERuj3jE4w==
X-CSE-MsgGUID: KM+z28nlSCu5wNDxj58aEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277257"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:18 -0700
X-CSE-ConnectionGUID: kfjQJ0cTTuClpni4kNWPZw==
X-CSE-MsgGUID: gCHhjEdWRiGkcJuOKH/G3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613198"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:16 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 18:44:47 -0300
Subject: [PATCH v3 4/7] drm/xe: Extract xe_hw_engine_setup_reg_lrc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rtp-mcr-check-v3-4-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

The steps for processing RTP rules that build up an engine's reg_lrc
arguably belongs to xe_hw_engine.c and should be encapsulated into a
function in that unit.

Move that logic to a new function called xe_hw_engine_setup_reg_lrc().

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
With the dropping of patch "drm/xe/kunit: Include hw_engines in xe_wa
test" from v1, this patch is not really required anymore, but it is a
good refactor IMO, so I decided to keep it in the series.
---
 drivers/gpu/drm/xe/xe_gt.c        |  5 +----
 drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine.h |  2 +-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cdc678d1ae1f..c4b25daad542 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -393,10 +393,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		if (gt->default_lrc[hwe->class])
 			continue;
 
-		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
-		xe_wa_process_lrc(hwe);
-		xe_hw_engine_setup_default_lrc_state(hwe);
-		xe_tuning_process_lrc(hwe);
+		xe_hw_engine_setup_reg_lrc(hwe);
 
 		default_lrc = drmm_kzalloc(&xe->drm,
 					   xe_gt_lrc_size(gt, hwe->class),
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..05f0932dbb94 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -337,8 +337,8 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
 	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
 }
 
-void
-xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
+static void
+hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
 	const u8 mocs_write_idx = gt->mocs.uc_index;
@@ -375,6 +375,17 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 			     &hwe->reg_lrc, true);
 }
 
+void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
+	xe_wa_process_lrc(hwe);
+	hw_engine_setup_default_lrc_state(hwe);
+	xe_tuning_process_lrc(hwe);
+}
+
 static void
 hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index ee9218773b51..c3ee37f8cfc0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -59,7 +59,7 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
 void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
-void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
+void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
 

-- 
2.53.0

