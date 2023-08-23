Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BCCC3DA6F
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CD010E095;
	Wed, 23 Aug 2023 17:58:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F28510E095
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692813488; x=1724349488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EV4uvvPvD01Zmk4mVn+XjDL7zl5ra6PToeF1iOyvNYQ=;
 b=k9/PcGzG+U8Eg6NIEODCBH7V0tDqi8AhbXMqWgc51j7nwxV69Oqiu7Sr
 2ntoIlVT7W7KARnL/HDo9C89UiqMuDh64cBKy7Q/47VZ3cV+aZFVy1hHt
 rMi08BAEqN3H0uHYOjjdOr1hvfQzDFTp7bj1uxKtx+ZKsGPyk1Hbm1z0R
 FfN+fqryQv9rjckWn7RAk0B65rxHdGt29Q8EatIRRcvx1ZNPI9ZD+QMX1
 NN0iiLFWIIFKwOrsUq0LxpyEaKKSAD45pU69cPW83I0fMERwBvn42vMdp
 5KMn2hF4aztyWdA+D+dKSxavdW7VPzV1+QWbXhG8H8PEc9ZxFuWKszGoB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440589324"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="440589324"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736750843"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="736750843"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO
 mwauld-desk1.intel.com) ([10.252.21.28])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:56:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 18:55:52 +0100
Message-ID: <20230823175551.230686-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/ct: fix resv_space print
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Actually print the info.resv_space.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 59136b6a7c6f..b92e04ba8f63 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1180,7 +1180,7 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
 	u32 head, tail;
 
 	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
-	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
+	drm_printf(p, "\tresv_space: %d\n", snapshot->info.resv_space);
 	drm_printf(p, "\thead: %d\n", snapshot->info.head);
 	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
 	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
-- 
2.41.0

