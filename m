Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D498C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 17:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B950310E356;
	Tue, 16 May 2023 17:33:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC210E351
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684258404; x=1715794404;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TgOrB64FsE0XkZozoI1xrtn4+exBTB9guez71KJG+/A=;
 b=jd1ANiweskYihJwE98RVGgrCbEvyzRuSLR0a+QInFk5M1n9fBPhQE4Sl
 ppeYmuTdATZgmEr0WA6gBUuuQGJ4YpeobO5V2ruPaCsS6yex01ql8VoPH
 IBLL87E1YOwU2VB+a7RYDW0tYvgc58oG9922QnJGYqglThIvkt5pnwCQx
 TF7uSejK964UT5aAtPBczyPgMbn2ebhh8W2cPJDD4j9/sCFSkZMTpERWo
 zqSKk22KnQTpcXkuobzwt2QtdIaG4qBiAvF8pvFzfNxZ964eH0NbDO1JD
 7bY2OsSKJy/WO+tR8V1XEehk6KwoWE68r+po1+zDBMTwlutuDNrLREsxI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331904058"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331904058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="791146467"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791146467"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:33:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 18:32:53 +0100
Message-Id: <20230516173258.181118-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516173258.181118-1-matthew.auld@intel.com>
References: <20230516173258.181118-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/7] drm/xe: don't allocate under ct->lock
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

Seems to be a sensitive lock, where ct->lock looks to be primed with
fs_reclaim, so holding that and then allocating memory will cause
lockdep to complain. We need to change the ordering wrt to grabbing the
ct->lock and potentially grabbing the runtime_pm, since some of the
runtime_pm routines can allocate memory (or at least that's what lockdep
seems to suggest).

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 13 +++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index c815a42e2cdb..20f8f0aae6b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -5,6 +5,7 @@
 
 #include "xe_gt_tlb_invalidation.h"
 
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -112,6 +113,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * in order which they currently are, if that changes the algorithm will
 	 * need to be updated.
 	 */
+
+	xe_device_mem_access_get(gt->xe);
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
@@ -140,6 +143,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	if (ret < 0 && fence)
 		invalidation_fence_signal(fence);
 	mutex_unlock(&guc->ct.lock);
+	xe_device_mem_access_put(gt->xe);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9055ff133a7c..579d7f341f13 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -494,26 +494,22 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		}
 	}
 
-	xe_device_mem_access_get(ct_to_xe(ct));
 retry:
 	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
 	if (unlikely(ret))
-		goto put_wa;
+		goto out;
 
 	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
 			!!g2h_fence);
 	if (unlikely(ret)) {
 		if (ret == -EAGAIN)
 			goto retry;
-		goto put_wa;
+		goto out;
 	}
 
 	g2h_reserve_space(ct, g2h_len, num_g2h);
 	xe_guc_notify(ct_to_guc(ct));
-put_wa:
-	xe_device_mem_access_put(ct_to_xe(ct));
 out:
-
 	return ret;
 }
 
@@ -535,6 +531,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	XE_BUG_ON(g2h_len && g2h_fence);
 	lockdep_assert_held(&ct->lock);
+	xe_device_assert_mem_access(ct_to_xe(ct));
 
 try_again:
 	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
@@ -602,10 +599,14 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	XE_BUG_ON(g2h_len && g2h_fence);
 
+	xe_device_mem_access_get(ct_to_xe(ct));
+
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
 	mutex_unlock(&ct->lock);
 
+	xe_device_mem_access_put(ct_to_xe(ct));
+
 	return ret;
 }
 
-- 
2.40.1

