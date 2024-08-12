Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EECDC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 18:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC9210E268;
	Mon, 12 Aug 2024 18:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2rtG9Bz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A3710E268
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723486249; x=1755022249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CE6AcgIsg9GtMC0Xj66KLrEL5UyMoVUM0iN7uDaC1h8=;
 b=V2rtG9BzGkTkdhIqUTGmG7XoNJeFSenjfi5LrPkYY/kr8P4PBAEVUT2c
 TB+eyVDbm2LouwC9XmzKspizmwZcWnY2IwClCv0pLlIWG51dOpHDpvIgI
 MXSXvXCgevn+oFmFxkmyBrhx0zVY+gI7o5xaXDuQWnCPVHa9fgHS/nmd/
 k5nLtI1558/HJvMHHF6drmKJhwweTgiGfbMa4xcKytIUCqIcjNmf2qx9S
 ynfIfUR7l//VMwV0Liq5bhTfIbLJ74H3ISsV46Q8gvbTBUvkgPLfY74jV
 vUM026Bkn23+cupj23BSCYGDsPEgGxb8dbzDnzqKtI558YDxpqpX6hWae g==;
X-CSE-ConnectionGUID: n2JcaXv9QPGLYRSEZMJ+7A==
X-CSE-MsgGUID: 42RZwm/STyGIHf7WT+eThg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32187412"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32187412"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:10:49 -0700
X-CSE-ConnectionGUID: jx1Zp1CjQKOA8d6c29KI9A==
X-CSE-MsgGUID: zjxITCx0R3CgWo9Gx3pe+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58232133"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:10:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Name and document Wa_14019789679
Date: Mon, 12 Aug 2024 11:10:43 -0700
Message-ID: <20240812181042.2013508-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

Early in the development of Xe we identified an issue with SVG state
handling on DG2 and MTL (and later on Xe2 as well).  In
commit 72ac304769dd ("drm/xe: Emit SVG state on RCS during driver load
on DG2 and MTL") and commit fb24b858a20d ("drm/xe/xe2: Update SVG state
handling") we implemented our own workaround to prevent SVG state from
leaking from context A to context B in cases where context B never
issues a specific state setting.

The hardware teams have now created official workaround Wa_14019789679
to cover this issue.  The workaround description only requires emitting
3DSTATE_MESH_CONTROL, since they believe that's the only SVG instruction
that would potentially remain unset by a context B, but still cause
notable issues if unwanted values were inherited from context A.
However since we already have a more extensive implementation that emits
the entire SVG state and prevents _any_ SVG state from unintentionally
leaking, we'll stick with our existing implementation just to be safe.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c        | 35 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 58121821f081..974a9cd8c379 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -5,6 +5,8 @@
 
 #include "xe_lrc.h"
 
+#include <generated/xe_wa_oob.h>
+
 #include <linux/ascii85.h>
 
 #include "instructions/xe_mi_commands.h"
@@ -24,6 +26,7 @@
 #include "xe_memirq.h"
 #include "xe_sriov.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 #define LRC_VALID				BIT_ULL(0)
 #define LRC_PRIVILEGE				BIT_ULL(8)
@@ -1581,19 +1584,31 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 	int state_table_size = 0;
 
 	/*
-	 * At the moment we only need to emit non-register state for the RCS
-	 * engine.
+	 * Wa_14019789679
+	 *
+	 * If the driver doesn't explicitly emit the SVG instructions while
+	 * setting up the default LRC, the context switch will write 0's
+	 * (noops) into the LRC memory rather than the expected instruction
+	 * headers.  Application contexts start out as a copy of the default
+	 * LRC, and if they also do not emit specific settings for some SVG
+	 * state, then on context restore they'll unintentionally inherit
+	 * whatever state setting the previous context had programmed into the
+	 * hardware (i.e., the lack of a 3DSTATE_* instruction in the LRC will
+	 * prevent the hardware from resetting that state back to any specific
+	 * value).
+	 *
+	 * The official workaround only requires emitting 3DSTATE_MESH_CONTROL
+	 * since that's a specific state setting that can easily cause GPU
+	 * hangs if unintentionally inherited.  However to be safe we'll
+	 * continue to emit all of the SVG state since it's best not to leak
+	 * any of the state between contexts, even if that leakage is harmless.
 	 */
-	if (q->hwe->class != XE_ENGINE_CLASS_RENDER)
-		return;
-
-	switch (GRAPHICS_VERx100(xe)) {
-	case 1255:
-	case 1270 ... 2004:
+	if (XE_WA(gt, 14019789679) && q->hwe->class == XE_ENGINE_CLASS_RENDER) {
 		state_table = xe_hpg_svg_state;
 		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
-		break;
-	default:
+	}
+
+	if (!state_table) {
 		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
 			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5cf27ff27ce6..920ca5060146 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -35,3 +35,5 @@
 		GRAPHICS_VERSION(2001)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
+14019789679	GRAPHICS_VERSION(1255)
+		GRAPHICS_VERSION_RANGE(1270, 2004)
-- 
2.45.2

