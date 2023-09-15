Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF87EED61E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 18:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93F110E663;
	Fri, 15 Sep 2023 18:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3910E66A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694801841; x=1726337841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hYk5fOnK5Cur5o8dOPPw1rwsf1CgfiBSvDCbip0LZms=;
 b=OWcmS9s8IleXWm9pwsZRNCH+jmX7/HhudpKcvZqE53wDzedODiziGSIo
 pCe7OuoN8SW3qTMxDxProwccnmHDe7RMGIQhjWDzsmnN9f2cuHC68phU4
 gPGVfKPtdXCykE++6y7OuQdKG9cYCbhPFn1cl3+0TFlbr52gk0IoiQAY8
 IMsQgNldM0WvirL6DeiHgulahK7p5naeE5ZB6gAD/SF/5Or7nbY7C2K+T
 wTdY0bZrJWZzddCwVnWtppSQgv6Z9uEEEpuuz6vu8xjjQiFK91vhfLuUA
 XCDelTA+6eE6Vg4J1rkBTUG9lfMWo/j+HvrzyIIs6tzBogN4Q3H4mhss1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445786783"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445786783"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918733533"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="918733533"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 11:17:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 23:54:56 +0530
Message-Id: <20230915182457.3951938-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
References: <20230915182457.3951938-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 6/7] drm/xe: Account ring buffer and context
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

