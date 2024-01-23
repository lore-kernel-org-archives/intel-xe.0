Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FACC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1610E52A;
	Tue, 23 Jan 2024 20:45:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096910E3F2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042715; x=1737578715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fUeV1H+082BHr5W6FZk/quTaGrcJSNdLD6ULLQH8f7I=;
 b=IimoOv9KdGU6ScmGj0MVejVjvnRqTeVbIdcwV2prdSPk5ipsXAZzbL8C
 iuPFtDQKDDJuBhJtJomL4Batnsn/L9lSPKCzm+UabaCIPa7NzMAKrvVkH
 aZu9SczXeEpUP5QzQZd5cXRHGtYnxn0SAxOHWEdmyakXVHMiPdwu2q6BK
 +my9YKMnF9GlLoBeS36uhZna+9itzG6w6tmOKX0FWXMduGxxZqxkk0ptK
 y1776zHbjsm7mDkE2Kj1uaBsL/68Pz6Hf3ycrxJd3APvom+PFayTBzL3V
 QhJrUCzAwBjsJDpRWCE+Fx74zc9rfB1Mtod5m46YwvmqZlT4plQIZ5syO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319874"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319874"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421982"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421982"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:12 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 7/9] drm/xe: Remove additional spaces in devcoredump HW
 Engines section
Date: Tue, 23 Jan 2024 12:44:52 -0800
Message-ID: <20240123204454.246788-7-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index f7d66b71f1d71..0d17e32d70c87 100644
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
 	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
-- 
2.43.0

