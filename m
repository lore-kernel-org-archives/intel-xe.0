Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6963DC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 21:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268AC10EAC7;
	Fri,  3 Nov 2023 21:10:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7F810EAC7
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699045841; x=1730581841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MYJzwFVTWR3QBPeY70hUc1CaMs9lRH58qLpfHfpiX8Y=;
 b=R/VCTBYkXtF8sLD2KI++lJY8rZX/e/2Flm+BEMXmqKtryuRCT4oOg/67
 XJnDSNFq5pVpqiiHHruvVqF15/apjx1+8N9IEws/zUuEBxIMSO4TLultJ
 aVTnjaMj9vhX8LO/pP1rALHrvm33KJSug6Bev4t5KN71WbJL2/qw1h1tG
 0u/s9qM9A0DR3BTWms395Xp+3RsgY6cLEmxFclkNUYzChbYiy/DqbJvMN
 LXVbbcozGCMf/8pRyTdLWFiVq1iUhedCr9VcIQ7o89cEKKFeaGacOjg//
 KW6wEs3p2uqkP8guHhHrKuJ+vO89DiUiSHaIRrqglHr6JVkvS/V2LWlK1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388849540"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="388849540"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765371987"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="765371987"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 14:10:40 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat,  4 Nov 2023 02:49:24 +0530
Message-Id: <20231103211924.426715-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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

In scenarios where vm is not initialized, use xe_migrate
to get the address.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e6a31f90ebdb..f79ec8e4ae4e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1296,7 +1296,10 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 			xe_tile_assert(tile, pt_bo->size == SZ_4K);
 
-			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
+			if (vm)
+				addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
+			else
+				addr = m->q->vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 		}
-- 
2.25.1

