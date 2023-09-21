Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE34FE7071F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B486D10E5D4;
	Thu, 21 Sep 2023 11:42:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476F610E5D3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296537; x=1726832537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hYk5fOnK5Cur5o8dOPPw1rwsf1CgfiBSvDCbip0LZms=;
 b=Co56cskI7sy4fmLmFjbgFleuIci38J6YRS0vv9v2VXIZ2nspH+jESmGe
 kpGK0441AGkfUAtq/T50Z9vMimLPNHrTuPSnlRRnuqoghPNka2E59GcQJ
 X2O3C8tBzUj9fSBDFtlv6nbaq6/ogulwPZIzE8SPDZPKFZR5WWtQPsTgD
 3xYWBHAGkR9sn67+PYPx1AsQLoZzoJK0Gqi67CRfRv483uK8IBrNozsS4
 LRhaWlJcz5KT1E8QDnmGsZlUKMjWbJki+JgT2wCczJ/KUEzrixYrNw7dD
 OhP0Kb4/JFEhWrlBuUkIbccHyaWr6EyiMfGNCFoQw/V1VBddW/WW0tqRc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370812845"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370812845"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696697354"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696697354"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 04:42:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 17:20:01 +0530
Message-Id: <20230921115002.22884-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921115002.22884-1-tejas.upadhyay@intel.com>
References: <20230921115002.22884-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 6/7] drm/xe: Account ring buffer and context
 state storage
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

Account ring buffers and logical context space against the owning client
memory usage stats.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 1410dcab3d90..35ae6e531d8a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -12,6 +12,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
@@ -739,9 +740,13 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		kfree(init_data);
 	}
 
-	if (vm)
+	if (vm) {
 		xe_lrc_set_ppgtt(lrc, vm);
 
+		if (vm->xef)
+			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
+	}
+
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
-- 
2.25.1

