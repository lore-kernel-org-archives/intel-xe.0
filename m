Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6416C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442AC10E331;
	Tue,  9 May 2023 06:57:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B1D10E32E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683615445; x=1715151445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oX2CCenoJD6ebXLQYvvdfvwtTFZIz3Fm1Oekg29ATlg=;
 b=OYAzKMECSTunnalKLNoHWNATPkHEc6LMBU+qLAY7XatfB3k0j+pQnVSr
 N7xQgSjImcHuFEMVnyRo5KUTuJyird9lUFf14EKOK1sOlDvzGAJthASM0
 0jqMxf1ksnaxWnWcE7wivemACW5ya/bnUItFbrgK1PBqaRxjZ9DAb8YJA
 Sa8LC3ZiyzqnDCBCQ5sEeR4S1nHDiDbOI2UzNr7spIrTOvB6kZPcid4Tb
 o1CTUc7Js4oPaJrL/X0p7Vhr5E+782rNTF7goj3ROn2sksh5XoAVqqmDE
 xf+QVUOz3HD4mX10E2KE/2Dv7uMq1cPv+nLuFjTeO4ble7TgCDcfxw5Ef g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334271745"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="334271745"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="873054087"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="873054087"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:57:22 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 23:57:09 -0700
Message-Id: <20230509065709.30393-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230509065709.30393-1-niranjana.vishwanathapura@intel.com>
References: <20230509065709.30393-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Handle -EDEADLK case in exec ioctl
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
Cc: thomas.hellstrom@intel.com, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With multiple active VMs, under memory pressure, it is possible that
ttm_bo_validate() run into -EDEADLK in ttm_mem_evict_wait_busy() and
return -ENOMEM.

Until ttm properly handles locking in such scenarios, best thing the
driver can do is unwind the lock and retry.

Update xe_exec_begin to retry validating BOs with a timeout upon
-ENOMEM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ea869f2452ef..3db1b159586e 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -8,6 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/xe_drm.h>
+#include <linux/delay.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -91,6 +92,8 @@
  *	Unlock all
  */
 
+#define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
+
 static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 			 struct ttm_validate_buffer tv_onstack[],
 			 struct ttm_validate_buffer **tv,
@@ -99,12 +102,14 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	struct xe_vm *vm = e->vm;
 	struct xe_vma *vma;
 	LIST_HEAD(dups);
-	int err;
+	ktime_t end = 0;
+	int err = 0;
 
 	*tv = NULL;
 	if (xe_vm_no_dma_fences(e->vm))
 		return 0;
 
+retry:
 	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
 	if (err)
 		return err;
@@ -122,11 +127,27 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 		if (err) {
 			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
 			*tv = NULL;
-			return err;
+			break;
+		}
+	}
+
+	/*
+	 * With multiple active VMs, under memory pressure, it is possible that
+	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
+	 * Until ttm properly handles locking in such scenarios, best thing the
+	 * driver can do is retry with a timeout.
+	 */
+	if (err == -ENOMEM) {
+		ktime_t cur = ktime_get();
+
+		end = end ? : ktime_add_ms(cur, XE_EXEC_BIND_RETRY_TIMEOUT_MS);
+		if (ktime_before(cur, end)) {
+			msleep(20);
+			goto retry;
 		}
 	}
 
-	return 0;
+	return err;
 }
 
 static void xe_exec_end(struct xe_engine *e,
-- 
2.21.0.rc0.32.g243a4c7e27

