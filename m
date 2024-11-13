Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C647BD462BF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 15:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F53710E14A;
	Wed, 13 Nov 2024 15:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzBGkL17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0179810E14A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731511787; x=1763047787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0M4jJSjzKHQ3l6/+Ys39q5O8z8AJe0H4S4G6OIqDRjg=;
 b=nzBGkL17cZj5RiHDzLi3/Lk5Wt3ExujXWiwyHmHluvfTxq+2cFgryZu2
 YCsCTf2GzDn7nAnbvMQwLg7mO0SrpZ+cbSh0RsUXcquPeHs0wkWTLv9/N
 xTJClAToS/V6DZylAC7whCBSlkR2r+JvjEE+ROL/Im9/g9Ud1KzJIVEJr
 sm8SN8cH4cK9f6e/DIF7RYK8Ig2REFubNgsAmjgsYeYQUls5KFs1RyfZ+
 u5rt6D3+USufak0b8bKcxVRU/3jZkAG1Vm/GCYlzgkBaxdXKUqFKzfhlo
 ZZrKbtlXhgXxcACSUHvq7OP+9sFKO5wkXE9OoJ/WLxoYgLf209G3vqgkF w==;
X-CSE-ConnectionGUID: SwJHxd/rT2ab1zX4ZoOW2Q==
X-CSE-MsgGUID: md1/j60hSiSmXlJ1h9e4hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31176326"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31176326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:29:46 -0800
X-CSE-ConnectionGUID: ic6wAafBQ7e2Nec+0N2UgA==
X-CSE-MsgGUID: Ghf8ykX/Sgmg3td8pkuo7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88316668"
Received: from live-gta-imageloader.fm.intel.com (HELO DUT138LNL.fm.intel.com)
 ([10.105.23.14])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:29:46 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2] drm/xe/xe_lrc: Fix context descriptors
Date: Wed, 13 Nov 2024 15:29:46 +0000
Message-ID: <20241113152946.62418-1-jonathan.cavitt@intel.com>
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

v2:
- Properly convert context_desc into a 64-bit address (Matt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 ++++----
 drivers/gpu/drm/xe/xe_lrc.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..086fcdb6f288 100644
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
@@ -1692,9 +1692,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	if (!snapshot)
 		return;
 
-	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
+	drm_printf(p, "\tHW Context Desc: 0x%016x\n", snapshot->context_desc);
 	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
-		   snapshot->indirect_context_desc);
+		   snapshot->indirect_ring_state);
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
 	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
 		   snapshot->tail.internal, snapshot->tail.memory);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..7da9614e5f74 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -24,8 +24,8 @@ struct xe_lrc_snapshot {
 	void *lrc_snapshot;
 	unsigned long lrc_size, lrc_offset;
 
-	u32 context_desc;
-	u32 indirect_context_desc;
+	u64 context_desc;
+	u32 indirect_ring_state;
 	u32 head;
 	struct {
 		u32 internal;
-- 
2.43.0

