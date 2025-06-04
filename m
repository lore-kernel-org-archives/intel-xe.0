Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457BBC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 15:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AB910E07C;
	Wed,  4 Jun 2025 15:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYRdxQi6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D1610E719
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749049427; x=1780585427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70Y8kiQ3bbX4AmE5gWwLfC8pr5H0+2KYros9YsJPtOc=;
 b=jYRdxQi6nZF84lfVS3NdXkLoROYAGZ+8htSWdWBFw8hFFGyzLVFpYb/u
 htzCJBjx1g7DY2WGxrDjoFR0aedaGRoNv5vCir8okvIlzCvMl4TE391gt
 39o2BqLVAS5Y6h1V8EDR4u1OX+Lvn126GsvbzpakiNVwIwHEKRCbIeJwY
 bXtDzv0lMFP2ggL1EugSExSVPidY9V/MZJ5RA311lYATS/xbVPMAPLr+r
 6Vo1N7SSkceYoHBLsiUB7IaAsd6iq417Sz/FAzftc8r7BgYWC5fDSLWdu
 hcYywQox33onAqhODk110LYJzB8woDDa63uPFODyQ41TRWNU2Ajn2ouF1 A==;
X-CSE-ConnectionGUID: 9UsmdTAwQF+5DReh5D4tgQ==
X-CSE-MsgGUID: n5vN5Ti1QLK4czzB2DzCBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61800181"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="61800181"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:47 -0700
X-CSE-ConnectionGUID: RJw1IqWGRkirYOWCtVIqMg==
X-CSE-MsgGUID: +z3g4qW0TiyhuQ52MCM58Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150096735"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/2] drm/xe/lrc: Use a temporary buffer for WA BB
Date: Wed,  4 Jun 2025 08:03:05 -0700
Message-ID: <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b77e2
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

In case the BO is in iomem, we can't simply take the vaddr and write to
it. Instead, prepare a separate buffer that is later copied into io
memory. Right now it's just a few words that could be using
xe_map_write32(), but the intention is to grow the WA BB for other
uses.

Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 63d74e27f54cf..bf7c3981897de 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
+static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
 {
-	u32 *cmd;
+	u32 *cmd, *buf = NULL;
 
-	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
+		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		cmd = buf;
+	} else {
+		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	}
 
 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
 	*cmd++ = ENGINE_ID(0).addr;
@@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 
 	*cmd++ = MI_BATCH_BUFFER_END;
 
+	if (buf) {
+		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
+				 buf, (cmd - buf) * sizeof(*cmd));
+		kfree(buf);
+	}
+
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 
+	return 0;
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
@@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	xe_lrc_setup_utilization(lrc);
+	err = xe_lrc_setup_utilization(lrc);
+	if (err)
+		goto err_lrc_finish;
 
 	return 0;
 

-- 
2.49.0

