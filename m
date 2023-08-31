Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C24C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EFE10E5E3;
	Thu, 31 Aug 2023 08:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469DA10E5D7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472300; x=1725008300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fWMG/k1mf+Mexa1z7b9cPw43VcwmeuTKGHxHwNqj5uA=;
 b=jSRqHP4dHCAsgUHXI5ZgE5L1bTzlyQU/GszTxxSYVWNnlTQvpMyxBoYC
 O9U6vTHAsXElb2lLZLyA5/VwCEYQvI9cvOTUyh187SyHHYwa1y7TDav72
 uvr5LmPjfc635IeEeD3UaLRLLi1F+2mKI36LQhxa1L1FnAj8ZcmEjxuBk
 W5496a1AlXlB3g8SvHXnCwxydKznZzmT8qTt/OpZGDqIBeGWlCWVVt3ep
 reoz2qgtaPzwDo9BA6PHabVP56amtrFdYjwDBGPFXRnTrw4IHGLV6nwDT
 Oc54J3nN8UNOA2B4qH6B5Yt/NadLSPkCsx79VfhJpfeNoXiXPsF+JbKLb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814192"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814192"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257395"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257395"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:35 +0530
Message-Id: <20230831090536.2949934-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/xe: Account ring buffer and context
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2b4219c38359..7dd745e23575 100644
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

