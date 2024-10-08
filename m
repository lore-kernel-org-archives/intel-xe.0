Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC8CED272
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2B210E474;
	Tue,  8 Oct 2024 06:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og7XpaDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87810E474
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370388; x=1759906388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4gNh3xVcwZb4lINTZqUvdTcypH4fEmzJsaxdTiGco0=;
 b=Og7XpaDkyidzHp0/Jrhp0YIIwRKWAoT7Wsnk4LFuqKK7ZMIWV0ZUYXVG
 4POeUCrpO5BDAwUfT4sRYfSqovQirurnVMbRRE8+mMaQaxOdxjaliNiqF
 PbnOp4QpdQcHvsuVW5x9Sl8S6bd9RPSjPPitOGKljJHaV8MUNMB0n6Yz6
 KfYpsEMCpXG49zKu/sqyCaziozI7C+NPNFAGLwkS9P6ULp9f3bnWaIkz3
 nxoHvraA+1ZyR1iDMG7wwDdpdCEhkDLQZAdXjjoGhrDp7di3YLOaUl5im
 qjlSKW1eT1L8zBhz5DvbGhf5RpI9RWb8haTOa3muUYgLWx0nU71xA3E12 Q==;
X-CSE-ConnectionGUID: dfdn6d4nQg6b5TetftGJZA==
X-CSE-MsgGUID: zm4776ELRnmjvupipe81UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430433"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:08 -0700
X-CSE-ConnectionGUID: 3Tus/sCKSVq3kimjqu1vug==
X-CSE-MsgGUID: rqFaGc1KQlmogHbMIixuKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577710"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 11/26] drm/xe/devcoredump: Update handling of
 xe_force_wake_get return
Date: Tue,  8 Oct 2024 12:41:00 +0530
Message-Id: <20241008071115.1862704-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Use helper xe_force_wake_ref_has_domain to
verify all domains are initialized or not. Update the return handling of
xe_force_wake_get() to reflect this behavior, and ensure that the return
value is passed as input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

v5
- return unsigned int for xe_force_wake_get()

v6
- use helper xe_force_wake_ref_has_domain()

v7
- Fix commit message

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a2d816713489..dfe71549f308 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -154,13 +154,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 {
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	unsigned int fw_ref;
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
+	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
 	/* Calculate devcoredump size */
 	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
@@ -233,8 +235,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
 
-	int i;
+	unsigned int fw_ref;
 	bool cookie;
+	int i;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -257,8 +260,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
@@ -277,7 +279,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.34.1

