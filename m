Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671E3C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D86D10F125;
	Wed,  9 Sep 2026 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMXXo8En";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B03C10F117
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957740; x=1820493740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I+qg/7IS6gQIRrUCCLyVnA37Tt9kXNXWEwUBDbcvoIE=;
 b=AMXXo8EnRcIVBpVQKYCcWbd64phiigqvn6yTclXNNMQsv1UqXCTKbYhQ
 vzv5kZFg35uwB+SG8WwBlRf4wU8IfbhyoM/i+K/6mJQGzvV+sQmoZxEND
 M3CVYR3b6KW3uf5nOPAZ3DHPZH09qaxB77XzUg7RBvNOhFTftcxxBFd9o
 5vLQcNe7G8t1S18fW02BEoiLMJZgmSmGeUGAMuhRG859J72qbUApV1Hvx
 iFvC4sfCV4twVCSaEzWrJnSAtAiTfTyqzBES9X+s1etYHQvAD3dniVJlu
 66tgUdRcmyDKdBWc1aZn6h9zPi9KXXtAumU2nXL3UF0xU9hridBnomgHG w==;
X-CSE-ConnectionGUID: Xz1E5bAHQIagY8yZbirrZw==
X-CSE-MsgGUID: S+QZ9IlfQkikPYelMHI6Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715587"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:20 -0700
X-CSE-ConnectionGUID: uE+Dw9jjSWWNlWr9IQDMGQ==
X-CSE-MsgGUID: my4P/mC9QJmrfwXXlH3UbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246670"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 20/21] drm/xe/svm: Move EVICTED PAGES debug log to callers
Date: Wed,  9 Sep 2026 18:15:14 +0530
Message-ID: <20260909124457.1610890-43-himal.prasad.ghimiray@intel.com>
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

xe_svm_range_get_pages() is shared between the page-fault/access-counter
setup path and the prefetch path, but it logged the -EOPNOTSUPP eviction
using a hardcoded "PAGE FAULT - EVICT PAGES" string. That is misleading
when the caller is the prefetch path.

Drop the log from the shared helper and emit it in each caller with the
context that is meaningful there: "PAGE FAULT - EVICTED PAGES" in
__xe_svm_range_setup() and "PREFETCH - EVICTED PAGES" in the prefetch
worker. No functional change.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 6 +++---
 drivers/gpu/drm/xe/xe_vm.c  | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 9fc02d2fb346..20591054e520 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1428,6 +1428,8 @@ static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
+	if (err == -EOPNOTSUPP)
+		range_debug(range, "PAGE FAULT - EVICTED PAGES");
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
@@ -1724,10 +1726,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 				   &range->base.notifier->notifier,
 				   drm_gpusvm_range_start(&range->base),
 				   drm_gpusvm_range_end(&range->base), ctx);
-	if (err == -EOPNOTSUPP) {
-		range_debug(range, "PAGE FAULT - EVICT PAGES");
+	if (err == -EOPNOTSUPP)
 		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
-	}
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c78df5f57a8b..15f20cfaa444 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3268,6 +3268,8 @@ static void prefetch_thread_func(struct prefetch_thread *thread)
 	if (err) {
 		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
 			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+		if (err == -EOPNOTSUPP)
+			xe_svm_range_debug(svm_range, "PREFETCH - EVICTED PAGES");
 		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
 			err = -ENODATA;
 		thread->err = err;
-- 
2.43.0

