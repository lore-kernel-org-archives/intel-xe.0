Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D22C369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 20:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5D710E9AC;
	Wed, 16 Apr 2025 20:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHCYiU+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3368B10E9AC
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744834592; x=1776370592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=foVj0wpwfVGVsTG4xD0gvzrlF+yagJ/SIaQ1oqyRgKE=;
 b=UHCYiU+dVlphLZf3Nju+EPGurLTWnifHU/XIvJMovbBP+FszF+yDIvJ2
 gSuj/y4PZ9YTOf4UWfirQyLQ0Jk5iBb4XtqeAvhp5N0xdFUWOi4HX86RD
 W488osEzqh+Gq9DvqJhiIoC8xOXOwtZt/a3+qUKq/SmcAM11+4Tcq+Fnm
 JVb+xfl70LEIttgcA+dGyXCIG41NRPTOdb7m8QFyCSGbtd3ZhHk5xoWpQ
 GO8H54KzJhqlH8l7j7xFqv1hR88GZr/RiScAClOUoZpw/FVzqkUKW1pvB
 NKqe2PYeOvQyD6OB9EX/k4wHDcExlLUozS3IMOTy+6tY+glf6NConVT+y w==;
X-CSE-ConnectionGUID: 4X9HUTVbSB685/+mTFpepw==
X-CSE-MsgGUID: X8aqnNmhRXGN6RA6k+/oBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45537438"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="45537438"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 13:16:32 -0700
X-CSE-ConnectionGUID: FaMr810ZR8OXTzSQp6eDDA==
X-CSE-MsgGUID: rcsPN71XSs2eFPJOc0zl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="130450567"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 13:16:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2] drm/xe/pxp: do not queue unneeded terminations from debugfs
Date: Wed, 16 Apr 2025 13:16:22 -0700
Message-ID: <20250416201622.1295369-1-daniele.ceraolospurio@intel.com>
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

v2: s/pxp_status/ready/ to avoid confusion with pxp->status (John)

Fixes: 385a8015b214 ("drm/xe/pxp: Add PXP debugfs support")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4749
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp_debugfs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
index ccfbacf08efc..525a2f6bb076 100644
--- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
@@ -66,9 +66,18 @@ static int pxp_terminate(struct seq_file *m, void *data)
 {
 	struct xe_pxp *pxp = node_to_pxp(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
+	int ready = xe_pxp_get_readiness_status(pxp);
 
-	if (!xe_pxp_is_enabled(pxp))
-		return -ENODEV;
+	if (ready < 0)
+		return ready; /* disabled or error occurred */
+	else if (!ready)
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

