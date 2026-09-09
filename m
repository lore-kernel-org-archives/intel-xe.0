Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67952C79FB9
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1510F117;
	Wed,  9 Sep 2026 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2ErEJDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C03310F117
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957742; x=1820493742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Btk5Z0Nqg71uQzHfv8wgx6HA/eIOJaVxR1lnHofvZhc=;
 b=E2ErEJDjEGhsXoa49BXPgSK1IRs93dEyRiDpKHJI3mmgcUuiWTKmmReg
 C6lKtpzE3zcTQXK1vhWBTLzLpu/evV4QPIe1vZRuaml2MzW5zE5quX52o
 PwqY9++sKArX1Q0J9MFGmE//wCc3QWIyURdjkygxvSCzAOTurII+5BPn9
 aC1ePczhgzZXEyStny/55zK2Cwa9Lpw3XBt8M+O0dtuNLbEZRiV0N+4dI
 N9Y4JM38CZnUEdwmQOriNFSI7DqiMj14r+LGRSGPNjBjUG0/fTquEtinB
 to/GawLeShF/gjpjj320/oI1wWlfac8mokp9AyNfHsxPFZtAM/jgfXG46 Q==;
X-CSE-ConnectionGUID: xJ0x7pNxT0GfoO59rOhakw==
X-CSE-MsgGUID: gLQ00aB0SLyIkvrLVe+w6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715592"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:22 -0700
X-CSE-ConnectionGUID: Y+WiAVntT7qPlYXuFil+uQ==
X-CSE-MsgGUID: jEI799JrRHW+GcE9NF2FWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246674"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:20 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 21/21] drm/xe/svm: Distinguish access-counter-triggered range
 setup in logs
Date: Wed,  9 Sep 2026 18:15:15 +0530
Message-ID: <20260909124457.1610890-44-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

__xe_svm_range_setup() serves both the page-fault path and the access
counter trigger path (acc_ctr_trigger). Its range_debug() traces were
hardcoded to "PAGE FAULT - ...", making it impossible to tell from the
logs whether a given setup/migration was driven by a GPU page fault or
by an access counter event.

Select the trace prefix based on acc_ctr_trigger so each step reports
"ACCESS COUNTER TRIGGERED - ..." when invoked from the access counter
path and "PAGE FAULT - ..." otherwise. No functional change.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 20591054e520..72b2a14a2883 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1368,11 +1368,14 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
 		xe_svm_range_valid_fault_count_stats_incr(gt, range);
-		range_debug(range, "PAGE FAULT - VALID");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - VALID" :
+			    "PAGE FAULT - VALID");
 		goto out;
 	}
 
-	range_debug(range, "PAGE FAULT");
+	range_debug(range, acc_ctr_trigger ?
+		    "ACCESS COUNTER TRIGGERED" : "PAGE FAULT");
 
 	/*
 	 * AC-triggered setup: if the range is already in device memory a
@@ -1429,7 +1432,9 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
 	if (err == -EOPNOTSUPP)
-		range_debug(range, "PAGE FAULT - EVICTED PAGES");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - EVICTED PAGES" :
+			    "PAGE FAULT - EVICTED PAGES");
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
@@ -1437,7 +1442,9 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 			drm_dbg(&vm->xe->drm,
 				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
 				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-			range_debug(range, "PAGE FAULT - RETRY PAGES");
+			range_debug(range, acc_ctr_trigger ?
+				    "ACCESS COUNTER TRIGGERED - RETRY PAGES" :
+				    "PAGE FAULT - RETRY PAGES");
 			goto retry;
 		} else {
 			drm_err(&vm->xe->drm,
@@ -1446,7 +1453,9 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 	if (err) {
-		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - FAIL PAGE COLLECT" :
+			    "PAGE FAULT - FAIL PAGE COLLECT");
 		goto err_out;
 	} else if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
 		drm_dbg(&vm->xe->drm, "After page collect data location is %sin \"%s\".\n",
@@ -1456,7 +1465,8 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
 
-	range_debug(range, "PAGE FAULT - BIND");
+	range_debug(range, acc_ctr_trigger ?
+		    "ACCESS COUNTER TRIGGERED - BIND" : "PAGE FAULT - BIND");
 
 	bind_start = xe_gt_stats_ktime_get();
 	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct xe_val_flags) {}, err) {
@@ -1495,7 +1505,9 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 err_out:
 	if (err == -EAGAIN) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
-		range_debug(range, "PAGE FAULT - RETRY BIND");
+		range_debug(range, acc_ctr_trigger ?
+			    "ACCESS COUNTER TRIGGERED - RETRY BIND" :
+			    "PAGE FAULT - RETRY BIND");
 		goto retry;
 	}
 
-- 
2.43.0

