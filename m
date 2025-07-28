Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8AFC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 08:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B9610E4BA;
	Mon, 28 Jul 2025 08:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjQZM960";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728910E4B3
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753692395; x=1785228395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4sBvx7IrVj5ox+iLANc19Y0TZss09Mljf61M1nVOGH4=;
 b=BjQZM960rPJK7lYEa2WKR104pPLIXGOS6obJl70sf5AszPOPEAQNGZNx
 DRSh5B4+U5WNqgK8RCO7Tg1G/a0ucE5RhHg3zh0CVM8rFkvA4PALgVZld
 0JMGF5x9MQ+lB3IVVBc4ZtscO6E1fWIoBNbseXxIOFZSoEMBB1x2W1ohK
 hzicwJLcR1VMdvjBWWJK/KXVVVAW1+Z/Q156areuOkdcCwjoFhn+9DHmw
 8Ev/k3NcoF4MJnekDUNOJRZwbKvpwT48nNEKyeV8svYMTnNfjSDmpwnL8
 j5h15k2V1hV3QvkORZv5i4o9QSln77y1C0OYxlwV1/VvmpK62jAvD5Nb1 A==;
X-CSE-ConnectionGUID: pLCHDLbrTHe0uwcQMIE7/g==
X-CSE-MsgGUID: kqYy5M8mRIiGgnNuzGZeAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55633229"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55633229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:46:35 -0700
X-CSE-ConnectionGUID: JcFZYC0fQNyLYgY0d8fzIQ==
X-CSE-MsgGUID: VAceQf1cRbCUpsWH2s3cZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166535728"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:46:33 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Date: Mon, 28 Jul 2025 14:17:51 +0530
Message-Id: <20250728084751.4057124-1-balasubramani.vivekanandan@intel.com>
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

