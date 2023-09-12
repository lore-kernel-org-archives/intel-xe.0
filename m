Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B58ECA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B96B10E401;
	Tue, 12 Sep 2023 11:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550410E401
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519133; x=1726055133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qrBJeNm36FDXXfKT9d2aGiyEOeR5vmxdf3paGh9Uaoc=;
 b=Rec3wm2v6dpHDRZDvhFWsu5XEujjaiqvn0y2VzO25jv6X49VUTvkTC06
 ki7EjF7bM4XHTBs6k3y0vqPfER1maedJjVY+t8lOTxF9BwkWmRws/u0yC
 vvEOHvF4r6Rlru1ZGssH9vZf79YtuSdyI0WSXQFICGwYuyAoFnWIGfG6p
 /Byj78nFLmOuC3pLwnDrNJ7ibKRwo8Bh7Co8ZE8mUVyECmEVwIbJpRFO9
 /Z9SowqzjQs39Hvlzmdapw8I7/uSvIhRvdJJ/UKYDrhb2hn8Iq6NkhSYW
 KKM8Ews4n+i/uS+1kc+N/MdqtvAlXHeJ4evkwUY+tsAnt42iMVlEhlmFC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381050228"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381050228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743700075"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743700075"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 04:45:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 17:22:38 +0530
Message-Id: <20230912115239.3554341-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 6/7] drm/xe: Account ring buffer and context
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

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6f899b6a4877..8518cccdf4e1 100644
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

