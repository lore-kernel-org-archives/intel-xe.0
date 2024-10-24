Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA9BD0BB4A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 00:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91310E24B;
	Thu, 24 Oct 2024 00:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h967kwnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F21010E24F
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Oct 2024 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729729556; x=1761265556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QF3FWHaCP48XqfF4IRwmhVJAePI+Ww7F9vZAgAWNLzo=;
 b=h967kwnz6B6HK8ce27XsVhlZ61IIYwF+tBKSQfCINxNVnLSM489KkFIE
 BHfVxarvKhZsrw47WgKlQDL7JBVKboQe2hEkDqX8ojlwhkUDFCCDM95NU
 slcsojhUAUE6v9xg3al14yU4jhlrM0YrJvk+1hoGwrB/i/ONJXrUNsqrm
 QyWQHTlcsFg2kFw3jKyQA22SyudcRSIKV7gDbrT6AFLNn2Pigt1kCamix
 rufevbv4NN6HMA/qCtrDM6jAFtfCc4fIvyc0eVBTWllmqTcp76vgMSxA6
 xY0lN41fJjhgDfPUa0S8mu5Mtt3Gy8YGfLE9mc3x9yiX9jx9rwlp0Mkte w==;
X-CSE-ConnectionGUID: 8OcVCP5OT86lmFmEle82EA==
X-CSE-MsgGUID: NcJt57uHTlmj2JMo6bdHpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33254616"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="33254616"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 17:25:55 -0700
X-CSE-ConnectionGUID: Trde/xg/QVyPpZU+CLb7Yg==
X-CSE-MsgGUID: YTMZcSRJR6Giikzlic4hyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80844927"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 17:25:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/2] drm/xe/guc: Capture all available bits of GuC timestamp
Date: Wed, 23 Oct 2024 17:25:53 -0700
Message-ID: <20241024002554.1983101-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
References: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The extra bits are not hugely useful because the GuC log only uses
32bit time stamps. But they exist so might as well provide them.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c       | 6 +++---
 drivers/gpu/drm/xe/xe_guc_log_types.h | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index b27b73680c12..2118f7dec287 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -84,7 +84,8 @@
 #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
 #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
 #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
-#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
+#define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
+#define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
 
 #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
 #define   GUC_SEND_TRIGGER			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index fead96216243..df4cfb698cdb 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -171,9 +171,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref) {
-		snapshot->stamp = ~0;
+		snapshot->stamp = ~0ULL;
 	} else {
-		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
+		snapshot->stamp = xe_mmio_read64_2x32(&gt->mmio, GUC_PMTIMESTAMP_LO);
 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 	snapshot->ktime = ktime_get_boottime_ns();
@@ -205,7 +205,7 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
 		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
 	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
-	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
+	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
 	drm_printf(p, "Log level: %u\n", snapshot->level);
 
 	remain = snapshot->size;
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 4d57f8322efc..b3d5c72ac752 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -27,7 +27,7 @@ struct xe_guc_log_snapshot {
 	/** @ktime: Kernel time the snapshot was taken */
 	u64 ktime;
 	/** @stamp: GuC timestamp at which the snapshot was taken */
-	u32 stamp;
+	u64 stamp;
 	/** @level: GuC log verbosity level */
 	u32 level;
 	/** @ver_found: GuC firmware version */
-- 
2.47.0

