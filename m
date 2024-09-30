Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2144CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A7310E2CA;
	Mon, 30 Sep 2024 05:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjzaSZDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3910E2CD
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673226; x=1759209226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7osFRSPd2QObgUAJ8hvDSG8ceATuJPCjuZeggZcusGI=;
 b=ZjzaSZDErXibaWZfJ4NT51Yx/o9r0N9uyQ6qfKIXBiB+VzGi6VDSiY4T
 HfGSGSrUkE7i4VnT44+cuuxhXRJeM450tceXKReXJdberg1rT3+GSJ6Zt
 hUE40Ik8VpPhRFjx/UVJTC4CC4lf7CBWSXMI/FqJCBWqQj9Bm66OiYGmy
 h6lP3NsvfOMNBAGg4AB/MyU2ms6rAgjcsA9mVvTdpcVT1YWJFMMByy+W3
 E5/OWLvY/MC6GQ9Ok7g9J9eU3RndJFtNMWs72EEjfNv48mv/JUlbEM/xf
 cmCsZcXI8NRIrRUSOpY28U6MLdPXkRkmBtCiycxHnwUXQ5/LpQINr5hD9 Q==;
X-CSE-ConnectionGUID: QiadP9icQoKcKrnsc46oaA==
X-CSE-MsgGUID: cOnmIuU+QaSxFIBmV2HqVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367966"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367966"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:46 -0700
X-CSE-ConnectionGUID: FyP8xPplQLKnZaa5t/WcAQ==
X-CSE-MsgGUID: WRKZUdlLTjWckT8p473Nkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752173"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 10/25] drm/xe/devcoredump: Update handling of
 xe_force_wake_get return
Date: Mon, 30 Sep 2024 11:01:34 +0530
Message-Id: <20240930053149.1246339-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Use xe_force_wake_ref_has_domain() to
determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

v5
- return unsigned int for xe_force_wake_get()

v6
- use helper xe_force_wake_ref_has_domain()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bdb76e834e4c..48941176e2ef 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -141,13 +141,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
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
@@ -220,8 +222,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
 
-	int i;
+	unsigned int fw_ref;
 	bool cookie;
+	int i;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -244,8 +247,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
@@ -263,7 +265,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.34.1

