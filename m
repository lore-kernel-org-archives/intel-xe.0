Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF7CC98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D5A10ED47;
	Wed, 23 Sep 2026 17:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fj1UaLex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3810ED47
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790183740; x=1821719740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o1I+WQf5+ZwiKMnw6KwoS/xr2JNuTHmSqQYHD8eprJE=;
 b=fj1UaLex1QnJry8Q/52+Z2DbQaTxyOQVuiyLCNA04DvKRjhXesttvKP5
 0zWvjkh2S8xHbNmMzEVO29y1OuuFVMGHiWiLuew9VJ4+cTuTs1vWE7c5E
 gIqvc2sCGfSReMOs3M2TORjFSi4hFRJQNAis8P9sa3Cjz3zIS9e+Pz5HD
 MgzKWpNqwnDzQfG2AO2l7iWbGDMpX901nxThXwMKJy9cPWYcpzhz+OXZd
 lk96DOKoUuksR5cuAqjw6R7QjxlXL2uhIHXB8HEMU/S+mtxpT0WQIx8St
 PlqQ5Iy2kbCN8oRnawzu+I9bLql8mVIukQUrR0HNgDKZ8qJq2HMUbPEPJ g==;
X-CSE-ConnectionGUID: PH9CzgtPRiGXQM7oqODhCg==
X-CSE-MsgGUID: 0kMBeF3ATaKgqo9DW0YjkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93406230"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="93406230"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:15:40 -0700
X-CSE-ConnectionGUID: hOJcooUrTPqdr1G1xEJdAw==
X-CSE-MsgGUID: 5FqNZtx6TgGWJ9GeGeAFng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273171216"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 10:15:38 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Remove no-op ternary in emit_flush_invalidate()
Date: Wed, 23 Sep 2026 17:15:27 +0000
Message-Id: <20260923171527.663537-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

'|' binds tighter than the conditional operator, so the trailing
"?: 0" tests the whole OR expression instead of just the TLB flag.
MI_FLUSH_DW is non-zero, so the condition is always true and the
expression evaluates to itself.

Drop the ternary. The mask already yields 0 when MI_INVALIDATE_TLB
is not set.

No functional change.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 46ab1f0f3564..3dd8cf4e2131 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -143,9 +143,8 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 
 static int emit_flush_invalidate(u32 addr, u32 val, u32 flush_flags, u32 *dw, int i)
 {
-	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
-
+	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
+		  (flush_flags & MI_INVALIDATE_TLB);
 	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
 	dw[i++] = val;
-- 
2.43.0

