Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894BBC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 22:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA9210E162;
	Tue, 15 Apr 2025 22:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjEk49nE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BBA10E162
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 22:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744757343; x=1776293343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lcX6ugAOgyZE4hkXEYFx/tpUj+3Kc++Bqzafgq/98Z8=;
 b=kjEk49nENTif7NA9ketzlD1ga+oQ7QAb0LYuwMip1rp2jWAF7PCX/7Mc
 CrSTmL7cA2Pt9E8g7xAoqlMkwZrRz/ZriIR6wzUSyTmP94BKHsgl/yPui
 Kl5NqEz4+UGg/J6lyOchQwVzZ0/h9mC+Sd3PTUuGh2oqXFz8niDM10+Ks
 oRTayql1cA8nI0m4SDLvRLrv06oNYjP3jVmFj/e8etI6lDZYKJ16xFylq
 RgsGd3RAeglf1Z2tGNU0uByj7Ex9Ue8SLxLv9r9TxwbhBOyhugRALc2Zp
 RzCOZou1ApxkxmL0swKQlDPXZh/CuEXJpB1K3hw6xhbWFh/FKD4MLPE2B Q==;
X-CSE-ConnectionGUID: 0t0uPv+fQ9W2MoLIullA1A==
X-CSE-MsgGUID: B/eivblESoq/bpNpsVsn2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46449571"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="46449571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:49:03 -0700
X-CSE-ConnectionGUID: fL9yFgtnSSmZfTnjvySlGQ==
X-CSE-MsgGUID: 1AIcABOLTAuUcHBAvm03wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="130567456"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 15:49:03 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/pxp: do not queue unneeded terminations from debugfs
Date: Tue, 15 Apr 2025 15:48:44 -0700
Message-ID: <20250415224845.1283199-1-daniele.ceraolospurio@intel.com>
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

The PXP terminate debugfs currently unconditionally simulates a
termination, no matter what the HW status is. This is unneeded if PXP is
not in use and can cause errors if the HW init hasn't completed yet.
To solve these issues, we can simply limit the terminations to the cases
where PXP is fully initialized and in use.

Fixes: 385a8015b214 ("drm/xe/pxp: Add PXP debugfs support")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4749
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp_debugfs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
index ccfbacf08efc..eb4a084103e3 100644
--- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
@@ -66,9 +66,18 @@ static int pxp_terminate(struct seq_file *m, void *data)
 {
 	struct xe_pxp *pxp = node_to_pxp(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
+	int pxp_status = xe_pxp_get_readiness_status(pxp);
 
-	if (!xe_pxp_is_enabled(pxp))
-		return -ENODEV;
+	if (pxp_status < 0)
+		return pxp_status; /* disabled or error occurred */
+	else if (!pxp_status)
+		return -EBUSY; /* init still in progress */
+
+	/* no need for a termination if PXP is not active */
+	if (pxp->status != XE_PXP_ACTIVE) {
+		drm_printf(&p, "PXP not active\n");
+		return 0;
+	}
 
 	/* simulate a termination interrupt */
 	spin_lock_irq(&pxp->xe->irq.lock);
-- 
2.43.0

