Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA13C98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320F10E26A;
	Fri, 16 Jan 2026 22:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O10jIL/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1BD10E26A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601568; x=1800137568;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yYa9cFMx0Q+gs8UZe9RHF3lBTSFu48Oi9kTImFg1woA=;
 b=O10jIL/8mlsSEjH31eH+yaIVzWXaHVbdv3oVTtITK6M6dqybKnG5xgmr
 w4EpLfUmtu6LSMEwuPTmMJjwDTIXA4o0anB4JkSgMlDOJrSPhi0Jqq/s9
 2jY/vEh/KTCR3wcngLsYvE1kVhH+IGgLebfNBpbxNx5jNR3tjRgSb+GIL
 tkOE3mVAEpUferkeWqcsS8vTTUMivNFMzdl7RDGIzlQoelod5LZEu+hrV
 ay5XlsHfpT+co+7NFe7Is13fcfVBMamJ+4OMXc8Rf/O35JcO7NSGMQiFx
 cHA7VPnUZk6hcf9enpyp81RpH4nxg8+r9ETv2hkG086lADCweV2qyYD+x A==;
X-CSE-ConnectionGUID: QJfLdekORCWD5/KXICRgPw==
X-CSE-MsgGUID: I41HMU/UTvWoZVzCYrG/IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69123026"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69123026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:48 -0800
X-CSE-ConnectionGUID: CFVjxBncSsqnzmWbGEdmPA==
X-CSE-MsgGUID: 7L1gjC+eRV29JUK/e51YRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204961800"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:12:48 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 16 Jan 2026 19:12:15 -0300
Subject: [PATCH 07/12] drm/xe: Extract xe_hw_engine_setup_reg_lrc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rtp-mcr-check-v1-7-d420b9c1a327@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
function.  Furthermore, we will want to use that function and avoid
calling xe_gt_record_default_lrcs() in upcoming changes to xe_wa_test.c.

Move that logic to a new function called xe_hw_engine_setup_reg_lrc().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |  5 +----
 drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine.h |  2 +-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9d090d0f2438..68cd26286956 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -348,10 +348,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
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
index 4d3ee5226e3a..8d239291bc7b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -374,8 +374,8 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
 	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
 }
 
-void
-xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
+static void
+hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
 	const u8 mocs_write_idx = gt->mocs.uc_index;
@@ -411,6 +411,17 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), &hwe->reg_lrc);
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
index 6b5f9fa2a594..7e897620db65 100644
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
2.52.0

