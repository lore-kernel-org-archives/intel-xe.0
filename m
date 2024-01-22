Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3740C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A46710ED08;
	Mon, 22 Jan 2024 17:05:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FAE10EBEB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705943101; x=1737479101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W2llmpJYwYssxd303hxExlYPwH62/bNnWT1cYfEoh2I=;
 b=jFwDgDQ4+/Cf8PlbaABY5A1QNK/tLynfnSSnxwtZveg6dflpXPVGaXg2
 c21zCCPRD18eggHUoQanz0Pi7t6GLShmo8hkuI49mHU6Q6H4ywFkwooAD
 qnkTcRKJ69MfANTkZu8yZ2znklIZxWx5fkqVoRSkP2cVn/a3LEgHWFvZR
 BMKw9jGYCruQ5ewAMhqxpl/q4p5xejsgB3DrEc2NUOq9YFJ98i4fMEc0t
 mIsmIwWzXfkXYms004q4iAAZQTz0FYb+AvE2yL9DgSytNmRdO8d3zPR50
 kKLUqpewThsUbCakU7AUF0+YQItaI46t3bZgAKdDAXmbIhrCwBV7xS0P5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8020189"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8020189"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735228205"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735228205"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:04:56 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Date: Mon, 22 Jan 2024 09:04:37 -0800
Message-ID: <20240122170445.108856-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Right now devcoredump has a new line between '**** GuC CT ****' and
'H2G CTB (all sizes in DW):' while other sections don't have.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ee5d99456aebc..0c07355690948 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1366,7 +1366,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		return;
 
 	if (snapshot->ct_enabled) {
-		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
+		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
 		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
@@ -1375,7 +1375,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 	} else {
-		drm_puts(p, "\nCT disabled\n");
+		drm_puts(p, "CT disabled\n");
 	}
 }
 
-- 
2.43.0

