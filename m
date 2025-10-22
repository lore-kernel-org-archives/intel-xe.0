Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8DDCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 21:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFFD10E85D;
	Wed, 22 Oct 2025 21:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBi368bO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1310E854
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761170122; x=1792706122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KVcoZa6BIdPAUPrUlLiNcntOiGqwEOb4GmsmnMu9DGs=;
 b=PBi368bO++NVfx6CX2Nflx8xylX/1Gmj+Iz8q7J4oX+1doy5qsuBlDxE
 Ilpg6rQge6IolI6nf5cQ3OcCmo9QMCIA/c/sJXoFP8uuwtdBsTHCA0UjJ
 8IOEHoZ+KQfvoaHyrjaA+VqLsw7gr4IPY/n5xoMlx6vLjE3xg5LB60w5m
 c1VJEj97cvmu9RzBuxXL7BX+55Ju7nxqZ1WCma1T/AQ327kZfaMEErYHP
 K120cWldWfmdH6s9OoCkIwexMnbNiBewi+6CUXrbpWWa6zg3Kw+o96hBr
 ys57opi04In4AAMJNDle+aUZLJrZOktzizs0lRvneeRR4VA8eMvCICAfV g==;
X-CSE-ConnectionGUID: uj5kwhJRSPeegkzNSLVmTA==
X-CSE-MsgGUID: Bg4vqTWFRuKXI4jI30k/rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66973769"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="66973769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:55:22 -0700
X-CSE-ConnectionGUID: syzVj/HFRPmlxgSUEcysVg==
X-CSE-MsgGUID: pMKDlP91SmyTDSPh0pvXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183572968"
Received: from fmbmgg31rpls048.fm.intel.com (HELO DUT6304BMGFRD.fm.intel.com)
 ([10.36.21.69])
 by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 14:55:22 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, shuicheng.lin@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: Dump PAT entries with reserved mark
Date: Wed, 22 Oct 2025 21:55:04 +0000
Message-ID: <20251022215504.5559-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a marker * in the PAT dump output to indicate reserved entries
more clearly. This improves debugging and makes register inspection
easier to understand.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 7649b554942a..82c221aacebf 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
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
@@ -431,13 +431,13 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
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

