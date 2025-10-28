Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E83CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086C210E5C1;
	Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxbodFaC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3710E3E8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654312; x=1793190312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPNIMLQz6a5A+xI9nHLgVLfE8BJWrAiCG0Bz0dC1dKc=;
 b=dxbodFaCO6i5X0ay66IcEDNltde30ftAAUw/IDboghs0EBDn54QjIIjH
 Bu2mL9x2azOzLO5EEem3TtJMsMEDljE58ZF7BAc4mLZaw/qvg41dSdYe2
 B9lRuljbR4G43GiM8jWToOfj39O8RVSURVaBS6c6/zEhp9unwRyIVmmny
 YVH2AmXwW2rSEGMjRZcU7qyusCbI2eh+QMLGM3ZVakndejYvE3BDGNvW5
 F9xzQxnRxgE2Nc1GIokuiQQbsFikOsDhMm+VcwCk/N28ospzu1hUSgKnu
 BctV0vfky5bwD2MyXv/vHPvFx6vWq76CIgcxiHTUb7auYpXHNs0CJ8Qmp A==;
X-CSE-ConnectionGUID: EAI66dJFRzu3ccjYLWaIKA==
X-CSE-MsgGUID: nvmtfwIYTrmyryx5Ns7kPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956637"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956637"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:11 -0700
X-CSE-ConnectionGUID: 9NV+82KUQMKmUqkh8Co9WA==
X-CSE-MsgGUID: XceYoMjTSbmQJNDlWJnRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524454"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:09 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 5/9] drm/xe/bo: Handle CPU faults on purged buffer objects
Date: Tue, 28 Oct 2025 17:54:11 +0530
Message-ID: <20251028122415.1136721-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

Modify the CPU page fault handler, `xe_bo_cpu_fault()`, to correctly
handle access to buffer objects that have been purged.

When a buffer object is in the `XE_MADV_PURGED` state, its backing
store has been reclaimed by the kernel. If the CPU attempts to access
this memory, it is an error that should be reported to the application.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 00d111d00e4a..4b2ecf4152b0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2009,6 +2009,12 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	} else {
 		ret = VM_FAULT_NOPAGE;
 	}
+	/*
+	 * BO content is gone. Signal the user process.
+	 * Userspace must call madvise(WILLNEED) to re-validate before next access.
+	 */
+	if (atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_PURGED)
+		return VM_FAULT_SIGBUS;
 
 	/*
 	 * The fastpath failed and we were not required to return and retry immediately.
-- 
2.43.0

