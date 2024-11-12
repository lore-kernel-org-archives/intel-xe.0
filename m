Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68401D597B2
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F9610E235;
	Tue, 12 Nov 2024 22:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FW7yye8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30710E235
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731451788; x=1762987788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hUwv5Oxd0USZrQLgbjzFFjgKsbBTzNQBDd+izMvqeJI=;
 b=FW7yye8J8SEV7SDJbsXQ/Y2EDNrCMOpdkBQcRBddaE3S3HuvF19UVPc/
 kLXRwFrHHuK6qzDYWNhpXFTrCEF/qx/2fJTR+H5GcjAjul3qLSdOfWCbs
 zMwKAa7vQn6ikw8UoyJSqVPVohUUKcl5gVynrAoaU5STgdWaUXchxQr1A
 9R/pWI6vgKkbvcoQXYnFNa0H1cNe9/sktVUHKtPiXv59V6nYO2mQ2eiA6
 hRQ0XNYARcKTRd9PrqfdVw9Z8oh65TdaIZ0HP4kv2ZlXN3i8HJ6Gl0Oel
 uIa8JAmf9hUsOQBH0vBjcjGwhVpOwh6+ok8ZjqtKTr5XL+W3dvTWeAa7y g==;
X-CSE-ConnectionGUID: o96+2ROsTp+SAvbZb40wYw==
X-CSE-MsgGUID: u6Kk5tXKSYO00OGaZeZxFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31545288"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31545288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:49:48 -0800
X-CSE-ConnectionGUID: h2fo33SJQlezh0MHm+cpHw==
X-CSE-MsgGUID: qZLO+b0VSmOJyGIme59j5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88487329"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:49:47 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe_lrc: Fix context descriptors
Date: Tue, 12 Nov 2024 22:49:47 +0000
Message-ID: <20241112224947.69243-1-jonathan.cavitt@intel.com>
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

The direct and indirect context descriptors in xe_lrc_snapshot have
various problems:

- context_desc uses an incomplete 32-bit offset into the GGTT at which
  the LRC resides.  This is not the same thing as the descriptor itself,
  which is reported by the function xe_lrc_descriptor.

- indirect_context_desc currently only reports the indirect ring state,
  as described at xe_lrc_indirect_ring_ggtt_addr.  The variable name
  does not accurately reflect its purpose and should be changed.

Fix these issues.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 6 +++---
 drivers/gpu/drm/xe/xe_lrc.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..c280f46fbd75 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
-	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
+	snapshot->context_desc = xe_lrc_descriptor(lrc);
+	snapshot->indirect_ring_state = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
 	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
@@ -1694,7 +1694,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 
 	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
 	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
-		   snapshot->indirect_context_desc);
+		   snapshot->indirect_ring_state);
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
 	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
 		   snapshot->tail.internal, snapshot->tail.memory);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..c281bd690846 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -25,7 +25,7 @@ struct xe_lrc_snapshot {
 	unsigned long lrc_size, lrc_offset;
 
 	u32 context_desc;
-	u32 indirect_context_desc;
+	u32 indirect_ring_state;
 	u32 head;
 	struct {
 		u32 internal;
-- 
2.43.0

