Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF3D111B6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BF610E72F;
	Wed, 26 Nov 2025 23:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdcjJVJO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3D710E71E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198129; x=1795734129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4em+Eq2QEsq0AO0qneS9NoZYv7bXOaPGAAc0VgkaECM=;
 b=kdcjJVJOan69YZBXLmpt88fKVyZPeL6UW5ZCE0NhxgEd+aRTe+AsSdmO
 Sj8JPRWGAzHxUHLlm1PnV/A999Yz9o0CZrTdT1vNsqzFuTWxQBWZXxHOo
 Lh//c4Vxc1TMjA7KWSPj6fa+vPCqNcjz6NOZcr5H/AdBRxIbUe43m44fS
 z4UtbQLyNIP1cgKCrC8oQZhNL08BxliBBfqSV3Lwi/ZTgOQmT1ijQvJK5
 DRYHqEvf/MEm0QzhMmvXlNi1cVV6u3Yip1wd9MSoYiRGTtDG+Y+zCpp6R
 qijf0g+HXKYEGmN0CDGHwjUyLTYDUyyfICi/19MFvgiLD7JYcmLnUCsOW A==;
X-CSE-ConnectionGUID: WAtSqO2PSQms4AKEtDbwVQ==
X-CSE-MsgGUID: 78L+MljbQmyPjDdfXyteVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284509"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:09 -0800
X-CSE-ConnectionGUID: +S1Iv97kSh2JseApi8mSww==
X-CSE-MsgGUID: /S2mXfrcQGeMAqyI6i227w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028495"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:07 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v2 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Date: Thu, 27 Nov 2025 07:02:03 +0800
Message-ID: <20251126230201.3782788-15-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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

TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
multi-step TLB invalidations, so reset tdr to ensure that action
won't prematurely trigger when G2H actions are still ongoing.

v2: Remove lock from xe_tlb_inval_reset_timeout. (Matthew B)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  3 +--
 drivers/gpu/drm/xe/xe_tlb_inval.c     | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index f10ecfb49735..848d3493df10 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -234,8 +234,7 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(len != 1))
 		return -EPROTO;
 
-	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
-		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
+	xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..a122fbb9fc4a 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -199,6 +199,20 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	mutex_unlock(&tlb_inval->seqno_lock);
 }
 
+/**
+ * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
+ * @tlb_inval: TLB invalidation client
+ *
+ * Reset the TLB invalidation timeout timer.
+ */
+static void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval)
+{
+	lockdep_assert_held(&tlb_inval->pending_lock);
+
+	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
+			 tlb_inval->ops->timeout_delay(tlb_inval));
+}
+
 static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int seqno)
 {
 	int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
@@ -360,6 +374,12 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
+	if (seqno == TLB_INVALIDATION_SEQNO_INVALID) {
+		xe_tlb_inval_reset_timeout(tlb_inval);
+		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
+		return;
+	}
+
 	if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
 		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
 		return;
-- 
2.52.0

