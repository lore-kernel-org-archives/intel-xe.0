Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43A4109E535
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 01:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621110E167;
	Thu, 26 Mar 2026 01:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POikE9b+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F81610E167
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774487532; x=1806023532;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2b839D8mJxZv3yDbHJlv1kqjHuVvXmVwH0nGUEItvoU=;
 b=POikE9b+IPbrpHsTypNB7uBBe+akWZklnw1J7TAkjASU4WxWUFffhQQI
 Pk+S0D1E7BLEcqz/9cd5PtKQ3DhyjrZmoqRkGDIOk+NkPg0RvU2JzMUeK
 MdtNAtDtws3JvycxYSefT6NX5OUuCvrNfM7jMG7BvAPxqQscUUIwtE6b6
 0uRtvdRDo7vt0eLJBIZBfpB1jxgiL7Y2xwlkEFRGUrYcnxyK6p3+Eiod0
 Nsb1JZNCKunBUS/I5HLFsHFaUoKXAxfGkMu+vLz7iKfgxxOsdlfVKKSlN
 l1k1Od0sA6ZVWNIaLhgc0+xac+b34mV4dz7zsG5ba1MRFvKm3BbTsHWIf Q==;
X-CSE-ConnectionGUID: E4hVModQRRuPI0Uxe8lYzw==
X-CSE-MsgGUID: HhBIKOE4SZidpLwsOKbV6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63090631"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="63090631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:12:12 -0700
X-CSE-ConnectionGUID: XyNuge5WRE2Hfm5u/z+APA==
X-CSE-MsgGUID: l1vMDX3SQX2S4CeqOkDI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="229782245"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:12:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Issue GGTT invalidation under lock in ggtt_node_remove
Date: Wed, 25 Mar 2026 18:12:07 -0700
Message-Id: <20260326011207.62373-1-matthew.brost@intel.com>
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

Async work (e.g., GuC queue teardowns) can call ggtt_node_remove, so the
operation must be performed under the GGTT lock to ensure the GGTT
online check remains stable. GGTT insertion and removal are heavyweight
operations (e.g., queue create/destroy), so the additional serialization
cost is negligible compared to ensuring correctness.

Fixes: 4f3a998a173b ("drm/xe: Open-code GGTT MMIO access protection")
Signed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 21071b64b09d..a848d1a41b9b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -481,15 +481,10 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (node->invalidate_on_remove)
+	if (bound && node->invalidate_on_remove)
 		xe_ggtt_invalidate(ggtt);
+	mutex_unlock(&ggtt->lock);
 
-free_node:
 	ggtt_node_fini(node);
 }
 
-- 
2.34.1

