Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D265C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 06:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE6410E03E;
	Thu,  3 Sep 2026 06:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfPE34YV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3089810E03E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 06:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788416842; x=1819952842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FF2EKjTyQwsy3FKiFycmJAhPwRCojsXm1UD/WUJyC2M=;
 b=OfPE34YVc0DLh3AMk3UlJ3DVUn3nQft/2X3zznreA1aoELLqU8jhRl8E
 /j7EWCraVayUCn9+pyjxvqgUPZaoku5c+xtM6/tBlPjaBQhO6sbth4LfJ
 bn5MQ4DPt903KPY9BdD/PqErlo9TsRAADTveMaIUT2T2cciW/AMw40QEW
 XnDAQpSpITT6EoTE+i+g4VPFhQsOYKUTAVVWcyz4daNJiScYRyTVj7zYx
 fYPGyqJsT+Uv5mR0WHmu84SpyBs7G9IvpSG4CDJ952jXQKV0Rc6V/vFIt
 QaQ+N+MPIf43Hs+Uuov1rZdyvGBs/G3XIlbnoJHHsXPYQWfkma8e8/y6K A==;
X-CSE-ConnectionGUID: JHp0cNVhSfSYyFDiXHB19g==
X-CSE-MsgGUID: 4zXxrohCSQKtoIbjLfU9Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="114427994"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="114427994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:27:21 -0700
X-CSE-ConnectionGUID: 2z4qU6YFR1i/tysB/4sZVg==
X-CSE-MsgGUID: Teo/lAKwQE6K+QWhpf7PDw==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 23:27:19 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.brost@intel.com,
 szymon.markiewicz@intel.com
Subject: [PATCH] drm/xe/guc: Guard page-fault ack with runtime PM check
Date: Thu,  3 Sep 2026 11:57:10 +0530
Message-ID: <20260903062709.3831387-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

During VM teardown, the VM's runtime PM reference is dropped
asynchronously, allowing the device to autosuspend while stale page
faults belonging to the now-dead VM are still queued. When the
page-fault worker later tries to ack one of these, it calls into
guc_ct_send_locked() on an already-suspended device, tripping:

  Assertion `!xe_pm_runtime_suspended(xe)` failed!
  WARNING at xe_device.c:1267 xe_device_assert_mem_access+0x11c/0x140 [xe]

A live VM/exec queue always holds a PM reference while it has
outstanding work, so if the device is suspended at ack time, the
owning context is already gone and the fault is stale.

Guard both ack sites (guc_ack_fault() and the batched flush in
guc_ack_fault_end()) with xe_pm_runtime_get_if_active() instead of
forcing a resume. get_if_active() is non-blocking, so it's safe to
call under guc->ct.lock, unlike a blocking get() which would risk
lock-ordering issues against the suspend path and needlessly wake
the device to deliver an ack nobody is waiting for.

Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 8f8210a732e9..a18de20c8245 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -9,6 +9,7 @@
 #include "xe_guc_pagefault.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_pm.h"
 
 #define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
 
@@ -52,19 +53,32 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_PDATA, pdata),
 	};
 	struct xe_guc *guc = pf->producer.private;
-	bool write_only = guc->pagefault_ack_counter++ &
+	struct xe_device *xe = guc_to_xe(guc);
+	bool write_only;
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return;
+
+	write_only = guc->pagefault_ack_counter++ &
 		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
 
 	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
 			      write_only);
+
+	xe_pm_runtime_put(xe);
 }
 
 static void guc_ack_fault_end(void *private)
 {
 	struct xe_guc *guc = private;
+	struct xe_device *xe = guc_to_xe(guc);
 
-	if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1)
+	if ((guc->pagefault_ack_counter &
+	     (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1)) != 1 &&
+	    xe_pm_runtime_get_if_active(xe)) {
 		xe_guc_ct_send_flush(&guc->ct);
+		xe_pm_runtime_put(xe);
+	}
 	xe_guc_ct_unlock(&guc->ct);
 }
 
-- 
2.43.0

