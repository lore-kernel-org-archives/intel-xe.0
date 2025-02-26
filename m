Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13259C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 17:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8749010E985;
	Wed, 26 Feb 2025 17:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBD3NfTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACD510E985
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740592114; x=1772128114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=utwP7sgrc/mPnToD/YRZ2ym51BUM5uJh8Ub8FCA++1Y=;
 b=TBD3NfTe8yPnhllrnCkPpgUS5yYG5fI8IM5TFIJuB7N2r6mPQdxb7Pxq
 fNEPHizKOB2Q6HsP+T7uUd79vyzxBTMfQmBu3hAGdLVc9e0v2JdxrzuJd
 GM3uCf4cekVK+kJu8nvvZN1g/JXgFx6ze1yKlDZc7jo33H/I47zcz0rQY
 Lnz3g+avkg9qmFN7V1SJJXu9NWeJP+NKT5jdBgAlsItyZI/JSkW/P5ncW
 teYXsLgM6ERqjSXqBdJNUiZ999QsDlxWyym7k2Rg/dZMgxuvLfYQI//7B
 QrSoGxXkIx7vKnoFXxpZVxte8PwIOT5y1mjdP10wjZ4Rrfnl5Pbxh7XCz g==;
X-CSE-ConnectionGUID: FZlw54U2Q2KEVpaD0lwIEw==
X-CSE-MsgGUID: RY4tgiETRpygOakb/QLY5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52852784"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="52852784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:48:33 -0800
X-CSE-ConnectionGUID: tgX7Db6KRBSxEFxu8U08zg==
X-CSE-MsgGUID: zn2jJ2oYTNC2PFNOYu3X4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="121715666"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.27])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:48:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/xe/userptr: properly setup pfn_flags_mask
Date: Wed, 26 Feb 2025 17:47:49 +0000
Message-ID: <20250226174748.294285-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
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

Currently we just leave it uninitialised, which at first looks harmless,
however we also don't zero out the pfn array, and with pfn_flags_mask
the idea is to be able set individual flags for a given range of pfn or
completely ignore them, outside of default_flags. So here we end up with
pfn[i] & pfn_flags_mask, and if both are uninitialised we might get back
an unexpected flags value, like asking for read only with default_flags,
but getting back write on top, leading to potentially bogus behaviour.

To fix this ensure we zero the pfn_flags_mask, such that hmm only
considers the default_flags and not also the initial pfn[i] value.

v2 (Thomas):
 - Prefer proper initializer.

Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
---
 drivers/gpu/drm/xe/xe_hmm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 089834467880..2e4ae61567d8 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -166,13 +166,20 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 {
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
+	unsigned long *pfns;
 	struct xe_userptr *userptr;
 	struct xe_vma *vma = &uvma->vma;
 	u64 userptr_start = xe_vma_userptr(vma);
 	u64 userptr_end = userptr_start + xe_vma_size(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct hmm_range hmm_range;
+	struct hmm_range hmm_range = {
+		.pfn_flags_mask = 0, /* ignore pfns */
+		.default_flags = HMM_PFN_REQ_FAULT,
+		.start = userptr_start,
+		.end = userptr_end,
+		.notifier = &uvma->userptr.notifier,
+		.dev_private_owner = vm->xe,
+	};
 	bool write = !xe_vma_read_only(vma);
 	unsigned long notifier_seq;
 	u64 npages;
@@ -199,19 +206,14 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 		return -ENOMEM;
 
 	if (write)
-		flags |= HMM_PFN_REQ_WRITE;
+		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
 
 	if (!mmget_not_zero(userptr->notifier.mm)) {
 		ret = -EFAULT;
 		goto free_pfns;
 	}
 
-	hmm_range.default_flags = flags;
 	hmm_range.hmm_pfns = pfns;
-	hmm_range.notifier = &userptr->notifier;
-	hmm_range.start = userptr_start;
-	hmm_range.end = userptr_end;
-	hmm_range.dev_private_owner = vm->xe;
 
 	while (true) {
 		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-- 
2.48.1

