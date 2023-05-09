Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BCC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40510E22B;
	Tue,  9 May 2023 05:24:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729E210E31F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683609865; x=1715145865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEwueu9ZqEw1AJVb76P6HeFHzWeCmMElmJdLGQzlvCQ=;
 b=Sr0ZsmvvjUdIMMt9D6V9XcZ97g9P4Q3HfK/F6gT+tX3Nku5aKYWBP26e
 y4qs/PmEawCickOFjJsWd4vyNjNYDNaaCj883+ST5UFc7cmVv5mTopXZ9
 BheFck+yFXadmh+ebcQOEoYnnZRrI+tgbSfxhFB/KGyXtcQzuORGShZVH
 fM7S13+0tkiuhtDHnNMwNsDCqsP3cRF3aZ5SdLatxWEL5/bX75dqIfTEE
 CDBTTFmjQ+mKb/Nq1wGuDxoO/DoUqkEFuSoXOkAPS1jXAOCSZc6S8rcIS
 U4vNx4V/Orn72WUBbcFzAJD9YARvcdFuXz2T1ahJ+og88jSki/p2ZCaxR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329433750"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="329433750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729336031"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="729336031"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:24:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 22:24:19 -0700
Message-Id: <20230509052419.28430-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Handle -EDEADLK case in exec ioctl
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

