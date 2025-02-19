Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AA7C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 19:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6FD10E045;
	Wed, 19 Feb 2025 19:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaZfPNH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A5810E045
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739993651; x=1771529651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=skE98GgozfADGh24aDkm+WRMaksmRney9HwyIIfJJZw=;
 b=CaZfPNH7JRUDZ3lKkjD9WrROOItvPOoKWOrkpfHxfc/wUqZiF7GwxOdg
 RS+JFFbSrIpjxTcB0sz945Wh2TFVXLJFiaf3E/q/sSqbdP73GSGc/sDE0
 NiQ6uNw57v/a1wxUxlFoxjxRJFLkIAl6lAQavPph45NRFse4FkCBWmiBE
 D7TyHjR7rLKYl+xOWZGQ4HyhnCkg24fX0wYz+rqth9VdTKCy31/41U3fG
 psj484s4YZ8Q6nfZE/Qr3YegY9g2ZQLQXj5F4DGwzUpICDrp5mW6rlDYC
 y0Mz2984tp/cIUZa/Ldia6lwLDbuSE5Uvgn8DAAaYWFAt699NBADsOVfV g==;
X-CSE-ConnectionGUID: M0/LGEAgS+6aSYAh+DY6XQ==
X-CSE-MsgGUID: cwJ2I8VMSgm2iTbYpwzIPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44396087"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44396087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:34:10 -0800
X-CSE-ConnectionGUID: 3SzUeUFUTtOYXJTTx+Dv+w==
X-CSE-MsgGUID: FwN4/CLLQu+/suTlNlqFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114769953"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by orviesa006.jf.intel.com with ESMTP; 19 Feb 2025 11:11:30 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/devcoredump: Fix print typo of offset
Date: Wed, 19 Feb 2025 19:07:39 +0000
Message-Id: <20250219190739.1775077-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The log should print with "offset" instead of "size".

kzalloc returns a valid pointer or NULL if the allocation fails.
It never returns an error pointer. It is better to check for NULL directly.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 39fe485d2085..81b9d9bb3f57 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -237,7 +237,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
-	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
+	 * internally using GFP_KERNEL explicitly. Hence this call must be in the worker
 	 * thread and not in the initial capture call.
 	 */
 	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
@@ -423,11 +423,11 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
 	if (size & 3)
 		drm_printf(p, "Size not word aligned: %zu", size);
 	if (offset & 3)
-		drm_printf(p, "Offset not word aligned: %zu", size);
+		drm_printf(p, "Offset not word aligned: %zu", offset);
 
 	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
-	if (IS_ERR_OR_NULL(line_buff)) {
-		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
+	if (!line_buff) {
+		drm_printf(p, "Failed to allocate line buffer\n");
 		return;
 	}
 
-- 
2.25.1

