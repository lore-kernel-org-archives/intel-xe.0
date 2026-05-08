Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCDCD37B2
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 21:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1310F60F;
	Fri,  8 May 2026 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1GGDMIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666310F60D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778276577; x=1809812577;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hQ2A6D2HJI8lOm/JWkDq/kAN8+b+8wHcNve8wfU6AUI=;
 b=a1GGDMIYd9d8JCtWJFrBGoTjWjrARA2JlUwyPmCy0GgbEeyvoWOF1aF3
 RihSBzIkL7KT0fssJkfwJG0EaCV2JC7DHB3qZOCACw5ZNJAZVoU8tzOSv
 pCTtw8fDAtn+SPu3F9piODQKaXK04KATHozotvfN9iDEUaF70mnl+4PBt
 FZHeYAFMDdI172T36Wns+51l6cLg8y8aCGgcFIt9Fyk1eEAZAbPg2xwJ0
 BEgRB9IVN7qE3CCc47fgC5BGBTpjad1MSUFVOx+euhMYwJ/ozhsxCagd8
 L6d/nlVP3VgB+bxFadmd4ld/jfhD0PHzhMc2W040P+63pWzjwIl5gxomx w==;
X-CSE-ConnectionGUID: /BLRQKRtR1mdf8OnJt//gw==
X-CSE-MsgGUID: ayfAmsEUTxuOAoFw5kf7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90635993"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="90635993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:57 -0700
X-CSE-ConnectionGUID: 1MF9+JU8SA28lQeugZKN0A==
X-CSE-MsgGUID: E0c5RxVTSyGFkeSSN/wW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="267244248"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 14:42:55 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 08 May 2026 18:42:35 -0300
Subject: [PATCH v2 5/8] drm/xe: Extract xe_hw_engine_setup_reg_lrc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rtp-mcr-check-v2-5-9897b147a5d2@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
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

