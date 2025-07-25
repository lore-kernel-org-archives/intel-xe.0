Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CDCC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 06:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691D10E078;
	Fri, 25 Jul 2025 06:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAEwcIq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB6910E078
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753426470; x=1784962470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xhA2ACqAOvhou7e4yGzVyXUY85jkCWTmnkhw55O9h+4=;
 b=SAEwcIq2y15V7IO9jY2N+X6soudsqvXUbEf5Wdfl7E1CVM7a6p3ImUC6
 hbiOrUidA2cbplbzMuOou43KiFrABueK+Q2jT3pUKCOie6ZvszKW1CEQs
 AjkOwUR/0v4xos1L0s+9Htwo0lvX8N1Y97NuTni1dNWManIeFUor7s3I+
 s5ybuGHJmLg0/LIvqd/rsLCu0B7ow0fnUQvfzZPMhcNMNf+N7KhcSJ1iO
 tkUWyCsTgS3ru29b/GccnGg3WCXYmNvoszPbNk/9r4JmviNLLVz08Yr5q
 rGs3+C9BJEJjRPiKd01mq5KT5XExuA1co+YSmASwiq46Ub0e8GKdZkP07 A==;
X-CSE-ConnectionGUID: 3tU1ShZsQx2h/zS3/vqEvw==
X-CSE-MsgGUID: kcaOtHFCRIm3buTMFmOrXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66324569"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="66324569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 23:54:29 -0700
X-CSE-ConnectionGUID: hNKoY4UMSn+z3tbt1HJppA==
X-CSE-MsgGUID: HwrsLVLWTSKhxNpBG7lR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160480335"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 23:54:28 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/devcoredump: Defer devcoredump initialization during
 probe
Date: Fri, 25 Jul 2025 12:25:43 +0530
Message-Id: <20250725065543.3827989-1-balasubramani.vivekanandan@intel.com>
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
(xe_driver_devcoredump_fini) leading to the following kernel crash
because the devcoredump functions might still use GT/Engine
datastructures after those are freed.

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

Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver release")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.34.1

