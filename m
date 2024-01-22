Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04701C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B907510ED09;
	Mon, 22 Jan 2024 17:05:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7909710ECA3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943112; x=1737479112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2pLn3ZlYp2pV88pqPWwINAxrC/IA75HWyDYdrBxOjU=;
 b=eTnruEc2pQ4En+1P43TJmGOwC2/xLrO8++YujzF3n5d0IgVzs9VYtGOl
 s2yuOu/h6HK4RZf9dF/R8ezhn6AGrk4qfygCUmg158laPIuWCSeynuXH/
 c2auwRK+avHQ2DXhUj4p4DL7MoLG+amw3hV1QNL14bm9heofcAuw8IR7n
 Ixv+Az9kQKR4o5SbAmc/g5G3wwn6GaK8PAV7qWdH6s6OBUZe0xdwu/Ku/
 cJKC8+WKh2dS4O3RdAny35NI16Ho90ZNtCmULkoXjBkIul60MXuSusKHV
 NCG8s6W6AZnANIKbPUAjpnZoP8gpn13bt6ARz+1IOyAw3Hpge6gUtVEgf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8020252"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8020252"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735228422"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735228422"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:10 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] drm/xe: Remove addional spaces in devcoredump HW Engines
 section
Date: Mon, 22 Jan 2024 09:04:45 -0800
Message-ID: <20240122170445.108856-9-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
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

I guess the indention was to keep it visually aligned but that
would require a lot of spaces and was not followed by other registers
so lets just drop it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 9fc30ecec0a26..6927ce07bdfe7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -838,17 +838,17 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
 		   snapshot->reg.ring_execlist_sq_contents);
 	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
-	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
-	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
+	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
+	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
 	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
 	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE: 0x%08x\n",
 		   snapshot->reg.ring_mode);
-	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
-	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
-	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
-	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
-	drm_printf(p, "\tACTHD:  0x%016llx\n", snapshot->reg.ring_acthd);
+	drm_printf(p, "\tRING_IMR: 0x%08x\n", snapshot->reg.ring_imr);
+	drm_printf(p, "\tRING_ESR: 0x%08x\n", snapshot->reg.ring_esr);
+	drm_printf(p, "\tRING_EMR: 0x%08x\n", snapshot->reg.ring_emr);
+	drm_printf(p, "\tRING_EIR: 0x%08x\n", snapshot->reg.ring_eir);
+	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
 	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
 	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
 	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
-- 
2.43.0

