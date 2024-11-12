Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB8ED597B0
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B04310E672;
	Tue, 12 Nov 2024 21:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG97gjCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AFD10E670
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448522; x=1762984522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dR96wHLfiMWVVWAj1+LiDMwpPFqIEcxKAm0mu3Fmqas=;
 b=SG97gjCvWvCR1/JUJhS/wMmhG7WTNMjLJqzWIxmCbUi0BvBPJI9gqa28
 OJqg4IZNjP6aZ68YXp1gTingabPzx98sMBnW7frigx1kI1HnfUJq7dmgm
 nnZmgHBXebvuVYez09KcpLHM6W7udZ5LI3uSRbJd9lgqCW8UYNDPLiSUE
 opY2KW4qbSKT3pIjPPlnOYrJZjGqOvbQJCD0QlTcYVYdqPkEpo++OQu0P
 qIm4IF8ymSl8C48yMBZzZ92RCl7YANo9mUQByGtMrMrjUhWEbUNXBy4+b
 xSbDUwlZIegcy6kN2xmRuhcjX503QCZCqf8d0KksFSUmRoH5V+Hr9WsBT w==;
X-CSE-ConnectionGUID: b3D+NiqaR5OCcT2bwKbubg==
X-CSE-MsgGUID: 2GDvZZ8WRY29UMR2+KVJYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190107"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: nmZ4Si2hRDGCbOULFz0yIQ==
X-CSE-MsgGUID: xtpl5omvQjaJFkSrRvMGOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050232"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/xe: Add xe_ring_lrc_is_idle() helper
Date: Tue, 12 Nov 2024 13:55:47 -0800
Message-Id: <20241112215553.1369146-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112215553.1369146-1-matthew.brost@intel.com>
References: <20241112215553.1369146-1-matthew.brost@intel.com>
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

v2:
 - Fix kernel doc (CI, Zhanjun)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c        | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c70b75a3eb85..663ad4d97b34 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1696,7 +1696,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 				ban = true;
 			}
 		} else if (xe_exec_queue_is_lr(q) &&
-			   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
+			   !xe_lrc_ring_is_idle(q->lrc[0])) {
 			ban = true;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..e0d80e8201eb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1763,3 +1763,16 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
 
 	return lrc->ctx_timestamp;
 }
+
+/**
+ * xe_lrc_ring_is_idle() - LRC is idle
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

