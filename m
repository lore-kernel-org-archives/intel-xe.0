Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D848D32D81
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 18:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC88D10E61A;
	Tue, 12 Nov 2024 18:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDJLMTno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE27210E622
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731437717; x=1762973717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lj2dVmT4MKC1OKJa8YHi5tnS29plvuZ61MF2jX+IXp0=;
 b=UDJLMTnoxYM5HcTvPl5mtDA+RRo/z9682CD06Cj6vbHwDnr1ocTKyZ5a
 lJBCnVci09ejdPqMpAd601Zq7O5VejqFOfVCQY7E3RnrHoPU8m5aiH2lY
 dRfvjwXZ3h12QFscE+zvlXCYKYrnss42cdUGg+08QJ1Zzh0QF6zMoAtA6
 MIYa16kJmHMaXxwx7mECwrpX3FGzFLksaQulh621NJzj3QoUOCP4RZodc
 5me2lNYzaYWfYSPI0YQJh/jEQKQkQD9N2I3gcWSC/X7yqSJLuCqbUlcGv
 etkG1Hi1Y0i90x+tfjTsbRR2JMeKwiHJpwN3TLtbud7fmPt/jnyLh48+p A==;
X-CSE-ConnectionGUID: 38xSf8HgSj+eAmxyUt/1jQ==
X-CSE-MsgGUID: UFMfIXyERomUsJJav5/JCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31146658"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31146658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 10:55:16 -0800
X-CSE-ConnectionGUID: z8GRR0d+R8OGtWjhkEeoQQ==
X-CSE-MsgGUID: 4iJFafdnRD+aIYPZPpvAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="125122901"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 10:55:17 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com, zhanjun.dong@intel.com,
 alan.previn.teres.alexis@intel.com, matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Date: Tue, 12 Nov 2024 18:55:15 +0000
Message-ID: <20241112185515.64060-1-jonathan.cavitt@intel.com>
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

The qualifier "desc" as used in the xe_lrc_snapshot struct is a legacy
term used by i915 that has been incorrectly applied to some of the
attributes.  Said attributes that use the "desc" qualifier, namely
"context_desc" and "indirect_context_desc", would more accurately be
referred to as addresses, so replace the incorrect "desc" qualifier with
"addr" in these cases.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Zhanjun Dong <zhanjun.dong@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
 drivers/gpu/drm/xe/xe_lrc.c         | 8 ++++----
 drivers/gpu/drm/xe/xe_lrc.h         | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index cc72446a5de1..b95c21a18c31 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1632,7 +1632,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 		if (ge) {
 			guc_id = ge->guc.id;
 			if (ge->lrc[0])
-				lrca = ge->lrc[0]->context_desc;
+				lrca = ge->lrc[0]->context_addr;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..09f0e66952e7 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
-	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
+	snapshot->context_addr = xe_lrc_ggtt_addr(lrc);
+	snapshot->indirect_context_addr = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
 	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
@@ -1692,9 +1692,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	if (!snapshot)
 		return;
 
-	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
+	drm_printf(p, "\tHW Context Address: 0x%08x\n", snapshot->context_addr);
 	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
-		   snapshot->indirect_context_desc);
+		   snapshot->indirect_context_addr);
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
 	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
 		   snapshot->tail.internal, snapshot->tail.memory);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..f6bf81009294 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -24,8 +24,8 @@ struct xe_lrc_snapshot {
 	void *lrc_snapshot;
 	unsigned long lrc_size, lrc_offset;
 
-	u32 context_desc;
-	u32 indirect_context_desc;
+	u32 context_addr;
+	u32 indirect_context_addr;
 	u32 head;
 	struct {
 		u32 internal;
-- 
2.43.0

