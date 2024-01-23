Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6481BC47DDC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5867C10E282;
	Tue, 23 Jan 2024 20:45:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B386E10E282
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042707; x=1737578707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lGXsDADkYBu83reibwflOu+IXWBK9wrLvMA9HUHINt0=;
 b=b0a/+R/CK3EykraMnC1FhGhm29Vei+t3v5eTKEiLS5qnR8O/xRZ8bqRo
 XsSSucv458xVvOo+DLRqVcTtGxSUSb4HJ1BdhmhYqNTwlk+ck9moL9vLR
 nlPOjGTgxTkasai0gvCfXSjTWK5ez73bAyPZ2OtkqfgcVl39gMd2a0LcF
 nxCDpZNwTCqq9Lm5v2P3zYYHkJ7FmjJMPfL6i4Me2F06V9CdI/fQ36pJQ
 FQ4hd8PHm/J5K231vs4+mkTWikUcHcOzNs+aKifdwtibLEuET6wFQT8GV
 BBeP7dVviaI2RESySFLOkQkWpDq37DSn7/APXQ13Upke1mWLlEBm8ovFD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319845"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421891"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421891"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:02 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/9] drm/xe: Remove double new lines in devcoredump
Date: Tue, 23 Jan 2024 12:44:46 -0800
Message-ID: <20240123204454.246788-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Right now devcoredump has a new line between '**** GuC CT ****' and
'H2G CTB (all sizes in DW):' while other sections don't have.

v2: remove double new line after IPEHR

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c    | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ee5d99456aebc..0c07355690948 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1366,7 +1366,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		return;
 
 	if (snapshot->ct_enabled) {
-		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
+		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
 		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
@@ -1375,7 +1375,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 	} else {
-		drm_puts(p, "\nCT disabled\n");
+		drm_puts(p, "CT disabled\n");
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 3aaab507f37fe..789736a34c1ba 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -856,7 +856,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
 		   snapshot->reg.ring_dma_fadd_udw,
 		   snapshot->reg.ring_dma_fadd);
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
-- 
2.43.0

