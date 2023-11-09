Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0FC4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3992D10E8FA;
	Thu,  9 Nov 2023 19:46:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE44110E8FA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699559189; x=1731095189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omI+rNKls4V8albyYzWx7jUrCOWsbUWAihxaIIgUgSs=;
 b=ZDxf8eqVFuHYeKGGOspmgy2ZX1wm/JlWDyyJp8cu4xnCUayFO9v9sg+k
 PEjKjr4LXkvQd0c2RDnFGpMusMAhv9apGQ2/8Z3WIaXObd20xrfkribTd
 panWraMu8TRfN8ISwli/GfFSKSHh2llKis6F/6CaeKlRBLAI5PCR7zU15
 ndKLfMihYL0o9zwKnGKzLXo9Euw632tNCK/Zdyp6yMLFQX1QXJoZLOw5T
 cFnxdeaWOysGIA0YpiOChphcyBZqK04IoIlcbOFDZZNb5EPcrqty8VZGZ
 RWNjmWs3zC0KThX2gswPMnWtGo1/SRw8g6jMs+f9gFx4VTTt7OUInSDdT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="388919779"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="388919779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:46:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887127540"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="887127540"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:46:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 11:46:07 -0800
Message-ID: <20231109194606.1835284-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Drop EXECLIST_CONTROL from error state
 dump
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
Cc: matthew.d.roper@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

EXECLIST_CONTROL ($enginebase + 0x550) is a write-only register; we
shouldn't be trying to read or report it as part of the device error
state.

Bspec: 45910, 60335
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 4 ----
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5b084590888..e831e63c5e48 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -704,8 +704,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_execlist_sq_contents_hi =
 		hw_engine_mmio_read32(hwe,
 				      RING_EXECLIST_SQ_CONTENTS_HI(0));
-	snapshot->reg.ring_execlist_control =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0));
 	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
 	snapshot->reg.ring_head =
 		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
@@ -765,8 +763,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->reg.ring_execlist_sq_contents_lo);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
 		   snapshot->reg.ring_execlist_sq_contents_hi);
-	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		   snapshot->reg.ring_execlist_control);
 	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
 	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
 	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 5d4ee2904240..39908dec042a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -183,8 +183,6 @@ struct xe_hw_engine_snapshot {
 		u32 ring_execlist_sq_contents_lo;
 		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
 		u32 ring_execlist_sq_contents_hi;
-		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
-		u32 ring_execlist_control;
 		/** @ring_start: RING_START */
 		u32 ring_start;
 		/** @ring_head: RING_HEAD */
-- 
2.41.0

