Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E539D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C7C10E2A3;
	Fri,  8 Nov 2024 23:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7h1oWax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1781010E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731107166; x=1762643166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FUylestIo9XVSh0jx/HmT0qtmrxfl0hnNbO+nhKs92w=;
 b=i7h1oWaxjHAAn7TqNUSK6uMVXVUShR1A7/rqZOYR0Ev9lLi9i4o+01uE
 ASi+AgkcjxRhJYLrtDUz1iu1TH9tsf3rv4dl3kfH1nfNRsTFvs9Jhv2h/
 NgqL5xG5d5jyBJNgv6e1uOzFaopFFWUUOik2rFKMrW9TtFz3GGCrcHpbQ
 zSh5VmuUhcrGMi3FAZ5QKZrQHI1m+Fn3JkmqdWUp2T8gt+pczW8VWVrsg
 SjDfB8Cjfx4ZZcIWzn8hxUQU9IWbnhqM0d54B/4Ko8Lk6gPZ6SVgdyfTU
 nH1lzMBoDbIjFUoMw/2PAs034GUZq6fNJLd2KXFAnGoPjfSKZQS1BcRMp A==;
X-CSE-ConnectionGUID: ZzRqapN6Rm2Cv6U/R48BuA==
X-CSE-MsgGUID: 1UAOzilzT8yr0h+RWWFE4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42407022"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="42407022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:06:06 -0800
X-CSE-ConnectionGUID: JlLbtvZ3S5+hHFYl3Tk1qw==
X-CSE-MsgGUID: Lc3EO+2jQLC+By6FpsOBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="86561703"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:06:06 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/2] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Date: Fri,  8 Nov 2024 15:06:00 -0800
Message-ID: <20241108230602.2984959-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
References: <20241108230602.2984959-1-ashutosh.dixit@intel.com>
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

Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
underlying HW context image. Therefore, enabling OA on an already active
exec_queue (as currently implemented in xe) is an invalid operation and can
cause hangs. Therefore, disallow OA from being enabled on active
exec_queue's (here by active we mean a context on which submissions have
previously happened).

Transition from 1 -> 0 for this bit was disallowed in
'0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
close")'. Here we disallow the 0 -> 1 transition on active contexts.

Bspec: 60314
Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
 drivers/gpu/drm/xe/xe_oa.c         | 11 +++++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e0f86f3778b2..5c285d966fd5c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -83,7 +83,7 @@ static void clear_exec_queue_registered(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
 }
 
-static bool exec_queue_enabled(struct xe_exec_queue *q)
+bool exec_queue_enabled(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 9b71a986c6ca6..a3bde061dd53c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -12,6 +12,7 @@ struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
 
+bool exec_queue_enabled(struct xe_exec_queue *q);
 int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fd2ffe8df1561..b0692b8ca0a3d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -28,6 +28,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_submit.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -2064,6 +2065,16 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
 
+		/*
+		 * Disallow OA from being enabled on active exec_queue's. Enabling OA toggles
+		 * the OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register, which changes the size
+		 * and layout of the underlying HW context image and can cause hangs.
+		 */
+		if (XE_IOCTL_DBG(oa->xe, exec_queue_enabled(param.exec_q))) {
+			ret = -EADDRINUSE;
+			goto err_exec_q;
+		}
+
 		if (param.exec_q->width > 1)
 			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
 	}
-- 
2.41.0

