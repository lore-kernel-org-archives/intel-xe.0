Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D05D64072
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 17:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97D10E28B;
	Fri,  8 Nov 2024 17:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYoLFELi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DE210E28B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731087763; x=1762623763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i2JvInu9jBNXUR9pEJAekEOLc8xVY5zeF4ML5y4BfYY=;
 b=MYoLFELi6pnuG+KQe3HE4ruMcjnUguRk1NcjBaRCWLPnqQpc4c7AThfP
 2vLnoyBlfnoF8YKnSrutGicPIePog8qedSrXYDJe1Guspo4VmtKI0KpuX
 uolQhpsFjiAaNfX0xPZ6tCex0YoxaCGKOE/TPgJhcsvOFepQoNY4G1DDk
 oqUpL+asCgESpxr/+2rOyXCcUjKxhru9B84TG79FORrw1I86uEcgBx1f1
 1YknYfam67u98u7gDu+eg4yZCn9jklqQ6NH3B7MsQQE7e7EOBDmsQiEWT
 4Ow4AKb8By4gtHS/EMSqZE6QN4LqNSjQLfzEtYm41LmpKhF3QpmMfVGy0 A==;
X-CSE-ConnectionGUID: WZtTSWlaQDGjkwbFlsh5Xg==
X-CSE-MsgGUID: b2n47h9kTDOsfMY53v0Qhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41598606"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41598606"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: E+EP2MNhQnqK1aueuPX7ig==
X-CSE-MsgGUID: b6XQPoytShePd/eawj/9Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86001285"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:42:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com, zhanjun.dong@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 1/7] drm/xe: Add xe_lrc_is_idle() helper
Date: Fri,  8 Nov 2024 09:43:06 -0800
Message-Id: <20241108174312.272792-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108174312.272792-1-matthew.brost@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
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

Add helper to compare ring head and tail to determine if LRC is idle.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c        | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e0f86f3778b..e7257c681278 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1705,7 +1705,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 				ban = true;
 			}
 		} else if (xe_exec_queue_is_lr(q) &&
-			   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
+			   !xe_lrc_ring_is_idle(q->lrc[0])) {
 			ban = true;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..e219657535cf 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1763,3 +1763,16 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
 
 	return lrc->ctx_timestamp;
 }
+
+/**
+ * xe_lrc_is_idle() - LRC is idle
+ * @lrc: Pointer to the lrc.
+ *
+ * Compare LRC ring head and tail to determine if idle.
+ *
+ * Return: True is ring is idle, False otherwise
+ */
+bool xe_lrc_ring_is_idle(struct xe_lrc *lrc)
+{
+	return xe_lrc_ring_head(lrc) == xe_lrc_ring_tail(lrc);
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..9d64cedc4d14 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -78,6 +78,8 @@ u32 xe_lrc_ring_head(struct xe_lrc *lrc);
 u32 xe_lrc_ring_space(struct xe_lrc *lrc);
 void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size);
 
+bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
+
 u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
-- 
2.34.1

