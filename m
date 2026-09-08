Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF4DC79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533C10EB0B;
	Tue,  8 Sep 2026 10:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOFbPT9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A23910EB08
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862741; x=1820398741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1z9q5usOTnccWMTCf6Z87I/++zF1ResJabKCHI7HqnA=;
 b=gOFbPT9+HxRws2umGHOgiygRj1gc6xFVQMCtMKd3Uot4tMG1V7b6ekUt
 e4bdjnt4TxJYn63G9GY6JhWpuNbhN4SZbbKXMCW9AnT0eJjVzn/jzTpMO
 OfbgIvjf5WTz3ZbciH6ZksmvfSJ7xZ//10zYQMvNnrRyUeUxgzHL4Mfet
 mTRra79b2xXI4576DQrFDX6a7GcVwImGxSf2XQgi2T4I8FB1a5OrUl83w
 oxaQfOtgeJSe/l2ZtGPKd4oT3W34LjXh1y9A9tA4LV1VNWKHxXRquwq4Z
 6aDAquwMywmPY70KnXfnGu5SCnCXPfQ1RamWVbFIEmK5JRoHDoAYorsdl A==;
X-CSE-ConnectionGUID: EwVYN7KASfOQU6ynX2gloQ==
X-CSE-MsgGUID: z/qjxCfHQ3umw6GT9CmhUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278275"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:01 -0700
X-CSE-ConnectionGUID: VdgvC3c9SUKRexwLN94jRA==
X-CSE-MsgGUID: cT8fqAxnRJSX+wB5f5/CAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628447"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:00 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 06/13] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
Date: Tue,  8 Sep 2026 15:48:42 +0530
Message-ID: <20260908101849.1219614-7-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_gt_err() with xe_log_err() using the REGS component tag
when the maximum register whitelist slots are exhausted.

v2:
- Use -EOVERFLOW on max limit reached (Mallesh)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index cab1b578ca0e..b15004fc5761 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -14,6 +14,7 @@
 #include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
+#include "xe_log.h"
 #include "xe_platform_types.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
@@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in
 		};
 
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(hwe->gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_log_err(hwe->gt, REGS, -EOVERFLOW,
+				   "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
+				   hwe->name, RING_MAX_NONPRIV_SLOTS);
 			break;
 		}
 
-- 
2.54.0

