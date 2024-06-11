Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E98BC27C77
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 14:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8978310E674;
	Tue, 11 Jun 2024 14:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmFGeIEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC59F10E671
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718116831; x=1749652831;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u4UcEdLxtF5Xy4U0DH2Dj3NT4aAc5SnAkQah6zzdyCU=;
 b=BmFGeIEv6IRHK/vsKgcgmO9/DZw4NqotPXjEAjPJHp4VPAwENI5CVKXB
 DZDtNr6Pq+h1k9bAVXdAjmDLvkxsOLlVD1HuFCxHWZ5x37mG80Dr4Vewp
 ETeXuvHpQkskFlmZaJn06rG99/aQ6d7waCr6XYpyJWWQ48+ggFmikjUCd
 9IvUbMiI0YKnTr1iz5WpGE9v6A4JQQWI3kT54Bw9crlxvKF8xS9wQ9lUk
 JkqHlDKw9KbtWv0lmR53mLMxhY/hJ2fQ/kzlJ2g5/GGgfckMCAoNP6oPY
 G4A4gU7dFLqeswYeJVuJ7hrJmEQAPh+CX+JDb18SjTcg9mH9iddLVeJqS Q==;
X-CSE-ConnectionGUID: hbUYhwhXSXq27GjWe4zGEg==
X-CSE-MsgGUID: cOGncQi+SzOE3Dm743ZxaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14784565"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14784565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
X-CSE-ConnectionGUID: o4CMteNFQ6Cqv0UaOSyw4A==
X-CSE-MsgGUID: 4DuqK8gZQc6EiTOokjVa9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44590318"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:40:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 06/11] drm/xe: Improve unexpected state error messages
Date: Tue, 11 Jun 2024 07:40:48 -0700
Message-Id: <20240611144053.2805091-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
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

Include G2H handler name when an unexpected error state messages.

v6:
- Use xe_gt_err (Michal)
- Print runnable state (John H)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4464ba337d12..afd22a8d815d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1620,6 +1620,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
+	u32 runnable_state = msg[1];
 
 	if (unlikely(len < 2)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
@@ -1632,8 +1633,10 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(!exec_queue_pending_enable(q) &&
 		     !exec_queue_pending_disable(q))) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		xe_gt_err(guc_to_gt(guc),
+			  "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d, runnable_state=%u",
+			  atomic_read(&q->guc->state), q->guc->id,
+			  runnable_state);
 		return -EPROTO;
 	}
 
@@ -1671,8 +1674,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		xe_gt_err(guc_to_gt(guc),
+			  "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
+			  atomic_read(&q->guc->state), q->guc->id);
 		return -EPROTO;
 	}
 
-- 
2.34.1

