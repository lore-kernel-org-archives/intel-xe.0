Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14272C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6C110EEDB;
	Mon, 22 Jan 2024 21:17:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D026E10EEDB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958239; x=1737494239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lGXsDADkYBu83reibwflOu+IXWBK9wrLvMA9HUHINt0=;
 b=biSIqm4X4AsClpJ/Eh57G1Lo0D3apSiDtBjF3sPExova3u7y9lFMB5JK
 /S74Z7ANb9hZRDvtqtmN2r+snd1HsScZt1TdUauJFNmZpm3L5lFvdqaqk
 prTcX30ueCXkwAXKI11qhGunQPVxgBXjb4FI2f20i4H/SixNQzRIrUX89
 7UkMsP7BiZl0fJFnScmjtuqftyZeVNpBY+NJRM0gkIbakEKP8J0uzJyYi
 Qb1uZFTRcNHvskfIf1rDbESWlh84Xw17xw/QVqpbcpIf7W7ub9WqQev/m
 k+HZQK80na/0yuGPi1UIRYBLEfK9jb/iYiqUnWckxrPpmSNjaLoBysIjT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432486542"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432486542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27495053"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:16 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/xe: Remove double new lines in devcoredump
Date: Mon, 22 Jan 2024 13:17:01 -0800
Message-ID: <20240122211709.224419-1-jose.souza@intel.com>
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

