Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5464CC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 06:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B56010E703;
	Thu, 31 Jul 2025 06:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSUYY2Rv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBEF10E703
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 06:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753942306; x=1785478306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HClvIQf8XJVhWdlw362Vc6UmPOLpfrO1PHWshk4K8Pc=;
 b=NSUYY2Rv21yfQpQK9uKQ+3BZQOXWdk0IJ1S3Cfn4pN2BxunxfK3t7s+B
 sYKTwY1JmjXKMi1L/Rh4BX0vnal6yD+WJ5/z/NrnfBvbLuwrg7tq5rQU/
 5xhWzdpEb9t/xbMxjL2AHNFz5iCvQXw6wBGxqHZzwfweQF6TB6arVZvXe
 e/mMOrqK/R9yfduFGt0NzTxQb5qnV9vG2hTxpzAb1BsIS2hyzyY8yy0QB
 sl8R1jztHIFN4DrVxw+I+EIqi2g560lpz6f9OXCF6WLRfq1rvzzJu4NJR
 pjxmr2tjIWrHtBA6b6XEj07jSA1z+eTw5q8V0Bd18C43IJIVDsiFRNPcF g==;
X-CSE-ConnectionGUID: G6cVN9VQT/imShkZmjjo6w==
X-CSE-MsgGUID: kEP/1tCTTRKknWymC0TtuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66526307"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="66526307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 23:11:44 -0700
X-CSE-ConnectionGUID: eD0MezZeSySf5J60q5qrrw==
X-CSE-MsgGUID: s+0YH33/QQOHIiI/N8Sxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="163630670"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 23:11:41 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Date: Thu, 31 Jul 2025 11:43:00 +0530
Message-Id: <20250731061300.14320-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Doing devcoredump initializing before GT though look harmless, it leads
to problem during driver unbind. Because of this order, GT/Engine
release functions will be called before xe devcoredump release function
(xe_driver_devcoredump_fini) leading to the following kernel crash[1]
because the devcoredump functions might still use GT/Engine
datastructures after those are freed.

The following crash is observed while running the IGT
xe_wedged@wedged-at-any-timeout. The test forces a wedged state by
submitting a worload which hangs. Then does a unbind/rebind of the
driver to recover from the wedged state.
The hanged worload leads to a devcoredump. The following crash is
noticed when the devcoredump capture races with the driver unbind.
During driver unbind, the release function hw_engine_fini() will be
called which assigns NULL to hwe->gt. But the same data structure is
accessed during the coredump capture in the function
xe_engine_snapshot_print by reading snapshot->hwe->gt.

With this patch, we make sure the devcoredump is stopped before
deinitializing the core driver functions.

[1]:
BUG: kernel NULL pointer dereference, address: 0000000000000000
Workqueue: events_unbound xe_devcoredump_deferred_snap_work [xe]
RIP: 0010:xe_engine_snapshot_print+0x47/0x420 [xe]
Call Trace:
 <TASK>
 ? drm_printf+0x64/0x90
 __xe_devcoredump_read+0x23f/0x2d0 [xe]
 ? __pfx___drm_printfn_coredump+0x10/0x10
 ? __pfx___drm_puts_coredump+0x10/0x10
 xe_devcoredump_deferred_snap_work+0x17a/0x190 [xe]
 process_one_work+0x22e/0x6f0
 worker_thread+0x1e8/0x3d0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x11f/0x250
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x47/0x70
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30

v2: Detailed commit description (Rodrigo)
v3: FIXME added (Rodrigo, Stuart)

Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver release")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c      | 8 ++++----
 drivers/gpu/drm/xe/xe_guc_capture.c | 6 ++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d04a0ae018e6..ae48cd3c7bf0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -821,10 +821,6 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	err = xe_devcoredump_init(xe);
-	if (err)
-		return err;
-
 	/*
 	 * From here on, if a step fails, make sure a Driver-FLR is triggereed
 	 */
@@ -889,6 +885,10 @@ int xe_device_probe(struct xe_device *xe)
 	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
 		XE_DEVICE_WA_DISABLE(xe, 15015404425);
 
+	err = xe_devcoredump_init(xe);
+	if (err)
+		return err;
+
 	xe_nvm_init(xe);
 
 	err = xe_heci_gsc_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 859a3ba91be5..243dad3e2418 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1817,6 +1817,12 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 		   str_yes_no(snapshot->kernel_reserved));
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
+		/*
+		 * FIXME: During devcoredump print we should avoid accessing the
+		 * driver pointers for gt or engine. Printing should be done only
+		 * using the snapshot captured. Here we are accessing the gt
+		 * pointer. It should be fixed.
+		 */
 		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
 							capture_class, false);
 		snapshot_print_by_list_order(snapshot, p, type, list);
-- 
2.34.1

