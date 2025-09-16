Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C757CCAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 22:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3F310E80F;
	Tue, 16 Sep 2025 22:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfXflv+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BC110E80F
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 22:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758060368; x=1789596368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MIaizkp6BdALowGeq/SqnjyuPT/VnASxIdmTdSPTb7g=;
 b=cfXflv+Pj9Vi/WiFpZuC0eikeUHt2INmwP1rL/RVc6YGN80INS6dFwVB
 9jvw6IAgujvKoFO9jxRU/r8PdEo46wsdWkbBsv1HqgueBOsWamM6/RqJj
 PqA8Ox0blGrsMn8aMqwpTM1OY3HVfMBw7uHqQv5JVp7YSf9MeQe7fctrZ
 0NAlP3cBYruHmrtb5qDIgiLHkF5YRAMSLZYXhb6qpfpc1RphM2wk/LHJM
 yKL7I0Eyux9/XfX83DUgtIGrfnNCffmO1EsSmFssl+B/bW598mWjwIBV5
 tTs9SWheHGpAWdIIzj2U2oEnknj7EiwMha6Qs1PhEEeP/pf9TcS9DNpOo g==;
X-CSE-ConnectionGUID: jpL3F6KqQGOpPy9/ANN9VQ==
X-CSE-MsgGUID: kUVk4jAkRtiYmzlT+Q0J1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="63990963"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="63990963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 15:06:07 -0700
X-CSE-ConnectionGUID: zb4pO9y+SXCWiEMeIj4MGA==
X-CSE-MsgGUID: hJ6dBn+ySUqn1LutYLJ1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175154549"
Received: from dut4412lnl.fm.intel.com ([10.105.8.90])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 15:06:07 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] drm/xe: Handle NULL TTM case in xe_bo_move
Date: Tue, 16 Sep 2025 22:06:05 +0000
Message-ID: <20250916220604.83613-2-jonathan.cavitt@intel.com>
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

It is possible for xe_bo_move to pass a NULL TTM pointer to
xe_tt_map_sg, which would result in a NULL pointer dereference.
Whether or not this issue realistically occurs, it would be good
to add an error handler to guard agains this.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8422f3cab113..bfeae8fd1650 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -834,7 +834,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
 
 	if (new_mem->mem_type == XE_PL_TT) {
-		ret = xe_tt_map_sg(xe, ttm);
+		ret = -ENOENT;
+		if (ttm)
+			ret = xe_tt_map_sg(xe, ttm);
 		if (ret)
 			goto out;
 	}
-- 
2.43.0

