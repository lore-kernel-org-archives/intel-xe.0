Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE46CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 23:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D94110E870;
	Wed, 29 Oct 2025 23:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4a9mf+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBE910E870
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 23:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761781206; x=1793317206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mbvZKmEDDvet2BVkm/oStAhL9jREvaEqLT5AQJKQoZY=;
 b=b4a9mf+lA7REaQNI3fUIY8LMAELgsuQ2khHE7TSX+WEuJcM85qM4GGeN
 7/tjU6+wGXER7PoF7rJODMG0PUnq4pxyRaYjw7EHpEfHYVy/zRvptUgm7
 1apdnHJneQaPvg99qD5jYxgZ7Dp22kllldEKG7cx+ail/GSyhrByTh32O
 9DI7LJ3vawhmZcD3gSvdiSnPwtUshunQLAJSj86ota68heLfjzrVaCocF
 nZj75yTvYucAjdmJ1vQnBzJW2TAeEFsIveDVwMtQiJuXQmlwfA/elaPBQ
 0HkwsTHVdxlk++mq7ID36tHMoTBKEwrgzbPmfmGjI/pzku1SRy+MIJph/ A==;
X-CSE-ConnectionGUID: F3fCnjoXQdSXdk4mkW7RQg==
X-CSE-MsgGUID: tgVjA/gESDWUnEU821yKpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63819073"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63819073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:40:06 -0700
X-CSE-ConnectionGUID: 5R3oyZQdQUO6Zr3+B/0gOw==
X-CSE-MsgGUID: zeMDsbe7QqyJwbYVYzrb2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="186145279"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2025 16:40:04 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, shuicheng.lin@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Date: Wed, 29 Oct 2025 23:39:59 +0000
Message-ID: <20251029233959.778689-1-x.wang@intel.com>
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

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 7649b554942a..d9f9d5bb8e5d 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -368,7 +368,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	if (!fw_ref)
 		return -ETIMEDOUT;
 
-	drm_printf(p, "PAT table:\n");
+	drm_printf(p, "PAT table: (* = reserved entry)\n");
 
 	for (i = 0; i < xe->pat.n_entries; i++) {
 		if (xe_gt_is_media_type(gt))
@@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
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
+			   pat, xe->pat.table[i].coh_mode ? "" : " *");
 	}
 
 	/*
@@ -426,18 +426,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
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
+			   pat, xe->pat.table[i].coh_mode ? "" : " *");
 	}
 
 	/*
-- 
2.43.0

