Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3BEEF99DF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 20:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF1610E319;
	Fri, 13 Feb 2026 20:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fkfk7tpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B22810E2C2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771015849; x=1802551849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/u1iq+bYh+lacxL7cvOxLMniIaZIcKoiSIf5bBuRS8=;
 b=Fkfk7tpl7V05pZDKokjHwShftjjOcImUcYB6RkCflcgLmbMlHDVNZ/dx
 Um2E+KirX0eO2+7TZdRBEHrs3i6/EKxkKBYrkNGoq4yVb3IcZGWfgIVSw
 MpG07gYjGL5Kcbyc1dkp3ZjdtKOdIiWIwDsGui5S1qsBe2ZjzO9rIuuHm
 4bGzcxh1F22cY11EEQRLIPb0QKXw7AUHdAt7nb1sM7UhYMwBypeUaMugG
 SGHsFkTIsxFriFzPGpIZvKMMnRTMcNH4QgzZDrmkng3HNqbb1NOyEteLW
 GELoB7sQq3oxA7yLQ3KU30RdM92ufDN3zOwmD14vAR4QHsZfbWLwAuclL Q==;
X-CSE-ConnectionGUID: /I1Y/Y4qRZe61qnLVSEZXg==
X-CSE-MsgGUID: g7OzCoiOQa282sw73rKtag==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72109740"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="72109740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:50:48 -0800
X-CSE-ConnectionGUID: awmNQo7BSB6kdf0lRKVdjA==
X-CSE-MsgGUID: pQbY2xPzTRycuHF2ZgHmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="212131367"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:50:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, daniele.ceraolospurio@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 2/2] drm/xe: Remove H2G reads in CT send path in non-debug
 builds
Date: Fri, 13 Feb 2026 12:50:43 -0800
Message-Id: <20260213205043.3111176-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213205043.3111176-1-matthew.brost@intel.com>
References: <20260213205043.3111176-1-matthew.brost@intel.com>
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

A single VRAM read on BMG can take over 1µs. While small, this is a
non-trivial amount of time in a hot path. Remove the descriptor H2G read
(potentially a VRAM access) from non-debug builds, as this
error-checking code is not needed outside of debug configurations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5d8d90a4f879..333a621825d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 full_len;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
-	u32 desc_status;
 
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
 	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
 
-	desc_status = desc_read(xe, h2g, status);
-	if (desc_status) {
-		xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
-		goto corrupted;
-	}
-
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		u32 desc_tail = desc_read(xe, h2g, tail);
 		u32 desc_head = desc_read(xe, h2g, head);
+		u32 desc_status;
+
+		desc_status = desc_read(xe, h2g, status);
+		if (desc_status) {
+			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
+			goto corrupted;
+		}
 
 		if (tail != desc_tail) {
 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
-- 
2.34.1

