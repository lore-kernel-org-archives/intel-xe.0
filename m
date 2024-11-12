Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB5D597B0
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CDB10E671;
	Tue, 12 Nov 2024 22:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCNMXpSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C7110E671
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448857; x=1762984857;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dR96wHLfiMWVVWAj1+LiDMwpPFqIEcxKAm0mu3Fmqas=;
 b=VCNMXpSlPkqAOfR9/4fxBIuRRXbdVukfV1rqQieDVSEeAKXR6jRQSFOi
 C0W4LpilZ9aqM4UiETsLVOa59xyuBmyZEbHjtvHUlk5oNilXrP2EavPwT
 kKzImIJZAq+mFvYPuB0Yh0IuBiNia/+JQIhzDYKG527d49X8zUskw1/2g
 v2DNV2b+DBh4+hCNvUPzOTTOrjIzOGbjCFTfNsFK5AQy0Mbr84Z12Hhrt
 n9xnZgRjCFF63Zh6KMev1ZnynHyeI5LGFgVpWrbNPZl6kvI5q/LmjmLsz
 MObaO1yl8+qOR2f707Iz/2COS9wYK4atnQ8mvaCZ2n/44M2AtLPu3PpZN g==;
X-CSE-ConnectionGUID: EY/6NymIQsCVeL4alO91Lg==
X-CSE-MsgGUID: EaFHnTIGQNyyICFAvSy/pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31403993"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31403993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:57 -0800
X-CSE-ConnectionGUID: zkgPtxvsQTGKP+kE49fnzQ==
X-CSE-MsgGUID: q2y0iNp2TPeVGdVr1lZgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118605696"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/xe: Add xe_ring_lrc_is_idle() helper
Date: Tue, 12 Nov 2024 14:01:21 -0800
Message-Id: <20241112220127.1369527-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
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

