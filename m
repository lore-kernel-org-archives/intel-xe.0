Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E744ECCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8171410EA82;
	Thu, 30 Oct 2025 22:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4m6m4aY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B6210EA69
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761862661; x=1793398661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+GiiV/eIC4uEOJR1aA6aQjHeqYQr6lq6KyRlLDwTKYY=;
 b=Q4m6m4aYomQcI+myh85+jQq0v96fOAoAYvUBDB+Scih+XZPi8W2bngm/
 HaHQMyRMAXCBrS2m1gGzLN9blElWmTlQRy2BovlwaTM6IH7r5TLtLM/VY
 I7sESnvJiju4r+A46Syv9MJNYhjafVLAmD3kvnXvZPsarrD7iKHufpSC4
 ekqXLI0q+f+rRRMXiGusnjblD6XnBI5qEJXcjBVtJlZEiPLcdHjOPmiGQ
 uWllX7NpvYEUemhevZw9mX88jwGUTqJJPSzj0+qo8nGEai0R0fB+VnbkF
 oXGLZYhfxwMysST4V+D4N/d1WzjBQUszR1Kl6DnM2ALbcZAXBXtb2EOwc g==;
X-CSE-ConnectionGUID: eKCBSsEZSPu0UjmnyCulJg==
X-CSE-MsgGUID: wGcW8DdoTVG3rqzbl9yJQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86644205"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="86644205"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:17:36 -0700
X-CSE-ConnectionGUID: icHZK1ZvRaaGOlUyw2qazA==
X-CSE-MsgGUID: OVQMStMJTxaEOhKcEn5i2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="191221482"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 15:17:35 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, shuicheng.lin@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v3] drm/xe: highlight reserved PAT entries in dump output
Date: Thu, 30 Oct 2025 22:17:34 +0000
Message-ID: <20251030221734.1058350-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022215504.5559-1-x.wang@intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
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

Enhance the PAT table dump by marking reserved entries with an
asterisk (*) for improved readability and debugging.

V2:
  Added a note in the "PAT table" header explaining the meaning of
the asterisk(*) to improve clarity for readers. (Matt Roper)

V3:
  Introduced a valid field in struct xe_pat_table_entry to
explicitly track whether an entry is valid or reserved, avoiding
reliance on coh_mode == 0. (Matt Roper)

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_pat.h |  5 +++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 059e3a88ce5a..47e76a46ef02 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -109,7 +109,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
 		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
-			XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
+			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
+		.valid = 1 \
 	}
 
 static const struct xe_pat_table_entry xe2_pat_table[] = {
@@ -403,7 +404,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
-	drm_printf(p, "PAT table:\n");
+	drm_printf(p, "PAT table: (* = reserved entry)\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		if (xe_gt_is_media_type(gt))
@@ -411,14 +412,14 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 		else
 			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
+		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
 			   !!(pat & XE2_NO_PROMOTE),
 			   !!(pat & XE2_COMP_EN),
 			   REG_FIELD_GET(XE2_L3_CLOS, pat),
 			   REG_FIELD_GET(XE2_L3_POLICY, pat),
 			   REG_FIELD_GET(XE2_L4_POLICY, pat),
 			   REG_FIELD_GET(XE2_COH_MODE, pat),
-			   pat);
+			   pat, xe->pat.table[i].valid ? "" : " *");
 	}
 
 	/*
@@ -461,18 +462,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
-	drm_printf(p, "PAT table:\n");
+	drm_printf(p, "PAT table: (* = reserved entry)\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
 
-		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
+		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)%s\n", i,
 			   !!(pat & XE2_NO_PROMOTE),
 			   REG_FIELD_GET(XE2_L3_CLOS, pat),
 			   REG_FIELD_GET(XE2_L3_POLICY, pat),
 			   REG_FIELD_GET(XE2_L4_POLICY, pat),
 			   REG_FIELD_GET(XE2_COH_MODE, pat),
-			   pat);
+			   pat, xe->pat.table[i].valid ? "" : " *");
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 268c9a899f56..05dae03a5f54 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -29,6 +29,11 @@ struct xe_pat_table_entry {
 #define XE_COH_NONE          1
 #define XE_COH_AT_LEAST_1WAY 2
 	u16 coh_mode;
+
+	/**
+	 * @valid: Set to 1 if the entry is valid, 0 if it's reserved.
+	 */
+	u16 valid;
 };
 
 /**
-- 
2.43.0

