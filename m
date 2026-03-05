Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17FDF47CAF
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 18:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A251910E2DC;
	Thu,  5 Mar 2026 18:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1stGfxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEA310E2DC
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772736378; x=1804272378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uCAf/UEjKHxTiKdO8KJegi5BJFlz0s4y/0WE70erFwI=;
 b=X1stGfxxtg+0PlTOwnUTTiZhdrIx/+ONFwEsRee7eaeuYq1WMTvGdCnC
 WJY5S4Aiw48S6peSlJhq8qnkDQfcvXFgv6V7WzcEIfLdQQSXY5J2mW/f0
 EOiTbvcHeRql8K1z6A08ejj/AEL1hQdkQfjIczotuJYRG6eFTeYZPT+T9
 wC/604oZbI9iJyBura7WV7RANaXM8KoWbZcG65NUgWBRG3OvD0qx83waA
 fzwbWNF9RFi6f2poWfkDR0R92Wx1cyjg3outPxCwDOA9Q3HYRNKysKLYq
 gs95ZKRDFgVlXAKUz2OMg2/SnMPVDkTAjuJ/SNnCblDlvpfcyJh9lynm+ A==;
X-CSE-ConnectionGUID: jcU+AuvuS7SzMfSup5hIfg==
X-CSE-MsgGUID: gkSEPaupSm22ojFIsQJZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85307825"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="85307825"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 10:46:18 -0800
X-CSE-ConnectionGUID: Imcdv7S1QniIHrXkQWSuDw==
X-CSE-MsgGUID: uTDMELmnT1+jqNjDq7/xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="221630183"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.53])
 by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 10:46:18 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/lrc: Fix IS_ERR check on wrong pointer in xe_lrc_init()
Date: Thu,  5 Mar 2026 18:45:19 +0000
Message-Id: <20260305184519.155060-1-shuicheng.lin@intel.com>
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

The result of xe_bo_create_pin_map_novm() is stored in local variable
'bo', but the error check mistakenly used IS_ERR(lrc->bo) instead of
IS_ERR(bo).
Fix by checking and dereferencing 'bo' directly.

Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index ebab5d78f7cc..4ac566d4234d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1598,8 +1598,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
 				       ttm_bo_type_kernel,
 				       bo_flags, false);
-	if (IS_ERR(lrc->bo))
-		return PTR_ERR(lrc->bo);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	lrc->bo = bo;
 
-- 
2.34.1

