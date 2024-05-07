Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E36DC25B4F
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB09310E197;
	Tue,  7 May 2024 22:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHw47Q7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B816910E197
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121780; x=1746657780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5iOgMqbGHJRe1Gtck7kGlZI+apQD8/UiPTdx/aBdFo=;
 b=RHw47Q7qrwcjeZGNQ8EwlL5D7dtAWWh5AyDDWR182K1HcNi4HW4xqqgU
 0xQ8+mD7m09cB6FW+AvCQMHMOjPpXQ0XQqeEjkdiaF32oda4y2e3I6ld6
 j85LiOsMWQtCkhE2m+3HVAYxY4WCJEZ8Itpm6EVnf5CpkA98eMEwQ6Whl
 6/lmJJsQ5AaFLXpcFxzykfJYUqt3Tjjwu+bDjHNTkSlaIVVgzud5EHvyv
 XEOgqna4tp9G2lykiJxFtu51ImGyRqNvA9+kjfy6lHkfgIrSqUT1yz5zx
 sshajPLKxCSB78tvj4SFYM2evcLSfn97X/Ug2IW/kvKwoQddpVLOL/UOT g==;
X-CSE-ConnectionGUID: GwrbdIkGQPy3sI3uJ9l21g==
X-CSE-MsgGUID: Jd2q7VnmSGqR9d2szZWynA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108370"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
X-CSE-ConnectionGUID: aQVrX6ybSTGvqv/jLcF0TQ==
X-CSE-MsgGUID: 4oeEWc/WTrSGzXHCzwXWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33156986"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, stuart.summers@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 1/4] drm/xe: Minor cleanup in LRC handling
Date: Tue,  7 May 2024 15:42:50 -0700
Message-ID: <20240507224255.5059-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
References: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
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

Properly define register fields and remove redundant
lower_32_bits().

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++--
 drivers/gpu/drm/xe/xe_lrc.c              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 97d2aed63e01..7e1b0fd68275 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -44,9 +44,10 @@
 #define GSCCS_RING_BASE				0x11a000
 
 #define RING_TAIL(base)				XE_REG((base) + 0x30)
+#define   TAIL_ADDR				REG_GENMASK(20, 3)
 
 #define RING_HEAD(base)				XE_REG((base) + 0x34)
-#define   HEAD_ADDR				0x001FFFFC
+#define   HEAD_ADDR				REG_GENMASK(20, 2)
 
 #define RING_START(base)			XE_REG((base) + 0x38)
 
@@ -136,7 +137,6 @@
 #define   RING_VALID_MASK			0x00000001
 #define   RING_VALID				0x00000001
 #define   STOP_RING				REG_BIT(8)
-#define   TAIL_ADDR				0x001FFFF8
 
 #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
 #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2066d34ddf0b..f759f4c10914 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1354,7 +1354,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	snapshot->context_desc = lower_32_bits(xe_lrc_ggtt_addr(lrc));
+	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
 	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
-- 
2.43.0

