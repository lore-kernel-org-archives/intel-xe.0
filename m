Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46235C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 09:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153710E303;
	Thu, 24 Apr 2025 09:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBG9spjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83D910E303
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745487026; x=1777023026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tscoa7XK7/gZluaQMwSdg6lnIYl2N0DP0u9K+Gn4Bg8=;
 b=CBG9spjXjaGwSXEyNrlHK8t9goYHVi6DBWKdZdaDrgoZIbY+uixZ8HZG
 tozXZ3TtlE0txUP63kvSSJn23h+6bA2CuUFSmLnA7B/htOXUJQA9GlsAH
 TT/Sco7s0HaMK98Lt7nvAVxZMOdeyAJmE7ZRxPCDMo14sHK8I13NGHT/j
 asORIaDiM6kyLiBAz3iWTHMo9Ew8WmXonPZkCcjC5Iz/wM5eo+UspinNU
 dlba9sjNYlwzBBjLDJsZzt2BmJh6s7EUlKMFYcDala6GQpEeQJRBw4Ret
 3P8kvSFSTBZxuvdCuT7BoW2pqv4Rdnb/w4ZOO4vEAt2ZfRLGxa4TOuYQw g==;
X-CSE-ConnectionGUID: OaWVwuBGRniwg4sdepMyJg==
X-CSE-MsgGUID: arkOr6S4T5qAURQt1hIeYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50912959"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50912959"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:30:26 -0700
X-CSE-ConnectionGUID: uEBXhXlgSLyK4DkwnOh6QQ==
X-CSE-MsgGUID: c0gq9oIRSCWcvbVfcsChYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137358111"
Received: from unknown (HELO rvodapal-desk.iind.intel.com) ([10.190.239.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:30:23 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, gustavo.sousa@intel.com,
 clinton.a.taylor@intel.com, matthew.s.atwood@intel.com,
 dnyaneshwar.bhadane@intel.com, haridhar.kalvala@intel.com,
 shekhar.chauhan@intel.com
Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
Date: Thu, 24 Apr 2025 14:59:41 +0530
Message-Id: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
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

In existing code for PIPE CONTROL post sync operation instructions
POST_SYNC prefix is not present in the name, add it so that it will
represent it is a post sync operation type.

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 8cfcd3360896..75efdacc4979 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -54,7 +54,7 @@
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
 #define	  PIPE_CONTROL_TLB_INVALIDATE			BIT(18)
 #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
-#define   PIPE_CONTROL_QW_WRITE				(1<<14)
+#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
 #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
 #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7582b097ae6..da50213b78c5 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 		PIPE_CONTROL_VF_CACHE_INVALIDATE |
 		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
 		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
-		PIPE_CONTROL_QW_WRITE |
+		PIPE_CONTROL_POST_SYNC_QW_WRITE |
 		PIPE_CONTROL_STORE_DATA_INDEX;
 
 	if (invalidate_tlb)
@@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 			      int i)
 {
 	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
-		    PIPE_CONTROL_QW_WRITE;
+		    PIPE_CONTROL_POST_SYNC_QW_WRITE;
 
 	if (!stall_only)
 		flags |= PIPE_CONTROL_FLUSH_ENABLE;
-- 
2.25.1

